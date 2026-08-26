
When you sell a straddle you are not selling a payoff diagram.
You are selling a credible commitment:

“For every possible future price path, I will deliver the convex payoff.”

That commitment contains implicit balance-sheet promises:

| Clause     | What it means                                         |
| ---------- | ----------------------------------------------------- |
| Short put  | I promise I can **buy the asset** at low prices       |
| Short call | I promise I can **sell the asset** at high prices     |
| Hedging    | I promise I can **trade continuously along the path** |



So the real product is:
          (vega)
Convexity + Balance-Sheet Capacity + Trading Infrastructure


A market maker says I guarantee you to find you someone intesrested on your promise now, you obviously need A Cash Buffer (Margin / Capital) required to:



Short put → you may need to buy the asset in a crash
Short call → you may need to sell the asset in a melt-up

Your responsability as a seller is:

The seller commits to:

“trade the underlying to maintain replication.”

Thus, you must have: 

- Delta hedge inventory (changes every minute)
- Cash account to fund trading
- Borrow capacity for shorting

Here is what I am going to do. You gave me the premia of an option with this expiration, exercise price, interest rsate and dividend.

Now , you know that for every price movememnt you must gaurantee payoff remains delta neutral at every single momenet. Here is how I (as a market maker) will help you achieve this


- I will continuously quote you a two-sided market in the underlying and in options,
- I will internalize your hedging flow,
- I will absorb your temporary inventory risk,
and ...
- I will transform your dynamic replication problem into an immediately executable trading program.

Concretely:

- I stand ready to buy or sell the underlying from you whenever your delta changes

- I stand ready to buy or sell options so you can rebalance vega, gamma, and expiry exposure

- I provide immediacy, liquidity, and price discovery

- I warehouse your risk for seconds or minutes so you never face a gap in execution


In exchange the fair value for selling:

- Liquidity
- Immediacy
- Price discovery
- Inventory risk absorption
- Clearing infrastructure

is .he bid–ask spread embedded in implied volatility because is economically equivalent to renting a continuously available uncertainty-conversion machine.

