# DEP-03 — EXOGENITY hypothesis `∂Π^target/∂Θ = 0`

## Determination

DEP-03 is the **EXOGENITY assumption** `∂Π^target(T)/∂Θ = 0` (equivalently
`ΔΠ^target/ΔΘ = 0`), stated verbatim at SHREVE_EXERCISES.md:761–769 ("Assume the bank does its
hedging externally"). It is a **granted modeling side-condition**, not an algebraic identity with
an LHS and an RHS to reconcile. Its content is: "treat the target financing liability
`Π^target(T)` as **exogenous** to the fee-parameter vector `Θ`," so that the `φ*` optimization may
take `Π^target` as a reviewed scalar input. That is *assumed*, not *derived*.

There is therefore **nothing for sympy-mcp to confirm**. Manufacturing a symbolic check — e.g.
declaring `PItar` as a symbol independent of `theta` and then running `diff(PItar, theta) = 0` —
would launder the granted assumption into a "verified" result: the `0` would be a foregone
consequence of the independence we typed in, carrying no verification content. That is exactly
the **Pitfall-1/5 trap** (proof-of-a-vacuous/circular statement) the project's pitfalls warn
against (01-RESEARCH.md §"Pitfall 5: Manufacturing a DEP-03 artifact"). No container call was
made for DEP-03, and that absence is the correct, honest state.

## Recorded outcome

DEP-03: no symbolic rung — carried as a reviewed hypothesis to Phase 4. The EXOGENITY assumption
`∂Π^target/∂Θ = 0` is the explicit reviewed side-condition ON the `φ*` statement (FORMAL-01
fidelity rubric, DEP-03 formal rung). It has no clean algebra to check; its symbolic-tier status
is recorded `no-symbolic-rung` (the ladder token), not `pass`.

(MAJOR-4: the ladder token is `no-symbolic-rung`, never the banned-placeholder token. This
artifact deliberately carries no sympy-mcp transcript and no image-provenance line — there was no
run, and recording one would be fabrication.)

## Confirms

- SHREVE_EXERCISES.md:761–769 — the EXOGENITY assumption `∂Π^target/∂Θ = 0`.
- cfmm-options/notes/PHI_STAR_DEPS.md — DEP-03 obligation = the granted reviewed side-condition
  on the `φ*` statement (Re-scoping finding step 5; bounded obligation set DEP-03).
- ROADMAP Phase-1 criterion 4 — the explicit "no symbolic rung — reviewed hypothesis carried to
  Phase 4" recording requirement.

## Economic Meaning

The EXOGENITY hypothesis is the **separation of the bank's hedging book from the pool's fee
policy**. `Π^target(T)` is the liability the protocol must finance (the bank's external hedge
target); `Θ` is the fee-architecture parameter vector the LP/protocol controls. Setting
`∂Π^target/∂Θ = 0` declares that **tuning the pool's fees does not move the hedging target** — the
bank hedges externally, so the liability is a fixed scalar the base-fee `φ*` must amortize against
swap volume, not a quantity that feeds back through the pool's own fee schedule. Economically this
is the assumption that the LP is a **price-taker on the liability**: the replication problem is to
choose `φ̄` so cumulative fee cash-flow matches an exogenously-given target, with no
endogenous-liability feedback loop. It is a modeling boundary, not a market identity — hence no
symbolic content, and it is carried to Phase 4 as the reviewed hypothesis ON the statement being
formalized (so the Lean theorem proves `φ*` correct *under* EXOGENITY, with the assumption
explicit in the statement, never silently discharged).
