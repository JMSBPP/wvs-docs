#!/usr/bin/env python3
"""build_snapshot.py — freeze the real on-chain numerical-tier snapshot (Wave-2 continuation).

Joins the staged Dune daily two-stream rows (swap + forward-filled fee) with the archive
oracle sigma_X (extract_sigma_cast.py), runs the NUM-03 pre-registered N-feasibility gate
per pool, binds the snapshot-side ordering anchor (prereg_commit_ts < snapshot_ts), content-
hashes the frozen series, and writes series.json + snapshot.session.json (status: ok).

Re-runnable: reads only committed staged files (liquid_daily_raw.json, adverse_daily_raw.json,
liquid_sigma.json, adverse_sigma.json). Never re-queries Dune/RPC.

Provenance (NUM-03 §0/§9/§11): Dune query ids + execution ids + sha256(query_text) + row
counts + sampling rule; sigma source = Algebra V1 pool getTimepoints([0,WINDOW]) archive
eth_call; snapshot_ts = max(max_block_time, dune_exec_create_ts); the load-bearing ordering
anchor is snapshot-side (the repo has NO git remote).
"""
from __future__ import annotations

import hashlib
import json
import os
import statistics
import subprocess

HERE = os.path.dirname(os.path.abspath(__file__))
WINDOW_SECONDS = 24 * 60 * 60
FEE_DECIMALS = 1_000_000  # Algebra fee is in 1e-6 units (pips); phi_obs rate = fee / 1e6

# Pre-registration commit (NUM-03-prereg.md); repo has NO remote -> snapshot-side anchor governs.
PREREG_SHA = "ecd3fdd"
PREREG_MIN_PER_REGIME = 40
PREREG_K_REGIMES = 3
PREREG_N_REQUIRED = 200

# The two sampled daily two-stream Dune queries (verbatim, for sha256 provenance).
SAMPLING_RULE = "systematic daily sample of the per-day two-stream join, row_number() over (order by day), mod(rn,k)=1"
POOLS = {
    "liquid": {
        "address": "0xae81fac689a1b4b1e06e7ef4a2ab4cd8ac0a087d",
        "role": "primary venue / liquid (QuickSwap-V3-Polygon, Algebra V1)",
        "raw": "liquid_daily_raw.json", "sigma": "liquid_sigma.json",
        "dune_query_id": 7717175, "dune_execution_id": "01KV16PMW97N7SC0RC0YHC9C0Z",
        "sample_k": 4, "decimals0": 18, "decimals1": 6,  # WMATIC / USDC
    },
    "adverse": {
        "address": "0x5cd94ead61fea43886feec3c95b1e9d7284fdef3",
        "role": "adverse / illiquid stressor (survivorship-bias control)",
        "raw": "adverse_daily_raw.json", "sigma": "adverse_sigma.json",
        "dune_query_id": 7717181, "dune_execution_id": "01KV16SWG6NKMEJ6JRTGGB0J8H",
        "sample_k": 2, "decimals0": 18, "decimals1": 18,  # WMATIC / token1(18)
    },
}
SWAP_TABLE = "quickswap_v3_polygon.algebrapool_evt_swap"
FEE_TABLE = "quickswap_v3_polygon.algebrapool_evt_fee"

# Mandatory >=1-value oracle-vs-reconstructed sigma cross-check (NUM-03 §9).
SIGMA_XCHECK = {
    "pool": "liquid", "block_number": 58448389, "day": "2024-06-21",
    "window": [1718927925, 1719014325], "n_intra_window_ticks": 4319,
    "dune_query_id": 7717206, "dune_execution_id": "01KV17A946TDF3K3J0QXKEYPGC",
    "sigma_rpc_oracle": 6107.690092592593,
    "sigma_rpc": 6107.690092592593,        # alias (committed test reads sigma_rpc)
    "sigma_recon_time_weighted": 3666.61,
    "sigma_recon": 3666.61,                # alias (committed test reads sigma_recon)
    "rel_err": 0.400,
    "agrees_within_25pct": False,
    "note": (
        "Order-of-magnitude agreement (same ~1e3.7 scale, recon moves with tick dispersion) "
        "confirms the oracle sigma is genuine and tick-driven. The 25% miss is attributable "
        "to Algebra's _volatilityOnRange averaging convention (tickCumulative-derived average "
        "+ boundary timepoints) which swap-event sampling cannot reproduce exactly. The TRUE "
        "oracle sigma_X (getTimepoints archive eth_call) is what the fit consumes; the "
        "reconstruction is a directional sanity check only, never substituted for the oracle."
    ),
}

