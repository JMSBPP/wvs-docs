-- | Filesystem scan: walk the PDF roots, hash and group by content, propose a
-- citekey/topics/year/include decision for each distinct file, and merge those
-- proposals with whatever a human already decided in @manifest/scan.yaml@.
--
-- The scan is idempotent and non-destructive: 'scanRows' run twice over an
-- unchanged tree produces the same rows, 'mergeRows' never overwrites a row a
-- human has touched, and 'saveScan' writes through 'writeAtomic'.
module Shelf.Scan
  ( module Shelf.Scan.Types
  , walkPdfs, scanRows, proposeInclude, sha256File, proposeCitekey, detectArxiv, isJunk, proposeTopics
  , flagProvenanceDuplicates, mergeRows, loadScan, saveScan
  ) where

import Control.Applicative ((<|>))
import Control.Monad (filterM, void)
import Crypto.Hash (Digest, SHA256, hashlazy)
import Data.ByteArray.Encoding (Base (Base16), convertToBase)
import qualified Data.ByteString as BS
import qualified Data.ByteString.Lazy as BL
import Data.Char (isDigit)
import Data.Either (fromRight, lefts)
import Data.List (isPrefixOf, sortOn, unsnoc)
import Data.List.NonEmpty (NonEmpty (..))
import qualified Data.List.NonEmpty as NE
import qualified Data.Map.Strict as M
import Data.Maybe (fromMaybe, isNothing, listToMaybe)
import qualified Data.Set as S
import Data.Text (Text)
import qualified Data.Text as T
import qualified Data.Text.Encoding as TE
import qualified Data.Yaml as Y
import System.Directory (canonicalizePath, doesDirectoryExist, doesFileExist, getFileSize)
import System.FilePath (makeRelative, splitDirectories, takeBaseName, takeDirectory, (</>))
import Shelf.Atomic (writeAtomic)
import Shelf.Extract (PdfInfo (..), firstPage, pdfInfo)
import Shelf.Scan.Slug (citekeyVersion, firstSurname, readInt, slug, stopWords, stripCitekeyVersion)
import Shelf.Scan.Types
import Shelf.Scan.Walk (walkPdfs)
import Shelf.Types

sha256File :: FilePath -> IO Sha256
sha256File p = do
  bytes <- BL.readFile p
  let digest = hashlazy bytes :: Digest SHA256
  either (fail . T.unpack) pure (mkSha256 (TE.decodeUtf8 (convertToBase Base16 digest :: BS.ByteString)))

-- | First @\\d{4}\\.\\d{4,5}@ not embedded in a longer digit run. Any @vN@
-- suffix falls outside the digit runs and is therefore never captured.
detectArxiv :: Text -> Maybe Text
detectArxiv = go True . T.unpack
  where
    go _ [] = Nothing
    go boundary s@(c : cs)
      | boundary, isDigit c, Just hit <- match s = Just hit
      | otherwise = go (not (isDigit c)) cs
    match s
      | (a, '.' : rest) <- span isDigit s
      , length a == 4
      , (b, _) <- span isDigit rest
      , length b == 4 || length b == 5
      = Just (T.pack (a <> "." <> b))
      | otherwise = Nothing

isJunk :: PdfInfo -> FilePath -> Maybe Text
isJunk info path
  | Just p <- piProducer info, Just t <- firstOf ["matplotlib", "gnuplot"] (T.toLower p) = Just ("plot producer: " <> t)
  | Just seg <- firstOf ["/figures/", "/reports/", "/audits/"] lowerPath = Just ("generated-output path: " <> seg)
  | piPages info <= 2 && isNothing (piTitle info) = Just "untitled and at most 2 pages"
  | otherwise = Nothing
  where
    lowerPath = T.toLower (T.pack path)
    firstOf needles hay = listToMaybe [n | n <- needles, n `T.isInfixOf` hay]

-- | Topic from the directory the PDF lives in. Returns at most one topic;
-- an empty result means triage has to fill it in.
proposeTopics :: FilePath -> [Text]
proposeTopics path
  | ("wvs-shelf", "legacy-refs") `elem` pairs = ["volatility-swaps"]
  | Just t <- deepest cfmmTopics = [t]
  | Just t <- deepest learningTopics = [t]
  | "wvs-docs" `elem` segs = ["volatility-swaps"]
  | otherwise = []
  where
    segs = map T.pack (splitDirectories (takeDirectory path))
    pairs = zip segs (drop 1 segs)
    -- cfmm-theory is the repo root, not a topic.
    cfmmTopics = [ T.replace "_" "-" r
                 | s <- segs, s /= "cfmm-theory", Just r <- [T.stripPrefix "cfmm-" s], not (T.null r) ]
    learningTopics = [b | (a, b) <- pairs, a == "learning", not (T.null b)]
    deepest = listToMaybe . reverse

