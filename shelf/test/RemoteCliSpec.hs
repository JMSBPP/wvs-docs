-- | The @push@ / @fetch@ / @url@ command bodies against the
-- signature-verifying stub in "StubServer". Nothing here reaches the network:
-- every source is 'Unsourced', so the arXiv fallback in
-- "Shelf.Remote.Cli.Fetch" is never entered.
--
-- The repo under test is a real temporary shelf — @manifest/sources.yaml@ plus
-- @pdfs/\<ck\>.pdf@ built from the committed fixtures — because what these
-- tests are about is exactly the interaction between the manifest, the mirror
-- and the object store.
module RemoteCliSpec (tests) where

import qualified Data.ByteString as BS
import Data.IORef (IORef, readIORef)
import Data.List (sort)
import qualified Data.Map.Strict as M
import Data.Text (Text)
import qualified Data.Text as T
import Data.Time (UTCTime (..), fromGregorian)
import Fixture (ck, right)
import Shelf.Apply.Paths (RepoPaths (..), repoPaths)
import Shelf.Manifest (Manifest (..), loadManifest, saveManifest, schemaVersion)
import Shelf.Remote
import Shelf.Remote.Cli
import Shelf.Remote.Cli.Fetch
import Shelf.Remote.SigV4 (Credentials (..))
import Shelf.Types
import StubServer (LogEntry, withStub)
import System.Directory
  ( copyFile, createDirectoryIfMissing, doesDirectoryExist, doesFileExist
  , getFileSize, listDirectory, removeDirectoryRecursive, removeFile )
import System.Exit (ExitCode (..))
import System.FilePath (takeDirectory, (<.>), (</>))
import System.IO.Temp (withSystemTempDirectory)
import Test.Tasty
import Test.Tasty.HUnit

-- | Not a credential: the stub accepts exactly this pair and nothing ever
-- leaves the loopback interface.
fakeCreds :: Credentials
fakeCreds = Credentials "hip_stubaccesskeyid" "stub-secret-not-a-real-key-000000"

endpointFor :: Int -> Text
endpointFor port = "http://127.0.0.1:" <> T.pack (show port)

cfgFor :: Int -> IO RemoteConfig
cfgFor port =
  mkRemoteConfig (endpointFor port) "cfmm-refs" "decentralized" fakeCreds [0, 0, 0]
    (30 * 1000000) ObjectAcl

-- | @alpha-2020@ carries two topics and @beta-2021@ one, so a full push is
-- three objects over two sources.
withRepo :: (RepoPaths -> IO a) -> IO a
withRepo k = withSystemTempDirectory "shelf-cli" $ \dir -> do
  let rp = repoPaths dir
  createDirectoryIfMissing True (rpPdfs rp)
  createDirectoryIfMissing True (takeDirectory (rpManifest rp))
  a <- mkSource rp "alpha-2020" [Topic "options", Topic "dgp"] "test/fixtures/small-a.pdf"
  b <- mkSource rp "beta-2021" [Topic "options"] "test/fixtures/small-b.pdf"
  saveManifest (rpManifest rp) (Manifest schemaVersion [a, b])
  k rp

mkSource :: RepoPaths -> Text -> [Topic] -> FilePath -> IO Source
mkSource rp name topics fixture = do
  let dest = rpPdfs rp </> T.unpack name <.> "pdf"
  copyFile fixture dest
  sha <- sha256OfFile dest
  n <- getFileSize dest
  pure Source
    { srcCitekey = ck name, srcSha256 = sha, srcBytes = fromIntegral n, srcTitle = name
    , srcAuthors = [], srcYear = Year 2020, srcProvenance = Unsourced, srcTopics = topics
    , srcOrigin = [], srcRemote = Nothing }

mirror :: RepoPaths -> Text -> FilePath
mirror rp name = rpPdfs rp </> T.unpack name <.> "pdf"

sourcesOf :: RepoPaths -> IO [Source]
sourcesOf rp = mfSources . right <$> loadManifest (rpManifest rp)

