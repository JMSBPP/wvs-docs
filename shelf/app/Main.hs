-- | Argument parsing and dispatch only; every command body lives in
-- "Shelf.Apply".
module Main (main) where

import Data.Text (Text)
import qualified Data.Text as T
import Options.Applicative
import Shelf.Apply

data Cmd
  = Scan (Maybe FilePath)
  | Apply
  | Extract (Maybe Text)      -- ^ 'Nothing' is @--all@.
  | Index
  | Migrate
  | ManifestCheck Bool Bool   -- ^ @--require@, @--require-remote@.

data Opts = Opts { optRepo :: Maybe FilePath, optCmd :: Cmd }

repoOpt :: Parser (Maybe FilePath)
repoOpt = optional (strOption
  (long "repo" <> metavar "DIR" <> help "Shelf repo root (default: nearest ancestor with manifest/ or topics/)"))

cmdP :: Parser Cmd
cmdP = hsubparser
  (  command "scan" (info (Scan <$> optional (strOption rootHelp))
       (progDesc "Walk for PDFs and merge proposals into manifest/scan.yaml"))
  <> command "apply" (info (pure Apply)
       (progDesc "Apply included scan rows: pdfs, text, cards, manifest, indexes"))
  <> command "extract" (info (Extract <$> selP)
       (progDesc "Re-extract text for one manifest source, or all of them"))
  <> command "index" (info (pure Index)
       (progDesc "Rebuild the BM25 index, refresh card headers, re-render the topic indexes"))
  <> command "migrate" (info (pure Migrate)
       (progDesc "Rewrite manifest/sources.yaml from schema 1 to schema 2"))
  <> command "manifest" (info (hsubparser (command "check" (info (ManifestCheck <$> requireP <*> requireRemoteP)
       (progDesc "Validate manifest/sources.yaml against the topics on disk"))))
       (progDesc "Manifest subcommands"))
  )
  where
    rootHelp = long "root" <> metavar "DIR"
      <> help "Base that both the walk and the include-root gate resolve against \
              \(default: $HOME). Paths under $HOME stay relative to it; anything \
              \else is recorded relative to DIR."
    selP = flag' Nothing (long "all" <> help "Every source in the manifest")
       <|> (Just . T.pack <$> argument str (metavar "CITEKEY"))
    requireP = switch (long "require" <> help "Fail if manifest/sources.yaml or topics/ is missing")
    requireRemoteP = switch (long "require-remote"
      <> help "Also fail on warnings: every source must be backed by a verified \
              \remote object for every topic it carries")

main :: IO ()
main = do
  opts <- execParser (info (Opts <$> repoOpt <*> cmdP <**> helper)
    (fullDesc <> progDesc "Manage the cfmm-refs research shelf" <> header "shelf"))
  rp <- resolveRepo (optRepo opts)
  case optCmd opts of
    Scan root -> runScan root rp
    Apply -> runApply rp
    Extract sel -> runExtract sel rp
    Index -> runIndex rp
    Migrate -> runMigrate rp
    ManifestCheck require requireRemote -> runManifestCheck require requireRemote rp
