#!/usr/bin/env python3
"""build_base_snapshot.py — freeze the BASE-01 apparatus snapshot (Plan 02.1-02 Task 3).

Assembles the content-hashed frozen primitive stack from the orchestrator-side live extraction:
  - L_K(i) tick-liquidity profiles at 12 σ-spanning snapshot blocks/pool, reconstructed from the
    full-history Mint/Burn signed-liquidityNet cumsum (base/extract/LK_profiles.json) and
    CROSS-CHECKED EXACT (24/24) against the pool's own pool.liquidity() at each block;
  - the INDEPENDENT referents: Υ referent = totalFeeGrowth{0,1} day-delta, IL referent =
    token{0,1}.balanceOf reserves (base/extract/rpc_bundle.json) — read raw, disjoint from
    the Σ φ_X·Δ_X·⟨L_K,μ⟩ formula;
  - σ_X (oracle, reused from the NUM-04 extraction), price/tick, current liquidity.

Provenance: Dune query/exec ids + the extraction timestamp; the per-pool mint/burn-event query
(L_K) and the RPC bundle method are recorded. The threshold LOCK + the prereg sha256 anchor are
Plan 03 (the noise floor is derived from THIS data, outcome-blind, then locked BEFORE the single
confirmatory run in Plan 05). This file is the DATA; it asserts nothing about faithfulness.
"""
from __future__ import annotations
import hashlib, json, os

HERE = os.path.dirname(os.path.abspath(__file__))
EX = os.path.join(HERE, "extract")

POOLS = {
    "liquid":  {"address": "0xae81fac689a1b4b1e06e7ef4a2ab4cd8ac0a087d", "role": "primary/liquid (WMATIC/USDC 18/6)",
                "lk_query_id": 7718736, "lk_exec": "01KV21Y3XZ23WX4MET972YEK70", "tick_spacing": 60},
    "adverse": {"address": "0x5cd94ead61fea43886feec3c95b1e9d7284fdef3", "role": "adverse/illiquid stressor",
                "lk_query_id": 7718740, "lk_exec": "01KV220S9CSVP2PS39R2DT7ZRQ", "tick_spacing": 60},
}
EXTRACTION_TS = 1781407000  # data extraction wall-time (UTC epoch); the prereg LOCK (Plan 03) post-dates this


def main() -> None:
    blocks = json.load(open(os.path.join(EX, "snapshot_blocks.json")))
    lk = json.load(open(os.path.join(EX, "LK_profiles.json")))
    rpc = json.load(open(os.path.join(EX, "rpc_bundle.json")))

    pools_out = {}
    n_cross_ok = 0
    n_total = 0
    for name, cfg in POOLS.items():
        rows = []
        for b in blocks[name]:
            B = str(b["block"])
            prof = lk[name][B]
            rb = rpc[name][B]
            n_total += 1
            n_cross_ok += 1 if prof["cross_ok"] else 0
            fg0 = (int(rb["fg0_t"]) - int(rb["fg0_prev"])) if rb["fg0_t"] and rb["fg0_prev"] else None
            fg1 = (int(rb["fg1_t"]) - int(rb["fg1_prev"])) if rb["fg1_t"] and rb["fg1_prev"] else None
            rows.append({
                "block_number": b["block"], "day": b["day"], "timestamp": b["t"],
                "current_tick": b["tick"], "sqrtPriceX96": b["sqrtP"], "sigma_X": b["sigma"],
                # C3/C4: L_K reconstruction, cross-checked EXACT vs pool.liquidity()
                "L_K": {"cross_recon": prof["cross_recon"], "rpc_liquidity": prof["rpc_liquidity"],
                        "cross_ok": prof["cross_ok"], "n_ticks": prof["n_ticks"], "band": prof["band"]},
                # E2 IL referent (independent): reserves
                "reserves": {"token0": rb["reserve0"], "token1": rb["reserve1"]},
                # E1 Υ referent (independent): totalFeeGrowth day-delta (disjoint from Σφ_X·Δ_X·⟨L_K,μ⟩)
                "fee_growth_referent": {"d_totalFeeGrowth0": str(fg0) if fg0 is not None else None,
                                        "d_totalFeeGrowth1": str(fg1) if fg1 is not None else None,
                                        "window_blocks": 41000, "window": "~1 day"},
                "liquidity": rb["liquidity"],
            })
        pools_out[name] = {
            "address": cfg["address"], "role": cfg["role"], "tick_spacing": cfg["tick_spacing"],
            "lk_query_id": cfg["lk_query_id"], "lk_exec": cfg["lk_exec"],
            "n_snapshot_blocks": len(rows), "rows": rows,
        }

    payload = {"schema": "base-01-snapshot/v1", "pools": pools_out,
               "sigma_source": "Algebra V1 getTimepoints archive eth_call (reused from NUM-04 extraction)"}
    text = json.dumps(payload, sort_keys=True, separators=(",", ":"))
    sha = hashlib.sha256(text.encode()).hexdigest()
    with open(os.path.join(HERE, "BASE-series.json"), "w") as f:
        f.write(text)

    snap = {
        "schema": "base-01-snapshot/v1",
        "status": "ok",
        "data_source": "dune:7718736+7718740 (L_K mint/burn) + dune:7717175+7717181 (σ/price reuse) + alchemy-archive-rpc",
        "venue": "QuickSwap-V3-Polygon (Algebra V1)",
        "extraction_ts": EXTRACTION_TS,
        "n_snapshot_blocks_per_pool": 12,
        "sigma_regimes": "12 blocks/pool spanning low/mid/high σ-tertiles (reused NUM-04 oracle σ)",
        "L_K_cross_check": {
            "method": "full-history Mint/Burn signed-liquidityNet cumsum; active_liquidity at current tick == pool.liquidity() archive eth_call",
            "passed": n_cross_ok, "total": n_total, "all_exact": n_cross_ok == n_total,
        },
        "referents": {
            "upsilon": "totalFeeGrowth{0,1}Token day-delta (+ Collect corroboration) — INDEPENDENT of Σφ_X·Δ_X·⟨L_K,μ⟩",
            "il": "token{0,1}.balanceOf(pool) reserves — INDEPENDENT of the L_K-integral IL formula",
            "disjointness": "referents read raw chain state only; base/referents.py imports nothing from base/apparatus.py (test_referents_disjoint)",
        },
        "series_file": "BASE-series.json",
        "series_sha256": sha,
        "lock_note": "Thresholds τ_Υ/τ_IL/θ_G are NOT in this file — derived from THIS data's noise floor (outcome-blind, Plan 03) then sha256-LOCKED before the single confirmatory run (Plan 05). The two-step review (Plan 04) gates that run.",
        "pending_for_confirmatory_run": "per-interval swap stream (tick/price/amount/liquidity/φ_obs) for the Σφ_X·Δ_X·⟨L_K,μ⟩ Υ replay is pulled in Plan 05 (drives apparatus.upsilon on these frozen L_K profiles).",
    }
    with open(os.path.join(HERE, "BASE-snapshot.session.json"), "w") as f:
        json.dump(snap, f, indent=2)
    print(f"BASE snapshot frozen: status=ok  series_sha256={sha[:16]}…")
    print(f"  L_K cross-check: {n_cross_ok}/{n_total} EXACT (all_exact={n_cross_ok==n_total})")
    print(f"  pools: liquid {pools_out['liquid']['n_snapshot_blocks']} blocks, adverse {pools_out['adverse']['n_snapshot_blocks']} blocks")


if __name__ == "__main__":
    main()
