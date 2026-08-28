-- | 'Shelf.Remote' against the signature-verifying stub in "StubServer":
-- path-style addressing on a custom endpoint, streaming PUT/GET, the retry
-- ladder, and 'ensureBucket'. Nothing here reaches the network.
module RemoteStubSpec (tests) where

import Control.Exception (IOException, throwIO, try)
import Data.Bits ((.&.))
import Data.ByteString (ByteString)
import qualified Data.ByteString as BS
import Data.IORef (IORef, readIORef, writeIORef)
import qualified Data.Map.Strict as M
import Data.Text (Text)
import qualified Data.Text as T
import qualified Data.Text.Encoding as TE
import Data.Word (Word8)
import Shelf.Atomic (withAtomicOutput)
import Data.Time (UTCTime, defaultTimeLocale, parseTimeM)
import Shelf.Remote
import Shelf.Remote.SigV4 (Credentials (..), presignUrl)
import StubServer (LogEntry, Stub (..), StubRequest (..), withStub, withStubDetail)
import System.Directory (listDirectory)
import System.FilePath ((</>))
import System.IO.Temp (withSystemTempDirectory)
import System.Posix.Files (fileMode, getFileStatus)
import Test.Tasty
import Test.Tasty.HUnit

-- | Not a credential: the stub accepts exactly this pair and nothing else
-- ever leaves the loopback interface.
fakeCreds :: Credentials
fakeCreds = Credentials "hip_stubaccesskeyid" "stub-secret-not-a-real-key-000000"

key :: Text
key = "topics/options/carr-madan-1998.pdf"

cfgWith :: Int -> Credentials -> [Int] -> Int -> AclMode -> IO RemoteConfig
cfgWith port =
  mkRemoteConfig ("http://127.0.0.1:" <> T.pack (show port)) "cfmm-refs" "decentralized"

cfgFor :: Int -> Credentials -> [Int] -> IO RemoteConfig
cfgFor port creds backoff = cfgWith port creds backoff (30 * 1000000) ObjectAcl

