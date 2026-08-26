-- | Topic-card scaffolding. A card is the human-facing home for a source
-- inside one topic, so the tool only ever creates a missing one: an existing
-- card carries notes and is never rewritten.
--
-- The front matter is emitted field by field in a fixed order rather than via
-- 'Data.Yaml.encode' on an object, because aeson's key order is not stable and
-- a card's header should be diff-friendly. Scalars are still quoted by the
-- YAML encoder, so a title containing a colon cannot break the header.
module Shelf.Apply.Cards (scaffoldCard, cardText) where

import Control.Monad (unless)
import Data.Aeson (Value (String))
import Data.Text (Text)
import qualified Data.Text as T
import qualified Data.Text.Encoding as TE
import qualified Data.Yaml as Y
import System.Directory (createDirectoryIfMissing, doesFileExist)
import System.FilePath ((<.>), (</>))
import Shelf.Apply.Paths (RepoPaths (..))
import Shelf.Atomic (writeAtomic)
import Shelf.Types

scaffoldCard :: RepoPaths -> Source -> Topic -> IO ()
scaffoldCard rp s (Topic t) = do
  createDirectoryIfMissing True dir
  there <- doesFileExist path
  unless there (writeAtomic path (TE.encodeUtf8 (cardText s)))
  where
    dir = rpTopics rp </> T.unpack t </> "refs"
    path = dir </> T.unpack (citekeyText (srcCitekey s)) <.> "md"

cardText :: Source -> Text
cardText s = T.unlines
  [ "---"
  , "citekey: " <> citekeyText (srcCitekey s)
  , "title: " <> scalar (srcTitle s)
  , "authors: " <> flowList (srcAuthors s)
  , "year: " <> yearText (srcYear s)
  , "provenance: " <> provText (srcProvenance s)
  , "sha256: " <> sha256Text (srcSha256 s)
  , "topics: " <> flowList [t | Topic t <- srcTopics s]
  , "---"
  , ""
  , "## Notes"
  , "" ]
  where
    yearText (Year y) = T.pack (show y)
    yearText NoDate = "nd"
    provText = \case
      ArXiv i -> "{kind: arxiv, id: " <> scalar i <> "}"
      Doi i -> "{kind: doi, id: " <> scalar i <> "}"
      Isbn i -> "{kind: isbn, id: " <> scalar i <> "}"
      Unsourced -> "{kind: unsourced}"
    flowList xs = "[" <> T.intercalate ", " (map scalar xs) <> "]"

-- | Quote a scalar exactly as YAML requires, by asking the YAML encoder. Any
-- embedded newline is flattened first so the encoder cannot answer with a
-- multi-line block scalar.
scalar :: Text -> Text
scalar = T.strip . TE.decodeUtf8Lenient . Y.encode . String . T.unwords . T.words
