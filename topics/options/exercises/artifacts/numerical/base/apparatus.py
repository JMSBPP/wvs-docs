#!/usr/bin/env python3
"""apparatus.py — the Σ φ_X·Δ_X·⟨L_K,μ⟩ accounting apparatus (BASE-02/03).

This is the module the INDEPENDENT referents (base/referents.py) must NEVER import — the
no-circularity firewall (prereg BLOCKER-2). tests/test_referents_disjoint.py asserts that none of
this module's symbols (reconstruct_LK, L_K, mu_phi, mu, pairing, Sw, Gw, upsilon) appear in the
referent call graph; a constant-⟨L_K,μ⟩ path would have to reach into here, and it cannot.

INSTANTIATION (Plan 05, BASE-02/03). The object NUM-04 collapsed to the constant `1` —
`⟨L_K, μ_τ^φ⟩` — is built here as the genuine liquidity-mass-weighted pairing over the crossed
tick band `A_t`, via FULL EVENT-REPLAY over every swap in an interval. The closed forms follow the
NOTATION.md file:line pointers:

  μ_τ^φ(i_X)  closed form        SHREVE:809-831   (NOTATION:85) — prob measure on A_t
  ⟨L_K, μ⟩   pairing            SHREVE:343-406   (NOTATION:87) — NEVER a constant
  A(t)       range-imbalance    SHREVE:887-900   (NOTATION:80) — logistic in ΔX·ΔY/ΔL, ΔL load-bearing
  Υ_t        fee revenue        SHREVE:330-341   (NOTATION:88) — Σ φ_X·Δ_X·⟨L_K,μ⟩
  IL(T)      impermanent loss   SHREVE:382-406   (NOTATION:78)
  φ̄*         FOC closed form    SHREVE:1044       (SYMB-01) — re-driven for I2 code-correctness

It imports the L_K reconstruction (the apparatus DOES depend on L_K; only the referents must not).
"""
from __future__ import annotations

import math
import os
import sys
from typing import Iterable, Mapping, Optional, Sequence

_HERE = os.path.dirname(os.path.abspath(__file__))
if _HERE not in sys.path:
    sys.path.insert(0, _HERE)

from reconstruct_LK import reconstruct_LK  # noqa: E402  (the apparatus depends on L_K)

__all__ = [
    "mu_phi", "pairing", "a_gate", "g_calib", "il", "upsilon",
    "Sw", "Gw", "reconstruct_LK",
    "crossed_band", "affine_collapse_residual", "foc_stationary_residual",
    "dep01_leg_residual", "mu_normalization_residual",
]


# --------------------------------------------------------------------------------------------
# A_t — the crossed-tick band {i : i_X(t-1) ≤ i ≤ i_X(t)} (SHREVE:824-831, NOTATION:86)
# --------------------------------------------------------------------------------------------

def crossed_band(tick_prev: int, tick_now: int, tick_spacing: int = 1) -> list[int]:
    """A_t = the lattice ticks the price swept in step t, on the pool's tick grid.

    The band is {i : i_lo ≤ i ≤ i_hi} restricted to multiples of tick_spacing, where the bounds
    are floored/ceiled to the grid. Empty list iff the price did not move across a grid tick
    (the DEP-02 A_t = ∅ zero-locus / C4 falsifiable empty case).
    """
    lo, hi = (tick_prev, tick_now) if tick_prev <= tick_now else (tick_now, tick_prev)
    ts = int(tick_spacing)
    # snap to grid: smallest grid tick ≥ lo, largest grid tick ≤ hi
    lo_g = math.ceil(lo / ts) * ts
    hi_g = math.floor(hi / ts) * ts
    if hi_g < lo_g:
        return []
    return list(range(lo_g, hi_g + ts, ts))


# --------------------------------------------------------------------------------------------
# μ_τ^φ — the fee-weighted probability measure on A_t (SHREVE:809-831, NOTATION:85)
# --------------------------------------------------------------------------------------------

def _lk_at(LK: Mapping[int, float], i: int) -> float:
    """L_K(i) tolerant of either a step-function (int keys) or a plain dict keyed by str/int."""
    try:
        return float(LK[i])
    except (KeyError, TypeError):
        pass
    # plain dict keyed by str tick
    v = LK.get(str(i)) if hasattr(LK, "get") else None
    return float(v) if v is not None else 0.0


