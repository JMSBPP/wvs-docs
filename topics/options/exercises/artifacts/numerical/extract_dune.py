#!/usr/bin/env python3
"""extract_dune.py — TWO-STREAM Dune extraction for the Phase-2 numerical tier (Layer A data).

Per 02-04-PLAN.md + 02-CONTEXT.md Addendum 2 + NUM-03-prereg.md §9:

  Stream 1 (swap): decoded Algebra/QuickSwap swap events ->
      {timestamp, block_number, log_index, sqrtPriceX96, tick, dW}
  Stream 2 (fee):  the SPARSE `algebrapool_evt_fee` event ->
      {block_number, log_index, fee}   (the fee changes only when re-set)

  JOIN (the two-stream forward-fill):
      phi_obs(swap_row) = fee of the MOST-RECENT PRIOR fee event, i.e. the last
      fee event whose (block_number, log_index) <= the swap row's (block_number,
      log_index), with BOTH streams ordered by (block_number, log_index).

  This module DOES NOT compute sigma. Dune has NO volatility column (the Algebra
  oracle `volatilityCumulative` is internal storage, never emitted) — sigma_X is
  sourced separately via archive-node eth_call in `extract_sigma_rpc.py`.

Provenance stamping (NUM-03 §0, §11): the caller records query_text, sha256(query_text),
dune_query_id, dune_execution_id, dune_execution_create_ts, max_block_time, row_counts.
`snapshot_ts = max(max_block_time, dune_execution_create_ts)` — NEVER a local `date -u`.

EXECUTION NOTE (2026-06-13): this script is the re-runnable extraction harness. The live
Dune query was NOT runnable in the execution agent's environment (the Dune MCP tools were
not exposed to the sub-agent and no DUNE_API_KEY was present — api.dune.com/mcp/v1 returned
401). When a Dune execution result is available (CSV/JSON rows), feed it through
`forward_fill_join(...)` below; the join + per-row window-bound materialization are pure and
unit-testable without network access.
"""
from __future__ import annotations

import hashlib
import json
import os
from dataclasses import dataclass, field
from typing import Callable, Iterable, Sequence

# WINDOW = 1 day in seconds (Algebra VolatilityOracle WINDOW = 1 days). Per-row window
# bounds [t - WINDOW, t] are materialized so look-ahead is mechanically checkable.
WINDOW_SECONDS: int = 24 * 60 * 60


# ---------------------------------------------------------------------------
# The two Dune query templates (decoded Algebra Integral tables, QuickSwap-V3-Polygon).
# Parameterized by pool address + chain + block range. Kept verbatim so the committed
# sha256(query_text) is a non-forgeable provenance anchor.
# ---------------------------------------------------------------------------

SWAP_QUERY_TEMPLATE = """\
-- Stream 1: decoded Algebra/QuickSwap-V3 swap events on {chain}
-- tick / sqrtPriceX96 / dW (signed amount0 as the delta-weight proxy) per swap.
SELECT
    evt_block_time          AS timestamp,
    evt_block_number        AS block_number,
    evt_index               AS log_index,
    "price"                 AS sqrtPriceX96,   -- Algebra emits sqrtPriceX96 as `price`
    tick                    AS tick,
    amount0                 AS dW              -- signed token0 flow == delta-weight
FROM algebra_v3_{chain}.AlgebraPool_evt_Swap
WHERE contract_address = {pool_address}
  AND evt_block_number BETWEEN {block_start} AND {block_end}
ORDER BY evt_block_number, evt_index
"""

FEE_QUERY_TEMPLATE = """\
-- Stream 2: the SPARSE realized-fee events (fee changes only when re-set).
SELECT
    evt_block_number        AS block_number,
    evt_index               AS log_index,
    fee                     AS fee
FROM algebra_v3_{chain}.AlgebraPool_evt_Fee
WHERE contract_address = {pool_address}
  AND evt_block_number BETWEEN {block_start} AND {block_end}
ORDER BY evt_block_number, evt_index
"""


def render_queries(pool_address: str, chain: str, block_start: int, block_end: int) -> dict[str, str]:
    """Render the two verbatim query texts for provenance + execution."""
    params = dict(
        pool_address=repr(pool_address), chain=chain,
        block_start=block_start, block_end=block_end,
    )
    return {
        "swap_query": SWAP_QUERY_TEMPLATE.format(**params),
        "fee_query": FEE_QUERY_TEMPLATE.format(**params),
    }


