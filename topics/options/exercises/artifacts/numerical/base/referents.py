#!/usr/bin/env python3
"""referents.py — BASE-03 INDEPENDENT on-chain referents (disjoint from the apparatus).

The two referents below are the data-faithfulness ground truth the E-tier gate compares the
Σ φ_X·Δ_X·⟨L_K,μ⟩ apparatus against. They are computed from RAW on-chain reads ONLY:

  * the fee referent  ->  Δ(totalFeeGrowth0Token / totalFeeGrowth1Token) over [block_lo, block_hi]
                          (Q128 per-unit-liquidity), plus a corroborating sum of realized
                          Collect withdrawals; both legs converted to ONE numeraire at the
                          snapshot price (the gate ratio in Plan 05 must be dimensionless).
  * the IL referent   ->  token{0,1}.balanceOf(pool) held value minus a buy-and-hold of the
                          initial reserves, priced at the endpoint sqrtPriceX96.

DISJOINTNESS (prereg BLOCKER-2, enforced by tests/test_referents_disjoint.py): this module
imports NOTHING from base.apparatus. It imports only the raw-extraction seams
(`extract_sigma_cast.rpc_url` for the archive RPC URL, a thin cast-call wrapper, and
`extract_dune` for the realized-withdrawal query text). A constant-pairing path would have to
share the apparatus module — this module deliberately does not, so the circularity the NUM-04
defect class hides is mechanically impossible here.

ALL network calls sit behind an injected `rpc_url` / caller seam so the disjointness check runs
offline. If an archive read reverts beyond retry the caller records `status: "blocked"` for THAT
referent — never a substituted proxy (RESEARCH §"Credential gate", honest fallback).

Sources: cryptoalgebra/AlgebraV1 AlgebraPool.sol (totalFeeGrowth{0,1}Token, Collect realization),
RESEARCH §"Independent Υ Referent" + §"Independent IL Referent".
"""
from __future__ import annotations

import os
import subprocess
import sys
from typing import Callable, Optional

# RAW-extraction imports ONLY — never base.apparatus.
_HERE = os.path.dirname(os.path.abspath(__file__))
_NUMERICAL_DIR = os.path.dirname(_HERE)
_SNAPSHOT_DIR = os.path.join(_NUMERICAL_DIR, "snapshot")
for _p in (_NUMERICAL_DIR, _SNAPSHOT_DIR):
    if _p not in sys.path:
        sys.path.insert(0, _p)

import extract_sigma_cast as _sigma_cast  # noqa: E402  -> rpc_url() archive-URL seam (raw read)
import extract_dune as _dune  # noqa: E402  -> render_collect_query (raw realized-withdrawal text)

_Q128 = 1 << 128

# Default archive eth_call seam: a thin `cast call` wrapper. Returns the decoded uint as int, or
# None on revert/timeout/missing-credential. Injectable so the disjointness test runs offline.
RpcCaller = Callable[[str, str, list, int], Optional[int]]


def _default_rpc_caller(rpc_url: str) -> RpcCaller:
    """Build a `cast call` wrapper bound to an archive `rpc_url`. None on any failure."""
    def call(addr: str, sig: str, args: list, block: int) -> Optional[int]:
        try:
            out = subprocess.run(
                ["cast", "call", addr, sig, *[str(a) for a in args],
                 "--rpc-url", rpc_url, "--block", str(block)],
                capture_output=True, text=True, timeout=60,
            )
        except (subprocess.TimeoutExpired, FileNotFoundError):
            return None
        if out.returncode != 0:
            return None
        txt = out.stdout.strip().split()
        if not txt:
            return None
        try:
            return int(txt[0])
        except ValueError:
            return None
    return call


