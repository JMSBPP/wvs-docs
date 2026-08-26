-- | The directory walk. Separated from "Shelf.Scan" (which re-exports
-- 'walkPdfs') to keep that module within its size budget.
module Shelf.Scan.Walk (walkPdfs) where

import Control.Monad (filterM, foldM)
import Data.Char (toLower)
import qualified Data.Set as S
import qualified Data.Text as T
import System.Directory (canonicalizePath, doesDirectoryExist, doesFileExist, listDirectory, pathIsSymbolicLink)
import System.FilePath (takeDirectory, takeExtension, takeFileName, (</>))
import Shelf.Scan.Types

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