def sha256_query(query_text: str) -> str:
    return hashlib.sha256(query_text.encode("utf-8")).hexdigest()


# ---------------------------------------------------------------------------
# BASE-01 L_K reconstruction (signed-liquidityNet full-history cumsum) +
# the disjoint-Υ Collect query. Column casing is READ from the live-pinned
# `base/dune_column_sample.json` (camelCase: bottomTick/topTick/liquidityAmount),
# never hardcoded — RESEARCH Open Question 1 / Pitfall 5.
# ---------------------------------------------------------------------------

_HERE = os.path.dirname(os.path.abspath(__file__))
_COLUMN_SAMPLE_PATH = os.path.join(_HERE, "base", "dune_column_sample.json")


def load_column_casing(sample_path: str | None = None) -> dict[str, str]:
    """Read the live-pinned decoded column casing for mint/burn/collect.

    Returns {bottom_tick, top_tick, liquidity_amount, amount0, amount1} with the EXACT casing
    sampled orchestrator-side (LIMIT-2 Dune MCP) before the query text is sha256-locked. We read
    `liquidity_delta_column` and `tick_columns` from the mint block (mint/burn share casing) and
    the collect `fee_amount_columns`. NO casing is hardcoded in the query templates below.
    """
    path = sample_path or _COLUMN_SAMPLE_PATH
    with open(path) as f:
        s = json.load(f)
    mint = s["mint"]
    bottom_tick, top_tick = mint["tick_columns"]  # ["bottomTick", "topTick"]
    return {
        "bottom_tick": bottom_tick,
        "top_tick": top_tick,
        "liquidity_amount": mint["liquidity_delta_column"],   # "liquidityAmount"
        "amount0": s["collect"]["fee_amount_columns"][0],     # "amount0"
        "amount1": s["collect"]["fee_amount_columns"][1],     # "amount1"
    }


# The L_K cumsum query template — VERBATIM the RESEARCH §"DuneSQL skeleton". Column names are
# substituted from the live sample so the sha256 pins the casing that was actually verified.
LK_QUERY_TEMPLATE = """\
-- L_K reconstruction: signed liquidityNet per tick, then a full-history running cumsum.
-- Active liquidity at tick i = Σ_{{ticks ≤ i}} liquidityNet (AlgebraV1 TickManager.update:
-- +liquidityAmount @ bottomTick, -liquidityAmount @ topTick for Mint; reversed for Burn).
-- ONE query, server-side window function. Full history up to {snap_block}.
WITH net AS (
  -- Mint: +L at bottomTick, -L at topTick
  SELECT {bottom_tick} AS tick,  CAST({liquidity_amount} AS DECIMAL(38,0)) AS liquidity_net
  FROM   quickswap_v3_polygon.algebrapool_evt_mint
  WHERE  contract_address = {pool} AND evt_block_number <= {snap_block}
  UNION ALL
  SELECT {top_tick}    AS tick, -CAST({liquidity_amount} AS DECIMAL(38,0))
  FROM   quickswap_v3_polygon.algebrapool_evt_mint
  WHERE  contract_address = {pool} AND evt_block_number <= {snap_block}
  UNION ALL
  -- Burn: -L at bottomTick, +L at topTick
  SELECT {bottom_tick} AS tick, -CAST({liquidity_amount} AS DECIMAL(38,0))
  FROM   quickswap_v3_polygon.algebrapool_evt_burn
  WHERE  contract_address = {pool} AND evt_block_number <= {snap_block}
  UNION ALL
  SELECT {top_tick}    AS tick,  CAST({liquidity_amount} AS DECIMAL(38,0))
  FROM   quickswap_v3_polygon.algebrapool_evt_burn
  WHERE  contract_address = {pool} AND evt_block_number <= {snap_block}
),
per_tick AS (
  SELECT tick, SUM(liquidity_net) AS liquidity_net
  FROM net GROUP BY tick
)
SELECT
  tick,
  liquidity_net,
  SUM(liquidity_net) OVER (ORDER BY tick
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS active_liquidity
FROM per_tick
ORDER BY tick
"""