def _resolve_caller(rpc_url: Optional[str], rpc_caller: Optional[RpcCaller]) -> Optional[RpcCaller]:
    """Pick the injected caller if given, else build one from rpc_url (or the env URL). None if no
    URL is reachable — the caller then records status:blocked rather than fabricating a read."""
    if rpc_caller is not None:
        return rpc_caller
    url = rpc_url
    if url is None:
        # _sigma_cast.rpc_url() exits the process if no credential; guard it.
        if os.environ.get("ARCHIVE_RPC_URL") or os.environ.get("ALCHEMY_API_KEY"):
            url = _sigma_cast.rpc_url()
        else:
            return None
    return _default_rpc_caller(url)


def fee_referent(
    pool: str,
    block_lo: int,
    block_hi: int,
    *,
    in_range_liquidity: Optional[int] = None,
    price_token1_per_token0: Optional[float] = None,
    decimals0: int = 18,
    decimals1: int = 6,
    rpc_url: Optional[str] = None,
    rpc_caller: Optional[RpcCaller] = None,
    collect_rows: Optional[list] = None,
) -> dict:
    """Independent realized-fee referent over [block_lo, block_hi] (the disjoint Υ ground truth).

    Δ(totalFeeGrowth{0,1}Token) read by archive eth_call at the two endpoint blocks. Each leg is
    (Δgrowth × in_range_liquidity / Q128) raw token units; the two legs are put on ONE numeraire
    (token1) at `price_token1_per_token0` after decimal scaling. The returned dict RECORDS the
    conversion arithmetic (Pitfall 2: the Plan-05 gate ratio must be dimensionless). A corroborating
    secondary is the sum of realized Collect withdrawals (`collect_rows`, from
    `extract_dune.render_collect_query`).

    Honest fallback: if the archive read is unreachable, returns {status:"blocked"} for THIS
    referent — never a proxy.
    """
    caller = _resolve_caller(rpc_url, rpc_caller)
    sig0 = "totalFeeGrowth0Token()(uint256)"
    sig1 = "totalFeeGrowth1Token()(uint256)"

    if caller is None:
        return {
            "status": "blocked",
            "reason": "archive RPC totalFeeGrowth{0,1}Token unreachable; defer to orchestrator",
            "pool": pool, "block_lo": block_lo, "block_hi": block_hi,
        }

    g0_lo = caller(pool, sig0, [], block_lo)
    g0_hi = caller(pool, sig0, [], block_hi)
    g1_lo = caller(pool, sig1, [], block_lo)
    g1_hi = caller(pool, sig1, [], block_hi)
    if None in (g0_lo, g0_hi, g1_lo, g1_hi):
        return {
            "status": "blocked",
            "reason": "totalFeeGrowth eth_call reverted at one or both endpoints",
            "pool": pool, "block_lo": block_lo, "block_hi": block_hi,
        }

    if in_range_liquidity is None:
        return {
            "status": "blocked",
            "reason": "in_range_liquidity required to convert per-unit-liquidity growth to token units",
            "pool": pool, "block_lo": block_lo, "block_hi": block_hi,
        }

    # per-unit-liquidity Q128 growth -> raw token units
    fee0_raw = (g0_hi - g0_lo) * in_range_liquidity / _Q128
    fee1_raw = (g1_hi - g1_lo) * in_range_liquidity / _Q128

    result = {
        "status": "ok",
        "pool": pool, "block_lo": block_lo, "block_hi": block_hi,
        "fee0_raw_token0": fee0_raw,
        "fee1_raw_token1": fee1_raw,
        "q128": _Q128,
        "in_range_liquidity": in_range_liquidity,
        "conversion": {
            "decimals0": decimals0, "decimals1": decimals1,
            "price_token1_per_token0": price_token1_per_token0,
            "note": "leg0 (token0) -> token1 numeraire via decimal scale 10^(d0-d1) then price; leg1 native",
        },
    }

    # single-numeraire (token1) conversion, when a price is supplied
    if price_token1_per_token0 is not None:
        fee0_in_token1 = fee0_raw * (10 ** (decimals1 - decimals0)) * price_token1_per_token0
        result["fee_in_numeraire_token1"] = fee0_in_token1 + fee1_raw
        result["conversion"]["fee0_in_token1"] = fee0_in_token1

    # corroborating secondary: realized withdrawals (the apparatus is NOT consulted here)
    if collect_rows is not None:
        s0 = sum(int(r["amount0"]) for r in collect_rows)
        s1 = sum(int(r["amount1"]) for r in collect_rows)
        result["collect_realized"] = {"sum_amount0": s0, "sum_amount1": s1}

    return result


