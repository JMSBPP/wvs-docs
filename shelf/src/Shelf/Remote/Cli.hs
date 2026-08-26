-- | @shelf push@ and @shelf url@: the manifest-aware halves of the remote
-- commands. @shelf fetch@ lives next door in "Shelf.Remote.Cli.Fetch", which
-- imports the selection helpers from here; the two were split because one
-- module holding both loops plus the arXiv fallback ran well past the size at
-- which a command body stays readable.
--
-- Push is written so that an interrupted run is never a lost run. Each object
-- is uploaded, downloaded back, compared by digest, and only then recorded —
-- and the manifest is saved inside the same lock that records it, so a kill
-- between two objects leaves a manifest that describes exactly what is on the
-- remote. Re-running picks up from there, because the work list is derived
-- from 'missingTopics' rather than from a checkpoint file.
module Shelf.Remote.Cli
  ( VerifyMode (..)
  , PushOpts (..)
  , runPush
  , runUrl
  , parseDuration
  , clampExpires
  , selectSources
  , mirrorPath
  , verifyDir
  , loadOrDie
  , say
  ) where

import Control.Concurrent (forkIO)
import Control.Concurrent.MVar
import Control.Exception (SomeException, finally, try)
import Control.Monad (forM, forM_, replicateM, when)
import Data.Char (isDigit)
import Data.List (sort, sortOn)
import Data.Text (Text)
import qualified Data.Text as T
import qualified Data.Text.IO as TIO
import Data.Time (getCurrentTime)
import Shelf.Apply.Paths (RepoPaths (..), die)
import Shelf.Manifest (Manifest (..), loadManifest, saveManifest)
import Shelf.Remote
import Shelf.Types
import System.Directory (createDirectoryIfMissing, doesFileExist, getFileSize, removeFile)
import System.Exit (ExitCode (..))
import System.FilePath ((<.>), (</>))

-- | How a freshly uploaded object is proved to hold the right bytes.
-- 'VerifyGet' downloads it and compares digests, which is the only check that
-- covers the bytes; 'VerifyHead' compares the ETag and length, which is cheap
-- enough to re-run over the whole shelf but trusts the server's own accounting.
data VerifyMode = VerifyGet | VerifyHead
  deriving stock (Eq, Show)

-- | 'Nothing' for @poSel@ is @--all@.
data PushOpts = PushOpts
  { poSel :: Maybe [Citekey]
  , poVerify :: VerifyMode
  , poDryRun :: Bool
  , poJobs :: Int
  }
  deriving stock (Eq, Show)

-- | One upload: a (source, topic) pair whose mirror file is on disk.
data Item = Item { itKey :: Citekey, itSha :: Sha256, itTopic :: Topic, itFile :: FilePath }

data Counts = Counts { cUploaded :: !Int, cVerified :: !Int, cSkipped :: !Int, cFailed :: !Int }

say :: Text -> IO ()
say = TIO.putStrLn

loadOrDie :: FilePath -> IO Manifest
loadOrDie p = loadManifest p >>= either die pure

-- | The selected sources in citekey order. An unknown citekey is an error
-- rather than a silent empty selection.
selectSources :: Maybe [Citekey] -> Manifest -> Either Text [Source]
selectSources sel m = case sel of
  Nothing -> Right ordered
  Just wanted -> case [c | c <- wanted, c `notElem` map srcCitekey ordered] of
    [] -> Right [s | s <- ordered, srcCitekey s `elem` wanted]
    unknown -> Left ("not in the manifest: " <> T.intercalate ", " (map citekeyText unknown))
  where ordered = sortOn srcCitekey (mfSources m)

mirrorPath :: RepoPaths -> Citekey -> FilePath
mirrorPath rp c = rpPdfs rp </> T.unpack (citekeyText c) <.> "pdf"

-- | Where a push parks the copy it downloads back. Under @pdfs/@ so the
-- verify read lands on the same filesystem as the mirror, and dot-prefixed so
-- @shelf scan@ (whose exclusions name it) never proposes what it finds there.
verifyDir :: RepoPaths -> FilePath
verifyDir rp = rpPdfs rp </> ".verify"

