-- | @shelf fetch@: rebuild @pdfs/@ from the remote, and the arXiv fallback it
-- reaches for when the remote cannot answer.
--
-- The rule that shapes this module is that the mirror is never overwritten.
-- A file whose digest already matches is left untouched; one whose digest does
-- not is refused outright, because it is either a corruption the operator has
-- not seen yet or a newer PDF nobody recorded — and both deserve a human.
-- @--force@ does not lift the rule, it moves the offending file into
-- @pdfs/.displaced/@ first, so the bytes still exist afterwards.
--
-- The arXiv fallback is a fallback: it runs only when the remote failed and
-- the source records an arXiv id, it announces itself with a real
-- @User-Agent@, and it waits three seconds before every request. arXiv serves
-- the /latest/ version of a paper, so a digest mismatch there is ordinary
-- rather than alarming — the download is kept under @pdfs/.arxiv/@ for
-- inspection and is never installed as the mirror.
module Shelf.Remote.Cli.Fetch
  ( FetchOpts (..)
  , runFetch
  , fetchArxiv
  , arxivUserAgent
  ) where

import Control.Concurrent (threadDelay)
import Control.Exception (try)
import Crypto.Hash (Context, SHA256 (..), hashInitWith, hashUpdate)
import qualified Data.ByteString as BS
import Data.List (sort)
import Data.Text (Text)
import qualified Data.Text as T
import Data.Time (defaultTimeLocale, formatTime, getCurrentTime)
import Network.HTTP.Client
import Network.HTTP.Types.Status (statusCode)
import Shelf.Apply.Paths (RepoPaths (..), die)
import Shelf.Atomic (withAtomicOutput)
import Shelf.Remote
import Shelf.Remote.Cli (loadOrDie, mirrorPath, say, selectSources)
import Shelf.Types
import System.Directory (createDirectoryIfMissing, doesFileExist, removeFile, renameFile)
import System.Exit (ExitCode (..))
import System.FilePath ((<.>), (</>))
import System.IO (Handle)

-- | 'Nothing' for @foSel@ is @--all@.
data FetchOpts = FetchOpts
  { foSel :: Maybe [Citekey]
  , foDryRun :: Bool
  , foForce :: Bool
  }
  deriving stock (Eq, Show)

runFetch :: RepoPaths -> RemoteConfig -> FetchOpts -> IO ExitCode
runFetch rp cfg opts = do
  manifest <- loadOrDie (rpManifest rp)
  srcs <- either die pure (selectSources (foSel opts) manifest)
  if foDryRun opts
    then do
      mapM_ (plan rp) srcs
      pure ExitSuccess
    else do
      createDirectoryIfMissing True (rpPdfs rp)
      outcomes <- mapM (fetchOne rp cfg opts) srcs
      let failures = length [() | Left _ <- outcomes]
      say ("fetched " <> count [() | Right True <- outcomes]
             <> ", up to date " <> count [() | Right False <- outcomes]
             <> ", failed " <> T.pack (show failures))
      pure (if failures > 0 then ExitFailure 1 else ExitSuccess)
  where count xs = T.pack (show (length xs))

-- | What @--dry-run@ prints: the decision, never the transfer.
plan :: RepoPaths -> Source -> IO ()
plan rp s = do
  let target = mirrorPath rp (srcCitekey s)
  there <- doesFileExist target
  action <- if not there then pure "fetch" else do
    cur <- sha256OfFile target
    pure (if cur == srcSha256 s then "up to date" else "mismatched (needs --force)")
  say (action <> " " <> citekeyText (srcCitekey s))

-- | @Right True@ placed a file, @Right False@ found one already correct,
-- @Left@ is a failure that has already been reported.
fetchOne :: RepoPaths -> RemoteConfig -> FetchOpts -> Source -> IO (Either Text Bool)
fetchOne rp cfg opts s = do
  there <- doesFileExist target
  if not there
    then place rp cfg s target
    else do
      cur <- sha256OfFile target
      if cur == srcSha256 s
        then pure (Right False)
        else if not (foForce opts)
          then refuse (T.pack target <> " holds sha " <> sha256Text cur <> ", the manifest says "
                         <> sha256Text (srcSha256 s) <> "; refusing to overwrite (use --force)")
          else do
            displaced <- displace rp s target
            say ("displaced " <> T.pack displaced)
            place rp cfg s target
  where target = mirrorPath rp (srcCitekey s)

refuse :: Text -> IO (Either Text Bool)
refuse msg = say ("FAILED " <> msg) >> pure (Left msg)

