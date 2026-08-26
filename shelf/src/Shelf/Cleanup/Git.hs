-- | The git side of conjuncts 5 and 7, and the removal that conjunct 7 may
-- authorise. Three rules hold for every invocation here:
--
-- * @--literal-pathspecs@, so a candidate whose name contains @*@, @?@ or a
--   leading @:@ is never read as a pattern. It is a main-command option, not
--   a subcommand one, so it precedes @-C@.
-- * @GIT_DIR@, @GIT_WORK_TREE@ and @GIT_INDEX_FILE@ are dropped from the
--   child's environment: inherited from a hook or a rebase they would point
--   every probe at a repository that has nothing to do with the candidate.
-- * A git that is missing, or that answers with a failure, is never fatal —
--   the answer degrades to \"not in a repository\", which can only make the
--   classifier more cautious, never less.
--
-- 'repoTop' is memoised for the life of the process because repository
-- topology does not move under a run, and the plan asks it once per candidate
-- directory. Nothing that a delete could invalidate is cached.
module Shelf.Cleanup.Git
  ( repoTop
  , isShelfRemote
  , batchProbe
  , gitRm
  ) where

import Control.Exception (SomeException, try)
import qualified Data.ByteString.Lazy as BL
import Data.IORef (IORef, atomicModifyIORef', newIORef, readIORef)
import Data.Map.Strict (Map)
import qualified Data.Map.Strict as M
import Data.Maybe (fromMaybe)
import qualified Data.Set as S
import Data.Text (Text)
import qualified Data.Text as T
import qualified Data.Text.Encoding as TE
import System.Directory (canonicalizePath)
import System.Environment (getEnvironment)
import System.Exit (ExitCode (..))
import System.FilePath (makeRelative, normalise)
import System.IO.Unsafe (unsafePerformIO)
import System.Process.Typed (proc, readProcess, setEnv)

import Shelf.Cleanup.Facts (GitFacts (..))

-- | Run git in @dir@ and hand back its exit code, stdout and stderr as text.
-- A missing git is reported as a failure rather than thrown.
runGit :: FilePath -> [String] -> IO (ExitCode, Text, Text)
runGit dir args = do
  base <- getEnvironment
  let inherited = ["GIT_DIR", "GIT_WORK_TREE", "GIT_INDEX_FILE"]
      env = filter ((`notElem` inherited) . fst) base
  outcome <- try (readProcess (setEnv env (proc "git" (["--literal-pathspecs", "-C", dir] <> args))))
  pure $ case outcome of
    Left e -> (ExitFailure 127, "", T.pack (show (e :: SomeException)))
    Right (code, out, err) -> (code, decode out, decode err)
  where decode = TE.decodeUtf8Lenient . BL.toStrict

{-# NOINLINE topCache #-}
topCache :: IORef (Map FilePath (Maybe FilePath))
topCache = unsafePerformIO (newIORef M.empty)

-- | The toplevel of the repository containing @dir@, canonicalised so it can
-- be compared with a canonicalised @--allow-repo@ entry. 'Nothing' when @dir@
-- is in no repository at all.
repoTop :: FilePath -> IO (Maybe FilePath)
repoTop dir = do
  cached <- M.lookup dir <$> readIORef topCache
  case cached of
    Just hit -> pure hit
    Nothing -> do
      (code, out, _) <- runGit dir ["rev-parse", "--show-toplevel"]
      top <- case (code, T.strip out) of
        (ExitSuccess, raw) | not (T.null raw) -> Just <$> canonicalizePath (T.unpack raw)
        _ -> pure Nothing
      atomicModifyIORef' topCache (\m -> (M.insert dir top m, ()))
      pure top

{-# NOINLINE remoteCache #-}
remoteCache :: IORef (Map FilePath Bool)
remoteCache = unsafePerformIO (newIORef M.empty)

-- | Conjunct 5: does @top@ look like another checkout of this shelf? The test
-- is on the @origin@ and @upstream@ URLs, which is a heuristic and is treated
-- as one — it is a second line of defence behind conjunct 0's identity check,
-- never the only thing standing between a clone and a delete.
isShelfRemote :: FilePath -> IO Bool
isShelfRemote top = do
  cached <- M.lookup top <$> readIORef remoteCache
  case cached of
    Just hit -> pure hit
    Nothing -> do
      urls <- mapM (\r -> (\(_, o, _) -> T.strip o) <$> runGit top ["remote", "get-url", r]) ["origin", "upstream"]
      let hit = any looksLikeShelf urls
      atomicModifyIORef' remoteCache (\m -> (M.insert top hit m, ()))
      pure hit
  where
    looksLikeShelf url =
      let bare = T.dropWhileEnd (== '/') url
          stem = fromMaybe bare (T.stripSuffix ".git" bare)
      in "/cfmm-refs" `T.isSuffixOf` stem || ":cfmm-refs" `T.isSuffixOf` stem

-- | Conjunct 7 for a whole repository at once: one @ls-files@ listing, one
-- @status@, one @diff --cached@, whatever the number of candidates. Paths are
-- made relative to @top@ because that is what both commands print back, and
-- set membership on those names is what decides tracked from untracked.
--
-- @check-ignore@ is deliberately not run: 'GitFacts' answers untracked and
-- ignored with the same constructor — §6 deletes both — so its result could
-- not change a decision, and a probe whose output is discarded is a
-- subprocess nobody has to pay for.
batchProbe :: FilePath -> [FilePath] -> IO (Map FilePath GitFacts)
batchProbe top paths = do
  let rel p = normalise (makeRelative top p)
      names = map rel paths
  (_, listed, _) <- runGit top (["ls-files", "-z", "--full-name", "--"] <> names)
  (_, status, _) <- runGit top (["status", "--porcelain", "-z", "--"] <> names)
  (indexCode, _, _) <- runGit top ["diff", "--cached", "--quiet"]
  let tracked = S.fromList (nulFields listed)
      dirty = S.fromList (statusPaths status)
      indexClean = indexCode == ExitSuccess
      factsFor name
        | name `S.member` tracked = Tracked top (not (name `S.member` dirty)) indexClean
        | otherwise = UntrackedOrIgnored top
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
-- repository. @git rm@ does both halves; the caller has already written a
-- @pending@ event for every path in the batch, so a crash in the middle is
-- visible on the next run.
gitRm :: FilePath -> [FilePath] -> IO ()
gitRm _ [] = pure ()
gitRm top paths = do
  (code, _, err) <- runGit top (["rm", "-q", "--"] <> map (normalise . makeRelative top) paths)
  case code of
    ExitSuccess -> pure ()
    _ -> ioError (userError ("git rm failed in " <> top <> ": " <> T.unpack (T.strip err)))