runPush :: RepoPaths -> RemoteConfig -> PushOpts -> IO ExitCode
runPush rp cfg opts = do
  manifest <- loadOrDie (rpManifest rp)
  srcs <- either die pure (selectSources (poSel opts) manifest)
  present <- forM srcs $ \s -> (,) s <$> doesFileExist (mirrorPath rp (srcCitekey s))
  let absent = [s | (s, False) <- present]
      items = [ Item (srcCitekey s) (srcSha256 s) t (mirrorPath rp (srcCitekey s))
              | (s, True) <- present, t <- sort (missingTopics s) ]
  forM_ absent $ \s ->
    say ("skip " <> citekeyText (srcCitekey s) <> ": " <> T.pack (mirrorPath rp (srcCitekey s)) <> " is missing")
  if poDryRun opts
    -- A dry run touches neither the repo nor the remote, so it does not
    -- ensure the bucket either: creating one is a write like any other.
    then do
      forM_ items $ \it -> say ("would upload " <> objectKey (itTopic it) (itKey it))
      say (summary (Counts 0 0 (length absent) 0) <> " (dry run)")
      pure ExitSuccess
    else do
      ensured <- ensureBucket cfg
      case ensured of
        Left e -> die ("cannot reach the bucket: " <> renderRemoteError e)
        Right () -> do
          createDirectoryIfMissing True (verifyDir rp)
          counts <- newMVar (Counts 0 0 (length absent) 0)
          queue <- newMVar items
          manifestVar <- newMVar manifest
          workers (max 1 (poJobs opts)) (drainQueue queue (guarded rp cfg opts manifestVar counts))
          final <- readMVar counts
          say (summary final)
          pure (if cFailed final > 0 then ExitFailure 1 else ExitSuccess)

summary :: Counts -> Text
summary c = T.intercalate ", "
  [ "uploaded " <> num cUploaded, "verified " <> num cVerified
  , "skipped " <> num cSkipped, "failed " <> num cFailed ]
  where num f = T.pack (show (f c))

-- | @n@ threads sharing one queue; the caller resumes when all of them have
-- run out of work.
workers :: Int -> IO () -> IO ()
workers n body = do
  dones <- replicateM n newEmptyMVar
  forM_ dones (\d -> forkIO (body `finally` putMVar d ()))
  mapM_ takeMVar dones

drainQueue :: MVar [a] -> (a -> IO ()) -> IO ()
drainQueue queue k = go
  where
    go = do
      next <- modifyMVar queue (\case [] -> pure ([], Nothing); (x : xs) -> pure (xs, Just x))
      maybe (pure ()) (\x -> k x >> go) next

-- | An exception inside one item must not take the worker — and with it the
-- rest of the queue — down with it.
guarded :: RepoPaths -> RemoteConfig -> PushOpts -> MVar Manifest -> MVar Counts -> Item -> IO ()
guarded rp cfg opts manifestVar counts it = do
  outcome <- try @SomeException (pushItem rp cfg opts manifestVar counts it)
  case outcome of
    Right () -> pure ()
    Left e -> failed counts (objectKey (itTopic it) (itKey it)) (T.pack (show e))

pushItem :: RepoPaths -> RemoteConfig -> PushOpts -> MVar Manifest -> MVar Counts -> Item -> IO ()
pushItem rp cfg opts manifestVar counts it = do
  uploaded <- putObject cfg key (itFile it) (itSha it)
  case uploaded of
    Left e -> failed counts key (renderRemoteError e)
    Right etag -> do
      bump counts (\c -> c { cUploaded = cUploaded c + 1 })
      checked <- verifyUpload rp cfg (poVerify opts) it
      case checked of
        Left e -> failed counts key (renderRemoteError e)
        Right got
          | got /= itSha it ->
              failed counts key (renderRemoteError (VerifyMismatch (itSha it) got))
          | otherwise -> do
              now <- getCurrentTime
              record manifestVar rp cfg it RemoteObject
                { roTopic = itTopic it, roKey = key, roUrl = publicUrl cfg key, roEtag = etag
                , roVerifiedSha256 = got, roVerifiedAt = now }
              bump counts (\c -> c { cVerified = cVerified c + 1 })
              say ("verified " <> key)
  where key = objectKey (itTopic it) (itKey it)

