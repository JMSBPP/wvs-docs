module ManifestSpec (tests) where
import Test.Tasty; import Test.Tasty.HUnit; import Test.Tasty.Hedgehog (testProperty)
import Hedgehog hiding (check); import qualified Hedgehog.Gen as Gen; import qualified Hedgehog.Range as Range
import System.IO.Temp (withSystemTempDirectory); import System.FilePath ((</>))
import Data.List (sortOn); import Data.Either (isLeft)
import Data.Time (UTCTime (..), fromGregorian)
import qualified Data.Text as T
import Fixture; import Shelf.Types; import Shelf.Manifest

mkSrc :: T.Text -> Char -> [T.Text] -> Source
mkSrc k c ts = Source (ck k) (sh c) 10 "title" ["a"] (Year 2020) Unsourced (map Topic ts) [] Nothing

genSrc :: Gen Source
genSrc = do
  k <- Gen.text (Range.linear 1 6) Gen.lower; y <- Gen.int (Range.linear 1950 2030)
  h <- Gen.text (Range.singleton 64) (Gen.element ("0123456789abcdef" :: [Char]))
  pure (Source (ck (k <> "-" <> T.pack (show y))) (right (mkSha256 h)) 10 "t" [] (Year y) Unsourced [Topic "options"] [] Nothing)

ep, bu :: T.Text
ep = "https://s3.hippius.com"
bu = "cfmm-refs"

at0 :: UTCTime
at0 = UTCTime (fromGregorian 2026 8 27) 0

-- | A well-formed object for @t@ under @k@, recording @sha@.
objOf :: T.Text -> T.Text -> Sha256 -> RemoteObject
objOf k t sha = RemoteObject
  { roTopic = Topic t, roKey = key, roUrl = objectUrl ep bu key
  , roEtag = "\"e\"", roVerifiedSha256 = sha, roVerifiedAt = at0 }
  where key = objectKey (Topic t) (ck k)

known :: [Topic]
known = [Topic "options", Topic "dgp"]

sevs :: [(Severity, Violation)] -> [Severity]
sevs = map fst

v1Yaml :: String
v1Yaml = unlines
  [ "schema_version: 1"
  , "sources:"
  , "- citekey: a-2020"
  , "  sha256: '" <> T.unpack (sha256Text (sh '1')) <> "'"
  , "  bytes: 10"
  , "  title: t"
  , "  authors: []"
  , "  year: 2020"
  , "  provenance: {kind: unsourced}"
  , "  topics: [options]"
  , "  origin: []"
  ]

