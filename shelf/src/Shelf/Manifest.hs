-- | @manifest/sources.yaml@: load, save, upsert, and validate.
--
-- The file carries a schema version and the loader refuses anything but the
-- current one. That is the whole point of the v1 → v2 bump: a Phase-1 binary
-- reading a v2 file would parse it, silently drop the @remote@ block it does
-- not know about, and write that loss back on its next 'saveManifest'.
--
-- 'check' is pure and environment-free — every fact it needs about the remote,
-- including the endpoint, is in the manifest — and it tags each finding with a
-- 'Severity'. Only 'Err' is a failure; 'Warn' describes work still to do
-- (nothing uploaded yet, an object left over from a dropped topic), which is
-- the normal state of a freshly migrated manifest and must not fail CI.
module Shelf.Manifest
  ( Manifest (..), Severity (..), Violation (..)
  , loadManifest, loadManifestStrict, saveManifest, upsert, check, schemaVersion
  ) where
import Data.Aeson (FromJSON (..), ToJSON (..), object, withObject, (.:), (.=))
import Data.Aeson.Types (parseEither)
import Data.List (nub, sortOn)
import qualified Data.Map.Strict as M
import Data.Text (Text)
import qualified Data.Text as T
import qualified Data.Yaml as Y
import System.Directory (doesFileExist)
import Shelf.Atomic (writeAtomic)
import Shelf.Types

-- | The only schema this binary reads or writes.
schemaVersion :: Int
schemaVersion = 2

data Manifest = Manifest { mfSchemaVersion :: Int, mfSources :: [Source] } deriving stock (Eq, Show)
instance ToJSON Manifest where toJSON m = object ["schema_version" .= mfSchemaVersion m, "sources" .= mfSources m]
instance FromJSON Manifest where parseJSON = withObject "manifest" $ \o -> Manifest <$> o .: "schema_version" <*> o .: "sources"

-- | The schema version is read from the raw document before the typed parse,
-- so a file from an older schema is always answered with the migration
-- instruction rather than with whatever field happens to fail first.
loadManifestStrict :: FilePath -> IO (Either Text Manifest)
loadManifestStrict p = do
  e <- doesFileExist p
  if not e then pure (Left ("manifest not found: " <> T.pack p))
  else either (Left . T.pack . Y.prettyPrintParseException) versioned <$> Y.decodeFileEither p
  where
    versioned v = case parseEither parseJSON v of
      Left err -> Left ("manifest has no usable schema_version: " <> T.pack err)
      Right (SchemaOnly n)
        | n /= schemaVersion ->
            Left ("manifest schema " <> T.pack (show n) <> " — run `shelf migrate`")
        | otherwise -> either (Left . T.pack) Right (parseEither parseJSON v)

-- | Just enough of the document to decide whether the rest may be parsed.
newtype SchemaOnly = SchemaOnly Int
instance FromJSON SchemaOnly where
  parseJSON = withObject "manifest" $ \o -> SchemaOnly <$> o .: "schema_version"
loadManifest :: FilePath -> IO (Either Text Manifest)
loadManifest p = do
  e <- doesFileExist p
  if e then loadManifestStrict p else pure (Right (Manifest schemaVersion []))

saveManifest :: FilePath -> Manifest -> IO ()
saveManifest p m = writeAtomic p (Y.encode m { mfSources = sortOn srcCitekey (mfSources m) })

upsert :: Source -> Manifest -> Manifest
upsert s m
  | any ((== srcSha256 s) . srcSha256) (mfSources m) =
      m { mfSources = map (\x -> if srcSha256 x == srcSha256 s then s else x) (mfSources m) }
  | otherwise = m { mfSources = mfSources m <> [s] }

-- | 'Err' fails the check; 'Warn' is reported and tolerated unless the caller
-- asked for @--require-remote@.
data Severity = Warn | Err deriving stock (Eq, Ord, Show)

data Violation
  = BadSchemaVersion Int | DupCitekey Citekey | DupSha Sha256 | EmptyTopics Citekey
  | UnknownTopic Citekey Topic
  | RemoteBadKey Citekey Text        -- ^ Key, url or topic uniqueness broken; the key names the object.
  | RemoteShaDrift Citekey Topic     -- ^ The verified digest is not the source's.
  | RemoteIncomplete Citekey [Topic] -- ^ Carried topics with no verified object.
  | RemoteStale Citekey [Topic]      -- ^ Objects for topics no longer carried.
  deriving stock (Eq, Show)

check :: [Topic] -> Manifest -> [(Severity, Violation)]
check known (Manifest v srcs) =
  [(Err, BadSchemaVersion v) | v /= schemaVersion]
    <> dups DupCitekey srcCitekey <> dups DupSha srcSha256 <> concatMap perSrc srcs
  where
    dups mk f = [(Err, mk k) | (k, n) <- M.toList (M.fromListWith (+) [(f s, 1 :: Int) | s <- srcs]), n > 1]
    perSrc s = errs s <> warns s
    errs s =
      [(Err, EmptyTopics ck) | null (srcTopics s)]
        <> [(Err, UnknownTopic ck t) | t <- srcTopics s, t `notElem` known]
        <> [(Err, RemoteBadKey ck (roKey o)) | o <- objects s, malformed s o]
        <> [(Err, RemoteBadKey ck (objectKey t ck)) | t <- duplicated s]
        <> [(Err, RemoteShaDrift ck (roTopic o)) | o <- objects s, roVerifiedSha256 o /= srcSha256 s]
      where ck = srcCitekey s
    warns s =
      [(Warn, RemoteIncomplete (srcCitekey s) missing) | not (null missing)]
        <> [(Warn, RemoteStale (srcCitekey s) (map roTopic stale)) | not (null stale)]
      where
        missing = missingTopics s
        stale = staleObjects s
    objects s = maybe [] rmObjects (srcRemote s)
    -- Both spellings of the same fault — a key that is not the one the topic
    -- implies, and a url that is not that key under this remote — are one
    -- finding per object, so a single bad key is not reported twice.
    malformed s o = roKey o /= objectKey (roTopic o) (srcCitekey s)
                 || maybe True (\r -> roUrl o /= objectUrl (rmEndpoint r) (rmBucket r) (roKey o)) (srcRemote s)
    duplicated s = nub [t | t <- ts, length (filter (== t) ts) > 1] where ts = map roTopic (objects s)
