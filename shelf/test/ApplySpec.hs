module ApplySpec (tests) where

import Control.Monad (forM)
import qualified Data.ByteString as BS
import Data.Text (Text)
import qualified Data.Text as T
import qualified Data.Text.Encoding as TE
import Data.Time.Clock (UTCTime)
import System.Directory (copyFile, createDirectoryIfMissing, doesDirectoryExist, doesFileExist, getModificationTime, listDirectory)
import System.FilePath ((</>))
import System.IO.Temp (withSystemTempDirectory)
import Test.Tasty
import Test.Tasty.HUnit

import Fixture
import Shelf.Apply
import Shelf.Extract (stampOf, upToDate)
import Shelf.Manifest
import Shelf.Scan
import Shelf.Types

fixturePdf :: FilePath
fixturePdf = "test/fixtures/small-a.pdf"

-- | A temp repo laid out like wvs-docs, plus a fake @$HOME@ holding the PDF at
-- @refs/small-a.pdf@ so origin paths are home-relative and checkable.
withRepo :: (FilePath -> RepoPaths -> Sha256 -> IO a) -> IO a
withRepo act = withSystemTempDirectory "shelf-apply" $ \tmp -> do
  let home = tmp </> "home"
      rp = repoPaths (tmp </> "repo")
  createDirectoryIfMissing True (home </> "refs")
  mapM_ (createDirectoryIfMissing True)
    [ rpRoot rp </> "manifest", rpPdfs rp, rpText rp
    , rpTopics rp </> "options" </> "refs", rpTopics rp </> "options" </> "notes" ]
  copyFile fixturePdf (home </> "refs" </> "small-a.pdf")
  sha <- sha256File (home </> "refs" </> "small-a.pdf")
  act home rp sha

mkRow :: Sha256 -> Text -> [Text] -> ScanRow
mkRow sha key topics = ScanRow
  { srSha256 = sha, srBytes = 1, srPaths = ["refs/small-a.pdf"], srTitle = "Small A"
  , srAuthors = ["Ada Lovelace"], srInclude = True, srCitekey = key, srTopics = topics
  , srYear = Year 2020, srProvenance = Unsourced
  , srProposal = Proposal key topics (Year 2020) Unsourced True, srNote = "" }

ckA :: FilePath
ckA = "small-a-2020"

pdfPath, textPath, cardPath :: RepoPaths -> FilePath
pdfPath rp = rpPdfs rp </> ckA <> ".pdf"
textPath rp = rpText rp </> ckA <> ".md"
cardPath rp = rpTopics rp </> "options" </> "refs" </> ckA <> ".md"

mtimes :: RepoPaths -> IO [UTCTime]
mtimes rp = mapM getModificationTime [pdfPath rp, textPath rp, cardPath rp]

readText :: FilePath -> IO Text
readText p = TE.decodeUtf8Lenient <$> BS.readFile p

