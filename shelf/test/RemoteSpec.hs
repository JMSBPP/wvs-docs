-- | The live suite: 'Shelf.Remote' against the real Hippius endpoint.
--
-- It is skipped — reported as a pass with a note — unless
-- @HIPPIUS_ACCESS_KEY_ID@ is set, so CI, which has no credentials, is unaffected.
-- Everything happens inside a bucket named @cfmm-refs-test-\<8 hex\>@ created and
-- removed by a 'bracket', never in the shelf's own bucket.
--
-- The first step is the one that matters: Task 3 signs every GET and HEAD with
-- @UNSIGNED-PAYLOAD@ rather than the digest of an empty body, and that choice
-- had never been exercised against Hippius. If it returned 403 the whole read
-- path would be wrong, so it is checked before anything else runs.
module RemoteSpec (tests) where

import Control.Exception (bracket_)
import Crypto.Hash (SHA256 (..), hashWith)
import Data.ByteArray.Encoding (Base (Base16), convertToBase)
import qualified Data.ByteString as BS
import qualified Data.ByteString.Char8 as BC
import Data.Text (Text)
import qualified Data.Text as T
import Data.Time (getCurrentTime)
import Data.Word (Word8)
import Fixture (ck)
import qualified Network.HTTP.Client as H
import Network.HTTP.Types.Status (statusCode)
import Shelf.Apply.Paths (RepoPaths (..), repoPaths)
import Shelf.Manifest (Manifest (..), saveManifest, schemaVersion)
import Shelf.Remote
import Shelf.Remote.Cli.Fetch (FetchOpts (..), runFetch)
import Shelf.Types
import System.Directory (createDirectoryIfMissing, removeFile)
import System.Exit (ExitCode (..))
import System.Environment (lookupEnv)
import System.FilePath ((</>))
import System.IO.Temp (withSystemTempDirectory)
import System.Posix.Process (getProcessID)
import Test.Tasty
import Test.Tasty.HUnit

