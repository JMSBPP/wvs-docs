#!/usr/bin/env python3
"""reconstruct_LK.py — BASE-01 tick-level liquidity distribution L_K(i_X).

The central object NUM-04 collapsed to the constant 1. Here it is instantiated as the
standard Uniswap-V3-family ACTIVE-LIQUIDITY reconstruction: a full-history cumulative sum
of signed `liquidityNet` per tick from the decoded `algebrapool_evt_{mint,burn}` events.

Sign convention (VERIFIED against AlgebraV1 `TickManager.update`, RESEARCH §"Sign convention"):
  Mint:  +liquidityAmount @ bottomTick,  -liquidityAmount @ topTick
  Burn:  -liquidityAmount @ bottomTick,  +liquidityAmount @ topTick   (mirror)
Active liquidity at tick i = Σ_{ticks ≤ i} liquidityNet (a running cumsum over sorted ticks).
The global `pool.liquidity()` equals this cumsum value at the pool's current tick — a built-in
cross-check (`current_tick_cross_check` below).

This Python path mirrors the Dune server-side window
`SUM(liquidity_net) OVER (ORDER BY tick ROWS UNBOUNDED PRECEDING)` (RESEARCH §"DuneSQL skeleton").
It is the OFFLINE cross-check / known-answer test target; the live query is `extract_dune.render_LK_query`.

LDF properties (DRAFT.md:103-119 / RESEARCH §"9 LDF Properties"):
  `ldf_properties` classifies ONLY properties 1, 2, 3 — the genuinely falsifiable / code-correctness ones.
  Properties 4-9 are STRUCTURAL-BY-CONSTRUCTION or out-of-scope and are deliberately NOT computed
  (recording this answers the reviewer padding concern, RESEARCH §"9 LDF Properties"):
    4 convexity of the LDF simplex          — STRUCTURAL (property of the set {L_K}, not one pool)
    5 extreme points = single-tick LDFs     — STRUCTURAL (basis/spanning statement)
    6 scale-homogeneity ℓ_K = L·L_K degree-1 — STRUCTURAL (definitional in the normalization)
    7 shapeshifting (Bunni location/shape)   — N/A this phase (not instantiated for a raw L_K)
    8 tick→price pushforward Jacobian        — DEFINITIONAL (fixed math, optional sanity check)
    9 atomic/discrete on the lattice         — STRUCTURAL (the reconstruction is lattice-valued)
"""
from __future__ import annotations

from collections.abc import Mapping
from typing import Iterable


class _StepLiquidity(Mapping):
    """Piecewise-constant active-liquidity step function over the tick axis.

    Built from the sorted distinct event ticks and the running cumsum value that takes effect
    AT and ABOVE each such tick. `__getitem__(i)` evaluates the step at any integer tick i:
    the active liquidity at i is the cumsum level of the greatest event tick ≤ i (0 below the
    first event tick / above the last, where the cumsum has returned to 0). This makes the
    half-open band semantics exact: for a single Mint on [bottomTick, topTick) the value is the
    minted amount on [bottomTick, topTick) and 0 at topTick and beyond.
    """

    __slots__ = ("_breaks", "_levels", "_support", "_tick_spacing")

    def __init__(self, breaks: list[int], levels: list[int]):
        # breaks: sorted distinct event ticks; levels[k] = cumsum active liquidity on [breaks[k], breaks[k+1])
        self._breaks = breaks
        self._levels = levels
        self._tick_spacing = 1  # Δ_{i_X}; set by reconstruct_LK from the pool's true tick spacing
        # compact support = the half-open span where active liquidity is strictly positive
        pos = [breaks[k] for k, v in enumerate(levels) if v > 0]
        self._support = (min(pos), max(breaks)) if pos else None

    def _level_at(self, i: int) -> int:
        # greatest break ≤ i; below the first break the active liquidity is 0
        lvl = 0
        for k, b in enumerate(self._breaks):
            if b <= i:
                lvl = self._levels[k]
            else:
                break
        return lvl

    def __getitem__(self, i: int) -> int:
        return self._level_at(int(i))

    def __iter__(self):
        # iterate the event ticks (the breakpoints) — the distinct levels live at these keys
        return iter(self._breaks)

    def __len__(self) -> int:
        return len(self._breaks)

    @property
    def support(self) -> tuple[int, int] | None:
        return self._support

    @property
    def breaks(self) -> list[int]:
        return list(self._breaks)


def active_liquidity(net_rows: Iterable[dict]) -> _StepLiquidity:
    """tick → unnormalized active-liquidity cumsum ℓ_K, as a piecewise-constant step function.

    net_rows = [{"tick": int, "liquidity_net": int}] — already SIGNED per the convention above
    (+@bottom/-@top for Mint, reversed for Burn). Group-sum per tick, then running cumsum over
    sorted ticks. Mirrors the Dune `SUM(liquidity_net) OVER (ORDER BY tick)` window.
    """
    # group-sum net liquidity per tick
    per_tick: dict[int, int] = {}
    for r in net_rows:
        t = int(r["tick"])
        per_tick[t] = per_tick.get(t, 0) + int(r["liquidity_net"])

    ticks = sorted(per_tick)
    levels: list[int] = []
    running = 0
    for t in ticks:
        running += per_tick[t]
        levels.append(running)
    return _StepLiquidity(ticks, levels)


