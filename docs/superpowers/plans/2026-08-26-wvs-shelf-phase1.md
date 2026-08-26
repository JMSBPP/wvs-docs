# wvs-shelf Phase 1 Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Turn `~/wvs-docs` into the topic-tree CFMM research shelf with a Haskell `shelf` CLI (`scan|apply|extract|index|manifest check`), the local corpus ingested into `manifest/sources.yaml` + `text/` + ref cards, and `cfmm-theory` consuming it as a submodule.

**Architecture:** One Stack package `shelf/` (library + `shelf` executable). Pure-Haskell manifest/scan/index; poppler `pdftotext`/`pdfinfo` behind a typed wrapper. Repo history is rewritten once to drop binaries; PDFs live only in gitignored `pdfs/`. Human triage of `manifest/scan.yaml` is a hard gate between scan and apply.

**Tech Stack:** Stack lts-24.56 / GHC 9.10.3, `aeson`, `yaml`, `crypton`, `memory`, `typed-process`, `optparse-applicative`, `hedgehog`, `tasty`, `tasty-hedgehog`, `tasty-golden`, `hlint` (LTS), poppler-utils, `git-filter-repo`, GitHub Actions `ubuntu-latest`.

**Spec:** `docs/superpowers/specs/2026-08-26-wvs-shelf-design.md` (§3–§7, §10 Phase 1, §11 O1=a).

## Global Constraints

- Resolver `lts-24.56`, GHC 9.10.3; no packages outside the LTS (spec D7). `fourmolu` is NOT in the LTS — it is an optional dev tool installed outside stack (`ghcup`/binary); `hlint 3.10` is in the LTS and is the CI lint.
- Every `stack` invocation runs inside `shelf/` (its `stack.yaml` pins the resolver; the global project is lts-24.49 and must not be used).
- No `*.pdf` committed except `shelf/test/fixtures/*.pdf` (spec §4/§7).
- Citekey regex `^[a-z0-9]+(-[a-z0-9]+)*-(\d{4}|nd)(-v\d+)?$` (spec §5).
- `manifest/sources.yaml` always saved sorted by citekey via temp-file + rename (spec §6.3). All other generated files (`text/`, `pdfs/`, cards) are also written temp + rename.
- `include: true` proposed only under D2 roots and not matched by the junk heuristic; re-scan never overwrites human-edited fields (spec §6.1).
- Scan exclusions: `.git`, `.cache`, `.TinyTeX`, `site-packages`, `.venv`, `node_modules`, `_work`, `.stack`, `.stack-work`, `.cabal`, `.ghcup`, `.cargo`, `go-build`, `builds`, `.claude`, `.local/share` (except the staging dir), `lib/` whose parent has `foundry.toml`; symlinks never followed (spec §6.1 + review).
- Extracted text = `pdftotext -raw`; front-matter stamps `sha256`, `pdftotext_version`, `extractor_version`, `body_bytes`. Skip-if-present compares `sha256` + `extractor_version` + `body_bytes` only; `pdftotext_version` is informational (spec §6.4, review).
- BM25 k1=1.2, b=0.75, lowercase + ASCII-fold, no stemmer, title tokens ×3 (spec §7).
- Tests never use `let Right x = …` (fails `-Wincomplete-uni-patterns -Werror`); use `right` from `test/Fixture.hs`.
- Executing agent per task is named in each task header (user rule). Review record at the bottom.
- Commit messages end with the Co-Authored-By / Claude-Session trailer used in this repo.

---

## File structure

```
wvs-docs/
├── .github/workflows/ci.yml            Task 9
├── .gitignore  CLAUDE.md  README.md    Task 2
├── agents/{out/,skills/,commands/}     Task 2 (skills/commands moved from .claude/)
├── manifest/{sources.yaml,schema.json} Task 4 (schema doc), Task 10 (content)
├── topics/<t>/{INDEX.md,refs/,notes/,exercises/}   Task 2 (move), Task 10 (cards/index)
├── topics/README.md                    Task 7/8 (generated)
├── text/<citekey>.md                   Task 10
├── shelf/
│   ├── package.yaml  stack.yaml        Task 3
│   ├── src/Shelf/Types.hs              Task 3   — newtypes, Source, Provenance, Binary Citekey
│   ├── src/Shelf/Manifest.hs           Task 4   — load/save/check/upsert
│   ├── src/Shelf/Extract.hs            Task 5   — pdftotext/pdfinfo wrappers, header split, stamps
│   ├── src/Shelf/Scan.hs               Task 6   — walk/hash/group/propose/merge/dup-flag
│   ├── src/Shelf/Index.hs              Task 7   — BM25 + INDEX.md/topics README rendering
│   ├── src/Shelf/Apply.hs              Task 8   — scan rows → shelf artefacts, collision guards
│   ├── src/Shelf/Atomic.hs             Task 4   — writeAtomic :: FilePath -> ByteString -> IO ()
│   ├── app/Main.hs                     Task 8   — optparse CLI
│   └── test/{Main.hs,Fixture.hs,TypesSpec.hs,ManifestSpec.hs,ExtractSpec.hs,ScanSpec.hs,IndexSpec.hs,ApplySpec.hs,fixtures/}
```

---

### Task 0: Preconditions (HUMAN GATE — no agent)

- [ ] **Step 1: cfmm-theory working tree clean — by COMMITTING, not stashing.** 54 of the 64 dirty entries are untracked files (e.g. all of `cfmm-econometrics/`); a stash would leave them behind and Task 11's `git rm`/moves would miss or lose them. User runs:

```bash
cd ~/cfmm/cfmm-theory && git add -A && git commit -m "chore: checkpoint before wvs-docs shelf migration" && git status --short | wc -l   # must print 0
```

- [ ] **Step 2: Stage the PDFs currently in the wvs-docs working tree outside any repo** (they vanish from history in Task 1):

```bash
mkdir -p ~/.local/share/wvs-shelf/legacy-refs
cd ~/wvs-docs && find . -path ./lib -prune -o -name '*.pdf' -print0 \
  | xargs -0 -I{} cp --parents {} ~/.local/share/wvs-shelf/legacy-refs/
find ~/.local/share/wvs-shelf/legacy-refs -name '*.pdf' | wc -l   # expect 63
```

- [ ] **Step 3: Decide the fate of `.claude/`** (a `clamm-helper` agent, 4 commands, 3 skills: data-analyst, researcher, reverse-engineer). Plan default: **move** to `agents/skills/` and `agents/commands/` (Task 2) so nothing is lost; user may instead say delete.

---

### Task 1: Rewrite wvs-docs history (drop PDFs and `lib/`) — **Git Workflow Master**

- [ ] **Step 1: Commit and push EVERYTHING first (the plan file is currently untracked and Step 4 deletes the clone)**

```bash
cd ~/wvs-docs && git add -A && git commit -m "docs(plan): wvs-shelf phase 1 plan" ; git status --short | wc -l   # must be 0
git push origin main
```

- [ ] **Step 2: Full clone into scratch** (blobless clones cannot be filtered; takes minutes — use a 10-minute timeout or background):

```bash
S=/tmp/claude-1000/-home-jmsbpp/f094a237-f564-47ee-b69a-68cf46595c38/scratchpad
git clone --no-local https://github.com/JMSBPP/wvs-docs.git $S/wvs-docs-rewrite
du -sh $S/wvs-docs-rewrite/.git     # ≈ 210M
```

