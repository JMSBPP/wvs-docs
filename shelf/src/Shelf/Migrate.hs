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
-- migration alone. A file outside any git repo has no such safety net and is
-- migrated as asked.
module Shelf.Migrate (MigrateResult (..), migrateFile) where

import Data.Aeson (Value (..))
import qualified Data.Aeson.KeyMap as KM
import qualified Data.ByteString.Lazy as BSL
import Data.Text (Text)
import qualified Data.Text as T
import qualified Data.Text.Encoding as TE
import qualified Data.Yaml as Y
import System.Directory (doesFileExist)
import System.Exit (ExitCode (..))
import System.FilePath (takeDirectory, takeFileName)
import System.IO.Error (tryIOError)
import System.Process.Typed (proc, readProcess, setWorkingDir)

import Shelf.Atomic (writeAtomic)

data MigrateResult = Migrated | AlreadyV2 deriving stock (Eq, Show)

migrateFile :: FilePath -> IO (Either Text MigrateResult)
migrateFile p = do
  there <- doesFileExist p
  if not there then pure (Left ("manifest not found: " <> T.pack p)) else do
    dirty <- gitDirty p
    if dirty
      then pure (Left (T.pack p <> " has uncommitted changes in git; \
                       \commit or stash them so the migration lands in a diff of its own"))
      else do
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

-- | Whether git reports the path as changed. A path outside a repo — or a
-- machine with no git at all — is not dirty, since there is nothing to lose.
gitDirty :: FilePath -> IO Bool
gitDirty p = either (const False) reading <$> tryIOError run
  where
    run = readProcess (setWorkingDir (takeDirectory p) (proc "git" ["status", "--porcelain", "--", takeFileName p]))
    reading (ExitSuccess, out, _) = not (T.null (T.strip (TE.decodeUtf8Lenient (BSL.toStrict out))))
    reading (ExitFailure _, _, _) = False
