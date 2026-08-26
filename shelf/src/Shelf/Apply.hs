-- | The apply pipeline: turn triaged @manifest/scan.yaml@ rows into repo
-- content. A row becomes a PDF under @pdfs/@, an extracted @text/<ck>.md@, a
-- scaffolded card under each of its topics, and a @manifest/sources.yaml@ row;
-- the scan row is then dropped.
--
-- Two invariants shape the design. First, 'preflight' is all-or-nothing: any
-- error means no file is touched, so a bad triage can never leave the repo
-- half-applied. Second, every per-row step is idempotent — a PDF whose bytes
-- already match is not recopied, an up-to-date extraction is not rewritten,
-- and an existing card is never clobbered — so re-applying an unchanged row
-- leaves every mtime alone. Progress is committed row by row (manifest and
-- scan are saved after each success), so a mid-run failure keeps what worked.
module Shelf.Apply
  ( module Shelf.Apply.Paths
  , runIndex
  , scaffoldCard, cardText
  , preflight, applyRow, extractStep
  , ApplyReport (..), applyWith
  , runApply, runScan, runExtract, runManifestCheck, resolveRepo
  ) where

import Control.Monad (filterM, forM, unless, when)
import qualified Data.ByteString as BS
import Data.List (sort, sortOn)
import qualified Data.Map.Strict as M
import Data.Maybe (fromMaybe)
import Data.Text (Text)
import qualified Data.Text as T
import qualified Data.Text.Encoding as TE
import System.Directory (createDirectoryIfMissing, doesDirectoryExist, doesFileExist, getCurrentDirectory, getHomeDirectory)
import System.Exit (ExitCode (..), exitWith)
import System.FilePath (takeDirectory, (<.>), (</>))
import System.IO (hPrint, hPutStrLn, stderr)

import Shelf.Apply.Cards (cardText, scaffoldCard)
import Shelf.Apply.Index (runIndex)
import Shelf.Apply.Paths
import Shelf.Atomic (writeAtomic)
import Shelf.Extract
import Shelf.Manifest
import Shelf.Scan
import Shelf.Types

-- * Preflight

-- | Every reason the whole batch must be refused, in a stable order. Callers
-- must write nothing when this is non-empty.
--
-- The manifest checks are deliberately asymmetric: a citekey may not migrate
-- to different bytes, and a sha may not be renamed to a different citekey.
-- Together they pin the citekey/sha pairing of anything already recorded.
--
-- Two of the checks defend downstream invariants rather than the rows
-- themselves. 'Shelf.Manifest.upsert' is keyed on sha256, so two included rows
-- sharing a sha under different citekeys would see the second row's upsert
-- silently replace the first's manifest entry, orphaning the first citekey's
-- pdf, text and card; @dupShas@ refuses that batch outright. And a row with no
-- topics would apply cleanly but then fail @shelf manifest check@ with
-- 'Shelf.Manifest.EmptyTopics', so @noTopics@ catches it before the write
-- rather than after.
preflight :: [Topic] -> Manifest -> [ScanRow] -> [Text]
preflight known mf rows =
  badKeys <> dupKeys <> dupShas <> badTopics <> noTopics <> keyMoved <> shaRenamed
  where
    badKeys = [ "row " <> sha256Text (srSha256 r) <> ": " <> e
              | r <- rows, Left e <- [mkCitekey (srCitekey r)] ]
    counts = M.fromListWith (+) [(srCitekey r, 1 :: Int) | r <- rows]
    dupKeys = [ "citekey " <> k <> " claimed by " <> T.pack (show n) <> " included rows"
              | (k, n) <- M.toList counts, n > 1 ]
    shaKeys = M.fromListWith (<>) [(srSha256 r, [srCitekey r]) | r <- rows]
    dupShas = [ "duplicate sha256 among included rows: " <> sha256Text sha
                  <> " (" <> T.intercalate ", " (sort ks) <> ")"
              | (sha, ks) <- M.toList shaKeys, length ks > 1 ]
    badTopics = [ "row " <> srCitekey r <> ": unknown topic " <> t
                | r <- rows, t <- srTopics r, Topic t `notElem` known ]
    noTopics = [ "row " <> srCitekey r <> " has no topics" | r <- rows, null (srTopics r) ]
    byKey = M.fromList [(citekeyText (srcCitekey s), srcSha256 s) | s <- mfSources mf]
    bySha = M.fromList [(srcSha256 s, citekeyText (srcCitekey s)) | s <- mfSources mf]
    keyMoved = [ "citekey " <> srCitekey r <> " already in the manifest under sha " <> sha256Text old
               | r <- rows, Just old <- [M.lookup (srCitekey r) byKey], old /= srSha256 r ]
    shaRenamed = [ "sha " <> sha256Text (srSha256 r) <> " is already " <> old <> ", refusing rename to " <> srCitekey r
                 | r <- rows, Just old <- [M.lookup (srSha256 r) bySha], old /= srCitekey r ]

