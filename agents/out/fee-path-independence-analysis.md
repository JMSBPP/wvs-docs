# Why Optimal Trading Fees Cannot Be Path-Dependent

> **Core Question:** Is there a theorem that proves optimal trading fees cannot be path-dependent?

---

## Executive Summary

Based on comprehensive analysis of the CFMM literature, **there is no single theorem that directly proves optimal fees must be path-independent**. However, the theoretical framework from LVR, optimal fee theory, and mechanism design collectively implies that optimal fees depend on **instantaneous state variables** (volatility, liquidity, external price) rather than **trade history**.

---

## 1. Key Finding: Optimal Fees Are State-Dependent

### 1.1 Alexander & Fritz (2024) — The Fee Invariance Result

**Reference:** Alexander & Fritz (2024) [arXiv:2404.03976], Section 3, p.6-8

The most direct evidence comes from their random walk analysis. Key finding:

> "The main finding in this section is that **under steady conditions, the actual choice of a fee is relatively unimportant and the gains of the AMM are invariant under this choice**. This can be traced back to an interplay between the specific arbitrage reward structure... and fundamental properties of one-dimensional random walks."

**Mechanism:** They show (Section 2, p.5, Eq. 17-18):
- Arbitrage threshold: δα > f (linear in fee)
- Arbitrage reward: R^opt ∝ f² / pi_A (quadratic in fee)
- Time to reach threshold: t ∝ f² (quadratic in fee)

Since reward scales as f² and time-to-threshold scales as f², **time-averaged rewards are invariant under fee choice** for sideways motion.

**Critical insight (Section 3, p.8):**
> "If we compare two different fees, f_I and f_II = 2f_I that define an arbitrage threshold σ_II = 2σ_I. This implies that the times to reach it are related according to t_II = 4t_I. On the other hand... rewards R_II = 4R_I. So indeed, time-averaged rewards are identical."

### 1.2 Baggiani, Herdegen & Sánchez-Betancourt (2025) — Optimal Dynamic Fees

**Reference:** Baggiani, Herdegen & Sánchez-Betancourt (2025) [arXiv:2506.02869]

Key finding from abstract:
> "Dynamic fees that are **linear in inventory and are sensitive to changes in the external price** are a good approximation of the optimal fee structure."

This confirms optimal fees are **state-dependent** (current inventory, current price) not **path-dependent** (history of trades).

Two distinct fee regimes identified:
1. **Higher fees regime:** Deter arbitrageurs
2. **Lower fees regime:** Attract noise traders through increased volatility

---

## 2. The LVR Framework — Fees Compensate Instantaneous Loss

### 2.1 Milionis et al. (2022) — Loss-Versus-Rebalancing

**Reference:** Milionis, Moallemi, Roughgarden & Zhang (2022) [arXiv:2208.06046]

The foundational LVR paper establishes:
- LVR = instantaneous adverse selection cost due to stale prices
- LVR depends on **current volatility σ** and **current liquidity L**
- LVR does NOT depend on the sequence of trades that brought the pool to current state

**Key result (cited in Adams et al., 2024, p.2):**
> "This paper builds directly on the loss-vs-rebalancing framework established in Milionis et al. (2022)."

### 2.2 Milionis et al. (2023) — Fees and Arbitrage Profits

**Reference:** Milionis, Moallemi & Roughgarden (2023) [arXiv:2305.14604]

From abstract:
> "We extend the model of Milionis et al. [2022] for a general class of two asset AMMs to introduce both fees and discrete Poisson block generation times."

Key finding:
> "When fees are low, in the fast block asymptotic regime, the impact of fees takes a particularly simple form: **fees simply scale down arbitrage profits by the fraction of blocks which present profitable trading opportunities**."

This shows fees affect instantaneous arbitrage opportunities, not historical path.

### 2.3 Bichuch & Feinstein (2025) — Implied Fees Equal LVR

**Reference:** Bichuch & Feinstein (2025) [arXiv:2509.23222], Section 4, Theorem 4.2, p.9