-- | 'VerifyGet' returns the digest of what came back; 'VerifyHead' returns the
-- source's own digest once the ETag and length agree, which is a weaker claim
-- and is why it is not the default.
verifyUpload :: RepoPaths -> RemoteConfig -> VerifyMode -> Item -> IO (Either RemoteError Sha256)
verifyUpload rp cfg mode it = case mode of
  VerifyGet -> do
    got <- getObject cfg key temp
    there <- doesFileExist temp
    when there (removeFile temp)
    pure got
  VerifyHead -> do
    size <- getFileSize (itFile it)
    probed <- headObject cfg key
    pure $ probed >>= \(etag, len) ->
      if fromIntegral len /= size
        then Left (HttpFailure ("HEAD reported " <> T.pack (show len) <> " bytes, the file has "
                                  <> T.pack (show size)))
        else if T.null etag
          then Left (HttpFailure "HEAD carried no ETag")
          else Right (itSha it)
  where
    key = objectKey (itTopic it) (itKey it)
    temp = verifyDir rp </> T.unpack (citekeyText (itKey it)) <> "." <> T.unpack (topicText (itTopic it)) <.> "pdf"

-- | Write the object into the manifest and save, both inside one lock: two
-- workers finishing two topics of the same source must not race, and a
-- manifest on disk that is ahead of or behind the lock's value would be
-- exactly the drift this whole verify-then-record dance exists to prevent.
record :: MVar Manifest -> RepoPaths -> RemoteConfig -> Item -> RemoteObject -> IO ()
record manifestVar rp cfg it o = modifyMVar_ manifestVar $ \m -> do
  let updated = m { mfSources = map attach (mfSources m) }
      attach s
        | srcCitekey s == itKey it = upsertObject (rcEndpoint cfg) (rcBucket cfg) o s
        | otherwise = s
  saveManifest (rpManifest rp) updated
  pure updated

bump :: MVar Counts -> (Counts -> Counts) -> IO ()
bump counts f = modifyMVar_ counts (pure . f)

failed :: MVar Counts -> Text -> Text -> IO ()
failed counts key reason = do
  say ("FAILED " <> key <> ": " <> reason)
  bump counts (\c -> c { cFailed = cFailed c + 1 })

-- | @shelf url@. With no @--topic@ the alphabetically first verified topic
-- wins, which is the same rule 'Shelf.Remote.Cli.Fetch.runFetch' uses to pick
-- an object to download, so the URL a human copies names the file a fetch
-- would place.
runUrl :: RepoPaths -> RemoteConfig -> Citekey -> Maybe Topic -> Bool -> Int -> IO ()
runUrl rp cfg c topic signed expires = do
  manifest <- loadOrDie (rpManifest rp)
  case [s | s <- mfSources manifest, srcCitekey s == c] of
    [] -> die ("not in the manifest: " <> citekeyText c)
    (s : _) -> case [o | t <- maybe (sort (srcTopics s)) pure topic, Just o <- [verifiedObject t s]] of
      [] -> die ("no verified remote object for " <> citekeyText c
                   <> maybe "" (\t -> " under topic " <> topicText t) topic)
      (o : _)
        | signed -> presignGet cfg (roKey o) (clampExpires expires) >>= say
        | otherwise -> say (roUrl o)

-- | S3 caps a presigned URL at one week, and a zero or negative expiry would
-- be a URL that is dead on arrival.
clampExpires :: Int -> Int
clampExpires = max 1 . min 604800

-- | @Ns@, @Nm@, @Nh@, @Nd@ — seconds, minutes, hours, days. A bare number is
-- refused because @--expires 600@ reads as ten minutes to half of everyone and
-- ten hours to the rest.
parseDuration :: Text -> Either Text Int
parseDuration t = case T.unsnoc t of
  Just (digits, unit)
    | not (T.null digits), T.all isDigit digits, Just scale <- lookup unit units ->
        Right (read (T.unpack digits) * scale)
  _ -> Left ("expected a duration like 30s, 15m, 6h or 7d, got: " <> t)
  where units = [('s', 1), ('m', 60), ('h', 3600), ('d', 86400)]
