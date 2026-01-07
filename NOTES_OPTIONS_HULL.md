
Then trading options, allows us to define bounded below by 0 payoffs 


Also traders want to smooth their directional beliefs by not timing the market. Thus they want payoffs subject to price distances not subject to time to reach some price

Then:

convexity := bounded below by 0 over price dispersion


trading options allows us to define convex payoffs at the cost of a premium for such insurance.


For the remaining prices under which the option is OTM, there is a distribution that weights the likelihood of forward prices at maturity. 

As time evolves towards maturity, price changes alter this probabilities.

If, in addition to bounding our payoff, we want to stay aligned with these changing probabilities, we construct a self-financing replicating strategy by dynamically trading the underlying and cash so that the portfolio remains locally riskless.

The result is a bounded convex payoff with continuously updated exposure to the risk-neutral distribution of future prices.


Now:

-  *Why convexity has value*

Convex payoffs transform volatility into money.

$$
\text{Convex} (\Pi) \implies \mathbb{E} \bigg [\Pi \big (P_T)\bigg] \geq \Pi \bigg ( \mathbb{E} \big [ P_T \big]\bigg)
$$

So even if the expected price is unchanged,
more uncertainty ⇒ higher option value

Economically:

**Volatility is a productive input when you own convexity.**


The option price (value ) must represent:


the risk-neutral expected discounted cost of executing a self-financing dynamic trading strategy in the underlying (and cash) that replicates the option payoff at maturity.


We have:

option pricing method --->  option value --> what was the volatility entered for it's computation ? --> implied volatility of the option underlying




When I enter the parameters to obtain an option value using an option pricing model, I am not forecasting returns.


I am computing the cost of dynamically replicating a convex payoff under the risk-neutral measure.

Since I am selling volatility, I must understand what economic question each input answers.

Volatility is price dispersion, not speed.
Maturity defines the horizon over which dispersion is realized.
Together they define the width of the risk-neutral distribution at maturity.


expiration and exercise price are fixed

exercise price (strike) helps me answer:
What payoff geometry do I want?
How far in moneyness am I selling convexity?

expiration (maturity) answers:
For how long am I selling convexity?
Over what horizon am I short variance?

interest rates and dividends are financing parameters

- interest rates:

The financing rate of the replicating strategy
Determines the forward price

- dividends / carry:

Deterministic cash flows paid by the underlying
Reduce the forward price because the hedger must finance the stock correctly


- underlying price and implied volatility are to be chosen carefully

- underlying price: At which quote am I entering conveexity ?. This determines moneyness, delta, gamma and the cost of insurance

- implied volatility: The dispersion of the risk-neutral distribution of prices at maturity

    - Width of the risk-neutral distribution

    - At entering I can enter a modified version of realized volatilyiy with historical volatility to account for furture beliefs explained by past behavior

    - Or I can also enter a forecasted volatility taht alsoe use historical volatility but used different paramters 


- Then for same exercise price initialy there can be multiple options with values changing due to different:
    - option pricing methods
    - volatility inputs

Then one the option is written to be put on the market the writter decides to wither sell it or buy it, inc which case he entes bid/ask prices respectivlery and place the option i n order books

Option trades occur at one equilivbrium price/ 

Then implied volatility is the volatility parameter that makes a chosen pricing model reproduce the market equilibrium price.


Implied volatility represents the market clearing price of convexity.

This allows assign the same questions we ask on prices, but to implied volatility

- How volatile is equilibrium price ?
    - > volatility of implied volatility

Hedging:
    - is the mechanism that turns implied volatility (the price of convexity) into a realized cash flow by making convexity tradeable through delta rebalancing.

    - operationalizes implied volatility as the market price of convexity by transforming vega inventory into a stream of gamma-scalping trades that realize variance.


Implied volatility is paid today,
Realized volatility is harvested tomorrow.

The volatility smile is the demand curve for uncertainty.
Stochastic volatility exists because uncertainty itself is scarce and fluctuates. --> Fear and greed fluctuate, so the price of insurance fluctuates.



Options are the market where convexity is priced and traded.
Every great product is secretly an options market on user behavior.






