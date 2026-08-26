-- | The one write primitive: every generated file in the repo goes through
-- 'writeAtomic' (or 'withAtomicOutput' directly), so a reader never observes
-- a half-written file.
module Shelf.Atomic (withAtomicOutput, writeAtomic) where

import Control.Exception (bracketOnError)
import Data.Bits ((.|.))
import qualified Data.ByteString as BS
import System.Directory (removeFile, renameFile)
import System.FilePath (takeDirectory, takeFileName)
import System.IO (Handle, hClose, openBinaryTempFile)
import System.Posix.Files (groupReadMode, otherReadMode, ownerReadMode, ownerWriteMode, setFileMode)
import System.Posix.Types (FileMode)

-- | 0644. 'openBinaryTempFile' creates its file 0600 and 'renameFile' keeps
-- that mode, so generated files would otherwise land owner-only — unreadable
-- to anything else on the machine, unlike every other tracked file here.
generatedMode :: FileMode
generatedMode = ownerReadMode .|. ownerWriteMode .|. groupReadMode .|. otherReadMode

-- | Run @action@ against a sibling temp file's handle, then chmod and rename
-- it onto @p@. If @action@ throws — or the chmod/rename afterwards does, e.g.
-- a full disk or a destination that is a directory — the handle is closed and
-- the temp file removed rather than left behind as @.\<name\>.tmp@ litter.
-- On success the handle is closed *before* the chmod/rename, and @action@'s
-- own result is returned.
withAtomicOutput :: FilePath -> (Handle -> IO a) -> IO a
withAtomicOutput p action = bracketOnError acquire discard commit
  where
    acquire = openBinaryTempFile (takeDirectory p) ("." <> takeFileName p <> ".tmp")
    -- hClose on an already-closed handle is a no-op, so this is safe whether
    -- the failure happened before or after the action ran.
    discard (tmp, h) = hClose h >> removeFile tmp
    commit (tmp, h) = do
      a <- action h
      hClose h
      setFileMode tmp generatedMode
      renameFile tmp p
      pure a

-- | Write @bytes@ to @p@ atomically. See 'withAtomicOutput'.
writeAtomic :: FilePath -> BS.ByteString -> IO ()
writeAtomic p bytes = withAtomicOutput p (`BS.hPut` bytes)
