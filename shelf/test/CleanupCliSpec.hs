-- | @shelf cleanup@'s wiring: the option grammar (a repeatable
-- @--allow-repo@ included), the two "confirm before it can hurt" refusals
-- 'Shelf.Cleanup.Cli.runCleanup' must raise before touching the manifest or
-- the log, and a plain dry run over a source whose duplicate origin sits
-- under a temporary @$HOME@.
module CleanupCliSpec (tests) where

import Control.Exception (finally)
import Data.List (isInfixOf)
import qualified Data.Text as T
import Data.Time (UTCTime (..), fromGregorian, secondsToDiffTime)
import GHC.IO.Handle (hDuplicate, hDuplicateTo)
import Options.Applicative (ParserResult (..), defaultPrefs, execParserPure, fullDesc, info)
import System.Directory (canonicalizePath, createDirectoryIfMissing, doesFileExist)
import System.Environment (lookupEnv, setEnv, unsetEnv)
import System.Exit (ExitCode (..))
import System.FilePath (takeDirectory, (</>))
import System.IO (IOMode (WriteMode), hClose, hFlush, stdout, withFile)
import System.IO.Temp (withSystemTempDirectory, withSystemTempFile)
import Test.Tasty
import Test.Tasty.HUnit

import Fixture (ck, right)
import Shelf.Apply.Paths (RepoPaths (..), repoPaths)
import Shelf.Cleanup (cleanupLogPath)
import Shelf.Cleanup.Cli (CleanupOpts (..), cleanupOptsP, runCleanup)
import Shelf.Manifest (Manifest (..), saveManifest, schemaVersion)
import Shelf.Remote (sha256OfFile)
import Shelf.Types

-- --------------------------------------------------------------- parsing

noFlags :: CleanupOpts
noFlags = CleanupOpts
  { coExecute = False, coYes = False, coOffline = False
  , coIncludeUnsourced = False, coAcceptTwoCopies = False, coAllowRepos = [] }

parseArgs :: [String] -> Maybe CleanupOpts
parseArgs args = case execParserPure defaultPrefs (info cleanupOptsP fullDesc) args of
  Success o -> Just o
  _ -> Nothing

-- ------------------------------------------------------------------ fixtures

t0 :: UTCTime
t0 = UTCTime (fromGregorian 2026 8 26) (secondsToDiffTime 0)

options :: Topic
options = right (mkTopic "options")

-- | A remote-backed, arXiv-provenance source with a single origin — enough
-- for 'Shelf.Cleanup.candidates' to keep it and for every conjunct but the
-- git one to pass offline.
mkSrc :: T.Text -> Sha256 -> Int -> FilePath -> Source
mkSrc key hash bytes origin = Source
  { srcCitekey = ck key, srcSha256 = hash, srcBytes = bytes, srcTitle = "T"
  , srcAuthors = ["A"], srcYear = Year 2020, srcProvenance = ArXiv "1"
  , srcTopics = [options], srcOrigin = [origin]
  , srcRemote = Just (Remote "https://s3.example" "buck" [obj]) }
  where
    obj = RemoteObject
      { roTopic = options, roKey = objectKey options (ck key), roUrl = "u"
      , roEtag = "e", roVerifiedSha256 = hash, roVerifiedAt = t0 }

-- | What a call prints to stdout, restoring the original handle whether or
-- not the action throws. There is no capture library among the test
-- dependencies, so this dups the fd the way one would.
captureStdout :: IO a -> IO (a, String)
captureStdout act = withSystemTempFile "cleanup-cli-stdout" $ \path h -> do
  hClose h
  a <- withFile path WriteMode $ \sink -> do
    old <- hDuplicate stdout
    hDuplicateTo sink stdout
    act `finally` (hFlush stdout >> hDuplicateTo old stdout >> hClose old)
  out <- readFile path
  pure (a, out)

-- | Run @act@ with @$HOME@ pointed at @home@, restoring whatever @$HOME@ was
-- (or wasn't) set to first.
withHomeEnv :: FilePath -> IO a -> IO a
withHomeEnv home act = do
  old <- lookupEnv "HOME"
  setEnv "HOME" home
  act `finally` maybe (unsetEnv "HOME") (setEnv "HOME") old

-- | Run @act@ with neither Hippius credential set, so a dry run takes the
-- "no credentials" path deterministically regardless of the ambient
-- environment.
withoutHippiusCreds :: IO a -> IO a
withoutHippiusCreds act = do
  key <- lookupEnv "HIPPIUS_ACCESS_KEY_ID"
  secret <- lookupEnv "HIPPIUS_SECRET_ACCESS_KEY"
  unsetEnv "HIPPIUS_ACCESS_KEY_ID"
  unsetEnv "HIPPIUS_SECRET_ACCESS_KEY"
  act `finally` (restore "HIPPIUS_ACCESS_KEY_ID" key >> restore "HIPPIUS_SECRET_ACCESS_KEY" secret)
  where restore name = maybe (unsetEnv name) (setEnv name)

-- ------------------------------------------------------------------- tests

tests :: TestTree
tests = testGroup "CleanupCli"
  [ testGroup "option parsing"
    [ testCase "no flags" $ parseArgs [] @?= Just noFlags
    , testCase "every flag, --allow-repo repeated" $
        parseArgs
          [ "--execute", "--yes", "--offline", "--include-unsourced", "--i-accept-two-copies"
          , "--allow-repo", "/a", "--allow-repo", "/b" ]
        @?= Just noFlags
              { coExecute = True, coYes = True, coOffline = True
              , coIncludeUnsourced = True, coAcceptTwoCopies = True
              , coAllowRepos = ["/a", "/b"] }
    ]
  , testGroup "validation before any IO"
    [ testCase "--execute without --yes fails and writes no log" $
        withSystemTempDirectory "shelf-cleanup-cli" $ \tmp -> do
          let rp = repoPaths (tmp </> "cfmm-refs")
          code <- runCleanup rp noFlags { coExecute = True }
          code @?= ExitFailure 1
          logged <- doesFileExist (cleanupLogPath rp)
          logged @?= False
    , testCase "--include-unsourced without --i-accept-two-copies fails" $
        withSystemTempDirectory "shelf-cleanup-cli" $ \tmp -> do
          let rp = repoPaths (tmp </> "cfmm-refs")
          code <- runCleanup rp noFlags { coIncludeUnsourced = True }
          code @?= ExitFailure 1
    ]
  , testCase "dry run lists a duplicate origin found under a temp $HOME" $
      withSystemTempDirectory "shelf-cleanup-cli" $ \tmp -> do
        home <- canonicalizePath tmp
        let rp = repoPaths (home </> "cfmm-refs")
            mirror = rpPdfs rp </> "alpha-2020.pdf"
            origin = home </> "papers" </> "dup.pdf"
        createDirectoryIfMissing True (rpPdfs rp)
        createDirectoryIfMissing True (takeDirectory origin)
        writeFile mirror "%PDF-1.4 alpha"
        writeFile origin "%PDF-1.4 alpha"
        hash <- sha256OfFile mirror
        n <- length <$> readFile mirror
        createDirectoryIfMissing True (takeDirectory (rpManifest rp))
        saveManifest (rpManifest rp) (Manifest schemaVersion [mkSrc "alpha-2020" hash n "papers/dup.pdf"])
        (code, out) <- withoutHippiusCreds $ withHomeEnv home $
          captureStdout (runCleanup rp noFlags)
        code @?= ExitSuccess
        assertBool ("table names " <> origin <> "; got:\n" <> out) (origin `isInfixOf` out)
  ]
