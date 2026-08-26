module ScanSpec (tests) where
import Test.Tasty
import Test.Tasty.HUnit
import Test.Tasty.Hedgehog (testProperty)
import Hedgehog hiding (assert)
import qualified Hedgehog
import qualified Hedgehog.Gen as Gen
import qualified Hedgehog.Range as Range
import qualified Data.Set as S
import Data.Maybe (isJust, isNothing)
import Data.Text (Text)
import qualified Data.ByteString as BS
import Data.List (find)
import System.Directory (copyFile, createDirectory, createDirectoryIfMissing, createDirectoryLink)
import System.FilePath ((</>), takeFileName)
import System.IO.Temp (withSystemTempDirectory)
import Fixture
import Shelf.Extract (PdfInfo (..))
import Shelf.Scan
import Shelf.Types

-- A row whose current fields agree with its proposal, i.e. srHumanEdited == False.
row :: Char -> Text -> Provenance -> Year -> ScanRow
row c k prov y = ScanRow
  { srSha256 = sh c, srBytes = 100, srPaths = ["/old/" <> [c] <> ".pdf"], srTitle = "T", srAuthors = ["A"]
  , srInclude = True, srCitekey = k, srTopics = ["options"], srYear = y, srProvenance = prov
  , srProposal = Proposal { prCitekey = k, prTopics = ["options"], prYear = y, prProvenance = prov, prInclude = True }
  , srNote = "" }

info :: Maybe Text -> Maybe Text -> Maybe Text -> Maybe Int -> Int -> PdfInfo
info = PdfInfo

gateRoots :: [FilePath]
gateRoots = ["/h/wvs-docs"]

realPaper, junkPdf :: PdfInfo
realPaper = info (Just "T") Nothing (Just "pdfTeX") Nothing 22
junkPdf = info Nothing Nothing Nothing Nothing 1

