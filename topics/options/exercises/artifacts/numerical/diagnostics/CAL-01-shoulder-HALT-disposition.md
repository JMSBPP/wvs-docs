# Disposition Memo: CAL-01 feasibility probe HALT 2026-06-14

## Pre-registration locked
- spec: `CAL-01-feasibility-probe.md` Task-1 criteria block (committed `866671c`, "pin CAL-01 GO/NO-GO criteria outcome-blind")
- regressor: `σ_X` = Algebra VolatilityOracle **1-day-window** average (`(volCumulative[t]−volCumulative[t−86400])/86400`), joined from the 12 BASE-series σ-resolved anchor days per pool
- GO criteria (leg a, liquid, ALL required): `K_MIN=4` distinct φ_obs · `M_MIN=3` σ-bins · `VAR_MIN` (Var above decimals-quant floor) · `SHOULDER_COVERAGE` (top-σ-bin mean φ_obs within `SHOULDER_TOL=0.10` of global-max φ_obs)
- adverse pool: pre-declared `inconclusive` if distinct-levels `<K_MIN` or shoulder fails
- locked date: 2026-06-14 (criteria pinned before any count was read)

## Realized (live free-tier Dune pull, 2026-06-14; exec `01KV3FETP…`, `01KV3G9Z…`)
- Fee density (whole history): liquid 5,058,936 swaps / 4,083,465 fee-events / **4,262** distinct φ_obs; adverse 3,163 / 3,317 / **828**. Fee is **dense** — the `n_ffill_phi:0` stub is refuted (BL-1).
- Per-swap on the 12 σ-anchor days: liquid n=37,996, distinct φ_obs=363, std=3.73e-4, σ-bins=3, median inter-fee gap=1; adverse n=33, distinct=20, σ-bins=3, gap=1.
- `K_MIN` ✓ · `M_MIN` ✓ · `VAR_MIN` ✓ (std 3.73e-4 ≫ floor 2.44e-5) · median-gap measured (=1, MJ-2).
- **`SHOULDER_COVERAGE` FAIL (both pools):** liquid top-σ-bin mean 0.001148 / global-max 0.001416 = **0.811** (needs ≥0.90). adverse global-max φ_obs at **mid** σ (47,890), not high σ.
- gate: **HALT (inconclusive)** — leg (a) liquid `inconclusive`, leg (a) adverse `inconclusive`.

## Trigger fired
SHOULDER_COVERAGE below the locked tolerance on the primary (liquid) spec → α (logistic ceiling) not empirically identified on the daily-σ regressor. Root cause: the daily σ_X average has low-pass-filtered out the intra-day volatility that drives the per-swap fee, so the daily-σ→φ_obs map is **non-monotone** (e.g. φ(σ=7,748)=13.6 bps > φ(σ=61,620)=4.4 bps). Compounding: Algebra V1 AdaptiveFee is a 2-input function (short-window volatility AND volume-per-liquidity); a 1-D `G(σ)` is structurally under-specified.

## What was NOT done (post-hoc changes considered and rejected)
- **σ-interpolation/upsampling** of the daily series to a finer grid — REJECTED: deterministic interpolation injects no high-frequency information (the daily average already low-pass-filtered it away); regressing per-swap φ_obs on a manufactured-smooth σ is a spurious / errors-in-variables artifact.
- **Relaxing `SHOULDER_TOL`** (0.10 → larger) to admit the 0.811 ratio — REJECTED (relax-to-pass).
- **Re-binning σ** (changing NTILE / bin count) to move the top-bin mean — REJECTED (test-geometry change).
- **Dropping the low-φ high-σ day** (2023-01-18, σ=61,620, φ=4.4 bps) as an "outlier" to restore monotonicity — REJECTED (exclusion-to-pass; it is genuine data).
- **Proceeding to the estimator (Plan 02) with a caveat / exploratory label** — REJECTED (HALT is not proceed-with-caveats).
- No estimator was fitted; no daily-σ series was sealed as confirmatory.

## User-enumerated pivot (2026-06-14)
> **"re-sample"**

User-enumerated pivot: **re-sample σ at swap frequency** from the on-chain `volatilityCumulative` timepoints (compute σ over a short window aligned to each swap's block by differencing cumulatives via archive RPC) — genuine higher-frequency *sampling* of the signal still on-chain, NOT interpolation. To be locked as a new pre-registration (CAL-01b) with: archive-RPC affordability re-stated as the feasibility gate, the short-window length pinned, and the σ→φ shoulder/identification criteria re-stated against the resampled regressor. Model dimensionality (1-D `G(σ)` vs faithful 2-D `G(σ, volPerLiq)`) to be pinned at lock. The original CAL-01 daily-σ pre-registration is preserved unedited as historical record; this pivot cascades as a new iteration, never an edit.
