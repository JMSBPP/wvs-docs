# BASE-01 — Apparatus Base Empirical Verification (single confirmatory run)

> **Status: HALT (E1 + A3 missed the locked gate on the held-out tail).** Run ONCE on the
> UNTOUCHED held-out split, thresholds READ from the LOCKED `base/BASE-noise-floor.json`
> (`τ_Υ=1.726918197701557`, `τ_IL=1.03e-4`, `θ_G=2.44e-5`), prereg sha256
> `065a8ccc72b3e6589d9d47f7b8bf472f49794c32767aeb8a8e8e9a34b95fe269`. No τ relaxed, no re-run.
> Disposition: `diagnostics/BASE-01-E1-A3-HALT-disposition.md`. Machine record: `BASE-01.json`.

## Per-object verification map (verbatim from `BASE-01.json`)

| Tier | Object | Verdict | Metric (literal) |
|------|--------|---------|------------------|
| C2 | `Δ_X(τ)` per-tick trade-flow | **pass** | `|amount0|` finite/derivable on 100% of held-out swaps |
| C3 | `L_K(i_X)` cumsum == `pool.liquidity()` | **pass** | 24/24 EXACT (already-passed, frozen Plan-02 snapshot) |
| C4 | `A_t ≠ ∅` when price moved | **pass** | crossed band non-empty on every ≥1-grid-tick move (DEP-02 zero-locus is `Sw=0`) |
| A1 | `G(σ;α,β,γ)` logistic gate | **inconclusive** | snapshot carries NO per-block `φ_obs` to size the beats-constant-G OOS bar; `θ_G` is a sanity floor only (M2). Machinery (`g_calib`) instantiated; no `φ̄`-response data. |
| A2b | `μ_τ^φ` per-tick shares | **blocked** | no per-tick / `outerFeeGrowth` in the free-tier snapshot (M1); per-tick μ-shape DEFERRED |
| A3 | `⟨L_K,μ_τ^φ⟩ ≈ Swap.liquidity` (μ gate, A3-only) | **fail (HALT)** | 7/8 held-out swaps match reported `Swap.liquidity` to **ratio ≈ 1.000**; 1/8 (block 79340046) off 643× at a liquidity-CHURN boundary (snapshot-vs-swap timing). `pairing_not_collapsed_to_1 = true` (all 8 pairings ≥ 1e21, NEVER 1). |
| E1 | `Υ_t` collapse-detector (LIQUID) | **fail (HALT)** | 3/4 held-out intervals within `τ_Υ=1.727`; worst `rel=4.32` on block 85631713 (thinnest interval); formula TRACKS referent to order-of-magnitude (NOT collapsed to 0) |
| E1 | `Υ_t` (ADVERSE) | **inconclusive** | pre-declared `insufficient held-out referent` (only 1/4 held-out blocks positive, B2) |
| E2 | `IL(T)` vs reserve referent | **pass** | IL sign/directional agreement (non-positive vs hold); top-σ adverse block 82205689 scoped sign-only (Plan-05 minor 3) |
| I1 | affine collapse `CF_T=φ̄·Sw+Gw−IL` | **pass** | residual `1.78e-15 ≤ 1e-9` (code-correctness) |
| I2 | `φ̄*` FOC (algebra-only, FREE `Π^target`) | **pass** | `dC/dφ̄|_{φ̄*} = 0 ≤ 1e-9`; re-drives SYMB-01 `{(−Gw+IL+PItar)/Sw}` |
| DEP-01 | leg-coincidence | **pass** | residual `1.78e-15 ≤ 1e-9` (re-drive of `DEP-01.raw`) |
| A2-norm | `Σ_{A_t} μ = 1` | **pass** | residual `0 ≤ 1e-9` (code-correctness, NOT the μ faithfulness test) |

**THE DATA GATE IS THE E-TIER + C-TIER. I-tier identities survive the `⟨L_K,μ⟩→1` defect and are
code-correctness only** (BLOCKER-1). E1 + A3 are the load-bearing data gates; both MISSED on the
held-out tail → HALT.

## G calibration (A1)

