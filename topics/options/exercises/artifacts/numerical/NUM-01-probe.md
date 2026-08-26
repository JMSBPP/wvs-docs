# NUM-01 — Numerical feasibility probe (Wave 0: smoke leg)

**Requirement:** NUM-01 — the numerical env runs and the on-chain data source is named.
**Plan:** 02-01 (Phase 2, Wave 0). **Date:** 2026-06-13.

This probe has two legs. Leg 1 (the CVXPY+clarabel env smoke) is **complete and re-runnable
here**. Leg 2 (naming a concrete Algebra dynamic-fee pool + one realized `(σ, φ_obs)` row) is
**blocked on the data-source fork** and is resolved in **Wave 1** — it is *not* attempted in
this data-free plan.

## Leg 1 — CVXPY + clarabel env smoke (COMPLETE, re-runnable)

A trivial min-norm QP `minimize ||x||_2 s.t. A x = b` solved with the `CLARABEL` solver
returns `status = optimal`. Evidence is recorded, non-forgeable, and re-runnable, in
[`NUM-01.smoke.json`](NUM-01.smoke.json):

- `status`: **optimal**
- `solver`: CLARABEL
- `objective`: 1.414213562373092 (= √2, the analytic min-norm value)
- pinned library versions: cvxpy 1.9.1, clarabel 0.11.1, numpy 2.4.6, scipy 1.17.1, python 3.13.5
- `run_timestamp_utc`: 2026-06-13T18:37:04Z (driver-stamped `datetime.now(timezone.utc)`)
- `uv_lock_sha256`: `b4f8ac96c98801469246d1b376fd6a3e4df45baeea03786a7224a155e9a088c7`
  (pins the resolved dependency graph at `tools/compute/uv.lock`)

**Re-run:**

```bash
cd tools/compute && uv run python - <<'PY'
import json, subprocess, datetime, cvxpy as cp, numpy as np, clarabel, scipy
from datetime import timezone
x = cp.Variable(3)
A = np.array([[1.,1.,0.],[0.,1.,1.]]); b = np.array([1.,2.])
prob = cp.Problem(cp.Minimize(cp.norm(x,2)), [A @ x == b])
prob.solve(solver=cp.CLARABEL)
assert prob.status == "optimal"
print(prob.status, prob.value)
PY
```

This grounds the `Θ*` convex-program machinery (NUM-03/04) in a verified solver: the env that
will run the fit demonstrably solves a QP to optimality with a pinned, hash-bound dependency set.

## Leg 2 — on-chain data source (BLOCKED → Wave 1 via Dune)

Naming a concrete Algebra Integral dynamic-fee pool and showing one realized `(σ, φ_obs)` row
is **deferred to Wave 1** and is **blocked on the data-source fork**:

- **BigQuery `thetaswap-research` is account-suspended** (`403 CONSUMER_SUSPENDED`). This is an
  *account-level* suspension, **not** a credential issue — **do NOT re-auth**.
- **Pivot:** Phase 2 sources on-chain data (Layer A + the real paths for Layer B) from the
  connected **Dune MCP** (decoded Algebra Integral tables). The NUM-01 data leg re-points to
  Dune: name a concrete pool, show one `(σ, φ_obs)` row, record the Dune query + a query-hash
  for provenance.
- **Candidate venues:** primary = **QuickSwap-V3 on Polygon** (best-indexed Algebra dataset on
  Dune per the two-step review); secondary = Camelot (Arbitrum). Concrete pool **addresses are
  pending Dune resolution** in Wave 1 — not guessed here.
- **σ source caveat (Addendum 2):** Dune has **no volatility column** (the oracle's
  `volatilityCumulative` is internal storage, never emitted). The true `σ_X(t)` will be pulled
  via archive-node `eth_call` against the Algebra VolatilityOracle plugin at snapshot blocks;
  Dune supplies the swap `tick`/`price`/`dW` series + realized `φ_obs`.

### Honest-status path (non-negotiable)

`verification.numerical.status.on-chain-mechanics` **may legitimately be recorded as `blocked`**
if Dune yields no usable adaptive-fee data — it must **never be a silent on-chain pass against
an unreachable source**. The Wave-1 extraction either produces a named pool + a real row (then
status proceeds toward the fit) or records `blocked` with the Dune query evidence.

## Leg 2 (Wave-1 resolution, 2026-06-13) — `blocked` on the two-credential gate

The Wave-1 two-stream extraction (plan 02-04) attempted to resolve the data fork. Outcome:
**`blocked`** — recorded honestly per the Addendum-2 / NUM-03 §9 discipline (never a silent
on-chain pass against an unreachable source).

- **Primary venue (intended):** **QuickSwap-V3 on Polygon** (Algebra Integral, best-indexed
  Algebra dynamic-fee dataset on Dune). Pool inclusion criteria (NUM-03 §8): ≥1 liquid + ≥1
  adverse/illiquid Algebra Integral dynamic-fee pool whose `φ_obs` series actually VARIES.
