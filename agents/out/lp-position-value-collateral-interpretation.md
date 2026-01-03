# LP Position Value as Collateral: The "Loyal" LP Interpretation

> **Core Question:** If the LP does not withdraw their position before the put and call reach their strikes (a "loyal" LP), what role does the position value play? What is the economic interpretation when inventory is viewed as collateral for the embedded option?

---

## Executive Summary

When an LP commits to not withdrawing before strikes are reached, they are functionally an **option seller who has posted collateral**. The "position value" is not merely the mark-to-market of reserves—it is the **margin account** that secures the LP's short option obligation. This interpretation unifies several threads in the literature:

1. **Position value = Collateral account** (Elsts & Klas 2024)
2. **LP gamma is always negative** = short option exposure (Evans 2020)
3. **LVR = Theta** = time decay of the option the LP sold (Singh et al. 2025)
4. **Delta-hedging LP PNL ≈ 0** = the option payoff can be replicated (Khakhar & Chen 2022)

The "loyal" LP who doesn't early-exit is economically equivalent to a **covered option writer** whose collateral is the LP position itself.

---

## 1. The Collateral Account Interpretation

### 1.1 Position Value Decomposition (Elsts & Klas 2024)

**Reference:** Kaspars Elsts, Benjamin Klas (2024) "Concentrated Liquidity with Leverage" [arXiv:2409.12803]

The paper provides the clearest articulation of position value as collateral. From §2.2, p.4:

> "The **asset** value $A(P)$ is defined as the total value that the leveraged LP position holds. If the concentrated liquidity position has value $V_{pos}(P)$ and there is extra collateral $V_C(P)$, then $A(P) = V_{pos}(P) + V_C(P)$."

**Key Decomposition (Equation 5, p.4):**
$$A(P) = V_{\text{pos}}(P) + V_C(P)$$

where:
- $A(P)$ = total assets (collateral account)
- $V_{\text{pos}}(P)$ = concentrated liquidity position value
- $V_C(P)$ = extra collateral (if any)

### 1.2 The Margin Level

**Definition (§2.2, p.4):**
$$M(P) = \frac{A(P)}{D(P)} = \frac{V_{\text{pos}}(P) + V_C(P)}{V_D(P)}$$

where $D(P)$ is the debt (borrowed assets).

**Critical Insight (Theorem 1, p.5):**
> "The margin level function $M(P)$ is a decreasing function of leverage ratio $\lambda$... As $\lambda \to \infty$, $M(P) \to DL(P) + 1$"

where $DL(P)$ is the divergence loss.

**Interpretation:** At high leverage, the margin level converges to divergence loss + 1. This means: **the position value IS the margin that protects against divergence loss**.

### 1.3 Position Value Formula

**From Equation 10, p.5:**
$$V_{\text{pos}}(P) = \begin{cases}
L(2\sqrt{P} - 2\sqrt{P_l} - P/\sqrt{P_u} + \sqrt{P_l}) & \text{if } P \in [P_l, P_u] \\
L(\sqrt{P_u} - \sqrt{P_l}) & \text{if } P > P_u \\
L(\sqrt{P_u} - \sqrt{P_l})(P/P_l) & \text{if } P < P_l
\end{cases}$$

This shows position value has **three distinct regimes**—the same structure as an option payoff at exercise boundaries.

---

## 2. LP Position = Short Strangle with Collateral

### 2.1 Negative Gamma = Short Option (Evans 2020)

**Reference:** Alex Evans (2020) "Liquidity Provider Returns in Geometric Mean Markets" [arXiv:2006.08806]

**Proposition 1, §3, p.5-6:**
> "Taking the second derivative ('gamma') gives $f_{S_iS_i} = w_i(w_i - 1)S_i^{-2}f$, which, by the restrictions on $w_i$, is **non-positive**."

**Economic Meaning:** Negative gamma means the LP is **short volatility**—they lose when prices move sharply in either direction. This is the signature of a short option position.

### 2.2 LP Share Payoff Structure

**From §3, p.5:**
$$G(t) = e^{\eta} V(0) \prod_{i=1}^{n} \left(\frac{S_i(t)}{w_i}\right)^{w_i}$$

