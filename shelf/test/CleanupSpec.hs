-- | The cleanup guard: the pure classifier (property + table), the planner
-- (golden table over a temp tree that carries one file per spec §6 case) and
-- the executor (two log events per action, and an abort on drift).
module CleanupSpec (tests) where

import Control.Monad (forM, forM_, void, unless)
import qualified Data.ByteString as BS
import qualified Data.ByteString.Char8 as BC
import qualified Data.ByteString.Lazy as BL
import Data.List (sortOn)
import Data.Maybe (isJust)
import qualified Data.Set as S
import Data.Text (Text)
import qualified Data.Text as T
import qualified Data.Text.Encoding as TE
import Data.Time (UTCTime (..), fromGregorian, secondsToDiffTime)
import System.Directory
  (canonicalizePath, createDirectoryIfMissing, doesFileExist, removeFile)
import System.Exit (ExitCode (..))
import System.Environment (getEnvironment)
import System.FilePath (makeRelative, takeDirectory, (</>))
import System.IO.Temp (withSystemTempDirectory)
import System.Posix.Files (createLink, createSymbolicLink)
import System.Process.Typed (proc, readProcess, setEnv)
import Test.Tasty
import Test.Tasty.Golden (goldenVsString)
import Test.Tasty.HUnit
import Test.Tasty.Hedgehog (testProperty)
import Hedgehog hiding (assert, classify)
import qualified Hedgehog.Gen as Gen

import Fixture (ck, right, sh)
import Shelf.Apply.Paths (RepoPaths (..), repoPaths)
import Shelf.Cleanup
import Shelf.Cleanup.Facts
import Shelf.Cleanup.Log
import Shelf.Manifest (Manifest (..), schemaVersion)
import Shelf.Remote.Http (sha256OfFile)
import Shelf.Types

-- ---------------------------------------------------------------- fixtures

t0 :: UTCTime
t0 = UTCTime (fromGregorian 2026 8 26) (secondsToDiffTime 0)

options :: Topic
options = right (mkTopic "options")

-- | A remote-backed source: one verified object for its single topic, so
-- 'isRemoteBacked' holds and conjunct 3 passes offline.
mkSrc :: Text -> Sha256 -> Int -> Provenance -> [FilePath] -> Source
mkSrc key hash bytes prov origins = Source
  { srcCitekey = ck key, srcSha256 = hash, srcBytes = bytes, srcTitle = "T"
  , srcAuthors = ["A"], srcYear = Year 2020, srcProvenance = prov
  , srcTopics = [options], srcOrigin = origins
  , srcRemote = Just (Remote "https://s3.example" "buck" [obj]) }
  where
    obj = RemoteObject
      { roTopic = options, roKey = objectKey options (ck key), roUrl = "u"
      , roEtag = "e", roVerifiedSha256 = hash, roVerifiedAt = t0 }

srcA :: Source
srcA = mkSrc "alpha-2020" (sh 'a') 9 (ArXiv "1") ["papers/a.pdf"]

allowedRepos :: [FilePath]
allowedRepos = ["/r/one", "/r/two"]

-- | Every conjunct satisfied, git says untracked: the row that must DELETE.
passing :: Facts
passing = Facts
  { fPath = "/h/papers/a.pdf", fInShelfCheckout = False, fSameInodeAsMirror = False
  , fIsRegular = True, fIsSymlink = False, fSha = Just (sh 'a'), fSource = Just srcA
  , fRemoteBacked = True, fLive = NotRequired, fMirrorMatches = True
  , fUnderOtherShelf = False, fProvenanceAllowed = True
  , fGit = UntrackedOrIgnored "/r/one" }

genFacts :: Gen Facts
genFacts = do
  inShelf <- Gen.bool; inode <- Gen.bool; regular <- Gen.bool; symlink <- Gen.bool
  hash <- Gen.maybe (pure (sh 'a')); source <- Gen.maybe (pure srcA)
  backed <- Gen.bool
  live <- Gen.element [NotRequired, Verified, Failed "boom"]
  mirror <- Gen.bool; other <- Gen.bool; prov <- Gen.bool
  gitFacts <- Gen.choice
    [ pure NotInRepo
    , Tracked <$> genTop <*> Gen.bool <*> Gen.bool
    , UntrackedOrIgnored <$> genTop ]
  pure passing
    { fInShelfCheckout = inShelf, fSameInodeAsMirror = inode, fIsRegular = regular
    , fIsSymlink = symlink, fSha = hash, fSource = source, fRemoteBacked = backed
    , fLive = live, fMirrorMatches = mirror, fUnderOtherShelf = other
    , fProvenanceAllowed = prov, fGit = gitFacts }
  where genTop = Gen.element ["/r/one", "/r/two", "/r/three"]

