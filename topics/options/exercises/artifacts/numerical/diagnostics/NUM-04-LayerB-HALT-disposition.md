# Disposition Memo: NUM-04 Layer-B HALT 2026-06-13

## Pre-registration locked
- spec file: `cfmm-options/EXERCISES/artifacts/numerical/NUM-03-prereg.md`
- spec sha256: `a38dec233d71e6db0cde90903051467295b9d8234c588d36f7b49a01dc608148`
- lock commit: `ecd3fdd` (immutable anchor `596aede`), locked 2026-06-13T14:39:19-04:00
- primary spec (Layer B): held-out real-path replication residual reduces to the risk-free term:
  `residual_over_target = |Υ_T − Π^target − r_f·P_LBC(0)| / |Π^target| ≤ τ_B`
- locked thresholds: `τ_B = 0.25`, `r_f = 0.04`; `Υ_T = Σ φ_obs·dW` (realized on-chain fee, NOT φ̄*);
  evaluated on held-out segments disjoint from the chronological 70% tuning split
- sign / direction expectation: the realized fee revenue replicates the lookback liability up to a
  pure positive risk-free residual (residual_over_target small, ≤ τ_B)
- N: per-pool held-out obs (liquid 344, adverse 316); 3 held-out segments per pool

## Realized (official, frozen `NUM-04-fitB.json`)
- worst-segment `residual_over_target` = **108164.09** (liquid seg0); liquid {108164, 85305, 29330},
  adverse {0.96, 0.93, 1.16}
- gate: **FAIL** (worst 108164.09 ≫ τ_B = 0.25)
- official dual status written: `{on-chain-mechanics: fail, sim-replication: fail}`, claim held `stub`

## Trigger fired
**p>threshold analogue — primary-spec metric above the locked bound** (residual_over_target ≫ τ_B on
the primary Layer-B spec).

## What was NOT done
A root-cause diagnostic (committed NON-BINDING: `diagnostics/layerB_numeraire_diagnostic.{py,json,md}`,
`layerB_w0_reserves.json`) established that the official residual is dominated by a unit/normalization
defect (`residual ≈ Υ_T/|Π^target| ∝ Sw`). The diagnostic IDENTIFIED, but did **NOT** apply to the
official gate, the following post-lock specification changes — each is recorded here so it cannot be
quietly re-spec'd:

1. **Numéraire re-normalization** — expressing `Υ_T = Σφ_obs·dW` as a yield on a token0 reserve base
   `W_0` (so it is commensurable with the per-unit `Π^target`). NOT applied to the gate. (Disclosure:
   the non-binding diagnostic previewed that the `W_0`-only correction yields a worst residual ≈ **0.96**
   — still **> τ_B**, still a FAIL.)
2. **`P_LBC(0)` redefinition** — using the lookback **option premium** rather than the spot price in
   `lookback_target`. NOT applied. NOT computed (outcome unknown).
3. **`ΔW` redefinition** — using replicating-portfolio **hedge rebalancing** rather than gross daily
   swap volume `Σ|amount0|`. NOT applied. NOT computed (outcome unknown).
4. No change to `τ_B`, `r_f`, the held-out/OOS design, the tuning split, or the realized-fee accrual
   was made. `τ_B` was never raised. The official `NUM-04-fitB.json`, the pre-registered gate, and the
   claim's `verification.numerical.status` are unchanged.

These are NOT a pivot menu. They are the changes considered-and-withheld, named in writing per the
HALT procedure. Item-1's previewed outcome is disclosed for transparency; it does not license selecting
any combination — pivot selection remains the user's, and the locked pivot must be sha256-pinned and
run once so no combination can be tuned to pass.

## Awaiting user-enumerated pivot

<!-- INTENTIONALLY EMPTY. The user enumerates the pivot. The analyst does NOT enumerate — not as
examples, not unranked, not "to pick from". Any locked pivot becomes a NEW pre-registration
(new sha256, new lock date); this original pre-registration is preserved unedited; the pivot
cascades as a new iteration, never as an edit. The new pre-registration must additionally pass the
two-step reviewer process (Reality Checker + one specialist, per CLAUDE.md) before execution. -->