tests :: TestTree
tests = testGroup "Manifest"
  [ testProperty "save/load round-trip, sorted" $ property $ do
      srcs <- forAll (Gen.list (Range.linear 0 5) genSrc)
      loaded <- evalIO $ withSystemTempDirectory "mf" $ \d -> do
        let p = d </> "sources.yaml"
        saveManifest p (Manifest 2 srcs); loadManifest p
      fmap (map srcCitekey . mfSources) loaded === Right (map srcCitekey (sortOn srcCitekey srcs))
  , testCase "missing file is an empty v2 manifest (lenient) / error (strict)" $ withSystemTempDirectory "mf" $ \d -> do
      r <- loadManifest (d </> "none.yaml"); r @?= Right (Manifest 2 [])
      s <- loadManifestStrict (d </> "none.yaml"); assertBool "strict" (isLeft s)
  , testCase "a v1 file on disk is refused with a pointer to shelf migrate" $ withSystemTempDirectory "mf" $ \d -> do
      let p = d </> "sources.yaml"
      writeFile p v1Yaml
      r <- loadManifest p
      case r of
        Right m -> assertFailure ("expected a refusal, got " <> show m)
        Left e -> assertBool ("names shelf migrate: " <> T.unpack e) ("shelf migrate" `T.isInfixOf` e)
  , testCase "upsert replaces by sha" $ do
      let a = mkSrc "a-2020" '1' ["options"]
      map srcTitle (mfSources (upsert a { srcTitle = "new" } (Manifest 2 [a]))) @?= ["new"]

  , testCase "check reports schema, dup citekey, unknown topic, empty topics as errors" $ do
      let a = mkSrc "a-2020" '1' ["options"]; b = mkSrc "a-2020" '2' ["nope"]; c = mkSrc "c-2020" '3' []
          vs = check [Topic "options"] (Manifest 3 [a, b, c])
          hard = [v | (Err, v) <- vs]
      hard @?= [ BadSchemaVersion 3, DupCitekey (ck "a-2020")
               , UnknownTopic (ck "a-2020") (Topic "nope"), EmptyTopics (ck "c-2020") ]
      -- every source is remote-less, so each also carries exactly one Warn
      length [v | (Warn, v) <- vs] @?= 2

  , testCase "a wrong object key is an error" $ do
      let o = (objOf "a-2020" "options" (sh '1')) { roKey = "topics/options/wrong.pdf" }
          s = (mkSrc "a-2020" '1' ["options"]) { srcRemote = Just (Remote ep bu [o]) }
      [v | (Err, v) <- check known (Manifest 2 [s])] @?= [RemoteBadKey (ck "a-2020") "topics/options/wrong.pdf"]

  , testCase "a url that is not endpoint/bucket/key is an error" $ do
      let o = (objOf "a-2020" "options" (sh '1')) { roUrl = "https://elsewhere.example/x.pdf" }
          s = (mkSrc "a-2020" '1' ["options"]) { srcRemote = Just (Remote ep bu [o]) }
      [v | (Err, v) <- check known (Manifest 2 [s])]
        @?= [RemoteBadKey (ck "a-2020") "topics/options/a-2020.pdf"]

  , testCase "a duplicated topic in one remote block is an error" $ do
      let o = objOf "a-2020" "options" (sh '1')
          s = (mkSrc "a-2020" '1' ["options"]) { srcRemote = Just (Remote ep bu [o, o]) }
      [v | (Err, v) <- check known (Manifest 2 [s])]
        @?= [RemoteBadKey (ck "a-2020") "topics/options/a-2020.pdf"]

  , testCase "a verified sha that is not the source sha is an error" $ do
      let o = objOf "a-2020" "options" (sh '9')
          s = (mkSrc "a-2020" '1' ["options"]) { srcRemote = Just (Remote ep bu [o]) }
      [v | (Err, v) <- check known (Manifest 2 [s])] @?= [RemoteShaDrift (ck "a-2020") (Topic "options")]

  , testCase "a partially covered source warns RemoteIncomplete" $ do
      let s = upsertObject ep bu (objOf "a-2020" "options" (sh '1')) (mkSrc "a-2020" '1' ["options", "dgp"])
          vs = check known (Manifest 2 [s])
      [v | (Err, v) <- vs] @?= []
      [v | (Warn, v) <- vs] @?= [RemoteIncomplete (ck "a-2020") [Topic "dgp"]]

  , testCase "an object for a topic no longer carried warns RemoteStale" $ do
      let s = upsertObject ep bu (objOf "a-2020" "dgp" (sh '1')) (mkSrc "a-2020" '1' ["options"])
          vs = check known (Manifest 2 [s])
      [v | (Err, v) <- vs] @?= []
      [v | (Warn, v) <- vs]
        @?= [RemoteIncomplete (ck "a-2020") [Topic "options"], RemoteStale (ck "a-2020") [Topic "dgp"]]

  , testCase "a fully backed source is clean" $ do
      let s = upsertObject ep bu (objOf "a-2020" "options" (sh '1')) (mkSrc "a-2020" '1' ["options"])
      check known (Manifest 2 [s]) @?= []

  , testCase "a manifest whose sources have no remote block yields only Warn" $ do
      -- CI runs `shelf manifest check --require` against exactly this shape
      -- until `shelf push` has run: it must not fail.
      let srcs = [mkSrc "a-2020" '1' ["options"], mkSrc "b-2020" '2' ["dgp"]]
          vs = check known (Manifest 2 srcs)
      sevs vs @?= [Warn, Warn]
      [v | (Warn, v) <- vs] @?= [ RemoteIncomplete (ck "a-2020") [Topic "options"]
                                , RemoteIncomplete (ck "b-2020") [Topic "dgp"] ]
  ]