-- | A deterministic non-uniform payload: a truncated or reordered transfer
-- cannot pass a digest comparison by accident.
blob :: Int -> BS.ByteString
blob n = fst (BS.unfoldrN n step (0xc0ffee :: Int))
  where
    step s = let s' = (s * 1103515245 + 12345) `mod` 2147483648
             in Just (fromIntegral (s' `div` 65536) :: Word8, s')

-- | Eight hex characters off the clock and the pid, so two runs — or two
-- machines — never collide on a bucket name.
uniqueSuffix :: IO Text
uniqueSuffix = do
  now <- getCurrentTime
  pid <- getProcessID
  let seed = BC.pack (show now <> "-" <> show pid)
  pure (T.take 8 (T.pack (BC.unpack (convertToBase Base16 (hashWith SHA256 seed)))))

expectRight :: Show e => Either e a -> IO a
expectRight = either (assertFailure . show) pure

-- | Read back the object at @key@ over plain HTTP with no @Authorization@
-- header at all — the public-read claim in decision P2-2, checked rather than
-- assumed.
unauthenticatedGet :: RemoteConfig -> Text -> IO Int
unauthenticatedGet cfg key = do
  req <- H.parseRequest (T.unpack (publicUrl cfg key))
  resp <- H.httpLbs req { H.checkResponse = \_ _ -> pure () } (rcManager cfg)
  pure (statusCode (H.responseStatus resp))

tests :: TestTree
tests = testGroup "Shelf.Remote (live, env-gated)"
  [ testCaseSteps "Hippius round-trip in a throwaway bucket" $ \step -> do
      configured <- lookupEnv "HIPPIUS_ACCESS_KEY_ID"
      case configured of
        Nothing -> step "skipped: HIPPIUS_ACCESS_KEY_ID is not set"
        Just _ -> do
          base <- expectRight =<< loadRemoteConfig
          suffix <- uniqueSuffix
          let cfg = base { rcBucket = "cfmm-refs-test-" <> suffix }
          step ("bucket " <> T.unpack (rcBucket cfg))
          withSystemTempDirectory "shelf-live" $ \dir ->
            bracket_ (expectRight =<< ensureBucket cfg) (teardown cfg) (live step cfg dir)
  ]

-- | Delete every object this suite created, then the bucket. Run even when a
-- step fails, so a red test never leaves paid storage behind.
teardown :: RemoteConfig -> IO ()
teardown cfg = do
  mapM_ (deleteObject cfg) [smallKey, bigKey]
  _ <- deleteBucket cfg
  pure ()

smallKey, bigKey :: Text
smallKey = "topics/options/live-probe-small-2026.pdf"
bigKey = "topics/options/live-probe-big-2026.pdf"

live :: (String -> IO ()) -> RemoteConfig -> FilePath -> IO ()
live step cfg dir = do
  step "UNSIGNED-PAYLOAD HEAD and GET of a 1 KB object return 200"
  (smallSha, smallEtag) <- upload cfg smallKey (dir </> "small.pdf") (blob 1024)
  headed <- headObject cfg smallKey
  (_, len) <- expectRight headed
  len @?= 1024
  got <- expectRight =<< getObject cfg smallKey (dir </> "small-back.pdf")
  got @?= smallSha
  removeFile (dir </> "small-back.pdf")

  step "put / get / head of a 1 MB object round-trips byte-identically"
  (bigSha, _) <- upload cfg bigKey (dir </> "big.pdf") (blob (1024 * 1024))
  (_, bigLen) <- expectRight =<< headObject cfg bigKey
  bigLen @?= 1024 * 1024
  backSha <- expectRight =<< getObject cfg bigKey (dir </> "big-back.pdf")
  backSha @?= bigSha
  original <- BS.readFile (dir </> "big.pdf")
  BS.readFile (dir </> "big-back.pdf") >>= (@?= original)

  step "an unauthenticated GET of publicUrl returns 200"
  status <- unauthenticatedGet cfg smallKey
  status @?= 200

  step "runFetch rebuilds a mirror with no credentials at all"
  anon <- mkRemoteConfig (rcEndpoint cfg) (rcBucket cfg) (rcRegion cfg) anonymousCredentials
    (rcBackoff cfg) (rcAttemptCap cfg) (rcAclMode cfg)
  assertBool "the clone cannot sign" (isAnonymous anon)
  rp <- liveRepo cfg (dir </> "clone") smallSha smallEtag
  runFetch rp anon (FetchOpts Nothing False False) >>= (@?= ExitSuccess)
  sha256OfFile (rpPdfs rp </> "live-probe-small-2026.pdf") >>= (@?= smallSha)

  step "deleteObject removes the object and a later GET 404s"
  _ <- expectRight =<< deleteObject cfg bigKey
  missing <- getObject cfg bigKey (dir </> "gone.pdf")
  case missing of
    Left (UnexpectedStatus 404 _) -> pure ()
    other -> assertFailure ("expected a 404 after delete, got " <> show other)

upload :: RemoteConfig -> Text -> FilePath -> BS.ByteString -> IO (Sha256, Text)
upload cfg key file bytes = do
  BS.writeFile file bytes
  sha <- sha256OfFile file
  etag <- expectRight =<< putObject cfg key file sha
  assertBool ("ETag is 32 hex for " <> T.unpack key) (T.length etag == 32)
  assertBool "digest is 64 hex" (T.length (sha256Text sha) == 64)
  pure (sha, etag)

-- | A one-source shelf whose manifest points at the object just uploaded, so
-- that @runFetch@ has something real to rebuild. The citekey is chosen to make
-- 'objectKey' render exactly 'smallKey' — otherwise 'verifiedObject' would
-- reject the row and the fetch would never reach the network.
liveRepo :: RemoteConfig -> FilePath -> Sha256 -> Text -> IO RepoPaths
liveRepo cfg root sha etag = do
  let rp = repoPaths root
  createDirectoryIfMissing True (root </> "manifest")
  now <- getCurrentTime
  let topic = Topic "options"
      citekey = ck "live-probe-small-2026"
      object = RemoteObject
        { roTopic = topic, roKey = smallKey, roUrl = publicUrl cfg smallKey, roEtag = etag
        , roVerifiedSha256 = sha, roVerifiedAt = now }
      source = Source
        { srcCitekey = citekey, srcSha256 = sha, srcBytes = 1024, srcTitle = "live probe"
        , srcAuthors = [], srcYear = Year 2026, srcProvenance = Unsourced, srcTopics = [topic]
        , srcOrigin = [], srcRemote = Just (Remote (rcEndpoint cfg) (rcBucket cfg) [object]) }
  saveManifest (rpManifest rp) (Manifest schemaVersion [source])
  pure rp
