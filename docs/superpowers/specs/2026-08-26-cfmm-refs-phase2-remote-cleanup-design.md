# cfmm-refs Phase 2 — Hippius remote (topic-organised) + guarded local cleanup — design

Date: 2026-08-26. Status: revised after two-reviewer pass (Reality Checker + Backend
Architect); user decisions taken 2026-08-26 (§9). Supersedes the Phase-1 design's §5
`hippius` block, §6.7–6.10, §8–§9 where they differ. Repo: canonical `d2p-finance/cfmm-refs`,
dev fork `JMSBPP/cfmm-refs`.

## 1. Goal

Every PDF on the shelf is stored on Hippius S3 under a **topic-organised key**
(`topics/<topic>/<citekey>.pdf`, one object per topic the source carries), verified by
download, reachable at a stable URL recorded in the manifest and on cards; any clone can
rebuild `pdfs/` with `shelf fetch`; and the duplicate PDF copies recorded as `origin` paths
(**221 unique origin paths, 188 still on disk**) are removed by a guarded, dry-run-by-default
`shelf cleanup`. In this phase cleanup is limited to arXiv-provenance sources (O-B): **73 files /
0.104 GB**; the unsourced duplicates (≈0.63 GB) stay until a second remote exists. `~/cfmm-refs/pdfs/`
remains the single local mirror.

Non-goals: the DeepSeek plugin (Phase 3); deleting anything from `pdfs/`; touching PDFs not
in the manifest; embeddings; a sweep of `$HOME` for PDFs the manifest doesn't know.

## 2. Measured facts (2026-08-26)

- 163 sources; 51 multi-topic; Σ|topics| = **214 objects**, 737,056,462 B = **0.737 GB** (0.686 GiB)
  uploaded; Σ srcBytes = 601,299,232 B = 0.601 GB unique. Topic histogram: volatility-swaps 54, applications 48,
  econometrics 28, options 21, formal-methods 15, dgp 11, mechanism-design 8, io/discrete/convex
  7 each, control 4, type-driven 2, linear-algebra 1, banking 1.
- Provenance: **54 arXiv, 109 unsourced**, 0 DOI/ISBN. Only the 54 have any non-Hippius
  re-download path.
- `pdfs/` ↔ manifest is exactly 1:1 (163 files).
- `manifest/scan.yaml` is gitignored and currently holds only the 38 excluded rows; it is
  **not** part of the cleanup candidate set (§5).
- `hippius:` appears 0 times in `sources.yaml` — the Phase-1 field never reached disk.
- Hippius probe results (curl, 2026-08-26, full trace in
  `.superpowers/sdd/2026-08-26-cfmm-refs-phase2-remote-cleanup/task-0-report.md`): SigV4
  (`region=decentralized`, path-style) confirmed end-to-end, not just for ListBuckets — a
  signed HEAD on a freshly created bucket returned 200 with `Authorization: AWS4-HMAC-SHA256
  Credential=hip_72847e631de2a26a06bc7e60/20260826/decentralized/s3/aws4_request,
  SignedHeaders=host;x-amz-content-sha256;x-amz-date, Signature=...`. **CreateBucket**: plain
  `PUT` with no body → 200 (no `LocationConstraint` XML needed). **ACL**: both bucket-level
  `PUT ?acl` with `x-amz-acl: public-read` and per-object `x-amz-acl: public-read` on object
  `PUT` → 200. **Unauthenticated GET → 200** (public-read confirmed; P2-2's URL scheme is no
  longer provisional). **Read-after-write**: 3/3 rounds on a 5 MB object returned
  sha256-identical content immediately after write, no staleness; ETag is quoted 32-hex
  (MD5-shaped, S3-style). **Throughput**: GET ≈2.77–3.69 MB/s (mean ≈3.26 MB/s), PUT ≈1.75
  MB/s — Task 6's time budget should assume ~2–3.5 MB/s. **DELETE bucket → 204**, and the
  bucket is gone from a subsequent authenticated ListBuckets. **Pricing**
  (`hippius.com/pricing`, WebFetch): $0.003/GB/mo, one-hour minimum charge
  ($0.00000407268/GB for the first hour), continuous 6-second-block billing, monthly cycles in
  credits (1 credit = $1); the page states no free-credit floor or minimum balance requirement,
  and billing is cancel-anytime with no penalty. The console credits page itself is **pending
  user** review.

## 3. Decisions

