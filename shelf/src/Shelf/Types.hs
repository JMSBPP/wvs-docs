module Shelf.Types
  ( Citekey, mkCitekey, citekeyText, Sha256, mkSha256, sha256Text
  , Topic (..), Provenance (..), Year (..), HippiusRecord (..), Source (..), isRemoteBacked
  ) where

import Data.Aeson
import Data.Aeson.Types (Parser)
import Data.Binary (Binary (..))
import Data.Char (isAsciiLower, isDigit, isHexDigit, isUpper)
import Data.Text (Text)
import qualified Data.Text as T
import Data.Time (UTCTime)

newtype Citekey = Citekey Text deriving stock (Eq, Ord, Show)
newtype Sha256  = Sha256 Text  deriving stock (Eq, Ord, Show)
newtype Topic   = Topic Text   deriving stock (Eq, Ord, Show) deriving newtype (FromJSON, ToJSON)

citekeyText :: Citekey -> Text
citekeyText (Citekey t) = t
sha256Text :: Sha256 -> Text
sha256Text (Sha256 t) = t

-- ^[a-z0-9]+(-[a-z0-9]+)*-(\d{4}|nd)(-v\d+)?$
mkCitekey :: Text -> Either Text Citekey
mkCitekey t = if ok (stripVersion (T.splitOn "-" t)) then Right (Citekey t) else Left ("invalid citekey: " <> t)
  where
    stripVersion parts = case reverse parts of
      (v : rest@(_ : _)) | Just ds <- T.stripPrefix "v" v, not (T.null ds), T.all isDigit ds -> reverse rest
      _ -> parts
    ok parts = case reverse parts of
      (y : rest@(_ : _)) -> (y == "nd" || (T.length y == 4 && T.all isDigit y)) && all seg rest
      _ -> False
    seg p = not (T.null p) && T.all (\c -> isAsciiLower c || isDigit c) p

mkSha256 :: Text -> Either Text Sha256
mkSha256 t
  | T.length t == 64 && T.all (\c -> isHexDigit c && not (isUpper c)) t = Right (Sha256 t)
  | otherwise = Left ("invalid sha256: " <> t)

instance FromJSON Citekey where parseJSON = withText "citekey" (either (fail . T.unpack) pure . mkCitekey)
instance ToJSON Citekey where toJSON = toJSON . citekeyText
instance Binary Citekey where
  put = put . citekeyText
  get = get >>= either (fail . T.unpack) pure . mkCitekey
instance FromJSON Sha256 where parseJSON = withText "sha256" (either (fail . T.unpack) pure . mkSha256)
instance ToJSON Sha256 where toJSON = toJSON . sha256Text

data Provenance = ArXiv Text | Doi Text | Isbn Text | Unsourced deriving stock (Eq, Show)
instance ToJSON Provenance where
  toJSON = \case
    ArXiv i -> object ["kind" .= ("arxiv" :: Text), "id" .= i]
    Doi i -> object ["kind" .= ("doi" :: Text), "id" .= i]
    Isbn i -> object ["kind" .= ("isbn" :: Text), "id" .= i]
    Unsourced -> object ["kind" .= ("unsourced" :: Text)]
instance FromJSON Provenance where
  parseJSON = withObject "provenance" $ \o -> (o .: "kind" :: Parser Text) >>= \case
    "arxiv" -> ArXiv <$> o .: "id"
    "doi" -> Doi <$> o .: "id"
    "isbn" -> Isbn <$> o .: "id"
    "unsourced" -> pure Unsourced
    k -> fail ("unknown provenance kind " <> T.unpack k)

data Year = Year Int | NoDate deriving stock (Eq, Show)
instance ToJSON Year where
  toJSON (Year y) = toJSON y
  toJSON NoDate = String "nd"
instance FromJSON Year where
  parseJSON (String "nd") = pure NoDate
  parseJSON v = Year <$> parseJSON v

data HippiusRecord = HippiusRecord
  { hrKey :: Text, hrVerifiedSha256 :: Text, hrEtag :: Text, hrVerifiedAt :: UTCTime }
  deriving stock (Eq, Show)
instance ToJSON HippiusRecord where
  toJSON h = object ["key" .= hrKey h, "verified_sha256" .= hrVerifiedSha256 h, "etag" .= hrEtag h, "verified_at" .= hrVerifiedAt h]
instance FromJSON HippiusRecord where
  parseJSON = withObject "hippius" $ \o ->
    HippiusRecord <$> o .: "key" <*> o .: "verified_sha256" <*> o .: "etag" <*> o .: "verified_at"

data Source = Source
  { srcCitekey :: Citekey, srcSha256 :: Sha256, srcBytes :: Int, srcTitle :: Text, srcAuthors :: [Text]
  , srcYear :: Year, srcProvenance :: Provenance, srcTopics :: [Topic], srcOrigin :: [FilePath]
  , srcHippius :: Maybe HippiusRecord }
  deriving stock (Eq, Show)
instance ToJSON Source where
  toJSON s = object $
    [ "citekey" .= srcCitekey s, "sha256" .= srcSha256 s, "bytes" .= srcBytes s, "title" .= srcTitle s
    , "authors" .= srcAuthors s, "year" .= srcYear s, "provenance" .= srcProvenance s
    , "topics" .= srcTopics s, "origin" .= srcOrigin s ] <> maybe [] (\h -> ["hippius" .= h]) (srcHippius s)
instance FromJSON Source where
  parseJSON = withObject "source" $ \o -> Source
    <$> o .: "citekey" <*> o .: "sha256" <*> o .: "bytes" <*> o .: "title" <*> o .:? "authors" .!= []
    <*> o .: "year" <*> o .: "provenance" <*> o .: "topics" <*> o .:? "origin" .!= [] <*> o .:? "hippius"

isRemoteBacked :: Source -> Bool
isRemoteBacked s = maybe False ((== sha256Text (srcSha256 s)) . hrVerifiedSha256) (srcHippius s)
