Today's CLAMMs (Uniswap v3, etc.) operate on **token-type settlement**:

- When an LP provides liquidity in range $[p_a, p_b]$, they deposit actual tokens.
- As price moves through their range, the AMM *continuously rebalances* their position---swapping token $X$ for token $Y$ (or vice versa) with each trade.
- The LP's token holdings change in real-time. This is physical, continuous settlement.
- **Impermanent loss** is the realized cost of this continuous physical rebalancing.

### Hypothetical: Futures-Type Settlement for CLAMM LPs

Imagine a CLAMM where LPs post *margin* instead of tokens:

1. **Initial margin deposit:** LP posts collateral (e.g., stablecoins) to underwrite liquidity in range $[p_a, p_b]$.

2. **No token rebalancing:** As price moves through the range, no tokens are swapped. Instead, the LP's margin account is *marked-to-market* against the impermanent loss trajectory.

3. **Variation margin:** If price moves deep into the LP's range (high IL), the clearing mechanism issues margin calls. If the LP fails to post additional margin, their position is liquidated (liquidity removed).

4. **Cash settlement at exit:** When the LP closes their position, they receive/pay the net P&L: fees earned minus impermanent loss, settled in cash rather than as a token portfolio.

### Implications of Futures-Type CLAMM Settlement

| Aspect | Token-Type (Current AMMs) | Futures-Type (Hypothetical) |
|--------|---------------------------|------------------------------|
| **Collateral** | Actual tokens deposited | Margin in cash/stablecoins |
| **Rebalancing** | Continuous, physical | None (synthetic exposure) |
| **IL realization** | Embedded in token holdings | Mark-to-market P&L |
| **Capital efficiency** | 1:1 token backing | Leveraged via margin |
| **Liquidation** | N/A (always solvent in tokens) | Margin calls, forced exit |
| **Oracle dependency** | Minimal (price from trades) | High (needs external price feed) |

### Why This Matters

Futures-type settlement would enable:
- **Capital efficiency:** LPs could provide liquidity with less upfront capital (leveraged LP positions).
- **Synthetic exposure:** LPs wouldn't need to hold the volatile asset, just margin.
- **Separated concerns:** Fee income vs. directional exposure could be managed independently.

But it introduces:
- **Oracle risk:** Requires trusted price feeds for mark-to-market.
- **Liquidation cascades:** Under-margined LPs could be force-liquidated during volatility.
- **Complexity:** Margin management is harder than simple token deposit.

In an AMM, the option buyer fully settles at execution.
Margin and variation calls apply only to LPs, who warehouse price risk over time.

The buyer never has future financial obligations and therefore cannot be margin-called or liquidated.