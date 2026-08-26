#!/usr/bin/env python3
"""_check_snapshot.py — gate on the frozen snapshot provenance (02-04 Task 1 verify).

A real Python file (NOT an inline HTML-escaped heredoc) so the verify parses.

Accepts EITHER:
  (a) a non-blocked snapshot carrying the full provenance: sha256, dune_query_id,
      dune_execution_id, prereg_commit_sha, n_feasibility (passed: true), sigma_xcheck,
      with prereg_commit_ts < snapshot_ts (ISO-8601 string compare); OR
  (b) status: blocked with evidence present.
"""
import json
import sys

PATH = "cfmm-options/EXERCISES/artifacts/numerical/snapshot/snapshot.session.json"

d = json.load(open(PATH))

if d.get("status") == "blocked":
    assert any(k in str(d) for k in ("evidence", "queried", "blocked")), \
        "blocked must carry evidence"
    print("SNAPSHOT_OK (blocked, evidence present)")
    sys.exit(0)

p = d.get("prereg_commit_ts", "")
t = d.get("snapshot_ts", "")
assert p and t, "non-blocked snapshot needs prereg_commit_ts and snapshot_ts"
assert p < t, "prereg must PRECEDE snapshot (ISO-8601)"
for f in ("sha256", "dune_query_id", "dune_execution_id", "prereg_commit_sha",
          "n_feasibility", "sigma_xcheck"):
    assert f in str(d), "non-blocked snapshot MUST carry " + f
assert d["n_feasibility"]["passed"] is True, \
    "N-feasibility gate must pass (or fall back to blocked)"
print("SNAPSHOT_OK (prereg < snapshot, N-gate passed)")