- [ ] **Step 3: Filter** (`--path` on a directory acts as a prefix; `refs/Microsoft…VSIXPackage` is a directory)

```bash
cd $S/wvs-docs-rewrite
git filter-repo --invert-paths --path-glob '*.pdf' --path-glob '*.PDF' --path lib --path out --path cache \
  --path refs/Microsoft.VisualStudio.Services.VSIXPackage
git count-objects -vH | grep size-pack            # expect < 20M
git ls-files | grep -ci '\.pdf$'                   # expect 0
git log --oneline | grep -c "docs(spec)"           # expect 2 (empty commits are pruned; total count will drop — that is expected)
git log --oneline | grep -c "docs(plan)"           # expect 1
```

- [ ] **Step 4: Force-push, then (only if push succeeded) replace the working copy**

```bash
git remote add origin https://github.com/JMSBPP/wvs-docs.git \
 && git push --force origin main \
 && cd ~ && rm -rf wvs-docs && git clone https://github.com/JMSBPP/wvs-docs.git wvs-docs \
 && du -sh ~/wvs-docs/.git && ls ~/wvs-docs/docs/superpowers/plans/
```

Expected: `.git` < 20M and the plan file present.

---

### Task 2: Prune tree and restructure into `topics/` — **Technical Writer** (content) with **Git Workflow Master** review

**Files:**
- Delete: `src/`, `test/`, `foundry.toml`, `foundry.lock`, `docker-compose.yml`, `.gitmodules`, `panoptic-v1-core` (gitlink), `protocols/`, `building_guidelines.md`
- Move: `.claude/skills/*` → `agents/skills/`, `.claude/commands/*` → `agents/commands/`, `.claude/agents/clamm-helper.md` → `agents/clamm-helper.md`
- Create: `.gitignore`, `CLAUDE.md`, `README.md`, `topics/{options,volatility-swaps,convex,control,dgp,discrete,econometrics,lending,banking,mechanism-design,manifolds,linear-algebra,io,applications,formal-methods,type-driven}/{refs,notes,exercises}/.gitkeep`
- Move (`git mv`): `NOTES_OPTIONS.md`, `option_natenberg_notes.md`, `fee-as-premia-notes.md`, `comp-statics.md`, `questions.md`, `docs/asset_class_taxonomy_on_option_definition.md`, `docs/static-queries/`, `panopticExercises/`, `ideas/` → `topics/options/notes/`; `refs/agents/*.md`, `refs/gpt-context.md` → `topics/options/notes/paper-notes/` (NOT `refs/` — they are not `<citekey>.md` cards; Task 10 may later link them from cards); `NOTES_SWAPS.md`, `IDEA.md`, `TODO.md`, `integrations/`, `story-telling/`, `differential_gemotry_connection.ipynb` → `topics/volatility-swaps/notes/`; `exercises/*` → `topics/options/exercises/`; `agents/` stays.

- [ ] **Step 1: Remove cruft and relocate `.claude/`**

```bash
cd ~/wvs-docs
mkdir -p agents/skills agents/commands
git mv .claude/skills/* agents/skills/ && git mv .claude/commands/* agents/commands/ && git mv .claude/agents/clamm-helper.md agents/
git rm -rq src test foundry.toml foundry.lock docker-compose.yml .gitmodules panoptic-v1-core protocols building_guidelines.md
git rm -rq --cached lib 2>/dev/null || true; rm -rf lib .claude
```

- [ ] **Step 2: Create topic dirs and move content** — `mkdir -p` every target, then the `git mv` list above; `git status --short | grep -v '^R\|^D\|^A' ` must be empty.

- [ ] **Step 3: `.gitignore`**

```
pdfs/
index/
manifest/scan.yaml
shelf/.stack-work/
*.pdf
*.PDF
!shelf/test/fixtures/*.pdf
__pycache__/
.ipynb_checkpoints/
```

- [ ] **Step 4: `CLAUDE.md`** (verbatim):

