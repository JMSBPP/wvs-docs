# LP Position as Short Put Option: The Lower Bound for Optimal Fees

> **Core Question:** Has the lower bound for optimal fees — defined as the fair price of the put option the LP implicitly sells — been studied in the literature?

---

## Executive Summary

The literature has extensively studied the **upper bound** for optimal fees (balancing against arbitrageurs through LVR and equilibrium analysis). However, the **lower bound** — the fair option premium owed to LPs as sellers of embedded options — has received less explicit attention but IS addressed in several important papers through:

1. **Option replication frameworks** showing LP positions ARE derivatives
2. **IL as contingent claim** with explicit Black-Scholes pricing
3. **LVR = Theta** equivalence proving adverse selection equals option time decay
4. **Static hedging** formulas using vanilla options to price IL

The key insight: **the lower bound exists implicitly in papers that price the LP's embedded option exposure, but is not yet explicitly framed as a fee floor in the optimal fee literature.**

---

## 1. Evans (2020) — LP Shares Replicate Financial Derivatives

**Reference:** Alex Evans (2020) "Liquidity Provider Returns in Geometric Mean Markets" [arXiv:2006.08806]

### 1.1 Core Finding: LP Payoff Has Option-Like Structure

**Section 3, Proposition 1, p.5:**
The LP share payoff in a constant-weight G3M is:

$$G(t) = e^{\eta} V(0) \prod_{i=1}^{n} \left(\frac{S_i(t)}{w_i}\right)^{w_i}$$

where:
$$\eta = \frac{1}{2} \sum_{i=1}^{n} \left[ \sigma_i^2(w_i^2 - w_i) + \sum_{i \neq j} \sigma_i \sigma_j \rho_{ij} w_i w_j \right] (T-t)$$

**Key result (p.5-6):** $\eta \leq 0$ always. This represents **volatility losses** — the cost of rebalancing through arbitrage.

### 1.2 LP Gamma Is Always Negative (Concave Payoff)

**Section 3, p.6:**
> "Taking the second derivative ('gamma') gives $f_{S_iS_i} = w_i(w_i - 1)S_i^{-2}f$, which, by the restrictions on $w_i$, is **non-positive**."

This proves LP shares have **negative gamma** — equivalent to a short option position.

### 1.3 G3Ms Can Replicate Any Derivative

**Section 5, Proposition 3, p.10:**
> "We show that setting the weight of a G3M equal to the elasticity of a given payoff function ensures that the LP shares replicate the payoff."

**Corollary 3.1 (Covered Call), p.12:**
The paper explicitly shows LP shares can replicate covered call payoffs:
$$G(T) \approx S(t) - (S(T) - K)^+$$

This directly supports the **LP = short put + underlying** interpretation.

---

## 2. Lipton, Lucic & Sepp (2024) — IL as Contingent Claim with Black-Scholes Valuation

**Reference:** Alexander Lipton, Vladimir Lucic, Artur Sepp (2024) "Unified Approach for Hedging Impermanent Loss of Liquidity Provision" [arXiv:2407.05146]

### 2.1 IL Is a Contingent Claim

From abstract:
> "We show that the IL can be seen as a **contingent claim with a non-linear payoff** for a fixed maturity date."

This is the most direct statement that LP losses are option payoffs with fair prices.

### 2.2 IL Protection Claim

> "We introduce the contingent claim termed as **IL protection claim** which delivers the negative of IL payoff at the maturity date."

The IL protection claim IS the option the LP implicitly sells. Its fair value = the **lower bound for fees**.

### 2.3 Two Valuation Methods

**Static (Model-Independent):**
> "We develop the **static model-independent replication method** for the valuation of IL protection claim using traded European vanilla call and put options."

**Dynamic (Black-Scholes):**
> "We derive **analytic valuation formulas** using a wide class of price dynamics for which the characteristic function is available under the risk-neutral measure... under the Black-Scholes-Merton model and the log-normal stochastic volatility model."

