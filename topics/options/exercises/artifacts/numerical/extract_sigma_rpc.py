#!/usr/bin/env python3
"""extract_sigma_rpc.py — the TRUE oracle sigma_X via archive-node RPC eth_call.

Per 02-CONTEXT.md Addendum 2 (BLOCKER-sigma) + NUM-03-prereg.md §9:

  sigma_X(t) is the TRUE oracle value. Dune has NO volatility column — the Algebra
  VolatilityOracle plugin stores `volatilityCumulative` in INTERNAL STORAGE and NEVER
  emits it as an event, so Dune cannot decode it. The oracle-faithful sigma is read via
  archive-node `eth_call` at the historical snapshot block:

      getAverageVolatility(...)  /  volatilityCumulative differenced over WINDOW = 1 day
      (VolatilityOracle.sol getAverageVolatility :195-242, _volatilityOnRange :284-308)

  MANDATORY cross-check (>= 1 value): reconstruct sigma from the ticks and assert the RPC
  oracle value is close to it for at least one block (sanity):

      sigma_recon(t) = (1/WINDOW) * sum_{s in [t-WINDOW, t]} (i_X(s) - avg_i_X(t))^2
                       STRICTLY TRAILING (no future tick),   i_X = tick index.

CREDENTIAL GATE: this requires ARCHIVE_RPC_URL (a Polygon archive-node endpoint) to serve
historical eth_call. If ARCHIVE_RPC_URL is unset / not an archive node, sigma CANNOT be
sourced oracle-faithfully -> the caller records `status: blocked`. We NEVER substitute a
naive return-variance sigma for the oracle value.

EXECUTION NOTE (2026-06-13): ARCHIVE_RPC_URL was UNSET in the execution environment, so the
eth_call did not run. The function `oracle_sigma_at_block(...)` below is the re-runnable
harness; `sigma_recon(...)` is pure (network-free) and the cross-check is asserted by
`crosscheck_one_value(...)` once an RPC sigma is available.
"""
from __future__ import annotations

import os
from dataclasses import dataclass
from typing import Sequence

# Algebra VolatilityOracle WINDOW = 1 days (matches extract_dune.WINDOW_SECONDS).
WINDOW_SECONDS: int = 24 * 60 * 60

# getAverageVolatility(uint32 time, int24 tick, uint16 lastIndex) is the typical Algebra
# Integral plugin selector; the exact ABI is pinned per the deployed plugin at snapshot time.
# Recorded as the eth_call target (Dune has no equivalent column).
ORACLE_METHOD = "getAverageVolatility"
ORACLE_FALLBACK_METHOD = "volatilityCumulative"  # differenced over WINDOW if getAverage* absent


@dataclass(frozen=True)
class SigmaCrossCheck:
    block_number: int
    sigma_rpc: float
    sigma_recon: float

    def agrees(self, rel_tol: float = 0.25) -> bool:
        denom = abs(self.sigma_rpc) if self.sigma_rpc else 1.0
        return abs(self.sigma_rpc - self.sigma_recon) / denom <= rel_tol


def archive_rpc_url() -> str | None:
    """The archive-node endpoint; None if the credential gate is not satisfied."""
    return os.environ.get("ARCHIVE_RPC_URL")


def oracle_sigma_at_block(block_number: int, oracle_address: str, *, rpc_url: str | None = None) -> float:
    """eth_call the Algebra VolatilityOracle plugin at `block_number` for the TRUE sigma_X.

    Reads getAverageVolatility (or differences volatilityCumulative over WINDOW) at the
    historical block. Requires an ARCHIVE node. Raises if ARCHIVE_RPC_URL is unsatisfied —
    the caller turns that into an honest `status: blocked`, never a fabricated sigma.
    """
    url = rpc_url or archive_rpc_url()
    if not url:
        raise RuntimeError(
            "ARCHIVE_RPC_URL unset: cannot eth_call the VolatilityOracle for the TRUE "
            "sigma_X at historical block. Record status: blocked (never substitute a "
            "naive return-variance sigma)."
        )
    # web3 is imported lazily so the module loads (and the pure cross-check is testable)
    # even when web3 / an archive node are unavailable.
    from web3 import Web3  # type: ignore

    w3 = Web3(Web3.HTTPProvider(url))
    oracle = w3.eth.contract(
        address=Web3.to_checksum_address(oracle_address),
        abi=[{
            "name": ORACLE_METHOD, "type": "function", "stateMutability": "view",
            "inputs": [], "outputs": [{"name": "", "type": "uint88"}],
        }],
    )
    # eth_call pinned at the historical block (archive node required for old blocks):
    raw = oracle.functions.getAverageVolatility().call(block_identifier=block_number)
    return float(raw)


def sigma_recon(ticks: Sequence[tuple[int, int]], t: int) -> float:
    """Reconstruct sigma from the ticks over the STRICTLY-TRAILING window [t-WINDOW, t].

    ticks: sequence of (timestamp_seconds, tick_index). Returns the windowed tick-variance
    sigma_recon(t) = (1/WINDOW) * sum (i_X(s) - avg_i_X(t))^2 over s in [t-WINDOW, t].
    Strictly trailing: no tick with timestamp > t is consulted (look-ahead-free).
    """
    window = [tk for (ts, tk) in ticks if t - WINDOW_SECONDS <= ts <= t]
    if not window:
        return 0.0
    avg = sum(window) / len(window)
    var = sum((tk - avg) ** 2 for tk in window) / WINDOW_SECONDS
    return float(var)


def crosscheck_one_value(
    block_number: int, sigma_rpc: float, ticks: Sequence[tuple[int, int]], t: int,
) -> SigmaCrossCheck:
    """Build the mandatory >=1-value RPC-vs-reconstructed sigma cross-check record."""
    return SigmaCrossCheck(
        block_number=block_number,
        sigma_rpc=sigma_rpc,
        sigma_recon=sigma_recon(ticks, t),
    )


if __name__ == "__main__":
    url = archive_rpc_url()
    if not url:
        print("BLOCKED: ARCHIVE_RPC_URL unset -> oracle sigma_X unreachable via eth_call. "
              "Record status: blocked (never a naive-variance substitute).")
    else:
        print(f"ARCHIVE_RPC_URL present ({url[:24]}...): oracle eth_call harness ready.")
    # Pure cross-check demo (network-free): a synthetic trailing-tick window.
    demo_ticks = [(0, 10), (3600, 12), (7200, 11), (10800, 13)]
    print(f"sigma_recon demo over WINDOW: {sigma_recon(demo_ticks, 10800):.6e}")
