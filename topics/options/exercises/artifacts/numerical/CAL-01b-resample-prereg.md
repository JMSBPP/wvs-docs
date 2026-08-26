# CAL-01b — Re-sampled-σ 2-D Calibration Feasibility Pre-Registration (DRAFT v2 — UNLOCKED)

**Phase:** 02.1.1 Apparatus Calibration · supersedes the daily-σ CAL-01 design (HALT 2026-06-14, `diagnostics/CAL-01-shoulder-HALT-disposition.md`) · **Requirement:** CAL-01 (re-issued)
**Status:** DRAFT v2 — incorporates the two-step review (Reality Checker + Model QA Specialist, both NEEDS WORK). §1/§2 materially restructured ⇒ a confirmatory re-review pass is warranted before the sha256 lock. No estimator runs before lock.
**Pivot provenance:** user-enumerated "re-sample" (2026-06-14); design = **hybrid stratified core + opportunistic free-tier fill** (user, 2026-06-14). Maximization is over the DATA BUDGET only, never fit quality.

> Original daily-σ CAL-01 preserved unedited. NEW iteration, not an edit.

## Economic Meaning
`φ_pred = baseFee + G(σ_W, volPerLiq)` is the **Algebra dynamic-fee response surface** — the LP's adverse-selection-priced fee schedule: the volatility limb prices toxic-flow risk, the volume-per-liquidity limb prices congestion/inventory pressure. Calibrating `G` recovers the pool's on-chain fee-setting policy as a function of its two observable state drivers.

---

## 0. Why the pivot, and what is load-bearing (carried from the HALT + review MJ-1/m5)

Daily-σ probe: Fee DENSE (5.06M swaps / 4,262 distinct φ_obs liquid) but **`inconclusive`** — σ_X (1-day `getAverageVolatility`) → φ_obs **non-monotone**, SHOULDER_COVERAGE 0.811 < 0.90. Decomposed:
- **(M) missing regressor — LOAD-BEARING.** Algebra V1 AdaptiveFee = baseFee + sigmoid(volatility) + sigmoid(volPerLiq). A 1-D `G(σ)` is structurally under-specified. **This is the primary change; the experiment is the 2-D model.**
- **(F) frequency — SECONDARY/cosmetic.** Measured within-day φ dispersion is ~1% (max≈mean per day); the 3× swing is cross-day. Re-sampling σ finer can explain at most that ~1% intra-day part. **Stated up front so no post-hoc story can re-cast frequency as the cause.**
- **(W) window mismatch.** The oracle's `getAverageVolatility` window may exceed the window the fee consumes; `W` is read on-chain and gated sub-daily (§1.W).

Interpolation REJECTED (no information; spurious EIV). Fix = the 2-D regressor + genuine (not interpolated) higher-frequency σ at the fee's true window.

---

## 1. Pinned design — hybrid stratified core + opportunistic fill

### Regressors and timebase (review B3 / M1 — pre-swap, no look-ahead)
Algebra sets the fee from **pre-swap** state, so for swap at block `b`:
- `φ_obs(b)` = forward-filled `Fee.fee/1e6` (most-recent prior Fee event, `LAST_VALUE … IGNORE NULLS`), max-staleness bound **`STALE_MAX = ⌈W / block_time⌉` blocks** (one fee-window; `block_time` = Polygon ~2 s, pinned literal at lock). Rows whose nearest prior Fee event is staler than one fee-window are DROPPED, not extrapolated (a fee older than the window the contract reads is not the fee that swap faced).
- `σ_W(b)` = `getAverageVolatility` evaluated on the **pre-swap snapshot (block b−1)** via archive `eth_call` — **1 call per distinct (b−1) block** (the windowed average is returned directly; NOT a 2-read `volatilityCumulative` difference). Join key = block number; oracle timepoint alignment confirmed against the plugin's timepoint index. **Self-check (N3, one-time at smoke test, NOT per-row):** on a handful of blocks, reconcile the direct `getAverageVolatility` against a 2-read `volatilityCumulative`-difference over `W`; log agreement; this confirms the returned window equals `W`.
- `volPerLiq(b)` = (swap token0-volume, decimals-normalized) / (active `liquidity` at b−1), from Dune (no RPC).
- **Leakage / endogeneity (pinned, LOAD-BEARING — review M1):** identification rests on Algebra's **predetermined-fee property** (the fee at `b` is set from pre-`b` state, so it is exogenous to *that* swap's volume). A **mandatory** lag-robustness re-fit with `volPerLiq`,`σ_W` lagged one extra block (b−2) is part of the locked plan; if the limbs move materially, the predetermined-fee property fails at this granularity and the volume limb is declared not cleanly identified (`inconclusive: endogenous`). **A full IV leg is explicitly SCOPED OUT** of CAL-01b: the predetermined-fee structure is the identification strategy, and the lag-robustness re-fit is its falsification test — an instrument is not introduced unless the lag-robustness test fails (which would itself be a HALT → new pivot).

