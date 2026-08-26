-- | The cleanup write-ahead log: @manifest/cleanup-log.yaml@, committed with
-- the repository, one YAML list item per event, appended and never rewritten.
--
-- Every action is bracketed by two events under the same key — @pending@
-- before the file is touched, @done@ after — so a run that dies between them
-- leaves a record saying exactly which file it was in the middle of. That is
-- what 'readPending' reads back, and it is the reason this is the one writer
-- in the package that does not go through "Shelf.Atomic": an atomic write
-- replaces a file, and replacing this one would lose the history it exists to
-- keep. A torn last line is recoverable by hand; a lost log is not.
--
-- Paths are stored relative to @$HOME@ because the file is committed: an
-- absolute @\/home\/\<name\>\/…@ in a public repository says more about the
-- machine than the log needs to.
module Shelf.Cleanup.Log
  ( LogEvent (..)
  , appendEvent
  , readEvents
  , readPending
  , homeRelative
  ) where

import Data.Aeson
import qualified Data.ByteString as BS
import Data.List (isPrefixOf)
import qualified Data.Set as S
import Data.Text (Text)
import Data.Time (UTCTime)
import qualified Data.Yaml as Y
import System.Directory (createDirectoryIfMissing, doesFileExist)
import System.FilePath (makeRelative, splitDirectories, takeDirectory)

import Shelf.Types (Citekey, Sha256)

-- | @leKey@ is @\<home-relative path\>|\<utc\>@: unique per action, and the
-- join key between the @pending@ and @done@ halves. @leObjects@ records the
-- remote keys the file was backed by at the moment it was removed, so the log
-- alone is enough to fetch it again.
data LogEvent = LogEvent
  { leKey :: Text
  , lePath :: FilePath
  , leSha :: Sha256
  , leCitekey :: Citekey
  , leAction :: Text
  , leRepo :: Maybe FilePath
  , leObjects :: [Text]
  , leStatus :: Text
  , leAt :: UTCTime
  }
  deriving stock (Eq, Show)

instance ToJSON LogEvent where
  toJSON e = object $
    [ "key" .= leKey e, "path" .= lePath e, "sha256" .= leSha e
    , "citekey" .= leCitekey e, "action" .= leAction e
    , "object_keys" .= leObjects e, "status" .= leStatus e, "at" .= leAt e ]
    <> maybe [] (\r -> ["repo" .= r]) (leRepo e)

instance FromJSON LogEvent where
  parseJSON = withObject "cleanup event" $ \o -> LogEvent
    <$> o .: "key" <*> o .: "path" <*> o .: "sha256" <*> o .: "citekey"
    <*> o .: "action" <*> o .:? "repo" <*> o .:? "object_keys" .!= []
    <*> o .: "status" <*> o .: "at"

-- | Append one @- {…}@ item. 'Y.encode' of a one-element list renders exactly
-- that, so concatenation of successive calls stays a well-formed YAML
-- sequence.
appendEvent :: FilePath -> LogEvent -> IO ()
appendEvent p e = do
  createDirectoryIfMissing True (takeDirectory p)
  BS.appendFile p (Y.encode [e])

-- | The log in the order it was written. A missing file is an empty log; a
-- malformed one is an error, because silently reading a corrupt log as empty
-- would hide the very crash it was written to record.
readEvents :: FilePath -> IO [LogEvent]
readEvents p = do
  there <- doesFileExist p
  if not there then pure [] else
    either (ioError . userError . Y.prettyPrintParseException) pure =<< Y.decodeFileEither p

-- | Keys with a @pending@ event and no @done@ event: actions that were
-- announced and never confirmed.
readPending :: FilePath -> IO [LogEvent]
readPending p = do
  events <- readEvents p
  let done = S.fromList [leKey e | e <- events, leStatus e == "done"]
  pure [e | e <- events, leStatus e == "pending", not (leKey e `S.member` done)]

-- | @p@ relative to @home@ when it lies under it, and @p@ unchanged when it
-- does not — a log line is never worth failing a run over.
homeRelative :: FilePath -> FilePath -> FilePath
homeRelative home p
  | splitDirectories home `isPrefixOf` splitDirectories p = makeRelative home p
  | otherwise = p