# Public alias for the realized-fee referent (the BASE-03 contract export name).
def upsilon_referent(*args, **kwargs) -> dict:  # noqa: ANN
    """Public export of the disjoint realized-fee referent — delegates to fee_referent.

    Kept as a thin alias so the export name matches the BASE-03 interface while the implementation
    body lives in fee_referent (no apparatus symbol is referenced in either)."""
    return fee_referent(*args, **kwargs)


def il_referent(
    pool: str,
    block_lo: int,
    block_hi: int,
    sqrtPriceX96_lo: int,
    sqrtPriceX96_hi: int,
    *,
    token0: Optional[str] = None,
    token1: Optional[str] = None,
    decimals0: int = 18,
    decimals1: int = 6,
    rpc_url: Optional[str] = None,
    rpc_caller: Optional[RpcCaller] = None,
) -> dict:
    """Independent reserve-based IL referent (disjoint from the i_X/L_K-based formula).

    Reads token{0,1}.balanceOf(pool) at both endpoint blocks (archive eth_call), prices held
    reserves at the endpoint sqrtPriceX96, and subtracts the buy-and-hold value of the INITIAL
    reserves repriced at the endpoint. Non-positive vs hold under a concentrated/constant-product
    invariant. Returns the priced legs; honest {status:"blocked"} if a balanceOf read is
    unreachable.
    """
    caller = _resolve_caller(rpc_url, rpc_caller)
    if caller is None or token0 is None or token1 is None:
        return {
            "status": "blocked",
            "reason": "archive RPC balanceOf / token addresses unavailable; defer to orchestrator",
            "pool": pool, "block_lo": block_lo, "block_hi": block_hi,
        }

    sig = "balanceOf(address)(uint256)"
    r0_lo = caller(token0, sig, [pool], block_lo)
    r1_lo = caller(token1, sig, [pool], block_lo)
    r0_hi = caller(token0, sig, [pool], block_hi)
    r1_hi = caller(token1, sig, [pool], block_hi)
    if None in (r0_lo, r1_lo, r0_hi, r1_hi):
        return {
            "status": "blocked",
            "reason": "balanceOf eth_call reverted at one or both endpoints",
            "pool": pool, "block_lo": block_lo, "block_hi": block_hi,
        }

    def _price_from_sqrt(sp: int) -> float:
        # token1-per-token0 spot price = (sqrtPriceX96^2 / 2^192) scaled by decimals
        raw = (sp * sp) / (1 << 192)
        return raw * (10 ** (decimals0 - decimals1))

    price_hi = _price_from_sqrt(sqrtPriceX96_hi)

    # held value at endpoint (numeraire = token1): r0 priced at endpoint + r1 native
    r0_hi_t1 = r0_hi * (10 ** (decimals1 - decimals0)) * price_hi
    held_value = r0_hi_t1 + r1_hi
    # buy-and-hold of INITIAL reserves repriced at endpoint
    r0_lo_t1 = r0_lo * (10 ** (decimals1 - decimals0)) * price_hi
    hold_value = r0_lo_t1 + r1_lo

    il_value = held_value - hold_value  # non-positive vs hold

    return {
        "status": "ok",
        "pool": pool, "block_lo": block_lo, "block_hi": block_hi,
        "reserves_lo": {"r0": r0_lo, "r1": r1_lo},
        "reserves_hi": {"r0": r0_hi, "r1": r1_hi},
        "price_endpoint_token1_per_token0": price_hi,
        "held_value_token1": held_value,
        "hold_value_token1": hold_value,
        "il_value_token1": il_value,
        "numeraire": "token1",
    }