where:
$$\eta = \frac{1}{2} \sum_{i=1}^{n} \left[ \sigma_i^2(w_i^2 - w_i) + \sum_{i \neq j} \sigma_i \sigma_j \rho_{ij} w_i w_j \right] (T-t)$$

**Key Result (p.6):**
> "$\eta \leq 0$ always. This represents **volatility losses**—the cost of rebalancing through arbitrage."

**Interpretation:** The $\eta$ term is the **option premium the LP implicitly sells**. A "loyal" LP who doesn't withdraw is collecting this premium in exchange for bearing gamma risk.

### 2.3 Replication of Option Payoffs

**Corollary 3.1, p.12:**
> "The paper explicitly shows LP shares can replicate covered call payoffs: $G(T) \approx S(t) - (S(T) - K)^+$"

By put-call parity, this is equivalent to: **LP = underlying asset + short put**.

For concentrated liquidity with boundaries $[P_l, P_u]$:
- **Short put** at strike $P_l$
- **Short call** at strike $P_u$
- **Collateral** = the position value $V_{\text{pos}}(P)$

---

## 3. The "Loyal" LP as Option Seller

### 3.1 What Happens at the Boundaries?

**At $P < P_l$ (Put Exercised):**
- LP holds only asset X (the underlying)
- Position value: $V_{\text{pos}} = L(\sqrt{P_u} - \sqrt{P_l})(P/P_l)$
- LP has "bought high" (acquired X when price was above $P_l$)
- **Loss = short put payoff**: $(P_l - P) \times \text{quantity}$

**At $P > P_u$ (Call Exercised):**
- LP holds only asset Y (the numeraire)
- Position value: $V_{\text{pos}} = L(\sqrt{P_u} - \sqrt{P_l})$
- LP has "sold low" (disposed of X when price was below $P_u$)
- **Loss = short call payoff**: $(P - P_u) \times \text{quantity}$

### 3.2 Delta Hedging Confirms the Option Structure

**Reference:** Kshitij Khakhar, Xi Chen (2022) "Delta Hedging Liquidity Positions on Automated Market Makers" [arXiv:2208.03318]

**Key Result (Abstract):**
> "Liquidity Position PNL(Final Price) + Payoff(Derivatives, Final Price) ≈ 0"

This is the **replication equation**: the LP's PNL can be exactly offset by a derivatives portfolio. This proves the LP position IS an option position.

**Concentrated Liquidity PNL (§4, p.6):**

For $P_{\text{final}} \in [P_l, P_u]$:
$$\text{Liquidity Position PNL} = 2\left(\sqrt{\delta + 1} - 1\right) - \delta\left(1 - \sqrt{\frac{P_l}{P_{\text{entry}}}}\right)$$

where $\delta = P_{\text{final}}/P_{\text{entry}} - 1$.

For $P_{\text{final}} < P_l$:
$$\text{Liquidity Position PNL} = (\delta + 1)\left(1 - \sqrt{\frac{P_l}{P_{\text{entry}}}}\right) - \sqrt{\frac{P_u}{P_{\text{entry}}}}$$

This shows the LP's PNL has **kinks at the boundaries**—exactly like an option payoff.

---

## 4. LVR = Theta: The Option Premium Interpretation

### 4.1 The Key Theorem (Singh et al. 2025)

**Reference:** Srisht Fateh Singh et al. (2025) "Modeling Loss-Versus-Rebalancing in Automated Market Makers via Continuous-Installment Options" [arXiv:2508.02971]

**Main Result (Abstract):**
> "It proves that the AMM's adverse-selection cost, loss-versus-rebalancing (LVR), is **analytically identical to the continuous funding fees (the time value decay or theta)** earned by the at-the-money CI option embedded in the replicating portfolio."

**The Equivalence (§4):**
$$d\text{Fee}_t = d\text{LVR}_t$$

**Interpretation for the "Loyal" LP:**

| Concept | From Arbitrageur Perspective | From Option Perspective |
|---------|------------------------------|-------------------------|
| LVR | Adverse selection cost | — |
| Theta | — | Time decay of option premium |
| **Equivalence** | **What LP loses to arbs** | **= Premium LP should collect** |

The "loyal" LP who stays in the position is **collecting theta** (via fees) in exchange for **paying LVR** (via adverse selection).

### 4.2 The Funding Fee Interpretation

