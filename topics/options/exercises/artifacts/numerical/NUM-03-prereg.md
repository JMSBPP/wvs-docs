# NUM-03 — Pre-registered fit criterion for the `φ̄*`/base-fee numerical tier

**Status at commit:** PRE-REGISTRATION. **NO on-chain data has been observed at commit
time.** This document fixes every literal acceptance threshold, every gate branch, and
every provenance rule for the Phase-2 numerical fit (Layer A + Layer B) BEFORE any Dune
query or RPC `eth_call` is run. It is the gate-zero ordering anchor: the strongest possible
defense against Pitfall 7 (overfitting / post-hoc tolerance selection) is that the tolerances
were committed when the data did not yet exist.

**Reads from:** `cfmm-options/EXERCISES/artifacts/symbolic/SYMB-01-phistar.md` (the FROZEN
closed form `φ̄* = (Π^target + IL − ΣG·ΔW)/ΣΔW`, symbol map `Sw := ΣΔW`, `Gw := ΣG·ΔW`,
`PItar := Π^target`), `.planning/research/FEATURES.md` (the SI / max-rel-error / residual
criterion; R² demoted), `.planning/research/PITFALLS.md` (Pitfalls 7 overfitting, 8 biased
on-chain data), `.planning/phases/02-numerical-tier/02-CONTEXT.md` (Addendum 2 — the
governing decisions reframed below).

---

## 0. Provenance / ordering anchor (Addendum 2, BLOCKER-prereg)

The ordering gate that makes the empirical fit non-forgeable is, in priority order:

1. **PRIMARY (intended) anchor — the prereg commit SHA pushed to a remote BEFORE any
   query.** The commit introducing this file is the ordering proof: a tolerance cannot have
   been chosen after seeing residuals if the residuals did not exist and the commit was
   already on a remote.

   `prereg_commit_sha: <to be filled with the pushed commit SHA>`
   `prereg_remote: <to be filled — the remote the SHA was pushed to, e.g. origin>`

   **HONEST NOTE AT COMMIT TIME:** this repository currently has **NO git remote
   configured** (`git remote` returns empty). A push is therefore not possible at
   pre-registration time. We DO NOT claim a push that did not happen. The local prereg
   commit SHA is recorded below as the local anchor; if/when a remote is added the SHA will
   be pushed and `prereg_commit_sha` / `prereg_remote` filled in. Until then the
   ordering proof rests on the SNAPSHOT-SIDE anchor (item 2), which is independent of any
   local clock and cannot be back-dated.

   `prereg_local_commit_sha: 596aede1d93534a8142ffbe3b45945f6ddfc230f` (the local prereg
   commit; recorded by an amend that updates only this line — its post-amend SHA changes, but
   the pre-amend SHA above is the immutable timestamped anchor and the snapshot-side anchor of
   §0.2 is what the Wave-2 gate actually reads). git `%cI` advisory only.

2. **SNAPSHOT-SIDE anchor (always applies, non-spoofable, downstream).** `snapshot_ts` is
   bound to `max(max-block-time-in-the-snapshot, Dune execution_id create-time)` — NEVER a
   local `date -u`. Block timestamps and the Dune `execution_id` create-time are produced by
   third parties (the chain, Dune) and cannot be back-dated by this repo. The acceptance
   requires `prereg_commit_ts < snapshot_ts`. With no remote, the snapshot-side anchor is the
   load-bearing ordering proof: any Dune `execution_id` / max-block-time recorded in Wave 2
   is necessarily LATER than this commit, and is the timestamp the gate reads.

3. **git `%cI` is ADVISORY ONLY.** `GIT_COMMITTER_DATE` / `GIT_AUTHOR_DATE` are spoofable
   (`%cI` can be set to any value), so the commit timestamp is recorded for color only and is
   NEVER the ordering gate. The gate is (1)+(2) above.

---

## 1. Layer A — FIXED-PREDICTOR GOODNESS-OF-FIT (Addendum 2, decision 3)

Layer A is the **goodness-of-fit of the FIXED `φ̄*`-implied `φ(σ)` predictor scored against
the realized on-chain fee `φ_obs`**. It is NOT a 6-parameter sigmoid fit, NOT a free-parameter
calibration. **There is nothing to overfit:** the predictor `φ_pred = φ̄*(σ)` is a fixed map
determined by the SYMB-01 closed form and the Algebra plugin config; it is scored on data, not
fitted to it. All "identifiability of free parameters" language is dropped. `cond(Sw)` is
reported **only** as a numerical-stability note, not as an identifiability claim.

