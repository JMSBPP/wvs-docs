# DEP-02 — `μ_t^{(φ,𝒢)}` normalization + zero-locus

## Tool transcript (sympy-mcp, 2026-06-13, image cfmm/sympy-mcp-stdio:latest)

Driver: `tools/verify_symbolic.sh` (Plan 01-01, `c0a6c21`). Invocation:

```
bash tools/verify_symbolic.sh \
  cfmm-options/EXERCISES/artifacts/symbolic/calls/dep02.jsonl \
  cfmm-options/EXERCISES/artifacts/symbolic/DEP-02.session.json \
  > cfmm-options/EXERCISES/artifacts/symbolic/DEP-02.raw
```

Both `DEP-02.raw` (stdout transcript) and `DEP-02.session.json` (raw JSON-RPC responses
+ `docker inspect` image Id + `date -u` driver-stamped timestamp) are **committed** binding
deliverables — the Wave-3 diff-gate re-drives `calls/dep02.jsonl` and byte-diffs against the
committed `DEP-02.raw`, so a hand-edited local `.raw` cannot satisfy it.

## Symbolic rung — concrete `A_t` normalization

The genuine symbolic rung. We model a CONCRETE small active set `A_t = {i_1, i_2, i_3}`
(3 ticks crossed in the step) with three **distinct, strictly-positive** indicator-weights
`w_k := 𝟙_{i_k∈A_t}·ℓ^𝒢(i_k,t)·Δi_X > 0` (each is a real per-tick density-times-width). The
per-tick normalized masses are `μ(i_k)Δi_X = w_k / (w_1+w_2+w_3)`, and their sum is the
total probability mass over `A_t`. The container is handed the EXPLICIT three-term sum (NOT a
trivial `Z/Z`) and must COMBINE the three distinct fractions:

The driver-emitted transcript (`DEP-02.raw`, verbatim — never retyped):

```
reset_state {} -> State reset successfully. All variables, functions, expressions, and other objects have been cleared.
intro_many {w1,w2,w3} -> {'w1': 'w1', 'w2': 'w2', 'w3': 'w3'}
introduce_expression "w1/(w1+w2+w3) + w2/(w1+w2+w3) + w3/(w1+w2+w3)" -> expr_0
simplify_expression expr_0 -> expr_1
print_latex_expression expr_1 -> 1
```

The op tool `simplify_expression` returned only the HANDLE `expr_1`; the VALUE landed via
`print_latex_expression expr_1 -> 1` (the mandated handle→value chain, BLOCKER-1). The three
weights `w1, w2, w3` are introduced as DISTINCT positive symbols, so the container performs
REAL fraction arithmetic `Σ_k w_k/(w1+w2+w3) -> 1` — the `1` is EARNED by combining three
separate indicator-weighted terms over a common active-set denominator, not a definitional
`Z/Z` restatement (MAJOR-1: the Z/Z tautology of the prior draft is DROPPED).

Reading: `Σ_{i_X∈A_t} μ(i_X) Δi_X = 1` for the concrete 3-tick active set — the fee-weighted
measure `μ_t^{(φ,𝒢)}` integrates (sums) to one over its support, exactly SHREVE:356–366.

## Provenance

From the committed `DEP-02.session.json` (driver-stamped, non-forgeable):

```
image:              cfmm/sympy-mcp-stdio:latest
image_digest:       sha256:615982a1f4ef32159d90deb22d9f3aba2e191922dc76b7b2f5930a88e1a2033e
run_timestamp_utc:  2026-06-13T16:30:06Z   (stamped by date -u inside the driver)
n_responses:        6   (init + 5 tools/call, verbatim raw JSON-RPC)
```

The digest comes from `docker inspect --format '{{.Id}}'` and the timestamp from
`date -u +%FT%TZ`, both stamped by the driver — the agent cannot forge them.

## DEP-02 degeneracy finding (analytic-assertion)

> `Z = Σ_{A_t} ℓ^G Δi = 0 ⇔ A_t = ∅ ⇔ i_X(t)=i_X(t−1)` (the price tick does not move in the
> step, so no swap crosses the active range).

This is an **analytic-assertion** (a reviewed analytic finding, NOT a tool result, NOT a
`solve Z=0 -> {0}` output — MAJOR-2). It is justified by:

