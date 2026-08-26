# NOTATION — `cfmm-options` notation glossary (WDEF-01)

**Artifact:** the single notation home for `cfmm-options`. Covers the relation
overscripts (`≡^D`/`≡^F`/`≡^R`/`≡^ℚ`/`≡^d` + plain `≡`), the `∂_(·,·)` operator family with a
domain/codomain table, **every object in the `φ̄*` dependency closure** (one
glossary line each), and a **closed-under-references fixpoint** trace.

**Provenance:** every node listed here is enumerated in the gate-zero DAG
[`./PHI_STAR_DEPS.md`](./PHI_STAR_DEPS.md) (committed SHA `aeafc10`, `%ct 1781363285`).
This file is committed strictly AFTER that gate-zero commit. Every `file:line`
pointer is read from source ([`../EXERCISES/SHREVE_EXERCISES.md`](../EXERCISES/SHREVE_EXERCISES.md) `= SHREVE`,
[`./DRAFT.md`](./DRAFT.md), [`./FIXED_INCOME.md`](./FIXED_INCOME.md),
[`../FEE_PREMIUM.md`](../FEE_PREMIUM.md),
[`../IMPLIED_VOLATILITY.md`](../IMPLIED_VOLATILITY.md),
[`../../lp-derivatives/notes/CFMM_DISCRETE.md`](../../lp-derivatives/notes/CFMM_DISCRETE.md)).

---

## Relation overscripts

> **Governing principle.** All of these are **algebraic equalities** (`=`); the overscript carries the **semantics** — the proof obligation the equality must discharge. They all "collude" to a plain algebraic `=`, but the *meaning* is enforced by the operator itself. Conflating two overscripts (e.g. reading an `≡^D` definition as an `≡^F` financing *result*) is the Pitfall-5 circularity trap.

There are SIX equality-like relations in `cfmm-options` (the four base relations
plus the two CANON-04/Q2-promoted slots `≡^ℚ`, `≡^d`). Each carries a DIFFERENT
proof obligation.

| Symbol | LaTeX | Name | Meaning | Proof obligation |
|--------|-------|------|---------|------------------|
| `≡^D` | `\overset{D}{=}` | definitional | "is defined as" | **None.** A bare definition. The circularity *tell*: when an `≡^D` is later cited AS a result, that is the Pitfall-5 laundering of a definition into a theorem. |
| `≡^F` | `\overset{F}{=}` (and the inequality variant `\overset{F}{\leq}`) | self-financing / fee-accrual identity | "equal (or bounded) by a self-financing / fee-accrual identity" | **DEP-01** — the `P_{LB-C}(t) ≡^F Υ_t` financing identity must be proved (it is *stated, unproved* in v1). |
| `≡^R` | `\overset{R}{=}` | static LP replication | "equal by static LP replication" | **v2 BRD-03** — the LP-replication theorem (section iii). Out of the (ii) closure. |
| `≡^ℚ` | `\overset{ℚ}{=}` | measure-change / Girsanov | "equal under a change of measure (Girsanov)" | promoted (CANON-04/Q2) — load-bearing for any measure-change step; not a v1 obligation. |
| `≡^d` | `\overset{d}{\equiv}` | Leibniz product-rule identity | "equal by the discrete Leibniz rule `d(fg)=(df)g+f(dg)`" | **None** — structural DEC identity; kept distinct from `≡^D` (demote to `≡^D` only when it actually means "defined as"). |
| `≡` | `\equiv` (no overscript) | AMBIGUOUS in source | context-dependent; MUST be disambiguated | depends on the disambiguation (see below) |

> **Collapsed non-sanctioned overscripts (CANON-04, Q2).** `≡^L` (linearization), `≡^Σ` (column-sum), `≡^I` → all read as `≡^D` + a parenthetical naming the operation; none earns a named slot. **Sanctioned relation set = `{ ≡, ≡^D, ≡^F, ≡^R, ≡^ℚ, ≡^d }`.** This file is the **relation arbiter**; the consolidated symbol table / `CANONICAL.md` arbitrate symbols.

### Plain `≡` disambiguation (the untagged relation)

The source uses bare `\equiv` in two closure-adjacent places. Neither is a
proved result; both read as `≡^D`:

- **`SHREVE:102`** — `Π ≡ Π* − Π^{Call(Ω,K)}` — a definitional restatement of the
  hedged portfolio after collecting the option payoff → **read as `≡^D`** (no
  proof obligation).
- **`SHREVE:482`** — `P_{LB-C}(t_0) ≡ BS^{CFMM}(t_0;·)` — **the circular tell.**
  [`./DRAFT.md`](./DRAFT.md):79–84 defines `Π^{LP}(Ω)` AS the payoff set "priced
  by `BS^{CFMM}`", so `A ≡ B` with `B` defined via `A`. This MUST be read as
  `≡^D`, **NOT** a result. It is bounded **out-of-closure → v2 (BRD-04)** in
  [`./PHI_STAR_DEPS.md`](./PHI_STAR_DEPS.md) and recorded as the `✗ CIRCULAR` row
  in [`./NONCIRCULARITY.md`](./NONCIRCULARITY.md).