proposeCitekey :: PdfInfo -> Text -> FilePath -> Text
proposeCitekey info page path = either (const fallback) (const candidate) (mkCitekey candidate)
  where
    stem = slug (T.pack (takeBaseName path))
    fallback = (if T.null stem then "unknown" else stem) <> "-nd"
    candidate = T.intercalate "-" [author, title, year]
    author = fromMaybe "unknown" (piAuthor info >>= firstSurname)
    titleWords = take 3 [ w | raw <- maybe [] T.words (piTitle info)
                            , let w = slug raw, not (T.null w), w `notElem` stopWords ]
    title | not (null titleWords) = T.intercalate "-" titleWords
          | not (T.null stem) = stem
          | otherwise = "untitled"
    year = maybe "nd" (T.pack . show) (arxivYear (detectArxiv page <|> detectArxiv (T.pack path)) <|> piCreationYear info)

-- | A new-style arXiv id encodes YYMM, which beats a PDF CreationDate that is
-- often just the date the file was downloaded or re-rendered.
arxivYear :: Maybe Text -> Maybe Int
arxivYear i = (2000 +) <$> (i >>= readInt . T.take 2)

-- | The include gate. Content is proposed for import only when it is reachable
-- from an include root /and/ does not look like generated output. Reachability
-- is checked over every path the content was found at, so a file that also
-- lives outside the roots is not penalised for it.
proposeInclude :: [FilePath] -> [FilePath] -> PdfInfo -> FilePath -> Bool
proposeInclude roots paths info rep = any under paths && isNothing (isJunk info rep)
  where under p = any (\r -> splitDirectories r `isPrefixOf` splitDirectories p) roots

-- | Include roots that actually confer inclusion: the existing ones,
-- canonicalised, minus any that resolve to the walk root itself. A catch-all
-- root (@"."@, for a one-off sweep) widens the walk but must never make the
-- whole of the swept tree importable.
--
-- The base is 'scRoot', not @$HOME@, because that is what "Shelf.Scan.Walk"
-- resolves the same names against: computing the gate from a different base
-- than the walk is what made @--root DIR@ mark every row @include: false@.
-- With @--root@ omitted @scRoot@ /is/ @$HOME@, so the default is unchanged.
includeRoots :: ScanConfig -> IO [FilePath]
includeRoots cfg = do
  rootAbs <- canonicalizePath (scRoot cfg)
  existing <- filterM doesDirectoryExist [rootAbs </> r | r <- scIncludeRoots cfg]
  filter (/= rootAbs) <$> mapM canonicalizePath existing

-- | Walk, hash, group identical content, and propose one row per distinct
-- file. Live fields are set equal to the proposal, so every row comes back
-- with 'srHumanEdited' False; 'mergeRows' is what folds in existing decisions.
scanRows :: ScanConfig -> FilePath -> IO [ScanRow]
scanRows cfg home = do
  homeAbs <- canonicalizePath home
  rootAbs <- canonicalizePath (scRoot cfg)
  roots <- includeRoots cfg
  measured <- mapM measure =<< walkPdfs cfg
  let groups = M.fromListWith (<>) [(sha, (p, n) :| []) | (p, sha, n) <- measured]
  flagProvenanceDuplicates <$> mapM (buildRow (relocate homeAbs rootAbs) roots) (M.toAscList groups)
  where
    measure p = do
      sha <- sha256File p
      n <- getFileSize p
      pure (p, sha, fromIntegral n :: Int)

-- | How an absolute found path is recorded in @srPaths@: relative to @$HOME@
-- when it lives under it (so @shelf apply@ can resolve it the usual way), and
-- otherwise relative to the walk root, which is the only other base a
-- @--root DIR@ sweep has. When @scRoot@ is @$HOME@ the two agree.
relocate :: FilePath -> FilePath -> FilePath -> FilePath
relocate homeAbs rootAbs p
  | splitDirectories homeAbs `isPrefixOf` splitDirectories p = makeRelative homeAbs p
  | otherwise = makeRelative rootAbs p