**Implication:** The fair option premium the LP should receive CAN be computed using standard derivatives pricing.

---

## 3. Singh et al. (2025) — LVR = Option Theta

**Reference:** Srisht Fateh Singh et al. (2025) "Modeling Loss-Versus-Rebalancing in Automated Market Makers via Continuous-Installment Options" [arXiv:2508.02971]

### 3.1 AMM Position = Exotic Option Portfolio

From abstract:
> "This paper mathematically models a constant-function automated market maker (CFAMM) position as a portfolio of exotic options, known as **perpetual American continuous-installment (CI) options**."

### 3.2 The Key Theorem: LVR = Theta

> "It proves that the AMM's adverse-selection cost, loss-versus-rebalancing (LVR), is **analytically identical to the continuous funding fees (the time value decay or theta)** earned by the at-the-money CI option embedded in the replicating portfolio."

**Critical Implication:**
- **LVR** = what arbitrageurs extract (upper bound concern)
- **Theta** = option time decay the LP should be compensated for (lower bound concern)
- **LVR = Theta** means: the upper bound analysis and lower bound analysis converge to the same quantity!

This is the closest the literature comes to unifying both bounds.

---

## 4. Deng, Zong & Wang (2022) — Static Replication Formulas

**Reference:** Jun Deng, Hua Zong, Yun Wang (2022) "Static Replication of Impermanent Loss for Concentrated Liquidity Provision" [arXiv:2205.12043]

### 4.1 IL as Option Combination

**Proposition 3.2, p.3-4:**
The unit impermanent loss (UIL) is characterized as:

$$\text{UIL}^R = 2\left(\sqrt{P_t} - \sqrt{P_l}\right)^+ + 2\left(\sqrt{P_t} - \sqrt{P_u}\right)^+ - \frac{1}{\sqrt{P_l}}(P_t - P_l)^+ + \frac{1}{\sqrt{P_u}}(P_t - P_u)^+$$

This shows IL = **combination of calls on price and calls on √price**.

### 4.2 Static Replication Formula

**Proposition 3.5, Equations (9)-(10), p.4:**

$$\mathbb{E}[\text{UIL}^R] = -\frac{1}{2} \int_{P_l}^{P_u} K^{-3/2} C(K) dK$$

$$\mathbb{E}[\text{UIL}^L] = -\frac{1}{2} \int_{S_l}^{S_u} K^{-3/2} P(K) dK$$

where $C(K)$ and $P(K)$ are European call and put option prices.

**This provides an explicit formula for the fair value of IL using market option prices.**

### 4.3 Greeks of LP Position

**Section 3, p.4:**
> "The impermanent losses inherit all option Greeks such as delta, gamma and vega risk factors."

**Delta:** $\frac{\partial \mathbb{E}[\text{UIL}^R]}{\partial P} = -\frac{1}{2} \int_{P_l}^{P_u} K^{-3/2} \Delta_C(K) dK$

---

## 5. Bardoscia & Nodari (2023) — LP Greeks and Impermanent Gain

**Reference:** Niccolò Bardoscia, Alessandro Nodari (2023) "Liquidity Providers Greeks and Impermanent Gain" [arXiv:2302.11942]

### 5.1 Black-Scholes Greeks for LPs

From abstract:
> "We tailor the formulas introduced by Black & Scholes to DeFi, proposing a **method to calculate the greeks of an LP**."

### 5.2 Impermanent Gain = Hedging Product

> "We also introduce **Impermanent Gain**, a product that LPs can use to hedge their position and traders can use to bet on a rise in volatility."

**Key insight:** If there's a product to hedge LP losses, that product has a fair price — which IS the lower bound for fees.

---

## 6. Connection to the Sales Pitch Framework

From the `sales-pitch.ipynb` analysis:
> "The optimal fee is bounded below by the premium of the option for the LP as option seller and above by the arbitrageur's payoff."

### 6.1 The Two Bounds

