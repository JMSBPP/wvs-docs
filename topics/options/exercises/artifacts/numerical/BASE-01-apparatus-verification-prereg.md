# BASE-01 — Apparatus Base Empirical Verification (PRE-REGISTRATION, REVISED — LOCKED)

> **Status: LOCKED (Plan 04 re-lock, sha256-anchored).** The three faithfulness thresholds
> `τ_Υ = 1.726918197701557`, `τ_IL = 0.00010293145290735122`, `θ_G = 2.439024392014759e-05`
> are substituted in (§4) and their per-component derivation is written into
> `## Threshold derivation (locked)`; the `## Lock` block records the sha256, the snapshot
> timestamp, the verified Dune casing, and the ordering-anchor assertion. They were derived
> OUTCOME-BLIND from the measurement noise floor on the TUNING split only
> (`base/noise_floor.py::derive_thresholds`, whose signature is ALLOWLISTED to
> `{tuning_split, decimals0, decimals1}` — mechanically asserted by `tests/test_noise_floor.py`),
> NEVER from any faithfulness residual.
>
> **PLAN-04 RE-OPEN (this lock supersedes the Plan-03 lock).** The Plan-03 LOCK cleared neither
> two-step review; the SECOND review (Reality Checker + Model QA, `base/BASE-prereg-review.md`)
> returned **2 BLOCKERs + 4 MAJORs**, all resolved here OUTCOME-BLIND (the apparatus Υ is a
> `NotImplementedError` stub — no faithfulness result exists to tune toward, so re-deriving the
> thresholds now is anti-fishing-safe by construction):
> - **B1** — `τ_Υ` is re-derived as a genuine **WITHIN-DAY cross-referent DISAGREEMENT** (NOT a
>   "measurement floor"): two same-day measures — swap-side `φ_obs·dW` vs decimals-normalized
>   accounting-side `Δ(fg0)·L/2^128` — max over tuning days per pool, max across pools = `1.7269`
>   (the prior `0.806` was the cross-DAY fee *revenue* dispersion — a between-day economic statistic,
>   the wrong TYPE). **PROSE RELABEL (Plan-05 minor 1, both reviewers):** this disagreement is
>   DOMINATED by a **~2.3× definitional scale bias** — the swap-side `φ_obs·dW` is a daily-AGGREGATE
>   **volume PROXY**, NOT the exact fee-growth accrual the accounting side computes; the two measure
>   *different things*, so `1.7269` is a cross-referent definitional disagreement, **not** a
>   measurement floor. Dividing out the median ~2.3× scale bias leaves a **debiased residual ~0.38**.
>   `τ_Υ = 1.7269` is kept (conservative). It lands large: that is the honest reality of comparing a
>   daily volume proxy to exact accrual on free-tier data, so **E1 is down-scoped to an
>   order-of-magnitude / `⟨L_K,μ⟩`-collapse detector** and **A3 is named the PRIMARY μ-defect
>   discriminator** (§4.E / §4.A).
> - **B2** — the held-out split is re-cut on positive `Υ`-referent across σ-regimes: **liquid E1 is
>   runnable** (4 held-out blocks with `Δ(fg1)·L > 0`); **adverse E1 is pre-declared
>   `inconclusive: insufficient held-out referent`** (only 1 of 4 held-out blocks positive).
> - **M1** — **A2b is BLOCKED** (the snapshot has only GLOBAL day-delta fee-growth, no
>   per-tick/`outerFeeGrowth`); the μ gate is demoted to **A3-only**.
> - **M2** — `θ_G` is relabelled a **measurement-sanity floor**; the load-bearing A1 gate is
>   **"beats a constant-`G` OOS baseline"**.
> - **M3** — `τ_IL` carries a **price-snapshot-timing term** (±1-tick `sqrtPriceX96` slip ≈ `1e-4`,
>   dominant) + a decimals-asymmetry valuation term, so it no longer false-HALTs the instantaneous
>   E2 reserve revaluation.
> - **M4 / m1 / m4** — zero-fee-excluded `τ_Υ` sensitivity reported; the outcome-blind test uses an
>   ALLOWLIST; the `totalFeeGrowth (Q128) → absolute fee (×L / 2^128)` conversion is PINNED in §4.numéraire.
>
> This re-locked file must clear a fresh two-step review before the single confirmatory run on the
> HELD-OUT split (Plan 05).
>
> **HONEST ORDERING NOTE (do not overclaim).** The snapshot was already frozen in Plan 02
> (`snapshot_ts = 1781407000`), so this lock commit POST-DATES the data — there is NO clean
> data-after-lock ordering here. The anti-fishing guarantee therefore rests on exactly two
> structural facts, NOT on a before/after timestamp: **(a)** `derive_thresholds` is outcome-blind
> by construction (no residual/held-out/gap argument; signature + closure scanned by the test), and
> **(b)** the threshold derivation used ONLY the chronological-first-~70% TUNING split, and the
> HELD-OUT tail is UNTOUCHED until the Plan-05 confirmatory E-tier comparison. The git `%cI`
> commit timestamp is advisory only (spoofable); it is never the gate.

## 0. Why this exists

The φ̄* program is a chain of **discrete-space accounting identities**, not an option-pricing claim:

```
Υ_t = Σ_τ φ_X(τ)·Δ_X(τ)·⟨L_K, μ_τ^φ⟩        (fee revenue,  NOTATION:88 / SHREVE:330-341)
CF_t = Σ_τ [(Υ_τ−Υ_{τ-1}) − (IL_τ−IL_{τ-1})]  (cash flow,    SHREVE:370-379)
φ_X = φ̄ + G(t)  ⇒  CF_T(φ̄) = φ̄·Sw + Gw − IL  (affine collapse, SHREVE:970-981)
φ̄* = (Π^target + IL − Gw)/Sw                    (FOC minimizer, SYMB-01 / SHREVE:1044)
   Sw := Σ Δ_X⟨L_K,μ⟩,   Gw := Σ G·Δ_X⟨L_K,μ⟩
```