-- * Per-row application

-- | Place the PDF, extract its text, scaffold its cards, and describe the
-- resulting manifest row. Every step is a no-op when already satisfied.
applyRow :: RepoPaths -> Text -> FilePath -> ScanRow -> IO (Either Text Source)
applyRow rp ver home r = case mkCitekey (srCitekey r) of
  Left e -> pure (Left e)
  Right ckey -> do
    createDirectoryIfMissing True (rpPdfs rp)
    placed <- placePdf (rpPdfs rp </> T.unpack (citekeyText ckey) <.> "pdf") home r
    case placed of
      Left e -> pure (Left e)
      Right () -> do
        extracted <- extractStep rp ver ckey (srSha256 r)
        case extracted of
          Left e -> pure (Left e)
          Right () -> do
            let src = sourceOf ckey r
            mapM_ (scaffoldCard rp src) (srcTopics src)
            pure (Right src)

sourceOf :: Citekey -> ScanRow -> Source
sourceOf ckey r = Source
  { srcCitekey = ckey, srcSha256 = srSha256 r, srcBytes = srBytes r, srcTitle = srTitle r
  , srcAuthors = srAuthors r, srcYear = srYear r, srcProvenance = srProvenance r
  , srcTopics = map Topic (srTopics r), srcOrigin = srPaths r, srcHippius = Nothing }

-- | Copy the first origin path that still exists. An existing target with the
-- expected bytes is left alone; one with different bytes is a hard refusal,
-- never an overwrite.
placePdf :: FilePath -> FilePath -> ScanRow -> IO (Either Text ())
placePdf target home r = do
  there <- doesFileExist target
  if there
    then do
      cur <- sha256File target
      pure $ if cur == srSha256 r
        then Right ()
        else Left (T.pack target <> " holds sha " <> sha256Text cur
                     <> ", row claims " <> sha256Text (srSha256 r) <> "; refusing to overwrite")
    else do
      found <- filterM doesFileExist [home </> p | p <- srPaths r]
      case found of
        [] -> pure (Left ("no origin path exists for " <> srCitekey r
                            <> " (tried: " <> T.intercalate ", " (map T.pack (srPaths r)) <> ")"))
        (p : _) -> Right <$> (writeAtomic target =<< BS.readFile p)

-- | Re-derive @text/<ck>.md@ from @pdfs/<ck>.pdf@ unless the stamp already
-- matches the sha, the extractor version, and the body actually on disk.
extractStep :: RepoPaths -> Text -> Citekey -> Sha256 -> IO (Either Text ())
extractStep rp ver ckey sha = do
  createDirectoryIfMissing True (rpText rp)
  existing <- readIfExists md
  let body = maybe "" bodyOf existing
  if upToDate sha (existing >>= stampOf) (BS.length (TE.encodeUtf8 body))
    then pure (Right ())
    else do
      raw <- pdfToText pdf
      lay <- pdfToLayout pdf
      case (,) <$> raw <*> lay of
        Left e -> pure (Left e)
        Right (rawText, layout) -> do
          let fresh = applyHeaders (headerLines layout) rawText
              st = Stamp (sha256Text sha) ver extractorVersion (BS.length (TE.encodeUtf8 fresh))
          Right <$> writeAtomic md (TE.encodeUtf8 (renderText st fresh))
  where
    name = T.unpack (citekeyText ckey)
    pdf = rpPdfs rp </> name <.> "pdf"
    md = rpText rp </> name <.> "md"

-- * Whole-repo commands

data ApplyReport = ApplyReport { arApplied :: Int, arRemaining :: Int, arErrors :: [Text] }
  deriving stock (Eq, Show)

