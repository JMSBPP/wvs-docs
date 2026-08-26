-- | Repo layout plus the few filesystem helpers that both the apply pass and
-- the index pass need. Split out of "Shelf.Apply" so "Shelf.Apply.Index" can
-- depend on them without a module cycle.
module Shelf.Apply.Paths
  ( RepoPaths (..), repoPaths, findRepo, existingTopics
  , readIfExists, bodyOf, walkFiles, die
  ) where

import Control.Monad (filterM, forM)
import qualified Data.ByteString as BS
import Data.List (sort)
import Data.Text (Text)
import qualified Data.Text as T
import qualified Data.Text.Encoding as TE
import System.Directory (canonicalizePath, doesDirectoryExist, doesFileExist, listDirectory)
import System.Exit (ExitCode (..), exitWith)
import System.FilePath (takeDirectory, (</>))
import System.IO (hPutStrLn, stderr)
import Shelf.Types (Topic (..))

-- | Every path the tooling writes, derived from the repo root. Nothing else in
-- the package hard-codes a repo-relative path.
data RepoPaths = RepoPaths
  { rpRoot :: FilePath, rpManifest :: FilePath, rpScan :: FilePath
  , rpPdfs :: FilePath, rpText :: FilePath, rpTopics :: FilePath, rpIndex :: FilePath }
  deriving stock (Eq, Show)

repoPaths :: FilePath -> RepoPaths
repoPaths root = RepoPaths
  { rpRoot = root
  , rpManifest = root </> "manifest" </> "sources.yaml"
  , rpScan = root </> "manifest" </> "scan.yaml"
  , rpPdfs = root </> "pdfs"
  , rpText = root </> "text"
  , rpTopics = root </> "topics"
  , rpIndex = root </> "index" </> "bm25.bin"
  }

-- | Nearest ancestor of @start@ (inclusive) holding a @manifest/@ or @topics/@
-- directory. 'Nothing' when the walk reaches the filesystem root.
findRepo :: FilePath -> IO (Maybe FilePath)
findRepo start = go =<< canonicalizePath start
  where
    go d = do
      hits <- mapM (doesDirectoryExist . (d </>)) ["manifest", "topics"]
      if or hits
        then pure (Just d)
        else let up = takeDirectory d in if up == d then pure Nothing else go up

-- | Topics are the subdirectories of @topics/@; plain files there (README.md)
-- are not topics.
existingTopics :: RepoPaths -> IO [Topic]
existingTopics rp = do
  there <- doesDirectoryExist (rpTopics rp)
  if not there then pure [] else do
    names <- sort <$> listDirectory (rpTopics rp)
    dirs <- filterM (doesDirectoryExist . (rpTopics rp </>)) names
    pure (map (Topic . T.pack) dirs)

readIfExists :: FilePath -> IO (Maybe Text)
readIfExists p = do
  there <- doesFileExist p
  if there then Just . TE.decodeUtf8Lenient <$> BS.readFile p else pure Nothing

-- | Inverse of 'Shelf.Extract.renderText': drop the six-line front matter and
-- keep the remainder byte-for-byte, trailing newline included. A file without
-- a front matter has no body as far as the stamp is concerned.
bodyOf :: Text -> Text
bodyOf = go (6 :: Int)
  where
    go 0 t = t
    go n t = case T.breakOn "\n" t of
      (_, rest) -> case T.stripPrefix "\n" rest of
        Just r -> go (n - 1) r
        Nothing -> ""

-- | Every regular file under @d@, recursively, in sorted order.
walkFiles :: FilePath -> IO [FilePath]
walkFiles d = do
  there <- doesDirectoryExist d
  if not there then pure [] else do
    names <- sort <$> listDirectory d
    concat <$> forM names (\n -> do
      let p = d </> n
      isDir <- doesDirectoryExist p
      if isDir then walkFiles p else pure [p])

die :: Text -> IO a
die msg = hPutStrLn stderr (T.unpack msg) >> exitWith (ExitFailure 1)
