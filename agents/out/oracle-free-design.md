# The Oracle Question: Why AMMs Don't Need External Price Feeds

> **LP challenges the external price dependency — SDR explains the oracle-free design**

---

## Context

The SDR has shown that the optimal price curve is:
$$P^*(\Delta) = \min\left( C_{\text{bid}}, \, P_{\text{ext}}(\Delta) + \text{fee}(\Delta) \right)$$

The LP now challenges this directly:

---

## LP's Challenge

> "Wait. You keep saying $P_{\text{ext}}$. But:
>
> 1. **Who provides that price?**
> 2. **How often is it updated?**
> 3. **What happens if it's noisy, manipulated, or jumps around?**
> 4. **Why should my collateral depend on someone else's feed?**
>
> I don't want my money riding on an oracle."

---

## SDR's Response: The Price Is Emergent, Not Imported

### Answer 1: "No one provides it."

There is no price feed. There is no oracle. There is no external data source.

The $P_{\text{ext}}$ in our formula is **not an input** — it's a **description of equilibrium**.

What actually happens:

```
You deposit collateral
    ↓
AMM publishes a price curve P(Δ) based on invariant
    ↓
Traders observe: "Is P(Δ) better or worse than other venues?"
    ↓
If better → they trade with you
If worse  → they trade elsewhere
    ↓
Your price moves only when trades execute
```

**The "external price" is whatever price exists such that traders are indifferent between you and elsewhere.** You never need to know it. The market reveals it through action.

---

### Answer 2: "It's updated every time someone trades."

The AMM's price updates when — and only when — a trade executes.

| Event | AMM State Change |
|-------|------------------|
| No trades | Price unchanged |
| Trader sells you X | Your inventory $R_X$ increases, price falls |
| Trader buys X from you | Your inventory $R_X$ decreases, price rises |

**Update frequency = trade frequency.**

There's no clock. No heartbeat. No stale data. The price is always "fresh" in the sense that it reflects the last trade.

---

### Answer 3: "Noise and manipulation hit the traders, not you."

**Scenario: External price is noisy**

If $P_{\text{ext}}$ jumps around:
- Arbitrageurs face uncertainty about "true" price
- They trade more cautiously (smaller size)
- You receive *less* flow, not *bad* flow

**Your risk:** Lower volume → lower fees collected.
**Not your risk:** Buying at the wrong price.

Why? Because the constraint $P(\Delta) \leq C_{\text{bid}}$ is **hardcoded in the curve**, not dependent on any external signal.

---

**Scenario: External price is manipulated**

Suppose someone manipulates $P_{\text{ext}}$ downward temporarily.

What happens:
1. Manipulated low $P_{\text{ext}}$ makes your price look *expensive*
2. Traders don't sell to you (you're uncompetitive)
3. No trades execute → your state unchanged
4. Manipulation ends → normal flow resumes

**Manipulation can't force you to buy.** It can only redirect flow away from you temporarily.

---

**Scenario: External price jumps (gap move)**

Suppose $P_{\text{ext}}$ drops 10% instantly.

1. Your AMM price is now "stale" (too high relative to market)
2. Arbitrageurs race to sell to you
3. Volume flows in until your price matches $P_{\text{ext}} + \text{fee}$
4. **Curvature determines how much you absorb**

With steep curvature: Small volume → large price drop → you absorb little before equilibrium.
With flat curvature: Large volume → small price drop → you absorb more before equilibrium.

**You chose the curvature. You chose your exposure to gap risk.**

---

### Answer 4: "Your collateral depends on the invariant, not a feed."

Let me be precise about what guarantees your safety.

**Your collateral safety comes from:**

| Guarantee | Source |
|-----------|--------|
| Never buy above $C_{\text{bid}}$ | Curve is bounded: $P(\Delta) \leq C_{\text{bid}}$ |
| Always solvent mid-path | Curve is convex: $\frac{d^2P}{d\Delta^2} \geq 0$ |
| Collateral covers all trades | Invariant enforced: $\phi(R_X, R_Y) = k$ |

**None of these depend on external data.** They are properties of the curve itself.

The invariant is:
$$\phi(R_X, R_Y) = k$$

This is checked *locally* at every trade:
- Trader proposes: "I give you $dX$, you give me $dY$"
- AMM checks: "Does $\phi(R_X + dX, R_Y - dY) = k$?"
- If yes → trade executes
- If no → trade rejected

**No oracle. No feed. No external dependency.**

---

## The Conceptual Shift

**What LP might think:**
```
Oracle → tells AMM the price → AMM acts on it
        ↑
    Trust point (fragile)
```

**What actually happens:**
```
AMM posts price curve → Traders decide if competitive → Trades update state
                              ↑
                    Market does the "oracle" work
                    (trustless, incentive-aligned)
```

---

## Why This Design Is Superior

| Oracle-Based Design | Oracle-Free Design |
|--------------------|-------------------|
| Depends on feed uptime | No external dependency |
| Vulnerable to manipulation | Manipulation → no flow, not bad trades |
| Stale prices = wrong execution | Stale prices = arbitrage opportunity (self-correcting) |
| Trust in data provider | Trust only in profit motive of arbs |
| Latency = risk | Curvature = configurable latency tolerance |

---

## Summary

**LP asked:** "Why should my collateral depend on someone else's feed?"

**SDR's answer:** "It doesn't."

> The formula $P^* = \min(C_{\text{bid}}, P_{\text{ext}} + \text{fee})$ describes **what emerges**, not what's computed.
>
> - You set $C_{\text{bid}}$ (your maximum price)
> - You choose curvature (your flow tolerance)
> - The invariant enforces solvency (no external input)
>
> The "external price" is revealed by traders choosing to trade or not. You never import it, trust it, or depend on it.
>
> **Your collateral is protected by math, not by oracles.**
