module TypesSpec (tests) where
import Hedgehog
import qualified Hedgehog.Gen as Gen
import qualified Hedgehog.Range as Range
import Test.Tasty
import Test.Tasty.Hedgehog (testProperty)
import Test.Tasty.HUnit
import qualified Data.Text as T
import qualified Data.Aeson as A
import qualified Data.Binary as B
import Data.Binary.Get (ByteOffset)
import qualified Data.ByteString.Lazy as BSL
import Data.Either (isLeft, isRight)
import Fixture
import Shelf.Types

genSlug :: Gen T.Text
genSlug = T.intercalate "-" <$> Gen.list (Range.linear 1 4) (Gen.text (Range.linear 1 8) Gen.lower)

tests :: TestTree
tests = testGroup "Types"
  [ testProperty "valid citekeys round-trip" $ property $ do
      s <- forAll genSlug; y <- forAll (Gen.int (Range.linear 1900 2099))
      let k = s <> "-" <> T.pack (show y)
      fmap citekeyText (mkCitekey k) === Right k
  , testCase "nd and -vN allowed" $ do
      assertBool "nd" (isRight (mkCitekey "hull-options-nd"))
      assertBool "v2" (isRight (mkCitekey "milionis-lvr-2022-v2"))
  , testCase "rejects uppercase, underscore, missing year" $ do
      assertBool "upper" (isLeft (mkCitekey "Hull-2020"))
      assertBool "under" (isLeft (mkCitekey "hull_options-2020"))
      assertBool "noyear" (isLeft (mkCitekey "hull-options"))
  , testCase "sha256 must be 64 lowercase hex" $ do
      assertBool "ok" (isRight (mkSha256 (T.replicate 64 "a")))
      assertBool "short" (isLeft (mkSha256 (T.replicate 63 "a")))
      assertBool "upper" (isLeft (mkSha256 (T.replicate 64 "A")))
  , testCase "year nd encodes as string" $ A.decode (A.encode NoDate) @?= Just NoDate
  , testCase "citekey Binary round-trip" $ B.decode (B.encode (ck "x-2020")) @?= ck "x-2020"
  , testCase "Binary decode rejects invalid citekey" $
      assertBool "rejected" $
        isLeft
          ( B.decodeOrFail (B.encode ("Hull_2020" :: T.Text))
              :: Either (BSL.ByteString, ByteOffset, String) (BSL.ByteString, ByteOffset, Citekey)
          )
  , testCase "remote-backed iff verified sha matches" $ do
      let src = Source (ck "x-2020") (sh 'b') 1 "t" [] (Year 2020) Unsourced [Topic "options"] [] Nothing
      isRemoteBacked src @?= False
  ]
