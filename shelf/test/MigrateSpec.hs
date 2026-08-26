module MigrateSpec (tests) where

import qualified Data.Aeson as A
import qualified Data.Aeson.KeyMap as KM
import qualified Data.Text as T
import qualified Data.Yaml as Y
import System.Exit (ExitCode (..))
import System.FilePath ((</>))
import System.IO.Temp (withSystemTempDirectory)
import System.Process.Typed (proc, readProcess, setWorkingDir)
import Test.Tasty
import Test.Tasty.HUnit

import Shelf.Migrate

-- | A v1 manifest carrying the Phase-1 @hippius@ block, plus a second source
-- without one, so the migration has both shapes to handle.
v1Yaml :: String
v1Yaml = unlines
  [ "schema_version: 1"
  , "sources:"
  , "- citekey: a-2020"
  , "  sha256: '" <> replicate 64 '1' <> "'"
  , "  bytes: 10"
  , "  title: 'A: a title'"
  , "  authors: [Ada Lovelace]"
  , "  year: 2020"
  , "  provenance: {kind: arxiv, id: '2403.03367'}"
  , "  topics: [options, dgp]"
  , "  origin: [refs/a.pdf]"
  , "  hippius:"
  , "    key: pdfs/a-2020.pdf"
  , "    verified_sha256: '" <> replicate 64 '1' <> "'"
  , "    etag: '\"abc\"'"
  , "    verified_at: 2026-08-01T00:00:00Z"
  , "- citekey: b-2021"
  , "  sha256: '" <> replicate 64 '2' <> "'"
  , "  bytes: 11"
  , "  title: B"
  , "  authors: []"
  , "  year: nd"
  , "  provenance: {kind: unsourced}"
  , "  topics: [options]"
  , "  origin: []"
  ]

readValue :: FilePath -> IO A.Value
readValue p = either (error . Y.prettyPrintParseException) id <$> Y.decodeFileEither p

-- | The v1 document with @schema_version@ bumped and every @hippius@ key
-- dropped: what a correct migration must produce, modulo YAML formatting.
expected :: A.Value -> A.Value
expected (A.Object o) =
  A.Object (KM.insert "schema_version" (A.Number 2) (maybe o withSources (KM.lookup "sources" o)))
  where
    withSources v = KM.insert "sources" (srcs v) o
    srcs (A.Array xs) = A.Array (fmap dropHippius xs)
    srcs v = v
    dropHippius (A.Object s) = A.Object (KM.delete "hippius" s)
    dropHippius v = v
expected v = v


git :: FilePath -> [String] -> IO ()
git d args = do
  (code, _, err) <- readProcess (setWorkingDir d (proc "git" args))
  assertEqual ("git " <> unwords args <> ": " <> show err) ExitSuccess code

tests :: TestTree
tests = testGroup "Migrate"
  [ testCase "v1 becomes v2 with the hippius block dropped and nothing else changed" $
      withSystemTempDirectory "mig" $ \d -> do
        let p = d </> "sources.yaml"
        writeFile p v1Yaml
        before <- readValue p
        r <- migrateFile p
        r @?= Right Migrated
        migrated <- readValue p
        migrated @?= expected before
  , testCase "a second run is a no-op" $ withSystemTempDirectory "mig" $ \d -> do
      let p = d </> "sources.yaml"
      writeFile p v1Yaml
      _ <- migrateFile p
      bytes0 <- readFile p
      r <- migrateFile p
      r @?= Right AlreadyV2
      bytes1 <- readFile p
      bytes1 @?= bytes0
  , testCase "a missing file is refused" $ withSystemTempDirectory "mig" $ \d -> do
      r <- migrateFile (d </> "none.yaml")
      case r of
        Left e -> assertBool ("names the path: " <> T.unpack e) ("none.yaml" `T.isInfixOf` e)
        Right x -> assertFailure ("expected a refusal, got " <> show x)
  , testCase "a file git reports as changed is refused, and left untouched" $
      withSystemTempDirectory "mig" $ \d -> do
        let p = d </> "sources.yaml"
        git d ["init", "--quiet"]
        writeFile p v1Yaml
        r <- migrateFile p
        case r of
          Left e -> assertBool ("mentions git: " <> T.unpack e)
                      (any (`T.isInfixOf` e) ["git", "uncommitted", "changes"])
          Right x -> assertFailure ("expected a refusal, got " <> show x)
        still <- readFile p
        still @?= v1Yaml
  ]
