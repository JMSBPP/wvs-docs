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

-- Note: test/fixtures/headers-raw.txt and headers-layout.txt are generated
-- once, locally, from test/fixtures/headers.pdf (Elsts, "Concentrated
-- Liquidity as Leverage", arXiv 2409.12803) via:
--   pdftotext -raw -enc UTF-8 test/fixtures/headers.pdf test/fixtures/headers-raw.txt
--   pdftotext -layout -enc UTF-8 test/fixtures/headers.pdf test/fixtures/headers-layout.txt
-- Its numbered section structure gives headerLines/applyHeaders a real
-- known-bad case to exercise (small-a.pdf/small-b.pdf use unnumbered
-- all-caps headings and never do). The committed golden marks 18 true
-- headers, e.g. "## 1 Introduction", "## 3.1 Properties of the system",
-- "## 5 Conclusion". headerLines also flags 6 candidates from the layout
-- text that are chart axis labels, not headers -- e.g. "1.3   Liquidation
-- Level   1.3" and "40000                                   Assets" (the
-- numbers are y-axis/x-axis tick values from a plotted figure, not section
-- numbers). None of these 6 make it into the golden as "## " lines: poppler's
-- raw-mode extraction of that figure drops the numeric labels and renders
-- the axis captions on their own ("Assets", "Debt", "Equity", "Liquidation
-- Level"), so applyHeaders finds no matching raw line to mark. That is
-- fixture-specific luck, not a guarantee -- headerLines's candidate set
-- itself is not false-positive-free.

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