---

## The `∂_(·,·)` operator family

**General schema:** `∂_{(domain-space, codomain-space)}` denotes a map
`domain-space → codomain-space` indexed by the (source, target) state-space pair.
Concrete instances (all from [`../FEE_PREMIUM.md`](../FEE_PREMIUM.md)):

| Operator | LaTeX | Location | Domain → Codomain | Meaning |
|----------|-------|----------|-------------------|---------|
| `∂_{(Σ,Ω)}` | `\partial_{(\Sigma,\Omega)}` | `FEE_PREMIUM.md:42` | `Σ → Ω` | volatility-event classifier |
| `∂_{(Σ,Ω)}^{-1}` | `\partial_{(\Sigma,\Omega)}^{-1}` | `FEE_PREMIUM.md:50` | `Ω → 2^Σ` | pre-image set `{σ ∈ Σ ∣ ∂_{(Σ,Ω)}σ = ω}` |
| `∂_{(Φ,L)}` | `\partial_{(\Phi,L)}` | `FEE_PREMIUM.md:57` | `L^{(t)}(Ω) → Φ^{(t)}(Ω)` | fee-from-liquidity map |

**Out-of-closure instances covered by the schema.** `cfmm-control/STATE_SPACE.md`
also uses `∂_{(L,·)}`, `∂_{(C^LP,L)}`, `∂_{(Θ(C^LP),L)}`. These are
**out-of-(ii)-closure** (control machinery, not in the `φ̄*` closure) but recur
repo-wide; the general schema `∂_{(domain-space, codomain-space)}` above covers
them without their needing a closure-object glossary line here.

---

## Closure objects

One glossary line per node enumerated in [`./PHI_STAR_DEPS.md`](./PHI_STAR_DEPS.md):
symbol · meaning · value/space · definition `file:line`.

| Symbol | Meaning | Value space / domain | Defined at |
|--------|---------|----------------------|------------|
| `φ̄*` | optimal constant additive base fee (root) | scalar `∈ ℝ` (well-defined iff denominator `≠ 0`) | `SHREVE:1028–1063` |
| `Π^target(T)` | target financing liability | scalar `∈ ℝ`; `= (1+r_f)P_{LB-C}(0) − Π^{LB-C}(T;T)` | `SHREVE:742–746` |
| `P_{LB-C}(t)` | lookback-call financing price | scalar `∈ ℝ`; `≡^F Υ_t` (DEP-01) | `SHREVE:317–326, 489–497, 729–737` |
| `IL(T)` | impermanent loss | scalar `∈ ℝ` | `SHREVE:382–406` |
| `G(t)` | logistic vol/range fee gate | scalar `∈ [0,·)`; logistic in `σ_X(t)`, scaled by `A(t)` | `SHREVE:873–900` |
| `A(t)` | range-imbalance gate | scalar `∈ [0,1]`; uses `ΔX,ΔY,ΔL` | `SHREVE:887–900` |
| `σ_X(t)` | realized volatility (**numerical state variable `x`**) | `∈ ℝ_{≥0}`; strictly-trailing tick-variance window | header [`../IMPLIED_VOLATILITY.md`](../IMPLIED_VOLATILITY.md):19–25; body [`../../lp-derivatives/notes/CFMM_DISCRETE.md`](../../lp-derivatives/notes/CFMM_DISCRETE.md):124–130 (transcription is Plan 03 / WDEF-04) |
| `Δ_X(τ)` | trade-flow increment | per-tick increment; `i_X, Δ_{i_X}` from `CFMM_DISCRETE.md` | DGP `SHREVE:26–80` (existing) |
| `φ_X(t,σ_X;Θ)` | fee surface | scalar; `= φ̄ + G(t)` | `SHREVE:540–578`, `:863–911` |
| `L_K(i_X)` | liquidity distribution function (LDF) | mass over tick index `i_X` (9 properties) | [`./DRAFT.md`](./DRAFT.md):88–119; `ℓ^G` `SHREVE:594–604` (existing) |
| `μ_τ^φ(i_X,σ_X;·)` | fee-weighted measure | **probability measure on `I_X`, domain carries the `A_t ≠ ∅` (denominator `≠ 0`) guard** — this is the DEP-02 well-defined domain; Phase 4 builds `IsProbabilityMeasure` against it | props `SHREVE:356–366`; closed form `μ^{(φ,G)}` `:809–831` |
| `A_t` | active (support) set | `A_t ⊆ I_X`; its non-emptiness `A_t ≠ ∅` IS DEP-02 | `SHREVE:824–831` |
| `⟨L_K,μ_τ^φ⟩`, `⟨ℓ_K,μ_τ^φ⟩` | pairings | scalar expectations under `μ_τ^φ` | `SHREVE:343–406` |
| `Υ_t` | fee revenue | scalar `∈ ℝ`; `= Σ φ_X Δ_X ⟨L_K,μ_τ^φ⟩` | `SHREVE:330–341` |
| `CF_t` | cash flow | scalar `∈ ℝ`; `= Σ[(Υ_τ−Υ_{τ−1}) − (IL_τ−IL_{τ−1})]` | `SHREVE:370–379, 958–963` |
| `ΔL(t)` | endogenous liquidity rule | liquidity increment | `SHREVE:606–628` |
| `Θ`, `A_Θ` | parameter / admissible set | `Θ ∈ A_Θ` (parameter polytope) | `SHREVE:838–859` |