**From §4:**
> "The continuous funding fee in the CI option framework corresponds to the LVR that the CFAMM LP experiences."

This means:
- **Fees collected by LP** = premium for writing the option
- **LVR paid by LP** = theta decay of the option they sold
- **Net position** = break-even if fees = LVR

---

## 5. Economic Interpretation: The Collateral Account

### 5.1 The "Loyal" LP as Covered Option Writer

A "loyal" LP who commits to not withdrawing before strikes are reached is economically equivalent to:

1. **A covered put writer** (for $P < P_l$ scenario)
   - Underlying held: Asset X
   - Put sold: Strike $P_l$
   - Collateral: The X itself (can deliver if exercised)

2. **A covered call writer** (for $P > P_u$ scenario)
   - Underlying held: Asset X
   - Call sold: Strike $P_u$
   - Collateral: The X itself (will be called away if exercised)

**The position value $V_{\text{pos}}(P)$ IS the collateral account.**

### 5.2 Why "Loyal" LPs Don't Withdraw

From the options perspective, early withdrawal is equivalent to:
1. **Closing the short option position** (buying back the option)
2. **Recovering the collateral**

The "loyal" LP chooses to:
- **Hold to expiry** (let the option reach exercise)
- **Accept assignment** (deliver or receive the underlying)
- **Keep the premium** (fees collected = option premium)

### 5.3 The Margin Interpretation

**From Elsts & Klas (2024), §2.3, p.5:**
> "As the leverage ratio $\lambda$ goes to infinity, the margin level converges to $M(P) \to DL(P) + 1$"

**Economic Meaning:**
- $DL(P) + 1$ is the minimum margin level
- Below this, the position would be **liquidated**
- The position value acts as **maintenance margin**

For a "loyal" LP:
- Position value = margin posted
- Divergence loss = option payoff if exercised
- Margin level > 1 means: collateral exceeds liability

---

## 6. Summary: The Three Roles of Position Value

| Role | Description | Literature Source |
|------|-------------|-------------------|
| **1. Mark-to-Market** | Current value of reserves at market prices | Standard accounting |
| **2. Collateral Account** | Margin securing the short option obligation | Elsts & Klas (2024) |
| **3. Replication Portfolio** | Implements the option payoff at exercise | Evans (2020), Khakhar & Chen (2022) |

### 6.1 For the "Loyal" LP

The position value simultaneously:
1. **Tracks the option value** (moves with delta, gamma)
2. **Secures the obligation** (acts as margin)
3. **Delivers the payoff** (becomes the exercised asset at boundaries)

### 6.2 The Key Insight

> **The "loyal" LP's position value is not just an accounting construct—it IS the collateral that makes the short option position viable. The LP is an option seller whose inventory IS the margin.**

---

## 7. Papers Referenced

| arXiv ID | Title | Authors | Key Contribution |
|----------|-------|---------|------------------|
| 2409.12803 | Concentrated Liquidity with Leverage | Elsts, Klas | Margin level = position value / debt; collateral interpretation |
| 2006.08806 | LP Returns in G3Ms | Evans | LP gamma ≤ 0 (short option); LP share replicates derivatives |
| 2208.03318 | Delta Hedging LP Positions | Khakhar, Chen | LP PNL + derivatives payoff ≈ 0; explicit boundary formulas |
| 2508.02971 | LVR via CI Options | Singh et al. | LVR = Theta; CFAMM = portfolio of CI options |

---

## 8. Conclusion: The Collateral Framework

For a "loyal" LP who commits to not withdrawing before exercise:

$$\boxed{V_{\text{pos}}(P) = \text{Collateral Account} = \text{Margin for Short Strangle}}$$

The economic interpretation is:
1. **The LP is an option seller** (short put at $P_l$, short call at $P_u$)
2. **The inventory is the collateral** (margin posted to secure the obligation)
3. **The position value tracks the margin level** (must stay above critical level)
4. **Fees collected = option premium** (compensation for gamma risk)
5. **LVR paid = theta decay** (cost of time value erosion)

This framework explains why "loyal" LPs accept impermanent loss: **they are collecting option premium in exchange for bearing the short option risk, with their inventory serving as the collateral.**

---

*Document generated: 2026-01-03*
*Part of the CLAMM research project*