tests :: TestTree
tests = testGroup "Shelf.Apply"
  [ testCase "first run writes pdf, text, card and a manifest row with home-relative origin" $
      withRepo $ \home rp sha -> do
        saveScan (rpScan rp) [mkRow sha "small-a-2020" ["options"]]
        rep <- applyWith home rp
        arErrors rep @?= []
        arApplied rep @?= 1

        gotSha <- sha256File (pdfPath rp)
        gotSha @?= sha

        body <- bodyOf <$> readText (textPath rp)
        stamp <- stampOf <$> readText (textPath rp)
        assertBool "text stamp is up to date"
          (upToDate sha stamp (BS.length (TE.encodeUtf8 body)))
        assertBool "extracted body is non-empty" (BS.length (TE.encodeUtf8 body) > 0)

        assertBool "topic card scaffolded" =<< doesFileExist (cardPath rp)

        mf <- right <$> loadManifest (rpManifest rp)
        map srcCitekey (mfSources mf) @?= [ck "small-a-2020"]
        map srcOrigin (mfSources mf) @?= [["refs/small-a.pdf"]]
        map srcTopics (mfSources mf) @?= [[Topic "options"]]

        rows <- right <$> loadScan (rpScan rp)
        length rows @?= 0

        assertBool "topic INDEX.md written" =<< doesFileExist (rpTopics rp </> "options" </> "INDEX.md")
        assertBool "topics README.md written" =<< doesFileExist (rpTopics rp </> "README.md")

  , testCase "re-applying the same row rewrites nothing" $
      withRepo $ \home rp sha -> do
        let row = mkRow sha "small-a-2020" ["options"]
        saveScan (rpScan rp) [row]
        _ <- applyWith home rp
        m0 <- mtimes rp
        saveScan (rpScan rp) [row]
        rep <- applyWith home rp
        arErrors rep @?= []
        m1 <- mtimes rp
        m1 @?= m0

  , testCase "duplicate citekey among included rows aborts before any write" $
      withRepo $ \home rp sha -> do
        saveScan (rpScan rp) [mkRow sha "small-a-2020" ["options"], mkRow (sh 'b') "small-a-2020" ["options"]]
        rep <- applyWith home rp
        arApplied rep @?= 0
        assertBool "preflight reported an error" (not (null (arErrors rep)))
        assertBool "no pdf written" . null =<< listDirectory (rpPdfs rp)
        assertBool "no text written" . null =<< listDirectory (rpText rp)
        assertBool "no manifest written" . not =<< doesFileExist (rpManifest rp)

  , testCase "unknown topic aborts before any write" $
      withRepo $ \home rp sha -> do
        saveScan (rpScan rp) [mkRow sha "small-a-2020" ["nope"]]
        rep <- applyWith home rp
        arApplied rep @?= 0
        assertBool "preflight reported an error" (not (null (arErrors rep)))
        assertBool "no pdf written" . null =<< listDirectory (rpPdfs rp)
        assertBool "no manifest written" . not =<< doesFileExist (rpManifest rp)

  , testCase "two included rows sharing a sha256 abort before any write" $
      withRepo $ \home rp sha -> do
        -- upsert is keyed on sha256, so applying both would have the second
        -- row's manifest entry replace the first's, orphaning its pdf/text/card.
        saveScan (rpScan rp) [mkRow sha "small-a-2020" ["options"], mkRow sha "small-b-2020" ["options"]]
        rep <- applyWith home rp
        arApplied rep @?= 0
        assertBool "dup sha reported"
          (any (T.isInfixOf "duplicate sha256 among included rows") (arErrors rep))
        assertBool "no pdf written" . null =<< listDirectory (rpPdfs rp)
        assertBool "no text written" . null =<< listDirectory (rpText rp)
        assertBool "no manifest written" . not =<< doesFileExist (rpManifest rp)

  , testCase "a row with no topics aborts before any write" $
      withRepo $ \home rp sha -> do
        saveScan (rpScan rp) [mkRow sha "small-a-2020" []]
        rep <- applyWith home rp
        arApplied rep @?= 0
        arErrors rep @?= ["row small-a-2020 has no topics"]
        assertBool "no pdf written" . null =<< listDirectory (rpPdfs rp)
        assertBool "no text written" . null =<< listDirectory (rpText rp)
        assertBool "no manifest written" . not =<< doesFileExist (rpManifest rp)

  , testCase "an excluded row sharing the applied sha stays in scan.yaml" $
      withRepo $ \home rp sha -> do
        -- A second copy of the same bytes that a human deliberately parked at
        -- include: false must survive the apply, not be swept out with the
        -- row that was applied.
        let parked = (mkRow sha "parked-copy-2020" ["options"]) { srInclude = False }
        saveScan (rpScan rp) [mkRow sha "small-a-2020" ["options"], parked]
        rep <- applyWith home rp
        arErrors rep @?= []
        arApplied rep @?= 1
        rows <- right <$> loadScan (rpScan rp)
        map srCitekey rows @?= ["parked-copy-2020"]
        map srInclude rows @?= [False]

  , testCase "existingTopics lists topic subdirectories only" $
      withRepo $ \_ rp _ -> do
        writeFile (rpTopics rp </> "README.md") "x"
        ts <- existingTopics rp
        ts @?= [Topic "options"]

  , testCase "refuses a citekey whose pdf already holds different bytes" $
      withRepo $ \home rp sha -> do
        saveScan (rpScan rp) [mkRow sha "small-a-2020" ["options"]]
        _ <- applyWith home rp
        copyFile "test/fixtures/small-b.pdf" (home </> "refs" </> "small-a.pdf")
        other <- sha256File (home </> "refs" </> "small-a.pdf")
        saveScan (rpScan rp) [mkRow other "small-a-2020" ["options"]]
        rep <- applyWith home rp
        assertBool "sha mismatch reported" (not (null (arErrors rep)))
        arApplied rep @?= 0

  , testCase "runIndex is callable on an empty repo" $
      withRepo $ \_ rp _ -> do
        runIndex rp
        assertBool "index dir created" =<< doesDirectoryExist (rpRoot rp </> "index")
        n <- forM [rpTopics rp </> "README.md"] doesFileExist
        n @?= [True]
  ]
