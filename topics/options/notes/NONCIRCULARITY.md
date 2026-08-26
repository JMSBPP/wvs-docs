# Non-Circularity — acyclicity audit of every financing/replication identity (WDEF-05)

**Artifact:** the standalone non-circularity table demanded by WDEF-05 (its OWN
file — not inline comments). One row per `≡^F`/`≡^R` identity in the repo
closure, identified by its **specific `file:line` location**, with both sides'
definition locations and an acyclicity verdict.

**Provenance:** every row is enumerated in the gate-zero DAG
[`./PHI_STAR_DEPS.md`](./PHI_STAR_DEPS.md) (SHA `aeafc10`); this file is committed
strictly AFTER it. Sources: [`../EXERCISES/SHREVE_EXERCISES.md`](../EXERCISES/SHREVE_EXERCISES.md)
(`= SHREVE`), [`./FIXED_INCOME.md`](./FIXED_INCOME.md), [`./DRAFT.md`](./DRAFT.md).

**Top note (the WDEF-05 claim).** The table is **exhaustive** over repo `≡^F`
(7 locations) and `≡^R` (10 locations) = **17 identity rows**, plus the
`BS^{CFMM}` circular row. The ONLY row marked circular is `BS^{CFMM}`, and it
is `out-of-closure` (v2 BRD-04). Therefore **NO in-closure identity is circular —
WDEF-05 satisfied.** The mechanical guard
`grep 'CIRCULAR' NONCIRCULARITY.md | grep -v 'out-of-closure'` is empty; the
per-row ✓/✗ acyclicity verdict is recorded by hand in `00-02-SUMMARY.md`.

**Extended (FOUND-04, Phase 8 — graph-native re-grounding).** Three re-grounded
`cfmm-discrete/` operators are added below — `\mathbf{w}_{ij}` (via the Iverson `[i=j]`
pairing primitive), the discrete-Itô `σ=σ_X` (via the exogenous oracle datum), and
`**d** := ∂ᵗ` (via the simplicial boundary). Each is **defined via primitive data**, none
via a quantity itself defined via that operator → all ✓ acyclic, so the guard stays empty.

---

## `≡^F` financing-identity family (7 locations — in-closure → DEP-01)

All 7 are the `P_{LB-C} ≡^F Υ` self-financing identity. RHS `Υ_t` (`SHREVE:330–341`)
is defined from `φ_X`, `Δ_X`, `⟨L_K,μ_τ^φ⟩` — **none of which mention `P_{LB-C}`** —
so the financing identity is acyclic.

| Identity (file:line) | LHS def location | RHS def location | Acyclic? (✓/✗ + note) | In-closure? |
|----------------------|------------------|------------------|------------------------|-------------|
| `P_{LB-C} ≡^F Σ(Π^{LB-C}(τ)−Π^{LB-C}(τ−1))` — SHREVE:319 | `P_{LB-C}` SHREVE:317 | `Π^{LB-C}` increment (BASE/DGP) | ✓ — `Π^{LB-C}` increments do not reference `P_{LB-C}` | in-closure (DEP-01) |
| `… ≡^F Υ_t` (2nd link) — SHREVE:325 | `P_{LB-C}` SHREVE:317 | `Υ_t` SHREVE:330–341 | ✓ — `Υ_t` def uses only `φ_X,Δ_X,⟨L_K,μ⟩` | in-closure (DEP-01) |
| `P_{LB-C} ≡^F Σ(…)` (since-block) — SHREVE:490 | `P_{LB-C}` SHREVE:480 | `Π^{LB-C}` increment (BASE/DGP) | ✓ — increments acyclic | in-closure (DEP-01) |
| `… ≡^F Υ(t;·)` (since-block) — SHREVE:496 | `P_{LB-C}` SHREVE:480 | `Υ` SHREVE:330–341 | ✓ — `Υ` def free of `P_{LB-C}` | in-closure (DEP-01) |
| `P_{LB-C}(t;Θ) ≡^F Σ(…)` — SHREVE:730 | `P_{LB-C}` SHREVE:729 | `Π^{LB-C}` increment (BASE/DGP) | ✓ — increments acyclic | in-closure (DEP-01) |
| `… ≡^F Υ(t;Θ)` — SHREVE:736 | `P_{LB-C}` SHREVE:729 | `Υ(t;Θ)` SHREVE:330–341 | ✓ — `Υ` def free of `P_{LB-C}` | in-closure (DEP-01) |
| `P_{LP-C}(t) ≡^F≤ Υ(t;Θ)` (inequality variant `\overset{F}{\leq}`) — SHREVE:753 | `P_{LP-C}` SHREVE:729–746 | `Υ(t;Θ)` SHREVE:330–341 | ✓ — bound, RHS `Υ` free of `P_{LP-C}`; acyclic | in-closure (DEP-01) |

---

## `≡^R` LP-replication family (10 locations — out-of-closure → v2 BRD-03)

Section-(iii) static-replication identities. The EXOGENITY bound keeps them OUT
of the (ii) closure; listed here so the audit is exhaustive over repo `≡^R`
(Open Question 3). Unproved → v2 BRD-03; no in-closure acyclicity claim is made
on them.

