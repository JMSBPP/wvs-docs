-- | @shelf cleanup@: the option grammar, the two confirmation gates that must
-- pass before anything is read from disk, and the two shapes the command
-- takes afterward — a dry run that only prints "Shelf.Cleanup".'planCleanup'\'s
-- table, and @--execute@, which prints the same table and then acts on it.
--
-- The live remote HEAD check (conjunct 3's second half) needs credentials to
-- ask. A dry run without them is not a failure: it downgrades the check to
-- 'Shelf.Cleanup.Facts.NotRequired' and says so with a banner. @--execute@
-- without @--offline@ refuses outright instead, because a delete that skipped
-- the live check without saying so is exactly the mistake conjunct 3 exists
-- to catch.
module Shelf.Cleanup.Cli
  ( CleanupOpts (..)
  , cleanupOptsP
  , runCleanup
  ) where

import Control.Monad (unless, when)
import Data.List (nub, sortOn)
import qualified Data.Set as S
import Data.Text (Text)
import qualified Data.Text as T
import qualified Data.Text.IO as TIO
import Options.Applicative
import System.Directory (canonicalizePath, getHomeDirectory)
import System.Exit (ExitCode (..))
import System.IO (hPutStrLn, stderr)

import Shelf.Apply.Paths (RepoPaths (..))
import Shelf.Cleanup
import Shelf.Cleanup.Facts
import Shelf.Manifest (Manifest, loadManifestStrict)
import Shelf.Remote.Config (RemoteConfig, loadRemoteConfig)

-- | @coAllowRepos@ is taken raw from the command line; 'runCleanup'
-- canonicalises it once, itself, rather than asking every caller to.
data CleanupOpts = CleanupOpts
  { coExecute :: Bool
  , coYes :: Bool
  , coOffline :: Bool
  , coIncludeUnsourced :: Bool
  , coAcceptTwoCopies :: Bool
  , coAllowRepos :: [FilePath]
  }
  deriving stock (Eq, Show)

cleanupOptsP :: Parser CleanupOpts
cleanupOptsP = CleanupOpts
  <$> switch (long "execute" <> help "Delete and git-rm; without this, print the plan and change nothing")
  <*> switch (long "yes" <> help "Confirm --execute; required together with it")
  <*> switch (long "offline" <> help "Skip the live remote HEAD check")
  <*> switch (long "include-unsourced"
      <> help "Also allow doi/isbn/unsourced provenance, not just arXiv; needs --i-accept-two-copies")
  <*> switch (long "i-accept-two-copies" <> help "Confirm --include-unsourced")
  <*> many (strOption (long "allow-repo" <> metavar "DIR"
      <> help "A git repository cleanup may git-rm tracked files in; repeatable"))

-- | The provenance kinds this run may delete under: arXiv alone, or arXiv
-- plus the three kinds @--include-unsourced@ adds.
provSetFor :: CleanupOpts -> ProvSet
provSetFor opts
  | coIncludeUnsourced opts = S.fromList ["arxiv", "unsourced", "doi", "isbn"]
  | otherwise = defaultProvSet

runCleanup :: RepoPaths -> CleanupOpts -> IO ExitCode
runCleanup rp opts = case validate opts of
  Just msg -> hPutStrLn stderr msg >> pure (ExitFailure 1)
  Nothing -> do
    home <- getHomeDirectory
    manifestE <- loadManifestStrict (rpManifest rp)
    case manifestE of
      Left e -> hPutStrLn stderr ("shelf cleanup: " <> T.unpack e) >> pure (ExitFailure 1)
      Right manifest -> do
        allowed <- mapM canonicalizePath (coAllowRepos opts)
        let provs = provSetFor opts
        if coExecute opts
          then runExecute rp opts home manifest allowed provs
          else runDryRun rp opts home manifest allowed provs

-- | The two refusals that must never touch the filesystem, the manifest or
-- the environment: an operator who has not typed @--yes@ has not confirmed
-- @--execute@, whatever state the repo happens to be in.
validate :: CleanupOpts -> Maybe String
validate opts
  | coExecute opts && not (coYes opts) =
      Just "shelf cleanup: --execute requires --yes"
  | coIncludeUnsourced opts && not (coAcceptTwoCopies opts) =
      Just "shelf cleanup: --include-unsourced requires --i-accept-two-copies"
  | otherwise = Nothing

runDryRun :: RepoPaths -> CleanupOpts -> FilePath -> Manifest -> [FilePath] -> ProvSet -> IO ExitCode
runDryRun rp opts home manifest allowed provs = do
  (live, cfg) <- resolveLiveDryRun (coOffline opts)
  plan <- planCleanup rp home manifest cfg provs allowed live
  printTable plan
  pure ExitSuccess

runExecute :: RepoPaths -> CleanupOpts -> FilePath -> Manifest -> [FilePath] -> ProvSet -> IO ExitCode
runExecute rp opts home manifest allowed provs = do
  resolved <- resolveLiveExecute (coOffline opts)
  case resolved of
    Left msg -> hPutStrLn stderr msg >> pure (ExitFailure 1)
    Right (live, cfg) -> do
      plan <- planCleanup rp home manifest cfg provs allowed live
      printTable plan
      let regather = gatherFacts rp manifest cfg provs live
      code <- executeCleanup rp home regather allowed plan
      when (code == ExitSuccess) (reportPendingCommits plan)
      pure code

-- | Dry run: no credentials is not a refusal, it is a banner and 'False'.
resolveLiveDryRun :: Bool -> IO (Bool, Maybe RemoteConfig)
resolveLiveDryRun offline
  | offline = pure (False, Nothing)
  | otherwise = loadRemoteConfig >>= \case
      Left _ -> do
        TIO.putStrLn "live HEAD skipped (no credentials)"
        pure (False, Nothing)
      Right cfg -> pure (True, Just cfg)

-- | Execute: the same absence is fatal.
resolveLiveExecute :: Bool -> IO (Either String (Bool, Maybe RemoteConfig))
resolveLiveExecute offline
  | offline = pure (Right (False, Nothing))
  | otherwise = loadRemoteConfig >>= \case
      Left e -> pure (Left ("shelf cleanup --execute: " <> T.unpack e <> " (or pass --offline)"))
      Right cfg -> pure (Right (True, Just cfg))

-- | Every row's decision, then totals per action, then the repos a
-- 'Shelf.Cleanup.Facts.TrackedIn' skip named — the set an operator would need
-- to widen @--allow-repo@ with to see those rows turn into 'GitRm'.
printTable :: [(Facts, Decision)] -> IO ()
printTable rows = do
  mapM_ (TIO.putStrLn . row) sorted
  TIO.putStrLn (totalsLine rows)
  unless (null needAllow) $ do
    TIO.putStrLn "repos that would need --allow-repo:"
    mapM_ (TIO.putStrLn . T.pack) needAllow
  where
    sorted = sortOn (fPath . fst) rows
    row (f, d) = T.pack (fPath f) <> ": " <> renderDecision d
    needAllow = nub [top | (_, Skip (TrackedIn top)) <- rows]

totalsLine :: [(Facts, Decision)] -> Text
totalsLine rows = T.intercalate ", "
  [ "delete " <> count isDelete', "git-rm " <> count isGitRm', "skip " <> count isSkip' ]
  where
    count p = T.pack (show (length (filter p (map snd rows))))
    isDelete' = \case Delete -> True; _ -> False
    isGitRm' = \case GitRm _ -> True; _ -> False
    isSkip' = \case Skip _ -> True; _ -> False

reportPendingCommits :: [(Facts, Decision)] -> IO ()
reportPendingCommits plan = unless (null repos) $ do
  TIO.putStrLn "repos with staged deletions pending your commit:"
  mapM_ (TIO.putStrLn . T.pack) repos
  where repos = nub [top | (_, GitRm top) <- plan]
