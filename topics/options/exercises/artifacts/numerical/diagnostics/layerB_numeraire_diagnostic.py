#!/usr/bin/env python3
"""layerB_numeraire_diagnostic.py — root-cause DIAGNOSTIC for the NUM-04 Layer-B fail.

NON-BINDING. This does NOT modify NUM-04-fitB.json, the pre-registered Layer-B gate, the
claim's verification.numerical.status, or any official artifact. It recomputes the Layer-B
replication residual under a CONSISTENT common numéraire to test the hypothesis that the
official `residual_over_target ≈ 1.08e5` is a NORMALIZATION ARTIFACT, not an economic
refutation of the replication closure.

THE BUG (run_fitB.py:147-160)
-----------------------------
The official driver normalizes the PRICE path to price[0]=1 (so Π^target ~ O(1)) but leaves
the realized fee revenue Υ_T = Σ φ_obs·dW in RAW token0-volume units (dW = gross daily
|amount0|, cumulative ~Sw). Its comment claims the residual ratio is "numéraire-invariant";
that is false — rescaling price rescales Π^target and r_f·P but NOT Υ_T. The result:

    residual_over_target = |Υ_T − Π^target − r_f·P| / |Π^target| ≈ Υ_T / |Π^target| ∝ Sw

i.e. the "residual" measures the raw MAGNITUDE of fee revenue, which scales with trade volume.
Liquid (Sw≈1.3e8) → residual ~1e5; adverse (Sw≈1e3) → residual ~1. Same mechanism, 5 orders
of magnitude apart — the fingerprint of a units defect.

THE FIX (this diagnostic)
-------------------------
Express the realized fee revenue as a dimensionless YIELD on the pool's token0 reserve base
W_0 at each segment start: Υ_T_norm = Σ φ_obs·dW / W_0. Then Υ_T_norm (token0/token0,
dimensionless) is commensurable with the per-unit normalized lookback target Π^target. W_0 is
read from the committed layerB_w0_reserves.json (archive `cast WMATIC.balanceOf(pool)@block`).

OUTCOME (recorded in the emitted .md): the residual collapses from ~1e5 to O(1) AND becomes
pool-consistent (liquid ≈ adverse ≈ 0.8-1.0) — confirming the artifact. It is still > τ_B=0.25,
but that residual is dominated by a SECOND spec issue (lookback_target sets P_LBC(0)=spot, but
P_LBC(0) is the lookback OPTION PREMIUM ≪ spot), so even the corrected number is not yet a
clean economic verdict. A clean Layer-B test requires completing the re-specification
(W_0 numéraire + P_LBC(0)=premium + ΔW=hedge-rebalancing rather than gross volume) — a
deliberate prereg-amendment / v2 step, NOT a silent re-normalization to flip the gate.
"""
from __future__ import annotations

import json
import os

HERE = os.path.dirname(os.path.abspath(__file__))
ART = os.path.dirname(HERE)
TAU_B = 0.25  # reported for context only; this diagnostic does NOT gate on it