| # | Decision | Rejected |
|---|---|---|
| P2-1 | Object key `topics/<topic>/<citekey>.pdf`; one object per (source, topic). | Primary-topic only; pointer objects. |
| P2-2 | Bucket `cfmm-refs`, region `decentralized`, `https://s3.hippius.com`, path-style, **public-read (O-A = a, user reaffirmed after the named-titles warning)**. URL scheme `https://s3.hippius.com/cfmm-refs/<key>` is **confirmed**, not provisional: the 2026-08-26 curl probe (task-0-report.md) verified CreateBucket (plain `PUT`, no body), both bucket- and object-level `x-amz-acl: public-read`, and an unauthenticated GET → 200 on a public-read object. The public-read branch applies; the presigned-only fallback in the probe brief (Step 5) was not needed. | Presigned-only fallback (not triggered — public-read GET returned 200). |
| P2-3 | Cleanup scope in this phase = `origin` paths of sources with provenance `arxiv` only (O-B = b; 54 sources), including git-tracked copies (via `git rm --cached` under `--allow-repo`). Unsourced sources' duplicates stay on disk until a second remote exists (`cleanup --include-unsourced` is refused unless `--i-accept-two-copies`). | Untracked only; skip cfmm-theory; `$HOME` sweep. |
| P2-4 | S3 client = hand-rolled SigV4 on `crypton` + `http-client`/`http-client-tls` (no S3 library builds on GHC 9.10 in lts-24.56). | amazonka git pin. |
| P2-5 | Verification = download-and-compare sha256 after every upload; `--verify=head` (ETag + length) for re-checks; `cleanup --execute` re-HEADs objects before deleting (§5). | Trust PUT ETag; trust the manifest. |
| P2-6 | Credentials from env only; CI has none; offline WAI stub covers the HTTP path in CI. | Config file in repo. |
| P2-7 | `schema_version: 2`; loader rejects 1 with a message naming `shelf migrate`. | Keep 1 (silent strip of `remote` by old binaries). |

## 4. Manifest changes

```yaml
schema_version: 2
sources:
  - citekey: milionis-amm-arbitrage-fees-2024
    …
    remote:
      endpoint: https://s3.hippius.com
      bucket: cfmm-refs
      objects:
        - topic: options
          key: topics/options/milionis-amm-arbitrage-fees-2024.pdf
          url: https://s3.hippius.com/cfmm-refs/topics/options/milionis-amm-arbitrage-fees-2024.pdf
          verified_sha256: "…"
          etag: "…"
          verified_at: 2026-08-27T10:00:00Z
```

Types: `newtype Topic` gains `mkTopic` (`^[a-z0-9]+(-[a-z0-9]+)*$`, since it becomes a key
segment); `RemoteObject { roTopic :: Topic, roKey, roUrl, roEtag :: Text, roVerifiedSha256 ::
Sha256, roVerifiedAt :: UTCTime }`; `Remote { rmEndpoint :: Text, rmBucket :: Text, rmObjects :: [RemoteObject] }` — the endpoint is stored in the
manifest so cards, indexes and `check` never depend on the `HIPPIUS_ENDPOINT` env var (`roUrl` is rendered verbatim);
`upsertObject` replaces an object by topic;
`srcRemote :: Maybe Remote`. `HippiusRecord` is deleted. `shelf migrate` rewrites a v1 file to
v2 (no-op on content since `hippius` never appeared) — the version bump exists so a Phase-1
binary **fails loudly** on a v2 manifest instead of silently dropping `remote` on its next
`saveManifest`.

`check :: [Topic] -> Manifest -> [(Severity, Violation)]` (env-free; URL check is `roUrl == objectUrl rmEndpoint rmBucket roKey`) with `data Severity = Warn | Err`.
`runManifestCheck` exits 1 on any `Err`; `--require-remote` promotes `Warn` to `Err` (used by
`cleanup`, never by CI). New violations:
- `Err`: `BadSchemaVersion`, `RemoteBadKey` (key ≠ `topics/<roTopic>/<ck>.pdf`, or `roUrl ≠
  endpoint/bucket/key`, or duplicate `roTopic` in one source), `RemoteShaDrift`
  (`roVerifiedSha256 ≠ srcSha256`).
- `Warn`: `RemoteIncomplete ck [topics]` (carried topic without a verified object),
  `RemoteStale ck [topics]` (object for a topic no longer carried).
`isRemoteBacked src` ⇔ every carried topic has an object with matching key and
`roVerifiedSha256 == srcSha256`.

