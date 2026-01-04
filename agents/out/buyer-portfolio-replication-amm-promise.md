# The Buyer's Portfolio Replication Problem in AMM "Promises"

> **Core Question:** Given the LP's framework in NOTES.md, who is the buyer of the "promise to sell $R_X$ at $\psi_{\text{ask}}$"? At first glance, if $P_0 < \psi_{\text{ask}}$, the buyer would just buy the whole thing at $P_0$. What is the portfolio replication exercise for this buyer?

---

## The Apparent Paradox

If $P_0 < \psi_{\text{ask}}$, why wouldn't the buyer just buy $R_X$ immediately at $P_0$? Who on earth buys this option?

The resolution is subtle and important for the ALP / AMM interpretation.

---

## 1. Who is the Buyer? (Economic Identity)

The buyer is **not** someone seeking upside protection in the vanilla options sense.

**The buyer is:**
> An agent who wants **guaranteed access** to quantity $R_X$ at a known price $\psi_{\text{ask}}$, but **does not want directional exposure** before that price is reached.

### Concrete Buyer Types

#### (a) Quantity-Constrained Buyer
- Needs $R_X$ eventually
- Cannot (or will not) deploy all capital at $t=0$
- Faces financing / inventory / balance-sheet constraints

#### (b) Volatility-Averse Accumulator
- Wants to acquire $R_X$
- Does not want exposure to interim price drops
- Will only commit to buying if price reaches a threshold

#### (c) Execution-Risk Hedger
- Wants certainty of execution at $\psi_{\text{ask}}$
- Willing to pay to eliminate:
  - Slippage risk
  - Liquidity risk
  - Adverse selection risk

#### (d) Arbitrageur with External Signal
- Observes external price $P^* > P_0$
- Needs guaranteed execution without market impact uncertainty
- Has short position elsewhere that needs covering as price rises

**In AMM language:** The buyer is outsourcing execution risk and path risk to the LP.

---

## 2. Why "Just Buy at $P_0$" is NOT Equivalent

At first glance:
- $P_0 < \psi_{\text{ask}}$
- Buying now is cheaper in expectation

But buying now **changes the buyer's risk profile**.

### Strategy A: Buy Immediately at $P_0$

**Buyer:**
- Pays $P_0 \cdot R_X$
- Holds inventory immediately
- Bears:
  - Downside risk
  - Funding cost
  - Mark-to-market volatility
  - Liquidation risk

**This is a directional long.**

### Strategy B: Buy the "Promise" (LP Contract)

**Buyer:**
- Pays premium gradually (fees)
- Holds no inventory initially
- Only acquires $X$ if/when price reaches $\psi_{\text{ask}}$
- Bears:
  - Premium cost
- **Avoids:**
  - Interim downside
  - Capital lockup
  - Forced liquidation

**This is non-directional until activation.**

> **Key distinction:** The buyer is buying **conditional access**, not the asset.

---

## 3. What is the Buyer Actually Buying?

The LP's contract:
> "I offer the right to buy $R_X$ at $\psi_{\text{ask}}$"

This is a **call-like object**, but with:
- No fixed maturity
- Activation via order flow
- Payment via volume fees

### Buyer's Payoff Structure

$$\text{Payoff} = \begin{cases}
0 - \text{fees paid} & \text{if } P < \psi_{\text{ask}} \\
R_X(P - \psi_{\text{ask}}) - \text{fees} & \text{if } P \geq \psi_{\text{ask}}
\end{cases}$$

But economically, what they really want is:
> To replace **uncertain execution at unknown prices** with **guaranteed execution at a known price**.

---

## 4. The Buyer's Portfolio Replication Problem

### Goal of the Buyer

Replicate:
> "Acquire $R_X$ at price $\psi_{\text{ask}}$ if and only if the market gets there."

### Without the LP's Contract

To replicate this payoff alone, the buyer would need:
- Dynamic trading
- Continuous monitoring
- Infinite rebalancing
- Exposure to adverse price paths

**In classical finance, this is exactly why options exist.**

### With the LP's Contract (AMM / ALP Form)

The buyer replicates the payoff by holding:
1. **Cash account**
2. **The LP's promise**
3. **Flash-loan access** (risk-free borrowing)
4. **No inventory until activation**

### Replication Intuition

The buyer's synthetic position is:
$$\text{Call payoff} = \text{Long underlying} - \text{Borrowed cash}$$

