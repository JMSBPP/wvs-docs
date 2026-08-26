# cfmm-refs Phase 2 Implementation Plan — Hippius remote + guarded cleanup

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Every shelf PDF stored on Hippius under `topics/<topic>/<citekey>.pdf` (verified by download, URL recorded in the manifest and rendered on cards/indexes), `shelf fetch` rebuilds `pdfs/` on any clone, and a guarded `shelf cleanup` removes the arXiv-provenance duplicates under `$HOME` (73 files / 0.104 GB today).

**Architecture:** Hand-rolled SigV4 + `http-client-tls` in `Shelf.Remote.*` with a streaming `sendWith` primitive that re-signs per attempt; manifest schema v2 whose `remote` block stores endpoint + bucket + per-topic objects (generated files render `roUrl` verbatim, never from env); `Shelf.Cleanup` split into IO `gather` and pure `classify` over a `Facts` record with a closed `SkipReason` type; an event-log WAL; a curl probe against Hippius first, whose results are written into the spec before any Haskell.

**Tech Stack:** Stack lts-24.56 / GHC 9.10.3; `crypton`, `memory`, `http-client 0.7.19`, `http-client-tls 0.3.6.4`, `http-types 0.12.6`, `case-insensitive 1.2.1`, `unix`, `yaml`, `aeson`; tests `tasty`, `tasty-hunit`, `tasty-hedgehog`, `tasty-golden`, `warp 3.4.9`, `wai 3.2.5`; curl 8.20 (`--aws-sigv4`).

**Spec:** `docs/superpowers/specs/2026-08-26-cfmm-refs-phase2-remote-cleanup-design.md`. Three spec amendments are made by Task 1 (`Remote` carries `endpoint`; `classify` takes the allowed-repo list; §6 has eight conjuncts 0–7 and the log stores `$HOME`-relative paths).

## Global Constraints

- Resolver `lts-24.56`, no `extra-deps`; `-Werror`; hlint clean; no `let Right`; `stack` only inside `shelf/`; every new test module is registered in `shelf/test/Main.hs` (hpack does not run unregistered specs — a vacuous GREEN).
- Branch `feat/shelf-phase2` on the fork `JMSBPP/cfmm-refs`; lands via PR to `d2p-finance/cfmm-refs`; never push to upstream directly.
- Object key `topics/<topic>/<citekey>.pdf`; one object per (source, topic); bucket `cfmm-refs`, region `decentralized`, path-style; visibility public-read (O-A) subject to Task 0's result.
- Manifest `schema_version: 2`; v1 rejected with a message naming `shelf migrate`; `hippius` key gone; `loadManifest` on a missing file returns `Manifest 2 []`.
- `check` returns `[(Severity, Violation)]`; CI's `shelf manifest check --require` must stay green with every source `Warn RemoteIncomplete` (pinned by a test).
- Verification = GET back and compare sha256 after each PUT; manifest saved after each verified object through one `MVar Manifest` read-modify-write.
- Cleanup: eight conjuncts 0–7 (spec §6), `gather`/`classify` split, closed `SkipReason`, dry-run default, `--execute --yes`, within-execute drift abort, event-log WAL at `manifest/cleanup-log.yaml` with `$HOME`-relative paths, provenance filter default `{arxiv}`; `GIT-RM` = `git rm --literal-pathspecs --` (stages **and** unlinks); never touches `pdfs/` or the shelf checkout (canonical path + `(deviceID, fileID)`).
- Credentials only from env (`HIPPIUS_*`); `HIPPIUS_ENDPOINT` affects **only** the live client, never rendered files or `check`.
- Executing agent per task named in each header; commit trailer as in Phase 1.

---

## File structure

```
shelf/src/Shelf/
├── Types.hs              T1  Remote{endpoint,bucket,objects}, RemoteObject, mkTopic, objectKey/objectUrl, upsertObject, drop HippiusRecord
├── Manifest.hs           T1  schema 2, Severity, remote violations, Manifest 2 [] default
├── Migrate.hs            T1  v1 → v2 (generic Value), idempotent, refuses dirty file
├── Apply/Cards.hs        T1  `pdf:` line; refreshCardHeader (front-matter-only rewrite, body preserved)
├── Apply/Index.hs        T1  runIndex also refreshes card headers
├── Index.hs              T1  `pdf` column from roUrl
├── Apply.hs              T1  runManifestCheck :: Bool -> Bool -> …; srcRemote = Nothing at :109
├── Atomic.hs             T2  withAtomicOutput
├── Remote/SigV4.hs       T3  (~200 lines)
├── Remote/Config.hs      T4
├── Remote/Http.hs        T4  sendWith (streaming, re-sign per attempt, injectable backoff)
├── Remote.hs             T4  ensureBucket/put/get/head/delete/publicUrl/presignGet
├── Remote/Cli.hs         T5  runPush/runFetch/runUrl, fetchArxiv
├── Cleanup/Facts.hs      T7  Facts, LiveCheck, SkipReason, Decision, classify (pure)
├── Cleanup/Git.hs        T7  batched probes, gitRm (stages + unlinks)
├── Cleanup/Log.hs        T7  event-log WAL
├── Cleanup.hs            T7  candidates, gatherFacts, planCleanup, executeCleanup
├── Cleanup/Cli.hs        T8  runCleanup
└── Scan/Types.hs         T5  scExcludeDirs += .displaced .arxiv .verify
shelf/app/Main.hs         T1 (migrate, --require-remote), T5 (push/fetch/url), T8 (cleanup)
shelf/test/{Main,StubServer,SigV4Spec,RemoteStubSpec,RemoteCliSpec,RemoteSpec,CleanupSpec,ManifestSpec,MigrateSpec,AtomicSpec,TypesSpec,IndexSpec,ApplySpec}.hs
```

