-- | The git side of conjuncts 5 and 7, and the removal that conjunct 7 may
-- authorise. Four rules hold for every invocation here:
--
-- * @--literal-pathspecs@, so a candidate whose name contains @*@, @?@ or a
--   leading @:@ is never read as a pattern. It is a main-command option, not
--   a subcommand one, so it precedes @-C@.
-- * @GIT_DIR@, @GIT_WORK_TREE@ and @GIT_INDEX_FILE@ are dropped from the
--   child's environment: inherited from a hook or a rebase they would point
--   every probe at a repository that has nothing to do with the candidate.
-- * Every exit code is read. The only failure that means \"this file is in no
--   repository\" is @rev-parse@ exiting 128 with @not a git repository@;
--   anything else — git missing from @PATH@, a corrupt index, an unreadable
--   object store — is 'GitUnknown', which conjunct 7 refuses. A probe that
--   cannot answer must cost a delete, never buy one.
-- * @git rm@ is the only call that writes, and its failure is the caller's to
--   handle: it throws.
--
-- 'repoTop' is memoised for the life of the process because repository
-- topology does not move under a run, and the plan asks it once per candidate
-- directory. Nothing that a delete could invalidate is cached, and failures
-- are cached too — a git that is missing at the start of a run is missing at
-- the end of it.
module Shelf.Cleanup.Git
  ( RepoRoot (..)
  , probeEnvironment
  , runGit
  , repoTop
  , repoTopWith
  , isShelfRemote
  , batchProbe
  , batchProbeWith
  , gitRm
  ) where