-- | The eight conjuncts of spec §6, restated independently of 'classify'.
conjuncts :: [FilePath] -> Facts -> [Bool]
conjuncts allowed f =
  [ not (fInShelfCheckout f) && not (fSameInodeAsMirror f)
  , fIsRegular f && not (fIsSymlink f)
  , isJust (fSha f) && isJust (fSource f)
  , fRemoteBacked f && liveOk (fLive f)
  , fMirrorMatches f
  , not (fUnderOtherShelf f)
  , fProvenanceAllowed f
  , gitOk (fGit f) ]
  where
    liveOk = \case Failed _ -> False; _ -> True
    gitOk = \case
      NotInRepo -> True
      UntrackedOrIgnored _ -> True
      Tracked top clean indexClean -> top `elem` allowed && clean && indexClean

-- ------------------------------------------------------------- git helpers

git :: FilePath -> [String] -> IO ()
git dir args = do
  base <- getEnvironment
  let isolated =
        [("GIT_CONFIG_GLOBAL", "/dev/null"), ("GIT_CONFIG_SYSTEM", "/dev/null")]
          <> filter ((`notElem` ["GIT_CONFIG_GLOBAL", "GIT_CONFIG_SYSTEM"]) . fst) base
  (code, _, err) <- readProcess (setEnv isolated (proc "git" ("-C" : dir : args)))
  unless (code == ExitSuccess) $
    assertFailure ("git " <> unwords args <> " in " <> dir <> ": " <> show err)

initRepo :: FilePath -> IO ()
initRepo dir = do
  createDirectoryIfMissing True dir
  git dir ["init", "-q", "."]
  forM_ [("user.email", "t@e.invalid"), ("user.name", "t"), ("commit.gpgsign", "false")] $
    \(k, v) -> git dir ["config", k, v]

commitPaths :: FilePath -> [String] -> IO ()
commitPaths dir paths = git dir ("add" : paths) >> git dir ["commit", "-q", "-m", "seed"]

porcelain :: FilePath -> IO String
porcelain dir = do
  base <- getEnvironment
  (_, out, _) <- readProcess (setEnv base (proc "git" ["-C", dir, "status", "--porcelain"]))
  pure (BC.unpack (BL.toStrict out))

place :: FilePath -> String -> IO (Sha256, Int)
place p body = do
  createDirectoryIfMissing True (takeDirectory p)
  let bytes = BC.pack ("%PDF-1.4 " <> body)
  BS.writeFile p bytes
  hash <- sha256OfFile p
  pure (hash, BS.length bytes)

-- ---------------------------------------------------------------- the tree

-- | One row per spec §6 golden case, plus the mirror-inode and
-- provenance guards. @cfmm-refs@ is the invoking checkout.
goldenSources :: [(Text, FilePath, Provenance)]
goldenSources =
  [ ("alpha-2020",   "cfmm-refs/test/fixtures/headers.pdf", ArXiv "1")
  , ("bravo-2020",   "fakeshelf/dup.pdf",                   ArXiv "2")
  , ("charlie-2020", "loose/loose.pdf",                     ArXiv "3")
  , ("delta-2020",   "loose/unsourced.pdf",                 Unsourced)
  , ("echo-2020",    "outer/inner/nested.pdf",              ArXiv "5")
  , ("foxtrot-2020", "papers/hardlink.pdf",                 ArXiv "6")
  , ("golf-2020",    "papers/link.pdf",                     ArXiv "7")
  , ("hotel-2020",   "repoDirty/dirty.pdf",                 ArXiv "8")
  , ("india-2020",   "repoOther/other.pdf",                 ArXiv "9")
  , ("juliett-2020", "repoTracked/tracked.pdf",             ArXiv "10")
  , ("kilo-2020",    "repoTracked/untracked.pdf",           ArXiv "11")
  ]

setupGolden :: FilePath -> IO (Manifest, [FilePath])
setupGolden root = do
  sources <- forM goldenSources $ \(key, rel, prov) -> do
    let mirror = root </> "cfmm-refs" </> "pdfs" </> T.unpack key <> ".pdf"
        origin = root </> rel
        body = T.unpack key
    (hash, n) <- place mirror body
    createDirectoryIfMissing True (takeDirectory origin)
    case key of
      -- The mirror itself, reached by a second name: conjunct 0's inode guard.
      "foxtrot-2020" -> createLink mirror origin
      "golf-2020" -> void (place (root </> "papers" </> "real.pdf") body)
                       >> createSymbolicLink "real.pdf" origin
      _ -> void (place origin body)
    pure (mkSrc key hash n prov [rel])
  initRepo (root </> "fakeshelf")
  git (root </> "fakeshelf") ["remote", "add", "origin", "https://example/cfmm-refs.git"]
  initRepo (root </> "outer")
  initRepo (root </> "outer" </> "inner")
  commitPaths (root </> "outer" </> "inner") ["nested.pdf"]
  initRepo (root </> "repoDirty")
  commitPaths (root </> "repoDirty") ["dirty.pdf"]
  writeFile (root </> "repoDirty" </> "staged.txt") "x"
  git (root </> "repoDirty") ["add", "staged.txt"]
  initRepo (root </> "repoOther")
  commitPaths (root </> "repoOther") ["other.pdf"]
  initRepo (root </> "repoTracked")
  commitPaths (root </> "repoTracked") ["tracked.pdf"]
  allowed <- mapM canonicalizePath
    [root </> "outer", root </> "repoDirty", root </> "repoTracked"]
  pure (Manifest schemaVersion sources, allowed)

