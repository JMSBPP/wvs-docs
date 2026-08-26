-- | The manifest's value types. Every identifier that becomes part of a path,
-- a URL or a citation is a validated newtype, so an invalid one cannot be
-- constructed by parsing: 'Citekey' names files, 'Topic' names both a
-- directory and a remote key segment, and 'Sha256' is the identity of a PDF.
--
-- The @remote@ block records, per (source, topic), the object that was
-- verified by downloading it back. It carries its own endpoint and bucket so
-- that rendering a URL — on a card, in an index, inside 'Shelf.Manifest.check'
-- — never depends on the environment the tool happens to run in.
module Shelf.Types
  ( Citekey, mkCitekey, citekeyText, Sha256, mkSha256, sha256Text
  , Topic (..), mkTopic, topicText, Provenance (..), Year (..)
  , RemoteObject (..), Remote (..), Source (..)
  , objectKey, objectUrl, upsertObject
  , verifiedObject, isRemoteBacked, missingTopics, staleObjects
  ) where

import Data.Aeson
import Data.Aeson.Types (Parser)
import Data.Binary (Binary (..))
import Data.Char (isAsciiLower, isDigit, isHexDigit, isUpper)
import Data.List (sortOn)
import Data.Text (Text)
import qualified Data.Text as T
import Data.Time (UTCTime)

newtype Citekey = Citekey Text deriving stock (Eq, Ord, Show)
newtype Sha256  = Sha256 Text  deriving stock (Eq, Ord, Show)
newtype Topic   = Topic Text   deriving stock (Eq, Ord, Show)

citekeyText :: Citekey -> Text
citekeyText (Citekey t) = t
sha256Text :: Sha256 -> Text
sha256Text (Sha256 t) = t
topicText :: Topic -> Text
topicText (Topic t) = t

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

-- | @^[a-z0-9]+(-[a-z0-9]+)*$@. A topic is a directory name and a remote key
-- segment, so anything that would need escaping in either is refused here.
mkTopic :: Text -> Either Text Topic
mkTopic t
  | all seg (T.splitOn "-" t) = Right (Topic t)
  | otherwise = Left ("invalid topic: " <> t)
  where seg p = not (T.null p) && T.all (\c -> isAsciiLower c || isDigit c) p

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
instance FromJSON Topic where parseJSON = withText "topic" (either (fail . T.unpack) pure . mkTopic)
instance ToJSON Topic where toJSON = toJSON . topicText

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

-- | One uploaded copy of a source's PDF, under one of its topics, as verified
-- by downloading it back: 'roVerifiedSha256' is the digest of what came back,
-- not of what was sent.
data RemoteObject = RemoteObject
  { roTopic :: Topic, roKey :: Text, roUrl :: Text, roEtag :: Text
  , roVerifiedSha256 :: Sha256, roVerifiedAt :: UTCTime }
  deriving stock (Eq, Show)
instance ToJSON RemoteObject where
  toJSON o = object
    [ "topic" .= roTopic o, "key" .= roKey o, "url" .= roUrl o, "etag" .= roEtag o
    , "verified_sha256" .= roVerifiedSha256 o, "verified_at" .= roVerifiedAt o ]
instance FromJSON RemoteObject where
  parseJSON = withObject "remote object" $ \o -> RemoteObject
    <$> o .: "topic" <*> o .: "key" <*> o .: "url" <*> o .: "etag"
    <*> o .: "verified_sha256" <*> o .: "verified_at"

data Remote = Remote { rmEndpoint :: Text, rmBucket :: Text, rmObjects :: [RemoteObject] }
  deriving stock (Eq, Show)
instance ToJSON Remote where
  toJSON r = object ["endpoint" .= rmEndpoint r, "bucket" .= rmBucket r, "objects" .= rmObjects r]
instance FromJSON Remote where
  parseJSON = withObject "remote" $ \o -> Remote
    <$> o .: "endpoint" <*> o .: "bucket" <*> o .:? "objects" .!= []

data Source = Source
  { srcCitekey :: Citekey, srcSha256 :: Sha256, srcBytes :: Int, srcTitle :: Text, srcAuthors :: [Text]
  , srcYear :: Year, srcProvenance :: Provenance, srcTopics :: [Topic], srcOrigin :: [FilePath]
  , srcRemote :: Maybe Remote }
  deriving stock (Eq, Show)
instance ToJSON Source where
  toJSON s = object $
    [ "citekey" .= srcCitekey s, "sha256" .= srcSha256 s, "bytes" .= srcBytes s, "title" .= srcTitle s
    , "authors" .= srcAuthors s, "year" .= srcYear s, "provenance" .= srcProvenance s
    , "topics" .= srcTopics s, "origin" .= srcOrigin s ] <> maybe [] (\r -> ["remote" .= r]) (srcRemote s)
instance FromJSON Source where
  parseJSON = withObject "source" $ \o -> Source
    <$> o .: "citekey" <*> o .: "sha256" <*> o .: "bytes" <*> o .: "title" <*> o .:? "authors" .!= []
    <*> o .: "year" <*> o .: "provenance" <*> o .: "topics" <*> o .:? "origin" .!= [] <*> o .:? "remote"

-- | @topics/\<topic\>/\<citekey\>.pdf@ — one object per (source, topic), so a
-- topic prefix on the bucket lists exactly that topic's shelf.
objectKey :: Topic -> Citekey -> Text
objectKey (Topic t) ck = "topics/" <> t <> "/" <> citekeyText ck <> ".pdf"

-- | Path-style S3: @\<endpoint\>/\<bucket\>/\<key\>@. A trailing slash on the
-- endpoint is dropped so the two spellings agree.
objectUrl :: Text -> Text -> Text -> Text
objectUrl endpoint bucket key = T.dropWhileEnd (== '/') endpoint <> "/" <> bucket <> "/" <> key

-- | Record @o@ against its topic, replacing any object already held for that
-- topic and keeping the list sorted by topic. The remote block is created when
-- the source has none; @endpoint@ and @bucket@ are the caller's, so a source
-- cannot end up half-described by an old endpoint.
upsertObject :: Text -> Text -> RemoteObject -> Source -> Source
upsertObject endpoint bucket o s = s { srcRemote = Just (Remote endpoint bucket objects) }
  where
    old = maybe [] rmObjects (srcRemote s)
    objects = sortOn roTopic (o : filter ((/= roTopic o) . roTopic) old)

-- | The object recorded for @t@, provided it is verified: its key is the one
-- this source's topic implies and its digest is the source's own.
verifiedObject :: Topic -> Source -> Maybe RemoteObject
verifiedObject t s = case [o | o <- objects, roTopic o == t, verified o] of
  (o : _) -> Just o
  [] -> Nothing
  where
    objects = maybe [] rmObjects (srcRemote s)
    verified o = roVerifiedSha256 o == srcSha256 s && roKey o == objectKey (roTopic o) (srcCitekey s)

-- | Carried topics with no verified object. A source with no @remote@ block at
-- all is simply missing all of them.
missingTopics :: Source -> [Topic]
missingTopics s = [t | t <- srcTopics s, Nothing <- [verifiedObject t s]]

-- | Objects left behind for topics the source no longer carries.
staleObjects :: Source -> [RemoteObject]
staleObjects s = [o | o <- maybe [] rmObjects (srcRemote s), roTopic o `notElem` srcTopics s]

-- | Every carried topic has a verified object. Never true without a @remote@
-- block, so an untouched source is not mistaken for a backed one.
isRemoteBacked :: Source -> Bool
isRemoteBacked s = maybe False (const (null (missingTopics s))) (srcRemote s)
