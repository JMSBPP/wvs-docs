-- | Filesystem scan: walk PDF roots, hash and group by content, propose a
-- citekey/topics/year for each distinct file, and merge the proposals with
-- whatever a human already decided in @manifest/scan.yaml@.
--
-- The scan is idempotent and non-destructive: 'mergeRows' never overwrites a
-- row a human has touched, and 'saveScan' writes through 'writeAtomic'.
module Shelf.Scan
  ( Proposal (..), ScanRow (..), srHumanEdited, ScanConfig (..), defaultConfig
  , walkPdfs, sha256File, proposeCitekey, detectArxiv, isJunk, proposeTopics
  , flagProvenanceDuplicates, mergeRows, loadScan, saveScan
  ) where

import Control.Applicative ((<|>))
import Control.Monad (filterM, foldM)
import Crypto.Hash (Digest, SHA256, hashlazy)
import Data.Aeson (FromJSON (..), ToJSON (..), object, withObject, (.!=), (.:), (.:?), (.=))
import Data.ByteArray.Encoding (Base (Base16), convertToBase)
import qualified Data.ByteString as BS
import qualified Data.ByteString.Lazy as BL
import Data.Char (isDigit, toLower)
import Data.List (sortOn, unsnoc)
import qualified Data.Map.Strict as M
import Data.Maybe (fromMaybe, isNothing, listToMaybe)
import qualified Data.Set as S
import Data.Text (Text)
import qualified Data.Text as T
import qualified Data.Text.Encoding as TE
import qualified Data.Yaml as Y
import System.Directory (canonicalizePath, doesDirectoryExist, doesFileExist, listDirectory, pathIsSymbolicLink)
import System.FilePath (splitDirectories, takeBaseName, takeDirectory, takeExtension, takeFileName, (</>))
import Shelf.Atomic (writeAtomic)
import Shelf.Extract (PdfInfo (..))
import Shelf.Scan.Slug (firstSurname, readInt, slug, stopWords, stripCitekeyVersion)
import Shelf.Types

-- | What the tool last proposed for a row. Kept alongside the live fields so
-- 'srHumanEdited' can tell a human decision from a stale machine guess.
data Proposal = Proposal
  { prCitekey :: Text, prTopics :: [Text], prYear :: Year, prProvenance :: Provenance, prInclude :: Bool }
  deriving stock (Eq, Show)

data ScanRow = ScanRow
  { srSha256 :: Sha256, srBytes :: Int, srPaths :: [FilePath], srTitle :: Text, srAuthors :: [Text]
  , srInclude :: Bool, srCitekey :: Text, srTopics :: [Text], srYear :: Year, srProvenance :: Provenance
  , srProposal :: Proposal, srNote :: Text }
  deriving stock (Eq, Show)

instance ToJSON Proposal where
  toJSON p = object
    [ "citekey" .= prCitekey p, "topics" .= prTopics p, "year" .= prYear p
    , "provenance" .= prProvenance p, "include" .= prInclude p ]
instance FromJSON Proposal where
  parseJSON = withObject "proposal" $ \o -> Proposal
    <$> o .: "citekey" <*> o .:? "topics" .!= [] <*> o .: "year" <*> o .: "provenance" <*> o .: "include"

instance ToJSON ScanRow where
  toJSON r = object
    [ "sha256" .= srSha256 r, "bytes" .= srBytes r, "paths" .= srPaths r, "title" .= srTitle r
    , "authors" .= srAuthors r, "include" .= srInclude r, "citekey" .= srCitekey r, "topics" .= srTopics r
    , "year" .= srYear r, "provenance" .= srProvenance r, "proposal" .= srProposal r, "note" .= srNote r ]
-- A hand-written row may omit @proposal@; defaulting it to the row's own
-- fields makes such a row read back as not-human-edited rather than failing.
instance FromJSON ScanRow where
  parseJSON = withObject "scan row" $ \o -> do
    sha <- o .: "sha256"; bytes <- o .:? "bytes" .!= 0; paths <- o .:? "paths" .!= []
    title <- o .:? "title" .!= ""; authors <- o .:? "authors" .!= []
    include <- o .: "include"; key <- o .: "citekey"; topics <- o .:? "topics" .!= []
    year <- o .: "year"; prov <- o .: "provenance"; note <- o .:? "note" .!= ""
    prop <- o .:? "proposal" .!= Proposal key topics year prov include
    pure (ScanRow sha bytes paths title authors include key topics year prov prop note)

srHumanEdited :: ScanRow -> Bool
srHumanEdited r = (srInclude r, srCitekey r, srTopics r, srYear r) /= (prInclude p, prCitekey p, prTopics p, prYear p)
  where p = srProposal r