buildRow :: (FilePath -> FilePath) -> [FilePath] -> (Sha256, NonEmpty (FilePath, Int)) -> IO ScanRow
buildRow rel roots (sha, found) = do
  ei <- pdfInfo rep
  ep <- firstPage rep
  let info = fromRight noInfo ei
      page = fromRight "" ep
      errs = lefts [void ei, void ep]
      arxiv = detectArxiv page <|> detectArxiv (T.pack rep)
      prov = maybe Unsourced ArXiv arxiv
      year = maybe NoDate Year (arxivYear arxiv <|> piCreationYear info)
      topics = proposeTopics rep
      key = proposeCitekey info page rep
      include = proposeInclude roots paths info rep
      note = T.intercalate "; " (errs <> maybe [] pure (isJunk info rep))
  pure ScanRow
    { srSha256 = sha, srBytes = bytes, srPaths = map rel paths
    , srTitle = fromMaybe "" (piTitle info)
    , srAuthors = filter (not . T.null) (map T.strip (T.splitOn ";" (fromMaybe "" (piAuthor info))))
    , srInclude = include, srCitekey = key, srTopics = topics, srYear = year, srProvenance = prov
    , srProposal = Proposal key topics year prov include, srNote = note }
  where
    sorted = NE.sortWith fst found
    (rep, bytes) = NE.head sorted
    paths = map fst (NE.toList sorted)
    noInfo = PdfInfo Nothing Nothing Nothing Nothing 0

yearOrd :: Year -> Maybe Int
yearOrd (Year y) = Just y
yearOrd NoDate = Nothing

data DupRole = DupKeeper | DupLoser Int Text

-- | Same arXiv id, different bytes: the newest (ties broken by size) keeps its
-- citekey, older ones become @<base>-vN@ and carry a note naming the keeper.
--
-- Numbering is stable, not positional: a loser whose proposal already carries a
-- @-vN@ keeps that N, and only genuinely new losers take the lowest N still
-- free in the group. Re-running over an unchanged set is therefore the
-- identity. A human-edited citekey is left alone (only the proposal and the
-- note move), so the flagger can never silently undo a rename.
flagProvenanceDuplicates :: [ScanRow] -> [ScanRow]
flagProvenanceDuplicates rows = map apply rows
  where
    groups = M.elems (M.fromListWith (<>) [(i, [r]) | r <- rows, ArXiv i <- [srProvenance r]])
    roles = M.fromList (concatMap plan groups)
    plan rs
      | S.size (S.fromList (map srSha256 rs)) < 2 = []
      | otherwise = case unsnoc (sortOn rank rs) of
          Nothing -> []
          Just (losers, keeper) ->
            let key = stripCitekeyVersion (srCitekey keeper)
                held = M.fromList [(srSha256 l, n) | l <- losers, Just n <- [citekeyVersion (prCitekey (srProposal l))]]
                free = [n | n <- [1 :: Int ..], n `notElem` M.elems held]
            in (srSha256 keeper, DupKeeper) : assign key held free losers
    assign _ _ _ [] = []
    assign key held free (l : ls) = case M.lookup (srSha256 l) held of
      Just n -> (srSha256 l, DupLoser n key) : assign key held free ls
      Nothing -> case free of
        (n : rest) -> (srSha256 l, DupLoser n key) : assign key held rest ls
        [] -> []
    rank r = (yearOrd (srYear r), srBytes r)
    apply r = case M.lookup (srSha256 r) roles of
      Nothing -> r
      Just DupKeeper -> r
        { srCitekey = stripCitekeyVersion (srCitekey r), srNote = ""
        , srProposal = (srProposal r) { prCitekey = stripCitekeyVersion (prCitekey (srProposal r)) } }
      Just (DupLoser n key) -> r
        { srCitekey = if srHumanEdited r then srCitekey r else versioned n (srCitekey r)
        , srNote = "duplicate provenance of " <> key
        , srProposal = (srProposal r) { prCitekey = versioned n (prCitekey (srProposal r)) } }
    versioned n k = stripCitekeyVersion k <> "-v" <> T.pack (show n)

-- | Fold a fresh scan into the rows already on disk, keyed by sha256. A
-- human-edited row keeps its decisions and takes only the observable facts
-- (paths, size, metadata, note) from the fresh scan. A sha that has vanished
-- from the filesystem is kept, not dropped: the volume may just be unmounted.
mergeRows :: [ScanRow] -> [ScanRow] -> [ScanRow]
mergeRows existing fresh = map reconcile fresh <> [e | e <- existing, srSha256 e `S.notMember` freshShas]
  where
    byShaExisting = M.fromList [(srSha256 e, e) | e <- existing]
    freshShas = S.fromList (map srSha256 fresh)
    reconcile f = case M.lookup (srSha256 f) byShaExisting of
      Just e | srHumanEdited e -> f { srInclude = srInclude e, srCitekey = srCitekey e, srTopics = srTopics e
                                    , srYear = srYear e, srProvenance = srProvenance e }
      _ -> f

loadScan :: FilePath -> IO (Either Text [ScanRow])
loadScan p = do
  e <- doesFileExist p
  if not e
    then pure (Right [])
    else either (Left . T.pack . Y.prettyPrintParseException) Right <$> Y.decodeFileEither p

saveScan :: FilePath -> [ScanRow] -> IO ()
saveScan p rows = writeAtomic p (Y.encode rows)