-- | A deterministic non-uniform payload, so a truncated or reordered transfer
-- cannot pass a byte comparison by accident.
blob :: Int -> BS.ByteString
blob n = fst (BS.unfoldrN n step (0x5eed :: Int))
  where
    step s = let s' = (s * 1103515245 + 12345) `mod` 2147483648
             in Just (fromIntegral (s' `div` 65536) :: Word8, s')

expectRight :: Show e => Either e a -> IO a
expectRight = either (assertFailure . show) pure

-- | Upload a small object so the request it produced can be inspected.
putSmall :: RemoteConfig -> FilePath -> IO ()
putSmall cfg dir = do
  let src = dir </> "src.pdf"
  BS.writeFile src (blob 1024)
  sha <- sha256OfFile src
  _ <- expectRight =<< putObject cfg key src sha
  pure ()

-- | The @X-Amz-Date@ a presigned query carries, read back as the instant that
-- signed it, so a clock-reading function can be compared with a pure one.
signedAt :: Text -> IO UTCTime
signedAt query = case [v | p <- T.splitOn "&" (T.drop 1 query), Just v <- [T.stripPrefix "X-Amz-Date=" p]] of
  (v : _) -> maybe (assertFailure ("X-Amz-Date not a timestamp: " <> show v)) pure
    (parseTimeM False defaultTimeLocale "%Y%m%dT%H%M%SZ" (T.unpack v))
  [] -> assertFailure ("no X-Amz-Date in " <> show query)

-- | The most recent request the stub saw with this method.
lastOf :: IORef [StubRequest] -> ByteString -> IO StubRequest
lastOf ref verb = do
  seen <- readIORef ref
  case [r | r <- seen, srMethod r == verb] of
    (r : _) -> pure r
    [] -> assertFailure ("the stub saw no " <> show verb <> " request")

-- | Requests the stub saw for @key@, oldest first.
objectRequests :: IORef [LogEntry] -> IO [LogEntry]
objectRequests ref = reverse . filter forKey <$> readIORef ref
  where forKey (_, p, _) = p == "/cfmm-refs/topics/options/carr-madan-1998.pdf"

tests :: TestTree
tests = testGroup "Shelf.Remote (stub)"
  [ testCase "ensureBucket creates the bucket on 404 and then no-ops" $
      withStub fakeCreds $ \port objects _ requests -> do
        cfg <- cfgFor port fakeCreds [0, 0, 0]
        ensureBucket cfg >>= (@?= Right ())
        readIORef objects >>= \m -> assertBool "bucket exists" (M.member "" m)
        ensureBucket cfg >>= (@?= Right ())
        seen <- reverse <$> readIORef requests
        [v | (v, _, _) <- seen] @?= ["HEAD", "PUT", "HEAD"]

  , testCase "putObject streams a 3 MB file the stub receives byte-identically" $
      withStub fakeCreds $ \port objects _ _ -> withSystemTempDirectory "shelf-put" $ \dir -> do
        cfg <- cfgFor port fakeCreds [0, 0, 0]
        _ <- expectRight =<< ensureBucket cfg
        let bytes = blob (3 * 1024 * 1024)
            src = dir </> "big.pdf"
        BS.writeFile src bytes
        sha <- sha256OfFile src
        etag <- expectRight =<< putObject cfg key src sha
        assertEqual "ETag is unquoted 32-hex" 32 (T.length etag)
        readIORef objects >>= \m -> M.lookup key m @?= Just bytes

  , testCase "getObject writes the bytes, returns their digest and mode 0644" $
      withStub fakeCreds $ \port _ _ _ -> withSystemTempDirectory "shelf-get" $ \dir -> do
        cfg <- cfgFor port fakeCreds [0, 0, 0]
        _ <- expectRight =<< ensureBucket cfg
        let bytes = blob 262144
            src = dir </> "src.pdf"
            dest = dir </> "out.pdf"
        BS.writeFile src bytes
        sha <- sha256OfFile src
        _ <- expectRight =<< putObject cfg key src sha
        got <- expectRight =<< getObject cfg key dest
        got @?= sha
        BS.readFile dest >>= (@?= bytes)
        st <- getFileStatus dest
        (fileMode st .&. 0o777) @?= 0o644

  , testCase "getObject on a missing key is UnexpectedStatus 404 and writes nothing" $
      withStub fakeCreds $ \port _ _ _ -> withSystemTempDirectory "shelf-miss" $ \dir -> do
        cfg <- cfgFor port fakeCreds [0, 0, 0]
        _ <- expectRight =<< ensureBucket cfg
        got <- getObject cfg key (dir </> "out.pdf")
        case got of
          Left (UnexpectedStatus 404 _) -> pure ()
          other -> assertFailure ("expected a 404, got " <> show other)
        listDirectory dir >>= (@?= [])

  , testCase "headObject reports the ETag and the object length" $
      withStub fakeCreds $ \port _ _ _ -> withSystemTempDirectory "shelf-head" $ \dir -> do
        cfg <- cfgFor port fakeCreds [0, 0, 0]
        _ <- expectRight =<< ensureBucket cfg
        let bytes = blob 4096
            src = dir </> "src.pdf"
        BS.writeFile src bytes
        sha <- sha256OfFile src
        etag <- expectRight =<< putObject cfg key src sha
        (headEtag, len) <- expectRight =<< headObject cfg key
        headEtag @?= etag
        len @?= 4096

  , testCase "a 503 is retried with a freshly signed request" $
      withStub fakeCreds $ \port objects failures requests ->
        withSystemTempDirectory "shelf-retry" $ \dir -> do
          -- 1.1 s of backoff so the two x-amz-date stamps, which have
          -- one-second resolution, cannot coincide.
          cfg <- cfgFor port fakeCreds [1100000, 0, 0]
          _ <- expectRight =<< ensureBucket cfg
          let bytes = blob 1024
              src = dir </> "small.pdf"
          BS.writeFile src bytes
          sha <- sha256OfFile src
          writeIORef failures 1
          _ <- expectRight =<< putObject cfg key src sha
          readIORef objects >>= \m -> M.lookup key m @?= Just bytes
          seen <- objectRequests requests
          case seen of
            [(_, _, first), (_, _, second)] ->
              assertBool "the retry carried a new x-amz-date" (first /= second)
            other -> assertFailure ("expected two attempts, saw " <> show (length other))

  , testCase "a 503 on a 3 MB body is retried after the stub drains it" $
      withStub fakeCreds $ \port objects failures requests ->
        withSystemTempDirectory "shelf-retry-big" $ \dir -> do
          cfg <- cfgFor port fakeCreds [0, 0, 0]
          _ <- expectRight =<< ensureBucket cfg
          let bytes = blob (3 * 1024 * 1024)
              src = dir </> "big.pdf"
          BS.writeFile src bytes
          sha <- sha256OfFile src
          writeIORef failures 1
          _ <- expectRight =<< putObject cfg key src sha
          readIORef objects >>= \m -> M.lookup key m @?= Just bytes
          objectRequests requests >>= \seen -> length seen @?= 2

  , testCase "a rejected signature is final: one attempt, UnexpectedStatus 403" $
      withStub fakeCreds $ \port _ _ requests -> do
        cfg <- cfgFor port fakeCreds { secretKey = "wrong-secret" } [0, 0, 0]
        got <- ensureBucket cfg
        case got of
          Left (UnexpectedStatus 403 _) -> pure ()
          other -> assertFailure ("expected a 403, got " <> show other)
        readIORef requests >>= \seen -> length seen @?= 1

  , testCase "a continuation that throws leaves no temp file behind" $
      withStub fakeCreds $ \port _ _ _ -> withSystemTempDirectory "shelf-abort" $ \dir -> do
        cfg <- cfgFor port fakeCreds [0, 0, 0]
        _ <- expectRight =<< ensureBucket cfg
        let bytes = blob 65536
            src = dir </> "src.pdf"
            dest = dir </> "out.pdf"
        BS.writeFile src bytes
        sha <- sha256OfFile src
        _ <- expectRight =<< putObject cfg key src sha
        got <- try $ sendWith cfg (getRequest cfg key) $ \_ ->
          withAtomicOutput dest (\_ -> throwIO (userError "boom") :: IO (Either RemoteError ()))
        case got of
          Left e -> show (e :: IOException) `seq` pure ()
          Right r -> assertFailure ("expected the throw to escape, got " <> show r)
        listDirectory dir >>= (@?= ["src.pdf"])

  , testCase "publicUrl is path-style and presignGet carries the query signature" $ do
      cfg <- cfgFor 9999 fakeCreds [0, 0, 0]
      publicUrl cfg key @?= "http://127.0.0.1:9999/cfmm-refs/" <> key
      url <- presignGet cfg key 86400
      assertBool "expiry" ("X-Amz-Expires=86400" `T.isInfixOf` url)
      assertBool "signature" ("X-Amz-Signature=" `T.isInfixOf` url)

  , testCase "presignGet encodes the key through the renderer that signed it" $ do
      -- The tested path must be the shipped path. Assembling the URL by hand
      -- put the raw key on the wire while the signature covered the encoded
      -- one, and no test vector saw it because every key in the manifest is
      -- already URL-safe.
      cfg <- cfgFor 9999 fakeCreds [0, 0, 0]
      let awkward = "topics/options/de $ vries 2020.pdf"
      url <- presignGet cfg awkward 86400
      let (path, query) = T.breakOn "?" url
      assertBool ("$ encoded in " <> show path) ("%24" `T.isInfixOf` path)
      assertBool ("space encoded in " <> show path) ("%20" `T.isInfixOf` path)
      assertBool ("no raw $ in " <> show path) (not ("$" `T.isInfixOf` path))
      assertBool ("no raw space in " <> show path) (not (" " `T.isInfixOf` path))
      -- Byte-for-byte what presignUrl produces at the instant presignGet
      -- signed: same path encoding, same parameter order, same signature.
      at <- signedAt query
      let expected = presignUrl fakeCreds at (scopeOf cfg)
            "http://127.0.0.1:9999" (objectPath cfg awkward) 86400
      url @?= TE.decodeUtf8 expected

  , testCase "a PUT signs and sends the object ACL and the PDF content type" $
      withStubDetail fakeCreds $ \stub -> withSystemTempDirectory "shelf-acl" $ \dir -> do
        cfg <- cfgFor (stubPort stub) fakeCreds [0, 0, 0]
        _ <- expectRight =<< ensureBucket cfg
        putSmall cfg dir
        sent <- lastOf (stubRequests stub) "PUT"
        lookup "x-amz-acl" (srHeaders sent) @?= Just "public-read"
        lookup "content-type" (srHeaders sent) @?= Just "application/pdf"
        -- Present is not enough. An unsigned header is one a proxy could add
        -- or drop without the request failing, so both must appear in
        -- SignedHeaders -- and the stub 403s if their values were altered.
        auth <- maybe (assertFailure "no authorization header") pure
          (lookup "authorization" (srHeaders sent))
        assertBool "x-amz-acl is signed" ("x-amz-acl" `BS.isInfixOf` auth)
        assertBool "content-type is signed" ("content-type" `BS.isInfixOf` auth)

  , testCase "under NoAcl a PUT carries no ACL header at all" $
      withStubDetail fakeCreds $ \stub -> withSystemTempDirectory "shelf-noacl" $ \dir -> do
        cfg <- cfgWith (stubPort stub) fakeCreds [0, 0, 0] (30 * 1000000) NoAcl
        _ <- expectRight =<< ensureBucket cfg
        putSmall cfg dir
        sent <- lastOf (stubRequests stub) "PUT"
        lookup "x-amz-acl" (srHeaders sent) @?= Nothing
        lookup "content-type" (srHeaders sent) @?= Just "application/pdf"

  , testCase "under BucketAcl ensureBucket follows the create with PUT /bucket?acl" $
      withStubDetail fakeCreds $ \stub -> do
        cfg <- cfgWith (stubPort stub) fakeCreds [0, 0, 0] (30 * 1000000) BucketAcl
        ensureBucket cfg >>= (@?= Right ())
        seen <- reverse <$> readIORef (stubRequests stub)
        -- "?acl=", not "?acl": SigV4 makes an empty value emit its "=" in the
        -- canonical query, and the wire carries exactly what was signed rather
        -- than a shorter spelling the server would have to normalise back.
        [(srMethod r, srPath r, srQuery r) | r <- seen] @?=
          [("HEAD", "/cfmm-refs", ""), ("PUT", "/cfmm-refs", ""), ("PUT", "/cfmm-refs", "?acl=")]
        acl <- lastOf (stubRequests stub) "PUT"
        lookup "x-amz-acl" (srHeaders acl) @?= Just "public-read"

  , testCase "an attempt that outruns rcAttemptCap is retried, or fails as AttemptTimeout" $
      withStubDetail fakeCreds $ \stub -> do
        -- 150 ms is orders of magnitude more than a loopback HEAD needs and a
        -- third of the stub's stall, so only the stalled attempt trips it.
        cfg <- cfgWith (stubPort stub) fakeCreds [0, 0, 0] 150000 ObjectAcl
        _ <- expectRight =<< ensureBucket cfg
        writeIORef (stubStalls stub) 1
        ensureBucket cfg >>= (@?= Right ())
        writeIORef (stubStalls stub) 1
        exhausted <- cfgWith (stubPort stub) fakeCreds [] 150000 ObjectAcl
        ensureBucket exhausted >>= (@?= Left AttemptTimeout)
  ]
