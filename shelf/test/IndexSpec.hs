module IndexSpec (tests) where

import Hedgehog
import qualified Hedgehog.Gen as Gen
import qualified Hedgehog.Range as Range
import Test.Tasty
import Test.Tasty.Hedgehog (testProperty)
import Test.Tasty.HUnit
import Data.Text (Text)
import qualified Data.Text as T
import System.FilePath ((</>))
import System.IO.Temp (withSystemTempDirectory)
import Fixture
import Shelf.Index
import Shelf.Types

titleDocId :: Citekey
titleDocId = ck "optfees-2023"

fiveDocs :: [Doc]
fiveDocs =
  [ Doc titleDocId "Optimal Dynamic Fees for AMMs"
      "Dynamic fee schedules improve LP returns under volatility."
  , Doc (ck "volswap-2020") "Volatility Swaps Overview"
      "A survey of volatility swap payoffs and pricing models."
  , Doc (ck "loss-2019") "Impermanent Loss Analysis"
      "Quantifying impermanent loss in constant product pools."
  , Doc (ck "opt-2018") "Options Pricing Basics"
      "Black Scholes model for European options pricing."
  , Doc (ck "liq-2021") "Liquidity Provision Strategies"
      "Concentrated liquidity ranges and order strategies."
  ]

genDoc :: Gen Doc
genDoc = do
  s <- Gen.text (Range.linear 1 6) Gen.lower
  y <- Gen.int (Range.linear 1900 2099)
  let k = right (mkCitekey (s <> "-" <> T.pack (show y)))
  Doc k <$> genWords <*> genWords

genWords :: Gen Text
genWords = T.unwords <$> Gen.list (Range.linear 0 5) (Gen.text (Range.linear 1 8) Gen.lower)

tests :: TestTree
tests = testGroup "Index"
  [ testGroup "tokenize"
      [ testCase "folds accents, splits, drops short tokens" $
          tokenize "Résumé of AMMs, v2!" @?= ["resume", "of", "amms", "v2"]
      , testCase "empty text" $ tokenize "" @?= []
      , testCase "single-char tokens dropped" $ tokenize "a b cd" @?= ["cd"]
      ]
  , testCase "title query lands the titled doc in the top 3" $ do
      let ix = buildIndex "h" fiveDocs
          results = map fst (search ix "optimal dynamic fees" 3)
      assertBool ("expected " <> show titleDocId <> " in " <> show results) (titleDocId `elem` results)
  , testCase "unknown term yields no results" $ do
      let ix = buildIndex "h" fiveDocs
      search ix "zzznotpresent" 5 @?= []
  , testGroup "indexFresh"
      [ testCase "true when manifest hash matches" $
          indexFresh "h1" (Just (buildIndex "h1" fiveDocs)) @?= True
      , testCase "false when manifest hash differs" $
          indexFresh "h2" (Just (buildIndex "h1" fiveDocs)) @?= False
      , testCase "false when there is no index" $
          indexFresh "h1" Nothing @?= False
      ]
  , testCase "renderTopicIndex lists sources, notes, exercises" $ do
      let srcA = Source (ck "a-2020") (sh 'a') 10 "Title A" [] (Year 2020) Unsourced [Topic "options"] [] Nothing
          srcB = Source (ck "b-2021") (sh 'b') 10 "Title B" [] NoDate Unsourced [Topic "options"] [] Nothing
          out = renderTopicIndex (Topic "options") [srcB, srcA] ["notes/a.md"] []
      assertBool "heading" ("# options" `T.isInfixOf` out)
      assertBool "row a" ("[@a-2020] | Title A | 2020" `T.isInfixOf` out)
      assertBool "row b" ("[@b-2021] | Title B | nd" `T.isInfixOf` out)
      assertBool "notes heading" ("## Notes" `T.isInfixOf` out)
      assertBool "note listed" ("notes/a.md" `T.isInfixOf` out)
      assertBool "exercises heading" ("## Exercises" `T.isInfixOf` out)
      assertBool "exercises empty" ("_none_" `T.isInfixOf` out)
  , testCase "renderTopicsReadme lists every topic" $ do
      let out = renderTopicsReadme [(Topic "options", 3), (Topic "amm-design", 1)]
      assertBool "options row" ("[options](options/INDEX.md) | 3" `T.isInfixOf` out)
      assertBool "amm-design row" ("[amm-design](amm-design/INDEX.md) | 1" `T.isInfixOf` out)
  , testProperty "Binary round-trip preserves search results" $ property $ do
      docs <- forAll (Gen.list (Range.linear 0 6) genDoc)
      q <- forAll genWords
      let ix = buildIndex "h" docs
      loaded <- evalIO $ withSystemTempDirectory "shelf-index" $ \d -> do
        let p = d </> "index.bin"
        saveIndex p ix
        loadIndex p
      case loaded of
        Nothing -> Hedgehog.failure
        Just ix' -> search ix' q 10 === search ix q 10
  ]