```markdown
# wvs-docs — CFMM research shelf

- PDFs are never committed; `pdfs/` is a local mirror. A source exists in this repo as a
  `manifest/sources.yaml` row + `text/<citekey>.md` + `topics/<t>/refs/<citekey>.md`.
- Add a source with `shelf scan` → edit `manifest/scan.yaml` → `shelf apply`. Never edit
  `sources.yaml` by hand except to fix metadata; run `shelf manifest check` afterwards.
- Every exercise under `topics/*/exercises/` carries an **Economic Meaning** section
  (same rule as cfmm-theory).
- Cite sources as `[@citekey]`.
- All tooling is Haskell (`shelf/`, lts-24.56; run `stack` from inside `shelf/`). Do not add Python.
```

- [ ] **Step 5: `README.md`** — sections: What this is (2 lines); Layout (tree from spec §4); Reading (Tier 1 `text/`; Tier 2 `shelf fetch`, Phase 2); Adding sources (scan → triage → apply); Topics list; link to spec and plan.

- [ ] **Step 6: Commit** — `git add -A && git commit -m "refactor: prune build scaffold, restructure into topics/ tree"`

---

### Task 3: Haskell scaffold + `Shelf.Types` — **Backend Architect**

**Files:** `shelf/package.yaml`, `shelf/stack.yaml`, `shelf/src/Shelf/Types.hs`, `shelf/test/Main.hs`, `shelf/test/Fixture.hs`, `shelf/test/TypesSpec.hs`

**Interfaces — Produces:**
```haskell
newtype Citekey = Citekey Text  -- mkCitekey :: Text -> Either Text Citekey; citekeyText; instance Binary Citekey
newtype Sha256  = Sha256 Text   -- mkSha256 :: Text -> Either Text Sha256 (64 lowercase hex); sha256Text
newtype Topic   = Topic Text
data Provenance = ArXiv Text | Doi Text | Isbn Text | Unsourced
data Year = Year Int | NoDate
data HippiusRecord = HippiusRecord { hrKey, hrVerifiedSha256, hrEtag :: Text, hrVerifiedAt :: UTCTime }
data Source = Source { srcCitekey :: Citekey, srcSha256 :: Sha256, srcBytes :: Int, srcTitle :: Text
                     , srcAuthors :: [Text], srcYear :: Year, srcProvenance :: Provenance
                     , srcTopics :: [Topic], srcOrigin :: [FilePath], srcHippius :: Maybe HippiusRecord }
isRemoteBacked :: Source -> Bool
```
JSON field names per spec §5; `year` encodes `NoDate` as `"nd"`.

- [ ] **Step 1: `shelf/stack.yaml`**

```yaml
snapshot: lts-24.56
packages: [.]
```

- [ ] **Step 2: `shelf/package.yaml`**

```yaml
name: shelf
version: 0.1.0
language: GHC2021
default-extensions: [OverloadedStrings, StrictData, DerivingStrategies, LambdaCase]
ghc-options: [-Wall, -Wcompat, -Wincomplete-uni-patterns, -Wincomplete-record-updates, -Werror]
dependencies:
  - base >= 4.20 && < 5
  - aeson
  - binary
  - bytestring
  - containers
  - crypton
  - directory
  - filepath
  - memory
  - text
  - time
  - typed-process
  - yaml
library:
  source-dirs: src
executables:
  shelf:
    main: Main.hs
    source-dirs: app
    dependencies: [shelf, optparse-applicative]
tests:
  shelf-test:
    main: Main.hs
    source-dirs: test
    dependencies: [shelf, hedgehog, tasty, tasty-hedgehog, tasty-hunit, tasty-golden, temporary]
```

- [ ] **Step 3: `shelf/test/Fixture.hs`**

```haskell
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
```

- [ ] **Step 4: Failing test `shelf/test/TypesSpec.hs`**

```haskell
module TypesSpec (tests) where
import Hedgehog
import qualified Hedgehog.Gen as Gen
import qualified Hedgehog.Range as Range
import Test.Tasty
import Test.Tasty.Hedgehog (testProperty)
import Test.Tasty.HUnit
import qualified Data.Text as T
import Data.Aeson (encode, decode)
import Data.Binary (encode, decode)   -- qualify: import qualified Data.Binary as B
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
  , testCase "year nd encodes as string" $ Data.Aeson.decode (Data.Aeson.encode NoDate) @?= Just NoDate
  , testCase "citekey Binary round-trip" $ B.decode (B.encode (ck "x-2020")) @?= ck "x-2020"
  , testCase "remote-backed iff verified sha matches" $ do
      let src = Source (ck "x-2020") (sh 'b') 1 "t" [] (Year 2020) Unsourced [Topic "options"] [] Nothing
      isRemoteBacked src @?= False
  ]
```
(Use `import qualified Data.Binary as B` and drop the unqualified Binary import line; keep `Data.Aeson` qualified references as shown.)

`shelf/test/Main.hs`:
```haskell
import Test.Tasty
import qualified TypesSpec
main :: IO ()
main = defaultMain (testGroup "shelf" [TypesSpec.tests])
```

- [ ] **Step 5: Run** — `cd ~/wvs-docs/shelf && stack test` → fails: `Shelf.Types` missing.

- [ ] **Step 6: Implement `shelf/src/Shelf/Types.hs`**

```haskell
module Shelf.Types
  ( Citekey, mkCitekey, citekeyText, Sha256, mkSha256, sha256Text
  , Topic (..), Provenance (..), Year (..), HippiusRecord (..), Source (..), isRemoteBacked
  ) where

import Data.Aeson
import Data.Aeson.Types (Parser)
import Data.Binary (Binary (..))
import Data.Char (isAsciiLower, isDigit, isHexDigit, isUpper)
import Data.Text (Text)
import qualified Data.Text as T
import Data.Time (UTCTime)

newtype Citekey = Citekey Text deriving stock (Eq, Ord, Show)
newtype Sha256  = Sha256 Text  deriving stock (Eq, Ord, Show)
newtype Topic   = Topic Text   deriving stock (Eq, Ord, Show) deriving newtype (FromJSON, ToJSON)

citekeyText :: Citekey -> Text
citekeyText (Citekey t) = t
sha256Text :: Sha256 -> Text
sha256Text (Sha256 t) = t

-- ^[a-z0-9]+(-[a-z0-9]+)*-(\d{4}|nd)(-v\d+)?$
mkCitekey :: Text -> Either Text Citekey
mkCitekey t = if ok (stripVersion (T.splitOn "-" t)) then Right (Citekey t) else Left ("invalid citekey: " <> t)
  where
    stripVersion parts = case reverse parts of
      (v : rest@(_ : _)) | Just ds <- T.stripPrefix "v" v, not (T.null ds), T.all isDigit ds -> reverse rest
      _ -> parts
    ok parts = case reverse parts of
      (y : rest@(_ : _)) -> (y == "nd" || (T.length y == 4 && T.all isDigit y)) && all seg rest
      _ -> False
    seg p = not (T.null p) && T.all (\c -> isAsciiLower c || isDigit c) p

mkSha256 :: Text -> Either Text Sha256
mkSha256 t
  | T.length t == 64 && T.all (\c -> isHexDigit c && not (isUpper c)) t = Right (Sha256 t)
  | otherwise = Left ("invalid sha256: " <> t)

instance FromJSON Citekey where parseJSON = withText "citekey" (either (fail . T.unpack) pure . mkCitekey)
instance ToJSON Citekey where toJSON = toJSON . citekeyText
instance Binary Citekey where
  put = put . citekeyText
  get = get >>= either (fail . T.unpack) pure . mkCitekey
instance FromJSON Sha256 where parseJSON = withText "sha256" (either (fail . T.unpack) pure . mkSha256)
instance ToJSON Sha256 where toJSON = toJSON . sha256Text

data Provenance = ArXiv Text | Doi Text | Isbn Text | Unsourced deriving stock (Eq, Show)
instance ToJSON Provenance where
  toJSON = \case
    ArXiv i -> object ["kind" .= ("arxiv" :: Text), "id" .= i]
    Doi i -> object ["kind" .= ("doi" :: Text), "id" .= i]
    Isbn i -> object ["kind" .= ("isbn" :: Text), "id" .= i]
    Unsourced -> object ["kind" .= ("unsourced" :: Text)]
instance FromJSON Provenance where
  parseJSON = withObject "provenance" $ \o -> (o .: "kind" :: Parser Text) >>= \case
    "arxiv" -> ArXiv <$> o .: "id"
    "doi" -> Doi <$> o .: "id"
    "isbn" -> Isbn <$> o .: "id"
    "unsourced" -> pure Unsourced
    k -> fail ("unknown provenance kind " <> T.unpack k)

data Year = Year Int | NoDate deriving stock (Eq, Show)
instance ToJSON Year where
  toJSON (Year y) = toJSON y
  toJSON NoDate = String "nd"
instance FromJSON Year where
  parseJSON (String "nd") = pure NoDate
  parseJSON v = Year <$> parseJSON v

data HippiusRecord = HippiusRecord
  { hrKey :: Text, hrVerifiedSha256 :: Text, hrEtag :: Text, hrVerifiedAt :: UTCTime }
  deriving stock (Eq, Show)
instance ToJSON HippiusRecord where
  toJSON h = object ["key" .= hrKey h, "verified_sha256" .= hrVerifiedSha256 h, "etag" .= hrEtag h, "verified_at" .= hrVerifiedAt h]
instance FromJSON HippiusRecord where
  parseJSON = withObject "hippius" $ \o ->
    HippiusRecord <$> o .: "key" <*> o .: "verified_sha256" <*> o .: "etag" <*> o .: "verified_at"

data Source = Source
  { srcCitekey :: Citekey, srcSha256 :: Sha256, srcBytes :: Int, srcTitle :: Text, srcAuthors :: [Text]
  , srcYear :: Year, srcProvenance :: Provenance, srcTopics :: [Topic], srcOrigin :: [FilePath]
  , srcHippius :: Maybe HippiusRecord }
  deriving stock (Eq, Show)
instance ToJSON Source where
  toJSON s = object $
    [ "citekey" .= srcCitekey s, "sha256" .= srcSha256 s, "bytes" .= srcBytes s, "title" .= srcTitle s
    , "authors" .= srcAuthors s, "year" .= srcYear s, "provenance" .= srcProvenance s
    , "topics" .= srcTopics s, "origin" .= srcOrigin s ] <> maybe [] (\h -> ["hippius" .= h]) (srcHippius s)
instance FromJSON Source where
  parseJSON = withObject "source" $ \o -> Source
    <$> o .: "citekey" <*> o .: "sha256" <*> o .: "bytes" <*> o .: "title" <*> o .:? "authors" .!= []
    <*> o .: "year" <*> o .: "provenance" <*> o .: "topics" <*> o .:? "origin" .!= [] <*> o .:? "hippius"

isRemoteBacked :: Source -> Bool
isRemoteBacked s = maybe False ((== sha256Text (srcSha256 s)) . hrVerifiedSha256) (srcHippius s)
```

- [ ] **Step 7: `stack test`** → PASS. Lint: `stack install hlint --local-bin-path ~/.local/bin && hlint src test app` → no hints (fix any). Optional: `fourmolu` if present on PATH.

- [ ] **Step 8: Commit** — `git add shelf && git commit -m "feat(shelf): scaffold package and Shelf.Types"`

---

### Task 4: `Shelf.Atomic` + `Shelf.Manifest` — **Backend Architect**

**Files:** `shelf/src/Shelf/Atomic.hs`, `shelf/src/Shelf/Manifest.hs`, `shelf/test/ManifestSpec.hs`, `manifest/schema.json`

**Interfaces — Produces:**
```haskell
writeAtomic :: FilePath -> ByteString -> IO ()   -- openBinaryTempFile in same dir, write, hClose, renameFile
data Manifest = Manifest { mfSchemaVersion :: Int, mfSources :: [Source] }
loadManifest :: FilePath -> IO (Either Text Manifest)      -- missing file => Right (Manifest 1 [])
loadManifestStrict :: FilePath -> IO (Either Text Manifest)  -- missing file => Left (used by CI check)
saveManifest :: FilePath -> Manifest -> IO ()               -- sorted by citekey; writeAtomic
upsert :: Source -> Manifest -> Manifest                    -- match on sha256; replace or append
data Violation = BadSchemaVersion Int | DupCitekey Citekey | DupSha Sha256 | EmptyTopics Citekey | UnknownTopic Citekey Topic
check :: [Topic] -> Manifest -> [Violation]
```

- [ ] **Step 1: Failing tests `shelf/test/ManifestSpec.hs`**

```haskell
module ManifestSpec (tests) where
import Test.Tasty; import Test.Tasty.HUnit; import Test.Tasty.Hedgehog (testProperty)
import Hedgehog; import qualified Hedgehog.Gen as Gen; import qualified Hedgehog.Range as Range
import System.IO.Temp (withSystemTempDirectory); import System.FilePath ((</>))
import Data.List (sortOn); import Data.Either (isLeft)
import qualified Data.Text as T
import Fixture; import Shelf.Types; import Shelf.Manifest

mkSrc :: T.Text -> Char -> [T.Text] -> Source
mkSrc k c ts = Source (ck k) (sh c) 10 "title" ["a"] (Year 2020) Unsourced (map Topic ts) [] Nothing

genSrc :: Gen Source
genSrc = do
  k <- Gen.text (Range.linear 1 6) Gen.lower; y <- Gen.int (Range.linear 1950 2030)
  h <- Gen.text (Range.singleton 64) (Gen.element "0123456789abcdef")
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
```
Register in `test/Main.hs`.

- [ ] **Step 2: Run** → fails.

- [ ] **Step 3: Implement**

`shelf/src/Shelf/Atomic.hs`:
```haskell
module Shelf.Atomic (writeAtomic) where
import qualified Data.ByteString as BS
import System.Directory (renameFile)
import System.FilePath (takeDirectory, takeFileName)
import System.IO (hClose, openBinaryTempFile)

writeAtomic :: FilePath -> BS.ByteString -> IO ()
writeAtomic p bytes = do
  (tmp, h) <- openBinaryTempFile (takeDirectory p) ("." <> takeFileName p <> ".tmp")
  BS.hPut h bytes >> hClose h
  renameFile tmp p
```

`shelf/src/Shelf/Manifest.hs`:
```haskell
module Shelf.Manifest (Manifest (..), Violation (..), loadManifest, loadManifestStrict, saveManifest, upsert, check) where
import Data.Aeson (FromJSON (..), ToJSON (..), object, withObject, (.:), (.=))
import Data.List (sortOn)
import qualified Data.Map.Strict as M
import Data.Text (Text)
import qualified Data.Text as T
import qualified Data.Yaml as Y
import System.Directory (doesFileExist)
import Shelf.Atomic (writeAtomic)
import Shelf.Types

data Manifest = Manifest { mfSchemaVersion :: Int, mfSources :: [Source] } deriving stock (Eq, Show)
instance ToJSON Manifest where toJSON m = object ["schema_version" .= mfSchemaVersion m, "sources" .= mfSources m]
instance FromJSON Manifest where parseJSON = withObject "manifest" $ \o -> Manifest <$> o .: "schema_version" <*> o .: "sources"

loadManifestStrict :: FilePath -> IO (Either Text Manifest)
loadManifestStrict p = do
  e <- doesFileExist p
  if not e then pure (Left ("manifest not found: " <> T.pack p))
  else either (Left . T.pack . Y.prettyPrintParseException) Right <$> Y.decodeFileEither p

loadManifest :: FilePath -> IO (Either Text Manifest)
loadManifest p = do
  e <- doesFileExist p
  if e then loadManifestStrict p else pure (Right (Manifest 1 []))

saveManifest :: FilePath -> Manifest -> IO ()
saveManifest p m = writeAtomic p (Y.encode m { mfSources = sortOn srcCitekey (mfSources m) })

upsert :: Source -> Manifest -> Manifest
upsert s m
  | any ((== srcSha256 s) . srcSha256) (mfSources m) =
      m { mfSources = map (\x -> if srcSha256 x == srcSha256 s then s else x) (mfSources m) }
  | otherwise = m { mfSources = mfSources m <> [s] }

data Violation = BadSchemaVersion Int | DupCitekey Citekey | DupSha Sha256 | EmptyTopics Citekey | UnknownTopic Citekey Topic
  deriving stock (Eq, Show)

check :: [Topic] -> Manifest -> [Violation]
check known (Manifest v srcs) =
  [BadSchemaVersion v | v /= 1] <> dups DupCitekey srcCitekey <> dups DupSha srcSha256 <> concatMap perSrc srcs
  where
    dups mk f = [mk k | (k, n) <- M.toList (M.fromListWith (+) [(f s, 1 :: Int) | s <- srcs]), n > 1]
    perSrc s = [EmptyTopics (srcCitekey s) | null (srcTopics s)]
            <> [UnknownTopic (srcCitekey s) t | t <- srcTopics s, t `notElem` known]
```
Note: `Data.Yaml.encode` emits keys alphabetically — accepted; the spec example order is documentary.

- [ ] **Step 4: `stack test`** → PASS; hlint clean.
- [ ] **Step 5: `manifest/schema.json`** — JSON Schema draft-07 of spec §5 with top-level `"description": "Documentation only — the validator is `shelf manifest check`"`.
- [ ] **Step 6: Commit** — `feat(shelf): Shelf.Atomic and Shelf.Manifest`

---

### Task 5: `Shelf.Extract` — **Backend Architect**

**Files:** `shelf/src/Shelf/Extract.hs`, `shelf/test/ExtractSpec.hs`, `shelf/test/fixtures/{small-a.pdf,small-b.pdf}`, `shelf/test/fixtures/{headers-raw.txt,headers-raw.golden,headers-layout.txt,headers-layout.golden}`

**Interfaces — Produces:**
```haskell
data PdfInfo = PdfInfo { piTitle, piAuthor, piProducer :: Maybe Text, piCreationYear :: Maybe Int, piPages :: Int }
pdfInfo :: FilePath -> IO (Either Text PdfInfo)
pdfToText :: FilePath -> IO (Either Text Text)        -- -raw (committed body)
pdfToLayout :: FilePath -> IO (Either Text Text)      -- -layout (transient, header detection)
firstPage :: FilePath -> IO (Either Text Text)
pdftotextVersion :: IO Text
extractorVersion :: Text                              -- "1"
headerLines :: Text {-layout-} -> [Text]              -- lines matching ^\d+(\.\d+)*\s+[A-Z][a-z]
applyHeaders :: [Text] -> Text {-raw-} -> Text        -- prefix "## " to raw lines equal (after T.strip) to a header line
data Stamp = Stamp { stSha256 :: Text, stPdftotext :: Text, stExtractor :: Text, stBodyBytes :: Int }
renderText :: Stamp -> Text -> Text
stampOf :: Text -> Maybe Stamp
upToDate :: Sha256 -> Maybe Stamp -> Int {-actual body bytes-} -> Bool   -- sha + extractor + body_bytes
```

- [ ] **Step 1: Fixtures (explicit picks, all arXiv/open — redistributable):** `cp ~/cfmm/cfmm-theory/swap_math_reference.pdf shelf/test/fixtures/small-a.pdf` (64 KB); `small-b.pdf` = the 78 KB `lababidi-greekfi…2025.pdf` found by `find ~/cfmm -name 'lababidi*.pdf'`. Then generate text fixtures **once, locally** and commit them (they, not live pdftotext output, are what goldens compare — poppler 26.x locally vs 24.x in CI differ):

```bash
cd ~/wvs-docs/shelf && pdftotext -raw -enc UTF-8 test/fixtures/small-b.pdf test/fixtures/headers-raw.txt \
 && pdftotext -layout -enc UTF-8 test/fixtures/small-b.pdf test/fixtures/headers-layout.txt
```

- [ ] **Step 2: Failing tests `shelf/test/ExtractSpec.hs`**

```haskell
module ExtractSpec (tests) where
import Test.Tasty; import Test.Tasty.HUnit; import Test.Tasty.Golden (goldenVsString)
import qualified Data.Text as T; import qualified Data.Text.IO as TIO; import qualified Data.Text.Encoding as TE; import qualified Data.ByteString.Lazy as BL
import Fixture; import Shelf.Types; import Shelf.Extract

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
```

- [ ] **Step 3: Run** → fails.

- [ ] **Step 4: Implement `shelf/src/Shelf/Extract.hs`**

```haskell
module Shelf.Extract
  ( PdfInfo (..), pdfInfo, pdfToText, pdfToLayout, firstPage, pdftotextVersion, extractorVersion
  , headerLines, applyHeaders, Stamp (..), renderText, stampOf, upToDate ) where
import Data.Char (isDigit, isLower, isUpper)
import qualified Data.ByteString.Lazy as BL
import Data.Text (Text); import qualified Data.Text as T; import qualified Data.Text.Encoding as TE
import qualified Data.Text.Read as TR
import qualified Data.Set as S
import System.Exit (ExitCode (..))
import System.Process.Typed (proc, readProcess)
import Shelf.Types

extractorVersion :: Text
extractorVersion = "1"

runTool :: String -> [String] -> IO (Either Text Text)
runTool tool args = do
  (code, out, err) <- readProcess (proc tool args)
  pure $ case code of
    ExitSuccess -> Right (TE.decodeUtf8Lenient (BL.toStrict out))
    ExitFailure n -> Left (T.pack tool <> " exit " <> T.pack (show n) <> ": " <> TE.decodeUtf8Lenient (BL.toStrict err))

pdfToText, pdfToLayout, firstPage :: FilePath -> IO (Either Text Text)
pdfToText p = runTool "pdftotext" ["-raw", "-enc", "UTF-8", p, "-"]
pdfToLayout p = runTool "pdftotext" ["-layout", "-enc", "UTF-8", p, "-"]
firstPage p = runTool "pdftotext" ["-raw", "-enc", "UTF-8", "-f", "1", "-l", "1", p, "-"]

pdftotextVersion :: IO Text   -- `pdftotext -v` prints "pdftotext version X.Y.Z" on stderr, exit 0
pdftotextVersion = do
  (_, _, err) <- readProcess (proc "pdftotext" ["-v"])
  pure (T.strip (T.replace "pdftotext version " "" (T.takeWhile (/= '\n') (TE.decodeUtf8Lenient (BL.toStrict err)))))

data PdfInfo = PdfInfo { piTitle, piAuthor, piProducer :: Maybe Text, piCreationYear :: Maybe Int, piPages :: Int }
  deriving stock (Eq, Show)

decimal :: Text -> Maybe Int
decimal t = case TR.decimal t of Right (n, rest) | T.null rest -> Just n; _ -> Nothing

pdfInfo :: FilePath -> IO (Either Text PdfInfo)
pdfInfo p = fmap parse <$> runTool "pdfinfo" [p]
  where
    parse out =
      let kv = [ (T.strip k, T.strip (T.drop 1 v)) | l <- T.lines out, let (k, v) = T.breakOn ":" l, not (T.null v) ]
          get k = case lookup k kv of Just v | not (T.null v) -> Just v; _ -> Nothing
          year = get "CreationDate" >>= \d -> case [y | w <- T.words d, T.length w == 4, Just y <- [decimal w]] of (y : _) -> Just y; _ -> Nothing
      in PdfInfo (get "Title") (get "Author") (get "Producer") year (maybe 0 id (get "Pages" >>= decimal))

-- ^\d+(\.\d+)*\s+[A-Z][a-z]
headerLines :: Text -> [Text]
headerLines = filter isHeader . map T.strip . T.lines
  where
    isHeader l = case T.words l of
      (n : w : _) -> numbered n && T.length w >= 2 && isUpper (T.head w) && isLower (T.index w 1)
      _ -> False
    numbered n = not (T.null n) && T.all (\c -> isDigit c || c == '.') n && isDigit (T.head n) && isDigit (T.last n)

applyHeaders :: [Text] -> Text -> Text
applyHeaders hs = T.intercalate "\n" . map mark . T.lines
  where set = S.fromList hs
        mark l = if T.strip l `S.member` set then "## " <> l else l

data Stamp = Stamp { stSha256 :: Text, stPdftotext :: Text, stExtractor :: Text, stBodyBytes :: Int } deriving stock (Eq, Show)

renderText :: Stamp -> Text -> Text
renderText st body = T.intercalate "\n"
  [ "---", "sha256: " <> stSha256 st, "pdftotext_version: " <> stPdftotext st, "extractor_version: " <> stExtractor st
  , "body_bytes: " <> T.pack (show (stBodyBytes st)), "---", body ]

stampOf :: Text -> Maybe Stamp
stampOf t = case T.lines t of
  ("---" : a : b : c : d : "---" : _) ->
    Stamp <$> T.stripPrefix "sha256: " a <*> T.stripPrefix "pdftotext_version: " b <*> T.stripPrefix "extractor_version: " c
          <*> (T.stripPrefix "body_bytes: " d >>= decimal)
  _ -> Nothing

upToDate :: Sha256 -> Maybe Stamp -> Int -> Bool
upToDate sha (Just st) actual = stSha256 st == sha256Text sha && stExtractor st == extractorVersion && stBodyBytes st == actual
upToDate _ Nothing _ = False
```
Body bytes = `BS.length (TE.encodeUtf8 body)` — the caller (Task 8) computes it identically when writing and when checking.

- [ ] **Step 5: Generate golden once** — `stack test --test-arguments --accept`; open `headers-raw.golden`, list in a comment in `ExtractSpec.hs` the false-positive `## ` lines it documents (equation numbers etc.). `stack test` → PASS.
- [ ] **Step 6: Commit** — `feat(shelf): Shelf.Extract with committed text fixtures`

---

### Task 6: `Shelf.Scan` — **Backend Architect**

**Files:** `shelf/src/Shelf/Scan.hs`, `shelf/test/ScanSpec.hs`

**Interfaces — Produces:**
```haskell
data Proposal = Proposal { prCitekey :: Text, prTopics :: [Text], prYear :: Year, prProvenance :: Provenance, prInclude :: Bool }
data ScanRow = ScanRow
  { srSha256 :: Sha256, srBytes :: Int, srPaths :: [FilePath], srTitle :: Text, srAuthors :: [Text]
  , srInclude :: Bool, srCitekey :: Text, srTopics :: [Text], srYear :: Year, srProvenance :: Provenance
  , srProposal :: Proposal            -- what the tool last proposed; human_edited := current fields /= proposal
  , srNote :: Text }                  -- junk reason / "duplicate provenance of <citekey>"
  -- YAML: sha256, bytes, paths, title, authors, include, citekey, topics, year, provenance, proposal:{…}, note
srHumanEdited :: ScanRow -> Bool
data ScanConfig = ScanConfig { scRoot :: FilePath, scIncludeRoots :: [FilePath], scExcludeDirs :: [Text] }
defaultConfig :: FilePath {-home-} -> ScanConfig
walkPdfs :: ScanConfig -> IO [FilePath]         -- never follows symlinks; visited set of canonical dirs
sha256File :: FilePath -> IO Sha256
proposeCitekey :: PdfInfo -> Text -> FilePath -> Text
detectArxiv :: Text -> Maybe Text               -- \d{4}\.\d{4,5}, version suffix stripped
isJunk :: PdfInfo -> FilePath -> Maybe Text
proposeTopics :: FilePath -> [Text]
flagProvenanceDuplicates :: [ScanRow] -> [ScanRow]   -- same ArXiv id, different sha: newest year keeps key, others get "-vN" and a note
mergeRows :: [ScanRow] -> [ScanRow] -> [ScanRow]     -- by sha; keeps existing include/citekey/topics/year when srHumanEdited; refreshes paths/proposal
loadScan :: FilePath -> IO (Either Text [ScanRow]); saveScan :: FilePath -> [ScanRow] -> IO ()   -- writeAtomic
```

`defaultConfig home`: include roots = `wvs-docs`, `cfmm/cfmm-theory`, `cfmms-playground`, `apps/d2p`, `learning/convex-analysis`, `learning/formal-methods`, `learning/mechanism-design`, `learning/structural-econometrics`, `learning/discrete`, `.local/share/wvs-shelf/legacy-refs` (all under `home`); exclude dir names = `.git .cache .TinyTeX site-packages .venv node_modules _work .stack .stack-work .cabal .ghcup .cargo go-build builds .claude` plus the rule "skip `.local/share/*` except `wvs-shelf`" and "skip `lib` when sibling `foundry.toml` exists". Junk: producer contains `matplotlib`/`gnuplot`, or path contains `/figures/`, `/reports/`, `/audits/`, or `piPages <= 2 && piTitle == Nothing`.

- [ ] **Step 1: Failing tests `ScanSpec.hs`** — `detectArxiv "arXiv:2305.14604v2 [q-fin]"` → `Just "2305.14604"`; `detectArxiv "foo 12.3"` → `Nothing`; `isJunk (PdfInfo Nothing Nothing (Just "matplotlib 3.8") Nothing 1) "/x/a.pdf"` → `Just _`; `isJunk (PdfInfo (Just "T") Nothing Nothing Nothing 10) "/x/figures/a.pdf"` → `Just _`; `proposeTopics "/h/cfmm/cfmm-theory/cfmm-options/x.pdf"` → `["options"]`, `"/h/cfmm/cfmm-theory/cfmm-mechanism_design/x.pdf"` → `["mechanism-design"]`, `"/h/.local/share/wvs-shelf/legacy-refs/refs/x.pdf"` → `["volatility-swaps"]`; `proposeCitekey (PdfInfo (Just "Optimal Fees for the AMMs") (Just "Jane Doe; Bob Roe") Nothing (Just 2023) 12) "" "x.pdf"` → `"doe-optimal-fees-amms-2023"` (first author's last word; first 3 title words after dropping stop words `the a an of for in on and`); walk on a temp dir with `a.pdf`, `.git/b.pdf`, `lib/c.pdf` + sibling `foundry.toml`, and a symlink `loop -> .` → exactly `[a.pdf]`; `flagProvenanceDuplicates` on two rows with `ArXiv "1"`, years 2022/2023 → the 2022 row's citekey ends in `-v1` and has a note; `mergeRows` keeps a human-edited row's `include=False, citekey="x-2020"` when the fresh proposal says `include=True, citekey="y-2020"`, but updates `srPaths`; a non-edited row adopts the fresh proposal.

- [ ] **Step 2: Run** → fails. **Step 3: Implement** — hashing: `Crypto.Hash (Digest, SHA256, hashlazy)` from `crypton`, `Data.ByteArray.Encoding (Base (Base16), convertToBase)` from `memory`, `TE.decodeUtf8 (convertToBase Base16 (hashlazy bytes :: Digest SHA256))`; walk: `listDirectory`, `pathIsSymbolicLink` → skip, `canonicalizePath` into a `Set` for cycle safety; `detectArxiv`: scan for the first run of 4 digits followed by `.` and 4–5 digits, drop `v\d+`; slug: `T.toLower`, map common accented Latin letters to ASCII, non-alnum → `-`, collapse repeated `-`, trim; `srHumanEdited r = (srInclude r, srCitekey r, srTopics r, srYear r) /= (prInclude p, prCitekey p, prTopics p, prYear p) where p = srProposal r`.

- [ ] **Step 4: `stack test`** → PASS; hlint clean. **Step 5: Commit** — `feat(shelf): Shelf.Scan walk/hash/propose/merge/dup-flag`

---

### Task 7: `Shelf.Index` — **Backend Architect**

**Files:** `shelf/src/Shelf/Index.hs`, `shelf/test/IndexSpec.hs`

**Interfaces — Produces:**
```haskell
data Doc = Doc { docId :: Citekey, docTitle :: Text, docBody :: Text }
data Index   -- Binary; fields: ixManifestHash :: Text, ixN :: Int, ixAvgDl :: Double, ixDl :: Map Citekey Int, ixPostings :: Map Text (Map Citekey Int)
tokenize :: Text -> [Text]
buildIndex :: Text {-manifest hash-} -> [Doc] -> Index      -- title tokens counted 3x
search :: Index -> Text -> Int -> [(Citekey, Double)]
saveIndex :: FilePath -> Index -> IO (); loadIndex :: FilePath -> IO (Maybe Index)
indexFresh :: Text {-manifest hash-} -> Maybe Index -> Bool
renderTopicIndex :: Topic -> [Source] -> [FilePath] -> [FilePath] -> Text   -- "## Sources" table ([@citekey] | title | year), "## Notes", "## Exercises"
renderTopicsReadme :: [(Topic, Int)] -> Text                                 -- topic → source count table
```

- [ ] **Step 1: Failing tests** — `tokenize "Résumé of AMMs, v2!"` → `["resume","of","amms","v2"]`; five tiny docs where the doc titled "optimal dynamic fees" is in the top-3 for `optimal dynamic fees`; unknown term → `[]`; Binary round-trip property (hedgehog: random small docs → identical `search` results after save/load in a temp dir); `indexFresh "h" (Just ix)` true iff `ixManifestHash ix == "h"`; `renderTopicIndex` output contains one `[@citekey]` row per source and the `## Notes` heading; `renderTopicsReadme` lists every topic.
- [ ] **Step 2: Run** → fails. **Step 3: Implement** with `Data.Map.Strict`; BM25 `idf * tf*(k1+1) / (tf + k1*(1 - b + b*dl/avgdl))`, `idf = log (1 + (N - df + 0.5)/(df + 0.5))`; ASCII-fold via a small explicit mapping of Latin-1 letters. **Step 4: PASS + hlint. Step 5: Commit** `feat(shelf): Shelf.Index BM25 and index rendering`.

---

### Task 8: `Shelf.Apply` + CLI — **Backend Architect**

**Files:** `shelf/src/Shelf/Apply.hs`, `shelf/app/Main.hs`, `shelf/test/ApplySpec.hs`

**Interfaces — Produces:**
```haskell
data RepoPaths = RepoPaths { rpRoot, rpManifest, rpScan, rpPdfs, rpText, rpTopics, rpIndex :: FilePath }
repoPaths :: FilePath -> RepoPaths
existingTopics :: RepoPaths -> IO [Topic]
preflight :: Manifest -> [ScanRow] -> [Text]     -- errors: dup citekeys among included rows; citekey already in manifest under another sha; unknown topic
applyRow :: RepoPaths -> Text {-pdftotext ver-} -> FilePath {-home-} -> ScanRow -> IO (Either Text Source)
  -- refuse if pdfs/<ck>.pdf exists with sha ≠ row sha; copy pdf (writeAtomic, skip if hash ok)
  -- → extract (skip if upToDate) → scaffold card per topic (skip if exists) → Source with origin = home-relative paths
scaffoldCard :: RepoPaths -> Source -> Topic -> IO ()
runApply :: RepoPaths -> IO ()   -- load scan+manifest → preflight (abort on any error) → fold rows: applyRow, upsert, saveManifest, saveScan (drop row) → rebuild indexes
runIndex :: RepoPaths -> IO ()   -- topics/*/INDEX.md, topics/README.md, index/bm25.bin if not indexFresh
```
CLI: `shelf scan [--root DIR] [--repo DIR]`, `shelf apply [--repo DIR]`, `shelf extract (CITEKEY | --all) [--repo DIR]`, `shelf index [--repo DIR]`, `shelf manifest check [--repo DIR] [--require]` (`--require` uses `loadManifestStrict`; exit 1 on any violation or, with `--require`, a missing file/`topics/`). `--repo` defaults to the nearest ancestor containing `manifest/` or `topics/`; error if none.

- [ ] **Step 1: Failing test `ApplySpec.hs`** — temp repo with `topics/options/`; a `ScanRow{include=True, citekey="small-a-2020", topics=["options"]}` pointing at `test/fixtures/small-a.pdf`; after `runApply`: `pdfs/small-a-2020.pdf` exists with matching sha, `text/small-a-2020.md` has an `upToDate` stamp, `topics/options/refs/small-a-2020.md` exists, `manifest/sources.yaml` has one row with home-relative `origin`; second `runApply` is a no-op (mtimes unchanged); a second row with the same citekey but different sha makes `preflight` non-empty and nothing is written; a row with topic `nope` → preflight error.
- [ ] **Step 2: Run** → fails. **Step 3: Implement** `Shelf.Apply` and `Main.hs` (`optparse-applicative` `subparser`). **Step 4: PASS + hlint.**
- [ ] **Step 5: Smoke** — `cd ~/wvs-docs/shelf && stack install --local-bin-path ~/.local/bin && cd .. && shelf manifest check && echo OK` (empty lenient manifest passes; `shelf manifest check --require` must fail here until Task 10).
- [ ] **Step 6: Commit** — `feat(shelf): apply pipeline and CLI`

---

### Task 9: CI — **DevOps Automator**

**Files:** `.github/workflows/ci.yml`

- [ ] **Step 1: Workflow**

```yaml
name: ci
on: [push, pull_request]
jobs:
  shelf:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - run: sudo apt-get update && sudo apt-get install -y poppler-utils
      - uses: haskell-actions/setup@v2
        with:
          enable-stack: true
          stack-no-global: true
          stack-setup-ghc: true
          stack-version: latest
      - uses: actions/cache@v4
        with:
          path: |
            ~/.stack
            shelf/.stack-work
          key: stack-ghc9.10.3-${{ runner.os }}-${{ hashFiles('shelf/stack.yaml', 'shelf/package.yaml') }}
          restore-keys: stack-ghc9.10.3-${{ runner.os }}-
      - run: stack test --no-terminal
        working-directory: shelf
      - run: stack install --no-terminal --local-bin-path "$HOME/.local/bin"
        working-directory: shelf
      - run: "$HOME/.local/bin/shelf" manifest check --require
      - name: no binaries in git
        run: |
          bad=$(git ls-files | grep -iE '\.pdf$' | grep -v '^shelf/test/fixtures/' || true)
          if [ -n "$bad" ]; then echo "$bad"; exit 1; fi