But instead of dynamically hedging delta, the buyer:
- Lets the AMM pricing function do the delta adjustment
- Pays the fee stream instead of rebalancing costs
- Activates inventory only at $\psi_{\text{ask}}$

**This is exactly dual to what the LP is doing.**

---

## 5. The Call Spread Interpretation

### What the AMM Provides to the Buyer

The AMM gives **incremental call exposure**:
$$\text{Payoff from buying } d\Delta = (P^* - P(\Delta)) \cdot d\Delta$$

Integrated over the path:
$$\Pi_{\text{buyer}} = \int_0^{R_X} (P^* - P(\Delta)) \, d\Delta - \int_0^{R_X} \phi \, d\Delta$$

### Replicating Portfolio (Static Equivalent)

The buyer replicates a **continuum of digital calls**:
$$\text{Replicating Portfolio} = \int_{P_0}^{\psi_{\text{ask}}} \mathbf{1}_{P^* \geq K} \, dK$$

This equals:
- $(P^* - P_0)$ if $P_0 < P^* < \psi_{\text{ask}}$
- $(\psi_{\text{ask}} - P_0)$ if $P^* \geq \psi_{\text{ask}}$

**In vanilla options language:**
$$\boxed{\text{Long Call}(K = P_0) - \text{Long Call}(K = \psi_{\text{ask}})}$$

This is a **bull call spread** with:
- Lower strike: $P_0$
- Upper strike: $\psi_{\text{ask}}$
- Max payoff: $\psi_{\text{ask}} - P_0$ (capped upside)

---

## 6. Why the Buyer Pays the Premium $\phi$

From the buyer's perspective, the premium satisfies:

$$\text{Premium} = \mathbb{E}[\text{slippage avoided} + \text{downside risk avoided} + \text{capital costs avoided}]$$

Which matches the LP's pricing equation:

$$\int_0^{R_X} \phi \, d\Delta = \mathbb{E}^{\hat{\Delta}}\left[\int_{\hat{\Delta}} (P(\Delta) - \psi_{\text{ask}}) \, d\Delta\right]$$

> **This is not upside insurance. It is execution insurance.**

---

## 7. LP-Buyer Duality Table

| Perspective | LP (Seller) | Buyer |
|-------------|-------------|-------|
| **Position** | Short call spread | Long call spread |
| **Payoff** | $-\max(P^* - P_0, 0) + \max(P^* - \psi_{\text{ask}}, 0)$ | Inverse |
| **Premium** | Receives $\int \phi \, d\Delta$ | Pays $\int \phi \, d\Delta$ |
| **Risk** | Opportunity cost if $P^* \to \psi_{\text{ask}}$ | Execution cost if $P^*$ stays low |
| **Inventory** | Holds $R_X$, releases as price rises | Holds nothing, acquires as price rises |
| **Capital** | Locked in inventory | Free until activation |

---

## 8. What Was Missing in NOTES.md

The missing piece is explicit recognition that:

> **The buyer's constraint is not price optimality, but balance-sheet and path-risk optimality.**

Once you add that, everything clicks:
- The buyer does not want to be long early
- The LP does not want to sell early
- The AMM clears this **intertemporal disagreement**

---

## 9. The AMM as Limit Order Book Replacement

The buyer values the AMM because:

| Traditional LOB | AMM |
|-----------------|-----|
| Uncertain fill | Guaranteed fill at $P(\Delta)$ |
| Uncertain slippage | Known slippage (the curve) |
| Adverse selection risk | Priced into fee $\phi$ |
| Requires active monitoring | Passive, always available |

The buyer is **not** buying protection—they're buying **guaranteed execution with known slippage**. The fees = premium for certainty.

---

## 10. One-Sentence Takeaway

> **The buyer is not someone who "missed a cheaper price"; the buyer is someone buying guaranteed execution without interim exposure, and the portfolio replication replaces dynamic hedging with fee-paid path delegation to the AMM.**

---

## Next Steps

From here, we can:
1. Write the buyer's **self-financing constraint** explicitly
2. Show the **dual symmetry** between put-selling LPs and call-buying traders
3. Translate this into a pure **CLAMM tick-by-tick execution model**
4. Derive the **fair fee $\phi$** from the buyer's indifference condition

---

*Document generated: 2026-01-04*
*Part of the CLAMM research project*
