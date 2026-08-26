# CAL-01 — Free-Tier Feasibility Probe (orchestrator-side)

**Phase:** 02.1.1 Apparatus Calibration · **Plan:** 01 · **Requirement:** CAL-01
**Status:** **HALT (inconclusive)** — daily-σ regressor fails SHOULDER_COVERAGE; pivoting to CAL-01b re-sample

# CORRECTIONS

- HALT triggered 2026-06-14: SHOULDER_COVERAGE fail on the primary (liquid) spec (top-σ-bin mean 0.811× global-max vs ≥0.90); daily-σ→φ_obs map non-monotone.
- This probe is FROZEN at the realized result. Do NOT cite as a GO; the daily-σ design does not identify `G(σ)`.
- Disposition memo: `diagnostics/CAL-01-shoulder-HALT-disposition.md`.
- User-enumerated pivot (2026-06-14): **re-sample** σ at swap frequency (archive-RPC `volatilityCumulative` differencing) — to be locked as a new pre-registration CAL-01b; the original daily-σ criteria below are preserved unedited.
- No post-hoc changes (σ-interpolation, SHOULDER_TOL relaxation, re-binning, outlier drop, proceed-with-caveat) were applied between lock and HALT.
**Venue:** QuickSwap-V3-Polygon (Algebra V1). Pools: liquid `0xae81fac689a1b4b1e06e7ef4a2ab4cd8ac0a087d` (decimals 18/6), adverse `0x5cd94ead61fea43886feec3c95b1e9d7284fdef3` (decimals 18/18).

> **Discipline (Iron Law):** every GO/NO-GO criterion below is pinned **before any count is read**. The counts (Task 2) are evaluated *mechanically* against these — no criterion is edited after a count appears. The raw per-swap φ_obs series is sealed into `calib/CAL-01-phi-obs-series.parquet` and never appears in this file.

---

## Prior `n_ffill_phi:0` reconciliation (BL-1, authoritative — not re-litigated)

The frozen 02-04 `snapshot/snapshot.session.json` records `n_ffill_phi: 0` for **both** pools. **That zero is an artifact of the sub-agent Dune-401 tooling block** — spawned sub-agents cannot reach the Dune MCP (`api.dune.com/mcp/v1` returns 401) or the archive RPC, so the 02-04 forward-fill ran on an empty/blocked stream. It is **NOT a real measurement and NOT a NO-GO verdict, and it is NOT a re-usable seam.** CAL-01 runs **orchestrator-side** precisely because that is the only context where Dune/RPC is reachable. CAL-01's fresh pull (Task 2) is the **first real measurement** of `algebrapool_evt_fee` density; the GO/NO-GO is decided **only** by that fresh pull, never by the stale zero.

---

## Casing (MJ-6 — INHERITED, not re-gated)

- `casing_verified: true`
- `casing_source: base/dune_column_sample.json (inherited from BASE-01)`

Decoded columns are camelCase (`bottomTick`, `topTick`, `liquidityAmount`); the `algebrapool_evt_fee` event carries the dynamic fee in its `fee` field. BASE-01 already pinned this from a live LIMIT-2 sample, and a fresh LIMIT-2 casing query already 401'd inside the 02-04 sub-agent. **CAL-01 inherits this casing — it does NOT run a fresh LIMIT-2 casing query and does NOT HALT the phase on casing.** (The orchestrator-side pull still happens, for the φ_obs density — but casing is read from disk, not re-measured.)

---

## Leg (a) — per-swap φ_obs density GO criterion (pre-stated, outcome-blind)

Reconstruct per-swap `φ_obs` by forward-filling the sparse `algebrapool_evt_fee` (dynamic-fee change) stream onto each `algebrapool_evt_swap` over the frozen snapshot window, then join the oracle `σ_X`. **GO on the LIQUID pool requires ALL of:**

- **`K_MIN = 4`** distinct `φ_obs` levels. *(A 3-parameter logistic `G(σ;α,β,γ)` needs points on both shoulders + the rising limb; < 4 distinct levels cannot identify all three.)*
- **`M_MIN = 3`** σ-bins spanned with non-degenerate `φ_obs` variation.
- **`VAR_MIN`**: per-pool `Var(φ_obs)` strictly above that pool's **decimals-quantization floor**, read from `base/noise_floor.py::_decimals_quant_component` for the pool's `(decimals0, decimals1)` — **not** recomputed by hand. *(Var below the quantization floor means φ_obs is effectively constant — G unidentifiable.)*
- **`SHOULDER_COVERAGE`** (BL-3, data-side complement of the Plan-04 saturation gate): the observed σ-support must reach into the **saturated shoulder** of the logistic so the ceiling `α` is empirically identified, not extrapolated. **Operationally:** the top σ-bin's mean `φ_obs` must be within **`SHOULDER_TOL = 0.10`** (i.e. ≤ 10% below) of the global-max `φ_obs` level observed. If the σ-support does **not** reach the shoulder, `α` is unidentified → the LIQUID leg is **`inconclusive` (NOT GO)**, mirroring the Plan-04 saturation-coverage gate.

**Adverse pool `0x5cd9…`** is pre-declared **`inconclusive`** if its distinct-`φ_obs`-level count `< K_MIN` **or** its σ-support fails `SHOULDER_COVERAGE` (mirrors BASE-01 B2 — the illiquid stressor is a corroborator, never the primary GO).