### W — true fee window (review B2 — read + adequacy gate)
`W` read ONCE from the deployed Algebra plugin config (pinned address + function/slot) at lock, hashed into `prereg_sha256` **in the same sealed step as the smoke test, before any (σ_W, φ_obs) pairing is materialized** (closes the MJ-2 seam). **W-adequacy gate:** require `W ≤ W_MAX = 3600 s` (must be sub-daily to add information the daily average discarded). If `W > W_MAX` ⇒ do NOT silently proceed: σ_W ≈ the falsified daily regressor ⇒ `inconclusive` + disposition memo (the 2-D model would then rest entirely on the volume limb — a different model). Units: `W` in seconds; `b−W` computed in timestamp/timepoint space, not block space.

### Sampling — stratified core (guaranteed ID) + opportunistic fill
Pre-stated **3×3 grid** = σ_W terciles × volPerLiq terciles (tercile cuts fixed from the tuning split, outcome-blind):
- **Core (identification, mandatory):** sample distinct swap-blocks until **every one of the 9 cells — including the 4 off-diagonal corners (high-σ∩low-vol, low-σ∩high-vol, etc.) — holds ≥ `N_REGIME_MIN = 40` rows.** Off-diagonal coverage is what separates the two limbs (review B1). If the realized data cannot fill an off-diagonal corner after exhausting the frame ⇒ `inconclusive` HALT (the limbs are not separately identified).
- **Collinearity gate (review B1):** empirical Spearman `|ρ(σ_W, volPerLiq)| ≤ RHO_MAX = 0.7` on the core. Above ⇒ design column space too diagonal ⇒ `inconclusive`.
- **Opportunistic fill:** after the core is secured, spend leftover free-tier budget extending N on a **pinned deterministic rule** — chronological order over remaining distinct swap-blocks, cell-balanced (fill the currently-smallest cell next), until the budget cap. The fill rule is mechanical (no peeking at φ); it only widens N, never changes cell definitions or tolerances.

### Budget (review BL-1 / m4 — measured, multi-constraint)
- **Calls/block = 1** (`getAverageVolatility`, pinned). **Actual CU/call measured at lock** by the smoke `eth_call` (replaces the generic 26-CU estimate); the pinned `B_MAX` is then in measured CU.
- `B_MAX = 250,000,000 CU/month` (Alchemy Polygon free ≈ 300M; 50M reserve). Core is small (~9 cells × tens–hundreds of rows ≈ ≤ low-10⁴ calls); fill consumes the remainder.
- **Throughput bound (pinned):** projected wall-clock = calls / (measured achievable calls·s⁻¹ under free-tier CU/s throttle); batched + checkpointed + resumable; behavior across calendar-month CU resets recorded. A pull that cannot finish the **core** within one month's CU ⇒ shrink fill to 0 and re-confirm the core alone fits.
- **Dune credit (pinned):** the `volPerLiq`/φ_obs joins must fit the Dune free monthly credit; recorded as a separate ceiling from Alchemy CU. Measured per-query credits logged.