| Identity (file:line) | LHS def location | RHS def location | Acyclic? (✓/✗ + note) | In-closure? |
|----------------------|------------------|------------------|------------------------|-------------|
| `≡^R` LP-replication — SHREVE:1103 | SHREVE:1090+ payoff | SHREVE:1090 "by LP replication theorem" (unproved) | n/a — out-of-closure (v2 BRD-03) | out-of-closure |
| `≡^R` — SHREVE:1116 | SHREVE:1090+ | LP-replication (unproved) | n/a — out-of-closure (v2 BRD-03) | out-of-closure |
| `≡^R` — SHREVE:1141 | SHREVE:1090+ | LP-replication (unproved) | n/a — out-of-closure (v2 BRD-03) | out-of-closure |
| `≡^R` — SHREVE:1260 | SHREVE:1090+ | LP-replication (unproved) | n/a — out-of-closure (v2 BRD-03) | out-of-closure |
| `≡^R` — SHREVE:1275 | SHREVE:1090+ | LP-replication (unproved) | n/a — out-of-closure (v2 BRD-03) | out-of-closure |
| `≡^R` — SHREVE:1311 | SHREVE:1090+ | LP-replication (unproved) | n/a — out-of-closure (v2 BRD-03) | out-of-closure |
| `≡^R` — SHREVE:1386 | SHREVE:1090+ | LP-replication (unproved) | n/a — out-of-closure (v2 BRD-03) | out-of-closure |
| `≡^R` — SHREVE:1430 | SHREVE:1090+ | LP-replication (unproved) | n/a — out-of-closure (v2 BRD-03) | out-of-closure |
| `≡^R` — SHREVE:1467 | SHREVE:1090+ | LP-replication (unproved) | n/a — out-of-closure (v2 BRD-03) | out-of-closure |
| `π^{ZCB-Perp} ≡^R P_{π^{ZCB-Perp}}` — FIXED_INCOME.md:59 | FIXED_INCOME.md:55+ | static replication (unproved) | n/a — out-of-closure (v2 BRD-03) | out-of-closure |

---

## The circular row (plain `≡` — the Pitfall-5 artifact)

| Identity (file:line) | LHS def location | RHS def location | Acyclic? (✓/✗ + note) | In-closure? |
|----------------------|------------------|------------------|------------------------|-------------|
| `P_{LB-C}(0) ≡ BS^{CFMM}` (plain `≡`) — SHREVE:482 | `P_{LB-C}` SHREVE:480 | `BS^{CFMM}` + `Π^{LP}(Ω)` DRAFT.md:79–84 | **✗ CIRCULAR** — DRAFT.md:79–84 defines `Π^{LP}(Ω)` AS "priced by `BS^{CFMM}`", so `A ≡ B` with `B` defined via `A`; demote to `≡^D`, never a result | **out-of-closure** → v2 BRD-04 |

This is the concrete artifact Pitfall-5 demands: the row documents *why* the
`BS^{CFMM}` edge is re-scoped out of the (ii) closure. It is marked BOTH
`✗ CIRCULAR` AND `out-of-closure`, so the mechanical guard
`grep CIRCULAR | grep -v out-of-closure` is empty — **no in-closure row is
circular.**

---

## cfmm-discrete re-grounded operators (FOUND-04 — Phase 8, graph-native)

The operators re-grounded in the v2.1 graph-native pivot, each **defined via PRIMITIVE
data** — none via a quantity itself defined via that operator, so the table stays acyclic
by construction.

| Operator (file) | Defined via (primitive datum) | Defines | Acyclic? (✓ + note) | In-closure? |
|-----------------|-------------------------------|---------|---------------------|-------------|
| `\mathbf{w}_{ij}` incidence weight — `cfmm-discrete/INTEGRATION.md` | the idempotent pairing primitive `∫_{\mathbf{e}_i}\mathbf{e}_j=\mathbf{w}_{ij}`; unweighted limit Iverson `[i=j]` | the weighted/Markov DEC pairing on the node graph | ✓ — `\mathbf{w}_{ij}` defined via the pairing / Iverson datum, not via itself | in-closure |
| discrete-Itô `σ` (`= σ_X`) — `cfmm-discrete/BINARY_TREES.md`, `FINANCE.md` | the EXOGENOUS on-chain oracle volatility `σ_X = ln λ/√Δt` (tick-spacing datum) | the diffusion coefficient in the discrete heat/BS operator `∂_t+½σ²∂²_i` | ✓ — `σ` IS the exogenous `σ_X` datum, not defined via the Itô operator | in-closure |
| **d** := ∂ᵗ coboundary — `cfmm-discrete/DIFFERENTIATION.md` | the simplicial boundary operator `∂` (transpose) | the discrete exterior derivative on 0-/1-forms | ✓ — `**d**` defined via the primitive boundary `∂`, not via itself | in-closure |

All three are **in-closure** and **✓ acyclic**; none is flagged `✗` — the guard `grep CIRCULAR | grep -v out-of-closure` stays empty.
