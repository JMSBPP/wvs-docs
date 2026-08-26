module ExtractSpec (tests) where
import Test.Tasty
import Test.Tasty.HUnit
import Test.Tasty.Golden (goldenVsString)
import qualified Data.Text as T
import qualified Data.Text.IO as TIO
import qualified Data.Text.Encoding as TE
import qualified Data.ByteString.Lazy as BL
import Fixture
import Shelf.Extract

-- Note: small-b.pdf (Greek.fi Options Protocol) uses unnumbered, all-caps
-- section headings (e.g. "INTRODUCTION", "PROTOCOL OVERVIEW") rather than
-- numbered headers, so headerLines matches nothing against it and the golden
-- output is the raw text unchanged. No false-positive "## " lines are
-- produced by this fixture.

tests :: TestTree
tests = testGroup "Extract"
  [ testCase "pdfinfo parses pages" $ do
      i <- right <$> pdfInfo "test/fixtures/small-a.pdf"
      assertBool "pages>0" (piPages i > 0)
  , testCase "pdftotext yields non-empty text (version-agnostic)" $ do
      t <- right <$> pdfToText "test/fixtures/small-a.pdf"
      assertBool "non-empty" (T.length t > 100)
  , testCase "headerLines picks numbered headers only" $
      headerLines "1 Introduction\n(3) x = y\n2.1 Model\n12 apples\n3 A" @?= ["1 Introduction", "2.1 Model"]
  , testCase "applyHeaders marks matching raw lines" $
      applyHeaders ["1 Introduction"] "abc\n1 Introduction\ndef" @?= "abc\n## 1 Introduction\ndef"
  , testCase "stamp round-trips; upToDate semantics" $ do
      let st = Stamp (T.replicate 64 "a") "26.06.0" extractorVersion 4
      stampOf (renderText st "body") @?= Just st
      upToDate (sh 'a') (Just st) 4 @?= True
      upToDate (sh 'a') (Just st { stPdftotext = "24.02.0" }) 4 @?= True   -- version informational
      upToDate (sh 'a') (Just st) 5 @?= False                                -- truncated body
  , goldenVsString "header detection on committed layout/raw fixtures" "test/fixtures/headers-raw.golden" $ do
      raw <- TIO.readFile "test/fixtures/headers-raw.txt"; lay <- TIO.readFile "test/fixtures/headers-layout.txt"
      pure (BL.fromStrict (TE.encodeUtf8 (applyHeaders (headerLines lay) raw)))
  ]
