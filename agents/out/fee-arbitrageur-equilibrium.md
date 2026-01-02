# The Fee Equilibrium: Balancing LP Premium and Arbitrageur Incentives

> **How the transaction fee satisfies both LP compensation and market efficiency**

---

## Context

The LP now understands:
- Jumps and volatility don't matter as long as they reach their bid
- Every unit of flow pays the transaction fee
- The fee represents the premium for the put option being sold

**LP's new question:**

> "You guaranteed the fee is the optimal premium for my put. But how do you ensure that *same* fee also incentivizes arbitrageurs to keep correcting the price? If the fee is too high, arbs won't bother. If it's too low, I'm not compensated. How do you balance this?"

---

## The Two-Sided Constraint

The fee must satisfy **two participation constraints simultaneously**:

### Constraint 1: LP Participation (You)
$$\text{fee}(\Delta) \geq \pi(\Delta)$$

Where $\pi(\Delta)$ is the fair premium for the infinitesimal put at volume $\Delta$.

**If violated:** You're selling insurance below cost. You lose money in expectation.

---

### Constraint 2: Arbitrageur Participation
$$\text{arb profit}(\Delta) \geq \text{fee}(\Delta)$$

Where arb profit is the mispricing they can capture:
$$\text{arb profit}(\Delta) = |P_{\text{AMM}}(\Delta) - P_{\text{ext}}(\Delta)|$$

**If violated:** Arbs can't cover the fee → they don't trade → price never corrects → market stagnates.

---

## The Feasibility Condition

Combining both constraints:
$$\pi(\Delta) \leq \text{fee}(\Delta) \leq \text{arb profit}(\Delta)$$

For a viable fee to exist:
$$\boxed{\text{arb profit}(\Delta) \geq \pi(\Delta)}$$

**In words:** The arbitrage opportunity must be large enough to cover the fair put premium.

---

## When Does This Hold?

### Arbitrage Profit Comes From Mispricing

When external price moves, a gap opens:
$$\text{gap}(\Delta) = P_{\text{AMM}}(\Delta) - P_{\text{ext}}(\Delta)$$

Arbs capture this gap (minus fees). The gap exists because:
1. External price moved
2. AMM price hasn't updated yet (no trades)
3. Arb trades to close the gap

### Put Premium Comes From Volatility

The fair premium $\pi(\Delta)$ depends on:
- Expected price movement (volatility)
- Time/volume until potential exercise
- Distance from current price to strike

### The Connection

**Key insight:** Both quantities are driven by the same underlying: **volatility**.

- High volatility → Large mispricings → Large arb profits
- High volatility → Valuable insurance → High put premium

They scale together. This is not coincidence — it's the same risk priced two ways.

---

## The Fee Design

**Optimal fee sits at the intersection:**

$$\text{fee}^*(\Delta) = \max\left(\pi(\Delta), \, \text{arb profit}(\Delta) - \epsilon \right)$$

Where $\epsilon$ is the minimum margin arbs need to operate.

### In Practice: The Fee Is a Fraction of the Spread

Many AMMs implement:
$$\text{fee} = \gamma \cdot P(\Delta)$$

Where $\gamma$ is a fixed percentage (e.g., 0.3% for Uniswap).

**Why this works:**

| Market Condition | Spread Size | Fee (absolute) | Arb Margin | LP Premium |
|-----------------|-------------|----------------|------------|------------|
| Low volatility | Small | Small | Thin but positive | Small (cheap insurance) |
| High volatility | Large | Large | Fat | Large (expensive insurance) |

The proportional fee **automatically scales** with market conditions.

---

## The Self-Regulating Mechanism

Here's the beautiful part: **the system self-regulates**.

### If fee is too high relative to arb profit:
1. Arbs don't trade
2. Price diverges from external
3. Gap widens
4. Eventually gap > fee
5. Arbs return

### If fee is too low relative to fair premium:
1. LP is undercompensated
2. LP withdraws liquidity (or doesn't deposit)
3. Less liquidity → steeper curves → larger price impact
4. Larger price impact → larger gaps for same volume
5. Arb profit increases → room for higher fees

**Equilibrium emerges where both sides are marginally satisfied.**

---

## Answering the LP's Question Directly

**"How do you make sure the fee incentivizes arbs to keep the market tradable?"**

### Answer 1: The fee is bounded by arb profitability

If fee > arb profit, arbs don't trade. No trades = no fees collected. The AMM *cannot* sustain a fee higher than what arbs can pay.

**The market enforces this bound automatically.**

### Answer 2: Volatility creates both premium and opportunity

The same volatility that makes your put valuable also creates arbitrage opportunities. High vol = high premium = high arb profit. They're coupled.

### Answer 3: The fee is a share of the spread, not a fixed cost

Proportional fees ensure:
- Small mispricings → small fees → arbs still profitable
- Large mispricings → large fees → you're well compensated

### Answer 4: Competition among arbs sets the floor

Multiple arbs compete to capture mispricings. Competition drives fees toward the minimum viable level — just enough to compensate you, leaving just enough for arbs.

---

## The Three-Way Balance

```
         LP (You)
            │
            │ "I need fair premium for my risk"
            │
            ▼
    ┌───────────────┐
    │               │
    │     FEE       │◄─── Must satisfy both
    │               │
    └───────────────┘
            │
            │ "I need profit after paying the fee"
            │
            ▼
       Arbitrageurs
            │
            │ "We compete, driving spreads tight"
            │
            ▼
     Other Traders
     (price discovery)
```

**The fee is the equilibrium point where:**
- You're compensated for selling puts
- Arbs are compensated for correcting prices
- The market remains liquid and tradable

---

## Summary

| LP Concern | Resolution |
|------------|------------|
| Fee = fair put premium? | Yes — derived from your risk exposure |
| Fee allows arb activity? | Yes — bounded by arb profit margin |
| How are both satisfied? | Same volatility drives both; proportional fees scale automatically |
| What if balance breaks? | Self-correcting: no arbs → gap widens → arbs return |

**SDR concludes:**

> "The fee doesn't *choose* between compensating you and incentivizing arbs. It *must* do both, or the market dies.
>
> - Too high → arbs leave → no volume → no fees
> - Too low → you leave → no liquidity → no market
>
> The equilibrium fee is where both of you are *just barely* willing to participate. Competition among arbs and LPs finds this point automatically.
>
> **Your premium is funded by arb activity. Arb activity exists because of your liquidity. It's symbiotic.**"