renderPlan :: FilePath -> [(Facts, Decision)] -> BL.ByteString
renderPlan root rows = BL.fromStrict (TE.encodeUtf8 (T.unlines
  [ T.pack (makeRelative root (fPath f)) <> ": " <> relativise (renderDecision d)
  | (f, d) <- sortOn (fPath . fst) rows ]))
  where relativise = T.replace (T.pack root <> "/") ""

-- --------------------------------------------------------------- execution

setupExec :: FilePath -> IO (RepoPaths, Manifest, [FilePath])
setupExec root = do
  sources <- forM [("mike-2020", "loose/gone.pdf"), ("november-2020", "repo/tracked.pdf")] $
    \(key, rel) -> do
      let mirror = root </> "cfmm-refs" </> "pdfs" </> T.unpack key <> ".pdf"
      (hash, n) <- place mirror (T.unpack key)
      _ <- place (root </> rel) (T.unpack key)
      pure (mkSrc key hash n (ArXiv "x") [rel])
  createDirectoryIfMissing True (root </> "cfmm-refs" </> "manifest")
  initRepo (root </> "repo")
  commitPaths (root </> "repo") ["tracked.pdf"]
  repo <- canonicalizePath (root </> "repo")
  pure (repoPaths (root </> "cfmm-refs"), Manifest schemaVersion sources, [repo])

-- ------------------------------------------------------------------- tests

