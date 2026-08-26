module Shelf.Atomic (writeAtomic) where
import qualified Data.ByteString as BS
import System.Directory (renameFile)
import System.FilePath (takeDirectory, takeFileName)
import System.IO (hClose, openBinaryTempFile)

writeAtomic :: FilePath -> BS.ByteString -> IO ()
writeAtomic p bytes = do
  (tmp, h) <- openBinaryTempFile (takeDirectory p) ("." <> takeFileName p <> ".tmp")
  BS.hPut h bytes >> hClose h
  renameFile tmp p
