-- | Topic-card scaffolding and header refresh. A card is the human-facing home
-- for a source inside one topic: 'scaffoldCard' only ever creates a missing
-- one, and 'refreshCardHeader' rewrites the front matter of an existing card
-- while leaving the body — the notes a human wrote — byte-for-byte alone.
--
-- The front matter is emitted field by field in a fixed order rather than via
-- 'Data.Yaml.encode' on an object, because aeson's key order is not stable and
-- a card's header should be diff-friendly. Scalars are still quoted by the
-- YAML encoder, so a title containing a colon cannot break the header.
--
-- The header is per topic, not per source: @pdf@ names the object uploaded for
-- /this/ card's topic, or @~@ while there is none.
module Shelf.Apply.Cards (scaffoldCard, cardText, cardHeader, refreshCardHeader) where

import Control.Monad (unless)
import Data.Aeson (Value (String))
import qualified Data.ByteString as BS
import Data.Text (Text)
import qualified Data.Text as T
import qualified Data.Text.Encoding as TE
import qualified Data.Yaml as Y
import System.Directory (createDirectoryIfMissing, doesFileExist)
import System.FilePath ((<.>), (</>))
import System.IO (hPutStrLn, stderr)
import Shelf.Apply.Paths (RepoPaths (..))
import Shelf.Atomic (writeAtomic)
import Shelf.Types

cardPath :: RepoPaths -> Source -> Topic -> FilePath
cardPath rp s (Topic t) =
  rpTopics rp </> T.unpack t </> "refs" </> T.unpack (citekeyText (srcCitekey s)) <.> "md"

scaffoldCard :: RepoPaths -> Source -> Topic -> IO ()
scaffoldCard rp s tp = do
  createDirectoryIfMissing True (rpTopics rp </> T.unpack (topicText tp) </> "refs")
  there <- doesFileExist path
  unless there (writeAtomic path (TE.encodeUtf8 (cardText s tp)))
  where path = cardPath rp s tp

-- | Rewrite the leading @---@ … @---@ block of an existing card and nothing
-- else; scaffold the card when it is not there yet. A card whose header
-- already says what it should is not rewritten at all, so re-running
-- @shelf index@ leaves every mtime alone.
--
-- A card that opens a front-matter block and never closes it is malformed,
-- and this refuses it: it is warned about by name and left byte-for-byte
-- alone. Prepending a second header would produce a file with two @---@
-- openers whose first block is the generated one and whose remainder is
-- somebody's unclosed edit — a card that renders wrong everywhere and whose
-- original text is now buried.
refreshCardHeader :: RepoPaths -> Source -> Topic -> IO ()
refreshCardHeader rp s tp = do
  there <- doesFileExist path
  if not there then scaffoldCard rp s tp else do
    old <- TE.decodeUtf8Lenient <$> BS.readFile path
    case replaceHeader (cardHeader s tp) old of
      Nothing -> hPutStrLn stderr
        (path <> ": front matter opens with --- and never closes; left untouched")
      Just new -> unless (new == old) (writeAtomic path (TE.encodeUtf8 new))
  where path = cardPath rp s tp

-- | Splice @hdr@ in front of the body. Splitting on @\\n@ and rejoining with
-- @\\n@ is lossless, so whatever followed the closing fence — trailing spaces,
-- a missing final newline — comes back unchanged. Text with no front matter at
-- all keeps all of itself as the body; text with an /unterminated/ one is
-- 'Nothing', which the caller reports rather than rewrites.
replaceHeader :: [Text] -> Text -> Maybe Text
replaceHeader hdr txt = case T.splitOn "\n" txt of
  ("---" : rest) -> case break (== "---") rest of
    (_, "---" : body) -> Just (T.unlines hdr <> T.intercalate "\n" body)
    _ -> Nothing
  _ -> Just (T.unlines hdr <> txt)

cardText :: Source -> Topic -> Text
cardText s tp = T.unlines (cardHeader s tp <> ["", "## Notes", ""])

-- | The front-matter block, fences included.
cardHeader :: Source -> Topic -> [Text]
cardHeader s tp =
  [ "---"
  , "citekey: " <> citekeyText (srcCitekey s)
  , "title: " <> scalar (srcTitle s)
  , "authors: " <> flowList (srcAuthors s)
  , "year: " <> yearText (srcYear s)
  , "provenance: " <> provText (srcProvenance s)
  , "sha256: " <> sha256Text (srcSha256 s)
  , "topics: " <> flowList [t | Topic t <- srcTopics s]
  , "pdf: " <> maybe "~" (scalar . roUrl) (verifiedObject tp s)
  , "---" ]
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
