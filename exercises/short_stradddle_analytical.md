“By expiration, the price will typically be within 
$P \pm \sigma \cdot \sqrt{T}$ of today.”

How much people are currently pricing such uncertainty (implied volatility)

Ok, it looks like the market thinks the asset will be less volatile than I do.

Then my edge is:


Future Volatility− Implied Volatility

I am ready to capitalize on my belief

I am saying that prices will not move outside the interval
$P \pm \sigma \cdot \sqrt{T}$


Thus, I am short a straddle.

If I do not have a direct interface to build my straddle, I just write the options myself.

- “Hey, at $𝑇$ I will be long the underlying at $P + \sigma \cdot \sqrt{T}$ → short the put

- “Hey, at $T$ I will be short the underlying at $P - \sigma \cdot \sqrt{T}$” → short the call

Pricing the Straddle

Ok, done. Now let’s price this.

I input the market implied volatility into the option pricing model.

It gives me a premium $X$

If I instead input my forecasted future volatility, it gives me 
$X-\varepsilon$

So I have an edge of $\varepsilon$

(Double check: the pricing model encodes the cost of dynamically trading the underlying to replicate this payoff.)



Looks like I have a buyer. Someone just paid the premium. Now what?
(I am a hedge fund that priced a straddle and is now selling convexity.)

Now a market maker enters and matches my short straddle with a buyer willing to bet on volatility.


This means someone is funding the cost of dynamically trading the underlying to build the payoff I am offering.

[Assume some mechanism guarantees delivery of my promise (margin, collateral, clearing, etc.).](./market_making.md)


These market-making tasks add up to the premium.
They take the seller’s premium and add on top of it the cost of hedging (variance risk), funding, and fees.

The spread is their motivation to intermediate the market.

My Job Now: Hedging

My work begins.

In response to underlying price movements, I must ensure the payoff I promised remains intact.

Each time price moves:

My option gains or loses value

I trade the underlying to cancel that change

So:

Direction disappears

What remains?

Only the accumulation of price wiggles

I must be extremely accurate with my hedges.

Volatility is realized along the path, not at expiration

Perfect replication is only possible in the continuous limit

Premium = Budget for Hedge Errors

The premium is my budget to pay for hedge errors

Any miss-hedge accumulates into my replication cost

So:

Total Replication Cost
=
Realized Variance Cost
+
Funding / Carry Costs
Total Replication Cost=Realized Variance Cost+Funding / Carry Costs

Where:

Realized Variance Cost
= accumulated hedge errors
= the economic price of uncertainty

Funding / Carry Costs
= interest, dividends, borrow, margin, transaction costs

Expiration

Expiration arrives.
Pff… what a hedging journey.

What happened?

Realized Variance
<
Implied Variance
Realized Variance<Implied Variance

So:

My hedge cost was smaller than the premium I received

I did not “earn” profit at expiration

I earned it along the path

Expiration only closes the accounting.

Reality Check

Ok, let’s be real now.

I did not hedge continuously, even though the premium assumed I could.

Over this journey I faced:

Discrete time

Transaction costs

Liquidity limits

Jump risk

Margin constraints

Funding constraints

Risk limits

So the “fair” mathematical price is not enough.

I must add a buffer to the premium
to cover unavoidable hedge slippage and tail risk.

This is the volatility risk premium.

Competition

If I am the only short straddle seller, I act as a monopoly
and I can charge a high volatility risk premium.

But in a competitive market:

If I charge too much → no one buys

If I charge too little → I lose money

So I must be competitive with the best hedgers.

To be competitive I must match them on:

Advantage	Why it matters
Low latency	Hedge faster
Deep liquidity	Trade cheaper
Capital	Survive drawdowns
Models	Predict vol regimes
Risk limits	Hold convexity longer

If I am worse on any of these:

My replication cost is higher
→ I must charge higher implied volatility
→ I lose flow

Or:

I match the market and operate at a loss

Final Insight

This is not added “on top” of the option price.
It is embedded inside implied volatility.

So market implied volatility is:

**Black–Scholes volatility
hedge friction


jump risk

capital cost**

All compressed into one number.