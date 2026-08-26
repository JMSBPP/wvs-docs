-- | BM25 full-text search over sources, plus rendering of per-topic and
-- top-level topic-index markdown. The index is a flat 'Binary'-serialised
-- blob keyed off the manifest hash: 'indexFresh' tells the caller whether a
-- cached index still matches the current manifest, so a rebuild can be
-- skipped when nothing has changed.
module Shelf.Index
  ( Doc (..), Index (..), tokenize, buildIndex, search, saveIndex, loadIndex, indexFresh
  , renderTopicIndex, renderTopicsReadme
  ) where

import Data.Binary (Binary (..), decodeOrFail, encode)
import qualified Data.ByteString.Lazy as BSL
import Data.List (sortBy, sortOn)
import Data.Map.Strict (Map)
import qualified Data.Map.Strict as M
import Data.Ord (Down (..), comparing)
import qualified Data.Set as S
import Data.Text (Text)
import qualified Data.Text as T
import System.Directory (doesFileExist)
import Shelf.Atomic (writeAtomic)
import Shelf.Scan.Slug (slug)
import Shelf.Types (Citekey, Source (..), Topic (..), Year (..), citekeyText)

data Doc = Doc { docId :: Citekey, docTitle :: Text, docBody :: Text }
  deriving stock (Eq, Show)

data Index = Index
  { ixManifestHash :: Text
  , ixN :: Int
  , ixAvgDl :: Double
  , ixDl :: Map Citekey Int
  , ixPostings :: Map Text (Map Citekey Int)
  } deriving stock (Eq, Show)

instance Binary Index where
  put ix = put (ixManifestHash ix) >> put (ixN ix) >> put (ixAvgDl ix) >> put (ixDl ix) >> put (ixPostings ix)
  get = Index <$> get <*> get <*> get <*> get <*> get

-- | Lowercase, ASCII-fold (reusing 'slug''s Latin-1 mapping), split on any
-- run of non-@[a-z0-9]@ characters, drop tokens shorter than 2 characters.
tokenize :: Text -> [Text]
tokenize = filter ((>= 2) . T.length) . T.splitOn "-" . slug

k1, bParam :: Double
k1 = 1.2
bParam = 0.75

-- | Title tokens are counted three times, both in term frequency and in
-- document length, so a title hit outweighs the same word buried in the body.
buildIndex :: Text -> [Doc] -> Index
buildIndex manifestHash docs = Index
  { ixManifestHash = manifestHash
  , ixN = n
  , ixAvgDl = if n == 0 then 0 else fromIntegral (sum dls) / fromIntegral n
  , ixDl = M.fromList (zip (map docId docs) dls)
  , ixPostings = M.fromListWith (M.unionWith (+))
      [ (term, M.singleton (docId d) count)
      | d <- docs, (term, count) <- M.toList (tfOf d) ]
  }
  where
    n = length docs
    dls = map (length . tokensOf) docs
    tokensOf d = concat (replicate 3 (tokenize (docTitle d))) ++ tokenize (docBody d)
    tfOf d = M.fromListWith (+) [ (t, 1 :: Int) | t <- tokensOf d ]

-- | Top-@limit@ documents by BM25 score, descending, positive scores only.
search :: Index -> Text -> Int -> [(Citekey, Double)]
search ix q limit =
  take limit
    . sortBy (comparing (Down . snd))
    . filter ((> 0) . snd)
    . map (\c -> (c, scoreDoc c))
    $ S.toList candidates
  where
    qTokens = tokenize q
    candidates = S.unions [ maybe S.empty M.keysSet (M.lookup t (ixPostings ix)) | t <- qTokens ]
    n = fromIntegral (ixN ix) :: Double
    avgdl = ixAvgDl ix
    scoreDoc c = sum (map (termScore c) qTokens)
    termScore c t =
      let postings = M.findWithDefault M.empty t (ixPostings ix)
          df = fromIntegral (M.size postings) :: Double
          idf = log (1 + (n - df + 0.5) / (df + 0.5))
          tf = fromIntegral (M.findWithDefault 0 c postings) :: Double
          dl = fromIntegral (M.findWithDefault 0 c (ixDl ix)) :: Double
          denom = tf + k1 * (1 - bParam + bParam * dl / avgdl)
      in if denom == 0 then 0 else idf * tf * (k1 + 1) / denom

saveIndex :: FilePath -> Index -> IO ()
saveIndex p = writeAtomic p . BSL.toStrict . encode

-- | 'Nothing' when the file is missing or fails to decode.
loadIndex :: FilePath -> IO (Maybe Index)
loadIndex p = do
  exists <- doesFileExist p
  if not exists
    then pure Nothing
    else do
      bytes <- BSL.readFile p
      pure $ case decodeOrFail bytes of
        Left _ -> Nothing
        Right (_, _, ix) -> Just ix

indexFresh :: Text -> Maybe Index -> Bool
indexFresh h = maybe False ((== h) . ixManifestHash)

renderTopicIndex :: Topic -> [Source] -> [FilePath] -> [FilePath] -> Text
renderTopicIndex (Topic t) srcs notes exercises = T.unlines $
  [ "# " <> t, "", "## Sources", "| citekey | title | year |", "|---|---|---|" ]
  ++ map sourceRow (sortOn srcCitekey srcs)
  ++ [ "", "## Notes" ] ++ listOrNone notes
  ++ [ "", "## Exercises" ] ++ listOrNone exercises
  where
    sourceRow s = "| [@" <> citekeyText (srcCitekey s) <> "] | " <> cell (srcTitle s) <> " | " <> yearText (srcYear s) <> " |"
    -- A GFM table cell is one line and cannot hold a raw @|@: an unescaped
    -- pipe or newline in a title would split it across columns or rows.
    cell = T.unwords . T.lines . T.replace "\r" "\n" . T.replace "|" "\\|"
    yearText (Year y) = T.pack (show y)
    yearText NoDate = "nd"
    listOrNone xs = if null xs then ["- _none_"] else map (("- " <>) . T.pack) xs

renderTopicsReadme :: [(Topic, Int)] -> Text
renderTopicsReadme rows = T.unlines $
  [ "# Topics", "", "| topic | sources |", "|---|---|" ] ++ map row (sortOn (unTopic . fst) rows)
  where
    row (Topic t, n) = "| [" <> t <> "](" <> t <> "/INDEX.md) | " <> T.pack (show n) <> " |"
    unTopic (Topic t) = t