Cards get front-matter `pdf: <url>` for their own topic; `INDEX.md` source tables gain a
`pdf` column; both regenerated by `shelf index` from the manifest.

## 5. `Shelf.Remote`

### 5.1 `Shelf.Remote.SigV4` (pure, ~150 lines)
Parameterised by service and region. Canonical request per AWS with the **S3 exception: the
canonical URI is the raw path, single-encoded, never normalised**. Header auth for PUT/GET/HEAD
with `x-amz-content-sha256` = real payload hash for PUT (computed by an incremental
`hashUpdate` pass over the file, never `readFile`) and `UNSIGNED-PAYLOAD` for GET/HEAD.
`x-amz-date` and the credential-scope date derive from one threaded `UTCTime`. Presign:
`X-Amz-Algorithm/Credential/Date/Expires (≤ 604800)/SignedHeaders=host`, payload hash
`UNSIGNED-PAYLOAD`, RFC-3986 query encoding (`~` unreserved, space `%20`, empty value emits
`=`), sorted by encoded key then value.
Tests: (a) AWS's two published **S3** examples — single-chunk header-auth PUT of
`examplebucket`/`test$file.text` (us-east-1, 20130524T000000Z, checks the no-normalisation and
`$` encoding rule) and the presigned GET of `test.txt` with `X-Amz-Expires=86400` — pinned
signature strings; (b) two generic suite vectors (`get-vanilla`,
`get-vanilla-query-order-key-case`, service `service`/us-east-1) as hygiene; (c) one recorded
Hippius HEAD-bucket exchange captured in the probe.

### 5.2 `Shelf.Remote.Config` (~60 lines)
`RemoteConfig { endpoint, bucket, region, accessKey, secretKey }` from env
(`HIPPIUS_ENDPOINT` default `https://s3.hippius.com`, `HIPPIUS_BUCKET`, `HIPPIUS_REGION`
default `decentralized`, `HIPPIUS_ACCESS_KEY_ID`, `HIPPIUS_SECRET_ACCESS_KEY`); endpoint is
injectable so tests can point at a local stub.

### 5.3 `Shelf.Remote.Http` (~120 lines)
One shared `Manager` per run; `checkResponse = \_ _ -> pure ()` (expected 404s are data);
PUT bodies via `streamFile` (replayable across retries); GET hashes while writing through
`withAtomicOutput` (below); per-attempt wall-clock cap via `System.Timeout.timeout` (10 min);
retry 3× with 2 s / 8 s / 30 s on connection errors, `ResponseTimeout`, `ConnectionClosed`,
`IncompleteHeaders`, 408, 429, 5xx, and post-upload verify mismatch; never on 4xx auth/permission
errors; any other status is a typed `RemoteError`.

### 5.4 `Shelf.Atomic` addition
`withAtomicOutput :: FilePath -> (Handle -> IO a) -> IO a` — temp file in the destination dir,
`bracketOnError` cleanup, `setFileMode 0o644`, `renameFile`; `writeAtomic` is re-expressed on
top of it.

### 5.5 `Shelf.Remote` (operations, ~140 lines)
`ensureBucket` (HEAD → 200 ok; 404 → PUT bucket; ACL handling per O-A and probe result),
`putObject key file sha` (returns ETag; `Content-Type: application/pdf`; per-object ACL header
if the probe shows per-bucket ACL unsupported), `getObject key dest` (streams, returns sha256),
`headObject key` (ETag, length), `deleteObject`, `deleteBucket` (tests only), `publicUrl`,
`presignGet`.

### 5.6 CLI (commands live beside their modules: `Shelf.Remote.Cli`, `Shelf.Cleanup.Cli`;
`app/Main.hs` stays dispatch-only; `Shelf.Apply`'s header comment is amended)
- `shelf push [--all | CITEKEY…] [--verify=get|head] [--dry-run] [--jobs N]` — for each
  (source, topic) lacking a verified object: PUT → GET back → sha compare → on match write the
  `RemoteObject` and `saveManifest` **immediately** (serialised through an `MVar` under
  `--jobs`). Missing `pdfs/<ck>.pdf` ⇒ reported, skipped. Summary uploaded / verified /
  skipped / failed; exit 1 on any failure. Expected wall-clock for the full run: 0.686 GB up +
  0.686 GB down — budget ~1–2 h at residential bandwidth.
