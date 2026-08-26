module Shelf.Manifest (Manifest (..), Violation (..), loadManifest, loadManifestStrict, saveManifest, upsert, check) where
import Data.Aeson (FromJSON (..), ToJSON (..), object, withObject, (.:), (.=))
import Data.List (sortOn)
import qualified Data.Map.Strict as M
import Data.Text (Text)
import qualified Data.Text as T
import qualified Data.Yaml as Y
import System.Directory (doesFileExist)
import Shelf.Atomic (writeAtomic)
import Shelf.Types

data Manifest = Manifest { mfSchemaVersion :: Int, mfSources :: [Source] } deriving stock (Eq, Show)
instance ToJSON Manifest where toJSON m = object ["schema_version" .= mfSchemaVersion m, "sources" .= mfSources m]
instance FromJSON Manifest where parseJSON = withObject "manifest" $ \o -> Manifest <$> o .: "schema_version" <*> o .: "sources"

loadManifestStrict :: FilePath -> IO (Either Text Manifest)
loadManifestStrict p = do
  e <- doesFileExist p
  if not e then pure (Left ("manifest not found: " <> T.pack p))
  else either (Left . T.pack . Y.prettyPrintParseException) Right <$> Y.decodeFileEither p

loadManifest :: FilePath -> IO (Either Text Manifest)
loadManifest p = do
  e <- doesFileExist p
  if e then loadManifestStrict p else pure (Right (Manifest 1 []))

saveManifest :: FilePath -> Manifest -> IO ()
saveManifest p m = writeAtomic p (Y.encode m { mfSources = sortOn srcCitekey (mfSources m) })

upsert :: Source -> Manifest -> Manifest
upsert s m
  | any ((== srcSha256 s) . srcSha256) (mfSources m) =
      m { mfSources = map (\x -> if srcSha256 x == srcSha256 s then s else x) (mfSources m) }
  | otherwise = m { mfSources = mfSources m <> [s] }

data Violation = BadSchemaVersion Int | DupCitekey Citekey | DupSha Sha256 | EmptyTopics Citekey | UnknownTopic Citekey Topic
  deriving stock (Eq, Show)

check :: [Topic] -> Manifest -> [Violation]
check known (Manifest v srcs) =
  [BadSchemaVersion v | v /= 1] <> dups DupCitekey srcCitekey <> dups DupSha srcSha256 <> concatMap perSrc srcs
  where
    dups mk f = [mk k | (k, n) <- M.toList (M.fromListWith (+) [(f s, 1 :: Int) | s <- srcs]), n > 1]
    perSrc s = [EmptyTopics (srcCitekey s) | null (srcTopics s)]
            <> [UnknownTopic (srcCitekey s) t | t <- srcTopics s, t `notElem` known]
