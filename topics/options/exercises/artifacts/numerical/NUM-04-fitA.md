# NUM-04 — Layer-A goodness-of-fit of the FIXED phi_bar*-implied phi(sigma)

**Status:** `fail`  &nbsp; **seed:** 0  
**series_sha256:** `41f583aad9a1860e6c389521d1f128fd567533009627c8a44e1f06b91a3aadad`  
**uv_lock_sha256:** `b4f8ac96c98801469246d1b376fd6a3e4df45baeea03786a7224a155e9a088c7`

## What Layer A measures

FIXED phi_bar*-implied phi(sigma) = constant-product divergence-loss rate 1 - 2*sqrt(k)/(1+k) of the realized one-step price move; parameter-free, sigma-driven, nothing to overfit (SYMB-01 closed form, G=0).

- OOS design: chronological 70/30 temporal hold-out on the liquid primary pool + the adverse pool as the >=1 cross-pool; headline numbers are OOS.
- sigma source: TRUE oracle value (archive eth_call getTimepoints, Plan 02-04); the sigma_X column on the frozen series, NOT a Dune column, NOT a naive return-variance proxy.
- This is a **FIXED-predictor goodness-of-fit** — nothing to overfit; `cond(Sw)` is a numerical-stability note only, NOT a free-parameter identifiability claim.

## Headline gate (liquid primary pool, OOS) vs the LITERAL NUM-03 thresholds

| Gate | Measured | Pre-registered | Verdict |
|------|----------|----------------|---------|
| bca_ci_upper(SI) | 3.67932 | <= 0.15 | FAIL |
| max_rel | 12.8357 | <= 0.1 | FAIL |
| residual_p | 0.122095 | >= 0.05 | PASS |
| beats constant-fee baseline (>= 20% rel) | model SI 2.152 vs const 0.2291 | MDE 20% | FAIL |
| beats trailing-mean baseline (>= 20% rel) | model SI 2.152 vs trail 0.2376 | MDE 20% | FAIL |

R^2 (secondary color only, NEVER the gate): -93.16

## MEV/JIT noise floor (NUM-03 sec.7)

- measured_floor = 0.41863  (lowest-sigma-tertile phi_obs dispersion / mean(phi_obs) (daily-series proxy; per-block sandwich/JIT flag not materialized))
- floor <= tau_A (0.1)? **False** — if the floor exceeds tau_A the result is INCONCLUSIVE/FAIL; **tau_A is NEVER raised** to swallow the floor.
- SI-below-floor overfit_flag: **False** (an SI below the floor is a finding, NOT a pass).

## cond(Sw) — numerical-stability note ONLY

- Sw = sum dW = 1.73016e+09; A_t=empty (Sw->0) flag: **False**.
- cond(Sw) is reported only as the Sw->0 (A_t=empty, DEP-02) numerical-stability degeneracy flag — the predictor is FIXED, there is NO free-parameter identifiability claim.

## Per-pool gate (an adverse-pool failure is NOT averaged away)

| Pool | Role | SI(OOS) | bca_upper | max_rel | resid_p | beats const | beats trail | status |
|------|------|---------|-----------|---------|---------|-------------|-------------|--------|
| adverse | adverse | 1.015 | 1.715 | 3.264 | 0.0001104 | False | False | fail |
| liquid | liquid | 2.152 | 3.679 | 12.84 | 0.1221 | False | False | fail |

## Verdict

Overall Layer-A status: **`fail`**. A documented FAIL is a valid scientific outcome (NUM-03 sec.4.3/7): the FIXED, parameter-free phi_bar*-implied per-step IL-financing rate does NOT track the realized on-chain fee within the pre-registered tolerance out-of-sample, and does not beat the constant / trailing-mean baselines. tau_A was NOT raised; no fail was laundered into a pass. The on-chain Algebra adaptive fee phi_obs is far smoother than the unsmoothed daily divergence-loss rate — the per-day on-chain MECHANICS are not the raw IL rate. This does not bear on Layer-B replication (Plan 02-06), which tests realized-fee revenue against Pi^target.

## Economic Meaning

Layer A asks whether a live Algebra dynamic-fee pool's charged fee `phi_obs` is the fee a volatility-indexed market-maker SHOULD charge to finance the LP's impermanent loss — i.e. whether the on-chain adaptive-fee plugin's phi(sigma) schedule coincides with the FIXED phi_bar*-implied divergence-loss rate. The fit measures the fee-vs-realized-volatility surface of the AMM. The recorded outcome is the falsifiable, pre-registered verdict on that coincidence on real QuickSwap-V3-Polygon data.