They prove the **implied fee structure** for a risk-neutral LP:

$$
F(p_x, p_y) = p_y \cdot \ell(p_x/p_y)
$$

where ℓ is the instantaneous LVR:

$$
\ell(q) = -\frac{1}{2}(\sigma_x^2 - 2\rho\sigma_x\sigma_y + \sigma_y^2) q^2 x'(q) = \frac{1}{2}(\sigma_x^2 - 2\rho\sigma_x\sigma_y + \sigma_y^2) q y'(q)
$$

**Key result (Corollary 4.3, p.9):**
> "A risk-neutral LP is indifferent on all stopping times... V(P_0^x, P_0^y) = C(P_0^x, P_0^y)"

The implied fee depends only on **instantaneous volatilities** (σ_x, σ_y), **correlation** (ρ), and **current price** (q) — not on trade history.

---

## 3. The Arbitrage Consistency Argument

### 3.1 Adams et al. (2024) — Equilibrium Fee Formula

**Reference:** Adams, Moallemi, Reynolds & Robinson (2024) [arXiv:2403.03367], Theorem 1, p.8

The equilibrium fee in am-AMM satisfies:

$$
f^* \in \arg\max_{f \in [0, f_{\max}]} \{ fH_0(f, L) - \text{AE}_0(f) \}
$$

where:
- H_0(f, L) = noise trader demand (depends on fee and liquidity)
- AE_0(f) = arbitrageur excess (depends only on fee)

**This optimization problem has NO path-dependent terms.**

### 3.2 Arbitrageur Profits Scale Linearly with Pool Value

**Reference:** Adams et al. (2024) [arXiv:2403.03367], Assumption 2, p.6

$$
\text{ARB\_PROFIT}(f, L) = \text{AP}_0(f) \cdot V(L)
$$

The arbitrageur profit function depends on:
- Current fee f
- Current pool value V(L)

NOT on how the pool reached this state.

---

## 4. The LP Competitiveness Perspective

### 4.1 Milionis, Wan & Adams (2023) — FLAIR Metric

**Reference:** Milionis, Wan & Adams (2023) [arXiv:2306.09421], Section 2.2, p.8

They define FLAIR (Fee Liquidity-Adjusted Instantaneous Returns):

$$
\text{CM}_i(t_0, T) = \int_{t_0}^T \frac{1}{V_i(t)} \times \text{fee}_t \times \frac{L_i(\tilde{p}_t; t)}{L(\tilde{p}_t; t)} dt
$$

**Key insight (Section 1.3, p.4):**
> "The equilibrium contract depends on the **external price**, the **pool reference price**, and the **pool reserves**."

All state variables — no path dependence.

### 4.2 The Quadrant Interpretation

**Reference:** Milionis et al. (2023) [arXiv:2306.09421], Section 2.2.1, p.9

LP returns decompose into:
1. **Flow toxicity** (captured by LVR) — depends on current mispricing
2. **LP competitiveness** (captured by FLAIR) — depends on current liquidity distribution

Neither component depends on trade history.

---

## 5. Campbell et al. (2025) — Threshold-Type Dynamic Fees

**Reference:** Campbell, Bergault, Milionis & Nutz (2025) [arXiv:2508.08152]

From abstract:
> "Under normal market conditions, the optimal AMM fee is competitive with the trading cost on the CEX and **remarkably stable**, whereas in periods of very high volatility, a high fee protects passive LPs from severe losses. These findings suggest that a **threshold-type dynamic fee schedule** is both robust enough to market conditions and improves LP outcomes."

The optimal fee is:
- **State-dependent:** adjusts to current volatility regime
- **NOT path-dependent:** doesn't track historical trade sequences

---

## 6. Why Path-Dependent Fees Would Fail

### 6.1 Arbitrage Consistency

If fees depended on path history:
1. Two pools with identical current states but different histories would offer different arbitrage opportunities
2. Arbitrageurs would exploit this inconsistency
3. The pricing mechanism would be unstable

### 6.2 The Alexander & Fritz Insight