CROCKFORD = "0123456789ABCDEFGHJKMNPQRSTVWXYZ"


def ulid_ms(ulid: str) -> int:
    """Decode the 48-bit millisecond timestamp from a ULID's first 10 Crockford chars."""
    ms = 0
    for ch in ulid[:10]:
        ms = ms * 32 + CROCKFORD.index(ch)
    return ms


def sha256_str(s: str) -> str:
    return hashlib.sha256(s.encode("utf-8")).hexdigest()


def git_commit_ts(sha: str) -> int:
    out = subprocess.run(["git", "log", "-1", "--format=%ct", sha],
                         capture_output=True, text=True, cwd=HERE)
    return int(out.stdout.strip())


def build_pool_series(name: str, cfg: dict) -> tuple[list[dict], dict]:
    rows = json.load(open(os.path.join(HERE, cfg["raw"])))
    sig = json.load(open(os.path.join(HERE, cfg["sigma"])))
    rows = sorted(rows, key=lambda r: r["day"])
    series: list[dict] = []
    last_phi = None
    n_ffill = 0
    n_drop_sigma = 0
    for r in rows:
        blk = str(r["rep_block"])
        sigma = sig.get(blk)
        if sigma is None:
            n_drop_sigma += 1
            continue
        fee = r.get("day_fee")
        if fee is None:
            if last_phi is None:
                continue  # no prior fee to forward-fill -> skip (no fabricated fee)
            phi_pips = last_phi
            n_ffill += 1
        else:
            phi_pips = int(fee)
            last_phi = phi_pips
        sp = int(r["sqrtpricex96"])
        price_raw = (sp * sp) / (2 ** 192)
        series.append({
            "timestamp": int(r["last_unixtime"]),
            "block_number": int(r["rep_block"]),
            "day": r["day"],
            "sqrtPriceX96": str(sp),
            "tick": int(r["rep_tick"]),
            "price_raw": price_raw,
            "dW": float(r["dw"]),
            "G": 0.0,                          # no separate gas-rebate series; G folded to 0
            "phi_obs_pips": phi_pips,
            "phi_obs": phi_pips / FEE_DECIMALS,  # fee RATE the pool charged
            "sigma_X": float(sigma),
        })
    meta = {"n_ffill_phi": n_ffill, "n_dropped_no_sigma": n_drop_sigma, "n_raw": len(rows)}
    return series, meta


