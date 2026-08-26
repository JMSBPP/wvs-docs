#!/usr/bin/env python3
"""extract_sigma_cast.py — TRUE oracle sigma_X via archive eth_call, using `cast`.

For each (pool, representative end-of-day block) in the staged Dune daily rows, eth_call
the Algebra V1 pool's `getTimepoints([0, WINDOW])` at that historical block (archive node)
and read the oracle-faithful average volatility over the trailing 1-day window:

    sigma_X(block) = (volatilityCumulative[0secAgo] - volatilityCumulative[WINDOW secAgo]) / WINDOW

This is the oracle value (Dune has NO volatility column; volatilityCumulative is internal
storage, never emitted). QuickSwap-V3-Polygon pools are Algebra V1 — `plugin()` reverts;
the oracle is exposed on the pool itself via getTimepoints (returns
int56[] tickCumulatives, uint160[] secondsPerLiquidityCumulatives,
uint112[] volatilityCumulatives, uint256[] volumePerAvgLiquiditys).

Requires ARCHIVE_RPC_URL or ALCHEMY_API_KEY (Polygon archive). Reverts (oracle window
shorter than 1 day near pool init) are recorded as null and dropped downstream — never a
naive return-variance substitute.
"""
from __future__ import annotations

import json
import os
import re
import subprocess
import sys
from concurrent.futures import ThreadPoolExecutor

WINDOW_SECONDS = 24 * 60 * 60
HERE = os.path.dirname(os.path.abspath(__file__))

POOLS = {
    "liquid": ("0xae81fac689a1b4b1e06e7ef4a2ab4cd8ac0a087d", "liquid_daily_raw.json", "liquid_sigma.json"),
    "adverse": ("0x5cd94ead61fea43886feec3c95b1e9d7284fdef3", "adverse_daily_raw.json", "adverse_sigma.json"),
}

SIG = "getTimepoints(uint32[])(int56[],uint160[],uint112[],uint256[])"


def rpc_url() -> str:
    u = os.environ.get("ARCHIVE_RPC_URL")
    if u:
        return u
    k = os.environ.get("ALCHEMY_API_KEY")
    if not k:
        sys.exit("ARCHIVE_RPC_URL / ALCHEMY_API_KEY unset — cannot eth_call the oracle.")
    return f"https://polygon-mainnet.g.alchemy.com/v2/{k}"


URL = rpc_url()


def sigma_at(pool: str, block: int) -> float | None:
    """eth_call getTimepoints at `block`; return oracle sigma_X or None on revert."""
    try:
        out = subprocess.run(
            ["cast", "call", pool, SIG, "[0,86400]", "--rpc-url", URL, "--block", str(block)],
            capture_output=True, text=True, timeout=60,
        )
    except subprocess.TimeoutExpired:
        return None
    if out.returncode != 0:
        return None
    lines = [ln for ln in out.stdout.splitlines() if ln.strip()]
    if len(lines) < 3:
        return None
    # line index 2 = volatilityCumulatives array: "[v0 [sci], v1 [sci]]"
    vol_line = lines[2]
    nums = re.findall(r"(-?\d+)\s*\[", vol_line)  # leading integer of each "VALUE [sci]" element
    if len(nums) < 2:
        # fallback: bare integers if cast didn't print sci annotations
        nums = re.findall(r"-?\d+", vol_line)
        if len(nums) < 2:
            return None
    v0, v1 = int(nums[0]), int(nums[1])
    return (v0 - v1) / WINDOW_SECONDS


def main() -> None:
    for name, (pool, raw_file, sig_file) in POOLS.items():
        rows = json.load(open(os.path.join(HERE, raw_file)))
        blocks = [int(r["rep_block"]) for r in rows]
        result: dict[str, float | None] = {}

        def work(b: int) -> tuple[int, float | None]:
            return b, sigma_at(pool, b)

        with ThreadPoolExecutor(max_workers=16) as ex:
            for b, s in ex.map(work, blocks):
                result[str(b)] = s
        n_ok = sum(1 for v in result.values() if v is not None)
        json.dump(result, open(os.path.join(HERE, sig_file), "w"), indent=0)
        print(f"{name}: {n_ok}/{len(blocks)} blocks with oracle sigma "
              f"({len(blocks)-n_ok} reverts/null) -> {sig_file}")


if __name__ == "__main__":
    main()