tests :: TestTree
tests = testGroup "Scan"
  [ testGroup "detectArxiv"
    [ testCase "id with version suffix" $ detectArxiv "arXiv:2305.14604v2 [q-fin]" @?= Just "2305.14604"
    , testCase "bare id" $ detectArxiv "see 1912.05548 for details" @?= Just "1912.05548"
    , testCase "not an id" $ detectArxiv "foo 12.3" @?= Nothing
    , testCase "too many digits either side" $ detectArxiv "123456.789012" @?= Nothing
    ]
  , testGroup "isJunk"
    [ testCase "matplotlib producer" $
        assertBool "junk" (isJust (isJunk (info Nothing Nothing (Just "matplotlib 3.8") Nothing 1) "/x/a.pdf"))
    , testCase "figures directory" $
        assertBool "junk" (isJust (isJunk (info (Just "T") Nothing Nothing Nothing 10) "/x/figures/a.pdf"))
    , testCase "short and untitled" $
        assertBool "junk" (isJust (isJunk (info Nothing Nothing Nothing Nothing 2) "/x/a.pdf"))
    , testCase "real paper is not junk" $
        assertBool "keep" (isNothing (isJunk (info (Just "T") Nothing (Just "pdfTeX") Nothing 22) "/x/papers/a.pdf"))
    ]
  , testGroup "proposeTopics"
    [ testCase "cfmm- segment" $ proposeTopics "/h/cfmm/cfmm-theory/cfmm-options/x.pdf" @?= ["options"]
    , testCase "cfmm- segment with underscore" $
        proposeTopics "/h/cfmm/cfmm-theory/cfmm-mechanism_design/x.pdf" @?= ["mechanism-design"]
    , testCase "legacy refs" $ proposeTopics "/h/.local/share/wvs-shelf/legacy-refs/refs/x.pdf" @?= ["volatility-swaps"]
    , testCase "learning subdir" $ proposeTopics "/h/learning/convex-analysis/x.pdf" @?= ["convex-analysis"]
    , testCase "wvs-docs root" $ proposeTopics "/h/wvs-docs/pdfs/x.pdf" @?= ["volatility-swaps"]
    , testCase "unknown path" $ proposeTopics "/h/Downloads/x.pdf" @?= []
    ]
  , testGroup "proposeCitekey"
    [ testCase "author last word + 3 title words minus stop words + year" $
        proposeCitekey (info (Just "Optimal Fees for the AMMs") (Just "Jane Doe; Bob Roe") Nothing (Just 2023) 12) "" "x.pdf"
          @?= "doe-optimal-fees-amms-2023"
    , testCase "arXiv id on first page wins over creation year" $
        proposeCitekey (info (Just "Optimal Fees") (Just "Jane Doe") Nothing (Just 2024) 12) "arXiv:2305.14604v1" "x.pdf"
          @?= "doe-optimal-fees-2023"
    , testCase "no metadata falls back to filename stem and nd" $
        proposeCitekey (info Nothing Nothing Nothing Nothing 12) "" "/h/Some Paper (final).pdf"
          @?= "unknown-some-paper-final-nd"
    , testCase "always a valid citekey" $
        assertBool "valid" (either (const False) (const True)
          (mkCitekey (proposeCitekey (info (Just "!!!") (Just "???") Nothing Nothing 3) "" "/h/@@@.pdf")))
    ]
  , testCase "sha256File matches the known empty-file digest" $ withSystemTempDirectory "scan" $ \d -> do
      writeFile (d </> "empty") ""
      s <- sha256File (d </> "empty")
      sha256Text s @?= "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  , testCase "walkPdfs skips excluded dirs, foundry lib, and symlinks" $ withSystemTempDirectory "scan" $ \d -> do
      writeFile (d </> "a.pdf") "a"
      writeFile (d </> "foundry.toml") ""
      createDirectory (d </> ".git"); writeFile (d </> ".git" </> "b.pdf") "b"
      createDirectory (d </> "lib"); writeFile (d </> "lib" </> "c.pdf") "c"
      createDirectoryLink "." (d </> "loop")
      ps <- walkPdfs (defaultConfig d) { scIncludeRoots = ["."] }
      map takeFileName ps @?= ["a.pdf"]
  , testCase "walkPdfs matches .PDF case-insensitively" $ withSystemTempDirectory "scan" $ \d -> do
      writeFile (d </> "a.PDF") "a"; writeFile (d </> "notes.txt") "t"
      ps <- walkPdfs (defaultConfig d) { scIncludeRoots = ["."] }
      map takeFileName ps @?= ["a.PDF"]
  , testGroup "proposeInclude"
    [ testCase "under an include root and not junk" $
        proposeInclude gateRoots ["/h/wvs-docs/a.pdf"] realPaper "/h/wvs-docs/a.pdf" @?= True
    , testCase "outside every include root" $
        proposeInclude gateRoots ["/h/Downloads/a.pdf"] realPaper "/h/Downloads/a.pdf" @?= False
    , testCase "under a root but junk" $
        proposeInclude gateRoots ["/h/wvs-docs/a.pdf"] junkPdf "/h/wvs-docs/a.pdf" @?= False
    , testCase "reachable from a root via any of its paths" $
        proposeInclude gateRoots ["/h/Downloads/b.pdf", "/h/wvs-docs/a.pdf"] realPaper "/h/Downloads/b.pdf" @?= True
    , testCase "root match is by path component, not string prefix" $
        proposeInclude gateRoots ["/h/wvs-docs-other/a.pdf"] realPaper "/h/wvs-docs-other/a.pdf" @?= False
    ]
  , testCase "scanRows groups by sha, relativises paths, and gates include" $ withSystemTempDirectory "scan" $ \home -> do
      createDirectoryIfMissing True (home </> "wvs-docs" </> "refs")
      createDirectory (home </> "other"); createDirectory (home </> "Downloads")
      -- headers.pdf twice under two different names: one row, two paths. The
      -- Downloads copy gets a trailing comment so it is a *different* sha but
      -- still a real 13-page paper, i.e. not junk -- so its include=False can
      -- only come from the root gate.
      copyFile "test/fixtures/headers.pdf" (home </> "wvs-docs" </> "refs" </> "a.pdf")
      copyFile "test/fixtures/headers.pdf" (home </> "other" </> "b.pdf")
      bs <- BS.readFile "test/fixtures/headers.pdf"
      BS.writeFile (home </> "Downloads" </> "c.pdf") (bs <> "% shelf-test variant\n")
      -- "." widens the walk so Downloads/ and other/ are seen at all; it must
      -- not thereby confer inclusion on them.
      rows <- scanRows (defaultConfig home) { scIncludeRoots = ["wvs-docs", "."] } home
      length rows @?= 2
      let at p = find (\r -> p `elem` srPaths r) rows
      case (at "wvs-docs/refs/a.pdf", at "Downloads/c.pdf") of
        (Just ra, Just rc) -> do
          srPaths ra @?= ["other/b.pdf", "wvs-docs/refs/a.pdf"]
          srInclude ra @?= True
          srHumanEdited ra @?= False
          assertBool "bytes recorded" (srBytes ra > 0)
          srInclude rc @?= False
          srNote rc @?= ""
          srHumanEdited rc @?= False
        _ -> assertFailure ("expected both rows, got paths " <> show (map srPaths rows))
  , testGroup "srHumanEdited"
    [ testCase "untouched row is not edited" $ srHumanEdited (row '1' "a-2020" Unsourced (Year 2020)) @?= False
    , testCase "changed citekey is edited" $
        srHumanEdited (row '1' "a-2020" Unsourced (Year 2020)) { srCitekey = "b-2020" } @?= True
    ]
  , testGroup "flagProvenanceDuplicates"
    [ testCase "older duplicate gets -v1 and a note; newest keeps its key" $ do
        let a = row '1' "x-2022" (ArXiv "1") (Year 2022)
            b = row '2' "x-2023" (ArXiv "1") (Year 2023)
            out = flagProvenanceDuplicates [a, b]
        map srCitekey out @?= ["x-2022-v1", "x-2023"]
        map srNote out @?= ["duplicate provenance of x-2023", ""]
    , testCase "flagging leaves the proposal in sync (row stays not-human-edited)" $ do
        let a = row '1' "x-2022" (ArXiv "1") (Year 2022)
            b = row '2' "x-2023" (ArXiv "1") (Year 2023)
        map srHumanEdited (flagProvenanceDuplicates [a, b]) @?= [False, False]
    , testCase "different arXiv ids are not duplicates" $ do
        let a = row '1' "x-2022" (ArXiv "1") (Year 2022)
            b = row '2' "x-2023" (ArXiv "2") (Year 2023)
        map srCitekey (flagProvenanceDuplicates [a, b]) @?= ["x-2022", "x-2023"]
    , testCase "a human-edited citekey is preserved; only the proposal and note move" $ do
        let a = (row '1' "x-2022" (ArXiv "1") (Year 2022)) { srCitekey = "mine-2022" }
            b = row '2' "x-2023" (ArXiv "1") (Year 2023)
            out = flagProvenanceDuplicates [a, b]
        map srCitekey out @?= ["mine-2022", "x-2023"]
        map (prCitekey . srProposal) out @?= ["x-2022-v1", "x-2023"]
        map srNote out @?= ["duplicate provenance of x-2023", ""]
    , testCase "the keeper loses a stale -vN and its note" $ do
        let a = row '1' "x-2022" (ArXiv "1") (Year 2022)
            b0 = row '2' "x-2023" (ArXiv "1") (Year 2023)
            b = b0 { srCitekey = "x-2023-v1", srNote = "stale"
                   , srProposal = (srProposal b0) { prCitekey = "x-2023-v1" } }
        let out = flagProvenanceDuplicates [a, b]
        map srCitekey out @?= ["x-2022-v1", "x-2023"]
        map srNote out @?= ["duplicate provenance of x-2023", ""]
    , testCase "numbering is stable: an added older duplicate does not renumber the rest" $ do
        let a = row '1' "x-2022" (ArXiv "1") (Year 2022)
            b = row '2' "x-2023" (ArXiv "1") (Year 2023)
            c = row '3' "z-2020" (ArXiv "1") (Year 2020)
            once = flagProvenanceDuplicates [a, b]
            grown = flagProvenanceDuplicates (once <> [c])
        map srCitekey grown @?= ["x-2022-v1", "x-2023", "z-2020-v2"]
    , testCase "re-running on its own output is the identity" $ do
        let rs = [ row '1' "x-2022" (ArXiv "1") (Year 2022), row '2' "x-2023" (ArXiv "1") (Year 2023)
                 , row '3' "y-2021" (ArXiv "1") (Year 2021) ]
            once = flagProvenanceDuplicates rs
        flagProvenanceDuplicates once @?= once
    , testCase "non-arXiv provenance is ignored" $ do
        let a = row '1' "x-2022" (Doi "10.1/a") (Year 2022)
            b = row '2' "x-2023" (Doi "10.1/a") (Year 2023)
        map srCitekey (flagProvenanceDuplicates [a, b]) @?= ["x-2022", "x-2023"]
    ]
  , testGroup "mergeRows"
    [ testCase "human-edited row keeps its decisions but takes fresh paths" $ do
        let base = row '1' "y-2020" Unsourced (Year 2020)
            edited = base { srInclude = False, srCitekey = "x-2020" }
            fresh = base { srPaths = ["/new/a.pdf"] }
        case mergeRows [edited] [fresh] of
          [m] -> do srInclude m @?= False; srCitekey m @?= "x-2020"; srPaths m @?= ["/new/a.pdf"]
          ms -> assertFailure ("expected one row, got " <> show (length ms))
    , testCase "untouched row adopts the fresh proposal wholesale" $ do
        let base = row '1' "y-2020" Unsourced (Year 2020)
            fresh = row '1' "z-2021" Unsourced (Year 2021)
        mergeRows [base] [fresh] @?= [fresh]
    , testCase "sha only in existing is kept; sha only in fresh is added" $ do
        let a = row '1' "a-2020" Unsourced (Year 2020)
            b = row '2' "b-2020" Unsourced (Year 2020)
        map srCitekey (mergeRows [a] [b]) @?= ["b-2020", "a-2020"]
    ]
  , testProperty "proposeCitekey always yields a valid citekey" $ property $ do
      let noisy = Gen.text (Range.linear 0 20) (Gen.frequency [(3, Gen.unicode), (1, Gen.element ("-. 0123456789" :: [Char]))])
      t <- forAll (Gen.maybe noisy); a <- forAll (Gen.maybe noisy)
      y <- forAll (Gen.maybe (Gen.int (Range.linear (-5) 4000)))
      f <- forAll (Gen.string (Range.linear 0 20) Gen.unicode)
      pg <- forAll noisy
      Hedgehog.assert (either (const False) (const True) (mkCitekey (proposeCitekey (info t a Nothing y 10) pg f)))
  , testProperty "mergeRows preserves the union of sha256s" $ property $ do
      let genRow = do
            c <- Gen.element ("0123456789abcdef" :: [Char])
            e <- Gen.bool
            pure (row c "a-2020" Unsourced (Year 2020)) { srInclude = e }
      xs <- forAll (Gen.list (Range.linear 0 6) genRow)
      ys <- forAll (Gen.list (Range.linear 0 6) genRow)
      let shas = S.fromList . map srSha256
      shas (mergeRows xs ys) === S.union (shas xs) (shas ys)
  , testCase "loadScan on a missing file is an empty list" $ withSystemTempDirectory "scan" $ \d -> do
      r <- loadScan (d </> "none.yaml")
      r @?= Right []
  , testCase "saveScan/loadScan round-trip" $ withSystemTempDirectory "scan" $ \d -> do
      let rs = [ (row '1' "a-2020" (ArXiv "2305.14604") (Year 2020)) { srNote = "n" }
               , (row '2' "b-2020" Unsourced NoDate) { srInclude = False, srTopics = [] } ]
          p = d </> "scan.yaml"
      saveScan p rs
      r <- loadScan p
      r @?= Right rs
  ]