**Reference:** Alexander & Fritz (2024) [arXiv:2404.03976], Section 2.2, p.5

For a given price mismatch δα, there's an optimal fee choice:

$$
f^{opt} = \frac{\delta\alpha}{2}
$$

At this fee, the AMM retains **2/3 of arbitrage gains** while arbitrageur gets 1/3.

This optimal split depends only on **current mispricing** (δα), not on history.

---

## 7. Summary: The Implicit Non-Path-Dependence Result

While no single theorem states "optimal fees cannot be path-dependent," the literature collectively implies:

| Property | Depends On | Does NOT Depend On |
|----------|------------|-------------------|
| LVR (adverse selection) | Current σ, L, mispricing | Trade history |
| Implied fee (Bichuch & Feinstein) | Current σ_x, σ_y, ρ, q | Trade history |
| Optimal fee (Adams et al.) | Current f, L, H_0 | Trade history |
| Fee invariance (Alexander & Fritz) | Current volatility | Fee level under steady conditions |
| FLAIR (LP competitiveness) | Current V_i, L_i, fee_t | Trade history |

**The economic intuition:** Arbitrageurs make decisions based on current mispricing. Therefore, fees designed to protect against arbitrage must be calibrated to current conditions, not historical paths.

---

## 8. Papers Downloaded (refs/agents/)

| Paper ID | Title | Authors | Key Contribution |
|----------|-------|---------|------------------|
| 2404.03976 | A theoretical framework for fees in AMMs | Alexander, Fritz | Fee invariance under steady conditions |
| 2403.03367 | am-AMM: Auction-Managed AMM | Adams, Moallemi, Reynolds, Robinson | Equilibrium fee formula |
| 2306.09421 | FLAIR: LP Competitiveness Metric | Milionis, Wan, Adams | Decomposition of LP returns |
| 2509.23222 | The Price of Liquidity | Bichuch, Feinstein | Implied fee = LVR |
| 2104.00446 | Optimal Fees for G3Ms | Evans, Angeris, Chitra | Fees approach zero optimally |
| 2103.14769 | Replicating Market Makers | Angeris, Evans, Chitra | P = dR_Y/dR_X derivation |
| 2308.08066 | Geometry of CFMMs | Angeris et al. | Path independence framework |

## 9. Papers with Conversion Errors (cited from abstracts)

| Paper ID | Title | Authors | Key Contribution |
|----------|-------|---------|------------------|
| 2208.06046 | Loss-Versus-Rebalancing | Milionis, Moallemi, Roughgarden, Zhang | LVR = instantaneous adverse selection |
| 2305.14604 | AMM and Arbitrage with Fees | Milionis, Moallemi, Roughgarden | Fees scale down arbitrage by block fraction |
| 2506.02869 | Optimal Dynamic Fees | Baggiani, Herdegen, Sánchez-Betancourt | Fees linear in inventory, state-dependent |
| 2508.08152 | Optimal Fees for Liquidity Provision | Campbell, Bergault, Milionis, Nutz | Threshold-type dynamic fees |
| 2303.00208 | Myersonian Framework for AMMs | Milionis, Moallemi, Roughgarden | Bid-ask spread from adverse selection |

---

## 10. Connection to the Option Pricing Interpretation

From `questions.md`:
> "The optimal fee is bounded below by the premium of the option for the LP as option seller and above by the arbitrageur's payoff."

This is precisely correct:
- **Lower bound:** Fee must compensate LP for option premium implicitly sold
- **Upper bound:** Fee cannot exceed arbitrageur's payoff from correcting mispricing

Both bounds depend on **volatility** (option value) and **current state** (mispricing) — not on path history.

The distinction between P(Δ) and the fee:

| Object | Path-Dependent? | Role |
|--------|-----------------|------|
| P(Δ) — pricing rule | YES | Defines trading function, reserve curve |
| Fee (γ) | NO | Compensates for adverse selection, creates no-arb band |

---

*Document generated: 2026-01-03*
*Part of the CLAMM research project*
