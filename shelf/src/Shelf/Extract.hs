module Shelf.Extract
  ( PdfInfo (..), pdfInfo, pdfToText, pdfToLayout, firstPage, pdftotextVersion, extractorVersion
  , headerLines, applyHeaders, Stamp (..), renderText, stampOf, upToDate ) where
import Data.Char (isDigit, isLower, isUpper)
import Data.Maybe (fromMaybe)
import qualified Data.ByteString.Lazy as BL
import Data.Text (Text)
import qualified Data.Text as T
import qualified Data.Text.Encoding as TE
import qualified Data.Text.Read as TR
import qualified Data.Set as S
import System.Exit (ExitCode (..))
import System.Process.Typed (proc, readProcess)
import Shelf.Types

extractorVersion :: Text
extractorVersion = "1"

runTool :: String -> [String] -> IO (Either Text Text)
runTool tool args = do
  (code, out, err) <- readProcess (proc tool args)
  pure $ case code of
    ExitSuccess -> Right (TE.decodeUtf8Lenient (BL.toStrict out))
    ExitFailure n -> Left (T.pack tool <> " exit " <> T.pack (show n) <> ": " <> TE.decodeUtf8Lenient (BL.toStrict err))

pdfToText, pdfToLayout, firstPage :: FilePath -> IO (Either Text Text)
pdfToText p = runTool "pdftotext" ["-raw", "-enc", "UTF-8", p, "-"]
pdfToLayout p = runTool "pdftotext" ["-layout", "-enc", "UTF-8", p, "-"]
firstPage p = runTool "pdftotext" ["-raw", "-enc", "UTF-8", "-f", "1", "-l", "1", p, "-"]

pdftotextVersion :: IO Text   -- `pdftotext -v` prints "pdftotext version X.Y.Z" on stderr, exit 0
pdftotextVersion = do
  (_, _, err) <- readProcess (proc "pdftotext" ["-v"])
  pure (T.strip (T.replace "pdftotext version " "" (T.takeWhile (/= '\n') (TE.decodeUtf8Lenient (BL.toStrict err)))))

data PdfInfo = PdfInfo { piTitle, piAuthor, piProducer :: Maybe Text, piCreationYear :: Maybe Int, piPages :: Int }
  deriving stock (Eq, Show)

decimal :: Text -> Maybe Int
decimal t = case TR.decimal t of Right (n, rest) | T.null rest -> Just n; _ -> Nothing

pdfInfo :: FilePath -> IO (Either Text PdfInfo)
pdfInfo p = fmap parse <$> runTool "pdfinfo" [p]
  where
    parse out =
      let kv = [ (T.strip k, T.strip (T.drop 1 v)) | l <- T.lines out, let (k, v) = T.breakOn ":" l, not (T.null v) ]
          get k = case lookup k kv of Just v | not (T.null v) -> Just v; _ -> Nothing
          year = get "CreationDate" >>= \d -> case [y | w <- T.words d, T.length w == 4, Just y <- [decimal w]] of (y : _) -> Just y; _ -> Nothing
      in PdfInfo (get "Title") (get "Author") (get "Producer") year (fromMaybe 0 (get "Pages" >>= decimal))

-- Layout-mode (`-layout`) output uses runs of spaces for column alignment
-- (e.g. "1   Introduction"), while raw-mode (`-raw`) output collapses those
-- to single spaces (e.g. "1 Introduction"). `T.strip` alone only trims the
-- ends, so it would never match a layout-derived header line against its
-- raw-mode occurrence; normalize internal whitespace too.
normalizeWs :: Text -> Text
normalizeWs = T.unwords . T.words

-- ^\d+(\.\d+)*\s+[A-Z][a-z]
headerLines :: Text -> [Text]
headerLines = filter isHeader . map normalizeWs . T.lines
  where
    isHeader l = case T.words l of
      (n : w : _) -> numbered n && T.length w >= 2 && isUpper (T.head w) && isLower (T.index w 1)
      _ -> False
    numbered n = not (T.null n) && T.all (\c -> isDigit c || c == '.') n && isDigit (T.head n) && isDigit (T.last n)

applyHeaders :: [Text] -> Text -> Text
applyHeaders hs = T.intercalate "\n" . map mark . T.lines
  where set = S.fromList hs
        mark l = if normalizeWs l `S.member` set then "## " <> l else l

data Stamp = Stamp { stSha256 :: Text, stPdftotext :: Text, stExtractor :: Text, stBodyBytes :: Int } deriving stock (Eq, Show)

renderText :: Stamp -> Text -> Text
renderText st body = T.intercalate "\n"
  [ "---", "sha256: " <> stSha256 st, "pdftotext_version: " <> stPdftotext st, "extractor_version: " <> stExtractor st
  , "body_bytes: " <> T.pack (show (stBodyBytes st)), "---", body ]

stampOf :: Text -> Maybe Stamp
stampOf t = case T.lines t of
  ("---" : a : b : c : d : "---" : _) ->
    Stamp <$> T.stripPrefix "sha256: " a <*> T.stripPrefix "pdftotext_version: " b <*> T.stripPrefix "extractor_version: " c
          <*> (T.stripPrefix "body_bytes: " d >>= decimal)
  _ -> Nothing

upToDate :: Sha256 -> Maybe Stamp -> Int -> Bool
upToDate sha (Just st) actual = stSha256 st == sha256Text sha && stExtractor st == extractorVersion && stBodyBytes st == actual
upToDate _ Nothing _ = False