---

### Task 0: Hippius probe with curl — **DevOps Automator**

**Files:** Modify spec §2 and P2-2 with results; scratch script in the session scratchpad.

- [ ] **Step 1: Environment** — `set -a; . ~/.config/hippius/env; set +a`; `B=cfmm-refs-probe-$(openssl rand -hex 4)`; `E=$HIPPIUS_ENDPOINT`; `sig() { curl -sS --aws-sigv4 "aws:amz:$HIPPIUS_REGION:s3" --user "$HIPPIUS_ACCESS_KEY_ID:$HIPPIUS_SECRET_ACCESS_KEY" "$@"; }`; `trap 'sig -X DELETE "$E/$B/topics/test/p.txt"; sig -X DELETE "$E/$B/topics/test/big.bin"; sig -X DELETE "$E/$B"' EXIT`.
- [ ] **Step 2: Bucket create** — `sig -X PUT -w '\n%{http_code}\n' "$E/$B"`; if not 200, retry with the region body: `sig -X PUT -H 'Content-Type: application/xml' --data-binary '<CreateBucketConfiguration><LocationConstraint>decentralized</LocationConstraint></CreateBucketConfiguration>' "$E/$B"`. Record which form worked. `sig -I "$E/$B"` → 200.
- [ ] **Step 3: Recorded signed exchange** — `sig -v --trace-ascii $S/trace.txt -I "$E/$B"`; extract exact `Authorization`, `x-amz-date`, `host`, path from the trace into spec §2 (this is Task 3's vector (c) — the only proof the `decentralized` scope string is accepted).
- [ ] **Step 4: ACL modes** — (a) `sig -X PUT -H 'x-amz-acl: public-read' -w '%{http_code}\n' "$E/$B?acl"`; (b) `printf 'hello' > /tmp/p.txt; sig -X PUT -H 'x-amz-acl: public-read' -H 'Content-Type: text/plain' --data-binary @/tmp/p.txt -w '%{http_code}\n' "$E/$B/topics/test/p.txt"`. Record which returned 200.
- [ ] **Step 5: Unauthenticated GET** — `curl -sS -o /dev/null -w '%{http_code}\n' "$E/$B/topics/test/p.txt"`. **Branch:** 200 ⇒ public-read confirmed, P2-2 stands. 403/other ⇒ record it, set P2-2 to *presigned-only*: `roUrl` becomes a presigned URL with the maximum 7-day expiry regenerated by `shelf index` (cards/INDEX carry it with the expiry date), `shelf url` defaults to `--signed`, and Task 6 Step 4 checks the presigned URL instead. Task 1 implements whichever branch §2 records.
- [ ] **Step 6: Read-after-write + ETag** — `head -c 5000000 /dev/urandom > /tmp/big.bin; sha256sum /tmp/big.bin`; `sig -X PUT --data-binary @/tmp/big.bin "$E/$B/topics/test/big.bin"`; immediately `sig -o /tmp/back.bin "$E/$B/topics/test/big.bin"; sha256sum /tmp/back.bin`; repeat 3×, time each; `sig -I` and record the ETag format (quoted? MD5?). Record throughput (MB/s) — Task 6's time budget derives from it.
- [ ] **Step 7: Delete** — objects then `sig -X DELETE -w '%{http_code}\n' "$E/$B"` → 204; `sig "$E/"` no longer lists it; clear the trap.
- [ ] **Step 8: Billing** — user reads the console credits page; agent records `hippius.com/pricing` text on minimum charge. Write into §2.
- [ ] **Step 9:** Update spec §2 ("Unverified…" bullet → results) and P2-2; commit `docs(spec): phase 2 probe results` on `feat/shelf-phase2`.

---

### Task 1: Manifest v2, Remote types, Severity, migrate, `pdf` rendering, card header refresh — **Backend Architect** (opus)

**Files:** Modify `shelf/src/Shelf/Types.hs`, `Manifest.hs`, `Migrate.hs` (create), `Apply.hs` (`:109` `srcHippius` → `srcRemote = Nothing`; `runManifestCheck`), `Apply/Cards.hs`, `Apply/Index.hs`, `Index.hs`, `app/Main.hs` (`migrate` command; `manifest check --require-remote`), tests `TypesSpec.hs`, `ManifestSpec.hs` (existing `length … == 4` case becomes severity-aware), `ApplySpec.hs`, `IndexSpec.hs`, `MigrateSpec.hs` (create), `test/Main.hs`; spec amendments (see header).

**Interfaces — Produces:**
```haskell
mkTopic :: Text -> Either Text Topic                      -- ^[a-z0-9]+(-[a-z0-9]+)*$ ; FromJSON Topic validates
data RemoteObject = RemoteObject { roTopic :: Topic, roKey, roUrl, roEtag :: Text, roVerifiedSha256 :: Sha256, roVerifiedAt :: UTCTime }
data Remote = Remote { rmEndpoint :: Text, rmBucket :: Text, rmObjects :: [RemoteObject] }   -- JSON: endpoint, bucket, objects
srcRemote :: Source -> Maybe Remote                       -- JSON key "remote"; replaces srcHippius
objectKey :: Topic -> Citekey -> Text                     -- "topics/<t>/<ck>.pdf"
objectUrl :: Text {-endpoint-} -> Text {-bucket-} -> Text {-key-} -> Text
upsertObject :: Text {-endpoint-} -> Text {-bucket-} -> RemoteObject -> Source -> Source   -- replace by roTopic, keep objects sorted by topic; creates Remote if absent
isRemoteBacked :: Source -> Bool ; missingTopics :: Source -> [Topic] ; staleObjects :: Source -> [RemoteObject]
data Severity = Warn | Err
data Violation = BadSchemaVersion Int | DupCitekey Citekey | DupSha Sha256 | EmptyTopics Citekey | UnknownTopic Citekey Topic
               | RemoteBadKey Citekey Text | RemoteShaDrift Citekey Topic | RemoteIncomplete Citekey [Topic] | RemoteStale Citekey [Topic]
check :: [Topic] -> Manifest -> [(Severity, Violation)]  -- env-free; url check is roUrl == objectUrl rmEndpoint rmBucket roKey
loadManifest :: missing ⇒ Right (Manifest 2 []); version ≠ 2 ⇒ Left "manifest schema N — run `shelf migrate`"
migrateFile :: FilePath -> IO (Either Text MigrateResult)   -- data MigrateResult = Migrated | AlreadyV2 ; refuses (Left) if `git status --porcelain -- <file>` is non-empty
runManifestCheck :: Bool {-require-} -> Bool {-requireRemote-} -> RepoPaths -> IO ()
cardHeader :: Source -> Topic -> [Text]                    -- front-matter lines incl. `pdf: <roUrl>` or `pdf: ~`
refreshCardHeader :: RepoPaths -> Source -> Topic -> IO () -- rewrites only the `---` block of an existing card via writeAtomic, body byte-preserved; scaffolds if absent
renderTopicIndex :: Topic -> [Source] -> [FilePath] -> [FilePath] -> Text   -- `pdf` column: [pdf](roUrl) | —
runIndex :: also calls refreshCardHeader for every (source, topic)
```

- [ ] **Step 1: Failing tests** — `TypesSpec`: `mkTopic` accept/reject (`mechanism-design` ok; `Mechanism`, `a_b`, `` rejected); `objectKey`; `upsertObject` twice for the same topic ⇒ one object; `isRemoteBacked` true only with every topic verified and sha matching; `staleObjects`; JSON round-trip with `remote`. `ManifestSpec`: v1 file ⇒ `Left` mentioning `shelf migrate`; missing file ⇒ `Manifest 2 []`; `check` yields `(Err,RemoteBadKey)` for a wrong key or url, `(Err,RemoteShaDrift)`, `(Warn,RemoteIncomplete)` for a source with no `remote` block **and** for a partially covered one, `(Warn,RemoteStale)`; the existing four-violation case updated to `Manifest 3 …` and severity-aware; "a manifest whose sources have no `remote` block yields only `Warn`" (CI pin). `MigrateSpec`: v1 file with a `hippius:` block ⇒ v2 without it, other content identical after YAML normalisation; running again ⇒ `AlreadyV2`; dirty-in-git file ⇒ `Left`. `IndexSpec`: `renderTopicIndex` shows `[pdf](https://…)` when verified else `—`. `ApplySpec`: `refreshCardHeader` on a card with a hand-written `## Notes` body changes only the header and preserves the body bytes; on a missing card scaffolds it.
- [ ] **Step 2: `stack test`** → RED.
- [ ] **Step 3: Implement** (all files above; `Migrate.hs` parses `Y.Value`, sets `schema_version: 2`, deletes `hippius` per source, `writeAtomic`; `app/Main.hs` gains `Migrate` and `ManifestCheck Bool Bool`). Amend spec: §4 `Remote` gains `endpoint`; §6 `classify :: [FilePath] -> Facts -> Decision`; §6 "eight conjuncts 0–7"; §6 log paths `$HOME`-relative.
- [ ] **Step 4: Migrate the real manifest** — `stack install --local-bin-path ~/.local/bin; cd ..; shelf migrate` → `Migrated`; `shelf manifest check --require` → ok with 163 `Warn RemoteIncomplete`; `git diff --stat manifest/sources.yaml` — expect only the version line (if YAML normalisation changed more, inspect and report; it is a check, not an assertion). `shelf index` → 214 cards now carry `pdf: ~`, bodies untouched (`git diff --stat topics/` shows header-only changes).
- [ ] **Step 5: `stack test`** → GREEN; hlint clean.
- [ ] **Step 6: Commit** — `feat(shelf): manifest v2 with remote objects, severity-tagged check, migrate, card header refresh`.

---

### Task 2: `withAtomicOutput` — **Backend Architect**

**Files:** Modify `shelf/src/Shelf/Atomic.hs`; Test `test/AtomicSpec.hs`.

**Produces:** `withAtomicOutput :: FilePath -> (Handle -> IO a) -> IO a` — temp in the target's dir, `bracketOnError` removes it on exception, on success `hClose`, `setFileMode 0o644`, `renameFile`, returns the action's value. `writeAtomic p bs = withAtomicOutput p (\h -> BS.hPut h bs)`.

- [ ] **Step 1:** Failing tests — 1 MB through the handle ⇒ identical bytes, mode 644, action value returned; throwing action ⇒ no temp, no target. **Step 2:** RED. **Step 3:** implement. **Step 4:** GREEN incl. existing cases. **Step 5:** commit `feat(shelf): withAtomicOutput`.

---

### Task 3: `Shelf.Remote.SigV4` — **Backend Architect** (opus)

**Files:** Create `shelf/src/Shelf/Remote/SigV4.hs` (~200 lines); Test `test/SigV4Spec.hs`; register in `test/Main.hs`.

**Produces:**
```haskell
data Credentials = Credentials { accessKey :: ByteString, secretKey :: ByteString }
data Scope = Scope { region :: ByteString, service :: ByteString }
data CanonicalRequest = CanonicalRequest { crMethod, crPath, crQuery :: ByteString, crHeaders :: [(CI ByteString, ByteString)], crPayloadHash :: ByteString }
unsignedPayload :: ByteString                                  -- "UNSIGNED-PAYLOAD"
hashHex :: ByteString -> ByteString
uriEncode :: Bool {-encodeSlash-} -> ByteString -> ByteString  -- RFC 3986 S3 rules; never normalises
canonicalRequest :: CanonicalRequest -> ByteString
stringToSign :: UTCTime -> Scope -> ByteString -> ByteString
signingKey :: Credentials -> UTCTime -> Scope -> ByteString
signature :: Credentials -> UTCTime -> Scope -> CanonicalRequest -> ByteString
signHeaders :: Credentials -> UTCTime -> Scope -> ByteString {-method-} -> ByteString {-host incl. port-} -> ByteString {-raw path-} -> [(ByteString, ByteString)] {-query-} -> [(CI ByteString, ByteString)] -> ByteString {-payload hash-} -> [(CI ByteString, ByteString)]   -- returns headers to send (host, x-amz-date, x-amz-content-sha256, authorization, + given)
presignQuery :: Credentials -> UTCTime -> Scope -> ByteString {-host-} -> ByteString {-path-} -> Int {-expires, clamped ≤ 604800-} -> [(ByteString, ByteString)]
```
Rules per spec §5.1 (raw single-encoded path, sorted query with `k=` for empty, lowercase sorted headers, one threaded `UTCTime`, presign `UNSIGNED-PAYLOAD` + `SignedHeaders=host`).

- [ ] **Step 1: Failing tests, pinned vectors (all four independently re-verified by the plan reviewers):**
  - S3 PUT example: key `AKIAIOSFODNN7EXAMPLE`, secret `wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY`, `20130524T000000Z`, `us-east-1`/`s3`, host `examplebucket.s3.amazonaws.com`, path `/test$file.text`, headers `date: Fri, 24 May 2013 00:00:00 GMT`, `x-amz-storage-class: REDUCED_REDUNDANCY`, payload hash `44ce7dd67c959e0d3524ffac1771dfbba87d2b6b4b4e99e42034a8b803f8b072` → signature `98ad721746da40c64f1a55b78f14c238d841ea1380cd77a1b5971af0ece108bd`; also assert the canonical request contains `/test%24file.text`.
  - S3 presigned GET: same creds/date/host, path `/test.txt`, expires 86400 → `X-Amz-Signature=aeeed9bbccd4d02ee5c0109b86d86835f995330da4c265957d157751f604d404`.
  - Suite `get-vanilla` (`service`/`us-east-1`, `AKIDEXAMPLE`, `wJalrXUtnFEMI/K7MDENG+bPxRfiCYEXAMPLEKEY`, `20150830T123600Z`, host `example.amazonaws.com`, path `/`) → `Signature=5fa00fa31553b73ebf1942676e86291e8372ff2a2260956d9b8aae1d763fbf31`; `get-vanilla-query-order-key-case` (query `Param2=value2&Param1=value1`) → `Signature=b97d918cfa904a5beff61c982a1b6f458b799221646efd99d3219ec94cdf2500`.
  - Vector (c): the Hippius HEAD exchange recorded in Task 0 (creds from env, so this case is env-gated: skipped when `HIPPIUS_SECRET_ACCESS_KEY` is unset) — recomputed `Authorization` must equal the trace's.
  - Properties: `uriEncode` decodes back for random ASCII; `presignQuery` sorted; `expires` clamped.
- [ ] **Step 2:** RED. **Step 3:** implement (`Crypto.MAC.HMAC`, `Data.ByteArray.Encoding`). **Step 4:** GREEN — if the S3 example mismatches, diff the canonical request text against the AWS doc before touching HMAC. **Step 5:** commit `feat(shelf): SigV4 signer with AWS S3 vectors`.

---

### Task 4: `Shelf.Remote.{Config,Http}`, `Shelf.Remote`, stub server — **Backend Architect** (opus)

**Files:** Create `Remote/Config.hs`, `Remote/Http.hs`, `Remote.hs`, `test/StubServer.hs`, `test/RemoteStubSpec.hs`; Modify `package.yaml` (lib: `http-client`, `http-client-tls`, `http-types`, `case-insensitive`; test: `warp`, `wai`, `http-types`, `case-insensitive`), `test/Main.hs`.

**Produces:**
```haskell
data RemoteConfig = RemoteConfig { rcEndpoint :: Text, rcBucket :: Text, rcRegion :: ByteString, rcCreds :: Credentials, rcManager :: Manager, rcBackoff :: [Int] {-µs-}, rcAttemptCap :: Int {-µs-}, rcAclMode :: AclMode }
data AclMode = BucketAcl | ObjectAcl | NoAcl          -- from Task 0 result; env HIPPIUS_ACL_MODE overrides for tests
loadRemoteConfig :: IO (Either Text RemoteConfig)     -- env; missing key/secret ⇒ Left naming the variable; backoff [2s,8s,30s], cap 10 min
mkRemoteConfig :: … -> IO RemoteConfig                -- injectable endpoint/backoff (tests use [0,0,0])
scopeOf :: RemoteConfig -> Scope                      -- Scope rcRegion "s3"
data RemoteError = HttpFailure Text | UnexpectedStatus Int Text | VerifyMismatch Sha256 Sha256 | AttemptTimeout
sendWith :: RemoteConfig -> IO Request {-built & signed fresh per attempt-} -> (Response BodyReader -> IO a) -> IO (Either RemoteError a)
   -- withResponse under System.Timeout.timeout rcAttemptCap; responseTimeout = responseTimeoutMicro 300s; retry on retriable with rcBackoff; continuation re-run whole per attempt
send :: RemoteConfig -> IO Request -> IO (Either RemoteError (Response BL.ByteString))   -- sendWith + brConsume
ensureBucket :: RemoteConfig -> IO (Either RemoteError ())   -- HEAD 200 | 404 → PUT (with LocationConstraint body if Task 0 needed it) → ACL per rcAclMode
putObject :: RemoteConfig -> Text -> FilePath -> Sha256 -> IO (Either RemoteError Text)   -- streamFile (NOT chunked); x-amz-content-sha256 = sha; Content-Type application/pdf; x-amz-acl when ObjectAcl
getObject :: RemoteConfig -> Text -> FilePath -> IO (Either RemoteError Sha256)  -- sendWith; inside the continuation: withAtomicOutput dest (brRead loop writing + hashUpdate); a retry restarts the whole block
headObject :: RemoteConfig -> Text -> IO (Either RemoteError (Text, Int))
deleteObject, deleteBucket :: …
publicUrl :: RemoteConfig -> Text -> Text              -- = objectUrl rcEndpoint rcBucket
presignGet :: RemoteConfig -> Text -> Int -> IO Text
sha256OfFile :: FilePath -> IO Sha256                  -- incremental hashUpdate over 1 MiB chunks (also replaces Scan.sha256File's hashlazy)
```
Retriable: connection errors, `ResponseTimeout`, `ConnectionClosed`, `IncompleteHeaders`, 408, 429, 5xx, post-upload verify mismatch (handled in Task 5's push loop); non-retriable: other 4xx.

- [ ] **Step 1: `test/StubServer.hs`** — `withStub :: Credentials -> (Int {-port-} -> IORef (Map Text ByteString) -> IORef Int {-failFirstN-} -> IO a) -> IO a` using `testWithApplicationSettings (setHost "127.0.0.1" defaultSettings)`; routes `/bucket` and `/bucket/<key>` for HEAD/PUT/GET/DELETE (404 until created); for every request recompute SigV4 from `rawPathInfo`, `rawQueryString`, `requestHeaderHost` (incl. `:port`), the signed headers listed in `Authorization`, and the received `x-amz-content-sha256` — 403 on mismatch; for PUT additionally `consumeRequestBodyStrict` and 400 if its sha256 ≠ the header (this is what binds the body); `failFirstN > 0` ⇒ drain the body, respond 503, decrement. Honest limitation stated in a comment: the stub signs with the module under test, so canonicalisation bugs are caught by Task 3's vectors, not here.
- [ ] **Step 2: Failing tests (`RemoteStubSpec`)** — `ensureBucket` creates on 404 then no-ops; `putObject` 3 MB temp file ⇒ ETag, stub holds identical bytes; `getObject` ⇒ bytes + sha + mode 644; `headObject` length; 503-then-200 on a tiny body ⇒ success with one retry and `x-amz-date` differing between the two attempts recorded by the stub (re-sign proof); 503-then-200 on the 3 MB body ⇒ success (body drained); wrong creds ⇒ `UnexpectedStatus 403` with exactly one attempt; a continuation that throws on attempt 1 leaves no temp file; `publicUrl`.
- [ ] **Step 3:** RED. **Step 4:** implement (`Config` ~60, `Http` ~130, `Remote` ~160). **Step 5:** GREEN, hlint. **Step 6:** commit `feat(shelf): Hippius S3 client with signature-verifying stub`.

---

### Task 5: `push` / `fetch` / `url` — **Backend Architect**

**Files:** Create `Remote/Cli.hs`, `test/RemoteCliSpec.hs`, `test/RemoteSpec.hs` (env-gated); Modify `app/Main.hs` (`push`, `fetch`, `url`), `Scan/Types.hs` (`scExcludeDirs` += `.displaced`, `.arxiv`, `.verify`), `Scan.hs` (`sha256File` → `sha256OfFile`), `test/Main.hs`.

**Produces:**
```haskell
data PushOpts = PushOpts { poSel :: Maybe [Citekey] {-Nothing = all-}, poVerify :: VerifyMode, poDryRun :: Bool, poJobs :: Int }
runPush :: RepoPaths -> RemoteConfig -> PushOpts -> IO ExitCode
   -- MVar Manifest; workers: for each (source, topic) lacking a verified object: putObject → getObject to pdfs/.verify/<ck>.<topic>.pdf → compare → on match modifyMVar_ (upsertObject …) then saveManifest inside the lock; temp removed; summary uploaded/verified/skipped/failed; exit 1 on any failure
data FetchOpts = FetchOpts { foSel :: Maybe [Citekey], foDryRun, foForce :: Bool }
runFetch :: RepoPaths -> RemoteConfig -> FetchOpts -> IO ExitCode
   -- creates pdfs/ if missing; missing file ⇒ getObject (alphabetically-first verified topic) → place; present-but-mismatched ⇒ refuse unless --force (move to pdfs/.displaced/<ck>-<utc>.pdf); on remote failure with ArXiv id ⇒ fetchArxiv
fetchArxiv :: Manager -> Text {-id-} -> FilePath -> IO (Either Text Sha256)   -- unsigned GET https://arxiv.org/pdf/<id>, User-Agent "cfmm-refs-shelf/0.1 (+https://github.com/d2p-finance/cfmm-refs)", follow redirects, 3 s delay before each call; caller saves a mismatch to pdfs/.arxiv/<ck>.pdf and reports
runUrl :: RepoPaths -> RemoteConfig -> Citekey -> Maybe Topic -> Bool {-signed-} -> Int {-seconds-} -> IO ()   -- CLI parses --expires as Nh/Nd/Ns, clamps ≤ 604800
```

- [ ] **Step 1: Failing tests** — `RemoteCliSpec` on `withStub`: temp repo with two sources (one 2-topic, fixture PDFs) ⇒ `runPush` creates 3 objects and the manifest holds 3 verified `RemoteObject`s with `rmEndpoint` = the stub URL; second run uploads 0; `--dry-run` writes nothing; `--jobs 2` yields the same manifest as `--jobs 1`; delete `pdfs/a.pdf` ⇒ `runFetch` restores it with matching sha (and creates `pdfs/` when absent); corrupted `pdfs/a.pdf` ⇒ refused (exit 1); with `--force` displaced then restored. `RemoteSpec` (skipped unless `HIPPIUS_ACCESS_KEY_ID` set): bucket `cfmm-refs-test-<8 hex>` in `bracket`: `ensureBucket`, put/get/head 1 MB, unauthenticated GET of `publicUrl` returns the status Task 0 recorded, delete objects, delete bucket.
- [ ] **Step 2:** RED. **Step 3:** implement. **Step 4:** GREEN with and without the env sourced; hlint. **Step 5:** commit `feat(shelf): push/fetch/url commands`.

---

### Task 6: Real push and fetch round-trip — **general-purpose** (runs CLI) with HUMAN checkpoints

- [ ] **Step 1:** `set -a; . ~/.config/hippius/env; set +a; cd ~/cfmm-refs && shelf push --all --dry-run` → 214 objects listed; report count and bytes (expect 737,056,462 B).
- [ ] **Step 2 (HUMAN):** user confirms credits are funded and says "push".
- [ ] **Step 3:** `shelf push --all --jobs 2` in a loop until it reports 0 remaining (each invocation ≤ 600000 ms; the command is resumable and each verified object is saved immediately). After the first 10 objects report measured MB/s and the projected total; stop and tell the user if projection > 3 h. Then `shelf manifest check --require --require-remote` → ok; `shelf index`.
- [ ] **Step 4:** `curl -sI` three `roUrl`s (from the manifest) → the status Task 0 recorded (200 if public), `Content-Length` = `srcBytes`.
- [ ] **Step 5:** Commit + push the branch: `git add manifest/sources.yaml topics && git commit -m "feat(shelf): publish 214 objects to Hippius (topic-organised)" && git push -u origin feat/shelf-phase2`.
- [ ] **Step 6:** Round trip: `S=/tmp/claude-1000/-home-jmsbpp/f094a237-f564-47ee-b69a-68cf46595c38/scratchpad; git clone --branch feat/shelf-phase2 --single-branch https://github.com/JMSBPP/cfmm-refs.git $S/rt && cd $S/rt && shelf fetch --all` → 163 files, every `pdfs/*.pdf` sha matches the manifest, `shelf manifest check --require-remote` ok; `rm -rf $S/rt`.

---

### Task 7: `Shelf.Cleanup` core — **Backend Architect** (opus)

**Files:** Create `Cleanup/Facts.hs`, `Cleanup/Git.hs`, `Cleanup/Log.hs`, `Cleanup.hs`, `test/CleanupSpec.hs`; Modify `test/Main.hs`, `.gitignore` (nothing — log is committed with `$HOME`-relative paths).

**Produces:**
```haskell
-- Cleanup/Facts.hs (pure)
data LiveCheck = NotRequired | Verified | Failed Text
data GitFacts = NotInRepo | Tracked { gfTop :: FilePath, gfPathClean :: Bool, gfIndexClean :: Bool } | UntrackedOrIgnored { gfTop :: FilePath }
data Facts = Facts { fPath :: FilePath, fInShelfCheckout, fSameInodeAsMirror, fIsRegular, fIsSymlink :: Bool, fSha :: Maybe Sha256, fSource :: Maybe Source
                   , fRemoteBacked :: Bool, fLive :: LiveCheck, fMirrorMatches, fUnderOtherShelf, fProvenanceAllowed :: Bool, fGit :: GitFacts }
data SkipReason = ShelfCheckout | MirrorInode | NotRegular | ShaUnknown | NotRemoteBacked | LiveHeadFailed Text | MirrorMissing | OtherShelf | ProvenanceExcluded | TrackedIn FilePath | RepoIndexDirty | PathDirty
data Decision = Delete | GitRm FilePath | Skip SkipReason
classify :: [FilePath] {-allowed repos, canonical-} -> Facts -> Decision   -- conjuncts 0–7 in order, first failure wins
renderDecision :: Decision -> Text
-- Cleanup/Git.hs
repoTop :: FilePath -> IO (Maybe FilePath)   -- memoised per dir; canonicalised output; --literal-pathspecs; GIT_DIR/GIT_WORK_TREE/GIT_INDEX_FILE unset
batchProbe :: FilePath {-top-} -> [FilePath] -> IO (Map FilePath GitFacts)   -- one ls-files -z --error-unmatch, one check-ignore, one status --porcelain -z, one diff --cached --quiet
gitRm :: FilePath {-top-} -> [FilePath] -> IO ()   -- `git -C top rm -q --literal-pathspecs -- paths` : stages AND unlinks
-- Cleanup/Log.hs
data LogEvent = LogEvent { leKey :: Text {-<home-rel path>|<utc>-}, lePath :: FilePath {-home-relative-}, leSha :: Sha256, leCitekey :: Citekey, leAction :: Text, leRepo :: Maybe FilePath, leObjects :: [Text], leStatus :: Text {-pending|done-}, leAt :: UTCTime }
appendEvent :: FilePath -> LogEvent -> IO ()        -- append one YAML list item; never rewrites
readPending :: FilePath -> IO [LogEvent]            -- keys with a pending event and no done event
-- Cleanup.hs
type ProvSet = Set Text   -- provenance kinds allowed, default {"arxiv"}
candidates :: Manifest -> FilePath {-home-} -> ([(FilePath, Source)], [(FilePath, SkipReason)])   -- origins resolved; dedup; `.git` segment ⇒ skipped; not under home ⇒ skipped
gatherFacts :: RepoPaths -> Manifest -> Maybe RemoteConfig -> ProvSet -> Bool {-live-} -> FilePath -> Source -> IO Facts
planCleanup :: RepoPaths -> Manifest -> Maybe RemoteConfig -> ProvSet -> [FilePath] {-allowed-} -> Bool {-live-} -> IO [(Facts, Decision)]
executeCleanup :: RepoPaths -> (FilePath -> Source -> IO Facts) {-regather-} -> [FilePath] {-allowed-} -> [(Facts, Decision)] -> IO ExitCode
   -- for each planned Delete/GitRm: regather → classify; if Decision differs ⇒ abort run (exit 2, nothing further); else appendEvent pending → act → appendEvent done. GitRm batched per repo AFTER their pending events are written.
```

- [ ] **Step 1: Failing tests** — hedgehog over generated `Facts`: any failing conjunct ⇒ never `Delete`/`GitRm`; for each conjunct k, all-pass-except-k ⇒ not `Delete`; all pass + `UntrackedOrIgnored` ⇒ `Delete`; all pass + `Tracked` clean + top ∈ allowed ⇒ `GitRm top`; top ∉ allowed ⇒ `Skip (TrackedIn top)`; `fLive = NotRequired` passes conjunct 3, `Failed` fails it. Golden: temp tree with the eight spec §6 cases, paths rendered **relative to the tree root**, pinned table. Execute: temp tree ⇒ `executeCleanup` deletes exactly `Delete` rows, `git rm`s `GitRm` rows (file gone from disk and index), log has two events per action (`pending`, `done`); a regather that changes a decision ⇒ exit 2 and no further actions; `readPending` reports a synthetic crash (pending without done).
- [ ] **Step 2:** RED. **Step 3:** implement (`Facts` ~90, `Git` ~130, `Log` ~70, `Cleanup` ~200). **Step 4:** GREEN, hlint. **Step 5:** commit `feat(shelf): guarded cleanup core`.

---

### Task 8: `shelf cleanup` CLI, dry run, HUMAN review, execute — **DevOps Automator** (wiring), **general-purpose** (run)

**Files:** Create `Cleanup/Cli.hs`, `test/CleanupCliSpec.hs`; Modify `app/Main.hs` (`cleanup [--execute] [--yes] [--allow-repo DIR]… [--offline] [--include-unsourced --i-accept-two-copies]`), `test/Main.hs`.

- [ ] **Step 1:** Wire (`--execute` without `--yes` ⇒ error before any IO; `--include-unsourced` without `--i-accept-two-copies` ⇒ error) + tests → commit `feat(shelf): cleanup command`.
- [ ] **Step 2: Dry run** — `shelf cleanup` (arXiv-only, live HEAD): save the table to the scratchpad; report counts per action and the repos that would need `--allow-repo` (expected: `$HOME` itself is a git repo holding ~49 candidates; `cfmm/cfmm-theory`, `learning/convex-analysis/cfmm-lean`, `cfmms-playground/experiments/cfmm-automaton`).
- [ ] **Step 3 (HUMAN):** user reviews and names the `--allow-repo` set.
- [ ] **Step 4:** `shelf cleanup --allow-repo … --execute --yes` → `manifest/cleanup-log.yaml`; `git add manifest/cleanup-log.yaml && git commit -m "chore: cleanup log — N arXiv duplicates removed"`; report each allowed repo's pending staged deletions for the user to commit.
- [ ] **Step 5:** `shelf manifest check --require --require-remote` ok; `stack test` green; push branch; `gh pr create -R d2p-finance/cfmm-refs --head JMSBPP:feat/shelf-phase2 --base main` titled "Phase 2: Hippius remote + guarded cleanup" (body: probe results, 214 objects, cleanup summary).

---

## Self-review

- **Spec coverage:** §2/§8-1 probe + recorded exchange → T0; §4 manifest/Severity/migrate/`pdf` + card refresh → T1; §5.4 → T2; §5.1 → T3; §5.2/5.3/5.5/5.7 → T4/T5; §5.6 → T1/T5; §8-5 real push + round trip → T6; §6 → T7/T8; O-B → T7 `fProvenanceAllowed` + T8 flags; P2-7 → T1; three spec amendments listed in the header → T1 Step 3.
- **Placeholders:** none.
- **Type consistency:** `upsertObject` (T1) used by T5; `objectUrl` (T1) = `publicUrl` (T4); `withAtomicOutput` (T2) inside `getObject` (T4) and `refreshCardHeader` (T1); `Scope`/`Credentials` (T3) via `scopeOf` (T4); `sha256OfFile` (T4) used by T5/T7; `LiveCheck`/`SkipReason` (T7) rendered by T8; `runManifestCheck` two-Bool (T1) wired in `Main` (T1).

## Plan review record (two-step)

Reviewers: Reality Checker + Backend Architect (opus), 2026-08-26, parallel, read-only.
BLOCKERs fixed: cards never refreshed (`refreshCardHeader`, `runIndex` refreshes headers); round-trip ordered before push (push branch in T6 step 5, clone `--branch`); `git rm --cached` left files on disk (`gitRm` stages and unlinks); T1 called `shelf migrate` before wiring it and broke `Main.hs` (both in T1); drift-abort had no baseline (within-execute regather); env endpoint leaked into generated files and `check` (`Remote.rmEndpoint` in manifest; `check` env-free).
MAJORs fixed: real cleanup figure 73 files / 0.104 GB (goal/§1); GB/GiB and path counts corrected in spec §2; `sendWith` streaming primitive with per-attempt re-signing and `responseTimeout`; `MVar Manifest` read-modify-write for `--jobs`; T6 timeout loop + throughput checkpoint; presigned-only contingency branch in T0; `LiveCheck` type; `executeCleanup` regather closure; event-log WAL; golden paths root-relative and closed `SkipReason`; `Manifest 2 []` default; `upsertObject`; `test/Main.hs` registration in every task; `StubServer` shared; recorded Hippius exchange as vector (c); `.verify` excluded from scan; `fetchArxiv` unsigned path; `pdfs/` created by fetch; log paths `$HOME`-relative; CreateBucket LocationConstraint fallback + probe trap.
Accepted as-is: `checkResponse` note; `VerifyMismatch` positional fields.