# The disjoint-Υ Collect query: realized withdrawn fees (amount0/amount1) over an interval.
COLLECT_QUERY_TEMPLATE = """\
-- Disjoint Υ referent (secondary): realized LP fee withdrawals over [block_lo, block_hi].
-- Collect.amount0/amount1 are the WITHDRAWN FEE amounts (raw token units) — shares NO
-- intermediate with the Σ φ_X·Δ_X·⟨L_K,μ⟩ apparatus formula.
SELECT
    evt_block_number        AS block_number,
    evt_index               AS log_index,
    {amount0}               AS amount0,
    {amount1}               AS amount1
FROM quickswap_v3_polygon.algebrapool_evt_collect
WHERE contract_address = {pool}
  AND evt_block_number BETWEEN {block_lo} AND {block_hi}
ORDER BY evt_block_number, evt_index
"""


def render_LK_query(pool: str, snap_block: int, *, sample_path: str | None = None) -> str:
    """Render the verbatim full-history L_K cumsum query text (sha256-pinnable).

    Column casing is READ from `base/dune_column_sample.json` — never hardcoded. Pass the result
    through `sha256_query` to get the provenance anchor committed in the snapshot.
    """
    casing = load_column_casing(sample_path)
    return LK_QUERY_TEMPLATE.format(
        pool=repr(pool), snap_block=snap_block,
        bottom_tick=casing["bottom_tick"], top_tick=casing["top_tick"],
        liquidity_amount=casing["liquidity_amount"],
    )


def render_collect_query(
    pool: str, block_lo: int, block_hi: int, *, sample_path: str | None = None
) -> str:
    """Render the verbatim Collect (realized-fee) query text for the Υ referent (sha256-pinnable)."""
    casing = load_column_casing(sample_path)
    return COLLECT_QUERY_TEMPLATE.format(
        pool=repr(pool), block_lo=block_lo, block_hi=block_hi,
        amount0=casing["amount0"], amount1=casing["amount1"],
    )


def current_tick_cumsum_cross_check(
    active_liquidity_at_current_tick: int,
    pool: str,
    snap_block: int,
    *,
    rpc_caller: Callable[[str, str, int], int] | None = None,
) -> dict:
    """Cross-check the reconstructed cumsum at the current tick against `pool.liquidity()`.

    `rpc_caller(pool, "liquidity()(uint128)", snap_block) -> int` is an INJECTED archive eth_call
    seam (e.g. a thin `cast call` wrapper). This function does NO network I/O of its own when
    `rpc_caller is None`: it returns `status: "blocked"` so the live read is deferred to the
    orchestrator (NUM-04 credential-gate pattern). When a caller is injected, it returns the
    match result. NEVER fabricate the on-chain value.
    """
    if rpc_caller is None:
        return {
            "status": "blocked",
            "reason": "archive RPC pool.liquidity() not reachable in this env; defer to orchestrator",
            "active_liquidity_at_current_tick": int(active_liquidity_at_current_tick),
            "pool": pool,
            "snap_block": snap_block,
        }
    pool_liquidity = int(rpc_caller(pool, "liquidity()(uint128)", snap_block))
    return {
        "status": "ok",
        "active_liquidity_at_current_tick": int(active_liquidity_at_current_tick),
        "pool_liquidity": pool_liquidity,
        "matches": int(active_liquidity_at_current_tick) == pool_liquidity,
        "pool": pool,
        "snap_block": snap_block,
    }


# ---------------------------------------------------------------------------
# The pure, network-free two-stream forward-fill join + window-bound materialization.
# This is the load-bearing, unit-testable core (no Dune access required to test it).
# ---------------------------------------------------------------------------

@dataclass(frozen=True)
class SwapRow:
    timestamp: int          # unix seconds
    block_number: int
    log_index: int
    sqrtPriceX96: int
    tick: int
    dW: float


@dataclass(frozen=True)
class FeeEvent:
    block_number: int
    log_index: int
    fee: float


@dataclass
class JoinedRow:
    timestamp: int
    block_number: int
    log_index: int
    sqrtPriceX96: int
    tick: int
    dW: float
    phi_obs: float          # forward-filled fee from the most-recent prior fee event
    window_lo: int          # t - WINDOW (seconds)
    window_hi: int          # t           (seconds)
    extra: dict = field(default_factory=dict)