The logistic `G(σ;α,β,γ) = α/(1+exp(−β(σ−γ)))` machinery is instantiated in `apparatus.g_calib`
(deterministic seeded grid least-squares, params constrained to the theory-derived `A_Θ`
positivity + monotone-in-σ polytope). It is NOT exercised as a graded fit this iteration: the frozen
free-tier snapshot carries only per-block `σ_X` (the oracle volatility) and NO per-block `φ_obs`, so
no `G_obs = φ_obs − φ̄` referent exists to drive the load-bearing **beats-constant-G OOS** gate. A1 is
therefore recorded **inconclusive** (honest), not a pass and not a fail. `θ_G=2.44e-5` is the
measurement-sanity floor (a fit worse than it would be a broken pipeline, not a model verdict).

## Honest bound (what this run certifies / does NOT certify)

**Certifies:** the apparatus base is **INSTANTIABLE and NOT catastrophically broken** — `⟨L_K,μ⟩` is
the genuine liquidity-mass-weighted pairing, NOT collapsed to the constant `1` (the exact NUM-04
defect); on 7/8 held-out swaps the pairing matches the AMM's own in-range `Swap.liquidity` to
ratio ≈ 1.000; the internal identities (I1/I2/DEP-01/A2-norm) are code-correct ≤1e-9; and C3
(`L_K` cumsum == `pool.liquidity()`) is 24/24 exact.

**Does NOT certify:** graded `Υ`-faithfulness (E1 is a collapse-detector at `τ_Υ=1.727`, and it
MISSED on 1/4 held-out intervals → HALT), per-tick `μ`-shape (A2b blocked), adverse-`Υ`
(inconclusive), the lookback (deferred / NUM-04 HALT'd), or the `G(σ)` response fit (A1 inconclusive,
no `φ_obs`). The graded faithfulness verdict awaits a user-enumerated pivot.

## Economic Meaning

The objects this run instantiated against real QuickSwap-V3 (Algebra V1) Polygon data, named as
concrete CFMM constructs (CLAUDE.md discipline):

- **`L_K(i_X)` = the pool's active-liquidity depth curve** — the tick-level `liquidityNet` cumsum, how
  much liquidity is in-range at each price tick (`0xae81…` WMATIC/USDC liquid; `0x5cd9…` adverse).
- **`⟨L_K, μ_τ^φ⟩` = the effective in-range liquidity a swap trades against** over the crossed tick
  band — the liquidity-mass-weighted average depth. This is the `Swap.liquidity` the AMM itself
  reports; NUM-04 collapsed it to `1`, erasing the pool's depth. A3 confirms (7/8 swaps, ratio≈1.000)
  that the reconstructed pairing recovers exactly that on-chain quantity — the central NUM-04 defect
  is not present.
- **`Υ_t` = LP fee revenue** — the fees the pool's liquidity providers actually earn, accrued over
  EVERY swap by full event-replay (M4: the summation grid is the swap stream, not daily endpoints).
  E1 compares this formula revenue against the pool's OWN realized fee growth
  (`Δ(totalFeeGrowth)·L/2^128`); it tracks to order-of-magnitude on 3/4 held-out intervals and
  over-states ~4× on the thinnest-liquidity interval — the honest daily-aggregate free-tier floor,
  HALT'd rather than relaxed.
- **`IL(T)` = impermanent loss** — the LP's reserve-drift loss vs buy-and-hold; E2 confirms the sign
  (non-positive vs hold) against `balanceOf` reserves disjointly.

The HALT is the discipline working as designed: a partial miss on the held-out tail of free-tier
daily data is recorded plainly, the thresholds are not bent to swallow it, and the apparatus's
instantiability (the thing NUM-04 silently broke) is what is certified — nothing more.

## Implementation pointer

The apparatus modules live under `cfmm-options/EXERCISES/artifacts/numerical/base/`
(`apparatus.py`, `base_verify.py`, `referents.py` disjoint, `reconstruct_LK.py`). A Solidity twin of
the active-liquidity profile + fee accrual (`clamm-automaton/src/`) is a later CAT-02 concern, NOT
BASE-01 work. No Plank twin is warranted at this stage.