### 1.1 Metrics (report all; GATE only on the starred metric)

- **★ Scatter Index** `SI = RMSE / mean(φ_obs)`, `RMSE = sqrt(mean((φ_pred − φ_obs)²))`.
  The GATE is on the **block-bootstrap BCa CI UPPER BOUND** of `SI`
  (`scipy.stats.bootstrap(..., method='BCa')`), NOT the point estimate.
- Max relative error `τ_A = max_i |φ_pred − φ_obs| / φ_obs`.
- Residual-structure test: a runs/sign test of residuals vs `σ`; **reject (the fixed
  predictor is the wrong shape)** if a systematic trend is present at level `α`.
- `R²` is reported as **secondary color only** — it is **NEVER** the gate (R² is invalid for
  nonlinear fit; FEATURES.md).

### 1.2 LITERAL Layer-A thresholds (pre-registered, frozen)

| Symbol      | Meaning                                              | Literal value |
|-------------|------------------------------------------------------|---------------|
| `s0_A`      | gate bound on the BCa-CI **upper** bound of `SI`     | **0.15**      |
| `tau_A`     | gate bound on the max relative error                 | **0.10**      |
| `alpha`     | residual-structure test significance level           | **0.05**      |
| `N`         | min de-correlated observations (see §4)              | **≥ 200**     |
| `k`         | min market regimes (σ-tertiles), each populated      | **≥ 3**       |
| MDE margin  | min OOS SI reduction vs EACH baseline (see §6)        | **≥ 20% rel** |

**Layer-A PASS iff:** `BCa-CI-upper(SI) ≤ s0_A` AND `τ_A_measured ≤ tau_A` AND
residual-test `p ≥ alpha` AND `measured_floor ≤ tau_A` (§7) AND the OOS MDE vs both baselines
is met (§6), reported **per pool** (§8), not averaged.

---

## 2. Layer B — REALIZED-FEE REPLICATION + mandatory NEGATIVE CONTROL (Addendum 2, decision 1)

Layer B accrues `Υ_T` from the **REALIZED on-chain fee process** `Υ_T = Σ φ_obs · dW` — the
fees the pool ACTUALLY charged — NOT from `φ̄*`. `φ̄*` (the SYMB-01 closed form) is the
**TARGET / BENCHMARK**, not the accrual input. This is the falsifiability fix: the prior gate
`|Υ_T − Π^target| ≤ τ_B` was an algebraic identity (`φ̄*` sets `Υ_T = Π^target` exactly on any
path, so it could never fail). Accruing from `φ_obs` CAN fail.

### 2.1 Gate (on HELD-OUT real-path segments)

```
residual_over_target = | Υ_T − Π^target − r_f · P_LBC(0) | / | Π^target |   ≤   tau_B
```

`φ̄*` is **FROZEN on the tuning segment**, NOT recomputed per held-out segment.

### 2.2 LITERAL Layer-B thresholds (pre-registered, frozen)

| Symbol  | Meaning                                                  | Literal value |
|---------|----------------------------------------------------------|---------------|
| `tau_B` | gate bound on the target-normalized replication residual | **0.25**      |
| `alpha` | bootstrap CI level (block-bootstrap, §4)                 | **0.05**      |

### 2.3 MANDATORY NEGATIVE CONTROL (discriminating power)

A **wrong constant-fee `φ̄`** (the constant-fee baseline) MUST make the Layer-B gate **FAIL**
(`residual_over_target > tau_B`). This proves the gate has discriminating power. **A Layer-B
run in which the negative control ALSO passes is INVALID (a tautology)** and is recorded as
`fail`/`inconclusive`, never as a pass.

---

## 3. `r_f` and `P_LBC(0)` provenance (Addendum 2, MINOR — pinned now, un-tunable later)

- **`r_f`** is a **pre-registered knob**, frozen here: `r_f = 0.04` annualized (a flat
  period risk-free proxy), applied over the held-out segment horizon `T` as
  `r_f_period = r_f · (T_seconds / 31_536_000)`. Source: a flat constant proxy chosen
  pre-data; it is recorded so it cannot be re-tuned post-hoc to make the residual close. If a
  different `r_f` proxy is later judged more appropriate, it requires an amend-and-re-commit
  (§4 fallback discipline), never a silent swap.
- **`P_LBC(0)`** (the lookback option price at `t0`) is computed FROM THE PATH as the
  discounted expected running-max payoff of the lookback-call `Π^{LB-C}` evaluated at the
  segment start `t0`: `P_LBC(0) = e^{−r_f·T} · E[ (max_{0≤s≤T} S_s − S_T)^+ ]` estimated on the
  REAL price path of the tuning segment (Monte-Carlo over the bootstrap-resampled real-path
  blocks, same `--seed`). The estimator and its inputs are pinned here; no post-hoc choice of
  strike/horizon is permitted.