- `shelf fetch [--all | CITEKEY…] [--dry-run] [--force]` — for sources whose `pdfs/<ck>.pdf`
  is missing: GET the object of the alphabetically-first verified topic → sha check → place.
  A present-but-mismatched mirror file is **refused** (consistent with `placePdf`) unless
  `--force`, which moves the old file to `pdfs/.displaced/<ck>-<utc>.pdf` first. Fallback for
  provenance `ArXiv id`: `https://arxiv.org/pdf/<id>` with an explicit `User-Agent`, redirects
  allowed, 3 s delay between requests; a sha mismatch (arXiv serves the latest version) is
  saved as `pdfs/.arxiv/<ck>.pdf` and reported, never used as the mirror. `pdfs/.displaced`
  and `pdfs/.arxiv` are added to `scExcludeDirs` so `shelf scan` never proposes them.
- `shelf url CITEKEY [--topic T] [--signed] [--expires DURATION]` — public URL or presigned
  URL (a presigned URL on a public object is not a privacy control; noted in `--help`).
- `shelf migrate` — v1 → v2 manifest.
- `shelf manifest check [--require] [--require-remote]`; `shelf index` renders `pdf`.

### 5.7 Tests
- Offline (CI): a `warp` WAI stub on `127.0.0.1` implementing PUT/GET/HEAD/DELETE with a
  404 path that **verifies the SigV4 signature it receives**; exercises path-style + custom
  endpoint + streaming + retry + `ensureBucket`. Test stanza gains `warp`, `wai`,
  `case-insensitive` (all in lts-24.56).
- Env-gated (`HIPPIUS_ACCESS_KEY_ID` set): `RemoteSpec` against a bucket
  `cfmm-refs-test-<8 hex>` created in `bracket`, all objects deleted, then the bucket.

## 6. `Shelf.Cleanup`

Architecture: `gatherFacts` (IO) observes; `classify :: [FilePath] {-allowed repos-} -> Facts -> Decision` is pure
and is what the property tests generate against; `Decision = Delete | GitRm top | Skip SkipReason` with a closed
`SkipReason` type. Eight conjuncts (0–7) below.

Candidates = `⋃ srcOrigin` over the manifest, resolved against `$HOME` (paths not under `$HOME`
after resolution are `SKIP unresolvable-base`); non-existent paths skipped silently; pre-filter
on `srcBytes` before hashing; any path containing a `.git` segment is refused.

`Facts` per candidate, and the **DELETE** rule — all eight must hold, re-evaluated per row at execute time
(drift since the plan ⇒ the run aborts):
0. not inside the invoking shelf checkout (`canonicalizePath` under `rpRoot`) **and**
   `(deviceID, fileID)` ≠ that of `pdfs/<ck>.pdf` — mirror protection by identity, never by
   remote-name heuristics;
1. regular file, not a symlink;
2. re-hashed sha256 ∈ manifest (mirror hash memoised per citekey);
3. that source `isRemoteBacked` **and**, under `--execute` (unless `--offline`), a live HEAD of
   each of its objects returns the recorded ETag and the file's length;
4. `pdfs/<ck>.pdf` exists and hashes to the same sha;
5. not under any git checkout whose `origin`/`upstream` URL ends in `/cfmm-refs(.git)?`
   (secondary guard for other shelf checkouts/submodules);
6. provenance of the source ∈ the allowed set (default `{arxiv}`; O-B);
7. git, via the nearest enclosing toplevel (`git -C <dir> rev-parse --show-toplevel`,
   canonicalised; git run with `--literal-pathspecs` and `GIT_DIR/GIT_WORK_TREE/GIT_INDEX_FILE`
   unset; one batched `ls-files -z` / `check-ignore` / `status --porcelain -z` per repo,
   memoised): not in a repo, or `ls-files --error-unmatch` ≠ 0 (untracked/ignored) ⇒ `DELETE`;
   tracked ⇒ `GIT-RM` only if toplevel ∈ canonicalised `--allow-repo` set **and** the path's
   status is clean **and** `git diff --cached --quiet` (whole index clean); otherwise `SKIP
   tracked-in <repo>` / `SKIP repo-index-dirty`. `GIT-RM` runs `git rm --literal-pathspecs --`, which
   stages the deletion **and unlinks the file**.

Output: `DELETE | GIT-RM <repo> | SKIP <reason>` per candidate, totals, repos needing a commit.
`--execute` requires `--yes`; it plans, then for each row re-gathers and re-classifies immediately
before acting and **aborts the run** if the decision differs. Log is an append-only event log
(`manifest/cleanup-log.yaml`, committed, paths `$HOME`-relative): `{key: <path>|<utc>, path, sha256,
citekey, action, repo?, object_keys, status: pending}` → act → append `{key, status: done, at}`;
last event per key wins; `pending` without `done` is reported on the next run. Batched `git rm --cached` per allowed repo.