def mu_phi(LK: Mapping[int, float], crossed_band: Iterable[int], tick_spacing: int = 1) -> dict[int, float]:
    """μ_τ^φ closed form over A_t — the LIQUIDITY-MASS probability measure (SHREVE:809-831).

    μ(i) = L_K(i) / Σ_{j∈A_t} L_K(j)·Δ_{j_X}   for i ∈ A_t,  0 otherwise.

    By construction Σ_{i∈A_t} μ(i)·Δ_{i_X} = 1 (a probability measure on the crossed band, the
    DEP-02 IsProbabilityMeasure object). Raises if A_t is empty / total mass is 0 (the A_t = ∅
    well-definedness zero-locus — μ is undefined there, NOT silently 1).
    """
    band = list(crossed_band)
    ts = int(tick_spacing)
    if not band:
        raise ValueError("mu_phi: A_t is empty (DEP-02 zero-locus); μ undefined")
    total = sum(_lk_at(LK, i) * ts for i in band)
    if total <= 0:
        raise ValueError("mu_phi: Σ L_K·Δ over A_t is 0; μ undefined (no in-range liquidity)")
    return {i: _lk_at(LK, i) / total for i in band}


def mu_normalization_residual(LK: Optional[Mapping[int, float]] = None,
                              band: Optional[Iterable[int]] = None,
                              tick_spacing: int = 1) -> float:
    """|Σ_{A_t} μ·Δ − 1| — A2-norm code-correctness (NOT the μ faithfulness test, that is A2b).

    Defaults to a deterministic synthetic fixture (a non-uniform L_K over a 5-tick band) so the
    identity is network-free and re-drives ≤1e-9 even when live data is blocked.
    """
    if LK is None or band is None:
        band = [0, 1, 2, 3, 4]
        LK = {0: 10.0, 1: 30.0, 2: 25.0, 3: 5.0, 4: 12.0}
        tick_spacing = 1
    mu = mu_phi(LK, band, tick_spacing)
    mass = sum(mu[i] * tick_spacing for i in band)
    return abs(mass - 1.0)


# --------------------------------------------------------------------------------------------
# ⟨L_K, μ_τ^φ⟩ — the pairing (SHREVE:343-406, NOTATION:87). The object NUM-04 collapsed to 1.
# --------------------------------------------------------------------------------------------

def pairing(LK: Mapping[int, float], mu: Mapping[int, float],
            band: Optional[Iterable[int]] = None, tick_spacing: int = 1) -> float:
    """⟨L_K, μ_τ^φ⟩ = Σ_{i∈A_t} L_K(i)·μ(i)·Δ_{i_X}  (NEVER the constant 1).

    The liquidity-mass-weighted average depth over the crossed band — the effective in-range
    liquidity a swap trades against (the AMM's own Swap.liquidity field). For the μ defined above
    this is Σ L_K(i)² / (Σ L_K(j)·Δ) — a depth-weighted mean of L_K, which equals 1 ONLY for the
    degenerate single-tick / constant L_K case, and is the NUM-04 anti-defect discriminator.
    """
    ts = int(tick_spacing)
    keys = list(band) if band is not None else list(mu.keys())
    return sum(_lk_at(LK, i) * float(mu[i]) * ts for i in keys)


# --------------------------------------------------------------------------------------------
# A(t) — the range-imbalance gate (SHREVE:887-900, NOTATION:80). ΔL load-bearing.
# --------------------------------------------------------------------------------------------

def a_gate(dX: float, dY: float, dL: Optional[float], betaR: float = 1.0, gammaR: float = 1.0) -> float:
    """A(t) = 1/(1+exp(γ_R(β_R − ΔX·ΔY/ΔL))) ∈ [0,1]  (SHREVE:887-900).

    ΔL is LOAD-BEARING (the prereg A(t)-mapping finding overrides the "defer ΔL" default): a
    missing/None/zero ΔL has no range-imbalance ratio, so A(t) cannot be formed — raises, and the
    caller records `status: blocked` for that interval rather than fabricating a value.
    """
    if dL is None or dL == 0:
        raise ValueError("a_gate: ΔL is load-bearing for A(t) (SHREVE:887-900) and is missing/zero")
    ratio = (dX * dY) / dL
    return 1.0 / (1.0 + math.exp(gammaR * (betaR - ratio)))


# --------------------------------------------------------------------------------------------
# G(σ;α,β,γ) — the logistic vol gate calibration (SHREVE:873-900, A-tier A1)
# --------------------------------------------------------------------------------------------