### Model — faithful 2-D (review m1/m2)
`φ_pred = baseFee + α₁·S(σ_W; β₁,γ₁) + α₂·S(volPerLiq; β₂,γ₂)`, `S`=logistic. `baseFee` = **read literal** from `globalState`/plugin config (NOT estimated — review m2). `A_Θ` = Algebra positivity/monotonicity bounds read from the **AdaptiveFee contract config** (NOT "SHREVE:838–859" — review MN-1 correction; no textbook twin). Regressors **standardized** (z-score, transform recorded) before NLS.

---

## 2. Feasibility GO/NO-GO (pinned BEFORE counts)

Leg (a') identifiability on the resampled 2-D frame — liquid, ALL required:
- `K_MIN = 8` distinct φ_obs (raised from 4 — a 6-parameter 2-D model needs > parameter-count distinct response levels; review m1).
- **2×2/3×3 corner coverage:** all 9 cells ≥ `N_REGIME_MIN=40`, the 4 off-diagonal corners included (review B1). Any empty off-diagonal ⇒ `inconclusive`.
- `|ρ(σ_W, volPerLiq)| ≤ RHO_MAX=0.7` (limb separability).
- `VAR_MIN`: Var(φ_obs) > decimals-quant floor (`base/noise_floor.py`).
- `SHOULDER_COVERAGE` (`SHOULDER_TOL=0.10`, unchanged): top-σ_W-tercile mean φ_obs within 10% of global-max, evaluated **within the fixed high-σ_W cells** at pinned tercile cuts (no post-hoc NTILE change — review MJ-4).
- **Saturation-aware conditional-monotonicity (review M4/MJ-3):** within each volPerLiq tercile, on the **unsaturated** σ_W sub-range, one-sided trend test on binned-mean φ across σ_W terciles must be non-decreasing with significant positive slope; flat-at-saturation accepted. Statistic + sub-range pinned. (Replaces the vacuous strict `ρ>0`.)

Leg (b') affordability: measured CU/call × projected calls ≤ `B_MAX`; Dune credit ≤ free quota; core completable within one month. Overflow ⇒ shrink fill (never the core/regimes), recorded honestly.

---

## 3. Estimator & OOS protocol (pinned — review M2/M3)

- **NLS:** ≥20 randomized multi-starts within `A_Θ` on standardized regressors; keep best SSR; convergence-agreement criterion (top-k starts agree within tol, else `inconclusive: ill-conditioned`). Report Jacobian condition number + parameter-correlation matrix; `|corr(α₁,α₂)|>0.95` (or β/γ analogues) = pre-stated red flag (numerical confirmation of collinearity).
- **OOS:** chronological **rolling-origin k-fold CV** (k pinned), each test fold required to contain all 4 corner cells; if a fold is single-regime, declared and excluded. Single 70/30 retained only as a secondary report.
- **Block bootstrap:** block length `ℓ` re-derived from the **measured ACF of the φ_obs residual series** (integrated autocorrelation time / first 1/e crossing), NOT the inter-fee gap=1 (review M3). **ACF reference series (review N1):** `ℓ` is estimated on a **chronologically-contiguous natural-time window** (the stratified core in original block order, OR a contiguous calendar slice), NEVER the cell-balanced fill-assembled series — the fill deliberately breaks chronological contiguity, so its residual autocorrelation is a sampling artifact, not the φ process. Which contiguous series defines `ℓ` is pinned before counts.
- **Variance attribution (honesty aid, not a gate — m5):** pre-stated partial-R² of each limb reported, so the frequency-vs-volume contribution cannot be retrofitted.
- **Design-weighting disclosure (review N2):** the estimation sample is **fill-weighted** (cell-balanced), so fitted limb coefficients and partial-R² are **design-weighted, NOT population-weighted**. CAL-01b's claim is *identification/feasibility* of `G` on the response surface — NOT a population statement about the pool's average fee behavior. No population-weighted claim is made or retrofitted; a population estimate would require re-weighting by the realized marginal density (out of scope here).

---

## 4. Anti-fishing invariants

- Outcome-blind seal: raw (σ_W, volPerLiq, φ_obs) → SEALED `calib/CAL-01b-series.parquet` only; Plan-02 estimator + Plan-03 gate coded against DATA-FREE synthetic fixtures; seal opened only Plan 05 after lock+review.
- Pinned at lock (sha256-recomputable): `W` (read literal), `W_MAX`, `STALE_MAX`, tercile cuts, `N_REGIME_MIN`, `RHO_MAX`, `K_MIN`, `SHOULDER_TOL`, `B_MAX`, `A_Θ`, `baseFee`, NLS multi-start count, CV k, ACF block-length rule, the deterministic fill rule. Chronological-first-70% tuning; held-out tail untouched until Plan 05.
- Any realized miss = HALT + disposition memo + NEW user-enumerated pivot. Analyst never enumerates pivots. **Distinct HALT sub-codes (review N4 — the memo must name which):** `inconclusive: empty-corner` (off-diagonal cell < N_REGIME_MIN — not identified), `inconclusive: collinear` (|ρ|>RHO_MAX), `inconclusive: window-inadequate` (W>W_MAX — resample moot), `inconclusive: endogenous` (lag-robustness re-fit moves the limbs), `inconclusive: ill-conditioned` (NLS multi-start disagreement), `inconclusive: insufficient` (N<N_MIN, incl. the expected adverse-pool sparsity), `fail: shoulder` / `fail: monotonicity`. No two are interchangeable.

---

## 5. Relationship to prior frames (review MN-2/m3)

- The 12 BASE-series σ-anchor days are **superseded** as the regressor frame (they were the daily-σ join); BASE-series remains the apparatus reserve/L_K source, not the calibration σ frame.
- **Adverse pool** (3.16k swaps; was n=33 on anchor days): on measured sparsity it will **likely** return `inconclusive` by construction (4 corners × 40 = 160 min, off-diagonal sparse). Pre-declared corroborating-only; an adverse `inconclusive` is the expected outcome, NOT a new signal. Liquid is the primary venue.

---

## 6. Confirmatory re-review disposition (both reviewers, 2026-06-14) — RESOLVED

Two-step delta re-review cleared all prior BLOCKERs/MAJORs; the hybrid-design follow-ups are now resolved in-document (no open structural questions remain — a prereg does not lock with open design decisions):
- **Literals committed:** `RHO_MAX=0.7`, `W_MAX=3600 s`, `K_MIN=8`, `N_REGIME_MIN=40`, `SHOULDER_TOL=0.10`, `STALE_MAX=⌈W/block_time⌉`, tercile cuts (frozen on tuning split). These are the pinned values; tightening would be a new iteration, not an edit.
- **Fill rule** is mechanical/peek-free (cell-balanced over remaining distinct blocks in chronological order; no φ access).
- **Endogeneity (M1):** closed by the predetermined-fee identification strategy + mandatory b−2 lag-robustness falsification test; IV explicitly scoped out (§1).
- **ACF (N1)** estimated on a contiguous natural-time reference; **design-weighting (N2)** disclosed; **HALT sub-codes (N4)** enumerated; **CU self-check (N3)** pinned at smoke test.

## 7. Lock-time critical-path (the only items deferred to the lock step)
1. **Read `W`** from the deployed liquid-pool Algebra plugin config (pinned address + selector), apply the `W≤W_MAX` adequacy gate, and hash the returned literal into `prereg_sha256` **before any (σ_W, φ_obs) pairing**.
2. **Measure CU/call** via one archive `getAverageVolatility` smoke `eth_call` (replaces the generic 26-CU estimate); re-confirm core projected calls × measured CU ≤ `B_MAX` and core completable within one month (closes BL-1).
3. **Run the N3 self-check** (direct vs 2-read reconciliation, handful of blocks).
4. Compute `prereg_sha256`, set `Status: LOCKED`, `CAL01B_PREREG_LOCKED_OK`.
