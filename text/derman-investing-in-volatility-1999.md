---
sha256: cfdcc53159e6adfcbba3a75e4912a76ecb74e6b5db83b962bd3d4cc3679bb1b0
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 21970
---
Page 1 of 10
Investing inVolatility
Published in Futures and Options World 1998
Special Supplement on the 25thAnnivesary of the Publication of the Black-Scholes Model
Emanuel Derman
Michael Kamal
Iraj Kani
John McClure
Cyrus Pirasteh
Joseph Z. ZouPage 2 of 10
Table of Contents
INTRODUCTION........................................................................................................3
A Brief History of Interest Rates...............................................................3
The Past and Future of Index Volatility1 ..................................................3
WHAT WE MEAN WHEN WE TALK ABOUT VOLATILITY.......................................4
INVESTING IN INDEX VOLATILITY...........................................................................5
Trading Implied Volatility with Options...................................................5
Isolating Local Volatility with Gadgets.....................................................5
Trading Real;zed Volatility by Hedging Options......................................6
USING REALIZED VOLATILITY CONTRACTS............................................................7
THE ADVANTGE OF VOLATILITY CONTRACTS........................................................7
THE SYNTHETIC CAPTURE OF REALIZED VOLATILITY ...........................................8Page 3 of 10
INTRODUCTION
A Brief History of Interest Rates
In the beginning was the bond1, its value measured simply by its price. Soon, analysts invented better mea-
sures of relative bond value: current yield, which led to yield to maturity, followed by the term structure of
yields, the zero coupon yield curve, and ﬁnally forward rates and the forward rate curve. Their importance
reﬂected the fact that these future rates can be locked in, once and for all, using bond portfolios today.
From then on, every interest rate trader and analyst carried in his head an abstract forward rate curve.
Thinking in terms of forward rates stimulated the development of new derivative instruments which mir-
rored the underlying reality of forward rates; Eurodollar futures contracts and interest rate swaps are just
two examples. But as far as the valuation and analysis of these instruments was concerned, the forward rate
curve was a deterministic, static parameter whose future evolution had no impact on the current instrument
value.
The history of interest rate analysis in the 1980’s and 1990’s has been the story of increasingly successful
attempts by modelers to breathe realistic life and movement (that is, volatility) into the evolution of the for-
ward rate curve, without violating theoretical arbitrage bounds. As traders’ conﬁdence in these valuation
models and their hedges grew, these efforts led to more liquid and better tailored varieties of interest rate
caps, swaptions, range notes and related interest rate derivatives whose values depend not only on the yield
curve today, but on its volatility as well. Figure 1 contains a schematic history of interest rate modeling.
The Past and Future of IndexVolatility
There is a fundamental similarity between the role of interest rates in the pricing of bonds and the role of
volatility in the pricing of index options. The term structure of interest rates provides the parameters that
determine bond values; the more complex term and strike structure of implied volatilities a provide the
parameters that determine options values.
1. “In the beginning was the word” + “My word is my bond.”
FIGURE 1. The evolution of interest rate modeling.
*
yield yield
maturity
zero-coupon
yield curve
rate
time
forward rate
curve
time
rate
[1] [2]
[3] [4]
adding volatility:
forward rate curves
a range of futurePage 4 of 10
Volatility ﬁrst entered the options world as a single parameter in the Black-Scholes formula. As each bond
was characterized by its own yield to maturity, so each option had its own implied volatility. Soon, market
participants began to abstract a term and strike structure of implied volatility – an implied volatility surface
for each option strike and expiration – that was the two-dimensional analog of the yield curve for bonds.As
market yield curves imply a curve of attainable forward rates which can be theoretically locked in via bond
portfolios, so market implied volatilities uniquely determine a surface of attainable future local volatilities,
varying with market level and future time1, which can be theoretically locked in by index options portfo-
lios.
The ﬁnal step in this evolution, still to come, is to add realistic volatility to the local volatility surface itself,
again without violating any arbitrage constraints. We expect a better understanding of the volatility of vol-
atilities to lead to the ability to produce, market, trade and hedge a wide array of volatility derivatives, and
so make possible the investment in pure volatility. Figure 2 contains an illustration of the evolution of vol-
atility models.
WHAT WE MEAN WHEN WE TALK ABOUT VOLATILITY
People loosely use the world “volatility” to mean several related but distinct concepts. From now on, for
clarity, we shall always qualify volatlity with the adjective “realized,” “implied,” or “local.”
The realized volatility V of an index over some period is the annualized standard deviation of its daily
returns over that period.
1. See for example E. Derman, Kani and Zou, “The LocalVolatility Surface,” FinancialAnalysts Journal,
1996.
FIGURE 2. The evolution of index volatility modeling.
* [1] [2]
[3] [4]
volatility
volatility
expiration
strike
implied volatility
surface
volatility
time
index
level
index
level
time
volatility
adding volatility of volatility;
the range of future local
volatility surfaces
local volatility
surfacePage 5 of 10
The implied volatility Σ(K,T) of an index, as implied by the current price of a particular European-style
option with strike K and expiration T, is the volatility parameter that, when entered into the Black-Scholes
formula, equates the model value to the option price.
The local volatility σ(S,T) of an index at some future market level S and time T is the future volatility the
index must have at that time and market level in order to make current options prices fair. Local volatilities
can be extracted from the set of all implied volatilities Σ(K,T) at a given time, and locked in by trading
portfolios of currently available options.
The analogy with interest rates is helpful in understanding these distinctions.
Realized interest rates are the actual interest rates that come to pass during some period; they are the
analog of realized volatility.
The yield to maturity of the bond is its implied yield; as implied volatility translates into an option
price through the Black-Scholes equation, so yield to maturity translates into a bond price through the
present value formula.
Finally, forward rates are the future rates that must come to pass to justify current yields to maturity;
they are the future rates that can be locked in by trading current bond portfolios. Local (sometimes
called “forward”) volatilities are their volatility analog.
INVESTING IN INDEX VOLATILITY
You can trade volatility in all its forms: implied, local and realized. In brief, implied volatility is the price
you must pay today to get exposure to future realized volatility. Local volatility is the price you can lock in
today for future delivery of exposure to future realized volatility. We elaborate on these principles below.
Trading ImpliedVolatilityWith Options
Implied volatility is the market price, denominated in Black-Scholes currency, that you pay today to gain
exposure to index volatility over some period starting today. Implied volatilities for most global equity
indexes vary quite strongly with strike and expiration, displaying the well-known volatility smile. But the
exposure to volatility you obtain by owning index options is impure: the options provides index level risk,
dividend risk, interest rate risk and volatility risk. The difﬁculty lies in removing the exposure to every-
thing except the volatility.
Isolating LocalVolatility with “Gadgets”
Local or forward volatility is the market price of volatility you can lock in today to obtain volatility expo-
sure over speciﬁc some range of future times and market levels.
As usual, the interest rate analogy helps. In the interest rate world, for example, you can lock in future
interest rates between two years and three years by going simultaneously long a three-year zero-coupon
bond and short a two-year zero-coupon bond, such that the present value of the total bond portfolio is zero.
In this way you lock in the one-year forward rate two years from now. This bond portfolio has exposure
only to this particular forward rate. As time passes, this portfolio increases in value as the forward rate
drops, and decreases as it rises.You can think of this portfolio, which we call an interest-rate gadget, as aPage 6 of 10
synthetic Eurodollar interest-rate futures contract that can be used to hedge exposure to forward rates. Fig-
ure 3a illustrates the interest rate gadget.
Something similar can be done with options1. No listed local volatility futures are yet available. But, we
can deﬁne a portfolio of standard options, called a volatility gadget,that serves as the volatility analog of a
Eurodollar futures contract2. A volatility gadget is a small portfolio of standard index options, created out
of a long position in a calendar spread and a short position in an overlapping butterﬂy spread that has zero
total options value. This gadget is sensitive to (forward) local index volatility only in the region between
the strikes and expirations of the spreads in the gadget. Figure 3b illustrates the volatility gadget. By buy-
ing or selling suitably constructed gadgets corresponding to different future times and index levels, we can
theoretically hedge an index option portfolio against changes in future local volatility.
Trading RealizedVolatility By Hedging Options
Once you own an option, you have “paid implied volatility” to obtain exposure to both volatility and index
level, ignoring for now the smaller risks due to variation in dividend payments and interest rates. By hedg-
ing away the index exposure, dynamically or statically, you can gain pure exposure to realized volatility, as
1. See I.Kani, E. Derman and M. Kamal, Trading and Hedging Local Volatility, Goldman Sachs Quantita-
tive Strategies Research Notes,August, 1996.
2. In the interest of clarity, we allow ourselves the luxury of a somewhat cavalier description of the gadget,
which is only strictly correct if interest rates are zero and the strikes in the option spreads are inﬁnitesi-
mally close. For a more general and more complex treatment, see Footnote 1.
FIGURE 3. (a) A schematic depiction of an interest rate gadget that provides exposure to forward
rates between years 2 and 3. (b). A schematic depiction of a volatility gadget that provides
exposure to local volatility in the shaded index region. Up (down) arrows correspond to long
(short) positions.
0
2
3
(a)
1
sell 2-year zero
that requires payment
at end of year 2
buy 3-year zero
that produces cash
at end of year 3
year
REGION OF
FORWARD RATE
EXPOSURE
(b)
cash
flow
strike
index
level
year
calendar
spread
long
short
butterfly
spread
REGION OF
LOCAL VOLATILITY
EXPOSUREPage 7 of 10
we shall demonstrate towards the end of this article in the section entitled “The Synthetic Capture of
RealizedVolatility” on page 8. But capturing pure volatility is difﬁcult: perfect hedging is impossible and
frequent rehedging is expensive, especially close to expiration.Also, as the market moves you may have to
roll into new options to maintain a constant volatility sensitivity. Capturing volatility is also risky: there
may be unhedgeable index jumps, variation in volatility both foreseen and unforeseen, and varying liquid-
ity. In short, sophisticated investors in pure volatility need complex analytical skills and software, as well
as good market instincts, in order to carry out these strategies. For this reason, clients may prefer buying a
contractfrom a dealer that delivers pure realized volatility, leaving to them the mechanics of capture.
Capturing realized volatility involves trading options whose price is determined by their implied volatili-
ties. Therefore, the fair value of a derivative contract that delivers pure realized volatility is approximately
equal to the level of current implied volatility. Historically, implied index volatility is typically several per-
centage points higher than past realized volatility over the same period, probably because, as with all risky
products, market makers determine prices by factoring in their transactions costs as well some protective
risk premium.
USING REALIZEDVOLATILITY CONTRACTS
As pointed out, the fair purchase level for realized volatility V is, roughly speaking, the current
implied volatility1
Σ.A realized volatility contract is a forward contract on realized volatility V
whose delivery price is Σ.
The purchaser of the contract with a face value of $1 receives (pays) $1 for every percentage point
by which realized volatility V over the life of the contract exceeds (is exceeded by) Σ.
The purchaser of a realized volatility contract will beneﬁt if future realized volatility is greater than cur-
rent implied levels. He is seeking to gain from a belief in future uncertainty, even if that uncertainty ulti-
mately leads to no permanent long-term change in index level.
The seller of a realized volatility contract seeks to gain from a belief that future realized volatility will be
appreciably lower than current implied volatility. The owner of a broad portfolio of index options that is
long volatility at a variety of market strikes may ﬁnd this a simpl one-stop way to liquidate the portfolio’s
volatility exposure after a runup in implied volatility levels.
THE ADVANTAGE OFVOLATILITY CONTRACTS
Realized volatility contracts aren’t the only way to invest in pure volatility. For example, you can also buy
volatility using at-the-money straddles, whose value increases with volatility. But straddles are hybrid: they
provide both market and volatility exposure.As the market moves away from the strike, a straddle loses its
1. Volatility mavens will realize that the implied volatilities of individual S&P options vary strongly with
strike, expiration and market level. In practice a more careful view of implied volatility as the cost of pur-
chasing realized volatility may be necessary, taking into account the important effects of the volatility
skew and term structure. In the interest of clarity, we ignore most of these subtleties here, though these
details obviously effect the engineering and pricing of volatility contracts.Page 8 of 10
relatively pure sensitivity to volatility, and evolves into a more complex bet on both market direction and
volatility. In order to regain its pure volatility sensitivity, the straddle will have to be rolled at uncertain
future market levels and trading costs.
In contrast, realized volatility contracts provide pure volatility exposure by design. They provide a
straightforward means for clients to accumulate or dispose of volatility as a primary asset, with no related
index exposure at all. In the same way as guaranteed exchange rate (Quantos) futures contracts on foreign
stock indexex allow allow investment in foreign markets without exchange-rate risk, so volatility contracts
allow index volatility acquisition without index risk.
In principle, volatility contracts can be liquidated at some intermediate date between inception and expira-
tion.As with any forward contract, the value on that date will depend upon both the prevailing implied vol-
atility structure and the volatility realized thus far.
THE SYNTHETIC CAPTURE OF REALIZEDVOLATILITY
In this section we explain how to synthesize pure realized volatility exposure.
First, we need a precise deﬁnition of realized volatility V. Let S0 denote the initial index level at the start of
the period, and Si the closing index value on each subsequent day i of the N days in which the volatility is
measured. Then the daily change on the index is , the daily return is , and
the realized volatility is the square root of the variance of these returns. For an index that moves in a ran-
dom walk, the mean of the returns is expected to be negligible compared to their individual magnitude.
Therefore, we use the simpler (zero-mean) deﬁnition
(EQ 1)
Realized volatility is often quoted on an annualized basis by multiplyingV by , the square root of the
number of trading days in a year.
To obtain daily volatility exposure, we need to own a position that gains an amount proportional to
, the daily variance of the index in Equation 1. Note that this expression involves the square of
∆S, and is therefore positive for any index move.
A simple position in one share of the index results in a one-day gain of ∆S, which can be positive or nega-
tive, and fails to capture the daily variance. However, a portfolio consisting of an option and its delta hedge
produces a one-day gain proportional to (∆S)2 , always positive.
Figure 4a illustratesthe value of an index option position and its delta hedge as the index level varies.The
value of an option is convex relative to the hedge: it performs better than the index on up and down moves.
∆Si Si 1 + Si – ( ) = ∆Si ( ) Si ⁄
V
∆Si
Si
------- -
 
 
2
i 0 =
N 1 –
∑
N 1 –
-------------------------- - =
252
∆S ( ) S ⁄ )
2Page 9 of 10
Figure 4b shows the instantaneous gain or loss from owning the option and its hedge after a small shift
(∆S) in the index.You can see that the convexity leads to a gain that is positive whether the index moves up
or down. The curve in Figure 4b is a parabola, and the gain is given by , where Γ
(“gamma”) is a measure of the curvature or convexity of the option, and is a parameter both familiar and of
great importance to options traders. The greater the curvature Γ of the track the option rides on, the more
sharply the options driver must turn the steering wheel to keep the hedge on track as the index moves, and
so, the riskier the position
The quantity is the gain from an instantaneous index move. The key principle of options
valuation is that no free lunch can be obtained by using options. Therefore, if the index actually moves
with a realized volatility identical to the implied volatility Σ at which the option was purchased, the gain
from small index moves must cancel the loss in option value due to the passage of time1. Figure 4c shows
this loss due to” time decay”; its magnitude in an instant ∆t is given by (1/2)Γ(Σ2S2∆t). Figure 4d shows
the net result: the net gain for the option and its hedge over an instant of time ∆t is given by
(EQ 2)
The ﬁrst term represents the gain from index moves, the second the loss from time decay during some
small time instant ∆t. If the index actually moves an amount during the instant ∆t, consistent with
its implied volatility, there is neither gain nor loss from the hedged option, and the hedged position breaks
even.
Equation 2 shows that the gain on the hedged position is proportional to Γ(∆S)2. Recall from Equation 1
that a gain proportional to will capture the daily realized volatility. We can achieve this by own-
ing a delta-hedged options position whose curvature Γ is proportional to 1/S2, the inverse of the square of
the index level. The daily trading gain of the hedged position is then equal to the realized volatility each
day, less the initial implied volatility.
There are both dynamic and static approaches to constructing an options position with Γ ∼ 1/S2. In the
dynamic method, at each index level S you continually maintain a portfolio consisting of a quantity of 1/S2
options, each individually providing a zero ∆ and a constant Γ. As an example, the you can use at-the-
money forward straddles, which instantaneously have the appropriate ∆ and constant Γ. As the index
moves, you have to keep rolling to new at-the-money straddles.
The static method requires buying an options portfolio whose Γ is guaranteed to be 1/S2 at all market lev-
els, and then delta-hedging it. This static portfolio can be shown to be an index-derivative contract whose
payoff at expiration is proportional to the natural logarithm of the index2. Since this “log contract” is
unavailable in the listed market, you can approximate it by a combination of ordinary listed options that
1. As in all options valuation, gains and losses are computed relative to the riskless return.)
2. See for example Neuberger, “The Log Contract:A new instrument to hedge volatility”, Journal of Portfo-
lio Management, Winter 1994..
1 2 ⁄ ( )Γ ∆S ( )2
1 2 ⁄ ( )Γ ∆S ( )2
net gain 1 2 ⁄ ( )Γ ∆S ( )2 Σ
2
S
2
∆t – [ ] =
ΣS ∆t
∆S S ⁄ ( )
2Page 10 of 10
has approximately the same payoff. Static or dynamic, the method we use in practice depends on prevail-
ing options spreads, estimates of liquidities and trading costs.
If you are interested in volatility as an asset, it may be simplest to buy a realized volatility contract from a
trading desk that can synthesize it. Over time, as both the analytical and trading technology mature, we
expect to see the evolution of volatility options and realted volatility derivatives.
FIGURE 4. (a) The value of an index option and its hedge. (b) The quadratic gain of the delta-
hedged contract as a function of shift in index level. (c) The loss from time decay over time ∆t.
(d)The net gain on the hedged position.
index
value
index
S
level S
index
shift ∆S
gain ~ 1/2Γ(∆S)2
index option
hedge
convex
shape
loss
index
shift ∆S
(a) (b)
(c)
loss ~ (1/2)Σ2S2∆t
index
shift ∆S
(d)
net gain ~ gain - loss
break even at ΣS(∆t)1/2