sourceNamed :: RepoPaths -> Text -> IO Source
sourceNamed rp name = do
  srcs <- sourcesOf rp
  case [s | s <- srcs, srcCitekey s == ck name] of
    (s : _) -> pure s
    [] -> assertFailure ("no such source: " <> T.unpack name)

-- | @verified_at@ is wall-clock, so two runs of the same push differ there and
-- nowhere else; flattening it is what makes the @--jobs@ comparison meaningful.
withoutTimes :: Source -> Source
withoutTimes s = s { srcRemote = flatten <$> srcRemote s }
  where
    flatten r = r { rmObjects = [o { roVerifiedAt = epoch } | o <- rmObjects r] }
    epoch = UTCTime (fromGregorian 2000 1 1) 0

-- | Object PUTs the stub has seen — the bucket's own PUT has no key segment.
objectPuts :: IORef [LogEntry] -> IO Int
objectPuts ref = length . filter isPut <$> readIORef ref
  where isPut (verb, p, _) = verb == "PUT" && p /= "/cfmm-refs"

pushAll :: RepoPaths -> RemoteConfig -> Int -> IO ExitCode
pushAll rp cfg jobs = runPush rp cfg (PushOpts Nothing VerifyGet False jobs)

fetchAll :: RepoPaths -> RemoteConfig -> Bool -> IO ExitCode
fetchAll rp cfg force = runFetch rp cfg (FetchOpts Nothing False force)

