-- | The one write primitive: every generated file in the repo goes through
-- 'writeAtomic' (or 'withAtomicOutput' directly), so a reader never observes
-- a half-written file. The file digest lives here too: it is the read-side
-- counterpart, it is what both the scan and the remote client identify a PDF
-- by, and keeping it here means "Shelf.Scan" does not have to depend on the
-- HTTP client to hash a file.
module Shelf.Atomic (withAtomicOutput, writeAtomic, sha256OfFile, finalizeSha256) where

import Control.Exception (bracketOnError)
import Crypto.Hash (Context, SHA256 (..), hashFinalize, hashInitWith, hashUpdate)
import Data.ByteArray.Encoding (Base (Base16), convertToBase)
import Data.Bits ((.|.))
import Data.ByteString (ByteString)
import qualified Data.ByteString as BS
import qualified Data.Text as T
import qualified Data.Text.Encoding as TE
import Shelf.Types (Sha256, mkSha256)
import System.Directory (removeFile, renameFile)
import System.FilePath (takeDirectory, takeFileName)
import System.IO (Handle, IOMode (ReadMode), hClose, openBinaryTempFile, withBinaryFile)
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

-- | One mebibyte per 'hashUpdate': the digest of a 300 MB PDF never needs the
-- whole file resident, which is why this exists rather than @hashlazy@ over a
-- lazy @readFile@.
sha256OfFile :: FilePath -> IO Sha256
sha256OfFile p = withBinaryFile p ReadMode (go (hashInitWith SHA256))
  where
    go ctx h = do
      chunk <- BS.hGet h (1024 * 1024)
      if BS.null chunk then finalizeSha256 ctx else go (hashUpdate ctx chunk) h

-- | Close an incremental digest into the manifest's validated newtype. The
-- rendering is 64 lowercase hex characters, so the 'mkSha256' check cannot
-- fail; it is threaded through anyway rather than asserted away.
finalizeSha256 :: Context SHA256 -> IO Sha256
finalizeSha256 ctx =
  either (fail . T.unpack) pure
    (mkSha256 (TE.decodeUtf8 (convertToBase Base16 (hashFinalize ctx) :: ByteString)))