`σ_X(t)`'s full body is **not** transcribed here — that is Plan 03
([`../IMPLIED_VOLATILITY.md`](../IMPLIED_VOLATILITY.md), WDEF-04). This glossary
gives only its line + cross-link.

---

## Closed-under-references fixpoint

For each `defined-in-v1` node, the symbols on the RHS of its definition are read
from the cited `file:line` and each is classified as one of: **(a)** a closure
node already in [`./PHI_STAR_DEPS.md`](./PHI_STAR_DEPS.md), **(b)** a
`defined-in-v1: existing` stop-node, or **(c)** explicitly `out-of-closure`. If a
RHS symbol is none of these, it is a NEWLY-discovered dependency → STOP and flag
(the closure was incomplete).

| Node | RHS symbols (from source) | Classification of each | New symbol? |
|------|---------------------------|------------------------|-------------|
| `φ̄*` (`SHREVE:1028–1063`) | `Π^target`, `IL`, `G`, `Δ_X`, `L_K`, `μ_τ^φ` | all (a) closure nodes | none |
| `Π^target` (`:742–746`) | `r_f`, `P_{LB-C}(0)`, `Π^{LB-C}(T;T)` | `P_{LB-C}` (a); `r_f`, `Π^{LB-C}` (b) primitives (BASE/DGP) | none |
| `P_{LB-C} ≡^F Υ` (`:317–326`) | `Π^{LB-C}(τ)`, `Υ_t` | `Υ_t` (a); `Π^{LB-C}` (b) | none |
| `Υ_t` (`:330–341`) | `φ_X`, `Δ_X`, `⟨L_K,μ_τ^φ⟩` | all (a) | none |
| `CF_t` (`:370–379`) | `Υ_t`, `IL_t` | both (a) | none |
| `IL(T)` (`:382–406`) | `i_X`, `L_K`, reserves | `L_K` (a); `i_X`/reserves (b) existing | none |
| `G(t)` (`:873–900`) | `σ_X(t)`, `A(t)`, `α,β,γ` | `σ_X`, `A(t)` (a); `α,β,γ ∈ Θ` (a, via `Θ`) | none |
| `A(t)` (`:887–900`) | `ΔX`, `ΔY`, `ΔL` | `ΔL` (a); `ΔX,ΔY` (b) reserves existing | none |
| `φ_X` (`:540–578`) | `φ̄`, `G(t)` | `G(t)` (a); `φ̄` is the optimization variable (= `φ̄*` solved) (a) | none |
| `μ_τ^φ` (`:809–831`) | `i_X`, `𝟙_{A_t}`, `Σ_{j_X∈A_t}` | `A_t` (a); `i_X,j_X ∈ I_X` (b) existing | none |
| `A_t` (`:824–831`) | `I_X`, support condition | `I_X` (b) existing | none |
| `⟨L_K,μ_τ^φ⟩` (`:343–406`) | `L_K`, `μ_τ^φ` | both (a) | none |
| `ΔL(t)` (`:606–628`) | reserves, `L_K` | `L_K` (a); reserves (b) existing | none |
| `Θ, A_Θ` (`:838–859`) | parameter components | (a) self / (b) primitive bounds | none |
| `σ_X(t)` (`CFMM_DISCRETE.md:124–130`) | `i_z`, trailing window `[ζ−Z,ζ]` | `i_z` (b) existing (`CFMM_DISCRETE.md:78`) | none |

**Fixpoint verdict: REACHED — no new symbol surfaced.** Every RHS symbol of every
`defined-in-v1` node is a closure node (a), an `existing` stop-node (b), or
`out-of-closure` (c, e.g. the `BS^{CFMM}`/`≡^R` edges already bounded out in the
DAG). The manually-enumerated closure in [`./PHI_STAR_DEPS.md`](./PHI_STAR_DEPS.md)
is therefore closed under references; no transitive dependency was missed.

---

## Note on home

This is the single notation home for `cfmm-options`. A repo-root glossary
promotion (the `≡^D/F/R` overscripts and `∂_(·,·)` family recur repo-wide) is
warranted later but is **out of scope this phase**.