tests :: TestTree
tests = testGroup "Shelf.Remote.Cli"
  [ testCase "push uploads one object per (source, topic) and records each verified" $
      withStub fakeCreds $ \port objects _ _ -> withRepo $ \rp -> do
        cfg <- cfgFor port
        pushAll rp cfg 1 >>= (@?= ExitSuccess)
        stored <- M.keys . M.delete "" <$> readIORef objects
        stored @?= [ "topics/dgp/alpha-2020.pdf", "topics/options/alpha-2020.pdf"
                   , "topics/options/beta-2021.pdf" ]
        srcs <- sourcesOf rp
        let objs = concatMap (maybe [] rmObjects . srcRemote) srcs
        length objs @?= 3
        map (fmap rmEndpoint . srcRemote) srcs @?= [Just (endpointFor port), Just (endpointFor port)]
        assertBool "every source is remote-backed" (all isRemoteBacked srcs)
        map roUrl objs @?= [endpointFor port <> "/cfmm-refs/" <> roKey o | o <- objs]
        listDirectory (rpPdfs rp </> ".verify") >>= (@?= [])

  , testCase "a second push uploads nothing" $
      withStub fakeCreds $ \port _ _ requests -> withRepo $ \rp -> do
        cfg <- cfgFor port
        pushAll rp cfg 1 >>= (@?= ExitSuccess)
        before <- objectPuts requests
        before @?= 3
        pushAll rp cfg 1 >>= (@?= ExitSuccess)
        later <- objectPuts requests
        later - before @?= 0

  , testCase "push --dry-run writes nothing, locally or remotely" $
      withStub fakeCreds $ \port objects _ _ -> withRepo $ \rp -> do
        cfg <- cfgFor port
        before <- BS.readFile (rpManifest rp)
        runPush rp cfg (PushOpts Nothing VerifyGet True 1) >>= (@?= ExitSuccess)
        BS.readFile (rpManifest rp) >>= (@?= before)
        readIORef objects >>= \m -> M.keys m @?= []
        doesDirectoryExist (rpPdfs rp </> ".verify") >>= (@?= False)

  , testCase "push --jobs 2 leaves the same manifest as --jobs 1" $
      withStub fakeCreds $ \port _ _ _ -> withRepo $ \one -> withRepo $ \two -> do
        cfg <- cfgFor port
        pushAll one cfg 1 >>= (@?= ExitSuccess)
        pushAll two cfg 2 >>= (@?= ExitSuccess)
        serial <- map withoutTimes <$> sourcesOf one
        parallel <- map withoutTimes <$> sourcesOf two
        parallel @?= serial

  , testCase "push skips a source whose mirror file is missing and fails nothing" $
      withStub fakeCreds $ \port objects _ _ -> withRepo $ \rp -> do
        cfg <- cfgFor port
        removeFile (mirror rp "beta-2021")
        pushAll rp cfg 1 >>= (@?= ExitSuccess)
        stored <- M.keys . M.delete "" <$> readIORef objects
        stored @?= ["topics/dgp/alpha-2020.pdf", "topics/options/alpha-2020.pdf"]

  , testCase "fetch restores a deleted mirror file" $
      withStub fakeCreds $ \port _ _ _ -> withRepo $ \rp -> do
        cfg <- cfgFor port
        pushAll rp cfg 1 >>= (@?= ExitSuccess)
        alpha <- sourceNamed rp "alpha-2020"
        removeFile (mirror rp "alpha-2020")
        fetchAll rp cfg False >>= (@?= ExitSuccess)
        sha <- sha256OfFile (mirror rp "alpha-2020")
        sha @?= srcSha256 alpha

  , testCase "fetch recreates pdfs/ when the whole mirror is gone" $
      withStub fakeCreds $ \port _ _ _ -> withRepo $ \rp -> do
        cfg <- cfgFor port
        pushAll rp cfg 1 >>= (@?= ExitSuccess)
        srcs <- sourcesOf rp
        removeDirectoryRecursive (rpPdfs rp)
        fetchAll rp cfg False >>= (@?= ExitSuccess)
        shas <- mapM (sha256OfFile . mirror rp . citekeyText . srcCitekey) srcs
        shas @?= map srcSha256 srcs

  , testCase "fetch refuses a mismatched mirror file, and --force displaces it" $
      withStub fakeCreds $ \port _ _ _ -> withRepo $ \rp -> do
        cfg <- cfgFor port
        pushAll rp cfg 1 >>= (@?= ExitSuccess)
        alpha <- sourceNamed rp "alpha-2020"
        BS.writeFile (mirror rp "alpha-2020") "not the pdf"
        fetchAll rp cfg False >>= (@?= ExitFailure 1)
        BS.readFile (mirror rp "alpha-2020") >>= (@?= "not the pdf")
        fetchAll rp cfg True >>= (@?= ExitSuccess)
        sha256OfFile (mirror rp "alpha-2020") >>= (@?= srcSha256 alpha)
        displaced <- sort <$> listDirectory (rpPdfs rp </> ".displaced")
        case displaced of
          [only] -> BS.readFile (rpPdfs rp </> ".displaced" </> only) >>= (@?= "not the pdf")
          other -> assertFailure ("expected one displaced file, saw " <> show other)

  , testCase "fetch leaves an up-to-date mirror file alone" $
      withStub fakeCreds $ \port _ _ requests -> withRepo $ \rp -> do
        cfg <- cfgFor port
        pushAll rp cfg 1 >>= (@?= ExitSuccess)
        before <- length <$> readIORef requests
        fetchAll rp cfg False >>= (@?= ExitSuccess)
        later <- length <$> readIORef requests
        later @?= before

  , testCase "fetch --dry-run writes nothing" $
      withStub fakeCreds $ \port _ _ _ -> withRepo $ \rp -> do
        cfg <- cfgFor port
        pushAll rp cfg 1 >>= (@?= ExitSuccess)
        removeFile (mirror rp "alpha-2020")
        runFetch rp cfg (FetchOpts Nothing True False) >>= (@?= ExitSuccess)
        doesFileExist (mirror rp "alpha-2020") >>= (@?= False)

  , testCase "--expires accepts Ns/Nm/Nh/Nd and nothing else" $ do
      parseDuration "45s" @?= Right 45
      parseDuration "5m" @?= Right 300
      parseDuration "2h" @?= Right 7200
      parseDuration "3d" @?= Right 259200
      assertBool "a bare number is refused" (either (const True) (const False) (parseDuration "600"))
      assertBool "an unknown unit is refused" (either (const True) (const False) (parseDuration "5w"))

  , testCase "an expiry is clamped into S3's one-week window" $ do
      clampExpires 3600 @?= 3600
      clampExpires 604800 @?= 604800
      clampExpires 999999 @?= 604800
      clampExpires 0 @?= 1
  ]
