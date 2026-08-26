# SYMB-01 — `φ̄*` first-order condition + closed form (non-forgeable symbolic transcript)

**Check:** the Shreve 1.7(ii) base-fee `φ̄*` is the stationary point of the squared
financing-miss objective `C(φ̄) = (CF_T(φ̄) − Π^target)²`, and its closed form is
`φ̄* = (Π^target + IL − ΣG·ΔW)/ΣΔW`.

**Evidence path:** the `mcp__sympy-mcp__*` tools were NOT in the executor's tool
namespace this run, so the check was driven through the committed Plan-01 driver
`tools/verify_symbolic.sh` over JSON-RPC against the live
`cfmm/sympy-mcp-stdio:latest` container. The driver — not the executor — authored
the value lines (stdout → committed `SYMB-01.raw`) and the binding session log
(`SYMB-01.session.json`: raw JSON-RPC responses + `docker inspect` image digest +
`date -u` driver-stamped timestamp). No value line below was hand-typed.

## Substrate (scalar affine surrogate, RESEARCH §"φ̄* — LIVE-VERIFIED")

The indexed sums in the SHREVE:1044–1063 closed form are *constants* w.r.t. the
optimization variable `φ̄`. SHREVE:970–981 already collapses the cash flow to the
affine form `CF_T(φ̄) = φ̄·ΣΔW + ΣG·ΔW − IL`. Introducing the scalar symbols
`Sw := ΣΔW`, `Gw := ΣG·ΔW`, `IL`, `PItar := Π^target`, the objective is
`C = (phibar·Sw + Gw − IL − PItar)²`. The FOC algebra is identical to the fully
indexed form; the indexed structure adds no algebraic content the derivative
depends on.

## Input call-sequence

`calls/symb01.jsonl` (INPUT only, no expected outputs embedded): `reset_state` →
`intro_many{phibar,Sw,Gw,IL,PItar : real}` → `introduce_expression` of the squared
objective → `differentiate_expression(expr_0, var_name=phibar)` →
`print_latex_expression(expr_1)` (the FOC VALUE) →
`solve_algebraically(expr_1, solve_for_var_name=phibar)` (the solve-set VALUE).

Note on the value-extraction chain: this container's `solve_algebraically` returns
the LaTeX solution-set string **directly** as its own printer artifact (it does not
mint a re-printable handle), so the solve line IS the non-forgeable printer output.
The differentiated FOC value is extracted via the mandated
`print_latex_expression(<handle>)` call on `expr_1`.

## Tool transcript (sympy-mcp, 2026-06-13, image cfmm/sympy-mcp-stdio:latest)

Driver-emitted `SYMB-01.raw`, verbatim (pasted, not retyped):

```
reset_state {} -> State reset successfully. All variables, functions, expressions, and other objects have been cleared.
intro_many {phibar,Sw,Gw,IL,PItar} -> {'phibar': 'phibar', 'Sw': 'Sw', 'Gw': 'Gw', 'IL': 'IL', 'PItar': 'PItar'}
introduce_expression "(phibar*Sw + Gw - IL - PItar)**2" -> expr_0
differentiate_expression expr_0 var_name=phibar -> expr_1
print_latex_expression expr_1 -> 2 Sw \left(Gw - IL - PItar + Sw \bar{\phi}\right) (where Gw is commutative, complex, extended_real, finite, hermitian, real; IL is commutative, complex, extended_real, finite, hermitian, real; PItar is commutative, complex, extended_real, finite, hermitian, real; Sw is commutative, complex, extended_real, finite, hermitian, real; phibar is commutative, complex, extended_real, finite, hermitian, real)
solve_algebraically expr_1 solve_for_var_name=phibar -> \left\{\frac{- Gw + IL + PItar}{Sw}\right\}
```

- The FOC `print_latex_expression expr_1` line is the differentiated objective
  `dC/dφ̄ = 2 Sw (Gw − IL − PItar + Sw·φ̄)` — i.e. the SHREVE:995–1010 FOC
  `2(CF_T − Π^target)·∂Υ/∂φ̄`. Contains the literal `2 Sw`.
- The `solve_algebraically` line is the non-forgeable solution set
  `\left\{\frac{- Gw + IL + PItar}{Sw}\right\}` — SHREVE:1044.

The trailing `(where ...; ...)` per-symbol assumption annotation is emitted by the
driver in **sorted** clause order so the transcript line reproduces byte-for-byte
across runs (sympy emits the clauses in non-deterministic Python set-iteration
order; the driver canonicalizes the printed transcript while leaving the raw
JSON-RPC responses in `SYMB-01.session.json` verbatim). This is what makes the
Wave-3 byte-diff gate and the per-plan self-verify deterministic.

## Provenance

From the COMMITTED binding `SYMB-01.session.json` (driver-stamped, not forgeable):

- image: `cfmm/sympy-mcp-stdio:latest`
- image_digest: `sha256:615982a1f4ef32159d90deb22d9f3aba2e191922dc76b7b2f5930a88e1a2033e` (`docker inspect --format '{{.Id}}'`)
- run_timestamp_utc: `2026-06-13T16:33:16Z` (`date -u +%FT%TZ`, stamped inside the driver)
- n_responses: 7 (init + 6 tools/call, verbatim)

## Reading

`φ̄* = (Π^target + IL − ΣG·ΔW)/ΣΔW` under the NOTATION symbol map
`Sw := ΣΔW`, `Gw := ΣG·ΔW`, `PItar := Π^target`, `IL`. Re-expanding the solve-set
`(−Gw + IL + PItar)/Sw` with `Gw = ΣG·ΔW`, `Sw = ΣΔW` IS exactly the SHREVE:1044
closed form. The single denominator `Sw = ΣΔW` is the well-definedness proviso
(SHREVE:1071–1077) and the DEP-02 zero-locus (`Sw = 0 ⇔ A_t = ∅`).

## Confirms

- `cfmm-options/EXERCISES/SHREVE_EXERCISES.md:1028–1066` (closed form) via the FOC
  substrate `SHREVE:995–1027`.
- The denominator-equals-`Sw` linkage to DEP-02 (`A_t ≠ ∅`) recorded in
  `cfmm-options/notes/NOTATION.md:85` and confirmed in `DEP-01-financing.md`.