1. **LDF positivity** `ℓ^G > 0` on its support (DRAFT.md:88–119, properties 1–2: `L_K(i) ≥ 0`,
   normalized to a probability measure). Hence the denominator `Z = Σ_{j_X∈A_t} ℓ^G(j_X,t) Δi_X`
   is a sum of strictly-positive terms over the index set `A_t`.
2. **Definitional denominator identity.** A finite sum of strictly-positive terms vanishes iff
   the index set is empty: `Z = 0 ⇔ A_t = ∅`. Since `A_t = {i_X ∈ I_X : i_X(t−1) ≤ i_X ≤ i_X(t)}`
   (SHREVE:824–834), `A_t = ∅ ⇔ i_X(t) = i_X(t−1)` (no tick crossed).

This is the SAME scalar denominator `Sw = ΣΔW = Σ_τ Δ_X(τ)⟨L_K,μ_τ^φ⟩` that makes `φ*`
**undefined** (SHREVE:1071–1077, the `Σ Δ_X ⟨L_K,μ_τ^φ⟩ ≠ 0` proviso) — because `Sw` carries
`Z` inside `⟨L_K,μ_τ^φ⟩`'s own denominator (LIVE-confirmed via the SYMB-01 run, where `Sw` IS
the SHREVE:1057–1063 denominator). Therefore `φ*`'s well-definedness proviso and `μ`'s
probability-measure guard are **ONE condition**: the cumulative volume-weighted in-range
liquidity must be strictly positive over `[t0,T]`. Carried to Phase-4 as the `A_t ≠ ∅`
hypothesis of the `IsProbabilityMeasure` typeclass obligation (DEP-02 formal rung). This
blocks the Mathlib `∫=0`-if-not-integrable vacuity (Pitfall P3) by making `A_t = ∅` explicit.

## Normalization-by-construction note

Over a fully **symbolic** `A_t`, the mass `Σ_{A_t} μ Δi = (Σ_{A_t} ℓ^G Δi) / Z = Z/Z = 1` is
true **by construction** (the numerator summed over `A_t` IS the denominator `Z` by definition)
and carries **zero** normalization content — it is NOT submitted as a symbolic result. The REAL
symbolic rung is the concrete 3-tick `Σμ=1` computation above (distinct positive weights, real
fraction arithmetic). The measure-theoretic `Σ=1` over the full index space `I_X` is a **Phase-4
obligation** (`IsProbabilityMeasure`), NOT a symbolic-tier result; it is recorded here honestly,
not laundered as a tool output.

## Confirms

- SHREVE_EXERCISES.md:809–834 — `μ_t^{(φ,𝒢)}` closed form + `A_t` active set.
- SHREVE_EXERCISES.md:356–366 — `Σ μ Δi = 1` (probability-measure property).
- SHREVE_EXERCISES.md:1071–1077 — `φ*` well-definedness proviso `Σ Δ_X ⟨L_K,μ_τ^φ⟩ ≠ 0` (= `Sw`).
- DRAFT.md:88–119 — LDF positivity `ℓ^G > 0` (the analytic-assertion premise).
- NOTATION.md:85–86 — `μ_τ^φ` domain carries the `A_t ≠ ∅` guard.

## Economic Meaning

`μ_t^{(φ,𝒢)}` is the **fee-incidence measure** of the pool: it assigns, to each rounded tick
`i_X` the step crosses, the share of swap volume (and thus fee accrual) that lands on that
tick's in-range liquidity. The active set `A_t` is the **band of ticks the price sweeps through**
between `t−1` and `t`. The normalization `ΣμΔi=1` says the fee-weighted measure is a genuine
probability distribution over the crossed band — every unit of crossing volume is accounted for.
The zero-locus `A_t = ∅` is the **no-trade / no-tick-move regime**: when the price does not move,
no liquidity is touched, the fee-incidence denominator collapses, and both `μ` (as a measure)
and `φ*` (the optimal base fee whose denominator is the cumulative in-range volume `Sw`) become
undefined. The LP earns nothing because nothing was swapped; the optimal-base-fee problem has no
financing volume to amortize the target liability against. The `A_t ≠ ∅` guard is precisely the
"the pool must actually trade" feasibility condition for the base-fee replication to be posable.