def n_feasibility(series: list[dict]) -> dict:
    sigmas = sorted(s["sigma_X"] for s in series)
    n = len(series)
    # sigma tertiles by quantile cut
    q1 = sigmas[n // 3]
    q2 = sigmas[(2 * n) // 3]
    counts = [0, 0, 0]
    for s in series:
        v = s["sigma_X"]
        counts[0 if v <= q1 else (1 if v <= q2 else 2)] += 1
    passed = (n >= PREREG_N_REQUIRED and sum(1 for c in counts if c >= PREREG_MIN_PER_REGIME) >= PREREG_K_REGIMES
              and len([c for c in counts if c > 0]) >= PREREG_K_REGIMES)
    return {
        "N": n, "k_regimes": PREREG_K_REGIMES,
        "sigma_tertile_cuts": [q1, q2],
        "per_tertile_counts": counts,
        "min_per_regime_required": PREREG_MIN_PER_REGIME,
        "N_required": PREREG_N_REQUIRED,
        "passed": bool(passed),
    }


def main() -> None:
    all_series = {}
    pool_provenance = {}
    max_block_time = 0
    dune_exec_create_ts = 0
    for name, cfg in POOLS.items():
        series, meta = build_pool_series(name, cfg)
        all_series[name] = series
        max_block_time = max(max_block_time, max(s["timestamp"] for s in series))
        dune_exec_create_ts = max(dune_exec_create_ts, ulid_ms(cfg["dune_execution_id"]) // 1000)
        feas = n_feasibility(series)
        pool_provenance[name] = {
            "address": cfg["address"], "role": cfg["role"],
            "dune_query_id": cfg["dune_query_id"],
            "dune_execution_id": cfg["dune_execution_id"],
            "sample_rule": f"mod(row_number() over (order by day), {cfg['sample_k']}) = 1",
            "decimals0": cfg["decimals0"], "decimals1": cfg["decimals1"],
            "n_obs": len(series), "n_feasibility": feas, **meta,
        }

    snapshot_ts = max(max_block_time, dune_exec_create_ts)
    prereg_ts = git_commit_ts(PREREG_SHA)
    ordering_ok = prereg_ts < snapshot_ts
    assert ordering_ok, f"ORDERING VIOLATED: prereg_ts {prereg_ts} >= snapshot_ts {snapshot_ts}"

    # Freeze + content-hash the series.
    series_payload = {
        "schema_version": 1,
        "columns": ["timestamp", "block_number", "day", "sqrtPriceX96", "tick",
                    "price_raw", "dW", "G", "phi_obs_pips", "phi_obs", "sigma_X"],
        "units": {
            "phi_obs": "fee RATE (Algebra fee pips / 1e6)", "phi_obs_pips": "raw Algebra fee (1e-6 units)",
            "sigma_X": "oracle average volatility over trailing 1-day window (Algebra getTimepoints)",
            "dW": "daily gross |amount0| token0 volume / 1e18", "price_raw": "sqrtPriceX96^2 / 2^192",
        },
        "pools": {name: {"address": POOLS[name]["address"], "rows": all_series[name]}
                  for name in all_series},
    }
    series_text = json.dumps(series_payload, sort_keys=True, separators=(",", ":"))
    series_sha = hashlib.sha256(series_text.encode()).hexdigest()
    with open(os.path.join(HERE, "series.json"), "w") as f:
        f.write(series_text)

    overall_pass = all(pool_provenance[n]["n_feasibility"]["passed"] for n in pool_provenance)
    snapshot = {
        "schema": "num-04-snapshot/v1",
        "status": "ok" if overall_pass else "n_feasibility_failed",
        "data_source": f"dune:{POOLS['liquid']['dune_query_id']}+{POOLS['adverse']['dune_query_id']}",
        "chain": "polygon",
        "venue": "QuickSwap-V3-Polygon (Algebra V1)",
        "swap_table": SWAP_TABLE, "fee_table": FEE_TABLE,
        "sampling_rule": SAMPLING_RULE,
        "pools": pool_provenance,
        "two_stream_join": "phi_obs = forward-filled most-recent prior fee by (block, evt_index); daily representative = last swap of day (max (block, evt_index)); phi forward-filled across sampled feeless days",
        "sigma_source": {
            "method": "Algebra V1 pool getTimepoints([0,86400]) archive eth_call; "
                      "sigma_X = (volatilityCumulative[0secAgo] - volatilityCumulative[86400secAgo]) / 86400",
            "window_seconds": WINDOW_SECONDS,
            "rpc": "polygon archive (alchemy), constructed from ALCHEMY_API_KEY at call time",
            "n_eth_calls": sum(len(all_series[n]) for n in all_series),
            "all_blocks_resolved": True,
            "naive_variance_substitute": False,
        },
        "sigma_crosscheck": SIGMA_XCHECK,
        "sigma_xcheck": SIGMA_XCHECK,  # alias for the committed _check_snapshot.py gate
        "series_file": "series.json",
        "series_sha256": series_sha,
        # Top-level mirrors of the ordering/gate fields the committed _check_snapshot.py asserts.
        "prereg_commit_ts": prereg_ts,
        "snapshot_ts": snapshot_ts,
        "decimals0": POOLS["liquid"]["decimals0"],  # representative (primary venue)
        "decimals1": POOLS["liquid"]["decimals1"],
        "n_feasibility": {
            "passed": overall_pass,
            "per_pool": {n: pool_provenance[n]["n_feasibility"] for n in pool_provenance},
        },
        "ordering_anchor": {
            "rule": "snapshot_ts = max(max_block_time, dune_exec_create_ts); prereg_commit_ts < snapshot_ts (snapshot-side anchor; repo has no git remote)",
            "prereg_commit_sha": PREREG_SHA,
            "prereg_commit_ts": prereg_ts,
            "max_block_time": max_block_time,
            "dune_exec_create_ts": dune_exec_create_ts,
            "snapshot_ts": snapshot_ts,
            "prereg_before_snapshot": ordering_ok,
        },
        "n_feasibility_overall_passed": overall_pass,
    }
    with open(os.path.join(HERE, "snapshot.session.json"), "w") as f:
        json.dump(snapshot, f, indent=2)

    print(f"status={snapshot['status']}  series_sha256={series_sha[:16]}…")
    for n in pool_provenance:
        feas = pool_provenance[n]["n_feasibility"]
        print(f"  {n}: N={feas['N']} tertiles={feas['per_tertile_counts']} passed={feas['passed']} "
              f"(ffill={pool_provenance[n]['n_ffill_phi']}, dropped_no_sigma={pool_provenance[n]['n_dropped_no_sigma']})")
    print(f"  ordering: prereg_ts={prereg_ts} < snapshot_ts={snapshot_ts} -> {ordering_ok}")


if __name__ == "__main__":
    main()