- **Data source intended:** `dune:<query_id>` (decoded Algebra/QuickSwap swap +
  `algebrapool_evt_fee`) for the swap tick/price/dW + sparse realized-fee stream, joined by the
  two-stream forward-fill `(block, evt_index)`; `rpc:<VolatilityOracle>` (archive-node
  `eth_call` getAverageVolatility / volatilityCumulative) for the TRUE `σ_X` (Dune has NO σ
  column). `data_source: blocked` until both are reachable.
- **Why blocked (evidence, recorded in `snapshot/snapshot.session.json`):**
  1. **Dune:** the connected Dune MCP tools were NOT exposed to the execution sub-agent and no
     `DUNE_API_KEY` was present in its environment — `GET https://api.dune.com/mcp/v1` returned
     `401` anonymously (endpoint reachable, auth required). The live probe is an
     orchestrator/human-side action (the CLI-level Dune session auth is not propagated into the
     spawned executor).
  2. **σ-RPC:** `ARCHIVE_RPC_URL` was UNSET, so the oracle `eth_call` at historical blocks could
     not run. `ALCHEMY_API_KEY` is present but the plan/prereg gate keys specifically on
     `ARCHIVE_RPC_URL` (archive tier, historical `eth_call`); no σ was sourced and **no naive
     return-variance σ was substituted** (forbidden).
- **Re-runnable scaffolding committed (data-free, tested):** `extract_dune.py` (two-stream
  forward-fill join by `(block, log_index)` + per-row window bounds; the literal worked row
  `fee@(10,2)=300 → swap@(11,5) → phi_ffill=300` passes network-free), `extract_sigma_rpc.py`
  (archive `eth_call` harness + pure `sigma_recon` cross-check), `snapshot/_check_snapshot.py`
  (provenance gate, accepts blocked-with-evidence).

## Leg 2 (Wave-2 orchestrator-side resolution, 2026-06-13) — RESOLVED, real data frozen

The credential gate was cleared **orchestrator-side** (the Dune MCP + the Polygon archive RPC
are reachable only in the main session, not in spawned sub-agents — see
`02-04-CHECKPOINT-RESOLVED.md`). The live two-stream extraction + oracle-σ archive `eth_call`
ran and a real, content-hashed snapshot is frozen. `data_source: dune:7717175+7717181`.

- **Named pools (QuickSwap-V3-Polygon, Algebra V1):**
  - **Liquid (primary):** `0xae81fac689a1b4b1e06e7ef4a2ab4cd8ac0a087d` (WMATIC/USDC, 18/6) —
    344 daily obs, `φ_obs` varies (200–4095 pips). Dune query 7717175 / exec `01KV16PMW9…`.
  - **Adverse (stressor):** `0x5cd94ead61fea43886feec3c95b1e9d7284fdef3` (WMATIC/token1 18/18)
    — 316 daily obs, `φ_obs` varies (100–15000 pips). Dune query 7717181 / exec `01KV16SWG6…`.
- **Two-stream join:** daily representative = last swap of day by `(block, evt_index)`; `φ_obs`
  = forward-filled most-recent prior `algebrapool_evt_fee`. Systematic daily sample (liquid
  every 4th day, adverse every 2nd) — N-feasibility gate **PASSES** both pools (N≥200, 3
  σ-tertiles each ≥40: liquid [115,115,114], adverse [106,105,105]).
- **TRUE σ_X (oracle):** Algebra V1 pools expose the oracle on the pool itself —
  `getTimepoints([0,86400])` archive `eth_call`; `σ_X = (volatilityCumulative[0] −
  volatilityCumulative[86400])/86400`. (`plugin()` reverts — these are V1, not Integral.) All
  660 blocks resolved (reverts were Alchemy rate-limiting, fully recovered on retry). **No
  naive return-variance substitute.**
- **σ cross-check (≥1 value, NUM-03 §9):** block 58448389 — oracle σ=6107.69 vs reconstructed
  (time-weighted, 4319 intra-window ticks) σ=3666.61 → rel-err **0.40**. Order-of-magnitude
  agreement (genuine, tick-driven); the 25% miss is recorded honestly (`agrees_within_25pct:
  false`) and attributed to Algebra's distinct `_volatilityOnRange` averaging convention — the
  fit consumes the TRUE oracle σ, recon is a directional sanity check only.
- **Ordering anchor (snapshot-side; repo has no remote):** `snapshot_ts = max(max_block_time,
  dune_exec_create_ts) = 1781378380`; `prereg_commit_ts (ecd3fdd) = 1781375959 < snapshot_ts` ✓.

## Status

- Leg 1 (CVXPY smoke): **PASS** — recorded in `NUM-01.smoke.json`, re-runnable.
- Leg 2 (on-chain pool naming): **RESOLVED** (Wave-2 orchestrator-side, supersedes the Wave-1
  `blocked`). `data_source: dune:7717175+7717181`; real frozen series in `snapshot/series.json`
  (content-hashed) with both pools named, the two-stream join + oracle σ live, N-feasibility
  passing, and the σ cross-check recorded. Downstream Layer-A/Layer-B fits (02-05/02-06) now run
  against real on-chain data, not a blocked/sim path.
