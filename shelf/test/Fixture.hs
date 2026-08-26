module Fixture (right, ck, sh) where
import Data.Text (Text)
import qualified Data.Text as T
import Shelf.Types

right :: Show e => Either e a -> a
right = either (error . show) id

ck :: Text -> Citekey
ck = right . mkCitekey

sh :: Char -> Sha256
sh c = right (mkSha256 (T.replicate 64 (T.singleton c)))