data ScanConfig = ScanConfig { scRoot :: FilePath, scIncludeRoots :: [FilePath], scExcludeDirs :: [Text] }
  deriving stock (Eq, Show)

defaultConfig :: FilePath -> ScanConfig
defaultConfig home = ScanConfig home roots excludes
  where
    roots = [ "wvs-docs", "cfmm/cfmm-theory", "cfmms-playground", "apps/d2p", "learning/convex-analysis"
            , "learning/formal-methods", "learning/mechanism-design", "learning/structural-econometrics"
            , "learning/discrete", ".local/share/wvs-shelf/legacy-refs" ]
    excludes = [ ".git", ".cache", ".TinyTeX", "site-packages", ".venv", "node_modules", "_work", ".stack"
               , ".stack-work", ".cabal", ".ghcup", ".cargo", "go-build", "builds", ".claude" ]

-- (canonical dirs already visited, PDFs found so far)
type Walk = (S.Set FilePath, [FilePath])

-- | Depth-first walk of the include roots. Symlinks are never followed (so a
-- @loop -> .@ cannot trap the walk); the visited set additionally makes
-- overlapping include roots cheap and hardlink cycles harmless.
walkPdfs :: ScanConfig -> IO [FilePath]
walkPdfs cfg = do
  roots <- filterM doesDirectoryExist [scRoot cfg </> r | r <- scIncludeRoots cfg]
  (_, pdfs) <- foldM (descend cfg) (S.empty, []) roots
  pure (S.toAscList (S.fromList pdfs))

descend :: ScanConfig -> Walk -> FilePath -> IO Walk
descend cfg st@(seen, pdfs) raw = do
  dir <- canonicalizePath raw
  if dir `S.member` seen
    then pure st
    else listDirectory dir >>= foldM (visit cfg dir) (S.insert dir seen, pdfs)

visit :: ScanConfig -> FilePath -> Walk -> FilePath -> IO Walk
visit cfg dir st@(seen, pdfs) name = do
  let full = dir </> name
  link <- pathIsSymbolicLink full
  if link then pure st else do
    isDir <- doesDirectoryExist full
    if not isDir
      then pure (seen, if isPdfName name then full : pdfs else pdfs)
      else do
        ok <- dirAllowed cfg dir name
        if ok then descend cfg st full else pure st

dirAllowed :: ScanConfig -> FilePath -> FilePath -> IO Bool
dirAllowed cfg parent name
  | T.pack name `elem` scExcludeDirs cfg = pure False
  -- A `lib` beside a foundry.toml is vendored Solidity, not a document tree.
  | name == "lib" = not <$> doesFileExist (parent </> "foundry.toml")
  | takeFileName parent == "share" && takeFileName (takeDirectory parent) == ".local" = pure (name == "wvs-shelf")
  | otherwise = pure True

isPdfName :: FilePath -> Bool
isPdfName n = map toLower (takeExtension n) == ".pdf"

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
    year = maybe "nd" (T.pack . show) (arxivYear <|> piCreationYear info)
    -- A new-style arXiv id encodes YYMM, which beats a PDF CreationDate that
    -- is often the date the file was downloaded or re-rendered.
    arxivYear = do
      i <- detectArxiv page <|> detectArxiv (T.pack path)
      yy <- readInt (T.take 2 i)
      pure (2000 + yy)

yearOrd :: Year -> Maybe Int
yearOrd (Year y) = Just y
yearOrd NoDate = Nothing

flagProvenanceDuplicates :: [ScanRow] -> [ScanRow]
flagProvenanceDuplicates rows = map apply rows
  where
    groups = M.elems (M.fromListWith (<>) [(i, [r]) | r <- rows, ArXiv i <- [srProvenance r]])
    renames = M.fromList (concatMap rename groups)
    rename rs
      | S.size (S.fromList (map srSha256 rs)) < 2 = []
      -- ascending by (year, bytes): the last row is the keeper, the rest
      -- take -v1.. in that same ascending order.
      | otherwise = case unsnoc (sortOn rank rs) of
          Just (losers, keeper) -> zip (map srSha256 losers) [(n, srCitekey keeper) | n <- [1 :: Int ..]]
          Nothing -> []
    rank r = (yearOrd (srYear r), srBytes r)
    apply r = case M.lookup (srSha256 r) renames of
      Nothing -> r
      Just (n, keeper) -> r
        { srCitekey = versioned n (srCitekey r)
        , srNote = "duplicate provenance of " <> keeper
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
