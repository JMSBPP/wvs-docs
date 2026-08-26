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
import Data.Time (UTCTime (..), fromGregorian)
import Fixture
import Shelf.Types

genSlug :: Gen T.Text
genSlug = T.intercalate "-" <$> Gen.list (Range.linear 1 4) (Gen.text (Range.linear 1 8) Gen.lower)

ep, bu :: T.Text
ep = "https://s3.hippius.com"
bu = "cfmm-refs"

at0 :: UTCTime
at0 = UTCTime (fromGregorian 2026 8 27) 0

-- | A source carrying @ts@ and no remote block.
srcOf :: [T.Text] -> Source
srcOf ts = Source (ck "x-2020") (sh 'b') 1 "t" [] (Year 2020) Unsourced (map Topic ts) [] Nothing

-- | A well-formed object for @t@ recording @sha@ as the verified digest.
objOf :: T.Text -> Sha256 -> RemoteObject
objOf t sha = RemoteObject
  { roTopic = Topic t, roKey = k, roUrl = objectUrl ep bu k
  , roEtag = "\"e\"", roVerifiedSha256 = sha, roVerifiedAt = at0 }
  where k = objectKey (Topic t) (ck "x-2020")

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

  , testGroup "mkTopic"
      [ testCase "accepts a slug" $ fmap topicText (mkTopic "mechanism-design") @?= Right "mechanism-design"
      , testCase "rejects uppercase, underscore, empty, stray dashes" $ do
          assertBool "upper" (isLeft (mkTopic "Mechanism"))
          assertBool "under" (isLeft (mkTopic "a_b"))
          assertBool "empty" (isLeft (mkTopic ""))
          assertBool "leading dash" (isLeft (mkTopic "-x"))
          assertBool "double dash" (isLeft (mkTopic "a--b"))
      , testCase "FromJSON validates" $ do
          A.decode "\"mechanism-design\"" @?= Just (Topic "mechanism-design")
          (A.decode "\"Mechanism\"" :: Maybe Topic) @?= Nothing
      ]

  , testCase "objectKey is topics/<topic>/<citekey>.pdf" $
      objectKey (Topic "options") (ck "x-2020") @?= "topics/options/x-2020.pdf"
  , testCase "objectUrl joins endpoint, bucket and key" $
      objectUrl ep bu "topics/options/x-2020.pdf"
        @?= "https://s3.hippius.com/cfmm-refs/topics/options/x-2020.pdf"

  , testCase "upsertObject replaces by topic and keeps objects sorted" $ do
      let s0 = srcOf ["options", "dgp"]
          s1 = upsertObject ep bu (objOf "options" (sh 'b')) s0
          s2 = upsertObject ep bu ((objOf "options" (sh 'b')) { roEtag = "\"f\"" }) s1
          s3 = upsertObject ep bu (objOf "dgp" (sh 'b')) s2
      fmap (map roTopic . rmObjects) (srcRemote s3) @?= Just [Topic "dgp", Topic "options"]
      fmap (map roEtag . rmObjects) (srcRemote s3) @?= Just ["\"e\"", "\"f\""]
      fmap rmEndpoint (srcRemote s3) @?= Just ep
      fmap rmBucket (srcRemote s3) @?= Just bu

  , testCase "remote-backed iff every carried topic is verified with a matching sha" $ do
      let bare = srcOf ["options", "dgp"]
          partial = upsertObject ep bu (objOf "options" (sh 'b')) bare
          full = upsertObject ep bu (objOf "dgp" (sh 'b')) partial
          drifted = upsertObject ep bu (objOf "dgp" (sh 'c')) partial
      isRemoteBacked bare @?= False
      isRemoteBacked partial @?= False
      isRemoteBacked full @?= True
      isRemoteBacked drifted @?= False
      missingTopics bare @?= [Topic "options", Topic "dgp"]
      missingTopics partial @?= [Topic "dgp"]
      missingTopics full @?= []
      missingTopics drifted @?= [Topic "dgp"]

  , testCase "staleObjects are the objects for topics no longer carried" $ do
      let s = upsertObject ep bu (objOf "dgp" (sh 'b')) (srcOf ["options"])
      map roTopic (staleObjects s) @?= [Topic "dgp"]
      map roTopic (staleObjects (srcOf ["options"])) @?= []

  , testCase "Source JSON round-trips through the remote block" $ do
      let s = upsertObject ep bu (objOf "options" (sh 'b')) (srcOf ["options"])
      A.decode (A.encode s) @?= Just s
      A.decode (A.encode (srcOf ["options"])) @?= Just (srcOf ["options"])
  ]