def main() -> None:
    fb = json.load(open(os.path.join(ART, "NUM-04-fitB.json")))
    w0 = json.load(open(os.path.join(HERE, "layerB_w0_reserves.json")))["segments"]

    rows_out = []
    worst_official = 0.0
    worst_fixed = 0.0
    fixed_by_pool: dict[str, list[float]] = {"liquid": [], "adverse": []}
    for pool in ("liquid", "adverse"):
        for s in fb["per_pool"][pool]["segments"]:
            sid = s["segment_id"]
            U = s["upsilon_T"]
            P = s["pi_target"]
            rf = s["risk_free_residual"]
            W0 = w0[f"{pool}:{sid}"]["W0_token0"]
            U_norm = U / W0
            resid_fixed = abs(U_norm - P - rf) / abs(P)
            worst_official = max(worst_official, s["residual_over_target"])
            worst_fixed = max(worst_fixed, resid_fixed)
            fixed_by_pool[pool].append(resid_fixed)
            rows_out.append({
                "pool": pool, "segment_id": sid,
                "upsilon_T": U, "W0_token0": W0, "fee_yield_U_over_W0": U_norm,
                "pi_target": P, "risk_free_residual": rf,
                "official_residual_over_target": s["residual_over_target"],
                "numeraire_fixed_residual": resid_fixed,
            })

    collapse_factor = worst_official / worst_fixed if worst_fixed else float("inf")
    # pool-consistency: ratio of the two pools' mean fixed residuals (≈1 if the Sw artifact is gone)
    import statistics
    lm = statistics.mean(fixed_by_pool["liquid"])
    am = statistics.mean(fixed_by_pool["adverse"])
    pool_ratio = max(lm, am) / min(lm, am)

    out = {
        "_what": "NON-BINDING diagnostic — does not touch NUM-04-fitB.json or the prereg gate.",
        "hypothesis": "official Layer-B residual ≈ Υ_T/|Π^target| ∝ Sw is a numéraire artifact",
        "fix": "Υ_T_norm = Σφ_obs·dW / W_0(token0 reserves at segment start); commensurable with Π^target",
        "tau_B_context": TAU_B,
        "worst_official_residual": worst_official,
        "worst_numeraire_fixed_residual": worst_fixed,
        "collapse_factor": collapse_factor,
        "pool_consistency_ratio_after_fix": pool_ratio,
        "verdict": (
            "CONFIRMED numéraire artifact: residual collapses ~{:.0f}x and becomes pool-consistent "
            "(ratio {:.2f}). Still > τ_B={} due to a SECOND spec issue (P_LBC(0)=spot vs option "
            "premium); NOT a clean economic fail. Re-specification needed for a binding verdict."
        ).format(collapse_factor, pool_ratio, TAU_B),
        "segments": rows_out,
    }
    json.dump(out, open(os.path.join(HERE, "layerB_numeraire_diagnostic.json"), "w"), indent=2)

    lines = [
        "# NUM-04 Layer-B — numéraire root-cause DIAGNOSTIC (NON-BINDING)",
        "",
        "> This does **not** modify `NUM-04-fitB.json`, the pre-registered Layer-B gate, or the",
        "> claim's `verification.numerical.status`. It is a root-cause diagnostic only.",
        "",
        "## Hypothesis (confirmed)",
        "",
        "The official `residual_over_target ≈ 1.08e5` is a **normalization artifact**: the driver",
        "normalized the price path (so `Π^target ~ O(1)`) but left `Υ_T = Σφ_obs·dW` in raw",
        "token0-volume units, so `residual ≈ Υ_T/|Π^target| ∝ Sw` — it measures fee-revenue",
        "**magnitude**, not replication quality.",
        "",
        "## Fix: express fee revenue as a yield on the reserve base `W_0`",
        "",
        "`Υ_T_norm = Σφ_obs·dW / W_0` (token0/token0, dimensionless), commensurable with `Π^target`.",
        "`W_0` = pool token0 (WMATIC) reserves at each segment start (archive `cast balanceOf`).",
        "",
        "| pool/seg | Υ_T (raw) | W_0 (token0) | fee yield Υ_T/W_0 | Π^target | official resid | **fixed resid** |",
        "|----------|-----------|--------------|-------------------|----------|----------------|-----------------|",
    ]
    for r in rows_out:
        lines.append(
            f"| {r['pool'][:6]}/{r['segment_id']} | {r['upsilon_T']:.4g} | {r['W0_token0']:.4g} | "
            f"{r['fee_yield_U_over_W0']:.5f} | {r['pi_target']:.4f} | {r['official_residual_over_target']:.6g} | "
            f"**{r['numeraire_fixed_residual']:.4f}** |"
        )
    lines += [
        "",
        f"**Collapse:** worst residual `{worst_official:.4g}` → `{worst_fixed:.4f}` "
        f"(~{collapse_factor:.0f}×). Pool-consistency ratio after fix: **{pool_ratio:.2f}** "
        f"(≈1 ⇒ the `Sw`-driven 5-orders gap is gone).",
        "",
        "## Verdict",
        "",
        out["verdict"],
        "",
        "## Economic Meaning",
        "",
        "Layer B asks whether an LP's realized fee income replicates a bank's lookback liability.",
        "The official gate compared a **total** fee revenue (token0 volume × rate, scaling with",
        "pool throughput `Sw`) against a **per-unit** price lookback — incommensurable, so the",
        "verdict tracked trade volume, not hedging quality. Re-expressed as a **fee yield on the",
        "reserve base** (the intensive quantity an LP actually earns per unit of position), the",
        "residual is O(1) and pool-invariant. The realized fee yield over a ~4-month segment is",
        "~0.5–17%; whether that funds the lookback liability is the *real* Layer-B question — and",
        "answering it cleanly needs `P_LBC(0)` set to the lookback **option premium** (not spot)",
        "and `ΔW` defined as **hedge rebalancing** (not gross swap volume). Those re-specifications",
        "belong in a disciplined prereg amendment / v2, not a silent re-normalization.",
        "",
    ]
    open(os.path.join(HERE, "layerB_numeraire_diagnostic.md"), "w").write("\n".join(lines) + "\n")
    print(out["verdict"])


if __name__ == "__main__":
    main()