**Required measurement (MJ-2 — block-length input):** the probe **must** emit `median_inter_fee_swap_gap` per pool — the median number of swaps between two consecutive `Fee` events. This is the input the Plan-04 block-bootstrap length `ℓ = max(median_inter_fee_swap_gap, NUM-03 σ-block len)` consumes. (φ_obs is piecewise-constant between Fee events, so a block shorter than this gap would understate CIs.) **It will be measured in Task 2.**

**Verdict routing:** per-swap GO ⇒ Plans 02–05 proceed. Per-swap NO-GO / `inconclusive` (incl. no-shoulder) ⇒ honest **data-ceiling HALT**: write the anti-fishing disposition memo and STOP — **never** a degraded fit, **never** paid-tier without a new user decision.

---

## Leg (b) — per-tick `feeGrowthOutside` affordability GO criterion (pre-stated)

For the A2b / CAL-05 μ-shape stretch leg, estimate the archive-RPC cost:

- `call_count ≈ (#active ticks in A_t across snapshot blocks) × 2 endpoints × #snapshot-blocks`, with `#active ticks` bounded by the **crossed bands** in the frozen `L_K` profile (`base/BASE-series.json`).
- **GO** iff `call_count ≤` the live free archive-RPC budget (read the cap orchestrator-side at Task 2).
- **NO-GO** ⇒ CAL-05 / A2b stays **`blocked`** (NOT paid-tier). This does **not** block CAL-02/03/04 — leg (b) is independent of leg (a).

---

## Measured counts (Task 2 — live orchestrator-side pull, 2026-06-14)

Source: Dune MCP (`api.dune.com/mcp/v1`, free engine) over `quickswap_v3_polygon.algebrapool_evt_swap` / `algebrapool_evt_fee`. φ_obs = `fee/1e6` forward-filled (`LAST_VALUE … IGNORE NULLS`) onto each swap; σ_X joined from the 12 BASE-series σ-resolved anchor days per pool. **Summary counts only — no raw φ_obs values.**

### Whole-history Fee density (supersedes the `n_ffill_phi:0` stub — BL-1)

| pool | N_swap (all) | N_fee (all) | distinct φ_obs levels (all) |
|------|-------------:|------------:|---------------------------:|
| liquid `0xae81…` | 5,058,936 | 4,083,465 | **4,262** |
| adverse `0x5cd9…` | 3,163 | 3,317 | **828** |

The Fee stream is **dense**, not sparse — the `G==0` daily-aggregate problem was a sampling artifact. The stale `n_ffill_phi:0` is decisively refuted as a tooling-blocked stub.

### Per-swap φ_obs on the 12 σ-anchor days (the calibration scatter)

| pool | n_swap_obs | distinct φ_obs | std(φ_obs) | VAR_MIN floor (2.44e-5) | σ-bins | median inter-fee gap |
|------|-----------:|---------------:|-----------:|:-----------------------:|:------:|:--------------------:|
| liquid | 37,996 | 363 | 3.73e-4 | ✓ pass (≫) | 3 | 1 |
| adverse | 33 | 20 | 7.88e-4 | ✓ pass (≫) | 3 | 1 |

`K_MIN=4` ✓ (363 / 20), `M_MIN=3` ✓, `VAR_MIN` ✓, `median_inter_fee_swap_gap = 1` (MJ-2 block-length input: ℓ = max(1, NUM-03 σ-block len)).

### SHOULDER_COVERAGE (the binding criterion) — **FAIL on both pools**

Required: top σ-bin mean φ_obs ≥ (1−0.10)·(global-max φ_obs).

- **liquid:** top-σ-bin mean = 0.001148, global-max = 0.001416 → ratio **0.811** (18.9% below; needs ≥0.90) → **FAIL**.
- **adverse:** global-max φ_obs (0.002328) occurs at **mid** σ (47,890), not high σ; highest-σ day (253,670) has φ=0.00159 → shoulder **FAIL**; also n is thin (most σ-days have 1 swap).

**Root cause (decisive finding):** σ_X is the VolatilityOracle **1-day-window** average; φ_obs reacts on a **per-swap / per-block** timescale. The daily average has low-pass-filtered out the intra-day volatility that actually drives the fee, so the σ_X→φ_obs map is **non-monotone**: e.g. φ(σ=7,748)=13.6 bps **>** φ(σ=61,620)=4.4 bps. A logistic ceiling α is therefore **not empirically identified** on the daily-σ regressor. Compounding this, the Algebra V1 AdaptiveFee is a function of **two** state variables (short-window volatility AND volume-per-liquidity), so a 1-D `G(σ)` is structurally under-specified regardless of σ treatment.

### Verdicts (mechanical, against the unchanged Task-1 criteria)

- leg (a) liquid: `go_no_go: inconclusive` — SHOULDER_COVERAGE fail (0.811 < 0.90) + non-monotone daily-σ→φ map; α unidentified on the daily-σ regressor.
- leg (a) adverse: `go_no_go: inconclusive` — SHOULDER_COVERAGE fail (max-φ at mid-σ) + thin (n=33).
- leg (b) per-tick: `go_no_go: PENDING` (RPC affordability — relevant to the higher-frequency-σ pivot below).

> **Note (raw-series seal):** the per-swap (σ_X, φ_obs) series is materializable from execution `01KV3FETPENV816XFDRK07MRDF` / `01KV3G9ZVWW0ZPN2KGR93ZYWGH`. Sealing into `calib/CAL-01-phi-obs-series.parquet` is **deferred pending the checkpoint pivot decision** — if the phase pivots to a higher-frequency σ regressor (see below), the daily-σ-joined series is not the calibration series Plan 05 would consume.
