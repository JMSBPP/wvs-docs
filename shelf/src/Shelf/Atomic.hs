-- | The one write primitive: every generated file in the repo goes through
-- 'writeAtomic', so a reader never observes a half-written file.
module Shelf.Atomic (writeAtomic) where

import Control.Exception (bracketOnError)
import Data.Bits ((.|.))
import qualified Data.ByteString as BS
import System.Directory (removeFile, renameFile)
import System.FilePath (takeDirectory, takeFileName)
import System.IO (hClose, openBinaryTempFile)
import System.Posix.Files (groupReadMode, otherReadMode, ownerReadMode, ownerWriteMode, setFileMode)
import System.Posix.Types (FileMode)

-- | 0644. 'openBinaryTempFile' creates its file 0600 and 'renameFile' keeps
-- that mode, so generated files would otherwise land owner-only — unreadable
-- to anything else on the machine, unlike every other tracked file here.
generatedMode :: FileMode
generatedMode = ownerReadMode .|. ownerWriteMode .|. groupReadMode .|. otherReadMode

-- | Write @bytes@ to @p@ via a sibling temp file, chmod, and rename. If any
-- step throws — a full disk, a destination that is a directory — the temp file
-- is removed rather than left behind as @.\<name\>NNNN.tmp@ litter.
writeAtomic :: FilePath -> BS.ByteString -> IO ()
writeAtomic p bytes = bracketOnError acquire discard commit
  where
    acquire = openBinaryTempFile (takeDirectory p) ("." <> takeFileName p <> ".tmp")
    -- hClose on an already-closed handle is a no-op, so this is safe whether
    -- the failure happened before or after the write.
    discard (tmp, h) = hClose h >> removeFile tmp
    commit (tmp, h) = do
      BS.hPut h bytes
      hClose h
      setFileMode tmp generatedMode
      renameFile tmp p
