-- | @shelf migrate@: rewrite @manifest/sources.yaml@ from schema 1 to 2.
--
-- The rewrite works on a generic 'Y.Value', not on 'Shelf.Manifest.Manifest':
-- a v1 file is by definition something the current parser refuses, and a
-- typed round-trip would drop any field this version does not model. Only two
-- edits are made — the version number, and the Phase-1 @hippius@ block that
-- was superseded by @remote@ — so everything else survives byte-for-byte
-- modulo YAML re-encoding.
--
-- The file is rewritten in place, so the migration first asks git whether it
-- has anything to lose: if @git status --porcelain@ reports the path as
-- changed, the run is refused and the user can diff the result of the
-- migration alone. A file outside any git repo — @rev-parse@ answering 128
-- with @not a git repository@ — has no such safety net and is migrated as
-- asked. Every other way of not getting an answer, git missing from @PATH@
-- included, refuses: an unanswered question about what an in-place rewrite
-- would destroy is not the same as "nothing to lose", and reading it as one
-- is how an unversioned manifest gets overwritten.
module Shelf.Migrate (MigrateResult (..), migrateFile, migrateFileWith, gitDirty) where

import Data.Aeson (Value (..))
import qualified Data.Aeson.KeyMap as KM
import Data.Text (Text)
import qualified Data.Text as T
import qualified Data.Yaml as Y
import System.Directory (doesFileExist)
import System.Exit (ExitCode (..))
import System.FilePath (takeDirectory, takeFileName)

import Shelf.Atomic (writeAtomic)
import Shelf.Cleanup.Git (probeEnvironment, runGit)

data MigrateResult = Migrated | AlreadyV2 deriving stock (Eq, Show)

migrateFile :: FilePath -> IO (Either Text MigrateResult)
migrateFile p = probeEnvironment >>= \env -> migrateFileWith env p

-- | 'migrateFile' against an explicit environment, so a test can hand it a
-- @PATH@ with no git on it and watch the migration refuse.
migrateFileWith :: [(String, String)] -> FilePath -> IO (Either Text MigrateResult)
migrateFileWith env p = do
  there <- doesFileExist p
  if not there then pure (Left ("manifest not found: " <> T.pack p)) else
    gitDirtyWith env p >>= \case
      Left why -> pure (Left why)
      Right True ->
        pure (Left (T.pack p <> " has uncommitted changes in git; \
                    \commit or stash them so the migration lands in a diff of its own"))
      Right False -> do
        parsed <- Y.decodeFileEither p
        case parsed of
          Left e -> pure (Left (T.pack (Y.prettyPrintParseException e)))
          Right v -> case migrateValue v of
            Left e -> pure (Left e)
            Right Nothing -> pure (Right AlreadyV2)
            Right (Just v') -> Right Migrated <$ writeAtomic p (Y.encode v')

-- | 'Nothing' when the document is already at the current schema.
migrateValue :: Value -> Either Text (Maybe Value)
migrateValue (Object o) = case KM.lookup "schema_version" o of
  Just (Number n)
    | n == 2 -> Right Nothing
    | n == 1 -> Right (Just (Object (KM.insert "schema_version" (Number 2) (dropHippius o))))
  Just v -> Left ("unsupported manifest schema_version: " <> T.pack (show v))
  Nothing -> Left "manifest has no schema_version"
migrateValue v = Left ("manifest is not a mapping: " <> T.pack (show v))

dropHippius :: KM.KeyMap Value -> KM.KeyMap Value
dropHippius o = maybe o (\v -> KM.insert "sources" (overSources v) o) (KM.lookup "sources" o)
  where
    overSources (Array xs) = Array (fmap strip xs)
    overSources v = v
    strip (Object s) = Object (KM.delete "hippius" s)
    strip v = v

-- | Whether git reports the path as changed. 'Right' 'False' is the positive
-- answer that there is nothing to lose — the path is clean, or it lies
-- outside every repository — and 'Left' is the absence of an answer, which
-- 'migrateFileWith' turns into a refusal.
gitDirty :: FilePath -> IO (Either Text Bool)
gitDirty p = probeEnvironment >>= \env -> gitDirtyWith env p

gitDirtyWith :: [(String, String)] -> FilePath -> IO (Either Text Bool)
gitDirtyWith env p = runGit env dir ["rev-parse", "--show-toplevel"] >>= \case
  (ExitFailure 128, _, err) | "not a git repository" `T.isInfixOf` err -> pure (Right False)
  (ExitFailure n, _, err) -> pure (Left (unanswered "rev-parse" n err))
  (ExitSuccess, _, _) ->
    runGit env dir ["status", "--porcelain", "--", takeFileName p] >>= \case
      (ExitSuccess, out, _) -> pure (Right (not (T.null (T.strip out))))
      (ExitFailure n, _, err) -> pure (Left (unanswered "status" n err))
  where
    dir = takeDirectory p
    unanswered what n err = T.unwords
      [ "cannot determine git status:", "git", what, "in", T.pack dir, "exited"
      , T.pack (show n), T.unwords (T.words (T.take 200 err)) ]