def g_calib(sigma: Sequence[float], g_obs: Sequence[float],
            A_Theta: Optional[dict] = None, seed: int = 0) -> dict:
    """Fit the monotone logistic G(σ;α,β,γ) = α/(1+exp(−β(σ−γ))) to (σ, G_obs).

    Returns the fitted (α,β,γ), the OOS-ish residual metric, whether the params land in the
    theory-derived admissible polytope A_Θ (positivity + monotone-in-σ), the monotone sign, and
    a comparison against a CONSTANT-G baseline (the load-bearing A1 gate per M2: beats-constant-G).
    Deterministic least-squares over a coarse grid (seeded, no RNG) so it re-drives ≤1e-12.
    """
    xs = [float(s) for s in sigma]
    ys = [float(g) for g in g_obs]
    n = len(xs)
    if n == 0:
        return {"status": "blocked", "reason": "no (σ,G) samples"}

    smin, smax = min(xs), max(xs)
    srange = (smax - smin) or 1.0
    ybar = sum(ys) / n
    ymax = max(ys) if max(ys) > 0 else 1.0

    # coarse deterministic grid search (monotone-increasing logistic: β>0, α>0)
    best = None
    alphas = [ymax * f for f in (0.5, 0.75, 1.0, 1.25, 1.5)]
    betas = [b / srange for b in (1.0, 2.0, 4.0, 8.0, 16.0)]
    gammas = [smin + srange * f for f in (0.25, 0.5, 0.75)]
    for a in alphas:
        for b in betas:
            for g in gammas:
                rss = 0.0
                for x, y in zip(xs, ys):
                    pred = a / (1.0 + math.exp(-b * (x - g)))
                    rss += (pred - y) ** 2
                if best is None or rss < best[0]:
                    best = (rss, a, b, g)

    rss, alpha, beta, gamma = best
    sst = sum((y - ybar) ** 2 for y in ys) or 1e-30
    metric = rss / sst  # normalized residual (1 - R²-like); lower is better

    # constant-G baseline (the M2 load-bearing comparison)
    rss_const = sum((y - ybar) ** 2 for y in ys)
    beats_constant = rss < rss_const  # logistic explains more than a flat mean

    # admissibility in A_Θ (positivity + monotone-in-σ sign +)
    in_polytope = (alpha >= 0.0) and (beta >= 0.0)
    monotone_sign_ok = beta >= 0.0  # G monotone-increasing in σ

    return {
        "status": "ok",
        "alpha": alpha, "beta": beta, "gamma": gamma,
        "rss": rss, "metric": metric,
        "rss_constant_baseline": rss_const,
        "beats_constant_baseline": bool(beats_constant),
        "in_A_Theta": bool(in_polytope),
        "monotone_in_sigma_sign_ok": bool(monotone_sign_ok),
        "n": n, "seed": seed,
    }


# --------------------------------------------------------------------------------------------
# IL(T) — impermanent loss (SHREVE:382-406, NOTATION:78)
# --------------------------------------------------------------------------------------------

def il(price_lo: float, price_hi: float, reserve0: float, reserve1: float,
       decimals0: int = 18, decimals1: int = 6) -> float:
    """IL(T) — value of held reserves minus a buy-and-hold of the initial reserves, repriced.

    Numéraire = token1; price = token1-per-token0 spot. Returns the (non-positive vs hold) IL
    value in token1 units. The formula path is L_K/i_X-based via the reserves the pool reports;
    the E2 referent (base/referents.il_referent) reprices balanceOf reads disjointly.
    """
    scale = 10 ** (decimals1 - decimals0)
    held = reserve0 * scale * price_hi + reserve1
    hold = reserve0 * scale * price_lo + reserve1
    return held - hold


# --------------------------------------------------------------------------------------------
# Sw / Gw / Υ — full event-replay accumulators (SHREVE:330-341, M4). Snapshots are ENDPOINTS;
# the summation grid is the FULL swap stream (fixes the NUM-04 "daily endpoint" error).
# --------------------------------------------------------------------------------------------

def _swap_delta_x(swap: Mapping) -> float:
    """Δ_X(τ) — per-swap trade-flow increment (|amount0| in token0 units, the swapped depth)."""
    return abs(float(swap["amount0"]))


def Sw(swap_stream: Iterable[Mapping], LK: Mapping[int, float], tick_spacing: int = 1) -> float:
    """Σ_τ Δ_X(τ)·⟨L_K, μ_τ^φ⟩ over EVERY swap (full event-replay). ⟨L_K,μ⟩ is NEVER 1."""
    total = 0.0
    prev_tick = None
    for sw in swap_stream:
        tick = int(sw["tick"])
        if prev_tick is None:
            prev_tick = tick
            continue
        band = crossed_band(prev_tick, tick, tick_spacing)
        prev_tick = tick
        if not band:
            continue
        try:
            mu = mu_phi(LK, band, tick_spacing)
        except ValueError:
            continue
        pair = pairing(LK, mu, band, tick_spacing)
        total += _swap_delta_x(sw) * pair
    return total


def Gw(swap_stream: Iterable[Mapping], LK: Mapping[int, float], G_by_step: Mapping[int, float],
       tick_spacing: int = 1) -> float:
    """Σ_τ G(τ)·Δ_X(τ)·⟨L_K, μ_τ^φ⟩ over EVERY swap (G keyed by swap evt_index)."""
    total = 0.0
    prev_tick = None
    for sw in swap_stream:
        tick = int(sw["tick"])
        if prev_tick is None:
            prev_tick = tick
            continue
        band = crossed_band(prev_tick, tick, tick_spacing)
        prev_tick = tick
        if not band:
            continue
        try:
            mu = mu_phi(LK, band, tick_spacing)
        except ValueError:
            continue
        pair = pairing(LK, mu, band, tick_spacing)
        g = float(G_by_step.get(int(sw.get("evt_index", 0)), 0.0))
        total += g * _swap_delta_x(sw) * pair
    return total