| Bound | Economic Meaning | Literature Coverage |
|-------|------------------|---------------------|
| **Upper** | Max fee before arbitrageurs stop trading | Extensive (LVR, am-AMM, dynamic fees) |
| **Lower** | Fair option premium for LP's short position | Implicit in option pricing papers |

### 6.2 The Gap in the Literature

The papers above establish:
1. LP position HAS option-like payoff (Evans, Deng et al.)
2. IL CAN be priced using Black-Scholes (Lipton et al.)
3. LVR EQUALS option theta (Singh et al.)

**What's missing:** An explicit paper that says:
> "The minimum fee an LP should charge is the fair value of the option they implicitly sell, computed as [formula]"

The framework exists; the explicit framing does not.

---

## 7. Synthesis: Why the Lower Bound Matters

### 7.1 The Arbitrageur-Focused Literature

Papers like Adams et al. (am-AMM), Alexander & Fritz, and Baggiani et al. focus on:
- How fees affect arbitrageur behavior
- Equilibrium between fee revenue and arb losses
- Dynamic fees to adapt to volatility

### 7.2 The Missing LP-Focused Perspective

The option pricing papers (Evans, Lipton, Deng, Singh) establish:
- LP sells an option implicitly
- That option has a fair price
- The fair price can be computed

**But they don't explicitly say:** "This fair price is the minimum fee the LP should accept."

### 7.3 The Unified View

From Singh et al.'s **LVR = Theta** result:
- **Upper bound analysis** (LVR literature): Fee must compensate for adverse selection
- **Lower bound analysis** (Option pricing): Fee must compensate for option premium sold

These are the **same quantity** viewed from different perspectives:
- LVR = loss to informed flow = upper bound concern
- Theta = option time decay = lower bound concern
- LVR = Theta proves the bounds converge

---

## 8. Papers Downloaded to refs/agents/pdf/

| File | Paper | Authors | Key Contribution |
|------|-------|---------|------------------|
| `2006.08806-evans-lp-returns-g3m.pdf` | LP Returns in G3Ms | Evans | LP shares replicate derivatives |
| `2407.05146-lipton-hedging-impermanent-loss.pdf` | Unified IL Hedging | Lipton, Lucic, Sepp | IL as contingent claim, Black-Scholes pricing |
| `2508.02971-singh-lvr-continuous-installment-options.pdf` | LVR via CI Options | Singh et al. | LVR = Theta of embedded option |
| `2205.12043-deng-static-replication-il.pdf` | Static Replication of IL | Deng, Zong, Wang | Explicit option formulas for IL |
| `2302.11942-bardoscia-lp-greeks.pdf` | LP Greeks | Bardoscia, Nodari | Black-Scholes Greeks for LPs |
| `2205.09890-sterrett-replicating-portfolios.pdf` | Replicating Portfolios | Sterrett, Jepsen, Kim | On-chain option replication via RMM |

---

## 9. Conclusion: State of the Art

### What HAS Been Done:
1. **LP = Derivative** equivalence is established (Evans 2020)
2. **IL pricing** using Black-Scholes exists (Lipton et al. 2024)
3. **LVR = Theta** unifies upper/lower bound perspectives (Singh et al. 2025)
4. **Static replication formulas** provide explicit pricing (Deng et al. 2022)

### What Has NOT Been Done:
- **Explicit lower bound theorem** stating: "Optimal fee ≥ fair option premium"
- **Integration** of option pricing into optimal fee design literature
- **Empirical calibration** of option-implied fee floors

### Research Opportunity:
A paper that explicitly frames optimal fee design with:
$$\gamma^* \in \left[ \underbrace{\text{Option Premium}}_{\text{Lower Bound (LP Fair Compensation)}}, \underbrace{\text{Arbitrageur Payoff}}_{\text{Upper Bound (Market Efficiency)}} \right]$$

This would bridge the gap between the fee optimization literature and the LP-as-derivatives literature.

---

*Document generated: 2026-01-03*
*Part of the CLAMM research project*