def _key(bn: int, li: int) -> tuple[int, int]:
    return (bn, li)


def forward_fill_join(
    swaps: Sequence[SwapRow],
    fee_events: Sequence[FeeEvent],
) -> list[JoinedRow]:
    """Forward-fill phi_obs onto swap rows by (block_number, log_index).

    phi_obs(swap) = fee of the LAST fee event with (block, log_index) <= the swap's
    (block, log_index). Both streams MUST be processed in (block_number, log_index)
    order. Per-row window bounds [t - WINDOW, t] are materialized.

    ONE LITERAL WORKED ROW (NUM-03 §9 / plan interfaces):
        fee event at (block=B0, log_index=2, fee=300)
        swap at      (block=B1>B0, log_index=5)            -> phi_obs = 300
    """
    swaps_sorted = sorted(swaps, key=lambda s: _key(s.block_number, s.log_index))
    fees_sorted = sorted(fee_events, key=lambda f: _key(f.block_number, f.log_index))

    out: list[JoinedRow] = []
    fi = 0
    current_fee: float | None = None
    n_fees = len(fees_sorted)

    for s in swaps_sorted:
        s_key = _key(s.block_number, s.log_index)
        # advance the fee cursor over every fee event at or before this swap row
        while fi < n_fees and _key(fees_sorted[fi].block_number, fees_sorted[fi].log_index) <= s_key:
            current_fee = fees_sorted[fi].fee
            fi += 1
        if current_fee is None:
            # no prior fee event: cannot forward-fill -> skip (no fabricated fee)
            continue
        out.append(JoinedRow(
            timestamp=s.timestamp,
            block_number=s.block_number,
            log_index=s.log_index,
            sqrtPriceX96=s.sqrtPriceX96,
            tick=s.tick,
            dW=s.dW,
            phi_obs=current_fee,
            window_lo=s.timestamp - WINDOW_SECONDS,
            window_hi=s.timestamp,
        ))
    return out


def assert_event_ordering(rows: Iterable[JoinedRow]) -> None:
    """(block_number, log_index) must be monotone non-decreasing before differencing."""
    prev: tuple[int, int] | None = None
    for r in rows:
        k = _key(r.block_number, r.log_index)
        if prev is not None and k < prev:
            raise AssertionError(f"event-ordering violated: {k} < {prev}")
        prev = k


def assert_no_lookahead(rows: Sequence[JoinedRow]) -> None:
    """Per-row window [t-WINDOW, t] must contain no FUTURE block (look-ahead-free).

    Checked mechanically per row: every other row whose timestamp lies in this row's
    window must have block_number <= this row's block_number (no later block leaks into
    a trailing window).
    """
    for r in rows:
        for other in rows:
            if r.window_lo <= other.timestamp <= r.window_hi:
                if other.block_number > r.block_number:
                    raise AssertionError(
                        f"look-ahead: block {other.block_number} in window of "
                        f"row block {r.block_number}"
                    )


def rows_to_records(rows: Sequence[JoinedRow]) -> list[dict]:
    return [
        {
            "timestamp": r.timestamp,
            "block_number": r.block_number,
            "log_index": r.log_index,
            "sqrtPriceX96": r.sqrtPriceX96,
            "tick": r.tick,
            "dW": r.dW,
            "phi_obs": r.phi_obs,
            "window_lo": r.window_lo,
            "window_hi": r.window_hi,
        }
        for r in rows
    ]


if __name__ == "__main__":
    # Self-demo of the pure join on the LITERAL WORKED ROW from the plan interfaces.
    # (No network access; demonstrates the forward-fill arithmetic.)
    swaps = [SwapRow(timestamp=1_700_000_100, block_number=11, log_index=5,
                     sqrtPriceX96=79228162514264337593543950336, tick=0, dW=1.0)]
    fees = [FeeEvent(block_number=10, log_index=2, fee=300.0)]
    joined = forward_fill_join(swaps, fees)
    assert_event_ordering(joined)
    assert joined[0].phi_obs == 300.0, "forward-fill must carry the prior fee"
    print(json.dumps(rows_to_records(joined), indent=2))
    print("extract_dune self-demo OK: phi_obs forward-filled = 300 onto swap (block=11, log_index=5)")
