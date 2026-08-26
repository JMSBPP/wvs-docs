# cfmm-refs — CFMM research shelf

- PDFs are never committed; `pdfs/` is a local mirror. A source exists in this repo as a
  `manifest/sources.yaml` row + `text/<citekey>.md` + `topics/<t>/refs/<citekey>.md`.
- Add a source with `shelf scan` → edit `manifest/scan.yaml` → `shelf apply`. Never edit
  `sources.yaml` by hand except to fix metadata; run `shelf manifest check` afterwards.
- Every exercise under `topics/*/exercises/` carries an **Economic Meaning** section
  (same rule as cfmm-theory).
- Cite sources as `[@citekey]`.
- All tooling is Haskell (`shelf/`, lts-24.56; run `stack` from inside `shelf/`). Do not add Python.
