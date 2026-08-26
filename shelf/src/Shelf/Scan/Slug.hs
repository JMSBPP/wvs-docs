-- | String-level helpers behind 'Shelf.Scan.proposeCitekey'. Split out of
-- "Shelf.Scan" to keep that module focused on filesystem and row logic.
module Shelf.Scan.Slug (slug, stopWords, firstSurname, readInt, stripCitekeyVersion) where

import Data.Char (isAsciiLower, isDigit)
import Data.List (find)
import Data.Maybe (listToMaybe)
import Data.Text (Text)
import qualified Data.Text as T
import qualified Data.Text.Read as TR

-- | Lowercase, fold the common accented Latin letters to ASCII, turn every
-- other non-@[a-z0-9]@ character into a separator, then collapse and trim the
-- separator runs. The result is always a (possibly empty) citekey segment
-- sequence: @T.all (\\c -> isAsciiLower c || isDigit c || c == '-')@ holds and
-- there are no leading, trailing, or doubled dashes.
slug :: Text -> Text
slug = T.intercalate "-" . filter (not . T.null) . T.splitOn "-" . T.map keep . T.toLower
  where
    keep c
      | isAsciiLower c || isDigit c = c
      | Just i <- T.findIndex (== c) accented = T.index folded i
      | otherwise = '-'
    accented = "\225\224\228\226\227\233\232\235\234\237\236\239\238\243\242\246\244\245\250\249\252\251\241\231"
    folded = "aaaaaeeeeiiiiooooouuuunc"

stopWords :: [Text]
stopWords = ["the", "a", "an", "of", "for", "in", "on", "and"]

-- | Slugged last whitespace-separated word of the first author. Authors are
-- separated by @;@ or @,@, which also makes @"Doe, Jane"@ yield @"doe"@.
firstSurname :: Text -> Maybe Text
firstSurname raw = do
  first <- find (not . T.null) (map T.strip (T.split (\c -> c == ';' || c == ',') raw))
  surname <- listToMaybe (reverse (T.words first))
  let s = slug surname
  if T.null s then Nothing else Just s

readInt :: Text -> Maybe Int
readInt t = case TR.decimal t of Right (n, rest) | T.null rest -> Just n; _ -> Nothing

-- | Drop a trailing @-vN@ so re-running the duplicate flagger is idempotent.
stripCitekeyVersion :: Text -> Text
stripCitekeyVersion k = case T.breakOnEnd "-v" k of
  (pre, suf) | not (T.null pre), not (T.null suf), T.all isDigit suf -> T.dropEnd 2 pre
  _ -> k