tests :: TestTree
tests = testGroup "Cleanup"
  [ testGroup "classify"
    [ testProperty "an action is taken exactly when all eight conjuncts hold" $ property $ do
        f <- forAll genFacts
        and (conjuncts allowedRepos f) === isAction (classify allowedRepos f)
    , testProperty "the git conjunct decides the shape of the action" $ property $ do
        g <- forAll (Gen.choice
          [ pure NotInRepo
          , Tracked <$> Gen.element ["/r/one", "/r/three"] <*> Gen.bool <*> Gen.bool
          , UntrackedOrIgnored <$> Gen.element ["/r/one", "/r/three"] ])
        let expected = case g of
              NotInRepo -> Delete
              UntrackedOrIgnored _ -> Delete
              Tracked top clean indexClean
                | top `notElem` allowedRepos -> Skip (TrackedIn top)
                | not indexClean -> Skip RepoIndexDirty
                | not clean -> Skip PathDirty
                | otherwise -> GitRm top
        classify allowedRepos passing { fGit = g } === expected
    , testCase "an all-passing row deletes" $
        classify allowedRepos passing @?= Delete
    , testCase "NotRequired satisfies the live conjunct" $
        classify allowedRepos passing { fLive = NotRequired } @?= Delete
    , testCase "Verified satisfies the live conjunct" $
        classify allowedRepos passing { fLive = Verified } @?= Delete
    , testGroup "one broken conjunct at a time"
      [ testCase name (classify allowedRepos f @?= Skip reason)
      | (name, f, reason) <-
        [ ("0 inside the shelf checkout", passing { fInShelfCheckout = True }, ShelfCheckout)
        , ("0 same inode as the mirror", passing { fSameInodeAsMirror = True }, MirrorInode)
        , ("1 not a regular file", passing { fIsRegular = False }, NotRegular)
        , ("1 a symlink", passing { fIsSymlink = True }, NotRegular)
        , ("2 hash not in the manifest", passing { fSha = Nothing }, ShaUnknown)
        , ("2 no matching source", passing { fSource = Nothing }, ShaUnknown)
        , ("3 not remote backed", passing { fRemoteBacked = False }, NotRemoteBacked)
        , ("3 live HEAD failed", passing { fLive = Failed "418" }, LiveHeadFailed "418")
        , ("4 mirror absent or different", passing { fMirrorMatches = False }, MirrorMissing)
        , ("5 under another shelf checkout", passing { fUnderOtherShelf = True }, OtherShelf)
        , ("6 provenance excluded", passing { fProvenanceAllowed = False }, ProvenanceExcluded)
        , ("7 tracked in a repo not allowed", passing { fGit = Tracked "/r/three" True True }, TrackedIn "/r/three")
        , ("7 repo index dirty", passing { fGit = Tracked "/r/one" True False }, RepoIndexDirty)
        , ("7 path dirty", passing { fGit = Tracked "/r/one" False True }, PathDirty)
        ] ]
    ]
  , testGroup "candidates"
    [ testCase "origins resolve against home, dedup, and refuse .git and escapes" $ do
        let s1 = mkSrc "alpha-2020" (sh 'a') 9 (ArXiv "1") ["papers/a.pdf", "papers/a.pdf"]
            s2 = mkSrc "bravo-2020" (sh 'b') 9 (ArXiv "2")
              ["/elsewhere/b.pdf", ".git/modules/x/b.pdf", "/home/u/papers/b.pdf"]
            (keep, skip) = candidates (Manifest schemaVersion [s1, s2]) "/home/u"
        map fst keep @?= ["/home/u/papers/a.pdf", "/home/u/papers/b.pdf"]
        skip @?= [("/elsewhere/b.pdf", UnresolvableBase), ("/home/u/.git/modules/x/b.pdf", GitInternal)]
    ]
  , goldenVsString "dry-run table over the spec's eight cases"
      "test/fixtures/cleanup-plan.golden" $
      withSystemTempDirectory "shelf-cleanup" $ \tmp -> do
        root <- canonicalizePath tmp
        (manifest, allowed) <- setupGolden root
        let rp = repoPaths (root </> "cfmm-refs")
        renderPlan root <$> planCleanup rp root manifest Nothing defaultProvSet allowed False
  , testCase "execute deletes, git-rms and logs a pending and a done per action" $
      withSystemTempDirectory "shelf-exec" $ \tmp -> do
        root <- canonicalizePath tmp
        (rp, manifest, allowed) <- setupExec root
        plan <- planCleanup rp root manifest Nothing defaultProvSet allowed False
        map snd plan @?= [Delete, GitRm (root </> "repo")]
        code <- executeCleanup rp root
          (gatherFacts rp manifest Nothing defaultProvSet False) allowed plan
        code @?= ExitSuccess
        gone <- doesFileExist (root </> "loose" </> "gone.pdf")
        tracked <- doesFileExist (root </> "repo" </> "tracked.pdf")
        (gone, tracked) @?= (False, False)
        status <- porcelain (root </> "repo")
        status @?= "D  tracked.pdf\n"
        events <- readEvents (cleanupLogPath rp)
        map leStatus events @?= ["pending", "done", "pending", "done"]
        map leAction events @?= ["delete", "delete", "git-rm", "git-rm"]
        map lePath events @?= ["loose/gone.pdf", "loose/gone.pdf", "repo/tracked.pdf", "repo/tracked.pdf"]
        map leRepo events @?= [Nothing, Nothing, Just "repo", Just "repo"]
        S.size (S.fromList (map leKey events)) @?= 2
        readPending (cleanupLogPath rp) >>= \p -> map leKey p @?= []
  , testCase "a decision that drifts since the plan aborts the run" $
      withSystemTempDirectory "shelf-drift" $ \tmp -> do
        root <- canonicalizePath tmp
        (rp, manifest, allowed) <- setupExec root
        plan <- planCleanup rp root manifest Nothing defaultProvSet allowed False
        let drifted p s = do
              f <- gatherFacts rp manifest Nothing defaultProvSet False p s
              pure f { fMirrorMatches = False }
        code <- executeCleanup rp root drifted allowed plan
        code @?= ExitFailure 2
        gone <- doesFileExist (root </> "loose" </> "gone.pdf")
        tracked <- doesFileExist (root </> "repo" </> "tracked.pdf")
        (gone, tracked) @?= (True, True)
        logged <- doesFileExist (cleanupLogPath rp)
        logged @?= False
  , testCase "readPending reports a crash between pending and done" $
      withSystemTempDirectory "shelf-log" $ \tmp -> do
        let logPath = tmp </> "manifest" </> "cleanup-log.yaml"
            event key status = LogEvent
              { leKey = key, lePath = "papers/a.pdf", leSha = sh 'a', leCitekey = ck "alpha-2020"
              , leAction = "delete", leRepo = Nothing, leObjects = ["topics/options/alpha-2020.pdf"]
              , leStatus = status, leAt = t0 }
        mapM_ (appendEvent logPath)
          [event "a|1" "pending", event "a|1" "done", event "b|2" "pending"]
        pending <- readPending logPath
        map leKey pending @?= ["b|2"]
        all4 <- readEvents logPath
        length all4 @?= 3
        removeFile logPath
        readPending logPath >>= \p -> length p @?= 0
  , testCase "homeRelative strips the home prefix and leaves anything else alone" $ do
      homeRelative "/home/u" "/home/u/papers/a.pdf" @?= "papers/a.pdf"
      homeRelative "/home/u" "/srv/a.pdf" @?= "/srv/a.pdf"
  ]
