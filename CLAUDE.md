# cfmm-refs — CFMM research shelf

- PDFs are never committed; `pdfs/` is a local mirror. A source exists in this repo as a
  `manifest/sources.yaml` row + `text/<citekey>.md` + `topics/<t>/refs/<citekey>.md`.
- `manifest/sources.yaml` is **schema 2**. Each source may carry a `remote` block —
  `endpoint`, `bucket`, and one `objects` entry per topic recording `key`, `url`,
  `etag`, `verified_sha256` and `verified_at`. An object counts as verified only when
  its key, url and digest all agree with the source; a v1 file is refused with
  `run \`shelf migrate\``.
- A clone rebuilds `pdfs/` with `shelf fetch` — no credentials, the bucket is
  public-read. Only `shelf push` and `shelf url --signed` need keys.
- Add a source with `shelf scan` → edit `manifest/scan.yaml` → `shelf apply` →
  `shelf push`. Never edit `sources.yaml` by hand except to fix metadata; run
  `shelf manifest check` afterwards.
- Never edit `manifest/cleanup-log.yaml`. It is append-only evidence written by
  `shelf cleanup` before and after every action; an entry still `pending` is the
  record of a run that was interrupted, and is never tidied away.
- Every exercise under `topics/*/exercises/` carries an **Economic Meaning** section
  (same rule as cfmm-theory).
- Cite sources as `[@citekey]`.
- All tooling is Haskell (`shelf/`, lts-24.56; run `stack` from inside `shelf/`). Do not add Python.