---

## 4. De-correlation = BLOCK-BOOTSTRAP + N-feasibility gate + fallback (Addendum 2, MAJOR-N)

### 4.1 Block-bootstrap (NOT ≥1-window thinning + i.i.d. resampling)

All CIs (Layer A `SI`, Layer B residual) are computed by **BLOCK-BOOTSTRAP**, which preserves
`N` and handles autocorrelation, rather than ≥1-window thinning followed by i.i.d. resampling
(which would destroy `N`). **Block length rule:** the resampling block length is `≥ 1
σ-window` (the Algebra oracle `WINDOW = 1 day`), so each block is long enough that adjacent
blocks are approximately independent while intra-block autocorrelation is retained. Seed:
`--seed 0` threaded into `scipy.stats.bootstrap(random_state=...)`.

### 4.2 N-FEASIBILITY GATE (machine-asserted BEFORE the Wave-2 human checkpoint)

Before the Wave-2 checkpoint, machine-assert ALL of:

- `N_decorrelated ≥ 200`, AND
- each of `k ≥ 3` `σ`-tertile regimes is **materially populated** to a **min per-regime count
  of ≥ 40 observations**.

### 4.3 Pre-registered FALLBACK if N is short (NEVER a silent drop)

If the N-feasibility gate fails, exactly one of the following is taken and recorded:

1. **Extend the block range** (longer / additional block ranges) and re-extract, OR
2. **Record `blocked`** in `verification.numerical.status` (a legal honest value), OR
3. **Amend-and-RE-COMMIT** (and re-push, once a remote exists) a revised `N`/`k`/min-per-regime
   in this document BEFORE the snapshot.

A silent N drop, regime collapse, or post-hoc threshold relaxation is **forbidden**.

---

## 5. POWER NOTE (data-free, Addendum 2, MAJOR-power)

A simulated, data-free power calculation, run NOW (no on-chain data), to confirm `N ≈ 200`
resolves the pre-registered MDE at the expected noise floor:

- **Setup:** synthesize a `φ_obs`-like series at the expected MEV/JIT noise floor; inject a
  **20% SI gap** (the model SI vs a degraded baseline SI differ by 20% relative).
- **Test:** at `N = 200`, `alpha = 0.05`, under the §4.1 block-bootstrap, the two
  block-bootstrap BCa CIs (model SI, baseline SI) **separate** (non-overlapping).
- **Pre-registered consequence:** if the simulated CIs would NOT separate at `N = 200`, then
  `N` or the MDE is **re-specified in THIS document, data-free, before the snapshot** (never
  after seeing real residuals). The committed power-note result (a small JSON / printed
  summary) is the artifact; the simulation is seeded (`--seed 0`) and re-runnable.

---

## 6. MDE vs BASELINES (both, out-of-sample)

`φ̄*` must lower the **OOS** `SI` by **≥ 20% relative** vs BOTH:

1. the **constant-fee baseline** (the pool's static-fee counterfactual), AND
2. the **trailing-mean-fee baseline** (a naive `φ` = trailing mean of recent `φ_obs`),

with **non-overlapping block-bootstrap CIs** between `φ̄*` and each baseline. Beating only one
baseline, or beating both only in-sample, is NOT a pass. This guards against "an adaptive /
replicating fee adds nothing over a static one."

---

## 7. MEV/JIT NOISE FLOOR ⇒ FAIL branch (Addendum 2, MAJOR-floor)

- **Estimation:** flag blocks with `≥ 2` opposing swaps AND a same-block LP mint/burn;
  `measured_floor = std(φ_obs within flagged blocks)`.
- **Pre-registered BRANCH — `measured_floor > tau_A` ⇒ INCONCLUSIVE/FAIL.** If the measured
  noise floor exceeds `tau_A`, the result is recorded as **inconclusive/fail**. We **NEVER
  raise `tau_A`** to accommodate the floor. Raising the tolerance to fit the noise is exactly
  the post-hoc selection this pre-registration forbids.
- **SI below the floor is an OVERFIT / LOOK-AHEAD flag,** not a triumph: an `SI` measured below
  `measured_floor` is pre-declared evidence of overfitting or look-ahead leakage (a finding to
  investigate), NOT a clean pass.

---

## 8. POOL INCLUSION + PER-POOL REPORTING (Addendum 2, MINOR)

- **Inclusion:** Algebra Integral dynamic-fee pools within a stated TVL/age band; **≥ 1 liquid
  pool AND ≥ 1 adverse/illiquid pool** (Pitfall 8 — survivorship/selection-bias defense).
- **Primary venue = QuickSwap-V3-Polygon** (the best-indexed Algebra dynamic-fee dataset on
  Dune), NOT Camelot-Arbitrum.
- **PER-POOL gate reporting (pre-registered):** the gate metric (Layer-A `SI` BCa-CI-upper,
  `τ_A`, residual test; Layer-B `residual_over_target`) is reported **per pool**, so an
  adverse-pool failure **cannot be averaged away** by a liquid pool's good fit.
- **Min adverse-pool observation share:** **≥ 20% of `N`** must come from adverse/illiquid
  pools. If the adverse share falls below 20%, the §4.3 fallback discipline applies (extend
  range / `blocked` / amend-and-re-commit), never a silent waiver.

---

## 9. σ SOURCE (Addendum 2, decision 2, BLOCKER-sigma)

- `σ_X(t)` is the **TRUE oracle value** pulled via archive-node **RPC `eth_call`** to the
  Algebra **VolatilityOracle** plugin (`getAverageVolatility` / `volatilityCumulative`) at the
  snapshot blocks. **Dune has NO σ column** (the oracle `volatilityCumulative` is internal
  storage, never emitted), so σ cannot come from Dune.
- **Dune supplies** the swap `tick` / `price` / `dW` series + the realized `φ_obs`
  (`algebrapool_evt_fee` forward-filled onto swap blocks by `(block, evt_index)`).
- **Cross-check:** ≥ 1 RPC σ value is cross-checked against a reconstructed-from-ticks σ
  (`sigma_rpc ≈ sigma_recon`) for sanity. The σ-window bounds `[t − WINDOW, t]` are
  materialized per row so look-ahead can be machine-checked (no future block in any window).

---

## 10. OOS DESIGN

- **Layer A:** chronological **70/30 temporal hold-out** + evaluate on **≥ 1 OTHER pool**
  (cross-pool generalization).
- **Layer B:** **held-out real-path segments** disjoint from any segment used to tune the sim;
  `φ̄*` is FROZEN on the tuning segment.

---

## 11. Reproducibility (binds Wave 2)

The gate numbers (`bca_ci_upper`, `residual_over_target`) MUST reproduce byte-for-byte
(`≤ 1e-12`) under `--seed 0` threaded into `scipy.stats.bootstrap(random_state=...)`; the
extracted on-chain series is committed as a **content-hashed frozen data file** that the fit
reads (it NEVER re-queries Dune). This is committed in Wave 2; this document fixes the rule.

---

## 12. Economic Meaning

This pre-registration is the **falsifiability contract** for the Shreve 1.7(ii) base-fee
model interpreted as a CFMM fee-accrual primitive. Concretely:

- **Layer A** asks whether a *real Algebra dynamic-fee pool's* charged fee `φ_obs` is the fee a
  volatility-indexed market-maker SHOULD charge — i.e. whether the on-chain adaptive-fee
  plugin's `φ(σ)` schedule coincides with the `φ̄*`-implied predictor. This is the
  fee-vs-realized-volatility surface of a live AMM: if the fixed `φ̄*(σ)` predictor scores
  within `s0_A`/`tau_A` against `φ_obs` across regimes, the closed form describes how the pool
  actually prices the volatility risk LPs bear.
- **Layer B** asks whether the *realized fee revenue* `Υ_T = Σ φ_obs·dW` an LP actually earns
  replicates a **bank's lookback liability `Π^target`** down to a pure risk-free residual
  `r_f·P_LBC(0)` — i.e. whether holding the LP position is, on real price paths, a hedge for a
  path-dependent (running-max) payoff. The negative control (a wrong constant fee fails) is the
  statement that this replication is a property of the *adaptive* fee, not of any fee.

Pre-registering the tolerances before the data exists is what lets "the model fits the pool"
mean LP-exposure fidelity rather than a curve drawn through residuals after the fact.

## Implementation pointer

The `φ̄*(σ)` predictor scored in Layer A has a direct on-chain twin in the Algebra
VolatilityOracle adaptive-fee plugin; the CAT-02 Solidity twin
(`clamm-automaton/src/`, replacing the stub `BaseFeeCP.mod.sol`) is the later
implementation-pointer concern, NOT Phase-2 work. The Layer-B replication sim is built in
Python under `tools/compute/` (plan 02-03), not Solidity.