Tests: hedgehog over generated `Facts` — a `Facts` failing exactly one conjunct is never
`DELETE`/`GIT-RM`; golden dry-run table over a temp tree (symlink, untracked dup, tracked dup
with/without `--allow-repo`, dirty-index repo, nested repo, dup under a fake shelf checkout,
the shelf's own `test/fixtures/headers.pdf` — which is an `origin` of
`elsts-concentrated-liquidity-leverage-2024` and must classify `SKIP shelf-checkout`).

## 7. Package changes

New: `Shelf.Remote.{SigV4,Config,Http,Cli}`, `Shelf.Remote`, `Shelf.Cleanup`,
`Shelf.Cleanup.Git`, `Shelf.Cleanup.Cli`, `Shelf.Migrate`. Changed: `Shelf.Types` (Remote types,
`mkTopic`, drop `HippiusRecord`), `Shelf.Manifest` (v2, `Severity`), `Shelf.Atomic`
(`withAtomicOutput`), `Shelf.Apply.{Cards,Index}` (`pdf`), `Shelf.Scan.Types`
(`scExcludeDirs` += `.displaced`, `.arxiv`), `app/Main.hs` (five new commands). Deps added:
`http-client`, `http-client-tls`, `http-types`, `case-insensitive`; test: `warp`, `wai`. Line
budgets as listed per module (≤ ~180 each; `Shelf.Cleanup.Git` ≤ ~130). `-Werror`, hlint,
CI shape unchanged (one cold cache rebuild expected).

## 8. Plan shape

1. **Probe first, with curl** (no Haskell): create `cfmm-refs-probe-<hex>`, try bucket ACL vs
   per-object ACL, PUT/GET/HEAD/DELETE, unauthenticated GET, read-after-write timing, DELETE
   bucket; check the billing page/console for a minimum charge. Results are written into §2
   and P2-2 before any code.
2. Types + manifest v2 + `migrate` + `Severity` + `pdf` rendering.
3. SigV4 with the S3 example vectors.
4. `Remote.{Config,Http}` + operations + WAI stub tests + `push --dry-run`.
5. `push --all` (budget 1–2 h) → manifest committed → `fetch` round-trip on a scratch clone.
6. `Cleanup` (`gather`/`classify`) + tests → dry run → user reviews the table and picks
   `--allow-repo` → `--execute --yes` → commit log; user commits in allowed repos.

## 9. Decisions taken 2026-08-26

- **O-A — Visibility.** The Reality Checker listed the named commercial titles that a public
  bucket would expose at stable URLs *committed into a public GitHub repo*: Pierce *TAPL*,
  Baxter–Rennie *Financial Calculus*, the *Oxford Handbook of Computational Economics and
  Finance*, Haug *Option Pricing Formulas*, Gatheral *The Volatility Surface* (×2), Murota
  *Discrete Convex Analysis*, plus Hull, Natenberg, Taleb, Kelliher. Options: (a) public
  bucket as chosen; (b) private bucket, presigned URLs only; (c) split by provenance —
  `arxiv` sources public, `unsourced` private (manifest records `public: bool`; cards show a
  URL only for public ones). **Chosen: (a) public.** Mitigation retained: `shelf url --signed` and a one-line switch to (c) via a `public: bool` per source if ever needed.
- **O-B — Backup exposure.** 109 sources have no re-download path. After cleanup they exist
  in exactly two places: Hippius (unproven durability) and the gitignored local mirror. Options:
  (a) accept the 2-copy design; (b) restrict cleanup to the 54 arXiv sources until a second
  remote exists; (c) add a second cheap remote (e.g. a private bucket elsewhere) before cleanup.
  **Chosen: (b).** Cleanup gates on provenance `arxiv`; §6 adds conjunct 6: provenance ∈ allowed set (default `{arxiv}`).

## 10. Risks

- Hippius semantics unverified → probe first; verify-by-download; live HEAD before delete.
- Public bucket / copyright → O-A.
- Single-remote durability → O-B.
- Cleanup is destructive → identity-based mirror protection, live HEAD, pure `classify`
  under property tests, dry-run default, `--yes`, decision-drift abort, write-ahead log.
- arXiv fallback version drift → `.arxiv/` quarantine.
