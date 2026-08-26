# NUM-04 Layer-B — numéraire root-cause DIAGNOSTIC (NON-BINDING)

> This does **not** modify `NUM-04-fitB.json`, the pre-registered Layer-B gate, or the
> claim's `verification.numerical.status`. It is a root-cause diagnostic only.

## Hypothesis (confirmed)

The official `residual_over_target ≈ 1.08e5` is a **normalization artifact**: the driver
normalized the price path (so `Π^target ~ O(1)`) but left `Υ_T = Σφ_obs·dW` in raw
token0-volume units, so `residual ≈ Υ_T/|Π^target| ∝ Sw` — it measures fee-revenue
**magnitude**, not replication quality.

## Fix: express fee revenue as a yield on the reserve base `W_0`

`Υ_T_norm = Σφ_obs·dW / W_0` (token0/token0, dimensionless), commensurable with `Π^target`.
`W_0` = pool token0 (WMATIC) reserves at each segment start (archive `cast balanceOf`).

| pool/seg | Υ_T (raw) | W_0 (token0) | fee yield Υ_T/W_0 | Π^target | official resid | **fixed resid** |
|----------|-----------|--------------|-------------------|----------|----------------|-----------------|
| liquid/0 | 1.07e+05 | 1.017e+06 | 0.10521 | 0.9896 | 108164 | **0.9087** |
| liquid/1 | 4.263e+04 | 4.277e+05 | 0.09969 | 0.4998 | 85305.1 | **0.8295** |
| liquid/2 | 1.891e+04 | 4.77e+05 | 0.03965 | 0.6449 | 29329.6 | **0.9616** |
| advers/0 | 0.04553 | 10.71 | 0.00425 | 0.7263 | 0.964282 | **1.0211** |
| advers/1 | 1.772 | 12.34 | 0.14361 | 0.9065 | 0.934414 | **0.8624** |
| advers/2 | 1.836 | 10.49 | 0.17503 | 0.8374 | 1.16027 | **0.8238** |

**Collapse:** worst residual `1.082e+05` → `1.0211` (~105927×). Pool-consistency ratio after fix: **1.00** (≈1 ⇒ the `Sw`-driven 5-orders gap is gone).

## Verdict

CONFIRMED numéraire artifact: residual collapses ~105927x and becomes pool-consistent (ratio 1.00). Still > τ_B=0.25 due to a SECOND spec issue (P_LBC(0)=spot vs option premium); NOT a clean economic fail. Re-specification needed for a binding verdict.

## Economic Meaning

Layer B asks whether an LP's realized fee income replicates a bank's lookback liability.
The official gate compared a **total** fee revenue (token0 volume × rate, scaling with
pool throughput `Sw`) against a **per-unit** price lookback — incommensurable, so the
verdict tracked trade volume, not hedging quality. Re-expressed as a **fee yield on the
reserve base** (the intensive quantity an LP actually earns per unit of position), the
residual is O(1) and pool-invariant. The realized fee yield over a ~4-month segment is
~0.5–17%; whether that funds the lookback liability is the *real* Layer-B question — and
answering it cleanly needs `P_LBC(0)` set to the lookback **option premium** (not spot)
and `ΔW` defined as **hedge rebalancing** (not gross swap volume). Those re-specifications
belong in a disciplined prereg amendment / v2, not a silent re-normalization.