-- | Move the offending file aside under a name that carries the moment it was
-- displaced, so a second @--force@ never lands on the first one's copy.
displace :: RepoPaths -> Source -> FilePath -> IO FilePath
displace rp s target = do
  now <- getCurrentTime
  let dir = rpPdfs rp </> ".displaced"
      stamp = formatTime defaultTimeLocale "%Y%m%dT%H%M%SZ" now
      dest = dir </> T.unpack (citekeyText (srcCitekey s)) <> "-" <> stamp <.> "pdf"
  createDirectoryIfMissing True dir
  renameFile target dest
  pure dest

-- | Download the object of the alphabetically first verified topic. Any
-- failure — including a source with no verified object at all — falls through
-- to arXiv when the provenance offers an id.
place :: RepoPaths -> RemoteConfig -> Source -> FilePath -> IO (Either Text Bool)
place rp cfg s target = do
  outcome <- case [o | t <- sort (srcTopics s), Just o <- [verifiedObject t s]] of
    [] -> pure (Left "no verified remote object")
    (o : _) -> do
      got <- getObject cfg (roKey o) target
      case got of
        Left e -> pure (Left (renderRemoteError e))
        Right sha
          | sha == srcSha256 s -> pure (Right ())
          | otherwise -> do
              removeFile target
              pure (Left ("the object at " <> roKey o <> " hashes to " <> sha256Text sha
                            <> ", not " <> sha256Text (srcSha256 s)))
  case outcome of
    Right () -> say ("fetched " <> citekeyText (srcCitekey s)) >> pure (Right True)
    Left remoteError -> case srcProvenance s of
      ArXiv aid -> fromArxiv rp cfg s target aid remoteError
      _ -> refuse (citekeyText (srcCitekey s) <> ": " <> remoteError)

fromArxiv :: RepoPaths -> RemoteConfig -> Source -> FilePath -> Text -> Text -> IO (Either Text Bool)
fromArxiv rp cfg s target aid remoteError = do
  let dir = rpPdfs rp </> ".arxiv"
      stash = dir </> T.unpack (citekeyText (srcCitekey s)) <.> "pdf"
  createDirectoryIfMissing True dir
  say (citekeyText (srcCitekey s) <> ": " <> remoteError <> "; trying arXiv " <> aid)
  got <- fetchArxiv (rcManager cfg) aid stash
  case got of
    Left e -> refuse (citekeyText (srcCitekey s) <> ": " <> remoteError <> "; arXiv: " <> e)
    Right sha
      | sha == srcSha256 s -> do
          renameFile stash target
          say ("fetched " <> citekeyText (srcCitekey s) <> " from arXiv")
          pure (Right True)
      | otherwise -> refuse (citekeyText (srcCitekey s) <> ": arXiv served a different version ("
                               <> sha256Text sha <> "); kept at " <> T.pack stash
                               <> " and not used as the mirror")

-- | Identifies the tool and its repo, as arXiv asks of anything automated.
arxivUserAgent :: BS.ByteString
arxivUserAgent = "cfmm-refs-shelf/0.1 (+https://github.com/d2p-finance/cfmm-refs)"

-- | Unsigned GET of @https:\/\/arxiv.org\/pdf\/\<id\>@ into @dest@, returning
-- the digest of what arrived. The three-second wait is unconditional and comes
-- first, so a loop over many sources cannot outrun arXiv's rate limit however
-- fast the failures arrive.
fetchArxiv :: Manager -> Text -> FilePath -> IO (Either Text Sha256)
fetchArxiv manager aid dest = do
  threadDelay 3000000
  built <- try @HttpException (parseRequest ("https://arxiv.org/pdf/" <> T.unpack aid))
  case built of
    Left e -> pure (Left (T.pack (show e)))
    Right base -> do
      let req = base
            { requestHeaders = [("user-agent", arxivUserAgent), ("accept-encoding", "")]
            , redirectCount = 10
            , checkResponse = \_ _ -> pure ()
            , responseTimeout = responseTimeoutMicro 300000000
            }
      result <- try @HttpException (withResponse req manager receive)
      pure (either (Left . T.pack . show) id result)
  where
    receive resp
      | statusCode (responseStatus resp) /= 200 = do
          body <- brConsume (responseBody resp)
          pure (Left ("arxiv.org answered " <> T.pack (show (statusCode (responseStatus resp)))
                        <> ": " <> decodePrefix (BS.concat body)))
      | otherwise = Right <$> withAtomicOutput dest (drain (responseBody resp) (hashInitWith SHA256))

drain :: BodyReader -> Context SHA256 -> Handle -> IO Sha256
drain reader ctx h = do
  chunk <- brRead reader
  if BS.null chunk
    then finalizeSha256 ctx
    else BS.hPut h chunk >> drain reader (hashUpdate ctx chunk) h
