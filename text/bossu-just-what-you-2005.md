---
sha256: 34140bc892dd865410e1f9c0646d4216c0e394f11fd9be920e6ccd9eff005599
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 57834
---
M A Y 2 0 0 51
E Q U I T Y D E R I V A T I V E S
J U S T W H A T Y O U N E E D T O K N O W A B O U T V A R I A N C E S W A P S
Sebastien Bossu Eva Strasser
Regis Guichard
Equity Derivatives Investor Quantitative Research
Marketing & Development
JPMorgan – London
I N T H E U N I T E D S T A T E S T H I S R E P O R T I S
A V A I L A B L E O N L Y T O P E R S O N S W H O H A V E
R E C E I V E D T H E P R O P E R O P T I O N R I S K
D I S C L O S U R E D O C U M E N T S
1
Initial publication February 2005A T Y O U N E E D T O K N O W A B O U T V A R I A N C E S W A P S





Overview
In this note we introduce the properties of variance swaps, and give details on the hedging and
valuation of these instruments.
Section 1 gives quick facts about variance swaps and their applications.
Section 2 is written for traders and market professionals who have some degree of
familiarity with the theory of vanilla option pricing and hedging, and explains in ‘intuitive’
mathematical terms how variance swaps are hedged and priced.
Section 3 is written for quantitative traders, researchers and financial engineers, and gives
theoretical insights into hedging strategies, impact of dividends and jumps.
Appendix A is a review of the concepts of historical and implied volatility.
Appendices B and C cover technical results used in the note.
We thank Cyril Levy-Marchal, Jeremy Weiller, Manos Venardos, Peter Allen, Simone Russo for
their help or comments in the preparation of this note.
These analyses are provided for information purposes only and are intended solely for your use. The analyses have been derived
from published models, reasonable mathematical approximations, and reasonable estimates about hypothetical market
conditions. Analyses based on other models or different assumptions may yield different results. JPMorgan expressly disclaims
any responsibility for (i) the accuracy of the models, approximations or estimates used in deriving the analyses, (ii) any errors or
omissions in computing or disseminating the analyses and (iii) any uses to which the analyses are put.
This commentary is written by the specific trading area referenced above and is not the product of JPMorgan's research departments.
Research reports and notes produced by the Firm's Research Departments are available from your salesperson or at the Firm's website,
http://www.morganmarkets.com. Opinions expressed herein may differ from the opinions expressed by other areas of JPMorgan,
including research. This commentary is provided for information only and is not intended as a recommendation or an offer or
solicitation for the purchase or sale of any security or financial instrument. JPMorgan and its affiliates may have positions (long or
short), effect transactions or make markets in securities or financial instruments mentioned herein (or options with respect thereto),
or provide advice or loans to, or participate in the underwriting or restructuring of the obligations of, issuers mentioned herein. The
information contained herein is as of the date and time referenced above and JPMorgan does not undertake any obligation to update
such information. All market prices, data and other information are not warranted as to completeness or accuracy and are subject to
change without notice. Transactions involving securities and financial instruments mentioned herein (including futures and options)
may not be suitable for all investors. Clients should contact their salespersons at, and execute transactions through, a JPMorgan entity
qualified in their home jurisdiction unless governing law permits otherwise. Entering into options transactions entails certain risks with
which you should be familiar. In connection with the information provided below, you acknowledge that you have received the Options
Clearing Corporation's Characteristics and Risks of Standardized Option. If you have not received the OCC documents and prior to
reviewing the information provided below, contact your JPMorgan representative or refer to the OCC website at
http://www.optionsclearing.com/publications/riskstoc.pdf
1
J U S T W H
Copyright 2005 J.P. Morgan Chase & Co. All rights reserved. JPMorgan is the marketing name for J.P. Morgan Chase & Co. and its
subsidiaries and affiliates worldwide. J.P. Morgan Securities Inc. is a member of NYSE and SIPC. JPMorgan Chase Bank is a member of
FDIC. J.P. Morgan Futures Inc. is a member of the NFA. J.P. Morgan Securities Ltd. and J.P. Morgan plc are authorised by the FSA and
members of the LSE. J.P. Morgan Europe Limited is authorised by the FSA. J.P. Morgan Equities Limited is a member of the
Johannesburg Securities Exchange and is regulated by the FSB. J.P. Morgan Securities (Asia Pacific) Limited and Jardine Fleming
Securities Limited are registered as investment advisers with the Securities & Futures Commission in Hong Kong and their CE numbers
are AAJ321 and AAB026 respectively. Jardine Fleming Singapore Securities Pte Ltd is a member of Singapore Exchange Securities
Trading Limited and is regulated by the Monetary Authority of Singapore ("MAS"). J.P. Morgan Securities Asia Private Limited is
regulated by the MAS and the Financial Supervisory Agency in Japan. J.P.Morgan Australia Limited (ABN 52 002 888 011) is a licensed
securities dealer. In the UK and other EEA countries, this commentary is not available for distribution to persons regarded as private
customers (or equivalent) in their home jurisdiction.Table of Contents
A T Y O U N E E D T O K N O W A B O U T V A R I A N C E S W A P S
Overview............................................................................................ 1
Table of Contents................................................................................. 2
1. Variance Swaps .............................................................................. 3
1.1. Payoff 3
Convexity 4
Rules of thumb 5
1.2. Applications 5
Volatility Trading 5
Forward volatility trading 5
Spreads on indices 6
Correlation trading: Dispersion trades 7
1.3. Mark-to-market and Sensitivities 8
Mark-to-market 8
Vega sensitivity 9
Skew sensitivity 9
Dividend sensitivity 9
2. Valuation and Hedging in Practice ......................................................11
2.1. Vanilla Options: Delta-Hedging and P&L Path-Dependency 11
Delta-Hedging 11
P&L path-dependency 12
2.2. Static Replication of Variance Swaps 14
Interpretation 16
2.3. Valuation 16
3. Theoretical Insights ........................................................................18
3.1. Idealized Definition of Variance 18
3.2. Hedging Strategies & Pricing 18
Self-financing strategy 19
Pricing 19
Representation as a sum of puts and calls 20
3.3. Impact of Dividends 20
Continuous Monitoring 21
Discrete Monitoring 21
3.4. Impact of Jumps 23
Appendix A — A Review of Historical and Implied Volatility..........................24
Appendix B — Relationship between Theta and Gamma...............................27
Appendix C — Peak Dollar Gamma..........................................................28
2
J U S T W H
References & Bibliography.....................................................................291. Variance Swaps
A T Y O U N E E D T O K N O W A B O U T V A R I A N C E S W A P S
1.1. Payoff
A variance swap is an instrument which allows investors to trade future realized (or historical)
volatility against current implied volatility. As explained later in this document, only variance
—the squared volatility— can be replicated with a static hedge. [See Sections 2.2 and 3.2 for
more details.]
Sample terms are given in Exhibit 1.1.1 below.
Exhibit 1.1.1 — Variance Swap on S&P 500 : sample terms and conditions
3
J U S T W H
VARIANCE SWAP ON S&P500
SPX INDICATIVETERMSAND CONDITIONS
Instrument: Swap
Trade Date: TBD
Observation Start Date: TBD
Observation End Date: TBD
Variance Buyer: TBD (e.g. JPMorganChase)
Variance Seller: TBD (e.g. Investor)
Denominated Currency: USD (“USD”)
Vega Amount: 100,000
Variance Amount: 3,125 ( determined as Vega Amount/(Strike*2) )
Underlying: S&P500 (Bloomberg Ticker: SPX Index)
Strike Price: 16
Currency: USD
Equity Amount: T+3 after the Observation End Date, the Equity Amount will be calculated and paid in
accordance with the following formula:
Final Equity payment = Variance Amount * (Final Realized Volatility2
– Strike
Price2
)
If the Equity Amount is positive the Variance Seller will pay the Variance Buyer the
Equity Amount.
If the Equity Amount is negative the Variance Buyer will pay the Variance Seller an
amount equal to the absolute value of the Equity Amount.
where
Final Realised Volatility = 100
N _ Expected
252
N t
1 t
2
1 t
t
P
P
ln
×
×∑  


 

 =
