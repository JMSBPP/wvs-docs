-- | Argument parsing and dispatch only; every command body lives beside its
-- module — "Shelf.Apply" for the local pipeline, "Shelf.Remote.Cli" and
-- "Shelf.Remote.Cli.Fetch" for the remote commands.
module Main (main) where

import Data.Text (Text)
import qualified Data.Text as T
import Options.Applicative
import Shelf.Apply
import Shelf.Cleanup.Cli (CleanupOpts (..), cleanupOptsP, runCleanup)
import Shelf.Remote.Cli
  (PushOpts (..), VerifyMode (..), clampExpires, parseDuration, runPush, runUrl)
import Shelf.Remote.Cli.Fetch (FetchOpts (..), runFetch)
import Shelf.Remote.Config (RemoteConfig, loadRemoteConfig, loadRemoteConfigOptional)
import Shelf.Types (Citekey, Topic, mkCitekey, mkTopic)
import System.Exit (exitWith)

data Cmd
  = Scan (Maybe FilePath)
  | Apply
  | Extract (Maybe Text)      -- ^ 'Nothing' is @--all@.
  | Index
  | Migrate
  | ManifestCheck Bool Bool   -- ^ @--require@, @--require-remote@.
  | Push (Maybe [Citekey]) VerifyMode Bool Int  -- ^ Selection, @--verify@, @--dry-run@, @--jobs@.
  | Fetch (Maybe [Citekey]) Bool Bool           -- ^ Selection, @--dry-run@, @--force@.
  | Url Citekey (Maybe Topic) Bool Int          -- ^ Citekey, @--topic@, @--signed@, @--expires@.
  | Cleanup CleanupOpts

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
  <> command "push" (info (Push <$> pushSelP <*> verifyP <*> dryRunP <*> jobsP)
       (progDesc "Upload every (source, topic) with no verified object, verifying each by download"))
  <> command "fetch" (info (Fetch <$> ckSelP <*> dryRunP <*> forceP)
       (progDesc "Rebuild pdfs/ from the remote, falling back to arXiv where provenance allows"))
  <> command "url" (info (Url <$> argument citekeyR (metavar "CITEKEY") <*> topicP <*> signedP <*> expiresP)
       (progDesc "Print a source's object URL, public or presigned"))
  <> command "manifest" (info (hsubparser (command "check" (info (ManifestCheck <$> requireP <*> requireRemoteP)
       (progDesc "Validate manifest/sources.yaml against the topics on disk"))))
       (progDesc "Manifest subcommands"))
  <> command "cleanup" (info (Cleanup <$> cleanupOptsP)
       (progDesc "Remove duplicate PDFs the shelf can prove are safe to delete"))
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
    -- fetch defaults to everything because it only ever adds missing files;
    -- push writes to a paid remote, so it makes the operator say which.
    ckSelP = pushSelP <|> pure Nothing
    pushSelP = flag' Nothing (long "all" <> help "Every source in the manifest")
           <|> (Just <$> some (argument citekeyR (metavar "CITEKEY")))
    verifyP = option verifyR (long "verify" <> metavar "get|head" <> value VerifyGet
      <> help "How an upload is proved: download and compare digests (get, the \
              \default), or compare the ETag and length (head)")
    dryRunP = switch (long "dry-run" <> help "Print what would happen and change nothing")
    forceP = switch (long "force"
      <> help "Move a mirror file whose digest does not match the manifest to \
              \pdfs/.displaced/ and fetch a fresh copy")
    jobsP = option auto (long "jobs" <> metavar "N" <> value 1
      <> help "Upload with N worker threads (default 1)")
    topicP = optional (option topicR (long "topic" <> metavar "T"
      <> help "Which topic's object to name (default: the alphabetically first verified one)"))
    signedP = switch (long "signed"
      <> help "Emit a presigned URL. On a public-read object this is not a \
              \privacy control — the plain URL already serves the bytes — it is \
              \a link that stops working")
    expiresP = option expiresR (long "expires" <> metavar "DURATION" <> value 3600
      <> help "Lifetime of a --signed URL as Ns, Nm, Nh or Nd; clamped to 7d")

citekeyR :: ReadM Citekey
citekeyR = eitherReader (either (Left . T.unpack) Right . mkCitekey . T.pack)

topicR :: ReadM Topic
topicR = eitherReader (either (Left . T.unpack) Right . mkTopic . T.pack)

verifyR :: ReadM VerifyMode
verifyR = eitherReader $ \case
  "get" -> Right VerifyGet
  "head" -> Right VerifyHead
  other -> Left ("--verify must be get or head, got: " <> other)

expiresR :: ReadM Int
expiresR = eitherReader (either (Left . T.unpack) Right . parseDuration . T.pack)

-- | The remote commands are the only ones that read credentials at all, so the
-- environment is consulted here rather than in 'main': @shelf apply@ must keep
-- working on a machine that has never seen a Hippius key.
withRemote :: (RemoteConfig -> IO a) -> IO a
withRemote k = loadRemoteConfig >>= either die k

-- | For the read-only commands. The bucket is public-read, so @fetch@ and a
-- plain @url@ work on a fresh clone with no credentials at all — which is the
-- whole promise that any clone can rebuild @pdfs\/@.
withRemoteAnon :: (RemoteConfig -> IO a) -> IO a
withRemoteAnon k = loadRemoteConfigOptional >>= either die k

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
    Push sel mode dry jobs -> withRemote (\cfg -> runPush rp cfg (PushOpts sel mode dry jobs)) >>= exitWith
    Fetch sel dry force -> withRemoteAnon (\cfg -> runFetch rp cfg (FetchOpts sel dry force)) >>= exitWith
    Url c topic signed expires -> (if signed then withRemote else withRemoteAnon)
      (\cfg -> runUrl rp cfg c topic signed (clampExpires expires))
    Cleanup copts -> runCleanup rp copts >>= exitWith