import Control.Exception (SomeException, try)
import qualified Data.ByteString.Lazy as BL
import Data.IORef (IORef, atomicModifyIORef', newIORef, readIORef)
import Data.Map.Strict (Map)
import qualified Data.Map.Strict as M
import Data.Maybe (fromMaybe, listToMaybe)
import qualified Data.Set as S
import Data.Text (Text)
import qualified Data.Text as T
import qualified Data.Text.Encoding as TE
import System.Directory (canonicalizePath, findExecutablesInDirectories)
import System.Environment (getEnvironment)
import System.Exit (ExitCode (..))
import System.FilePath (makeRelative, normalise, splitSearchPath)
import System.IO.Unsafe (unsafePerformIO)
import System.Process.Typed (proc, readProcess, setEnv)

import Shelf.Cleanup.Facts (GitFacts (..))

-- | What 'repoTop' found. 'NoRepo' is the *positive* answer that the path is
-- outside any repository; 'RepoUnknown' is the absence of an answer.
data RepoRoot = NoRepo | RepoRoot FilePath | RepoUnknown Text
  deriving stock (Eq, Show)

-- | The environment probes run in. Exposed so a test can hand 'repoTopWith'
-- and 'batchProbeWith' a @PATH@ with no git on it and see the classifier
-- refuse rather than delete.
probeEnvironment :: IO [(String, String)]
probeEnvironment = filter ((`notElem` inherited) . fst) <$> getEnvironment
  where inherited = ["GIT_DIR", "GIT_WORK_TREE", "GIT_INDEX_FILE"]

-- | Run git in @dir@ and hand back its exit code, stdout and stderr as text.
-- Exposed so "Shelf.Migrate" can ask its own question of git under the same
-- four rules, rather than growing a second, laxer way to spawn one.
-- The binary is resolved against @env@'s own @PATH@ rather than the parent's
-- — @System.Process@ would otherwise search the parent's, which makes the
-- environment this claims to run under a fiction. A git that cannot be found,
-- or cannot be spawned, is reported as exit 127 carrying the reason, which is
-- a probe failure like any other.
runGit :: [(String, String)] -> FilePath -> [String] -> IO (ExitCode, Text, Text)
runGit env dir args = gitBinary env >>= \case
  Nothing -> pure (ExitFailure 127, "", "git was not found on PATH")
  Just binary -> do
    outcome <- try (readProcess (setEnv env (proc binary (["--literal-pathspecs", "-C", dir] <> args))))
    pure $ case outcome of
      Left e -> (ExitFailure 127, "", T.pack (show (e :: SomeException)))
      Right (code, out, err) -> (code, decode out, decode err)
  where decode = TE.decodeUtf8Lenient . BL.toStrict

gitBinary :: [(String, String)] -> IO (Maybe FilePath)
gitBinary env =
  listToMaybe <$> findExecutablesInDirectories (maybe [] splitSearchPath (lookup "PATH" env)) "git"

-- | @git \<what\> in \<dir\> exited \<n\>: \<stderr\>@, the text a
-- 'GitUnknown' or a 'RepoUnknown' carries.
failure :: FilePath -> String -> ExitCode -> Text -> Text
failure dir what code err = T.unwords
  [ "git", T.pack what, "in", T.pack dir, "exited", T.pack (show (exitInt code))
  , T.unwords (T.words (T.take 200 err)) ]
  where exitInt = \case ExitSuccess -> 0 :: Int; ExitFailure n -> n

{-# NOINLINE topCache #-}
topCache :: IORef (Map FilePath RepoRoot)
topCache = unsafePerformIO (newIORef M.empty)

-- | The toplevel of the repository containing @dir@, canonicalised so it can
-- be compared with a canonicalised @--allow-repo@ entry.
repoTop :: FilePath -> IO RepoRoot
repoTop dir = do
  cached <- M.lookup dir <$> readIORef topCache
  case cached of
    Just hit -> pure hit
    Nothing -> do
      env <- probeEnvironment
      found <- repoTopWith env dir
      atomicModifyIORef' topCache (\m -> (M.insert dir found m, ()))
      pure found

-- | 'repoTop' against an explicit environment and without the cache.
repoTopWith :: [(String, String)] -> FilePath -> IO RepoRoot
repoTopWith env dir = do
  (code, out, err) <- runGit env dir ["rev-parse", "--show-toplevel"]
  case code of
    ExitSuccess | not (T.null (T.strip out)) -> RepoRoot <$> canonicalizePath (T.unpack (T.strip out))
    ExitFailure 128 | "not a git repository" `T.isInfixOf` err -> pure NoRepo
    _ -> pure (RepoUnknown (failure dir "rev-parse" code err))

{-# NOINLINE remoteCache #-}
remoteCache :: IORef (Map FilePath (Either Text Bool))
remoteCache = unsafePerformIO (newIORef M.empty)

-- | Conjunct 5: does @top@ look like another checkout of this shelf? The test
-- is on the @origin@ and @upstream@ URLs, which is a heuristic and is treated
-- as one — it is a second line of defence behind conjunct 0's identity check,
-- never the only thing standing between a clone and a delete. A remote that
-- is simply not configured is exit 2, which is an answer (\"no such remote\")
-- and not a failure; anything else is 'Left'.
isShelfRemote :: FilePath -> IO (Either Text Bool)
isShelfRemote top = do
  cached <- M.lookup top <$> readIORef remoteCache
  case cached of
    Just hit -> pure hit
    Nothing -> do
      env <- probeEnvironment
      answer <- probe env ["origin", "upstream"]
      atomicModifyIORef' remoteCache (\m -> (M.insert top answer m, ()))
      pure answer
  where
    probe _ [] = pure (Right False)
    probe env (name : rest) = urlOf env name >>= \case
      Left why -> pure (Left why)
      Right (Just url) | looksLikeShelf url -> pure (Right True)
      Right _ -> probe env rest
    urlOf env name = do
      (code, out, err) <- runGit env top ["remote", "get-url", name]
      pure $ case code of
        ExitSuccess -> Right (Just (T.strip out))
        ExitFailure 2 -> Right Nothing
        ExitFailure 128 | "No such remote" `T.isInfixOf` err -> Right Nothing
        _ -> Left (failure top ("remote get-url " <> name) code err)
    looksLikeShelf url =
      let bare = T.dropWhileEnd (== '/') url
          stem = fromMaybe bare (T.stripSuffix ".git" bare)
      in "/cfmm-refs" `T.isSuffixOf` stem || ":cfmm-refs" `T.isSuffixOf` stem

-- | Conjunct 7 for a whole repository at once: one @ls-files@ listing, one
-- @status@, one @diff --cached@, whatever the number of candidates. Paths are
-- made relative to @top@ because that is what both commands print back, and
-- set membership on those names is what decides tracked from untracked. If
-- any of the three fails, every path in the batch becomes 'GitUnknown' —
-- an empty listing from a broken @ls-files@ is indistinguishable from an
-- empty listing from a clean one, and reading it as \"untracked\" would
-- delete tracked files.
--
-- @check-ignore@ is deliberately not run: 'GitFacts' answers untracked and
-- ignored with the same constructor — §6 deletes both — so its result could
-- not change a decision, and a probe whose output is discarded is a
-- subprocess nobody has to pay for.
batchProbe :: FilePath -> [FilePath] -> IO (Map FilePath GitFacts)
batchProbe top paths = probeEnvironment >>= \env -> batchProbeWith env top paths

batchProbeWith :: [(String, String)] -> FilePath -> [FilePath] -> IO (Map FilePath GitFacts)
batchProbeWith env top paths = do
  let rel p = normalise (makeRelative top p)
      names = map rel paths
  (listCode, listed, listErr) <- runGit env top (["ls-files", "-z", "--full-name", "--"] <> names)
  (statCode, status, statErr) <- runGit env top (["status", "--porcelain", "-z", "--"] <> names)
  (indexCode, _, indexErr) <- runGit env top ["diff", "--cached", "--quiet"]
  let tracked = S.fromList (nulFields listed)
      dirty = S.fromList (statusPaths status)
      -- --quiet exits 1 for a dirty index; that is the answer, not a failure.
      broken = case (listCode, statCode, indexCode) of
        (ExitFailure _, _, _) -> Just (failure top "ls-files" listCode listErr)
        (_, ExitFailure _, _) -> Just (failure top "status" statCode statErr)
        (_, _, ExitFailure n) | n /= 1 -> Just (failure top "diff --cached" indexCode indexErr)
        _ -> Nothing
      factsFor name = case broken of
        Just why -> GitUnknown why
        Nothing
          | name `S.member` tracked -> Tracked top (not (name `S.member` dirty)) (indexCode == ExitSuccess)
          | otherwise -> UntrackedOrIgnored top
  pure (M.fromList [(p, factsFor (rel p)) | p <- paths])

nulFields :: Text -> [FilePath]
nulFields = map T.unpack . filter (not . T.null) . T.splitOn "\NUL"

-- | @status --porcelain -z@ emits @XY \<path\>@ per record; a rename or copy
-- adds the original name as a record of its own, which is skipped rather than
-- mistaken for a status line.
statusPaths :: Text -> [FilePath]
statusPaths = go . filter (not . T.null) . T.splitOn "\NUL"
  where
    go [] = []
    go (entry : rest)
      | T.length entry < 4 = go rest
      | T.head entry `elem` ("RC" :: String) = T.unpack (T.drop 3 entry) : go (drop 1 rest)
      | otherwise = T.unpack (T.drop 3 entry) : go rest

-- | Stage the removal of @paths@ in @top@ and unlink them, in one call per
-- repository. @git rm@ does both halves. It throws on failure — a locked
-- index, a file that changed under it — and 'Shelf.Cleanup.executeCleanup'
-- turns that into a failed run with the @pending@ events left standing as
-- evidence of what was in flight.
gitRm :: FilePath -> [FilePath] -> IO ()
gitRm _ [] = pure ()
gitRm top paths = do
  env <- probeEnvironment
  (code, _, err) <- runGit env top (["rm", "-q", "--"] <> map (normalise . makeRelative top) paths)
  case code of
    ExitSuccess -> pure ()
    _ -> ioError (userError (T.unpack (failure top "rm" code err)))