=
−
Expected_N = [number of days], being the number of days which, as of the Trade Date, are
expected to be Scheduled Trading Days in the Observation Period
P0 = The Official Closing of the underlying at the Observation Start Date
Pt = Either the Official Closing of the underlying in any observation date t or, at
Observation End Date, the Official Settlement Price of the Exchange-Traded
Contract
Calculation Agent: JP Morgan Securities Ltd.
Documentation: ISDAA T Y O U N E E D T O K N O W A B O U T V A R I A N C E S W A P S

Note:
Returns are computed on a logarithmic basis:  


 


−1 t
t
P
P
ln .


The mean return, which normally appears in statistics textbooks, is dropped. This is
because its impact on the price is negligible (the expected average daily return is 1/252nd
of the money-market rate), while its omission has the benefit of making the payoff
perfectly additive (3-month variance + 9-month variance in 3 months = 1-year variance.)
It is a market practice to define the variance notional in volatility terms:
Strike
Notional Vega
Notional Variance
×
=
2
With this adjustment, if the realized volatility is 1 ‘vega’ (volatility point) above the strike
at maturity, the payoff is approximately equal to the Vega Notional.
Convexity
The payoff of a variance swap is convex in volatility, as illustrated in Exhibit 1.1.2. This
means that an investor who is long a variance swap (i.e. receiving realized variance and paying
strike at maturity) will benefit from boosted gains and discounted losses. This bias has a cost
reflected in a slightly higher strike than the ‘fair’ volatility2
, a phenomenon which is amplified
when volatility skew is steep. Thus, the fair strike of a variance swap is often in line with the
implied volatility of the 90% put.
Exhibit 1.1.2 — Variance swaps are convex in volatility
-$3,000,000
-$2,000,000
-$1,000,000
$0
$1,000,000
$2,000,000
$3,000,000
$4,000,000
$5,000,000
0 10 20 30 40 5
Realized
Volatility
Payoff
0
Strike =24
Variance
Volatility
4
J U S T W H
2
Readers with a mathematical background will recall Jensen’s inequality: ) ( ) ( Variance E Variance E ≤ .Rules of thumb
A T Y O U N E E D T O K N O W A B O U T V A R I A N C E S W A P S
Demeterfi—Derman—Kamal—Zou (1999) derived a rule of thumb for the fair strike of a
variance swap when the skew is linear in strike:
2
var 3 1 skew T K ATMF × + ≈σ
where ATMF σ is the at-the-money-forward volatility, T is the maturity, and skew is the slope
of the skew curve. For example, with ATMF σ = 20%, T = 2 years, and a 90-100 skew of 2
vegas, we have Kvar ≈ 22.3%, which is in line with the 90% put implied volatility normally
observed in practice.
For log-linear skew, similar techniques give the rule of thumb:
( ) 2 4 2
2
3 2
var 5 12
4
T T T K ATMF ATMF ATMF ATMF σ σ
β
βσ σ + + + ≈
where ATMF σ is the at-the-money-forward volatility, T is the maturity, and β is the slope of
the log skew curve3
. For example, with ATMF σ = 20%, T = 2 years, and a 90-100 skew of 2
vegas, we have 19 . 0
) 9 . 0 ln(
% 2
≈ − = β and Kvar ≈ 22.8%.
Note that these two rules of thumb produce good results only for non-steep skew.
1.2. Applications
Volatility Trading
Variance swaps are natural instruments for investors taking directional bets on volatility:




Realized volatility: unlike the trading P&L of a delta-hedged option position, a long
variance position will always benefit when realized volatility is higher than implied at
inception, and conversely for a short position [see Section 2.1 on P&L path-dependency.]
Implied volatility: similar to options, variance swaps are fully sensitive at inception to
changes in implied volatility
Variance swaps are especially attractive to volatility sellers for the following two reasons:
Implied volatility tends to be higher than final realized volatility: ‘the derivative house has
the statistical edge.’
Convexity causes the strike to be around the 90% put implied volatility, which is slightly
higher than ‘fair’ volatility.
Forward volatility trading
Because variance is additive, one can obtain a perfect exposure to forward implied volatility
with a calendar spread. For example, a short 2-year vega exposure of €100,000 on the
EuroStoxx 50 starting in 1 year can be hedged as follows [levels as of 21 April, 2005]:
5
J U S T W H
3
The skew curve is thus assumed to be of the form: where F is the forward price. ) / ln( ) ( F K K ATMF
β σ σ − =A T Y O U N E E D T O K N O W A B O U T V A R I A N C E S W A P S

 Long 2-year variance struck at 19.50 on a Vega Notional of €200,000 (i.e. a Variance
Notional of 5,128)
Short 1-year variance struck at 18.50 on a Variance Notional of 5,128 / 2 = 2,564 (i.e. a
Vega Notional of €94,868)
Implied forward volatility on this trade is approximately4
:
{ { 5 . 20 1 18.50 - 2 19.50
tenor vol year 1 tenor vol year 2
= × ×
− −
3 2 1 3 2 1 .
Therefore, if the 1-year implied volatility is above 20.5 in one year’s time, say at 21, the
hedge will be approximately up ½ a vega, or €50,000, while the exposure will be down by the
same amount.
However, keep in mind that the fair value of a variance swap is also sensitive to skew.
Forward volatility trades are interesting because the forward volatility term structure tends to
flatten for longer forward-start dates, as illustrated in Exhibit 1.2.1 below. In this example,
we can see that the 1-year forward volatilities exhibit a downard sloping term structure.
Thus, an investor who believes that the term structure will revert to an upward sloping shape
might want to sell the 12x1 and buy the 12x12 implied volatilities, or equivalently sell 13m
and buy 24m, with appropriate notionals:
Buy 12x12 = Buy 24m and Sell 12m
Sell 12x1 = Sell 13m and Buy 12m
Buy spread = Buy 24m and Sell 13m
Exhibit 1.2.1 — Spot and forward volatility curves derived from fair variance swap strikes
13
14
15
16
17
18
19
20
21
22
23
24
1m 2m 3m 4m 5m 6m 7m 8m 9m 10m 11m 12m
Spot 3m fwd 6m fwd 12m fwd
Source: JPMorgan.
Spreads on indices
Variance swaps can also be used to capture the volatility spread between two correlated
indices, for instance by being long 3-month DAX variance and short 3-month EuroStoxx 50
variance. Exhibit 1.2.2 below shows that in the period 2000-2004 the historical spread was
6
J U S T W H
4
An accurate calculation would be:
) 2 (
) 1 (
1 2 1 2 2 2
y PV
y PV
vol y vol y × × − × , where PV(t) is the present value of €1 paid at timealmost always in favor of the DAX and sometimes as high as 12 vegas, while the implied
spread5
ranged between -4 and +4 vegas.
A T Y O U N E E D T O K N O W A B O U T V A R I A N C E S W A P S
Exhibit 1.2.2 — Volatility spread between DAX and EuroStoxx 50: historical (a) and implied (b)
a)
b)
Source: JPMorgan—DataQuery.
Correlation trading: Dispersion trades
A popular trade in the variance swap universe is to sell correlation by taking a short position
on index variance and a long position on the variance of the components. Exhibit 1.2.3 below
shows the evolution of one-year implied and realized correlation.
7
J U S T W H
5
Measured as the difference between the 90% strike implied volatilities. Actual numbers may differ depending on
skew, transaction costs and other market conditions.Exhibit 1.2.3 — Implied and realized correlation of EuroStoxx 50
A T Y O U N E E D T O K N O W A B O U T V A R I A N C E S W A P S
Source: JPMorgan—DataQuery.
More formally the payoff of a variance dispersion trade is:
Strike Residual Notional Notional w Index Index
n
1 i
i i i − − ∑ =
2 2
σ σ
where w’s are the weights of the index components, σ’s are realized volatilities, and notionals
are expressed in variance terms. Typically, only the most liquid stocks are selected among the
index components, and each variance notional is adjusted to match the same vega notional as
the index in order to make the trade vega-neutral at inception.
1.3. Mark-to-market and Sensitivities
Mark-to-market
Because variance is additive in time dimension the mark-to-market of a variance swap can be
decomposed at any point in time between realized and implied variance:
( )
( )  

−
−
+
 

× × × =
2 2
2
) , ( Vol Implied
) , 0 ( Vol Realized ) ( Notional
Strike T t
T
t T
t
T
t
T PV VarSwap t t
8
J U S T W H
where Notional is in variance terms, PVt(T) is the present value at time t of $1 received at
maturity T, Realized Vol(0, t) is the realized volatility between inception and time t, Implied
Vol(t, T) is the fair strike of a variance swap of maturity T issued at time t.
For example, consider a one-year variance swap issued 3 months ago on a vega notional of
$200,000, struck at 20. The 9-month zero-rate is 2%, realized volatility over the past 3 monthswas 15, and a 9-month variance swap would strike today at 19. The mark-to-market of the
one-year variance swap would be:
A T Y O U N E E D T O K N O W A B O U T V A R I A N C E S W A P S
619 , 359 $
20 19
4
3
15
4
1
%) 2 1 (
1
20 2
000 , 200 2 2 2
75 . 0
− =
 

 

− × + × ×
+
×
×
= t VarSwap
Note that this is not too far from the 2 vega loss which one obtains by computing the weighted
average of realized and implied volatility: 0.25 x 15 + 0.75 x 19 = 18, minus 20 strike.
Vega sensitivity
The sensitivity of a variance swap to implied volatility decreases linearly with time as a direct
consequence of mark-to-market additivity:
T
t T
Notional
VarSwap
Vega implied
implied
t −
× × =
∂
∂
= ) 2 ( σ
σ
Note that Vega is equal to 1 at inception if the strike is fair and the notional is vega-adjusted:
Strike
Notional Vega
Notional
×
=
2
Skew sensitivity
As mentioned earlier the fair value of a variance swap is sensitive to skew: the steeper the
skew the higher the fair value. Unfortunately there is no straightforward formula to measure
skew sensitivity but we can have a rough idea using the rule of thumb for linear skew in
Section 1.1:
( ) 2 2 2
var 3 1 skew T K ATMF × + ≈σ
skew
T
t T
Notional y Sensitivit Skew ATMF ×
−
× × × ≈ 2
6 σ
For example, consider a one-year variance swap on a vega notional of $200,000, struck at 15.
At-the-money-forward volatility is 14, and the 90-100 skew is 2.5 vegas. According to the rule
of thumb, the fair strike is approximately 14 x (1 + 3 x (2.5/10)2
) = 16.62. If the 90-100 skew
steepens to 3 vegas the change in mark-to-market would be:
000 , 100 $
10
5 . 2 3
10
5 . 2
14
15 2
000 , 200
6 2
≈ 




 −
× × ×
×
× ≈ ∆
∆
4 3 4 2 1 4 4 4 4 3 4 4 4 4 2 1
Skew y Sensitivit
MTM
Dividend sensitivity
Dividend payments affect the price of a stock, resulting in a higher variance. When dividends
are paid at regular intervals, it can be shown that ex-dividend annualized variance should be
9
J U S T W Hadjusted by approximately adding the square of the annualized dividend yield divided by the
number of dividend payments per year6
. The fair strike is thus:
A T Y O U N E E D T O K N O W A B O U T V A R I A N C E S W A P S
Year Per Divs Nb
Yield Div
K K div ex
2
2
var var
) (
) ( + ≈ −
From this adjustment we can derive a rule of thumb for dividend sensitivity:
T
t T
K
Year Per Divs Nb Yield Div
Notional
Yield Div
VarSwapt −
× × ≈
∂
∂
=
var
µ
For example, consider a one-year variance swap on a vega notional of $200,000 struck at 20.
The fair strike ex-dividend is 20 and the annual dividend yield is 5%, paid semi-annually. The
adjusted strike is thus (202
+ 52
/ 2)0.5
= 20.31. Were the dividend yield to increase to 5.5% the
change in mark-to-market would be:
( ) 310 , 12 $ 5 5 . 5
31 . 20
2 / 5
000 , 200 ≈ − × × ≈ ∆
∆
4 3 4 2 1
4 4 3 4 4 2 1 Yield Div
y sensitivit skew
MTM
However, in the presence of skew, changes in dividend expectations will also impact the
forward price of the underlying which in turns affects the fair value of varianc. This
phenomenon will normally augment the overall dividend sensitivity of a variance swap.
10
J U S T W H
6
More specifically the adjustment is
M
T
D
M
Τ
d
T
M
j
j × = 





× ∑
=
2
2
1
1
where d1, d2, …, dM are gross dividend yields and D is
the annualized ‘average’ dividend yield. See Section 3.3 for more details.A T Y O U N E E D T O K N O W A B O U T V A R I A N C E S W A P S



2. Valuation and Hedging in Practice
2.1. Vanilla Options: Delta-Hedging and P&L Path-Dependency
Delta-Hedging
Option markets are essentially driven by expectations of future volatility. This results from
the way an option payoff can be dynamically replicated by only trading the underlying stock
and cash, as described in 1973 by Black—Scholes and Merton.
More specifically, the sensitivity of an option price to changes in the stock price, or delta, can
be entirely offset by continuously holding a reverse position in the underlying in quantity equal
to the delta. For example, a long call position on the S&P 500 index with an initial delta of
$5,000 per index point (worth $6,000,000 for an index level of 1,200) is delta-neutralized by
selling 5,000 units of the S&P 500 (in practice 20 futures contracts: 6,000,000/(250 x 1,200))
Were the delta to increase to $5,250 per index point, the hedge should be adjusted by selling
an additional 250 units (1 contract), and so forth. The iteration of this strategy until maturity
is known as delta-hedging.
Once the delta is hedged, an option trader is mostly left with three sensitivities:
Gamma: sensitivity of the option delta to changes in the underlying stock price ;
Theta or time decay: sensitivity of the option price to the passage of time ;
Vega: sensitivity of the option price to changes in the market’s expectation of future
volatility (i.e. implied volatility.)7
The daily P&L on a delta-neutral option position can be decomposed along these three factors:
Daily P&L = Gamma P&L + Theta P&L + Vega P&L + Other (Eq. 1)
Here ‘Other’ includes the P&L from financing the reverse delta position on the underlying, as
well as the P&L due to changes in interest rates, dividend expectations, and high-order
sensitivities (e.g. sensitivity of Vega to changes in stock price, etc.)
Equation 1 can be rewritten:
Daily P&L = ... ) ( ) ( )
2
1 2
+ ∆ × + ∆ × Θ ∆ σ V t S ( + × Γ
where ∆S is the change in the underlying stock price, ∆t is the fraction of time elapsed
(typically 1/365), and ∆σ is the change in implied volatility.
We now consider a world where implied volatility is constant, the riskless interest rate is zero,
and other P&L factors are negligible. In this world resembling Black-Scholes, we have the
reduced P&L equation:
Daily P&L = ) ( )
2
1 2
t S ∆ × Θ ∆ ( + × Γ (Eq. 2)
We proceed to interpret Equation 2 in terms of volatility, and we will see that in this world
the daily P&L of a delta-hedged option position is essentially driven by realized and implied
volatility.
11
J U S T W H
7
Note that in Black-Scholes volatility is assumed to remain constant through time. The concept of Vega is thus
inconsistent with the theory, yet critical in practice.We start with the well-known relationship between theta and gamma:
A T Y O U N E E D T O K N O W A B O U T V A R I A N C E S W A P S
2 2
2
1
σ S Γ − ≈ Θ (Eq. 3)
where S is the current spot price of the underlying stock and σ the current implied volatility of
the option.
In our world with zero interest rate, this relationship is actually exact, not approximate.
Appendix B presents two derivations of Equation 3, one based on intuition and one which is
more rigorous.
Equation 3 is the core of Black-Scholes: it dictates how option prices diffuse in time in relation
to convexity. Plugging Equation 3 into Equation 2 and factoring S2
, we obtain a
characterization of the daily P&L in terms of squared return and squared implied volatility:
Daily P&L =




 

∆




 ∆
t
S
S
S 2
2
2
1
σ  −  × Γ 2
(Eq. 4)
The first term in the bracket, S
S ∆
, is the percent change in the stock price — in other words,
the one-day stock return. Squared, it can be interpreted as the realized one-day variance.
The second term in the bracket, , is the squared daily implied volatility, which one
could name the daily implied variance.
t ∆ 2
σ
Thus, Equation 4 tells us that the daily P&L of a delta-hedged option position is driven by the
spread between realized and implied variance, and breaks even when the stock price
movement exactly matches the market’s expectation of volatility.
In the following paragraph we extend this analysis to the entire lifetime of the option.
P&L path-dependency
One can already see the connection between Equation 4 and variance swaps: if we sum all
daily P&L’s until the option’s maturity, we obtain an expression for the final P&L:
Final P&L = [ ] ∑ =
∆ −
n
t
t t t r
0
2 2
2
1
σ γ (Eq. 5)
where the subscript t denotes time dependence, rt the stock daily return at time t, and gt the
option’s gamma multiplied by the square of the stock price at time t, also known as dollar
gamma.
Equation 5 is very close to the payoff of a variance swap: it is a weighted sum of squared
realized returns minus a constant that has the role of the strike. The main difference is that
in a variance swap weights are constant, whereas here the weights depend on the option
gamma through time, a phenomenon which is known to option traders as the path-dependency
of an option’s trading P&L, illustrated in Exhibit 2.1.1.
It is interesting to note that even when the stock returns are assumed to follow a random walk
with a volatility equal to σ, Equation 5 does not become nil. This is because each squared
return remains distributed around rather than equal to . However this particular t ∆ 2
σ t ∆ 2
σ
12
J U S T W Hpath-dependency effect is mostly due to discrete hedging rather than a discrepancy between
implied and realized volatility and will vanish in the case of continuous hedging8
.
A T Y O U N E E D T O K N O W A B O U T V A R I A N C E S W A P S
Exhibit 2.1.1 — Path-dependency of an option’s trading P&L
In this example an option trader sold a 1-year call struck at 110% of the initial price on a notional of $10,000,000 for
an implied volatility of 30%, and delta-heged his position daily. The realized volatility was 27.50%, yet his final
trading P&L is down $150k. Furthermore, we can see (Figure a) that the P&L was up $250k until a month before
expiry: how did the profits change into losses? One indication is that the stock price oscillated around the strike in
the final months (Figure a), triggering the dollar gamma to soar (Figure b.) This would be good news if the volatility
of the underlying remained below 30% but unfortunately this period coincided with a change in the volatility regime
from 20% to 40% (Figure b.) Because the daily P&L of an option position is weighted by the gamma and the volatility
spread between implied and realized was negative, the final P&L drowned, even though the realized volatility over
the year was below 30%!
a)
0%
20%
40%
60%
80%
100%
120%
140%
0
15
30
45
60
75
90
105
120
135
150
165
180
195
210
225
240
-250,000
-
250,000
500,000
750,000
Trading P&L ($) Stock Price (Initial = 100)
trading days
Strike = 110
Stock Price
'Hammered at the strike' !
Trading P&L
b)
43%
31%
21%
0%
20%
40%
60%
80%
100%
120%
140%
0
15
30
45
60
75
90
105
120
135
150
165
180
195
210
225
240
0%
10%
20%
30%
40%
50%
60%
70%
Volatility Stock Price (Initial = 100)
trading days
Strike = 110
Stock Price
50-day Realized
Volatility
Dollar Gamma
13
J U S T W H
8
See Wilmott (1998) for a theoretical approach of discrete hedging and Allen—Harris (2001) for a statistical analysis of
this phenomenon. Wilmott notes that the daily Gamma P&L has a chi-square distribution, while Allen—Harris
include a bell-shaped chart of the distribution of 1000 final P&Ls of a discretely delta-hedged option position.
Neglecting the gamma dependence, the central-limit theorem indeed shows that the sum of n independent chi-
square variables converges to a normal distribution.2.2. Static Replication of Variance Swaps
A T Y O U N E E D T O K N O W A B O U T V A R I A N C E S W A P S
In the previous paragraph we saw that a vanilla option trader following a delta-hedging
strategy is essentially replicating the payoff of a weighted variance swap where the daily
squared returns are weighted by the option’s dollar gamma9
. We now proceed to derive a
static hedge for standard (‘non-gamma-weighted’) variance swaps. The core idea here is to
combine several options together in order to obtain a constant aggregate gamma.
Exhibit 2.2.1 shows the dollar gamma of options with various strikes in function of the
underlying level. We can see that the contribution of low-strike options to the aggregate
gamma is small compared to high-strike options. Therefore, a natural idea is to increase the
weights of low-strike options and decrease the weights of high-strike options.
Exhibit 2.2.1 — Dollar gamma of options with strikes 25 to 200 spaced 25 apart
K = 25
K = 50
K = 75
K = 100
K = 125
K = 150
K = 175
K = 200
0 25 50 75 100 125 150 175 200 225 250 275 300
Underlying Level (ATM = 100)
Dollar Gamma
Aggregate
An initial, ‘naïve’ approach to this weighting problem is to determine individual weights w(K)
such that each option of strike K has a peak dollar gamma of, say, 100. Using the Black-
Scholes closed-form formula for gamma, one would find that the weights should be inversely
proportional to the strike (i.e. w(K) = c / K, where c is a constant.) [See Appendix C for
details.]
Exhibit 2.2.2 shows the dollar gamma resulting from this weighting scheme. We can see that
the aggregate gamma is still non-constant (whence the adjective ‘naïve’ to describe this
approach), however we also notice the existence of a linear region when the underlying level
is in the range 75—135.
14
J U S T W H
9
Recall that dollar gamma is defined as the second-order sensitivity of an option price to a percent change in the
underlying. In this paragraph, we use the terms ‘gamma’ and ‘dollar gamma’ interchangeably.Exhibit 2.2.2 — Dollar gamma of options weighted inversely proportional to the strike
A T Y O U N E E D T O K N O W A B O U T V A R I A N C E S W A P S
K = 25
K = 50
K = 100
K = 125
K = 150
K = 175
K = 200
Aggregate
0 25 50 75 100 125 150 175 200 225 250 275 300
Underlying Level (ATM = 100)
Dollar Gamma
Linear Region
This observation is crucial: if we can regionally obtain a linear aggregate gamma with a certain
weighting scheme w(K), then the modified weights w’(K) = w(K) / K will produce a constant
aggregate gamma. Since the naïve weights are inversely proportional to the strike K, the
correct weights should be chosen to be inversely proportional to the squared strike, i.e.:
2
) (
K
c
K w =
where c is a constant.
Exhibit 2.2.3 shows the results of this approach for the individual and aggregate dollar
gammas. As expected, we obtain a constant region when the underlying level stays in the
range 75—135.
A perfect hedge with a constant aggregate gamma for all underlying levels would take
infinitely many options struck along a continuum between 0 and infinity and weighted
inversely proportional to the squared strike. This is etablished rigorously in Section 3.2. Note
that this is a strong result, as the static hedge is both space (underlying level) and time
independent.
15
J U S T W HExhibit 2.2.3 — Dollar gamma of options weighted inversely proportional to the square of strike
A T Y O U N E E D T O K N O W A B O U T V A R I A N C E S W A P S
K = 25
K = 50
K = 100
K = 125
K = 150
K = 175
K = 200
Aggregate
0 25 50 75 100 125 150 175 200 225 250 275 300
Underlying Level (ATM = 100)
Dollar Gamma
Constant Gamma Region
Interpretation
One might wonder what it means to create a derivative whose dollar gamma is constant.
Dollar gamma is the standard gamma times S2
:
2
2
2
$
) ( S
S
f
S ×
∂
∂
= Γ
where f, S are the prices of the derivative and underlying, respectively. Thus, a constant
dollar gamma means that for some constant a:
2 2
2
S
a
S
f
=
∂
∂
The solution to this second-order differential equation is:
c bS S a S f + + − = ) ln( ) (
where a, b, c are constants, and ln(.) the natural logarithm. In other words, the perfect static
hedge for a variance swap would be a combination of the log-asset (a derivative which pays
off the log-price of the underlying stock), the underlying stock and cash.
2.3. Valuation
Because a variance swap can be statically replicated with a portfolio of vanilla options, no
particular modeling assumption is needed to determine its fair market value. The only model
choice resides in the computation of the vanilla option prices — a task which merely requires a
reasonable model of the implied volatility surface.
16
J U S T W H
Assuming that one has computed the prices p0(k) and c0(k) of Nputs
out-of-the money puts and
Ncalls
out-of-the-money calls respectively, a quick proxy for the fair value of a variance swap of
maturity T is given as:( ) ( )
2
0
1
1 2
0
1
1
2
0
0
) ( ) (
) (
) (
) (
) ( 2
VS
N
i
call
i
call
i call
i
call
i put
i
put
i
N
i
put
i
put
i
K T PV
k k
k
k c
k k
k
k p
T
VarSwap
calls puts
× −






− + − ≈ ∑ ∑ =
− −
=
A T Y O U N E E D T O K N O W A B O U T V A R I A N C E S W A P S
where VarSwap0 is the fair present value of the variance swap for a variance notional of 1, KVS
is the strike, PV0(T) is the present value of $1 at time T, and are the respective
strikes of the i-th put and i-th call in percentage of the underlying forward price, with the
convention k
put
i k call
i k
0 = 0.
In the typical case where the strikes are chosen to be spaced equally apart, say every 5%
steps, the expression between brackets is the sum of the put and call prices, weighted by the
inverse of the squared strike, times the 5% step. Exhibit 2.3.1 below illustrates this
calculation; in this example, the fair strike is around 16.62%, when a more accurate algorithm
gave 16.54%. We also see that the fair strike is close to the 90% implied volatility (17.3%), as
mentioned in Section 1.1.
Exhibit 2.3.1 — Calculation of the fair value of a variance swap through a replicating portfolio of
puts and calls
In this example, the total hedge cost of the replicating portfolio is 2.7014% (=2/T * Σi(wipi)), or 270.14 variance points.
For a variance notional of 10,000, this means that the floating leg of the variance swap is worth €2,701,397.53. For a
strike of 16.625 volatility points, and a 1-year present value factor of 0.977368853, the fixed leg is worth €2,701,355.88.
Thus, the variance swap has a value close to 0.
Weight =
5%
Strike%2
Under-
lying
Call
/ Put
Forward Strike Strike
(%Forward)
Maturity Implied
Volatility
Price
(%Notional)
20.00% SX5E P 2,935.02 1,467.51 50% 1Y 27.6% 0.04%
16.53% SX5E P 2,935.02 1,614.26 55% 1Y 26.4% 0.08%
13.89% SX5E P 2,935.02 1,761.01 60% 1Y 25.2% 0.15%
11.83% SX5E P 2,935.02 1,907.76 65% 1Y 24.0% 0.27%
10.20% SX5E P 2,935.02 2,054.51 70% 1Y 22.7% 0.46%
8.89% SX5E P 2,935.02 2,201.26 75% 1Y 21.4% 0.75%
7.81% SX5E P 2,935.02 2,348.01 80% 1Y 20.0% 1.17%
6.92% SX5E P 2,935.02 2,494.76 85% 1Y 18.7% 1.79%
6.17% SX5E P 2,935.02 2,641.51 90% 1Y 17.3% 2.67%
5.54% SX5E P 2,935.02 2,788.26 95% 1Y 16.0% 3.94%
2.50% SX5E P 2,935.02 2,935.02 100% 1Y 14.8% 5.74%
2.50% SX5E C 2,935.02 2,935.02 100% 1Y 14.8% 5.74%
4.54% SX5E C 2,935.02 3,081.77 105% 1Y 13.7% 3.37%
4.13% SX5E C 2,935.02 3,228.52 110% 1Y 12.9% 1.76%
3.78% SX5E C 2,935.02 3,375.27 115% 1Y 12.2% 0.81%
3.47% SX5E C 2,935.02 3,522.02 120% 1Y 11.9% 0.35%
3.20% SX5E C 2,935.02 3,668.77 125% 1Y 11.8% 0.15%
2.96% SX5E C 2,935.02 3,815.52 130% 1Y 11.9% 0.06%
2.74% SX5E C 2,935.02 3,962.27 135% 1Y 12.1% 0.03%
2.55% SX5E C 2,935.02 4,109.02 140% 1Y 12.5% 0.02%
2.38% SX5E C 2,935.02 4,255.77 145% 1Y 12.9% 0.01%
2.22% SX5E C 2,935.02 4,402.52 150% 1Y 13.4% 0.01%
17
J U S T W H
Source: JPMorgan.3. Theoretical Insights
A T Y O U N E E D T O K N O W A B O U T V A R I A N C E S W A P S
3.1. Idealized Definition of Variance
An idealized definition of annualized realized variance W0,T is given by:
[ ]T ,T S S
T
W ln , ln
1
0 =
where S denotes the price process of the underlying asset and [ln S, ln S] denotes the
quadratic variation of ln S. This definition is idealized in the sense that we implicitly assume
that it is possible to monitor realized variance on a continuous basis. It can be shown that the
discrete definition of realized variance given in Section 1.1 converges to the idealized
definition above when moving to continuous monitoring.
This definition applies in particular to the classic Ito process for stock prices:
t t t
t
t
dW S t dt S t
S
dS
) , , ( ) , , ( K K σ µ + =
where the drift µ and the volatility σ are either deterministic or stochastic. In this case, the
idealized definition of variance becomes:
∫ =
T
t ,T dt S t
T
W
0
2
0 ) , , (
1
K σ .
However, in the presence of jumps, the integral above only represents the continuous
contribution to total variance, often denoted [ ]c
T S S ln , ln . More details on the impact of
jumps can be found in Section 3.4.
3.2. Hedging Strategies & Pricing
For ease of exposure, we assume in this section that dividends are zero and that the
underlying price process S is a diffusion process. Moreover, let us assume that rates are
deterministic. Let us introduce some notation: By S, we denote the non-discounted spot price
process and by B
S
= Ŝ we denote the discounted spot price process, where B refers to the
deterministic money market account. It is important to note that [ ] [ ] S S S S ˆ ln , ˆ ln ln , ln =
when rates are deterministic. Moreover, the continuity of together with Ito's formula yields: Ŝ
[ ]t
t
u
u
t S S S d
S
S ˆ ln , ˆ ln
2
1 ˆ
ˆ
1 ˆ ln
0
− = ∫ for all 0 ≤ t ≤ T.
Define for all 0 ≤ t ≤ T:
[ ] ∫ = + =
t
u
u
t t t S d
S
S S S
0
ˆ
ˆ
1 ˆ ln ˆ ln , ˆ ln
2
1
π .
18
J U S T W H
We now explain how πT , which is closely related to the payoff of a variance swap, can be
replicated by continuous trading of the underlying and cash according to a self-financing
strategy (V0, φ, ψ), where V0 is the initial value of the strategy, φt and ψt the quantities to be
held in the underlying and cash at time t. The strategy is said to be self-financing because its
mark-to-market value V t t t t t B S V ψ ϕ + + = 0 verifies:t t t t t dB dS dV ψ ϕ + =
A T Y O U N E E D T O K N O W A B O U T V A R I A N C E S W A P S
(In other words the change in value of the strategy between times t and t + dt is computed as
a mark-to-market P&L: change in asset price multiplied by the quantity held at time t. There
is no addition or withdrawal of wealth.)
Self-financing strategy
One can verify that the following choice for (V0, φ, ψ) is self-financing:





 




− =
=
=
∫ T
t
u
u T
t
t T
t
B
S d
S B
S B
V
1 ˆ
ˆ
1
ˆ
1
0
0
0
ψ
ϕ
Let us point out a few important things:
– The self-financing strategy only replicates the terminal payoff πT but it does not replicate
πt for t < T. It is indeed easy to see that πT = VT:
T
T
u
u
T
T
T
u
u T
T
T T
T T T T T S d
S
B
B
S d
S B
S
S B
B S V V π ψ ϕ = =








− + = + + = ∫ ∫ 0 0
0
ˆ
ˆ
1 1 ˆ
ˆ
1
ˆ
1
However πt > Vt for t < T:
t t
T
t
T
u
u T
t
t
T
T
u
u T
t
t T
t
B
B
S d
S B
B
B
B
S d
S B
S
S B
V π π < = =








− + = ∫ ∫ 0 0
ˆ
ˆ
1 1 ˆ
ˆ
1
ˆ
1
– For the self-financing strategy to be predictable (i.e. for φt, ψt to be entirely determined
based solely on the information available before time t), the assumption that rates are
deterministic is crucial.
Pricing
Having identified a self-financing strategy we can proceed to price a variance swap by taking
the risk-neutral expectation of πT / BT:
0 ˆ
ˆ
1 ˆ ln
1
] ˆ ln , ˆ [ln
2
1
0
=








= 





+ = 





∫
T
u
u T
T
T
T
T T
T
S d
S B
E S
B
S S
B
E
B
E
π
since is assumed to be martingale under the risk-neutral measure. Whence: Ŝ
19
J U S T W H






− = 





T
T
T
T
S
B
E
T
W
B
E ˆ ln
1 2 1
, 0
At this point, it should be noted that this representation is valid only as long as we assume
that the underlying stock price process is continuous and rates are deterministic. As soon aswe deviate from this assumption, additional adjustments have to be made. For further details
in this regard, see Sections 3.3 and 3.4.
A T Y O U N E E D T O K N O W A B O U T V A R I A N C E S W A P S
Representation as a sum of puts and calls
In the previous paragraphs we showed that the annualized realized variance can be replicated
with a static position in a log contract on the discounted stock price. However in general it is
not possible to trade log contracts. Thus we need to obtain an alternative representation for
the price of the variance swap using standard put and call options.
For this purpose, note that a twice differentiable payoff f(S) can be re-written as follows:
( ) ( ) [ ]
∫ ∫
∞ +
+ +
+ +
− ′ ′ + − ′ ′ +
− − − ′ + =
T
T
F
T
F
T
T T T T T T T
dy y S y f dy S y y f
S F F S F f F f S f
) )( ( ) )( (
) ( ) ( ) (
0
Here ST denotes the spot price of the underlying and FT denotes the forward price10
. For
details we refer to the Appendix in Carr-Madan (2002). Choosing f(y) = ln(y) and taking
expectations yields:






+ − =  


 


∫ ∫
∞ +
1 2
1
0 2
) (
1
) (
1
ln
1
dy y Call
y
dy y Put
y F
S
B
E
T
T
T
where y now denotes forward moneyness, and Put(y) or Call(y) the price of a vanilla put or
call expiring at time T. Whence:






+ = 





∫ ∫
∞ +
1 2
1
0 2 , 0 ) (
1
) (
1 2 1
dy y Call
y
dy y Put
y T
W
B
E T
T
The interpretation of this formula is as follows: In case the stock price process S is a diffusion
process, the annualized realized variance can be replicated by an infinite sum of static
positions in puts and calls. Clearly, perfect replication is not possible since options for all
strikes are not available. A more accurate representation would thus be a discretized version
of the above (see Section 2.3 for an example.)
3.3. Impact of Dividends
When a stock pays a dividend, arbitrage considerations show that its price should drop by the
dividend amount. This phenomenon results in a higher variance when the stock price is not
adjusted for dividends, which is most often the case.
From a modeling standpoint, there are three standard ways to approach dividends: continuous
dividend yield, discrete dividend yield, and discrete dollar dividend. In the following
paragraphs we only focus on the first two cases:
– For continuous dividend yield, we consider the price process:
t t t t t t t dW S dt S q r dS σ + − = ) (
where r is a deterministic interest rate, q is a deterministic dividend yield, σ is either
deterministic or stochastic.
20
J U S T W H
10
Since we assume zero dividends in this section, we have FT = S0BT.A T Y O U N E E D T O K N O W A B O U T V A R I A N C E S W A P S

– For discrete dividend yield, we consider the price process:








− + = ∑ ≤t t
t j t t t t t t
j
j
S d d dW S dt S r dS σ
where r is a deterministic interest rate, σ is either deterministic or stochastic, and d1, …, dM
are M discrete continously compounded dividend yields11
paid at dates t1, …, tM.
Continuous Monitoring
A continuous dividend yield has no impact on variance when monitoring is continuous. In
this regard, observe that:
[ ] [ ]T T T S S
T
S S
T
W ˆ ln , ˆ ln
1
ln , ln
1
, 0 = =
where F
S
S = ˆ is the spot price normalized by the forward price. This is because the dividend
yield q is assumed to be deterministic. Hence, there is clearly no impact due to continuous
dividends12
. The hedging strategy also remains the same.
 Next, let us consider the impact of discrete dividends. In this case the stock price process S
follows:








− + = ∑ ≤t t
t j t t t t t t
j
j
S d d dW S dt S r dS σ
We now have:
[ ] [ ] ∑ ≤
+ = =
T t
j
c
T T T
j
d
T
S S
T
S S
T
W 2
, 0
1 ˆ ln , ˆ ln
1
ln , ln
1
Let us have a closer look at the hedging strategy in the context of discrete dividend yields.
For this purpose, define the total return process ( ) ∑ ≤
= t t j t t
j
d S exp
B G G / ˆ =
G where dividends are
reinvested in the stock. The discounted total return process being a martingale we
can use a similar hedging strategy as in Section 3.2 where the stock price process S is now
replaced by G.
Discrete Monitoring
Consider a set of sampling dates T t t t N = < < < = L 1 0
1 −
0 . For simplicity of presentation, we
assume that the time intervals − = ∆ i i i t t t are all constant and equal to ∆ . Recall the
discrete definition of annualized variance without mean:
t
∑ =








=
−
N
i t
t
i
i
S
S
T
Variance
1
2
1
ln
1
21
J U S T W H
11
Note that we consider here gross yields rather than annualized yields in the discrete dividend case. Contrary to the continuous monitoring case, a continuous dividend yield has an impact on
variance when monitoring is discrete. Consider the log return between ti-1 and ti:
A T Y O U N E E D T O K N O W A B O U T V A R I A N C E S W A P S
t z t q r
t S
t S
i
i
∆ + ∆  

 

− − =
−
σ σ 2
1 2
1
) (
) (
ln
where 1 1 1
, , ), 1 , 0 ( ~ − − −
= = = i i i t t t q q r r N z σ σ . Squaring the above yields:
t q r z t z t q r
t S
t S
i
i 2 / 3 2 2 2 2
2
2
1
2
2
1
2
2
1
) (
) (
ln ∆ 





− − + ∆ + ∆ 





− − =
−
σ σ σ σ
Because the expectation of z is nil and its variance E(z2
) is one, we obtain:
t t q r
t S
t S
E
i
i
∆ + ∆ 





− − = 





−
2 2
2
2
1
2
2
1
) (
) (
ln σ σ
The relative impact of discrete monitoring on variance is thus:
2
2
2
1
2
2
1
) (
) (
ln
σ
σ
σ
t q r
t
t S
t S
E
i
i
∆ 





− −
=
∆






−
At this point, it should be noted that even in the case where interest rates and dividends are
assumed to be zero, we obtain some drift contribution in case of discretization. This is due to
the σ2
term in the numerator. Moreover, for 0 → ∆t , the above expression implies that
there is no contribution due to interest rates and continuous dividend yields — as already
pointed out in the continuous monitoring case.
 We now specialize our considerations to the case of discrete dividends. Assuming that a
discrete dividend dj is paid between times ti-1 and ti and carrying out similar calculations as
in the previous paragraph yields the following expression for the expectation of the log
return:
t t d
t
r
S
S
E j
t
t
i
i
∆ + ∆ 





−
∆
− =








−
2 2
2
2 2
2
1 1
ln
1
σ σ
As can be seen from this equation, the contribution of discrete dividends does not converge to
zero for . We also obtain that the relative contribution of the interest rate and the
continuous dividend yield within a time interval ∆t amounts to:
0 → ∆t
2
2
2
2
1 1
σ
σ t d
t
r j ∆ 





−
∆
−
22
J U S T W H
12
Note that this statement is true within a deterministic or stochastic volatility framework. In other frameworks
(such as local volatility) volatility may depend on S and would thus be impacted by dividends.3.4. Impact of Jumps
A T Y O U N E E D T O K N O W A B O U T V A R I A N C E S W A P S
The purpose of this section is to analyze the impact of jumps, i.e. we no longer assume that
the stock price process S follows a diffusion process and instead consider a jump diffusion
process. For ease of exposure, we ignore interest rates and dividends:
 


 


− + + = ∑ = −
t N
n
n t t t
t
t
Y d dW dt
S
dS
1
) 1 ( σ µ
or:
 


 


− + + 





− = ∑ =
t N
n
n t t t t t Y d dW dt S d
1
2
) 1 ln(
2
1
ln σ σ µ
where W, N and Y are independent. W is a standard Brownian motion, N is a Poisson process
with intensity λ and (Yn) are independent, identically distributed log-normal variables:







+ =
−
) 1 , 0 ( ~ , ) 1 (
) ( ~
) , 0 ( ~
2
2
1
N G e k Y
dt P dN
dt N dW
n
G
n
t
t
n δ δ
λ
Parameters k, λ, δ can be interpreted as follows: k is the average jump size, λ controls the
frequency of jumps, and δ is the jump size uncertainty (standard deviation.) Furthermore, the
drift term µt is chosen such that is a martingale, i.e.: S S = ˆ k t λ µ − = . We then have for the
annualized realized variance:
∑ =
− + = =
T N
n
n
C
T T T Y
T
S S
T
S S
T
W
1
2
, 0 ) 1 ( ln
1
] ln , [ln
1
] ln , [ln
1
And the expected variance under the risk-neutral measure becomes:
[ ]








+ 





− + + = 2
2
2
, 0 , 0
2
1
) 1 ln(
1
] [ δ δ λ k W E
T
W E C
T T
23
J U S T W HAppendix A — A Review of Historical and Implied Volatility
A T Y O U N E E D T O K N O W A B O U T V A R I A N C E S W A P S
Historical Volatility
The volatility of a financial asset (e.g. a stock) is the level of its price uncertainty, and is
commonly measured by the standard deviation of its returns. For historical daily returns r1, r2,
…, rn, an estimate is given as:
∑ =
−
−
=
n
t
t Historical r r
n 1
2
) (
1
252
σ
where ∑ =
=
n
t
t r
n
r
1
1
is the mean return, and 252 is an annualization factor corresponding to the
typical number of trading days in a year.
Historical volatility is also called realized volatility in the context of option trading and
variance swaps.
Here it is assumed that the returns were independent and drawn according to the same
random ‘law’ or distribution — in other words, stock prices are believed to follow a ‘random
walk.’ In this case, the estimate is shown to be unbiased with vanishing error as the number
of daily observations n increases.
The daily returns are typically computed in logarithmic terms in the context of options to
remain consistent with Black-Scholes:
1
ln
−
=
t
t
t
P
P
r
where Pt is the price of the asset observed on day t, and ln(.) is the natural logarithm.
Implied volatility
Vanilla options on a stock are worth more when volatility is higher. Contrary to a common
belief, this is not because the option has ‘more chances of being in-the-money’, but because
the stock has more chances of being higher in-the-money, as illustrated in Exhibit A1.
In a Black-Scholes world, volatility is the only parameter which is left to the appreciation of
the option trader. All the other parameters: strike, maturity, interest rate, forward value,
are determined by the contract specifications and the interest rate and futures markets.
Thus, there is a one-to-one correspondence between an option’s price and the Black-Scholes
volatility parameter. Implied volatility is the value of the parameter for which the Black-
Scholes theoretical price matches the market price, as illustrated in Exhibit A2.
Because of put-call parity, European calls and puts with identical characteristics (underlying,
strike, maturity) must have the same implied volatility. This makes the distinction between
volatilities implied from call or put prices irrelevant. In the case of American options,
however, put-call parity does not always hold, and the distinction might be relevant.
24
J U S T W H
For each strike and maturity there is a different implied volatility which can be interpreted as
the market’s expectation of future volatility between today and the maturity date in the
scenario implied by the strike. For instance, out-of-the money puts are natural hedges
against a market dislocation (such as caused by the 9/11 attacks on the World Trade Center)
which entail a spike in volatility; the implied volatility of out-of-the money puts is thus higherthan in-the-money puts. This phenomenon is known as volatility skew, as though the market
expectations of uncertainty were skewed towards the downside.
A T Y O U N E E D T O K N O W A B O U T V A R I A N C E S W A P S
An example of a volatility surface is given in Exhibit A3.
Exhibit A1 — Simulated payoffs of an at-the-money call when the final stock price is log-normally
distributed and the volatility is either 20% or 40%.
0% 50% 100% 150% 200% 250% 300%
Final stock price (% initial price)
20% vol 40% vol
Distribution of
Final Stock Price
Simulated Payoff
Exhibit A2 — Black-Scholes and Volatility: a) volatility is an input, b) volatility is implied
a) b)
Option Price Option Price
Spot Price Spot Price Spot Price Spot Price
Strike Price Strike Price Strike Price Strike Price
Maturity Maturity Maturity Maturity
Interest Rate Interest Rate Interest Rate Interest Rate
Volatility Volatility Volatility Volatility
Black
Scholes
Option Price Option Price
Spot Price Spot Price Spot Price Spot Price
Strike Price Strike Price Strike Price Strike Price
Maturity Maturity Maturity Maturity
Interest Rate Interest Rate Interest Rate Interest Rate
Implied
Volatility
Implied
Volatility
Black
Scholes
25
J U S T W HExhibit A3 — Volatility Surface of EuroStoxx 50 as of December 2004
A T Y O U N E E D T O K N O W A B O U T V A R I A N C E S W A P S
250
2100
2550
2900
3800
5400
1W
3M
2Y
7Y
0%
5%
10%
15%
20%
25%
30%
35%
40%
45%
Source: JPMorgan.
26
J U S T W HAppendix B — Relationship between Theta and Gamma
A T Y O U N E E D T O K N O W A B O U T V A R I A N C E S W A P S
An intuitive approach
Consider the reduced P&L equation (Eq. 2) from Section 2.1
Daily P&L = ) ( )
2
1 2
t S ∆ × Θ ∆ ( + × Γ (Eq. 2)
In a fair game, the expected daily P&L is nil. This leaves us with:
[ ] 2
) (
2
1
S t ∆ × Γ − = ∆ × Θ E
where E[.] denotes mathematical expectation13
. Writing ( ) ( ) 2 2 2
S S S
S
× = ∆ ∆ yields:













∆
× Γ − = ∆ × Θ
2
2
2
1
S
S
S t E (Eq. B1)
The quantity ( is the squared daily return on the underlying stock; taking expectation
gives the stock variance over one day: . (Remember that implied volatility σ is given
on an annual basis.) Replacing the expected squared return by its expression and dividing
both sides of Equation B1 by ∆ finally yields:
)2
S
S ∆
t ∆ × 2
σ
t
2 2
2
1
S σ Γ − = Θ .
By the books
Consider the Black-Scholes-Merton partial differential equation:
2
2
2 2
2
1
S
f
S
S
f
rS
t
f
rf
∂
∂
+
∂
∂
+
∂
∂
= σ (Eq. B2)
where f(t, S) is the value of the derivative at time t when the stock price is S, and r is the
short-term interest rate.
Equation (B2) holds for all derivatives of the same underlying stock, and by linearity of
differentiation any portoflio Π of such derivatives. Identifying the Greek letter corresponding
to each partial derivative, we can rewrite Equation B2 as:
2 2
2
1
S rS r σ Γ + ∆ + Θ = Π
In the case of a delta-hedged portfolio, we have ∆ = 0, whence:
2 2
2
1
S r σ Γ − Π = Θ
Because the short-term rate is typically of the order of a few percentage points, the first term
on the right-hand side is often negligible, and we have the approximate relationship:
27
J U S T W H
2 2
2
1
S σ Γ − ≈ Θ .
13
Here we actually deal with conditional expectation upon the ‘information’ available at a certain point in time.Appendix C — Peak Dollar Gamma
A T Y O U N E E D T O K N O W A B O U T V A R I A N C E S W A P S
When the interest rate is zero, the dollar gamma of a vanilla option with strike K, maturity T
and implied volatility σ is given in function of the underlying level S as:
 


 

 +
− = Γ
T
T K S
T
S
K S 2
2 2
$
2
) 5 . 0 ) / (ln(
exp
2
) , (
σ
σ
π σ
In Exhibit C1 below we can see that the dollar gamma has a bell-shaped curve which peaks
slightly after the 100 strike. It can indeed be shown that the peak is reached when S is equal
to:
2 / * 2
T T
Ke S σ σ −
=
Exhibit C1 — Gamma and Dollar gamma of an at-the-money European vanilla
Gamma
Dollar Gamma
0 50 100 150 200 250
S*
28
J U S T W H29
J U S T W H A T Y O U N E E D T O K N O W A B O U T V A R I A N C E S W A P S
References & Bibliography
Allen, Harris (2001), Volatility Vehicles, JPMorgan Equity Derivatives Strategy Product Note.
Demeterfi, Derman, Kamal, Zou (1999), More Than You Ever Wanted To Know About Volatility
Swaps, Goldman Sachs Quantitative Strategies Research Notes.
Carr, Madan (1998), ‘Towards a Theory of Volatility Trading’ in VOLATILITY, R.A. Jarrow Risk
Books.
Gatheral (2002), Case Studies in Financial Modelling Fall 2002, NYU Courant Institute.
Hull (2000), Options, Futures & Other Derivatives 4th edition, Prentice Hall.
Musiela, Rutkowski (1997), Martingale Methods in Financial Modelling, Springer.
Vaillant (2001), A Beginner's Guide to Credit Derivatives, Working Paper, Nomura
International.
Wilmott (1998), ‘Discrete Hedging’ in The Theory and Practice of Financial Engineering, Wiley.