-- | 'runApply' with @$HOME@ passed in, so it can be driven against a fixture
-- home in tests. Errors are returned rather than printed.
applyWith :: FilePath -> RepoPaths -> IO ApplyReport
applyWith home rp = do
  escan <- loadScan (rpScan rp)
  emf <- loadManifest (rpManifest rp)
  topics <- existingTopics rp
  case (,) <$> escan <*> emf of
    Left e -> pure (ApplyReport 0 0 [e])
    Right (rows, mf) -> do
      let included = sortOn srCitekey (filter srInclude rows)
          errs = preflight topics mf included
      if not (null errs)
        then pure (ApplyReport 0 (length rows) errs)
        else do
          ver <- if null included then pure "" else pdftotextVersion
          createDirectoryIfMissing True (takeDirectory (rpManifest rp))
          go ver mf rows included 0
  where
    go _ _ rows [] n = runIndex rp >> pure (ApplyReport n (length rows) [])
    go ver mf rows (r : rest) n = applyRow rp ver home r >>= \case
      Left e -> runIndex rp >> pure (ApplyReport n (length rows) [e])
      Right src -> do
        let mf' = upsert src mf
            rows' = [x | x <- rows, srSha256 x /= srSha256 r]
        saveManifest (rpManifest rp) mf'
        saveScan (rpScan rp) rows'
        go ver mf' rows' rest (n + 1)

runApply :: RepoPaths -> IO ()
runApply rp = do
  home <- getHomeDirectory
  rep <- applyWith home rp
  mapM_ (hPutStrLn stderr . T.unpack) (arErrors rep)
  putStrLn ("applied " <> show (arApplied rep) <> " row(s); "
              <> show (arRemaining rep) <> " row(s) left in scan.yaml")
  unless (null (arErrors rep)) (exitWith (ExitFailure 1))

-- | Walk @root@ (default @$HOME@), fold the proposals into the rows already in
-- @scan.yaml@, and write the merge back. Origin paths stay relative to
-- @$HOME@ regardless of @root@, so a narrowed sweep still produces rows
-- 'applyRow' can resolve.
runScan :: Maybe FilePath -> RepoPaths -> IO ()
runScan mroot rp = do
  home <- getHomeDirectory
  existing <- either die pure =<< loadScan (rpScan rp)
  fresh <- scanRows (defaultConfig home) { scRoot = fromMaybe home mroot } home
  let merged = mergeRows existing fresh
      dup = length [() | r <- merged, "duplicate provenance" `T.isPrefixOf` srNote r]
      junk = length [() | r <- merged, not (T.null (srNote r))
                        , not ("duplicate provenance" `T.isPrefixOf` srNote r)]
  createDirectoryIfMissing True (takeDirectory (rpScan rp))
  saveScan (rpScan rp) merged
  putStrLn (show (length merged) <> " rows; " <> show (length (filter srInclude merged))
              <> " included; " <> show junk <> " junk-noted; " <> show dup <> " dup-noted")

-- | Re-run the extraction step for one manifest source, or all of them.
runExtract :: Maybe Text -> RepoPaths -> IO ()
runExtract sel rp = do
  mf <- either die pure =<< loadManifest (rpManifest rp)
  let srcs = case sel of
        Nothing -> mfSources mf
        Just k -> [s | s <- mfSources mf, citekeyText (srcCitekey s) == k]
  when (null srcs) (die ("no matching source in the manifest" <> maybe "" (": " <>) sel))
  ver <- pdftotextVersion
  errs <- fmap (concatMap (either pure (const []))) . forM srcs $ \s ->
    extractStep rp ver (srcCitekey s) (srcSha256 s)
  mapM_ (hPutStrLn stderr . T.unpack) errs
  putStrLn ("extracted " <> show (length srcs - length errs) <> "/" <> show (length srcs) <> " source(s)")
  unless (null errs) (exitWith (ExitFailure 1))

-- | Validate the manifest against the topics on disk. With @require@ the
-- manifest and @topics/@ must both exist; without it a missing manifest reads
-- as an empty one and passes.
runManifestCheck :: Bool -> RepoPaths -> IO ()
runManifestCheck require rp = do
  when require $ do
    there <- doesDirectoryExist (rpTopics rp)
    unless there (die ("topics/ not found: " <> T.pack (rpTopics rp)))
  mf <- either die pure =<< (if require then loadManifestStrict else loadManifest) (rpManifest rp)
  topics <- existingTopics rp
  let vs = check topics mf
  mapM_ (hPrint stderr) vs
  if null vs
    then putStrLn ("manifest ok: " <> show (length (mfSources mf)) <> " source(s), "
                     <> show (length topics) <> " topic(s)")
    else exitWith (ExitFailure 1)

-- | Resolve @--repo@: an explicit directory as given, otherwise the nearest
-- ancestor of the working directory that looks like the shelf.
resolveRepo :: Maybe FilePath -> IO RepoPaths
resolveRepo (Just d) = pure (repoPaths d)
resolveRepo Nothing = do
  cwd <- getCurrentDirectory
  maybe (die ("no manifest/ or topics/ in " <> T.pack cwd <> " or any parent")) (pure . repoPaths)
    =<< findRepo cwd
