# DEP-01 — `≡^F` financing identity (non-forgeable symbolic transcript)

**Check:** the `≡^F` financing identity
`P_{LB-C}(t) ≡^F Σ_{τ}[Π^{LB-C}(τ) − Π^{LB-C}(τ−1)] ≡^F Υ_t` (SHREVE:317–341).
The two legs coincide because (a) the fee surface decomposes `φ_X = φ̄ + G`, so the
revenue `Υ_T = Σ(φ̄+G)ΔW = φ̄·Sw + Gw` (SHREVE:949–956 — the PRIMARY identity), and
(b) the incremental-fee sum telescopes to the terminal cumulative fee
(DRAFT.md:141–155).

**Evidence path:** the `mcp__sympy-mcp__*` tools were NOT in the executor's tool
namespace this run, so the check was driven through the committed Plan-01 driver
`tools/verify_symbolic.sh` over JSON-RPC against the live
`cfmm/sympy-mcp-stdio:latest` container. The driver authored the value lines
(stdout → committed `DEP-01.raw`) and the binding session log
(`DEP-01.session.json`). No value below was hand-typed; each `0` is the container's
`simplify_expression` result extracted via `print_latex_expression(<handle>)`.

## Substrate

**Increment surrogate** (RESEARCH Open Question 3; DRAFT.md:141), NOT the full
`Π^{LB-C}` cumulative payoff: the `≡^F` identity depends only on (i) the linearity
of the `(φ̄+G)`-weighted revenue in the per-step weights `ΔW(τ)` and (ii) the
telescoping of the per-step fee increments. Modeling the full cumulative payoff
`Π^{LB-C}(τ)` adds no algebraic content the identity rests on, so the surrogate is
faithful to the obligation while keeping the cancellation auditable. This is the
increment surrogate (not the full `Π^{LB-C}`). Both residuals
below are introduced in NON-collapsed form (distinct interior terms written out) so
the tool — not the author — performs the cancellation; an already-collapsed
`(p_T−p_0)−(p_T−p_0)` would prove nothing and is deliberately avoided.

## Input call-sequence

`calls/dep01.jsonl` (INPUT only): `reset_state` then two independent zero-residual
checks, each `intro_many → introduce_expression(<non-collapsed residual>) →
simplify_expression → print_latex_expression(<handle>)`.

## Primary check — leg-coincidence (`Υ_T = φ̄·Sw + Gw`)

A genuine (non-collapsed) two-step revenue sum with the fee already decomposed
`φ_X(τ) = φ̄ + G(τ)`: `Υ_T = (φ̄+G1)·W1 + (φ̄+G2)·W2`. The claimed closed form is
`φ̄·Sw + Gw` with `Sw = W1+W2` and `Gw = G1·W1 + G2·W2`. The residual
`Υ_T − (φ̄·Sw + Gw)` is introduced with the legs written out distinctly; the tool
distributes and cancels.

Driver-emitted `DEP-01.raw` lines (verbatim):

```
intro_many {phibar,G1,G2,W1,W2} -> {'phibar': 'phibar', 'G1': 'G1', 'G2': 'G2', 'W1': 'W1', 'W2': 'W2'}
introduce_expression "((phibar + G1)*W1 + (phibar + G2)*W2) - (phibar*(W1 + W2) + (G1*W1 + G2*W2))" -> expr_0
simplify_expression expr_0 -> expr_1
print_latex_expression expr_1 -> 0
```

The simplified residual's VALUE is `0` (via the `simplify → print_latex_expression`
chain). This witnesses the SHREVE:949–956 step: after substituting `φ_X = φ̄ + G`
into `Υ_T = Σ φ_X·ΔW`, the revenue equals `φ̄·ΣΔW + ΣG·ΔW = φ̄·Sw + Gw`. The `Sw`
that appears here is the SAME denominator that defines `φ̄*` in `SYMB-01-phistar.md`.

## Secondary check — telescoping (non-collapsed)

The bare incremental-fee sum `Σ_{τ}[p(τ) − p(τ−1)]` written out as the distinct
increments `(p1−p0) + (p2−p1) + (p3−p2)`, minus its claimed collapse `(p3−p0)`. The
interior terms `p1, p2` are present on BOTH sides only via the residual the tool
must cancel — they are not pre-removed.

```
intro_many {p0,p1,p2,p3} -> {'p0': 'p0', 'p1': 'p1', 'p2': 'p2', 'p3': 'p3'}
introduce_expression "((p1 - p0) + (p2 - p1) + (p3 - p2)) - (p3 - p0)" -> expr_2
simplify_expression expr_2 -> expr_3
print_latex_expression expr_3 -> 0
```

The simplified residual's VALUE is `0`: the interior partial-sums `p1` and `p2`
cancel (`−p1+p1 = 0`, `−p2+p2 = 0`), leaving `(p3 − p0) − (p3 − p0) = 0`. With the
inception condition `p0 = π_X(t0−1) = 0` (DRAFT.md:154, no fee accrued before
inception) the cumulative fee reduces to the terminal `p3 = π_X(T)`.

## Provenance

From the COMMITTED binding `DEP-01.session.json` (driver-stamped, not forgeable):

- image: `cfmm/sympy-mcp-stdio:latest`
- image_digest: `sha256:615982a1f4ef32159d90deb22d9f3aba2e191922dc76b7b2f5930a88e1a2033e` (`docker inspect --format '{{.Id}}'`)
- run_timestamp_utc: `2026-06-13T16:36:16Z` (`date -u +%FT%TZ`, stamped inside the driver)
- n_responses: 10 (init + 9 tools/call, verbatim)

The driver also canonicalizes any `(where ...)` assumption annotation to sorted
order so the transcript reproduces byte-for-byte; the `0` lines here carry no
annotation.

## Reading

The `≡^F` financing identity
`P_{LB-C}(t) ≡^F Σ[Π(τ) − Π(τ−1)] ≡^F Υ_t` holds: both zero-residuals vanish, so
the cumulative-increment leg and the revenue leg coincide
(`Υ_T = φ̄·Sw + Gw`, telescoped fee `= π_X(T)`).

## Confirms

- `cfmm-options/EXERCISES/SHREVE_EXERCISES.md:317–341` (`≡^F` statement),
  `:949–956` (leg-coincidence `Υ_T = Σ(φ̄+G)ΔW = φ̄·Sw + Gw`).
- `cfmm-options/notes/DRAFT.md:141–155` (per-step incremental-fee telescoping,
  `p0 = 0` inception).
- `cfmm-options/notes/NOTATION.md:27` (`≡^F` = DEP-01 financing identity proof
  obligation), `:83` (`φ_X = φ̄ + G`).