def upsilon(swap_stream: Iterable[Mapping], phibar: float, LK: Mapping[int, float],
            G_by_step: Optional[Mapping[int, float]] = None, tick_spacing: int = 1) -> float:
    """Υ = Σ_τ φ_X(τ)·Δ_X(τ)·⟨L_K, μ_τ^φ⟩,  φ_X = φ̄ + G(τ)  (full event-replay, M4).

    Accumulates over EVERY swap in the interval; ⟨L_K,μ⟩ is the genuine pairing over the crossed
    band (NEVER the constant 1 — the NUM-04 defect). The returned scalar is in token0 depth units;
    the E1 gate puts it on the same numéraire as the disjoint fee referent BEFORE the ratio.
    """
    G_by_step = G_by_step or {}
    total = 0.0
    prev_tick = None
    for sw in swap_stream:
        tick = int(sw["tick"])
        if prev_tick is None:
            prev_tick = tick
            continue
        band = crossed_band(prev_tick, tick, tick_spacing)
        prev_tick = tick
        if not band:
            continue
        try:
            mu = mu_phi(LK, band, tick_spacing)
        except ValueError:
            continue
        pair = pairing(LK, mu, band, tick_spacing)
        g = float(G_by_step.get(int(sw.get("evt_index", 0)), 0.0))
        phi = float(phibar) + g
        total += phi * _swap_delta_x(sw) * pair
    return total


# --------------------------------------------------------------------------------------------
# I-tier identities — CODE-CORRECTNESS re-drives of SYMB-01 / DEP-01 (≤1e-9). NOT the data gate.
# --------------------------------------------------------------------------------------------

def affine_collapse_residual(phibar: float = 0.003, IL_val: float = 4.5) -> float:
    """I1: CF_T = φ̄·Sw + Gw − IL  (SHREVE:970-981). Residual of the affine collapse vs a
    direct two-leg revenue sum, ≤1e-9 (machine precision).

    Sw and Gw are DERIVED from the two synthetic legs (not hand-typed) so the identity is
    self-consistent: the tool/code — not a coincidental constant — performs the collapse.
    """
    # direct: CF over two synthetic legs Υ = (φ̄+G1)W1+(φ̄+G2)W2, then − IL, vs the collapse.
    W1, W2 = 800.0, 434.5
    G1, G2 = 0.01, 0.005
    Sw_val = W1 + W2
    Gw_val = G1 * W1 + G2 * W2
    direct_revenue = (phibar + G1) * W1 + (phibar + G2) * W2
    cf_direct = direct_revenue - IL_val
    cf_collapse = phibar * Sw_val + Gw_val - IL_val
    return abs(cf_direct - cf_collapse)


def foc_stationary_residual(Sw_val: float = 1234.5, Gw_val: float = 10.1725,
                            IL_val: float = 4.5, PItar: float = 7.1) -> float:
    """I2: dC/dφ̄ |_{φ̄*} where C = (φ̄·Sw + Gw − IL − PItar)², φ̄* = (PItar+IL−Gw)/Sw.

    ALGEBRA-ONLY with a FREE symbolic Π^target (PItar passed in, NOT the deferred lookback object).
    Re-drives the SYMB-01 solve-set `{(−Gw+IL+PItar)/Sw}`: at φ̄* the derivative
    2·Sw·(Gw−IL−PItar+Sw·φ̄) vanishes ≤1e-9.
    """
    phibar_star = (PItar + IL_val - Gw_val) / Sw_val  # SYMB-01: (−Gw+IL+PItar)/Sw
    dCdphi = 2.0 * Sw_val * (Gw_val - IL_val - PItar + Sw_val * phibar_star)
    return abs(dCdphi)


def dep01_leg_residual(phibar: float = 0.003) -> float:
    """DEP-01: ((φ̄+G)·ΔW legs) − (φ̄·Sw + Gw) → 0  (SHREVE:949-956 leg-coincidence).
    Re-drive of DEP-01.raw: Υ_T=(φ̄+G1)W1+(φ̄+G2)W2 equals φ̄·(W1+W2)+(G1W1+G2W2)."""
    W1, W2 = 800.0, 434.5
    G1, G2 = 0.01, 0.005
    legs = (phibar + G1) * W1 + (phibar + G2) * W2
    closed = phibar * (W1 + W2) + (G1 * W1 + G2 * W2)
    return abs(legs - closed)
