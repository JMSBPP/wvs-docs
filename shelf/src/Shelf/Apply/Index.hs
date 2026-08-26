-- | The index pass: rebuild the BM25 blob when the manifest has moved, and
-- re-render @topics/<t>/INDEX.md@ and @topics/README.md@ from the manifest
-- plus whatever notes and exercises are on disk.
--
-- Freshness is keyed off the sha256 of the manifest file's bytes, so an
-- unchanged manifest never pays for a rebuild. Only sources are indexed for
-- BM25: notes and exercises have no citekey, and 'Shelf.Index.Doc' is keyed by
-- 'Citekey', so they appear in the rendered INDEX.md listings but not in
-- search results.
module Shelf.Apply.Index (runIndex, manifestHash) where

import Control.Monad (forM_, unless)
import Crypto.Hash (Digest, SHA256, hash)
import Data.ByteArray.Encoding (Base (Base16), convertToBase)
import qualified Data.ByteString as BS
import Data.Text (Text)
import qualified Data.Text as T
import qualified Data.Text.Encoding as TE
import System.Directory (createDirectoryIfMissing, doesFileExist)
import System.FilePath (makeRelative, takeDirectory, takeExtension, (<.>), (</>))
import System.IO (hPutStrLn, stderr)
import Shelf.Apply.Cards (refreshCardHeader)
import Shelf.Apply.Paths
import Shelf.Atomic (writeAtomic)
import Shelf.Index
import Shelf.Manifest (Manifest (..), loadManifest)
import Shelf.Types

runIndex :: RepoPaths -> IO ()
runIndex rp = do
  mf <- either die pure =<< loadManifest (rpManifest rp)
  h <- manifestHash (rpManifest rp)
  cached <- loadIndex (rpIndex rp)
  unless (indexFresh h cached) $ do
    docs <- mapM (sourceDoc rp) (mfSources mf)
    createDirectoryIfMissing True (takeDirectory (rpIndex rp))
    saveIndex (rpIndex rp) (buildIndex h docs)
  topics <- existingTopics rp
  -- Cards are refreshed from the manifest here rather than in the apply pass,
  -- so a `shelf index` after a push republishes every `pdf:` line without
  -- touching a single note. Only topics that already exist on disk are
  -- refreshed: scaffolding a directory for a topic the manifest merely claims
  -- would make that topic /known/ to the next `manifest check`, silencing the
  -- 'Shelf.Manifest.UnknownTopic' violation that exists to catch exactly that.
  forM_ (mfSources mf) $ \s -> forM_ (srcTopics s) $ \tp ->
    if tp `elem` topics
      then refreshCardHeader rp s tp
      else hPutStrLn stderr ("no topics/" <> T.unpack (topicText tp) <> "/ on disk: skipping the card for "
                               <> T.unpack (citekeyText (srcCitekey s)))
  forM_ topics $ \tp@(Topic t) -> do
    let dir = rpTopics rp </> T.unpack t
        srcs = [s | s <- mfSources mf, tp `elem` srcTopics s]
    notes <- listUnder dir "notes"
    exercises <- listUnder dir "exercises"
    writeAtomic (dir </> "INDEX.md") (TE.encodeUtf8 (renderTopicIndex tp srcs notes exercises))
  let counts = [(tp, length [() | s <- mfSources mf, tp `elem` srcTopics s]) | tp <- topics]
  writeAtomic (rpTopics rp </> "README.md") (TE.encodeUtf8 (renderTopicsReadme counts))

-- | sha256 of the manifest file's bytes; a missing manifest hashes as empty,
-- which is still a stable key for an empty index.
manifestHash :: FilePath -> IO Text
manifestHash p = do
  there <- doesFileExist p
  bytes <- if there then BS.readFile p else pure BS.empty
  pure (TE.decodeUtf8Lenient (convertToBase Base16 (hash bytes :: Digest SHA256)))

sourceDoc :: RepoPaths -> Source -> IO Doc
sourceDoc rp s = do
  raw <- readIfExists (rpText rp </> T.unpack (citekeyText (srcCitekey s)) <.> "md")
  pure (Doc (srcCitekey s) (srcTitle s) (maybe "" bodyOf raw))

-- | Markdown and notebook files under @dir/sub@, as paths relative to @dir@.
listUnder :: FilePath -> FilePath -> IO [FilePath]
listUnder dir sub = do
  fs <- walkFiles (dir </> sub)
  pure [makeRelative dir f | f <- fs, takeExtension f `elem` [".md", ".ipynb"]]
