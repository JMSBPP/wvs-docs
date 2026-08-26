# Disposition Memo: BASE-01 E1 + A3 HALT 2026-06-14

## Pre-registration locked

- spec file: `cfmm-options/EXERCISES/artifacts/numerical/BASE-01-apparatus-verification-prereg.md`
- prereg sha256 (placeholder-restored anchor): `065a8ccc72b3e6589d9d47f7b8bf472f49794c32767aeb8a8e8e9a34b95fe269`
- two-step review: `cfmm-options/EXERCISES/artifacts/numerical/base/BASE-prereg-review.md` → `verdict: approved`
- locked thresholds (READ from `base/BASE-noise-floor.json`, NEVER re-derived):
  `τ_Υ = 1.726918197701557`, `τ_IL = 0.00010293145290735122`, `θ_G = 2.439024392014759e-05`
- primary E1 spec (LIQUID, §4.E): order-of-magnitude / `⟨L_K,μ⟩`-collapse detector —
  `|Υ_formula − Υ_referent| / |Υ_referent| ≤ τ_Υ` on each held-out interval, both sides on the
  token0 numéraire via the pinned `Δfg·L/2^128/10^d0` conversion (§4.numéraire) BEFORE the ratio.
- primary A3 spec (§4.A, A3-only μ gate): `⟨L_K,μ⟩ ≈ Swap.liquidity` over the crossed band, NOT
  collapsed to `1`; per-tick μ-shape UNTESTED/DEFERRED (A2b blocked).
- gate logic (LOCKED): `n_within == n_total` over the held-out intervals/swaps; `noise_floor > τ ⇒
  fail`, τ NEVER raised; any locked-criterion miss is a HALT.

## Realized (official, frozen `BASE-01.json`, single confirmatory run)

**E1-liquid = FAIL (3/4 intervals within τ_Υ):**

| endpoint block | formula fee (token0) | referent fee (token0) | rel | within τ_Υ |
|---|---|---|---|---|
| 77690811 | 2.8766e3 | 1.8392e3 | 0.564 | ✓ |
| 79418609 | 3.4579e2 | 2.9356e2 | 0.178 | ✓ |
| 85631713 | 3.9767e2 | 7.4729e1 | **4.3215** | ✗ |
| 87884141 | 2.0848e2 | 1.6954e2 | 0.230 | ✓ |

worst_rel = **4.3215 > τ_Υ = 1.727** on interval ending 85631713 → gate (`4/4 within`) MISSED.

**A3 = FAIL (7/8 held-out swaps within order-of-magnitude of reported `Swap.liquidity`):**

| block | pairing ⟨L_K,μ⟩ | reported liquidity | ratio | within OOM |
|---|---|---|---|---|
| 65309661 | 1.333e21 | 1.412e21 | 0.944 | ✓ |
| 78542132 | 1.333e21 | 1.334e21 | 1.000 | ✓ |
| 79340046 | 8.583e23 | 1.334e21 | **643.6** | ✗ |
| 79368492 | 8.649e23 | 8.649e23 | 1.000 | ✓ |
| 79368707 | 8.649e23 | 8.649e23 | 1.000 | ✓ |
| 79369634 | 8.649e23 | 8.649e23 | 1.000 | ✓ |
| 79373468 | 8.649e23 | 8.649e23 | 1.000 | ✓ |
| 82205689 | 1.334e21 | 1.334e21 | 1.000 | ✓ |

gate (`8/8 within`) MISSED on block 79340046.

## Trigger fired

**primary-spec metric above the locked bound** — E1 worst_rel `4.32 ≫ τ_Υ=1.727` on 1 of 4
liquid intervals; A3 ratio `643×` on 1 of 8 held-out swaps. The locked `n_within == n_total` gate
is not met for either object.

## Honest interpretation (NON-BINDING, does NOT alter the gate)

These misses are **single-interval / single-swap measurement-and-timing artifacts**, not the
`⟨L_K,μ⟩ → 1` catastrophic defect E1/A3 were registered to catch. The evidence:

1. **A3 block 79340046 is a liquidity-CHURN boundary.** The reported `Swap.liquidity` at that swap
   is the PRE-mint in-range liquidity `1.334e21`; the very next swaps (79368492…79373468) report
   `8.649e23` — a ~650× mint landed in the interval. The frozen `L_K` profile used for the μ-weight
   is the POST-mint band, so the pairing reflects the post-mint depth `8.583e23` against a pre-mint
   reported liquidity. The 643× ratio is the mint magnitude, a snapshot-vs-swap timing mismatch at a
   churn boundary — NOT a pairing collapse. The other 7/8 swaps match `Swap.liquidity` to
   **ratio ≈ 1.000** (essentially exact), which is positive evidence that ⟨L_K,μ⟩ tracks the AMM's
   own in-range liquidity and is emphatically NOT collapsed to `1` (`1` vs `~1e21` would be ratio
   `~1e-21`; all 8 pairings are `≥ 1e21`, `pairing_not_collapsed_to_1 = true`).

2. **E1 block 85631713 is the smallest-fee interval** (referent `74.7` token0, the lowest of the
   four) at the lowest in-range liquidity (`3.27e17` reported). The formula tracks the referent to
   the SAME ORDER OF MAGNITUDE (397 vs 75) — a collapse to `⟨L_K,μ⟩=1` would instead drive the
   formula fee to `~0` (off by `~L_reported ≈ 1e18`), giving rel `≈ 1.0` on ALL intervals. Here 3/4
   are within τ_Υ and the failing one OVER-states by ~4× (the daily-aggregate swap-stream Δ_X
   over-counts fee-relevant volume at a low-liquidity tail), exactly the "daily volume proxy vs exact
   accrual" definitional disagreement the τ_Υ=1.727 floor was derived from — landing slightly above
   the conservative floor on the thinnest interval.

The honest bound this run DOES support (both reviewers' agreed claim): **the apparatus base is
INSTANTIABLE and NOT catastrophically broken** — ⟨L_K,μ⟩ is not collapsed to `1`, the pairing
matches the AMM in-range liquidity on 7/8 swaps (ratio≈1.000), the identities are code-correct
(I1/I2/DEP-01/A2-norm ≤1e-9), and C3 (L_K cumsum == pool.liquidity 24/24) is exact.

## What was NOT done (named-and-withheld per the HALT procedure)

Each of the following would convert the literal gate miss to a pass; NONE was applied to the
official `BASE-01.json` gate. They are recorded so they cannot be quietly re-spec'd:

1. **Excluding the churn-boundary swap 79340046 from A3** (a "mint-boundary mask"). NOT applied.
   The literal A3 gate counts all 8 held-out swaps; masking one to reach 8/8 would launder a fail.
2. **Re-snapshotting L_K at the pre-mint sub-block for 79340046** (block-aligning the μ-weight to
   each swap's reported liquidity). NOT applied — it requires a per-swap L_K re-extraction the frozen
   snapshot does not carry, and is a post-lock data change.
3. **Excluding the thin-liquidity interval 85631713 from E1**, or down-weighting low-fee intervals.
   NOT applied. The literal E1 gate is `4/4 within τ_Υ`.
4. **Relaxing τ_Υ to cover 4.32** (e.g. a per-interval liquidity-scaled τ). NOT applied. τ_Υ was
   NEVER raised; `noise_floor > τ ⇒ fail` stands.
5. No change to τ_IL, θ_G, the held-out split, the tuning split, the numéraire conversion, or the
   `n_within == n_total` gate logic was made. The official `BASE-01.json` verdict is `status: fail`,
   `halt: true`, `halt_gates: [A3, E1]`.

These are NOT a pivot menu. Pivot selection remains the user's; any locked pivot must be sha256-pinned
and run ONCE so no combination can be tuned to pass.

## Awaiting user-enumerated pivot

The BASE-01 E-tier + A3 μ gate are HALT'd at `fail`. The claim's `verification.apparatus` block
records the per-object map verbatim (E1 fail / A3 fail / A2b blocked / A1 inconclusive / E2 pass /
C-tier pass / I-tier pass). Claim-level `status` stays `stub`. BASE-01/02/03 are marked ONLY to the
extent the scoped gates passed (instantiability + non-collapse + code-correctness + C3 24/24); they
are NOT marked "μ verified" / "Υ faithful". The graded faithfulness verdict awaits a user-enumerated
pivot (per the anti-fishing-replication discipline), exactly as the NUM-04 Layer-B HALT awaits one.
