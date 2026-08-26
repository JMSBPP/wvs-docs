
**Ch 3.5 — American Perpetual Options (p.109)** — This is literally the Panoptic base case. 
The perpetual American option has a closed-form solution. 
Start here to understand what Panoptic's streaming premia approximate.

**Ch 4.4 — Power Contracts and Power Options (p.115)** — This is what Numoen/GammaDEX tried to implement. Power payoffs (`S^α`) replicate variance exposure. The formulas here tell you the exact capital requirements, which is why overcollateralization is so expensive for these.

**Ch 4.17 — Barrier Options (p.152)** — Tick range boundaries = barriers. Concentrated liquidity creates knock-out barrier options mechanically. These formulas give you the exact value of an LP position as a barrier option.

**Ch 4.15 — Lookback Options (p.141)** — High-water mark payoffs. This is the structure your ThetaSwap delta+ accumulator approximates — the payoff depends on the running max/min of price.

### Extendable with On-Chain Accumulators

**Ch 4.20 — Asian Options (p.182)** — TWAP-based payoffs. Since CFMMs already compute TWAPs (Uniswap oracle), you can build Asian option payoffs using existing on-chain infrastructure. The discrete arithmetic average formula (4.20.3, p.192) is the one you'd implement.

**Ch 4.8 — Ratchet Options (p.124)** — Payoff locks in gains at discrete intervals. Maps to epoch-based settlement — each epoch "ratchets" the accumulated value.

**Ch 4.6 — Forward Start Options (p.121)** — Strike set at a future date. Maps to: LP enters position now, strike determined by price at next epoch start.

### What Breaks On-Chain

**Ch 6.3 — Discrete Hedging (p.236)** — Critically important. Shows the hedging error from discrete vs continuous rebalancing. CFMMs rebalance only when someone trades, which is discrete. This chapter quantifies exactly how much value leaks from discrete rebalancing — this IS LVR.

**Ch 6.10 — Stochastic Volatility Models (p.258)** — SABR, Hull-White. These require vol as an input → oracle dependency → breaks on-chain. This is the theoretical wall.

**Ch 6.11 — Variance and Volatility Swaps (p.271)** — The formulas you'd need if you could get realized variance on-chain. You CAN compute this from swap history accumulators, making this partially implementable.

## Updated Reading Order Across All 4 Books

| Priority | Source | Section | Maps to |
|---|---|---|---|
| 1 | **Haug** 3.5 | American Perpetual Options | Panoptic base case |
| 2 | **Haug** 4.17 | Barrier Options | Concentrated liquidity tick ranges |
| 3 | **Duffie** Ch 1-2 | Discrete arbitrage pricing | FTAP for CFMMs |
| 4 | **Duffie** Ch 8 | Incomplete markets | Why fragmentation breaks |
| 5 | **Haug** 4.4 | Power Options | Variance/vol exposure on-chain |
| 6 | **Haug** 4.15 | Lookback Options | Delta+ / HWM accumulators |
| 7 | **Haug** 4.20 | Asian Options | TWAP-based payoffs |
| 8 | **Haug** 6.3 | Discrete Hedging | LVR quantification |
| 9 | **Haug** 6.11 | Variance Swaps | On-chain vol products |
| 10 | **Hull** Ch 13,17 | Binomial trees, Greeks | LP position sensitivities |
| 11 | **Duffie** Ch 10 | Security design | Optimal CFMM product design |

Haug is your implementation reference 
— when you know WHAT to build, Haug gives you the formula.
- Duffie tells you WHY certain things can't work on-chain (incomplete markets). 
Hull gives the intuition bridge.

That clarifies the scope. You're not rebuilding options infrastructure — Panoptic already handles perpetual American calls/puts, premia streaming, multi-leg strategies, and collateral tracking. The question is: **what can you build ON TOP of Panoptic that Panoptic can't do alone?**

## What Panoptic Already Covers (skip these)

- Black-Scholes basics, put-call parity (Hull Ch 1-15, Haug Ch 1-2)
- American perpetual option pricing (Haug 3.5)
- Greeks for vanilla options (Haug Ch 2)
- Multi-leg strategies: spreads, straddles, condors (Hull Ch 12)
- Premia/fee accumulation mechanics (their SFPM handles this)

## What's Extendable ON TOP of Panoptic

The gap is: Panoptic gives you **price-only, perpetual, single-underlying** options. Extensions go in three directions:

### 1. Path-dependent payoffs over Panoptic positions
**Read: Haug 4.15 (Lookback), 4.20 (Asian), 4.8 (Ratchet)**

Panoptic positions accumulate premia over time. A wrapper contract could track:
- **Running max of accumulated premia** → lookback-style payoff on the premia stream itself
- **Average delta+ over epochs** → Asian-style smoothing of LP returns
- **Ratchet on position value** → lock in gains at epoch boundaries

This is extending the *payoff function* over Panoptic's existing position, not the option itself.

### 2. Barrier/knock-out wrappers
**Read: Haug 4.17 (Barrier Options), especially 4.17.6 (Discrete-Barrier)**

Panoptic positions live in tick ranges but don't auto-close. A wrapper could:
- **Auto-close positions** when price hits a barrier (stop-loss / take-profit layer)
- **Restructure payoff** at discrete observation points (Haug 4.17.6 gives the pricing adjustment for discrete vs continuous barriers)

This adds **risk management automation** that Panoptic doesn't natively offer.

### 3. Multi-asset / cross-pool structured products
**Read: Haug Ch 5 (Exotic Options on Two Assets), especially 5.1 (Outperformance), 5.4 (Exchange Options), 5.7 (Options on Max/Min)**

Panoptic is single-pool. A wrapper could compose positions across pools:
- **Outperformance option**: long Panoptic call on ETH/USDC + short Panoptic call on BTC/USDC → payoff on ETH vs BTC relative performance
- **Spread option across pools**: Haug 5.8
- **Best-of / worst-of**: Haug 5.14 — payoff depends on which of N Panoptic positions performs best

This creates **structured products** from Panoptic primitives.

### 4. Variance/volatility layer
**Read: Haug 6.11 (Variance Swaps, p.271), Haug 4.4 (Power Options, p.115)**

Panoptic positions are inherently short vol. A wrapper that tracks realized variance from the underlying pool's swap history could:
- **Price the vol component** of Panoptic positions explicitly
- **Offer vol-contingent payoffs**: if realized vol > strike vol, payout = difference
- Uses on-chain swap data as the accumulator — no oracle needed

## Focused Reading List (Extension-Only)

| Priority | Haug Section | What it enables on top of Panoptic |
|---|---|---|
| 1 | **4.17** Barrier Options | Auto-close / restructuring wrappers |
| 2 | **Ch 5** Two-Asset Exotics | Cross-pool structured products |
| 3 | **4.15** Lookback | HWM payoffs over premia streams |
| 4 | **6.11** Variance Swaps | Vol-contingent layer using swap data |
| 5 | **4.20.3** Discrete Asian | TWAP-smoothed position returns |
| 6 | **6.3** Discrete Hedging | Quantify value leakage (LVR) for wrappers |

And from Duffie:
- **Ch 8** (Incomplete markets) — to understand which of these extensions are actually replicable vs which require external risk transfer
- **Ch 10** (Security design) — optimal design of the wrapper given the constraint set

The rest of Hull, Haug Ch 1-3, and Duffie Ch 3-7 you can skip — Panoptic already operationalizes those.