```

Note: `manifest check --require` is red until Task 10 lands the manifest — that is intended; Task 9 finishes when the *other* steps are green and this one fails only for the missing-manifest reason.

- [ ] **Step 2: Commit and push** — `git add .github && git commit -m "ci: stack test, manifest check, binary guard" && git push`; `gh run watch` → only the `manifest check --require` step red, with message `manifest not found`. Fix anything else until so.

---

### Task 10: Ingest the corpus — **general-purpose** (runs the CLI) with **HUMAN triage gate**

- [ ] **Step 1: Scan** — `cd ~/wvs-docs && shelf scan --root ~` (several minutes). Report: rows total, `include: true` count, junk-flagged count, provenance-duplicate count, and the 10 largest included files.
- [ ] **Step 2: HUMAN triage** — user edits `manifest/scan.yaml` (flip `include`, fix citekeys/topics/years; type-driven / Plank PDFs outside D2 roots get `include: true` here). Do not proceed until the user says triage is done.
- [ ] **Step 3: Apply** — `shelf apply` (aborts on preflight errors — report them and return to Step 2) → `shelf manifest check --require` → counts: sources, `text/` files, cards, topics touched.
- [ ] **Step 4: Sanity** — `git status --short | grep -ci '\.pdf$'` → 0; `du -sh text`; open two random `text/*.md`, confirm stamp + readable body.
- [ ] **Step 5: Commit** — `git add manifest text topics && git commit -m "feat(shelf): ingest corpus — N sources across M topics" && git push`; CI fully green.

---

### Task 11: cfmm-theory consumes the shelf — **Git Workflow Master**

Precondition: `git -C ~/cfmm/cfmm-theory status --short | wc -l` prints 0 (Task 0 Step 1, committed). Refuse otherwise. Nested plain repos (`macro-markets/`, `d2p-fee-strategies/`, `lp-derivatives/`, `scratchpad/`) are NOT touched and will not appear in a `--recurse-submodules` clone — expected.

Actual cfmm-theory layout to migrate (verified): `cfmm-<t>/EXERCISES/` (options incl. `artifacts/`, linear-algebra, discrete…), `cfmm-convex/EXERCISE/` (singular), `cfmm-<t>/notes/` (options: 15 files + `diagrams/`; banking, io, lending), top-level `cfmm-<t>/*.md`, root `notes/`. Topic name map: strip `cfmm-`; `mechanism_design → mechanism-design`.

- [ ] **Step 1: Add submodule** — `cd ~/cfmm/cfmm-theory && git submodule add https://github.com/JMSBPP/wvs-docs.git wvs-docs`
- [ ] **Step 2: Copy content into the submodule, commit there first**

```bash
cd ~/cfmm/cfmm-theory
for d in cfmm-*; do t=${d#cfmm-}; t=${t//_/-}; dst=wvs-docs/topics/$t; mkdir -p $dst/notes $dst/exercises
  [ -d $d/EXERCISES ] && cp -r $d/EXERCISES/. $dst/exercises/
  [ -d $d/EXERCISE ]  && cp -r $d/EXERCISE/.  $dst/exercises/
  [ -d $d/notes ]     && cp -r $d/notes/.     $dst/notes/
  find $d -maxdepth 1 -name '*.md' -exec cp {} $dst/notes/ \;
done
cp -r notes/. wvs-docs/topics/applications/notes/
cd wvs-docs && git add -A && git commit -m "chore(topics): import cfmm-theory notes and exercises" && git push && cd ..
git -C ~/wvs-docs pull   # keep the primary checkout in sync
```

- [ ] **Step 3: Remove the copies and the 22 tracked PDFs from cfmm-theory** — first verify every tracked PDF's sha256 is in the manifest:

```bash
for f in $(git ls-files | grep -i '\.pdf$'); do h=$(sha256sum "$f" | cut -c1-64); grep -q "$h" wvs-docs/manifest/sources.yaml || echo "MISSING $f"; done
```
Any `MISSING` → stop, report (it is a Task 10 triage gap). Then `git rm -rq cfmm-*/EXERCISES cfmm-*/EXERCISE cfmm-*/notes notes` and `git ls-files | grep -i '\.pdf$' | xargs git rm -q`, keeping every non-md/non-pdf file (code, `clamm-automaton/`, `lean4-libs/`, `tools/`).

- [ ] **Step 4: Fix links (≈150 files)** — script: `grep -rl --include=*.md -E '(\.\./)*cfmm-[a-z_]+/' . | grep -v '^./wvs-docs' ` → for each, `sed -i -E 's#(\.\./)*cfmm-([a-z]+)_?([a-z]*)/(EXERCISES|EXERCISE|notes)/#wvs-docs/topics/\2-\3/…#'` is too fragile — instead do it with a tiny script that rewrites `cfmm-<t>/(EXERCISES|EXERCISE)/` → `wvs-docs/topics/<t>/exercises/` and `cfmm-<t>/notes/` → `wvs-docs/topics/<t>/notes/` using the same topic map as Step 2, then `grep -rn 'cfmm-[a-z_]*/\(EXERCISES\|EXERCISE\|notes\)/' --include=*.md . | grep -v wvs-docs` must be empty. Add to cfmm-theory `CLAUDE.md`: "Notes, exercises and references live in the `wvs-docs/` submodule (`git submodule update --init`)."
- [ ] **Step 5: One scoped commit in cfmm-theory** — `git add -A && git commit -m "refactor: consume wvs-docs shelf as submodule; drop local notes/PDF copies" && git push`
- [ ] **Step 6: Verify** — fresh `git clone --recurse-submodules` into scratch: `wvs-docs/topics/options/exercises/` populated; `git ls-files | grep -ci '\.pdf$'` → 0.

---

## Self-review

- **Spec coverage:** §4 layout → T2/T8/T10; §5 manifest incl. `-vN`/dup flag → T3/T4/T6; §6.1–6.6 (scan, triage, apply commit point, extract with `-layout` header pass, index + `topics/README.md` + manifest-hash cache, manifest check) → T6/T10/T8/T5/T7/T4; origin home-prefix strip → T8; §7 package/tests → T3–T8; §10 Phase 1 steps 0–5 → T0, T1+T2, T3–T8, T10, T11; D10 CI → T9; O1 → T1. Phase 2/3 intentionally absent.
- **Placeholders:** none. README body is a section list (prose).
- **Type consistency:** `ScanRow`/`Proposal` (T6) consumed by T8; `Stamp`/`upToDate`/`applyHeaders` (T5) consumed by T8; `Manifest`/`upsert`/`check`/`loadManifestStrict` (T4) consumed by T8/T9; `Binary Citekey` (T3) needed by T7; `writeAtomic` (T4) used by T5-T8 writers.

## Plan review record (two-step, per user rule)

Reviewers: Reality Checker + Backend Architect, 2026-08-26, parallel, read-only.
BLOCKERs fixed: plan file would have been deleted by Task 1 (now committed+pushed first, `&&`-chained); `let Right` under `-Werror` (Fixture.hs `right`); CI `manifest check` ran in `shelf/` against a missing file (now root + `--require` + `loadManifestStrict`); `fourmolu` not in LTS (dev-tool only; hlint is the gate).
MAJORs fixed: golden drift across poppler versions (goldens on committed text fixtures); explicit fixture picks; scan symlink/cycle/exclusion gaps; cfmm-theory real layout + commit-not-stash; nested repos excluded; provenance-duplicate `-vN` policy, `topics/README.md`, index cache by manifest hash, `-layout` header pass, origin stripping all assigned; citekey-collision guard + preflight; atomic writes for all artefacts + `body_bytes` stamp; `human_edited` derived from a stored proposal; `Binary Citekey`; haskell-actions inputs/cache; `.claude/` skills preserved; paper-notes not placed in `refs/`.
MINORs applied: `Data.Text.Read.decimal`, `Base (Base16)`, `BadSchemaVersion`, `.PDF` in guards, `~/wvs-docs pull` after submodule commit, commit-count claims replaced by grep checks. Accepted as-is: alphabetical YAML key order; `upsert` on a renamed citekey leaves stale files (documented — `preflight` rejects citekey changes for an existing sha).
