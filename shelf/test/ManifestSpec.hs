module ManifestSpec (tests) where
import Test.Tasty; import Test.Tasty.HUnit; import Test.Tasty.Hedgehog (testProperty)
import Hedgehog hiding (check); import qualified Hedgehog.Gen as Gen; import qualified Hedgehog.Range as Range
import System.IO.Temp (withSystemTempDirectory); import System.FilePath ((</>))
import Data.List (sortOn); import Data.Either (isLeft)
import qualified Data.Text as T
import Fixture; import Shelf.Types; import Shelf.Manifest

mkSrc :: T.Text -> Char -> [T.Text] -> Source
mkSrc k c ts = Source (ck k) (sh c) 10 "title" ["a"] (Year 2020) Unsourced (map Topic ts) [] Nothing

genSrc :: Gen Source
genSrc = do
  k <- Gen.text (Range.linear 1 6) Gen.lower; y <- Gen.int (Range.linear 1950 2030)
  h <- Gen.text (Range.singleton 64) (Gen.element ("0123456789abcdef" :: [Char]))
  pure (Source (ck (k <> "-" <> T.pack (show y))) (right (mkSha256 h)) 10 "t" [] (Year y) Unsourced [Topic "options"] [] Nothing)

tests :: TestTree
tests = testGroup "Manifest"
  [ testProperty "save/load round-trip, sorted" $ property $ do
      srcs <- forAll (Gen.list (Range.linear 0 5) genSrc)
      loaded <- evalIO $ withSystemTempDirectory "mf" $ \d -> do
        let p = d </> "sources.yaml"
        saveManifest p (Manifest 1 srcs); loadManifest p
      fmap (map srcCitekey . mfSources) loaded === Right (map srcCitekey (sortOn srcCitekey srcs))
  , testCase "missing file is empty manifest (lenient) / error (strict)" $ withSystemTempDirectory "mf" $ \d -> do
      r <- loadManifest (d </> "none.yaml"); fmap mfSources r @?= Right []
      s <- loadManifestStrict (d </> "none.yaml"); assertBool "strict" (isLeft s)
  , testCase "upsert replaces by sha" $ do
      let a = mkSrc "a-2020" '1' ["options"]
      map srcTitle (mfSources (upsert a { srcTitle = "new" } (Manifest 1 [a]))) @?= ["new"]
  , testCase "check reports schema, dup citekey, unknown topic, empty topics" $ do
      let a = mkSrc "a-2020" '1' ["options"]; b = mkSrc "a-2020" '2' ["nope"]; c = mkSrc "c-2020" '3' []
      length (check [Topic "options"] (Manifest 2 [a, b, c])) @?= 4
  ]