NUM-04 (Layer A φ(σ) goodness-of-fit; Layer B lookback replication) tested **applications** on top
of this accounting layer **before the layer itself was verified**. The Layer-B units defect
(HALT'd, `diagnostics/NUM-04-LayerB-HALT-disposition.md`) is the footprint of that error: the driver
used `Sw = Σ dW` with `dW =` raw token0 volume, silently replacing the liquidity-measure pairing
`⟨L_K, μ_τ^φ⟩` with `1` and `Δ_X` with gross `|amount0|`. **The pairing was never instantiated.**

BASE-01 verifies the accounting base — primitive by primitive — against real on-chain data, so that
`Υ → IL → CF → affine collapse → φ̄*` is shown to faithfully describe CFMM dynamics BEFORE any payoff
application is attempted.

**The central lesson the §4 tier structure encodes (BLOCKER-1 + BLOCKER-2):** the internal
identities (affine collapse, FOC, `Σμ=1`) **survive the `⟨L_K,μ⟩→1` defect** — they pass identically
whether or not the pairing was instantiated, because they are algebraic consequences of the symbol
definitions, not statements about the data. Registering them as the faithfulness gate is exactly the
mistake that let NUM-04 ship a defective apparatus. The gate must therefore be the **independent,
disjoint on-chain referents** (E-tier) plus the **falsifiable concrete primitives** (C-tier).

## 1. Scope

- **IN:** the object verification map (§4): four explicit tiers — concrete-match (C), abstract-fit
  (A), empirical-faithfulness-vs-independent-referents (E), and internal-identity-as-code-correctness
  (I) — for every node in the φ̄* closure (`NOTATION.md` closure table).
- **DEFERRED (out, this iteration):** `Π^target`, `P_{LB-C}`, the lookback replication (the HALT'd
  Layer B). I2 (the FOC) is admitted **algebra-only with a FREE symbolic `Π^target`** (MAJOR M5) so
  it does NOT smuggle the HALT'd Layer-B object back in. The Layer-B HALT stands; this is NOT a
  re-spec of that gate.
- **SUPERSEDED:** NUM-04 Layer A's *fixed divergence-loss predictor* is replaced by the correct
  apparatus object — calibrating `G(σ;Θ)` (§4, A-tier).

## 2. Venue & primitives

QuickSwap-V3-Polygon (Algebra V1), the two pools named in `snapshot.session.json`:
liquid `0xae81fac689a1b4b1e06e7ef4a2ab4cd8ac0a087d` (WMATIC/USDC, decimals 18/6) + adverse
`0x5cd94ead61fea43886feec3c95b1e9d7284fdef3`. Conventions: `φ̄` = the **protocol-defined base/minimum
fee** (an observable, NOT a window-min estimate — a window-min would absorb the `G` signal and break
identification); `i_X` = tick; `Δ_X` = per-tick trade-flow increment.

**Exact decoded Dune column casing (pinned, Task 1 / `base/dune_column_sample.json`,
`casing_verified: true`).** The decoded `quickswap_v3_polygon.algebrapool_evt_*` columns are
**camelCase**, NOT the lowercase the RESEARCH assumed (resolves Open Question 1 / Pitfall 5):

| Table | Liquidity / fee columns | Tick columns | Standard columns |
|-------|--------------------------|--------------|------------------|
| `_mint`    | `liquidityAmount`, `amount0`, `amount1` | `bottomTick`, `topTick` | `contract_address`, `evt_block_number`, `evt_index`, `evt_block_time` |
| `_burn`    | `liquidityAmount`, `amount0`, `amount1` | `bottomTick`, `topTick` | (same) |
| `_collect` | `amount0`, `amount1` — **NO `liquidityAmount`** | `bottomTick`, `topTick` | (same) |

`collect.amount0/amount1` are the **withdrawn realized fees** — the INDEPENDENT Υ referent (E1),
disjoint from the swap-side `Σ φ_X·Δ_X·⟨L_K,μ⟩`. Sign convention (verified vs `TickManager.update`):
Mint adds `+liquidityAmount` at `bottomTick`, `−liquidityAmount` at `topTick`; Burn mirrors. The
Plan-03 `L_K` query text MUST read this casing; the Plan-03 lock MUST record `casing_verified`.

## 3. Data plan — maximize the free tier, then re-assess

Extract the MAX feasible within the Dune free/plan tier + the Alchemy archive RPC, freeze content-hashed:

- **Dune:** swaps (`tick, price, amount0/1, liquidity`), `algebrapool_evt_fee` (realized `φ_obs`), and
  **Mint / Burn / Collect** events. `L_K(i_X)` is reconstructed as **one Dune SQL query**: a
  full-history cumulative `SUM(liquidityNet) OVER (ORDER BY tick)` from Mint/Burn up to a snapshot
  block — NOT thousands of RPC `ticks()` calls, NOT a bounded range (which omits long-lived positions).
- **RPC archive (Alchemy, `ALCHEMY_API_KEY` present):** `pool.liquidity()` (the `L_K` cumsum
  cross-check at the current tick), `totalFeeGrowth{0,1}Token()` (the corroborating Υ referent),
  `token{0,1}.balanceOf(pool)` (the IL referent), oracle `getTimepoints` for `σ_X`.
- **Snapshot reconstruction:** at a set of **snapshot blocks** spanning σ-regimes, reconstruct the
  FULL primitive stack (`L_K`, reserves, `σ_X`, local swap flow, fees) so every criterion gets ≥1 real
  instance. Maximize count within the tier; **then re-assess** coverage before locking N.
- **Provenance:** query ids + `sha256(query)` + execution ids + block numbers + `series_sha256`;
  ordering anchor `prereg_commit_ts < data_snapshot_ts` (snapshot-side; repo has no remote).
- **Honest fallback:** if an object is unreachable in the free tier, record `status: blocked` FOR THAT
  OBJECT, proceed with the rest, fabricate nothing; never substitute a naive proxy (no naive-variance
  σ, no `⟨L_K,μ⟩=1`).

## 4. Per-object verification map — FOUR TIERS (criteria authored pre-lock; thresholds bracketed)

**THE DATA-FAITHFULNESS GATE IS THE E-TIER + THE C-TIER CONCRETE PRIMITIVES. I-tier identities
survive the `⟨L_K,μ⟩→1` defect and are therefore code-correctness only.** (BLOCKER-1, verbatim.)

### 4.C — C-tier: concrete-match, FALSIFIABLE primitives (part of the data gate)

| # | Object | Functional spec | Observable referent | PASS criterion (pre-registered) |
|---|--------|-----------------|---------------------|----------------------------------|
| C1 | `σ_X(t)` | trailing tick-variance window | oracle `getTimepoints` (TRUTH) vs ticks-recon | **DIRECTIONAL / order-of-magnitude only** — recon within a factor (`0.2 ≤ recon/oracle ≤ 5`); **NOT a registered 25% bound** (MAJOR: the recon already missed at ~40% by design — the oracle's time-weighted `_volatilityOnRange` integration cannot be matched by swap-event sampling). The fit consumes the TRUE oracle σ. |
| C2 | `Δ_X(τ)` | per-tick trade-flow increment | swap amounts / tick deltas | derivable; sign/units consistent on 100% sampled |
| C3 | `L_K(i_X)` | LDF cumsum + props 1,2,3 | Dune `liquidityNet` cumsum; `pool.liquidity()` cross-check | cumsum monotone-non-negative; current-tick cumsum **== `pool.liquidity()`** (known-answer); **LDF props 1, 2, 3 hold** (see §4.LDF) |
| C4 | `A_t` | crossed-tick band `A_t≠∅` (DEP-02) | support of `L_K` over `{i : i_X(t-1) ≤ i ≤ i_X(t)}` | `A_t ≠ ∅` whenever the price moved (`Sw ≠ 0`); empty iff `Sw = 0` (genuinely falsifiable — the band can be empty if the price didn't move) |
| C5 | `φ_X=φ̄+G` | fee surface (`:540-578`) | `φ_obs` (Dune `algebrapool_evt_fee`), `φ̄`=protocol base fee | `φ_obs − φ̄ ≥ 0`; `G := φ_obs − φ̄` reconstruction sign/units consistent |

### 4.LDF — the 9 LDF properties: ONLY 1, 2, 3 registered (MAJOR; padding concern answered in writing)

- **Property 1 (non-negativity & bounded mass):** `L_K(i) ≥ 0` and `L_K(i)·Δ_{i_X} ∈ [0,1]` —
  **FALSIFIABLE** (the cumsum could go negative under a wrong sign convention / event-replay bug).
- **Property 2 (normalization):** `Σ_i L_K(i)·Δ_{i_X} = 1` — **CODE-CORRECTNESS `≤ 1e-9`** (true by the
  normalization step; tests the divisor is the actual total, not a faithfulness claim).
- **Property 3 (compact support):** supported on finite `[i_min, i_max]`, **zero outside** —
  **FALSIFIABLE** (zero outside the covered range catches spurious mass from an unmatched Burn).
- **Properties 4–9 are recorded as STRUCTURAL-BY-CONSTRUCTION / OUT-OF-SCOPE, NOT a data gate:**
  4 (convexity of the LDF simplex — a property of the *set*, `w·1+(1−w)·1=1` is algebra),
  5 (extreme points = single-tick LDFs — a spanning statement),
  6 (scale-homogeneity `ℓ_K = L·L_K` — definitional of the normalization),
  7 (shapeshifting parametrization — Bunni-LDF machinery, not instantiated here),
  8 (tick→price pushforward Jacobian — fixed math, one optional code-correctness sanity check),
  9 (atomic/lattice-valued — trivially true of a reconstruction on the tick lattice).
  These are NOT padded into the gate; this paragraph is the written answer to the reviewer's
  padding concern.

### 4.A — A-tier: abstract-object calibration

| # | Object | Functional spec | Observable referent | PASS criterion (pre-registered) |
|---|--------|-----------------|---------------------|----------------------------------|
| A1 | `G(σ;α,β,γ)` | logistic in `σ_X` × `A(t)` (`:873-900`) | `φ_obs − φ̄` vs `σ_X` | **LOAD-BEARING GATE (M2): beats a constant-`G` baseline OOS.** Logistic calibrates AND `(α,β,γ) ∈ A_Θ` admissible (theory-derived, SHREVE:838-859); monotone-in-σ sign correct. The OOS fit metric must also clear the **measurement-sanity floor `θ_G = 2.439024392014759e-05`** (LOCKED, §Threshold derivation) — but a fit worse than `θ_G` means a BROKEN PIPELINE, not a model verdict; `θ_G` is a sanity bar, the constant-`G` OOS comparison is the real falsifiable A1 gate (the snapshot carries no per-block `φ_obs` to size a true `φ̄`-response fit bar). |
| A2b | `μ_τ^φ` per-tick mass | μ-implied tick shares over `A_t` | per-tick fee-growth shares (`Δ(outerFeeGrowth)` at boundary ticks) — **NOT IN THE FREE-TIER SNAPSHOT** | **`status: blocked` (M1).** The frozen snapshot carries only GLOBAL day-delta `totalFeeGrowth{0,1}`, NO per-tick / `outerFeeGrowth`, so the per-tick fee-growth-share comparison cannot run. The per-tick-shape μ test is **DEFERRED**; the μ gate is demoted to **A3-only** (below). A2b is NOT a registered runnable gate this iteration — recorded blocked, not fabricated. |
| A3 | `⟨L_K,μ_τ^φ⟩` | pairing `Σ_{i∈A_t} L_K(i)·μ(i)·Δ_{i_X}` (`:343-406`) | **effective in-range liquidity the crossing swap traded against** (`Swap.liquidity` field) | **THE μ GATE (M1, A3-only): the pairing ≈ `Swap.liquidity`** over the crossed band within tolerance — **NOT "finite/positive/scale-sane"** (that vacuous criterion passes for the literal defect value `1`). This is the object NUM-04 collapsed to `1`; it now has a genuine on-chain referent and, with A2b blocked, is the PRIMARY μ-defect discriminator. **PROSE RELABEL (Plan-05 minor 2, both reviewers):** until THIS confirmatory run instantiates it, A3 is **"designated, not demonstrated"** — the referent and pairing are pinned but the comparison has not been computed. The per-tick **μ-SHAPE faithfulness is UNTESTED / DEFERRED** (A2b blocked — no per-tick fee-growth in the snapshot); A3 tests only that the *aggregate* pairing matches the AMM's in-range liquidity, NOT the per-tick μ shape. **PRE-DECLARED:** if `Swap.liquidity` is absent / null for a held-out swap, A3 is recorded `blocked` and the **μ gate is `inconclusive`** for that swap — **NEVER "μ verified" / "μ faithful"**. A passing A3 certifies only that ⟨L_K,μ⟩ is not collapsed to `1` and matches the in-range liquidity, not graded μ-shape faithfulness. |

### 4.E — E-tier: empirical-faithfulness vs INDEPENDENT referents — **THE DATA GATE**

| # | Object | Functional spec | INDEPENDENT referent (disjoint) | PASS criterion |
|---|--------|-----------------|----------------------------------|----------------|
| E1 | `Υ_t` | `Σ φ_X Δ_X ⟨L_K,μ⟩` (`:330-341`), full event-replay | `collect.amount0/amount1` realized withdrawn fees (primary) and/or RPC `totalFeeGrowth{0,1}Token` differencing (corroborating) | **ORDER-OF-MAGNITUDE / `⟨L_K,μ⟩`-collapse detector (B1):** formula-`Υ` vs realized fees within **≤ `τ_Υ = 1.726918197701557`** rel on held-out snapshots (LOCKED, §Threshold derivation); the gate ratio is **DIMENSIONLESS** (§4.numéraire). `τ_Υ ≈ 1.7` is the honest WITHIN-day measurement floor of daily-AGGREGATE free-tier data, so E1 catches `⟨L_K,μ⟩`-collapse / order-of-magnitude defects, NOT graded ones — **A3 is the primary μ discriminator.** **Pool scope (B2):** runnable on **LIQUID** (4 held-out blocks with `Δ(fg1)·L > 0` across distinct σ-regimes); **ADVERSE E1 is pre-declared `inconclusive: insufficient held-out referent`** (only 1 of 4 held-out blocks has a positive token1 `Υ`-referent). |
| E2 | `IL(T)` | `i_X, L_K`, reserves (`:382-406`) | reserve-based: `token{0,1}.balanceOf(pool)` priced at snapshot `sqrtPriceX96` vs buy-and-hold | formula-`IL` vs measured within **≤ `τ_IL = 0.00010293145290735122`** rel (LOCKED, §Threshold derivation); sign agreement (IL non-positive vs hold). **(M3)** `τ_IL` carries a PRICE-snapshot-timing term (±1-tick `sqrtPriceX96` slip ≈ `1e-4`, dominant) + a decimals-asymmetry valuation term, since E2 is an INSTANTANEOUS reserve revaluation (the prior `2.44e-5` was the fee-window timing only and would false-HALT E2 at the high-σ blocks). |

**No-circularity requirement (BLOCKER-2), registered for E1 + E2:** the referent code path
(`base/referents.py`) imports **NOTHING** from `base/apparatus.py` (no `L_K`, `μ`, `Sw`, `Gw`, `Sw`,
`pairing`). The referents are computed from RAW on-chain reads only (`collect.amount{0,1}`,
`totalFeeGrowth`, `balanceOf`). This **disjointness is the registered gate**, mechanically enforced by
`tools/compute/tests/test_referents_disjoint.py` (an import-graph / `__code__.co_names` scan). A
constant-`⟨L_K,μ⟩` path would share the apparatus module and is caught by this test.

### 4.I — I-tier: identities — CODE-CORRECTNESS unit tests, EXPLICITLY NOT the data gate

| # | Identity | Statement | Source | PASS criterion (code-correctness) |
|---|----------|-----------|--------|-----------------------------------|
| I1 | affine collapse | `CF_T = φ̄·Sw + Gw − IL` (`:970-981`) | SYMB-01 | residual **≤ 1e-9** rel (machine precision) |
| I2 | `φ̄*` FOC | `(Π^target+IL−Gw)/Sw` stationarizes `dC/dφ̄` (SYMB-01) | SYMB-01 re-drive | `dC/dφ̄ \|_{φ̄*} ≤ 1e-9`; **ALGEBRA-ONLY with a FREE symbolic `Π^target`** (MAJOR M5 — `Π^target` is the DEFERRED lookback object; I2 must NOT smuggle the HALT'd Layer B back in) |
| DEP-01 | leg-coincidence | `((φ̄+G)·ΔW legs) − (φ̄·Sw + Gw) → 0` (`:949-956`) | re-drive of committed `DEP-01.raw` | residual **≤ 1e-9** |
| A2-norm | `Σμ=1` | `\|Σ_{A_t} μ − 1\| ≤ 1e-9` | construction | **code-correctness** — NOT the μ faithfulness test (that is A2b) |

Write verbatim, per BLOCKER-1: **"The data-faithfulness gate is the E-tier + the C-tier concrete
primitives. I-tier identities survive the `⟨L_K,μ⟩→1` defect and are therefore code-correctness only."**

### 4.M — MAJOR corrections recorded explicitly

**Plan-04 re-open resolutions (second two-step review, `base/BASE-prereg-review.md`):**

- **B1 (τ_Υ type error):** `τ_Υ` re-derived as a WITHIN-DAY two same-day-referent disagreement
  (`1.7269`, was the cross-DAY revenue dispersion `0.806`); E1 down-scoped to an order-of-magnitude
  `⟨L_K,μ⟩`-collapse detector, A3 the primary μ discriminator (§4.A / §4.E / §Threshold derivation).
- **B2 (held-out E1 empty for adverse):** split re-cut on positive `Υ`-referent — liquid E1 runnable
  (4 positive held-out across σ-regimes), adverse E1 pre-declared `inconclusive: insufficient held-out
  referent` (§4.E / §Threshold derivation).
- **M1 (A2b unrunnable):** A2b `status: blocked` (no per-tick/`outerFeeGrowth` in the snapshot); μ gate
  demoted to A3-only (§4.A).
- **M2 (θ_G placeholder):** `θ_G` relabelled a measurement-sanity floor; A1 load-bearing gate = "beats
  a constant-`G` OOS baseline" (§4.A). **PROSE RELABEL (Plan-05 minor 3):** `θ_G ≈ block-timing` —
  `θ_G = RSS(decimals, timing) = 2.439e-5` is numerically dominated by the ±1-block timing term
  (`1/41000 ≈ 2.44e-5`); the decimals component (`9.3e-10`) is negligible, so θ_G is essentially the
  block-timing precision.
- **E2 SCOPE (Plan-05 minor 3):** at the **top-σ adverse held-out block** (`82205689`, `σ_X ≈ 253670`)
  E2 is scoped **sign / directional-only** — SIGN agreement (IL non-positive vs hold) + direction, not
  graded magnitude (the ±1-tick price-snapshot slip at extreme σ makes the graded τ_IL band
  uninformative there).
- **M3 (τ_IL too tight):** `τ_IL` += ±1-tick `sqrtPriceX96` price-slip + decimals-asymmetry valuation
  (`1.03e-4`, was `2.44e-5`) — no longer false-HALTs the instantaneous E2 revaluation (§4.E).
- **m4 (numéraire pin):** the `totalFeeGrowth (Q128) → absolute fee (×L/2^128/10^decimals)` conversion
  PINNED verbatim in §4.numéraire, binding Plan-05's Υ replay to the identical conversion.

- **M4 (full event-replay):** `Υ`, `CF`, `Sw`, `Gw`, `IL` accumulate over **EVERY swap** in the
  interval `[snap_k, snap_{k+1}]`. **Snapshots are interval ENDPOINTS only** (where `L_K`, reserves,
  and the referents are read); **the summation grid is the full swap stream**, NOT the endpoints. This
  directly fixes the NUM-04 "daily endpoint as summation grid" error.
- **A3 referent (MAJOR):** `⟨L_K,μ⟩` ≈ the effective in-range liquidity the crossing swap traded
  against (the `Swap.liquidity` field) — **NOT** "finite/positive/scale-sane".
- **C1 σ-recon (MAJOR B3):** DIRECTIONAL / order-of-magnitude only (oracle `getTimepoints` is truth;
  recon misses ~40% by design) — NOT a registered 25% bound.
- **I2 / `Π^target` (MAJOR M5):** I2 declared **ALGEBRA-ONLY** with a free symbolic `Π^target`; the
  deferred lookback is NOT re-introduced.
- **LDF properties (MAJOR):** register ONLY props **1, 2, 3** (1 & 3 falsifiable; 2 a `≤1e-9`
  code-correctness). Props **4–9 recorded as structural-by-construction / out-of-scope, NOT a data
  gate** (§4.LDF).
- **A(t) mapping (MAJOR).** Pin `A(t)` = the **logistic in `ΔX·ΔY/ΔL`** range-imbalance gate
  (SHREVE:887-900; NOTATION:80 — `A(t) ∈ [0,1]`, uses `ΔX, ΔY, ΔL`). **Because `A(t)` needs `ΔL`,
  `ΔL(t)` is declared LOAD-BEARING for the `A(t) → G` map** and is instantiated from per-interval
  `Swap.liquidity` / position deltas — **NOT deferred.** This finding **overrides the CONTEXT default
  "defer `ΔL` unless load-bearing"**: it IS load-bearing for `A(t)`, so it is instantiated. `ΔX, ΔY`
  come from the same `balanceOf` reads the E2 IL referent uses; `ΔL` from per-interval `Swap.liquidity`
  / Mint-Burn position deltas.
- **σ tolerance + re-runnability scope:** the C1 σ tolerance is justified by the oracle's distinct
  time-weighted `_volatilityOnRange` averaging (recon is a sanity check, not a bound). The `≤1e-12`
  re-runnability claim is **SCOPED to the network-free legs** (the reconstruction, fits, identity
  re-drives on the frozen series); the live Dune/RPC extraction legs are content-hash-frozen, not
  bit-reproducible per-call.

### 4.numéraire — numéraire discipline (Pitfall 2, the NUM-04 killer)

The E1 gate ratio is **DIMENSIONLESS** — both the formula-`Υ` and the realized-fee referent are put on
the **same numéraire BEFORE the ratio** (`totalFeeGrowth` is Q128 per-unit-liquidity; `collect`
amounts are raw token units, decimals0=18 / decimals1=6). The gate must be numéraire-invariant by
construction — this is exactly where the NUM-04 numéraire artifact bit (`residual ∝ Sw`).

**PINNED CONVERSION (m4 — LOCKED, binding on Plan-05's Υ replay). The `totalFeeGrowth` → absolute-fee
conversion is, VERBATIM:**

```
absolute_fee_token_k_raw   =  Δ(totalFeeGrowth_k)  ·  L  /  2**128          # raw token_k units (wei)
absolute_fee_token_k       =  absolute_fee_token_k_raw  /  10**decimals_k    # token_k units (numéraire)
    where  Δ(totalFeeGrowth_k) = totalFeeGrowth_k(t) − totalFeeGrowth_k(t−1)   (the day-delta, Q128),
           L = pool in-range liquidity at the snapshot block,
           decimals0 = 18,  decimals1 = 6.
```

This is the EXACT conversion `base/noise_floor.py::_within_day_one_pool` uses for the accounting-side
referent of the within-day `τ_Υ` floor (`Δ(fg0)·L/2^128/10**decimals0`), and it is the conversion
Plan-05's `base/referents.py` MUST replay for the E1 `Υ`-referent. Binding it here pins it identically
across the floor derivation and the confirmatory run — closing the NUM-04 `⟨L_K,μ⟩→1` / numéraire gap
(the NUM-04 killer: a mismatched conversion is exactly how `residual ∝ Sw` crept in).

## 5. Pre-registration & anti-fishing discipline (NUM-03 §4.3 carried verbatim)

- The three faithfulness thresholds `τ_Υ = 1.726918197701557`, `τ_IL = 0.00010293145290735122`,
  `θ_G = 2.439024392014759e-05` are derived **OUTCOME-BLIND** on the tuning split (chronological
  first ~70%, held-out tail untouched) from the measurement noise floor (within-day two-referent
  disagreement + decimals quantization + block-timing + IL price-snapshot-timing), with the
  per-component derivation arithmetic written into `## Threshold derivation (locked)`, **locked
  before the single confirmatory run, and NEVER relaxed**. They are NEVER set from the faithfulness
  residual (signature ALLOWLISTED to `{tuning_split, decimals0, decimals1}`, mechanically asserted by
  `tests/test_noise_floor.py`). Identity tolerances (1e-9) are principled/machine-precision and
  outcome-independent.
- **`noise_floor > τ ⇒ inconclusive/fail`** (never raise `τ` to accommodate the floor; a residual
  below the floor is an OVERFIT / look-ahead flag, not a triumph).
- All §4 criteria are LOCKED before calibration/identity results are computed (Plan 03); code is
  sha256-pinned and run **ONCE** (Plan 05).
- **Any miss on a locked criterion is a HALT** → disposition memo → **user-enumerated pivot** (per the
  `anti-fishing-replication` discipline). No fail is laundered into a pass.
- **Two-step-review gate (Plan 04):** the LOCKED pre-registration must clear BLOCKER/MAJOR from the
  second two-step review (Reality Checker + one specialist, per CLAUDE.md) BEFORE the confirmatory run.

## 6. Re-runnability

Frozen content-hashed series; seeded; pinned `tools/compute/uv.lock`; every emitted metric JSON carries
`series_sha256 + uv_lock_sha256 + seed`; the **network-free** gate numbers reproduce `≤1e-12` on re-run
(scope per §4.M). The live Dune/RPC extraction is content-hash-frozen, not per-call bit-reproducible.

## 7. Deliverables

`base/reconstruct_LK.py`, `base/referents.py` (disjoint), `base/noise_floor.py` (outcome-blind),
`base/apparatus.py` (`Υ=Σφ_X·Δ_X·⟨L_K,μ⟩` full event-replay; `μ` closed form; `A(t)` with `ΔL`; `IL`),
`base/base_verify.py` (per-object C/A/E/I map → `BASE-01.json`); the four Wave-0 tests
(`test_reconstruct_LK.py`, `test_referents_disjoint.py`, `test_noise_floor.py`, `test_base_verify.py`);
`BASE-01.md` (per-object pass/fail + the `G` calibration); and a `verification.apparatus` block in the
φ* claim recording which apparatus objects are data-faithful. **Claim-level `status` stays `stub`.**

## 8. Economic Meaning

The apparatus objects, named concretely as CFMM constructs (CLAUDE.md discipline):

- **`L_K(i_X)` = the QuickSwap-V3 (Algebra V1) active-liquidity profile** of the pool — the tick-level
  liquidity distribution reconstructed as the running `liquidityNet` cumsum, i.e. how much liquidity is
  in-range at each price tick. It is the pool's *depth curve*.
- **`⟨L_K, μ_τ^φ⟩` = the effective in-range liquidity a swap trades against** over the tick band the
  price crossed in step `t` — the liquidity-mass-weighted average depth across the crossed ticks. This
  is the `Swap.liquidity` field the AMM itself reports; NUM-04 collapsed it to `1`, erasing the depth.
- **`A_t` = the crossed-tick band** `{i : i_X(t-1) ≤ i ≤ i_X(t)}` — the ticks the price actually swept
  in step `t`; empty iff the price didn't move (`Sw = 0`), which is the DEP-02 zero-locus.
- **`A(t)` = the range-imbalance gate** — a logistic in `ΔX·ΔY/ΔL` measuring how lopsided the reserve
  move was; it scales the volatility gate `G = logistic(σ) × A(t)`, so the *liquidity churn* `ΔL`
  (positions added/removed) directly shapes the fee surcharge.
- **`Υ_t` = LP fee revenue** — the fees the pool's liquidity providers actually earn over the interval,
  accrued over every swap.
- **The E-tier gate = matching the formula's fee revenue and impermanent loss against the pool's OWN
  realized fee growth (`collect` / `totalFeeGrowth`) and reserve drift (`balanceOf`)** — i.e. checking
  the abstract accounting describes the LP's real on-chain P&L, not a curve drawn through residuals.

## Implementation pointer

The apparatus modules live under `cfmm-options/EXERCISES/artifacts/numerical/base/` (Python,
`tools/compute/` harness). A Solidity twin of the active-liquidity profile + fee accrual
(`clamm-automaton/src/`, replacing the stub `BaseFeeCP.mod.sol`) is a later CAT-02 concern, NOT
BASE-01 work. No Plank twin is warranted at this stage (the Plank target is not yet bootstrapped).

## Threshold derivation (locked)

The three faithfulness thresholds were derived OUTCOME-BLIND by
`base/noise_floor.py::derive_thresholds(tuning_split, decimals0=18, decimals1=6)` on the TUNING
split (chronological first ~70% of each pool's 12 snapshot blocks) of
`base/BASE-series.json` (`series_sha256 = c74e23545f1078b572bb2d9d0a43932cabfbc665614e2163e89b8c6036ab1bf0`).
The full numbers live in `base/BASE-noise-floor.json`. The derivation signature is ALLOWLISTED to
`{tuning_split, decimals0, decimals1}` — NO faithfulness-residual / held-out / target / e1 / gap
argument — outcome-blindness is STRUCTURAL and `tests/test_noise_floor.py` asserts the signature
allowlist + the closure symbol-denylist mechanically.

**Tuning split (held-out tail UNTOUCHED until Plan 05):**

- liquid `0xae81…087d`: 8 tuning blocks `[38249614 … 67065956]` (2023-01-18 … 2025-01-23);
  held-out `[77690811, 79418609, 85631713, 87884141]` — **all 4 have a positive token1 Υ-referent
  `Δ(fg1)·L > 0` across distinct σ-regimes → E1 RUNNABLE** (B2).
- adverse `0x5cd9…def3`: 8 tuning blocks `[33164031 … 62334042]` (2022-09-16 … 2024-09-27);
  held-out `[65309661, 78550946, 79373468, 82205689]` — **only `79373468` has a positive token1
  Υ-referent → adverse E1 PRE-DECLARED `inconclusive: insufficient held-out referent`** (B2). The
  held-out tail is still UNTOUCHED for the floor derivation; the positivity classification reads only
  the SIGN of `Δ(fg1)·L` (the existence of a referent), not any faithfulness magnitude.

**The measurement-noise components (per component; all on the tuning split only):**

1. **Within-day Υ two-referent measurement floor — `1.726918197701557` (B1, the τ_Υ driver).** For
   each tuning day, two INDEPENDENT same-day measures of that day's token0 fee:
   • swap-side `φ_obs·dW` with `φ_obs = day_fee/1e6`, `dW = dw` (NUM-04 daily series
   `snapshot/{pool}_daily_raw.json`, keyed by `rep_block`);
   • accounting-side `Δ(fg0)·L / 2^128 / 10^18` (decimals-normalized to the token0 numéraire, §4.numéraire).
   `τ_Υ` = the MAX of `|swap − acct| / acct` (acct>0) over the tuning days, PER POOL, max across pools:
   liquid max `1.7269` (8 days), adverse max `1.4151` (4 days with acct>0) ⇒ **max = `1.7269` (liquid)**.
   This REPLACES the prior cross-DAY revenue-dispersion proxy `0.806`, which was a between-day ECONOMIC
   statistic (the wrong TYPE for a measurement floor). It lands large because the `dW` swap-side is a
   daily-AGGREGATE volume proxy while the accounting side is the exact fee-growth delta — their
   ~order-of-magnitude disagreement is the honest measurement reality of daily free-tier data. E1 is
   therefore down-scoped to an order-of-magnitude `⟨L_K,μ⟩`-collapse detector; A3 is the primary μ
   discriminator (§4.A / §4.E). **M4 sensitivity:** no tuning day has `day_fee == 0` in either pool, so
   the zero-fee-excluded within-day max is IDENTICAL (`1.726918197701557`); recorded in
   `BASE-noise-floor.json::components.within_day_upsilon_zero_fee_excluded`.

2. **Decimals quantization — `9.294258794859302e-10` (LITERAL).** The smallest representable fee is
   1 raw unit; relative to a typical interval fee it is `1 / median(F_raw)`, computed PER POOL for
   token0 (18-dec) + token1 (6-dec), then the **max** across pools. The liquid pool's 6-dec token1
   floor `9.29e-10` dominates; the adverse pool's floor is ~`1.35e-17`. Literal from the tuning split.

3. **Block-timing precision — `2.4390243902439026e-05` (ANALYTIC).** σ / reserves / fee-growth are
   read at block granularity; a ±1-block slip over the ~1-day fee-growth window
   (`window_blocks = 41000`) is the analytic relative bound `1 / 41000 ≈ 2.44e-05`.

4. **IL price-snapshot-timing — `price_slip = 9.999999999998899e-05`, `decimals_asym = 1.2863837805395993e-12`
   (M3, the τ_IL driver).** E2 is an INSTANTANEOUS reserve revaluation, so its floor carries a ±1-tick
   `sqrtPriceX96` slip = `1.0001 − 1 ≈ 1e-4` relative price move (dominant; reserve revaluation rel-error
   is first-order ≤ `|ΔP/P|`) PLUS a decimals-asymmetry valuation term `1 / median(reserve1)` (1 raw 6-dec
   token1 unit per typical reserve1, liquid pool). The prior `τ_IL = RSS(decimals, timing) = 2.44e-5` was
   the fee-WINDOW timing only and would false-HALT E2 at the high-σ blocks.

**Composition (conservative RSS quadrature):**

- `τ_Υ = RSS(within_day, decimals, timing) = 1.726918197701557` (the within-day disagreement dominates).
- `τ_IL = RSS(price_slip, decimals_asym, timing) = 0.00010293145290735122` (the ±1-tick price slip
  dominates — M3).
- `θ_G = RSS(decimals, timing) = 2.439024392014759e-05` — RELABELLED a **MEASUREMENT-SANITY FLOOR**
  (M2), NOT a fit bar (a fit worse than it = broken pipeline, not a model verdict); the LOAD-BEARING
  A1 gate is **"beats a constant-`G` OOS baseline"**. The snapshot carries no per-block `φ_obs` to size
  a true `φ̄`-response fit bar, so the measurement floor is only the sanity minimum.

A LARGER τ is the honest, anti-fishing-safe direction; no component was shrunk. The
`noise_floor > τ ⇒ inconclusive/fail` branch (NUM-03 §4.3, §5 above) is carried in
`derive_thresholds` (`gate_verdict`) — τ is NEVER raised to accommodate a measured floor; an
SI/residual measured BELOW the floor is an OVERFIT / look-ahead flag, not a triumph.

**A2b — `status: blocked` (M1).** The frozen snapshot carries only GLOBAL day-delta
`totalFeeGrowth{0,1}`, NO per-tick / `outerFeeGrowth`, so the per-tick μ-share comparison cannot run.
The per-tick-shape μ test is DEFERRED; the μ gate is **A3-only** (the `⟨L_K,μ⟩ ≈ Swap.liquidity`
pairing). A2b is NOT a registered runnable gate this iteration.

**A_Θ — THEORY-derived (SHREVE:838-859), NOT data-derived.** The admissible parameter polytope for
`Θ = {φ̄} ∪ {α1,α2,β1,β2,βR,γ1,γ2,γR}` comes from the logistic positivity + monotonicity bounds:
amplitudes/scales/steepnesses `≥ 0`, the σ-slope `> 0` (G monotone-increasing in σ), `βR` free
sign, the range-imbalance gate `A(t) ∈ [0,1]`. Recorded in `base/BASE-noise-floor.json::A_Theta`.

## Lock

- `prereg_sha256`: `065a8ccc72b3e6589d9d47f7b8bf472f49794c32767aeb8a8e8e9a34b95fe269`
  (sha256 of this file's bytes with BOTH hash-time placeholders restored: replace this 64-hex value
  with `__PREREG_SHA256__` AND the `lock_commit_sha` 40-hex value as `__LOCK_COMMIT_SHA__`, then
  sha256 the file.
  Both fields are literal placeholders at hash-time, so the hash is independent of the lock commit it
  anchors. **RE-LOCKED at Plan 05** (prose-only relabels — minors 1/2/3 from `base/BASE-prereg-review.md`,
  NO threshold/number/gate change; outcome-blind, the apparatus Υ was still a stub at re-lock).
  Supersedes the Plan-04 hash `d7300a8f08042fb5ca4e87260ab8e715579d5b9af4d15338b6c7830a29ba79cc`
  and the Plan-03 hash `de3371497bbbd7b76fc87a2d374e8052a5eb660af9b07bfaf833cad5377b0421`.)
- `lock_commit_sha`: `__LOCK_COMMIT_SHA__` (the lock-content commit, recorded
  pre-amend; ADVISORY only. A commit cannot embed its own final sha — any amend that writes the
  sha back changes the sha — so this records the immediately-preceding lock-content commit. The
  load-bearing anchors are `prereg_sha256` + the snapshot-side facts, NOT this advisory value;
  the repo has no remote and git `%cI` is spoofable.)
- `snapshot_ts`: `1781407000` (from `base/BASE-snapshot.session.json::extraction_ts` — the
  data-extraction wall-time; the snapshot was frozen in Plan 02).
- `series_sha256`: `c74e23545f1078b572bb2d9d0a43932cabfbc665614e2163e89b8c6036ab1bf0`.
- `daily_raw_sha256` (Plan-05 minor 3 — the within-day τ_Υ swap-side source, pinned):
  - liquid `snapshot/liquid_daily_raw.json`: `07a58d5f37ecdd6208bdb08c89be6f76b2c274a02acd5352422952c81c362016`
  - adverse `snapshot/adverse_daily_raw.json`: `8c0400a3a005a8a301144d602516be66c79313a3b2f1eb94bccb78edd0adab13`
- `casing_verified`: `true` (from `base/dune_column_sample.json` — the decoded
  `quickswap_v3_polygon.algebrapool_evt_{mint,burn,collect}` columns are camelCase
  `bottomTick/topTick/liquidityAmount/amount0/amount1`; `collect` has NO `liquidityAmount`).
- **Ordering-anchor assertion (HONEST).** The snapshot was frozen in Plan 02
  (`snapshot_ts = 1781407000`) and this lock commit POST-DATES it, so there is NO clean
  data-after-lock ordering — `prereg_commit_ts > snapshot_ts`. We do NOT claim a before/after
  guarantee. The anti-fishing guarantee rests on TWO structural facts: **(a)** the outcome-blind
  `derive_thresholds` signature (no residual/held-out/gap argument; mechanically scanned by
  `tests/test_noise_floor.py`), and **(b)** the threshold derivation used ONLY the chronological
  first-~70% TUNING split, with the HELD-OUT tail untouched until the Plan-05 confirmatory E-tier
  comparison. The repo has NO git remote; the git `%cI` commit timestamp is advisory only.

Status: LOCKED