def reconstruct_LK(net_rows: Iterable[dict], tick_spacing: int = 1) -> _StepLiquidity:
    """Reconstruct the active-liquidity distribution L_K from signed-liquidityNet event rows.

    Returns a piecewise-constant step function `lk` so `lk[i]` is the active liquidity at tick i
    (unnormalized ℓ_K). Normalization to Σ L_K(i)·Δ_{i_X} = 1 is applied inside `ldf_properties`
    (the test contract reads RAW active liquidity from `reconstruct_LK`, e.g. lk[0] == 1000, and
    the NORMALIZED mass from `ldf_properties`).

    `tick_spacing` is part of the downstream interface (apparatus.py in Plan 05 consumes
    `reconstruct_LK(net_rows, tick_spacing)`); it is carried as the step function's `Δ_{i_X}` so
    normalization can use the pool's true tick spacing rather than the raw inter-break width. The
    step function itself is spacing-agnostic (it evaluates the cumsum at any integer tick); the
    spacing only enters the `ldf_properties` mass integral, where it can be passed explicitly.
    """
    lk = active_liquidity(net_rows)
    lk._tick_spacing = int(tick_spacing)
    return lk


def current_tick_cross_check(lk: _StepLiquidity, current_tick: int, pool_liquidity: int) -> bool:
    """Built-in cross-check: active-liquidity cumsum at the current tick == pool.liquidity().

    `pool_liquidity` is the value of one archive `eth_call` to `pool.liquidity()` at the snapshot
    block (or the `Swap.liquidity` field of the last swap ≤ snapshot). Offline-testable: the live
    value is INJECTED — this function does NO network I/O (RESEARCH §"Cross-check"; Pitfall 1).
    """
    return lk[current_tick] == pool_liquidity


def ldf_properties(lk: _StepLiquidity, tick_spacing: int | None = None) -> dict:
    """LDF properties 1, 2, 3 (RESEARCH §"9 LDF Properties"). 4-9 are structural — see module docstring.

    Returns:
      non_negative          (prop 1, FALSIFIABLE): every active-liquidity level ≥ 0.
      mass_in_unit_interval (prop 1, FALSIFIABLE): each normalized mass L_K(i)·Δ_{i_X} ∈ [0, 1].
      total_mass            (prop 2, CODE-CORRECTNESS): Σ L_K(i)·Δ_{i_X}, must be 1 within 1e-9.
      compact_support       (prop 3, FALSIFIABLE): support is a finite tick band.
      zero_outside_support  (prop 3, FALSIFIABLE): active liquidity is 0 outside the band (no leaked
                            mass from an unmatched Burn).
    """
    if tick_spacing is None:
        tick_spacing = getattr(lk, "_tick_spacing", 1)

    breaks = lk.breaks
    levels = [lk[b] for b in breaks]

    non_negative = all(v >= 0 for v in levels)

    # normalization: total mass = Σ ℓ_K on each half-open [break_k, break_{k+1}) times its tick width.
    # Width of interval k = (break_{k+1} - break_k); the last break carries 0 active liquidity (cumsum
    # has returned to zero), so it contributes no mass. Δ_{i_X} is folded into the interval width here.
    total_unnorm = 0
    for k in range(len(breaks) - 1):
        width = breaks[k + 1] - breaks[k]
        total_unnorm += levels[k] * width

    if total_unnorm == 0:
        return {
            "non_negative": non_negative,
            "mass_in_unit_interval": True,
            "total_mass": 0.0,
            "compact_support": lk.support is None,
            "zero_outside_support": True,
        }

    # normalized per-interval masses
    masses = []
    for k in range(len(breaks) - 1):
        width = breaks[k + 1] - breaks[k]
        masses.append((levels[k] * width) / total_unnorm)

    total_mass = sum(masses)
    mass_in_unit_interval = all(0.0 <= m <= 1.0 + 1e-12 for m in masses)

    support = lk.support
    compact_support = support is not None and support[0] > float("-inf") and support[1] < float("inf")
    # zero outside support: levels strictly below i_min and at/above i_max are 0
    i_min, i_max = support
    zero_outside_support = (lk[i_min - tick_spacing] == 0) and (lk[i_max] == 0)

    return {
        "non_negative": non_negative,
        "mass_in_unit_interval": mass_in_unit_interval,
        "total_mass": float(total_mass),
        "compact_support": bool(compact_support),
        "zero_outside_support": bool(zero_outside_support),
    }
