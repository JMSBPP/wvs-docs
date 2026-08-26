---
sha256: 2866c135a246afab6a8502ca7b5e0253a2a11b69cc3c0920861ca8cf8f339dff
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 218698
---
Quantitative Strategies
Technical Notes
Goldman
Sachs
Stochastic Implied Trees:
Arbitrage Pricing With
Stochastic Term and Strike
Structure of Volatility
Emanuel Derman
Iraj Kani
April 1997QUANTITATIVE STRATEGIES TECHNICAL NOTES Sachs
Goldman
SUMMARY
In this paper we present an arbitrage pricing framework for valuing and hedging
contingent equity index claims in the presence of a stochastic term and strike
structure of volatility. Our approach to stochastic volatility is similar to the
Heath-Jarrow-Morton (HJM) approach to stochastic interest rates. Starting from
an initial set of index options prices and their associated local volatility surface,
we show how to construct a family of continuous time stochastic processes
which define the arbitrage-free evolution of this local volatility surface through
time. The no-arbitrage conditions are similar to, but more involved than, the HJM
conditions for arbitrage-free stochastic movements of the interest rate curve.
They guarantee that even under a general stochastic volatility evolution the initial
options prices, or their equivalent Black-Scholes implied volatilities, remain fair.
We introduce stochastic implied trees as discrete implementations of our family
of continuous time models. The nodes of a stochastic implied tree remain fixed as
time passes. During each discrete time step the index moves randomly from its
initial node to some node at the next time level, while the local transition proba-
bilities between the nodes also vary. The change in transition probabilities corre-
sponds to a general (multifactor) stochastic variation of the local volatility
surface. Starting from any node, the future movements of the index and the local
volatilities must be restricted so that the transition probabilities to all future
nodes are simultaneously martingales. This guarantees that initial options prices
remain fair. On the tree, these martingale conditions are effected through appro-
priate choices of the drift parameters for the transition probabilities at every
future node, in such a way that the subsequent evolution of the index and of the
local volatility surface do not lead to riskless arbitrage opportunities among dif-
ferent option and forward contracts or their underlying index.
You can use stochastic implied trees to value complex index options, or other
derivative securities with payoffs that depend on index volatility, even when the
volatility surface is both skewed and stochastic. The resulting security prices are
consistent with the current market prices of all standard index options and for-
wards, and with the absence of future arbitrage opportunities in the framework.
The calculated options values are independent of investor preferences and the
market price of index or volatility risk. Stochastic implied trees can also be used
to calculate hedge ratios for any contingent index security in terms of its underly-
ing index and all standard options defined on that index.
________________________
We thank Indrajit Bardhan, Peter Carr, Michael Kamal and Joseph Zou for help-
ful conversations. We are also grateful to Barbara Dunn for her careful review of
the manuscript.-1
QUANTITATIVE STRATEGIES TECHNICAL NOTES
Goldman
Sachs
TABLE OF CONTENTS
INTRODUCTION10
QUANTITATIVE STRATEGIES TECHNICAL NOTES Sachs
Goldman
LOCAL VOLATILITY SURFACE: THE EFFECTIVE THEORY OF VOLATILITY ............................... 4
THE EFFECTIVE INTEREST RATE THEORY .................................................................................5
THE EFFECTIVE VOLATILITY THEORY .......................................................................................8
TOWARDS A STOCHASTIC THEORY OF VOLATILITY ................................................................11
The Stochastic Interest Rate Theory ..........................................................................11
The Stochastic Volatility Theory ...............................................................................12
The HJM Conditions and the Stochastic Theory of Interest Rates.............................14
The NO-ARBITRAGE CONDITIONS AND THE STOCHASTIC THEORY OF VOLATILITY ...............16
STOCHASTIC IMPLIED TREES....................................................................................................21
Our Notation in Discrete Time ..................................................................................24
A Simple Example .....................................................................................................27
Pricing of Some Contracts with Payoffs Based on Realized Volatility......................35
HEDGING INDEX AND VOLATILITY RISKS IN STOCHASTIC VOLATILITY MODELS...................36
MORE REALISTIC STOCHASTIC VOLATILITY MODELS.............................................................37
SUMMARY.................................................................................................................................38
APPENDIX A: EXPECTATION DEFINITIONS OF LOCAL VOLATILITY .....................................39
APPENDIX B: MATHEMATICS OF EFFECTIVE THEORIES ......................................................43
APPENDIX C: LOCAL VOLATILITY VARIATIONAL FORMULAS IN EFFECTIVE
VOLATILITY THEORIES ............................................................................................................45
APPENDIX D: THE NO-ARBITRAGE CONDITIONS AND THE EXISTENCE OF THE EQUIVALENT
MARTINGALE MEASURE IN STOCHASTIC VOLATILITY THEORIES ...........................................48
APPENDIX E: COMPUTING DRIFT PARAMETERS IN ARBITRAGE-FREE STOCHASTIC VOLATILI-
TY THEORIES ...........................................................................................................................50
The Black-Scholes theory of options pricing [Black 1973] assumes that stock prices are sto-
chastic and vary lognormally, but that future stock volatilities, interest rates and dividend
yields are known and deterministic. The theory is based on the exclusion of arbitrage: an
option’s payoff can be replicated by that of a time-varying portfolio of stock and riskless
INTRODUCTION1
QUANTITATIVE STRATEGIES TECHNICAL NOTES
Goldman
Sachs
bonds, and must therefore at any time have the same value as the portfolio. The
most compelling consequence of this arbitrage-free approach is that options values
are preference-free: investors of all risk preferences can agree on the unique fair
value of an option. This transcendent quality of the theory has led to its great practi-
cal success, spawning more than two decades of intensive research that extended it
to other underlyers and relaxed its basic assumptions so as to better match the
observed behavior of options markets and underlyers. The current generation of
models, even though they treat underlyers more realistically and can be calibrated to
prevailing options market prices, are still based on an arbitrage-free approach,
admitting no arbitrage opportunities in their theoretical framework.
The history of interest rate options pricing illustrates this development. Original
models were simple adaptations the Black-Scholes formula with bonds, rather than
stocks, as the underlyers. Today, most interest rate options pricing models assume
interest rates themselves are stochastic and mean-reverting, allow for several sto-
chastic factors, and can be calibrated to observed initial bond prices (and their vola-
tilities), while constraining future interest-rate evolution to be arbitrage-free. These
models fall into two basic families. Equilibrium models1
consider interest rate pro-
cesses depending on one or more state variables and are derived from general equi-
librium arguments. The market prices of risk are then derived from associated
characteristics of the yield curve (such as level, slope, curvature, etc.) or bond
prices. In general these models are not calibrated to all current bond prices, and may
therefore contain initial arbitrage violations. Arbitrage-free models, in contrast, are
calibrated to all initial bond prices and also admit no future arbitrage violations.
They achieve this in two different ways. The first class2 use stochastic interest rate
processes that automatically generate arbitrage-free future scenarios, and equip the
process with enough parameters to be forcibly calibrated to the initial traded bond
prices. The second class3, instead, start with exogenously specified stochastic pro-
cess for bond prices or forward rates. They then derive constraints on the evolution
of bond prices or forward rates so that no future arbitrages occur.
The history of stochastic volatility modeling is shorter but still similar to the history
of stochastic interest rates. Existing stochastic volatility models fall into two basic
families. Complete-market models4
specify conditions under which the financial
market is complete in the presence of the volatility risk. They posit (if necessary)
hypothetical traded volatility instruments that can be used to hedge the volatility risk
and complete the market. Contingent claim prices in these models depend critically
on the price dynamics of the volatility instruments and may also implicitly depend
1. See, for example, Cox, Ingersoll and Ross [1985].
2. See, for example, Vasicek [1977], Black, Derman and Toy [1990].
3. See, for example, Ho and Lee [1986], Heath-Jarrow and Morton [1992].
4. See, for example, Merton [1973], Cox and Ross [1976], Johnson and Shanno [1987], Eisenberg and
Jarrow [1994].2
QUANTITATIVE STRATEGIES TECHNICAL NOTES Sachs
Goldman
on the market price(s) of volatility risk. Equilibrium models5
tend to assume (rather
than derive) some parametric form for the stochastic evolution of the index and its
volatility in equilibrium, and then derive implicit options valuation formulas which
depend on the parameters of the process. The traded options prices are then inverted
for the unknown parameters.
Complete-market models can be somewhat arbitrary and sometimes unnatural
because of the specific assumptions they make about the hypothetical volatility
instruments. The equilibrium volatility models have the drawback that the choice of
the parametric form for the underlying stochastic processes remains largely arbi-
trary. In addition, it is usually difficult to invert complex and non-linear options
prices to obtain the parameters. Finally, ad hoc specification of the market prices of
risk can lead to violations of arbitrage6.
In this paper we propose a new arbitrage-based approach to contingent claims valu-
ation with stochastic volatility7
, similar to the Heath-Jarrow-Morton (HJM) method-
ology for stochastic interest rates8. We begin with a continuous time economy with
multiple factors. We work with local (forward) volatilities, instead of implied vola-
tilities (or option prices), imposing an exogenous stochastic structure on the local
volatility surface. The primacy of the local volatility surface in our work is analo-
gous to that of the forward rate curve in the HJM framework. Our model takes as
given the initial local volatility surface and posits a general multi-factor continuous
time stochastic process for its evolution across time. To ensure that this process is
consistent with an arbitrage-free economy we characterize the conditions which
guarantee absence of explicit arbitrage opportunities (at any future time) among the
various option (and futures) contracts defined and traded on the underlying index.
Under these conditions markets are complete and contingent claim valuation is pref-
erence-free. Unfortunately, in contrast to the HJM conditions, here the arbitrage-
free conditions are complex and non-linear (integral) equations, which are difficult
to use in their continuous form.
We then introduce Stochastic Implied Trees as a discrete-time framework where the
volatility surface undergoes multi-factor (arbitrage-free) stochastic variations. Here
we work with trinomial stochastic implied trees9
. The location of the nodes in this
kind of tree are fixed but the transition probabilities vary stochastically as time
changes and index level moves. As time evolves, the index level moves randomly
from node to node while local volatilities (and concurrently the transition probabili-
ties) fluctuate stochastically across the tree. Starting from any initial node, the future
5. See, for example, Wiggins [1977], Hull and White [1977], Stein and Stein [1991].
6. See Cox, Ingersoll and Ross [1985], Heath, Jarrow and Morton [1992].
7. Presented in Risk Advanced Mathematics for Derivatives Conference, New York, December 1997.
8. For attempts in this direction see, for example, Dupire [1993] and Bruno Dupire in the Proceedings
of Risk Derivatives Conference, Brussels, February 1997.
9. See Derman, Kani and Chriss [1996], Kani, Derman and Kamal [1996].3
QUANTITATIVE STRATEGIES TECHNICAL NOTES
Goldman
Sachs
movements of the index and the local volatility surface must be restricted so that total
transition probabilities to all future nodes are simultaneously martingales. On the tree,
these martingale conditions can be satisfied by making an appropriate choice of the
drift parameter for every future node. In the discrete time framework defined by the
stochastic implied tree, this process step-by-step guarantees absence of arbitrage
opportunities among different option (and forward) contracts and the underlying
index.
We draw extensively on the analogy between interest rates and volatility throughout
this paper. We begin by reviewing the concept of the local (forward) volatility surface
and the effective theory of volatility which it defines. The local volatility surface is the
options world analogue of the forward interest rate curve. Standard option prices cal-
culated using today’s local volatility surface match their market prices, just as the
bond prices calculated from today’s forward rate curve match their market prices. The
dynamics of standard option prices, as defined by today’s local volatility surface,
albeit arbitrage-free, is based on the assumption of non-stochastic volatility, as por-
trayed by the static (non-random) nature of the local volatility surface. This effective
dynamics of option prices is analogous to the deterministic, but arbitrage-free, bond
price dynamics which result from a static forward rate curve. To allow stochastic
dynamics we introduce exogenous stochastic structure on the effective theory. This is
to say that we allow general (multi-factor) fluctuations of the local volatility surface as
time and spot index level change. We impose dynamical conditions which explicitly
guarantee absence of arbitrage among standard options, forwards and the underlying
index. This process will augment an effective theory of volatility to a full stochastic
theory of volatility in a manner which is the hallmark of the HJM approach to stochas-
tic interest rates.
We can think of local volatility σK,T as the market’s consensus estimate of instanta-
neous volatility at the future market level K and future time T. Local volatilities corre-
sponding to different future market levels and times together comprise the local
volatility surface. The local volatility surface indicates the fair value of future index
volatility at future market levels and times as implied by the spectrum of available
standard option (and forward contract) prices.
The relationship between the local volatilities and option prices (or implied volatili-
ties) in the options world is analogous to the relationship between the forward rates
and bond prices (or yield-to-maturities) in the fixed income world. We can calculate
the forward interest rates fT corresponding to the future times T from the spectrum of
zero-coupon bond prices BT with different maturities T, using a well-known formula
(EQ 1)
Similarly, we can calculate the local volatility σK,T corresponding to the future market
level K and time T from the spectrum of standard option prices CK,T , with different
strikes K and maturities T, using the formula
LOCAL VOLATILITY SUR-
FACE: THE EFFECTIVE THE-
ORY OF VOLATILITY
fT
1
BT
----- -
dBT
dT
-------- - – =4
QUANTITATIVE STRATEGIES TECHNICAL NOTES Sachs
Goldman
(EQ 2)
The riskfree discount rate r and the dividend yield δ in Equation 2 are both
assumed to be constant. Also, the quantities which we will discuss throughout
this paper are usually evaluated at a specific times t or spot prices S, and contain
other explicit or implicit (deterministic or stochastic) parameters which we may
omit for brevity. For example, the quantities in Equations 1 and 2 are evaluated
at the present time and spot price, hence , etc.
Equations 1 often serves as a general definition for forward rates, regardless of
the specific nature of the interest rate process. It can be shown10 that under very
general assumptions, forward rates are risk-adjusted expectations of future short
rates
(EQ 3)
The expectation is performed at the present time and with respect to a
measure known as the T-maturity forward risk-adjusted measure. The precise
description of this measure is not necessary for our purposes here. The only
thing to remember is that Equation 1 gives us a direct way for extracting these
expectations of future short rates from the traded bond prices.
Similarly, it can be shown that local volatilities are risk-adjusted expectations of
future instantaneous volatilities. More precisely, local variance σ2
K,T is a risk-
adjusted expectation of future instantaneous variance σ2
(T) at time T as
(EQ 4)
Here the expectation is performed at the present time and market
level, and with respect to a new measure which we call the K-strike and T-matu-
rity forward risk-adjusted measure, as described in Appendix A. Again the pre-
cise details about the measure are unimportant at this point, only that these
expectations can be directly extracted from the market prices of standard
options, as given by Equation 2.
A static (non-random) local volatility surface defines an effective theory of vol-
atility in the same way as a static forward rate curve defines an effective theory
for interest rates. In an effective theory, specific expectations (or integrals) of
some or all of the underlying stochastic variables are extracted from the current
prices of the traded assets, and are subsequently assumed to remain unchanged
10. See, for example, Jamshidian [1993].
σ2
K T , 2
T ∂
∂CK T ,
r δ – ( )K
K ∂
∂CK T ,
δCK T , + +
 
 
 
K2
K2
2
∂
∂ CK T ,
----------------------------------------------------------------------------------- - =
fT fT t0 ( ) = σK T , σK T , t0 S0 , ( ) =
fT E
T ( )
r T ( ) [ ] =
E
T ( )
… [ ]
σK T ,
2
E
K T , ( )
σ2 T ( )] [ =
E
K T , ( )
… [ ]5
QUANTITATIVE STRATEGIES TECHNICAL NOTES
Goldman
Sachs
as time evolves. The effective dynamics which results is based on some of the
sources of uncertainty being “effectively” integrated out of the full stochastic
theory. Let us briefly review the interest rate case first.
In the effective interest rate setting, the forward rate curve is evaluated from the
available bond prices at time t0, and is assumed to remain unchanged thereafter
as time t evolves, thus for all :
(EQ 5)
As Figure 1 illustrates, this procedure integrates all sources of interest rate sto-
chasticity out of the original theory, and therefore, the effective dynamics of the
rates in the effective theory is completely deterministic. As physical time t
elapses, the spot rate (or short rate) r(t) rolls along the static forward rate curve,
coinciding with the forward rate at time t:
(EQ 6)
The dynamics of zero-coupon bond prices is also deterministic and is described
by a simple backward equation:
(EQ 7)
This equation, with the aid of Equation 6, shows that the asset price dynamics in
the effective theory is local and arbitrage-free. Equation 7 is also the dual of the
forward equation satisfied by the zero-coupon bond prices:
(EQ 8)
The Effective Interest Rate The-
ory
t t0 ≥
fT t ( ) fT =
r t ( ) ft =
d
dt
---- - ft –
 
 BT t ( ) 0 =
d
dT
------ fT +
 
 BT t ( ) 0 =6
QUANTITATIVE STRATEGIES TECHNICAL NOTES Sachs
Goldman
The forward equation is merely a restatement of Equation 1, and holds by the
definition of the forward rates regardless of specific assumptions concerning the
behavior of interest rates.
The backward equation describes propagation forward in physical time, for a
fixed maturity. More precisely, it relates the prices of a T-maturity bond at dif-
ferent time points t, with earlier times in terms of the later ones. This is best
understood by introducing the forward propagator (or forward Green’s func-
tion) pt,t', which relates bond prices at times t and t', with , for any T-matu-
rity bond, through a simple relationship:
(EQ 9)
The forward propagator pt,t' describes bond price evolution forward in physical
time, as illustrated by Figure 2(a). It satisfies the backward and forward differ-
ential equations with boundary conditions pt,t = 1:
; (EQ 10)
and for any , the composition relation:
(EQ 11)
Similarly, the forward equation describes propagation backward in maturity
time, for a fixed physical time. More precisely, it relates the prices of bonds
with different maturities T, but at a fixed time t, with longer maturity bonds in
terms of the shorter maturity ones. The backward propagator11
φT,T' relates
11. The forward and backward propagators for a static yield curve are both simply
equal to the discount function i.e .
FIGURE 1. In an effective theory defined by a static forward rate curve,
short rate follows the instantaneous forward rates.
0 t1
r(t1)
rate
t2
r(t2)
time
fT
t t' ≤
BT t ( ) pt t' ,
BT t' ( ) =
d
dt
---- - ft –
 
 pt t' ,
0 =
d
dt'
----- - ft'
+
 
 pt t' ,
0 =
t t ˜ t' ≤ ≤
p t t' , ( ) p t t̃ , ( )p t̃ t' , ( ) =
pu v , φu v , fτ τ d
u
v
∫ –
 
 
 
exp = =7
QUANTITATIVE STRATEGIES TECHNICAL NOTES
Goldman
Sachs
zero-coupon bond prices of maturities T and T', with , at any fixed time t,
using the relation
(EQ 12)
The backward propagator φT,T' describes bond price evolution backward in
maturity time, as depicted by Figure 2(b). It also satisfies the forward and back-
ward equations with boundary conditions φT,T = 1:
; (EQ 13)
and, for any , the composition relation
(EQ 14)
In the effective volatility setting, the local volatility surface is calculated using
the spectrum of available option prices (and futures) at time t0, and is assumed
to remain unchanged thereafter as time t and index price S change:
(EQ 15)
This procedure amounts to averaging out all sources of stochastic volatility,
leaving the index price uncertainty as the only source of uncertainty left within
the theory. The resulting effective dynamics only depends on the index price
and time and, as a function of these variables, is deterministic. As the physical
T' T ≤
BT t ( ) φT T' ,
BT'
t ( ) =
d
dT
------ fT +
 
 φT T' ,
0 =
d
dT'
------- fT'
–
 
 φT T' ,
0 =
T' T̃ T ≤ ≤
FIGURE 2. Forward propagator describes the evolution of bond prices
forward in physical time. Backward propagator describes evolution of
bond prices backward in maturity time.
BT(t) BT(t')
t t'
(T)
BT' (t) BT (t)
T' T
(t)
(a) forward propagator (b) backward propagator
φT,T' : pt,t' :
φT T' ,
φ
T T ˜ ,
φ
T ˜ T' ,
=
The Effective Volatility
Theory
σK T , t S , ( ) σK T , =8
QUANTITATIVE STRATEGIES TECHNICAL NOTES Sachs
Goldman
time t elapses and index price St moves, the instantaneous volatility σ(t) follows
along the local volatility surface, as depicted in Figure 3, coinciding with the
local volatility at time t and level St:
(EQ 16)
This is consistent with an equilibrium (effective) index price process described
by the stochastic differential equation:
(EQ 17)
where µt is the index’s expected return and dZt is the standard Wiener measure
at time t. In this process the instantaneous volatility is a known (deterministic)
function of time t and index price St. Implied Tree models are the discrete
frameworks for implementing the (effective) dynamics represented by Equation
17. The dynamics of standard option prices in the effective theory is described
by the backward equation:
(EQ 18)
Since the only remaining source of uncertainty is the index price, the standard
options are completely hedgeable (using index as the hedge) within the effective
theory. Equations 16 and 18 then show that the option price dynamics in this
theory is arbitrage-free. Equation 18 is also the dual of the forward equation sat-
isfied by the standard option prices:
FIGURE 3. In an effective theory represented by a static local volatility
surface, instantaneous volatility σ(t) at timet follows the local volatility at
time t and index price St.
t1
σ(t1)
t2
σ(t2)
time
level
l e v e l
time
vol
local
(t1,S1)
(t2,S2)
σ t ( ) σt St , =
dSt
St
------- µtdt σt St , dZt + =
t ∂
∂
r δ – ( )S
S ∂
∂ 1
2
-- -σ2
S t , S2
S2
2
∂
∂
r – + +
 
 
 
CK T , t S , ( ) 0 =9
QUANTITATIVE STRATEGIES TECHNICAL NOTES
Goldman
Sachs
(EQ 19)
This forward equation is the same as Equation 2 and holds by the definition of
local volatility, regardless of any specific assumptions about the behavior of
volatility.
The forward propagator pt,S,t',S' describes the relationship between the option
prices at the two points (t, S) and (t', S'), with , for any K-strike and T-matu-
rity standard option, through the relation
(EQ 20)
The forward propagator pt,S,t',S' describes option price evolution forward in time
and index price, as illustrated by Figure 4(a). We can define the forward transi-
tion probability density function p(t,S,t',S') in terms of the forward propagator as
p(t,S,t',S') = er(t'-t)
pt,S,t',S'. It describes the total probability that the index price will
reach level S' at time t', given that the index price at time t is S. The mathemati-
cal properties of pt,S,t',S' and p(t,S,t',S') are discussed in Appendix B.
T ∂
∂
r δ – ( )K
K ∂
∂ 1
2
-- -σ2K T , K2
K2
2
∂
∂
– δ + +
 
 
 
CK T , t S , ( ) 0 =
t t' ≤
CK T , t S , ( ) pt S t' S' , , , CK T , t' S' , ( ) S' d
0
∞
∫ =
FIGURE 4. Forward propagator describes the evolution of standard prices in
physical time and index price. Backward propagator describes the evolution
of option prices in maturity time and strike price.
CK,T
CK,T
CK,T
CK,T (t',S1')
(t',S2')
(t',Sn')
(t,S)
.........
(K,T)
(t, S) (t', S')
(t,S)
(K, T) (K',T')
CK,T
CK1',T'
CK2',T'
CKn',T'
.........
(t,S)
(t,S)
(t,S)
(t,S)
(a) forward propagator (b) backward propagator
pt,S,t',S': ΦK,T,K',T':10
QUANTITATIVE STRATEGIES TECHNICAL NOTES Sachs
Goldman
The backward propagator ΦK,T,K',T' describes the relationship between prices of
two standard options corresponding to strike-maturity pairs (K,T) and (K',T'), with
, at a fixed time t and index price S, as
(EQ 21)
As Figure 4(b) illustrates, We can also define the effective theory backward tran-
sition probability density function Φ(K,T,K',T') in terms of the backward propaga-
tor as Φ(K,T,K',T') = eδ(T-T')
ΦK,T,K',T' . Appendix B discusses some of the
mathematical properties of ΦK,T,K',T' and Φ(K,T,K',T').
We can use Equation 17, either by performing simulations or by using implied
tree methods, to price and hedge complex options, with the knowledge that the
standard options initially used to derive the local volatility surface will have
model prices which match their market values. In spite of this calibration, if the
volatility has a substantial stochastic behavior, the prices and hedge ratios of most
options with path-dependent or volatility-dependent payoffs will not be accurately
represented by the effective theory results. The reason is simply that effective the-
ory results are based on the assumption that local volatilities are static or, equiva-
lently, that the instantaneous volatility is substantially a function of the market
level (and time). This is a good assumption in situations where the volatility
exhibits strong correlation to the market level and, hence, can be viewed predomi-
nantly as a function of it. For most equity index option markets, for example, this
more or less holds, specially for shorter dated options. On the contrary, in the cur-
rency options markets or in longer dated equity (and most other) options markets,
the volatility is predominantly stochastic and the effective theory of static local
volatilities is not valid. We must therefore move towards a full stochastic frame-
work by allowing general multi-factor stochastic variations of the volatility sur-
face.
To allow for stochastic dynamics we must introduce exogenous stochastic struc-
ture on the effective theory. In general, there are few restrictions on the choice of
this structure. One important restriction, which is the cornerstone of the arbitrage
framework, is the absence of any explicit future arbitrage opportunities in the final
stochastic theory. Another restriction is how close the number or the behavior of
the stochastic factors are to what is empirically observed. For now, we will con-
sider very general (but sufficiently regular) stochastic structures and discuss the
conditions which must be imposed upon them to guarantee the absence of arbi-
trage. Let us briefly examine the stochastic interest rate theory first.
Figure 5 illustrates the dynamics of the forward rates in the stochastic framework.
Here, the forward rate curve is allowed to fluctuate stochastically with several
T' T ≤
CK T , t S , ( ) ΦK T K' T' , , ,
C
K' T' ,
t S , ( ) K' d
0
∞
∫ =
TOWARDS A STOCHASTIC
THEORY OF VOLATILITY
The Stochastic Interest
Rate Theory11
QUANTITATIVE STRATEGIES TECHNICAL NOTES
Goldman
Sachs
independent stochastic factors represented by Brownian motions Wi
, i = 1, ...,n,
with factor volatilities generally depending on both maturity T and time t,
according to the stochastic differential equation:
(EQ 22)
In the family of processes described by Equation 22, the volatility coefficients
reflect the sensitivities of specific maturity forward rates to the random
shocks introduced by the Brownian motions Wi
. These coefficients are left unre-
stricted, except for mild measurability and integrability conditions, and can
depend on the past histories of the Brownian motions Wi. The drift coefficients
must also satisfy mild measurability and integrability conditions, but must
be further constrained by the no-arbitrage requirement.
The spot rate at time t, r(t), is the instantaneous forward rate at time t, i.e,
. The stochastic integral equation satisfied by the spot rate is found
by integrating Equation 22 and evaluating the result at T = t. It is given by
(EQ 23)
It has been argued by Heath, Jarrow and Morton, that there will be no explicit
arbitrage opportunities in the theory defined by Equation 23 if (and only if) the
drift coefficients are of the form:
0 t1
r(t1)
rate
r(t0)
time
FIGURE 5. In a stochastic interest rate theory spot rate r(t) follows the
instantaneous forward rate ft(t).
fT(t0)
fT(t1)
ϑ
i
T t ( )
dfT t ( ) αT t ( )dt ϑT
i
t ( )dWt
i
i 1 =
n
∑ + =
ϑ
i
T t ( )
αT t ( )
r t ( ) ft t ( ) =
r t ( ) ft 0 ( ) αt u ( ) u d
0
t
∫ ϑi
t u ( ) Wi
u d
0
t
∫ i 1 =
n
∑ + + =12
QUANTITATIVE STRATEGIES TECHNICAL NOTES Sachs
Goldman
(EQ 24)
Here , i = 1, ..., n, denote the market prices of risk, which can not explicitly
depend on maturity T but are otherwise arbitrary. Under these conditions, they
have shown that markets are complete and contingent claims prices are indepen-
dent of the market prices of risk.
Our goal is to introduce a similar stochastic structure on the local volatility sur-
face. To do so, we allow the surface to undergo stochastic fluctuations with sev-
eral independent stochastic factors, W0, W1, ...,Wn, based on the following
stochastic differential equation:
(EQ 25)
We include W0
= Z, the index price’s source of uncertainty, among the factors
so that the stochastic variations of the local volatility surface may depend on the
prevailing market level. The family of processes of Equation 25 defines a multi-
factor dynamics for the local volatility surface, as illustrated by Figure 6. These
processes can be integrated, starting from a fixed (non-random) initial local vol-
atility surface σK,T(0,S0) at time t = 0, as
αT t ( ) ϑT
i
t ( ) ϑu
i
t ( ) u d
t
T
∫ λi t ( ) +
 
 
i 1 =
n
∑ =
λi t ( )
The Stochastic Volatility
Theory
dσ2
K T , t S , ( ) αK T , t S , ( )dt θi
K T , t S , ( )dWi
t
i 0 =
n
∑ + =
FIGURE 6. In a stochastic volatility theory instantaneous volatility σ(t)
follows the local volatility σSt,t (t,St), at time t and index price St.
0 t1 time
σ(t1) σ(t0)
level
l e v e l
time
local
vol
(t1,S1)
(t2,S2)13
QUANTITATIVE STRATEGIES TECHNICAL NOTES
Goldman
Sachs
(EQ 26)
The factor volatility reflects the sensitivity of local volatilities
σK,T(t,S), across the whole surface, to the shock introduced by the Brownian
motion Wi
. Except for mild measurability and integrability conditions12
, the
family of factor volatilities are unrestricted, generally depending on time and
index price, and on the factors or their past histories. However, for the sake of
brevity we have omitted explicit references to all variables other than time t and
index price S from the expressions for factor volatilities, and we will do the
same for other quantities such as drift coefficients and local volatilities.
The spot volatility (or instantaneous volatility) at time t, σ(t), is the instanta-
neous local volatility at time t and level St, i.e
(EQ 27)
It describes the variability of index price return process, as given by the differ-
ential equation
(EQ 28)
or its integral form
(EQ 29)
where µt is the index’s expected return. Setting T = t and K = St in Equation 26
we find the stochastic integral equation satisfied by the spot volatility as
(EQ 30)
The drift coefficients must also satisfy mild measurability and inte-
grability conditions, but they must be further restricted by the requirement that
the stochastic theory described by Equations 28 and 30 disallows explicit arbi-
trage opportunities among the standard options, forwards and their underlying
index. This is similar to the HJM arbitrage conditions on the spot rate process.
12. The factor volatility functions are assumed to be positive, adapted and jointly mea-
surable with respect to the Borel σ-algebra restricted to , for some fixed maximum
time T*. They must also satisfy , i = 0, ...,n, to assure regularity of spot vol-
atility process, and certain additional integrability conditions to assure regularity of the standard
option price processes.
σ2
K T , t St , ( ) σ2
K T , 0 S0 , ( ) αK T , u Su , ( ) u d
0
t
∫ θi
K T , u Su , ( ) Wi
u d
0
t
∫ i 0 =
n
∑ + + =
θi
K T , t S , ( )
θi
K T , t S , ( )
0 t T T∗ ≤ ≤ ≤
θi
K T , ( )2 u S
u
, ( ) u d
0
T
∫ ∞ <
σ t ( ) σSt t , t St , ( ) =
dSt
St
------- µtdt σ t ( )dWt
0 + =
St S0 µuSu u d
0
t
∫ σ u ( )Su Wu
0 d
0
t
∫ + + =
σ2 t ( ) σ2
t St , 0 S0 , ( ) αt St , u Su , ( ) u d
0
t
∫ θi
t St , u Su , ( ) Wi
u d
0
t
∫ i 0 =
n
∑ + + =
αK T , t S , ( )14
QUANTITATIVE STRATEGIES TECHNICAL NOTES Sachs
Goldman
Let us briefly examine (a variation of) the HJM argument below.
The bond price dynamics corresponding to the forward rate process of Equation
85 is, by applying Ito’s lemma, described by the stochastic integral equation
(EQ 31)
The symbol here denotes the variational (or functional) derivative with
respect to the function f evaluated at u. The first term in this equation describes
precisely the effective theory bond price dynamics restricted to the fixed for-
ward rate curve fT(t) at time t. The next two terms describe the bond price
dynamics resulting from the stochastic variations of the effective theory
(defined by fT(t)) during the next infinitesimal time interval dt.
It follows from the definition of the forward rates (Equation 1) that the price of
a T-maturity zero-coupon bond with unit face, at time t, is given by
(EQ 32)
From this expression it is simple to see that for any u ( ):
(EQ 33)
Another way of seeing this is by noticing how the forward and backward propa-
gators, pt,t' and φT,T', corresponding to an otherwise fixed (non-random) forward
rate curve, respond to sudden changes of a specific forward rate fu along the
curve. It is simple to see that pt,t' satisfies the following relation, as depicted in
Figure 7(a):
(EQ 34)
and, as shown in Figure 7(b), that φT,T' satisfies the relation:
(EQ 35)
These relations combined, respectively, with Equations 9 and 12, again lead to
Equation 33.
The HJM Conditions and the
Stochastic Theory of Interest
Rates
dBT t ( ) r t ( )BT t ( )dt
δBT t ( )
δfu t ( )
--------------- - fu t ( ) d u + d
t
T
∫ + =
1
2
-- -
δ2BT t ( )
δfu t ( )δfu'
t ( )
---------------------------- - fu t ( ) d fu'
t ( ) d u d u' d
t
T
∫ t
T
∫
δ
δf
u
------- -
BT t ( ) fu t ( ) u d
t
T
∫ –
 
  exp =
t u T ≤ ≤
δBT t ( )
δfu t ( )
--------------- - B – T t ( ) =
δp t t' , ( )
δfu
------------------ p – t u , ( )p u t' , ( ) p t t' , ( ) – = =
δφT T' ,
δfu
------------- - φ – T u , φu T' ,
φT T' ,
– = =15
QUANTITATIVE STRATEGIES TECHNICAL NOTES
Goldman
Sachs
Similarly, we can show that for the second order variational deriv-
atives are given by:
(EQ 36)
The special fu-independent form of variational relations 33-36 can be directly
attributed to the special form of the functional relationship between the zero-
coupon bond prices and the forward rates as described by Equation 32. This fea-
ture underlies the special simplicity of no-arbitrage conditions in the HJM
framework.
Using Equations 22, 33 and 36 inside Equation 31 we find
(EQ 37)
If the drift coefficients satisfy the no-arbitrage conditions of Equation 24
for some set of market prices of risk , then Equation 37 shows that in terms
of the equivalent measure , defined by the Brownian motions
, i = 1, ..., n, the dynamics of zero-coupon bond prices is:
FIGURE 7. Sensitivity of the forward and backward propagators pt,t' and
φT,T' to the sudden changes of the forward rate fu.
(a) forward propagator (b) backward propagator
t t'
u
-1
t t' u u+du T' T u u+du
T' T
u
-1
t u u' T ≤ ≤ ≤
δ2BT t ( )
δfu t ( )δfu'
t ( )
---------------------------- - BT t ( ) =
dBT t ( )
BT t ( )
--------------- - r t ( )dt ϑu
i
t ( ) u d
t
T
∫  
 
i 0 =
n
∑ dWt
i
– – =
αu t ( ) ϑu
i
t ( ) ϑv
i
t ( ) v d
t
u
∫ i 1 =
n
∑ – u d
t
T
∫  
 
 
dt
αT t ( )
λi t ( )
dW
i
dWi λidt + =
Wi
t Wi
t λi u ( ) u d
0
t
∫ + =16
QUANTITATIVE STRATEGIES TECHNICAL NOTES Sachs
Goldman
(EQ 38)
Therefore, {dWi ; i = 1,...,n} defines an equivalent martingale measure under
which the rescaled bond prices for all maturities T are
jointly martingale. Under this measure the interest rate contingent claims prices
are independent of the market prices of risk and, hence, remain preference-free.
The standard option prices CK,T(t,S) are functionals of the local volatilities at
time t and market level S, just as bond prices BT(t) are functionals of the forward
rates at time t. As a result, the dynamical variations of the local volatility surface
induce correpsonding dynamical variations of the standard option prices. Dur-
ing a time interval dt, the index price moves and the local volatilities also
change. We can think of the local volatility changes as comprised of two com-
ponents. A predictable component, due to movements of time and index price
restricted to the static local volatility surface σK,T(t,S) at time t and level S, and
a non-predictable (stochastic) component due to dynamic fluctuations away
from this surface. It is somewhat simpler, but entirely equivalent, to work with
the transition probabilities, instead of option prices. The transition probability,
PK,T(t,S), describes the total probability that the index price will reach level K at
time T, given that the index price at time t is S, when both the index price and
volatility are stochastic. It is related to the option prices CK,T(t,S) through a gen-
eral and well-known13
formula:
(EQ 39)
The dynamical evolution of transition probabilities PK,T(t,S) based on the local
volatility process of Equation 26 is given by the stochastic integral equation:
(EQ 40)
13. See Breeden and Litzenberger [1978].
dBT t ( )
BT t ( )
--------------- - r t ( )dt ϑu
i
t ( ) u d
t
T
∫  
 
i 1 =
n
∑ dWt
i
– =
BT t ( ) r u ( ) u d
0
t
∫ –
 
 
 
exp
THE NO-ARBITRAGE CONDITIONS
AND THE STOCHASTIC THEORY
OF VOLATILITY
PK T , t S , ( ) er T t – ( )
K2
2
∂
∂
CK T , t S , ( ) =
dPK T , t ∂
∂PK T ,
µ t ( )S
S ∂
∂PK T , 1
2
-- -σ2 t ( )S2
S2
2
∂
∂ PK T ,
+ +
 
 
 
dt σ t ( )S
S ∂
∂PK T ,
dW0 t ( ) +
t S , ( )
= +
δPK T ,
δσ2
K' T' ,
----------------- - σ2
K' T' , d K' d T' d
0
∞
∫ t
T
∫ +
1
2
-- -
δ
2
PK T ,
δσ2
K' T' , δσ2
K'' T'' ,
------------------------------------- - σ2
K' T' , d σ2
K'' T'' , d K' d K'' d T' T'' d d
0
∞
∫ 0
∞
∫ t
T
∫ t
T
∫17
QUANTITATIVE STRATEGIES TECHNICAL NOTES
Goldman
Sachs
All the probability and local volatility expressions in this equation are evaluated
at (t,S). The first term describes the effective dynamics of the transition proba-
bilities PK,T(t,S) restricted to the fixed local volatility surface σK,T(t,S), prevail-
ing at time t and level S. The bracket symbol, , therefore, expresses the
fact that in this term the future volatility is a deterministic function of the future
time T and market level K, given by σK,T(t,S) viewed as function of these two
variables. The next two terms describe the dynamical variations of the transition
probabilities resulting from the stochastic fluctuations of the local volatility sur-
face during the next instant of time dt.
Contrary to Equation 32, in general there are no explicit expressions describing
the functional relationship between option prices and local volatilities. There-
fore, we can not directly compute the variational derivatives in Equation 40.
Instead, we can look at the variations of the forward and backward transition
probabilities with respect to the specific local volatilities. As shown in Appen-
dix C and illustrated in Figure 8, the forward transition probability p(t,S,t',S'),
associated with the non-random local volatility surface σK,T(t,S) prevailing at
time t and spot price S, has the following variational derivative with respect to
the local volatility σv,u(t,S) on the surface, corresponding to future maturity u
and market level v:
(EQ 41)
This relation holds for any u in the range , otherwise the variational
derivative is equal to zero. Similarly, the backward transition probability
Φ(K,T,K',T') satisfies, for , the relation
(EQ 42)
and zero otherwise. Using Equations 21 and 39, the standard option prices
CK,T(t,S) and transition probabilities PK,T(t,S) satisfy similar relationships for
:
(EQ 43)
and
(EQ 44)
… [ ] t S , ( )
δp t S t' S' , , , ( )
δσ2
v u ,
------------------------------- -
1
2
-- -p t S u v , , , ( )v2
v2
2
∂
∂
p u v t' S' , , , ( ) =
t u t' ≤ ≤
T' u T ≤ ≤
δΦ K T K' T' , , , ( )
δσ2
v u ,
--------------------------------------
1
2
-- -Φ K T v u , , , ( )v2
v
2
2
∂
∂
Φ v u K' T' , , , ( ) =
t u T ≤ ≤
δCK T , t S , ( )
δσ2
v u ,
---------------------------
1
2
-- -Φ K T v u , , , ( )v
2
v
2
2
∂
∂
Cv u , t S , ( ) =
δPK T , t S , ( )
δσ2
v u ,
-------------------------- -
1
2
-- -p t S u v , , , ( )v
2
v
2
2
∂
∂
p u v T K , , , ( ) =18
QUANTITATIVE STRATEGIES TECHNICAL NOTES Sachs
Goldman
in which the effective transition probabilities and correspond to
the static local volatility surface σK,T(t,S) prevailing at time t and market level
S. In arriving at Equations 43 and 44 we have also used the following identities:
(EQ 45)
(EQ 46)
(EQ 47)
FIGURE 8. Sensitivity of the forward and backward transition probabilities
p(t,S,t',S') and Φ(K,T,K',T') to the sudden changes of the local volatility
σv,u.
u v , ( ) t' S' , ( ) t S , ( )
t S , ( )
t' S' , ( )
t S , ( ) t' S' , ( )
u v , ( )
v2
v2
2
∂
∂
–
K T , ( )
K' T' , ( )
K T , ( ) K' T' , ( )
v u , ( )
v2
v2
2
∂
∂
–
K' T' , ( ) K T , ( ) v u , ( )
(a) forward (b) backward
p … ( ) Φ … ( )
PK T , t S , ( ) p t S T K , , , ( ) =
p t S T K , , , ( ) e
r T t – ( )
K
2
2
∂
∂ CK T , t S , ( ) =
Φ K T S t , , , ( ) e
δ T t – ( )
S2
2
∂
∂
CK T , t S , ( ) =19
QUANTITATIVE STRATEGIES TECHNICAL NOTES
Goldman
Sachs
As discussed in Appendix B, these identities are all consequences of the fact
that the effective theory associated with σK,T(t,S) embodies all the information
necessary for pricing standard options of all strikes and maturities correctly.
Taking the variational derivatives of both sides of Equations 41 and 42 with
respect to the local volatility σv',u' we find the second order variational deriva-
tives as
(EQ 48)
for any , and
(EQ 49)
for . Figure 9 gives a graphical depiction of these identities. The
standard option prices CK,T(t,S) and transition probabilities PK,T(t,S) satisfy
similar relationships for :
(EQ 50)
(EQ 51)
Using these relations, Appendix D proves that Equation 40 leads to
δp t S t' S' , , , ( )
δσ2
v u , δσ2
v' u' ,
-------------------------------- - 1
4
-- -p t S u v , , , ( )v
2
v
2
2
∂
∂ p u v u' v' , , , ( )v'
2
v'
2
2
∂
∂ p u' v' t' S' , , , ( ) =
t u u' t' ≤ ≤ ≤
δΦ K T K' T' , , , ( )
δσ2
v u , δσ2
v' u' ,
--------------------------------------
1
4
-- -Φ K T v u , , , ( )v
2
v
2
2
∂
∂
Φ v u v' u' , , , ( )v'
2
v'
2
2
∂
∂
Φ v' u' K' T' , , , ( ) =
T' u' u T ≤ ≤ ≤
FIGURE 9. Second order variational derivatives of the forward and
backward transition probabilities p(t,S,t',S') and Φ(K,T,K',T') with
respect to the local volatilities.
K' T' , ( )
v' u' , ( )
v'2
v'2
2
∂
∂
–
v u , ( )
v2
v2
2
∂
∂
–
K T , ( ) t S , ( )
u v , ( )
v2
v2
2
∂
∂
–
u' v' , ( )
v'2
v'2
2
∂
∂
–
t' S' , ( )
(a) forward (b) backward
t u u' T ≤ ≤ ≤
δCK T , t S , ( )
δσ2
v u , δσ2
v' u' ,
-------------------------------- -
1
4
-- -p t S u v , , , ( )v
2
v
2
2
∂
∂
p u v u' v' , , , ( )v'
2
v'
2
2
∂
∂
Cv' u' ,
t S , ( ) =
δPK T , t S , ( )
δσ2
v u , δσ2
v' u' ,
-------------------------------- -
1
4
-- -p t S u v , , , ( )v
2
v
2
2
∂
∂
p u v u' v' , , , ( )v'
2
v'
2
2
∂
∂
p u' v' T K , , , ( ) =20
QUANTITATIVE STRATEGIES TECHNICAL NOTES Sachs
Goldman
(EQ 52)
if and only if, for any S, K and , the drift functions αK,T(t,S) satisfy the fol-
lowing no-arbitrage conditions
(EQ 53)
where and for i = 1, ...,n are arbitrary but independent of K and T,
and where the equivalent measure { } is defined by
; (EQ 54)
The quantities denote the market prices of risk associated with the volatility
risk factors Wi, i = 1, ..., n, while µ - (r-δ) is the market price of risk associated
with the index price risk factor W0
. Equation 52 shows that under the no-arbi-
trage conditions the measure { ; i = 1, ...,n} is an equivalent martingale
measure, with respect to which the rescaled index price and rescaled option
prices for all strikes and maturities are simultaneously martingales.
These no-arbitrage conditions in the present case are significantly more
involved than the HJM no-arbitrage conditions described in the previous sec-
tion. The basic reason is that local volatilities span a (two-dimensional) surface
on which (forward and backward) propagation depends, in a rather complicated
and non-linear manner, on the structure of local volatilities across the whole sur-
face. This is evident by the apparent complexity of Equations 44 and 51 as com-
pared to the simplicity of the corresponding Equations 33 and 36 in the interest
rate framework. It is, therefore, rather difficult to use the no-arbitrage conditions
for stochastic volatility in their continuous form directly.
In the next section we introduce Stochastic Implied Trees as a discrete-time
framework for describing arbitrage-free stochastic variations of the local vola-
tility surface.
Figure 11 gives a schematic illustration of the dynamics in a stochastic volatility
theory. As the physical time moves forward, the index price changes and, simul-
taneously, all local volatilities on the volatility surface undergo multi-factor sto-
chastic variations.
To provide a more quantitative description of this stochastic dynamics we
choose to work within a discrete-time framework described by a Stochastic
dPK T , σ t ( )S
S ∂
∂PK T ,
dW0
δPK T ,
δσ2
K' T' ,
----------------------σ2
K' T' , θ
K' T' ,
i
K' d T' d W
i
d
0
∞
∫ t
T
∫
i 0 =
n
∑ + =
t T ≤
α
K T ,
t S , ( ) θ
i
K T , t S , ( )
1
p t S T K , , , ( )
---------------------------- - θ
i
K' T' , t S , ( )p t S T' K' , , , ( )K'2
K'2
2
∂
∂
p T' K , ' T K , , ( ) K' d T' d
0
∞
∫ t
T
∫ Π
i
–
 
 
 
 
 
i 0 =
n
∑ – =
Π
0
0 = Π
i
W
i
dW
0
dW
0 µ t ( ) r – δ + ( )
σ t ( )
--------------------------------dt + = dW
i
dW
i
Π
i
dt + =
Π
i
dW
i
StOCHASTIC IMPLIED TREES21
QUANTITATIVE STRATEGIES TECHNICAL NOTES
Goldman
Sachs
Implied Tree. These trees are extensions of the standard (non-stochastic)
implied trees, which are used to describe effective volatility models (see Der-
man, Kani and Chriss [1996]). Figure 12 shows an example of a 1-year, 5-
period standard implied trinomial tree which is calibrated to a market where at-
the-money implied volatility is 25% and there is an implied volatility skew of
0.5% point per 10 strike points. In an implied trinomial tree the location of the
nodes, or the state space, is more or less arbitrarily. Once the state space is
fixed, however, the transition probabilities at different nodes are determined
from the requirement that standard options and forwards with strike prices coin-
ciding with those nodes and maturing at different periods of the tree all have
prices using the tree which match their market prices. Since local volatility at
any node depends on the nodal levels and the transition probabilities to the
nearby nodes, the local volatilities at different nodes are also determined in this
way.
Stochastic implied trinomial trees are extensions of the implied trinomial tree in
which the transition probabilities are, in addition, allowed to vary stochastically,
with several stochastic factors, as time elapses and index level moves. The
index level is allowed to move randomly from node to node, while the local vol-
atilities, and simultaneously the transition probabilities corresponding to the
future nodes, all vary stochastically across the tree. This behavior is shown in
Figure 13.
Starting from any initial node, the possible future movements of the local vola-
tility surface must be restricted to guarantee absence of any arbitrage opportuni-
ties in the discrete theory represented by the stochastic implied tree. As
discussed earlier, this is equivalent to the requirement that the total transition
probabilties to all future nodes be simultaneously martingales on the tree. This
FIGURE 11. Schematic illustration of the dynamics of the index price and
local volatility surface in a stochastic volatility theory.
time22
QUANTITATIVE STRATEGIES TECHNICAL NOTES Sachs
Goldman
is also the same as the requirement that all rescaled standard option prices be
simultaneously martingales on the tree. As Figure 14 shows, during the time
interval ∆t, the spot price will move randomly (by amount ∆S) to one of the
nearby nodes and, at the same time, the local volatility surface will assume one
of its N possible configurations, w1
, ...,wN
. As a result, the total transition prob-
ability PK,T(t,S) to any given future node (K,T) also moves to one of its several
possible values P(i)
K,T(t+∆t, S+∆S), i = 1, ..., M, during this time interval. To
guarantee no-arbitrage, PK,T must be a martingale (fair game), that is it must
equal the expectation , under some (equivalent) measure, of its future values
FIGURE 12. Example of an Implied Trinomial Tree describing an effective
volatility theory.
100.00
83.80
119.34 119.34 119.34 119.34
100.00 100.00 100.00 100.00
142.41 142.41 142.41
70.22 70.22 70.22
169.95 169.95
58.84 58.84
49.31
202.81
83.80 83.80 83.80
state space:
0.249
0.240 0.236 0.235
0.249 0.247 0.247
0.224 0.221
0.313 0.298
0.188
0.327
0.264 0.269 0.272
local volatilities:
0.259
0.241 0.236 0.233
0.259 0.255 0.255
0.214 0.209
0.392 0.358
0.160
0.425
0.287 0.296 0.304
0.241
0.220 0.213 0.209
0.241 0.236 0.236
0.188 0.181
0.400 0.359
0.123
0.438
0.274 0.285 0.294
probabilities: probabilities:
forward diffusion down forward diffusion up
0.000
1.000 0.285 0.278
0.000 0.306 0.301
1.000 0.253
0.000 0.000
1.000
0.000
0.350 0.000 0.000
0.189
0.246
0.275
0.301
0.339
0.423
0.000
0.000
1.000
0.000
0.000 0.000 0.176
0.000 0.200 0.195
0.000 0.000
1.000 0.331
0.000
1.000
0.236 0.244 1.000
0.000
0.150
0.174
0.195
0.227
0.298
0.363
1.000
0.000 probabilities: probabilities:
backward diffusion up backward diffusion down23
QUANTITATIVE STRATEGIES TECHNICAL NOTES
Goldman
Sachs
P(i)
K,T for all the future nodes (K,T) on the tree.
To make positivity manifest, it is more convenient to redefine the drift and vola-
tility functions in Equation 25 as and , l = 0,
FIGURE 13. In a Stochastic Implied Tree, as the index moves from node A to
node B in a single time step, the local volatilities and transition
probabilities, for every node on the future subtree beginning at node B,
vary stochastically with multiple stochastic factors.
A
B
t t +∆t
PK,T
P(1)
K,T
P(M)
K,T
FIGURE 14. During a time step ∆t, the total transition probability PK,T will
move to one of M values P(i)
K,T , i = 1, ...,M, as index price moves
randomly to one of the nearby nodes and the local volatility surface
assumes one of N possible configurations.
t t +∆t
w
w1
wN
Our Notation in Discrete Time
αK T , αK T , σK T ,
2
→ θ
l
K T , θ
l
K T , σK T ,
2
→24
QUANTITATIVE STRATEGIES TECHNICAL NOTES Sachs
Goldman
..., n, and begin by discretizing the following continuous-time differential equa-
tion:
(EQ 55)
We let the integer pair (i,j) label the node (ti,Sj) describing the current location
(i.e (t,S)) of the index at the ith
step of the simulation. We also let the pair (n,m)
label the future node (tn,Sm) corresponding the future time and level (i.e (T,K)).
Then the discrete form of Equation 55 can be written as
(EQ 56)
The vector (∆Wi
0
, ∆Wi
1
, ..., ∆Wi
n
) is random and is drawn, at time i, from the
sample space of the increments of n independent Brownian motions Wl.
The volatility parameters are pre-specified but the drift parameters
must be determined from the no-arbitrage requirements that the total
probabilities of arriving at the future node (n,m) from the (fixed) ini-
tial node (i,j) must be jointly martingales for all future nodes (n,m). As we shall
argue below, these martingale conditions are precisely enough to completely
determine all the drift parameters step by step during the simulation process.
A Stochastic Implied Tree simulation begins with the construction of a trino-
mial implied tree calibrated to today’s prices of standard options and forwards.
The simulation begins at the node (0,0) of this tree. During the first simulation
step the drift parameters , for all future nodes (m,n), are determined
from the martingale conditions on the total probabilities . Figure 15
illustrates that the drift parameter is determined from the martingale
condition for This also guarantees that the transition probabilities
and are martingales. The reason is that these probabilities
are constrained by two extra conditions which must hold irrespective of the spe-
cific behavior of the local volatilities:
(EQ 57)
The first condition is the normalization condition, requiring that the sum of the
three total transition probabilities at time t1 must be unity. The second is the for-
ward condition, requiring that the t1-maturity forward price at time t0 must
match its risk-neutral value.
dσ2
K T , t S , ( )
σ2
K T , t S , ( )
----------------------------- - αK T , t S , ( )dt θl
K T , t S , ( )dWt
l
l 0 =
n
∑ + =
∆σ
2
m n , i j , ( ) σ
2
m n , i j , ( ) αm n , i j , ( )∆ti θm n ,
l
i j , ( )∆Wi
l
l 0 =
n
∑ + =
θm n ,
l
i j , ( )
αm n , i j , ( )
Pm n , i j , ( )
αm n , 0 0 , ( )
Pm n , 0 0 , ( )
α0 0 , 0 0 , ( )
P1 2 , 0 0 , ( )
P1 1 , 0 0 , ( ) P1 0 , 0 0 , ( )
P1 0 , 0 0 , ( ) P1 1 , 0 0 , ( ) P1 2 , 0 0 , ( ) + + 1 =
P1 0 , 0 0 , ( )S1 0 , P1 1 , 0 0 , ( )S1 1 , P1 2 , 0 0 , ( )S1 2 , + + S0 0 , e
r δ – ( ) t1 t0 – ( )
=25
QUANTITATIVE STRATEGIES TECHNICAL NOTES
Goldman
Sachs
In a similar way, the three drift parameters , and
are determined from the martingale conditions of the three total transition prob-
abilities , and . The remaining transition probabil-
ities and will then also be martingales due to the
normalization and forward conditions at time t2. In this way all drift parameters
will be determined during the first simulation step. Finally, to com-
plete this step we draw a random vector (∆W0
0, ∆W0
1, ..., ∆W0
n) from the sam-
ple space of the increments of Wi
at time t0, and use this vector to
simultaneously arrive at a (random) new location for the index price and new
values for all future local volatilities. Equation 56 is used directly with i = j = 0
to calculate the new local volatility values from this choice of the random vec-
tor. As for the index price, we use the random number ∆W0
0
to determine which
of the three possible future nodes (i.e (1,2), (1,1) or (1,0)) does the index price
moves to during time interval ∆t. Figure 16 gives one simple possible method
for doing this starting from an arbitrary initial node (i,j). First ∆Wi
0
is renormal-
ized to represent a uniformly-distributed random number between 0 and 1. Let
Pu(i,j), Pm(i,j) and Pd(i,j) denote the one period transition probabilities, prevail-
ing at time ti and index price Sj, from the node (i,j) to the up, middle and down
nodes at time ti+1. We then compare our random number with these three prob-
abilities. If it is smaller than Pd(i,j), we move the index price to the down node.
On the other hand, if the random number is greater than the sum Pu(i,j) +
Pm(i,j), we allow the index price to move to the up node. In every other case we
move the index price to the middle node at the next time period.
FIGURE 15. The drift parameter α0,0(0,0) in a Stochastic Implied Tree is
determined from the martingale condition on the total transition
probability P1,2(0,0).
(0,0)
(1,2)
(0,0)
(1,2)
(0,0)
(1,2)
a0,0(0,0)
P1,2 (0,0) is martingale
α1 2 , 0 0 , ( ) α1 1 , 0 0 , ( ) α1 0 , 0 0 , ( )
P2 4 , 0 0 , ( ) P2 3 , 0 0 , ( ) P2 2 , 0 0 , ( )
P2 1 , 0 0 , ( ) P2 0 , 0 0 , ( )
αm n , 0 0 , ( )26
QUANTITATIVE STRATEGIES TECHNICAL NOTES Sachs
Goldman
We can continue this procedure, step-by-step, for any point (i,j) along a simu-
lated path through the stochastic implied tree. First, all the drift parameters
are determined from the martingale conditions on . Appen-
dix E gives the necessary details for doing this calculation. Subsequently, these
drift parameters are used to generate arbitrage-free (random) movements of the
future local volatility surface as the index price moves randomly forward across
the tree. We can generate many such sample paths through the tree. Along each
path, the movements of the index price and the local volatility surface are ran-
dom realizations of an arbitrage-free dynamics, which step-by-step guarantees
absence of arbitrage opportunities among different standard option (and for-
ward) contracts and their underlying index within the discrete time framework
of the stochastic implied tree.
Consider a one-factor stochastic volatility model with a lognormal volatility of
volatility structure, as described by the following pair of stochastic differential
equations:
where . For the purpose of this example we take the volatility
coefficient to be constant, so that the factor W1
has the interpretation of a
simultaneous constant (proportional) shift in all local volatilities. All the other
quantities can depend on t, S, factors W0
and W1
or their past values. More spe-
cifically, we consider a 1-year, 5-period example with the initial term and strike
structure of volatility given by an at-the-money implied volatility of 20% and a
constant skewness of 0.5% per 10 strike points. For instance, initially a 80 strike
option of any maturity has implied volatility of 21%. Let the riskfree discount
rate be equal to 10%, dividend yield 5% and the volatility (of volatility) param-
FIGURE 16. Determining which node the index price will go to during one
simulation step using the renormalized random number ∆Wi
0
.
(i, j)
(i+1, j+2) if ∆Wi
0
>= Pm + Pd
(i+1, j+1) if ∆Wi
0
>= Pd and ∆Wi
0
< Pm + Pd
(i+1, j) if ∆Wi
0 < Pd
Pu = Pu
(i,j)
Pd = Pd
(i,j)
Pm = Pm
(i,j)
αm n , i j , ( ) Pm n , i j , ( )
A SIMPLE EXAMPLE
dS
S
----- - µdt σdW
0
+ =
dσ
2
K T ,
σ
2
K T ,
---------------- - αK T , dt θdW
1
+ =
σ t ( ) σt St , t St , ( ) =
θ27
QUANTITATIVE STRATEGIES TECHNICAL NOTES
Goldman
Sachs
eter = 30%. We choose the state space of the stochastic implied trinomial tree
to be the same as a standard (CRR- type) trinomial tree with constant volatility
of 20%. Figure 17 shows this state space. It also shows the local volatilities and
total transition probabilities, corresponding to various nodes of this tree, at the
initial time t = 0. As we expect, local volatilities increase as the index level
decreases roughly twice as fast as implied volatilities. Also the probability dis-
tribution is skewed (around the forward price) towards the lower index levels.
The first step toward the construction of the stochastic implied tree is to deter-
mine the drift coefficients at time t0 = 0. Appendix E gives the for-
mulas for directly calculating these coefficients, which are shown in Figure 18.
θ
FIGURE 17. The state space of a Stochastic Implied Trinomial Tree, the
local volatility surface and the total transition probability distribution on
the tree at the initial time t = 0.
100.00
86.81
115.19 115.19 115.19 115.19
100.00 100.00 100.00 100.00
132.69 132.69 132.69
75.36 75.36 75.36
152.85 152.85
65.43 65.43
56.80
176.06
86.81 86.81 86.81
state space:
0.199
0.191 0.189 0.188
0.199 0.197 0.197
0.180 0.177
0.251 0.240
0.155
0.263
0.211 0.215 0.218 .
local vols σm,n(0,0):
1.000
0.182
0.275 0.281 0.267 0.251
0.493 0.376 0.311 0.271
0.071 0.112 0.135
0.066 0.070 0.083
0.016 0.037
0.026 0.028
0.011
0.003
0.197 0.206 0.232
total probs Pm,n(0,0):
αm n , 0 0 , ( )28
QUANTITATIVE STRATEGIES TECHNICAL NOTES Sachs
Goldman
We can justify the numbers by examining what can happen to the total transition
probabilities during the next time interval ∆t. All local volatilities will simulta-
neously move, with probability of 1/2, to their up values, , or their
down values, , as given by
FIGURE 18. The first step of the Stochastic Implied Tree construction
consists of determining all the drift coefficients αm,n(0,0), at time t0 = 0,
from the martingale conditions for the total probabilities Pm,n(0,0).
1.000
0.182
0.275 0.281 0.267 0.251
0.493 0.376 0.311 0.271
0.071 0.112 0.135
0.066 0.070 0.083
0.016 0.037
0.026 0.028
0.011
0.003
0.197 0.206 0.232
total probs Pm,n(0,0):
-0.044
-0.184 -0.037 0.009
0.139 0.072 0.063
-0.298 -0.194
-0.369 -0.195
-0.381
-0.452
-0.043 -0.051 -0.232
drifts αm,n(0,0):
choose a random vector (∆W0, ∆W1) -> (up, up)
0.199
0.191 0.189 0.188
0.199 0.197 0.197
0.180 0.177
0.251 0.240
0.155
0.263
0.211 0.215 0.218 .
local vols σm,n(0,0):
step 1
σ
u ( )
m n , 0 0 , ( )
σ
d ( )
m n , 0 0 , ( )
σ
u d , ( )
m n , 0 0 , ( ) σm n , 0 0 , ( ) αm n , 0 0 , ( )
1
2
-- -θ
2
–
 
 ∆t θ ∆t ±
 
 
 
exp =29
QUANTITATIVE STRATEGIES TECHNICAL NOTES
Goldman
Sachs
with given in Figure 18. As a result, all transition probabilities also
change across the tree, simultaneously moving to their up values, ,
or to their down values, , each with probability of 1/2. Figure 19
shows that with the present choice of drift coefficients the initial total probabili-
ties are precisely equal to the average value of their up and down values. To
complete the step 1 we draw a pair of independent random numbers between 0
and 1, say (0.853, 0.612). Since 0.853 is greater than the sum of prevailing
down and middle probabilities, 0.493+0.232 = 0.725, as discussed in Figure 16
we move the index to the node (1,2). Also, since 0.612 is greater than 1/2 we
1.000
0.175
0.343 0.278 0.243 0.220
0.346 0.303 0.256 0.226
0.103 0.142 0.154
0.107 0.089 0.102
0.027 0.055
0.046 0.042
0.021
0.005
0.197 0.209 0.311
up total probs P(u)
m,n(0,0):
1.000
0.190
0.206 0.284 0.291 0.282
0.640 0.448 0.367 0.315
0.038 0.082 0.116
0.026 0.051 0.063
0.006 0.018
0.006 0.014
0.001
0.001
0.198 0.203 0.154
down total probs P(d)
m,n(0,0):
1.000
0.182
0.275 0.281 0.267 0.251
0.493 0.376 0.311 0.271
0.071 0.112 0.135
0.066 0.070 0.083
0.016 0.037
0.026 0.028
0.011
0.003
0.197 0.206 0.232
average total probs (P(u)
m,n(0,0)+P(d)
m,n(0,0))/2:
FIGURE 19. Up- and down- values of local volatilities and total transition
probabilities corresponding the first simulation step.
0.226
0.210 0.215 0.216
0.237 0.231 0.230
0.192 0.194
0.264 0.262
0.161
0.270
0.240 0.244 0.236 .
up local vols σ(u)
m,n(0,0):
0.168
0.156 0.159 0.160
0.175 0.171 0.170
0.142 0.144
0.195 0.194
0.120
0.200
0.178 0.181 0.175 .
down local vols σ(d)
m,n(0,0):
αm n , 0 0 , ( )
P
u ( )
m n , 0 0 , ( )
P
d ( )
m n , 0 0 , ( )30
QUANTITATIVE STRATEGIES TECHNICAL NOTES Sachs
Goldman
move all local volatilities to their up values, before we begin the next simulation
step. The step 2 of the simulation is precisely the same as step 1, except con-
fined to the subtree that begins at the node (1,2). As shown in Figure 20, again
the martingale conditions on the total probabilities are used to solve
for the drift coefficients at time t1 = 0.25, and then these coefficients,
together with a pair of random numbers, are used to determine jointly the new
values for the index price and the future local volatilities. Steps 3 and 4 are also
FIGURE 20. During the step 2 of the simulation, the drift coefficients
αm,n(1,2), at time t1 = 0.25, are determined from the martingale
conditions for the total probabilities Pm,n(1,2).
0.210 0.215 0.216
0.231 0.230
0.192 0.194
0.161
0.240
local vols σm,n(1,2):
0.089
1.000 0.436 0.336 0.273
0.363 0.205 0.193
0.301 0.296 0.271
0.030
0.077 0.129
0.015
0.085
total probs Pm,n(1,2):
-0.044 0.189 0.051
-0.229 0.016
-0.186 -0.017
-0.299
-0.365
drifts αm,n(1,2):
choose a random vector (∆W0, ∆W1) -> (middle, down)
step 2
Pm n , 1 2 , ( )
αm n , 1 2 , ( )31
QUANTITATIVE STRATEGIES TECHNICAL NOTES
Goldman
Sachs
quite similar and their results have been shown in Figures 21 and 22, repsec-
tively.
In this example, we chose a simple two-state (up and down) representation for
the stochastic movements of the local volatility surface during the time step .
FIGURE 21. During the step 3 of the simulation, the drift coefficients
αm,n(2,3), at time t2 = 0.50, are determined from the martingale
conditions for the total probabilities Pm,n(2,3).
0.192 0.186
0.197
0.164 local vols σm,n(2,3):
0.048
1.000 0.529 0.389
0.213 0.213
0.258 0.298
0.051
0.001
total probs Pm,n(2,3):
-0.044 0.113
-0.235
-0.182 drifts αm,n(2,3):
choose a random vector (∆W0
, ∆W1
) -> (up, up)
step 3
∆t32
QUANTITATIVE STRATEGIES TECHNICAL NOTES Sachs
Goldman
We could instead choose any equivalent representation of the same process with
m states, for any integer m > 1. There are infinite number of equivalent repre-
sentations for any choice of m. If the model is well-behaved, these discrete rep-
resentations should all converge to the same continuous-time process as goes
to zero. However, a representation with large number of states may converge
substantially faster than the two-state representation we chose here. Table 1
FIGURE 22. During the step 4 of the simulation, the drift coefficients
αm,n(3,5), at time t3 = 0.75, are determined from the martingale
conditions for the total probabilities Pm,n(3,5).
0.180 local vols σm,n(3,5):
0.183
1.000 0.584
0.232
total probs Pm,n(3,5):
-0.044 drifts αm,n(3,5):
choose a random vector (∆W0
, ∆W1
) -> (down, - )
step 4
∆t33
QUANTITATIVE STRATEGIES TECHNICAL NOTES
Goldman
Sachs
shows the calibration results for a 50000 path simulation on the 5-period tree
described above.
TABLE 1. Calibration results of a 50000-path simulation on a 1-year, 5-
period Stochastic Implied Tree.
The fourth and fifth columns give, respectively, the standard (non-stochastic)
implied trinomial tree and the Stochastic Implied Tree results for a series of
standard European-style call and put options used to calibrate the trees. The
results are seen to agree well.
CAVIAT: Since the location of the nodes (i.e the state space) of the stochastic
implied trinomial tree is fixed throughout, it may not be possible to fit very
large local volatilities, which may occur at various nodes and at different times
during the simulation, with transition probabilities which lie between 0 and 1. In
such cases, we must overwrite the unacceptable transition probabilities (or,
equivalently, the local volatilities) at those nodes14. Even though, this overwrite
procedure makes for an imperfect calibration to the initial smile (and, theoreti-
cally, a violation of arbitrage), it must be diligently adhered to, in order to keep
the simulation process meaningful. We can define overwrite ratio as the number
of overwrites per future node, per simulation path. In the previous example, the
overwrite ratio for 5 periods and 50000 paths is found to be 2.7%, indicating
Strike Price
Option
Type
Black-Scholes
Price
Standard
Implied Tree
Price
Stochastic
Implied Tree
Price
130 call 1.142 1.118 1.176
120 call 2.629 2.764 2.775
110 call 5.332 5.529 5.556
100 call 9.628 9.395 9.432
90 put 2.452 2.566 2.556
80 put 0.840 0.936 0.928
70 put 0.202 0.244 0.230
14. This also occurs in the standard implied trees. See, for instance, Derman, Kani and Chriss
[1996].34
QUANTITATIVE STRATEGIES TECHNICAL NOTES Sachs
Goldman
that only a relatively small portion of the calculated local volatilities have been
overwritten.
Consider a realized variance forward contract15, defined as a forward contract
on the realized variance of index returns, , with strike price K and payoff
at the contract maturity. Table 2 shows the valuation results for a 1-
year realized variance contract with zero strike price, using 20-period, 10000
path stochastic implied tree simulations with four different volatility of volatil-
ity parameters θ = 0%, 20%, 30%, 50%. To make the results more clear, we
choose a flat initial volatility smile with a constant implied volatility of 20% for
all standard European options. Also the discount rate and dividend yield are
both chosen to be zero.
TABLE 2. Prices of a zero-strike realized variance forward contract for
different values of the volatility of volatility parameter.
It is clear from this table that the price of a realized variance forward contract is
independent of the volatility of volatility parameter, and is what one would
expect from a static 20% flat initial implied volatility surface. In fact, it can be
shown that under very general conditions (see footnote 14) the price of this for-
ward contract depends only on the initial volatility surface and not on the spe-
cific stochastic aspects of the volatility process. More precisely, it’s price equals
the discounted value of the expected (equilibrium) total index return variance
during the life of the contract. As discussed earlier, this expectation is fully
embodies in today’s local volatility surface. Therefore, we are able to price this
forward contract by using an effective theory (θ = 0), as the second column in
the table indicates. This is quite analogous to our ability to price index forwards
contracts using the static initial forward curve without any specific knowledge
of the stochastic behavior of the future index prices, or to price straight bonds
using the initial yield curve with no specific knowledge of the behavior of future
interest rates.
Now consider a realized variance (call) option contract with strike price K
whose payoff at maturity is given by . Table 3 shows the valua-
15. See also Investing in Volatility, Derman etal. [1996].
θ 0% 20% 30% 50%
price 399.81 400.37 401.10 400.69
Pricing of Some Contracts
with Payoffs Based on Realized
Volatility
Σ
2
Σ
2
K – ( )
Max Σ
2
K – 0 , ( )35
QUANTITATIVE STRATEGIES TECHNICAL NOTES
Goldman
Sachs
tion results for 1-year realized variance call options with different strike prices,
under precisely the same conditions as before.
TABLE 3. Prices of realized variance call option contracts with different
strike prices and volatility of volatility parameters.
According to this table the price of a realized variance option contract increases
with the volatility of volatility parameter. This result should be expected as most
options’ prices increase when their underlyer price becomes more volatile. Fur-
thermore, like most options, the pricing and hedging of a realized variance
option contract depends crucially on our choice of the stochastic volatility
model.
Appendix D gives conditions for the existence and uniqueness of an equivalent
martingale measure in multi-factor stochastic volatility models. Under these
conditions the markets are complete and, given a contingent claim C, there
exists an admissible self-financing trading strategy (Harrison and Pliska [1981])
involving the index S, the money market account B, and (any) n different stan-
dard options , i = 1,...,n, which replicate this contingent claim:
a.e.
This replication strategy is dynamical, so that the hedge ratios NB, NS and Ni, i =
1, ..,n, are in general functions of time and other dynamical variables.
To find the hedge ratios NS and Ni we must separately move the index price S
and introduce n independent shocks Wi (possibly corresponding to the n inde-
pendent factors) to the initial local volatility surface, and subsequently reprice
the contingent claim and the n hedge standard options. For the simple model in
our examples, we find these hedge ratios from solving the following system of
0% 20% 30% 50%
400 0.00 48.336 65.784 95.742
500 0.00 14.745 31.221 56.096
600 0.00 3.391 11.780 25.211
700 0.00 0.203 1.682 4.654
HEDGING THE INDEX AND
VOLATILITY RISKS IN STO-
CHASTIC VOLATILITY MOD-
ELS
Ci CKi Ti , =
NBB NSS NiCi
i 1 =
n
∑ + + C =36
QUANTITATIVE STRATEGIES TECHNICAL NOTES Sachs
Goldman
equations
This system has a unique solution if the sensitivity matrix on the right hand side
is non-singular. This is true if , i.e when the sensitivity of the
option to a parallel shift in the local volatility surface is positive. This condition
holds for any standard option with non-zero strike price.
In the previous example, all instantaneous changes of the volatility surface are
caused by a single source of randomness, a parallel shift factor. However,
empirical analyses16
of the daily changes of the volatility surface for index
options reveals other important sources of randomness. A more realistic sto-
chastic volatility model may be, for example, given by the following pair of sto-
chastic differential equations:
where and are all constants. The first factor has
the same interpretation as before, whereas the second and third factors may be
interpreted as the term structure factor and skewness factor, respectively. The
shocks to the local volatility surface resulting from these factors are shown in
the figure below:
16. To be presented in an upcoming Quantitative Strategies Research Note.
1 C1 ∂ S ∂ ⁄
0 C1 ∂ W
1
∂ ⁄
NS
N1
C ∂ S ∂ ⁄
C ∂ W
1
∂ ⁄
=
C1 W
1
∂ ⁄ ∂ 0 >
MORE REALISTIC STOCHAS-
TIC VOLATILITY MODELS
dS
S
----- - µdt σdW
0
+ =
dσ
2
K T , t S , ( )
σ
2
K T , t S , ( )
----------------------------- - αK T , t S , ( )dt θ1dW
1
θ2e
λ T t – ( ) –
dW
2
θ3e
η K S – ( ) –
dW
3
+ + + =
σ t ( ) σt St , t St , ( ) = θ1 θ2 θ3 λ η , , , ,
(a) parallel shift (b) term structure (c) skewness
K
T
σK,T σK,T σK,T
K K
T T
K
θ37
QUANTITATIVE STRATEGIES TECHNICAL NOTES
Goldman
Sachs
In this paper we discussed an arbitrage pricing approach to contingent claims
valuation with stochastic volatility similar to the Heath-Jarrow-Morton (HJM)
methodology for stochastic interest rates. We began with a continuous time
economy with multiple factors, and posited a general multi-factor continuous
time stochastic process for the evolution of the local volatility surface. We char-
acterized the conditions which guarantee absence of arbitrage opportunities
among the various option and forward contracts defined on the underlying
index. Under these conditions markets are complete and contingent claim valua-
tion is preference-free. However, these no-arbitrage conditions are non-linear
and difficult to use in their continuous form. We then introduced the Stochastic
Implied Tree as a discrete-time framework for implementing our family of mod-
els. Starting from any initial node, we can guarantee absence of future arbitrages
by choosing appropriate drift parameters for every future node. This procedure
guarantees arbitrage-free future movements of the index and local volatility sur-
face in the discrete-time world defined by the stochastic implied tree. We can
use Stochastic Implied Trees to price contingent claims with payoffs which
depend on the index and index volatility, when the volatility surface is skewed
and stochastic. The resulting contingent claim prices are independent of the
market prices of risk. They are also consistent with the current market prices of
all standard options and forwards defined on the underlying index and with the
absence of any future arbitrage opportunities.
This appendix provides expectation definitions for local volatility. It begins
with Equation 2 as the definition of local volatility and derives the expectation
relationships between local volatilities and future instantaneous volatilities,
given the assumption that the equivalent martingale measure exists.
Under the equivalent martingale measure, the index price evolution is given by
the stochastic differential equation
(EQ 58)
where the riskless discount rate r and continuously compounded dividend yield
δ are assumed to be constant, is the instantaneous volatility at time t and
is a standard Brownian motion under this measure, as discussed in the
text. Let denote the expectation corresponding to this measure, given
the information available at time t (with the index level at S = St). Aside from
the spot index level, the information at time t generally includes the past index
levels, the values of the n (independent) stochastic factors Wi
(governing the
stochastic behavior of volatility) and their past histories. Under the equivalent
martingale measure rescaled option prices are martingales. Therefore, the price,
SUMMARY
APPENDIX A: Expectation Defi-
nitions of Local Volatility
dSt
St
------- r δ – ( )dt σtdZt + =
σt
Z W
0
=
E Et S , =38
QUANTITATIVE STRATEGIES TECHNICAL NOTES Sachs
Goldman
, at time t and market level S of a standard European-style (call)
option, with strike K and maturity T, with terminal value
is given by
(EQ 59)
Differentiating this equation once with respect to K gives
(EQ 60)
where θ(.) is the Heaviside function. Differentiating twice with respect to K
gives
(EQ 61)
where δ(.) is the Dirac delta function. Lastly, differentiating with respect to T
gives
(EQ 62)
A formal application of Ito’s lemma to the option’s terminal payoff leads to the
identity
(EQ 63)
Taking Expectations of both sides of this equation and using Equation 58 leads
to
(EQ 64)
The first term in this expression can be rewritten as
(EQ 65)
Inserting this relation and multiplying both sides of Equation 64 by the discount
factor , and using Equations 59 and 60 we obtain
(EQ 66)
CK T , t S , ( )
CK T , T ST , ( ) ST K – ( ) + =
CK T , t S , ( ) e
r T t – ( ) –
E ST K – ( ) + [ ] =
K ∂
∂CK T ,
e –
r T t – ( ) –
E θ ST K – ( ) [ ] =
K2
2
∂
∂ CK T ,
e
r T t – ( ) –
E δ ST K – ( ) [ ] =
T ∂
∂CK T ,
r – CK T , e
r T t – ( ) –
T ∂
∂
E ST K – ( ) + [ ] + =
d ST K – ( ) + θ ST K – ( )dST
1
2
-- -σT
2
ST
2
δ ST K – ( )dT + =
dE ST K – ( ) + [ ] r δ – ( )E STθ ST K – ( ) [ ]dT
1
2
-- -E σT
2
ST
2
δ ST K – ( ) [ ]dT + =
E STθ ST K – ( ) [ ] E ST K – ( ) + [ ] KE θ ST K – ( ) [ ] + =
e
r T t – ( ) –
e
r T t – ( ) –
T ∂
∂
E ST K – ( ) + [ ] r δ – ( ) CK T , K
K ∂
∂CK T ,
–
 
 
  1
2
-- -e
r T t – ( ) –
K
2
E σT
2
δ ST K – ( ) [ ] + =39
QUANTITATIVE STRATEGIES TECHNICAL NOTES
Goldman
Sachs
Replacing this expression for the last term in Equation 62 gives
(EQ 67)
Finally, using conditional expectations we can write
(EQ 68)
which together with Equation 61, can be inserted back into Equation 67 to arrive
at
(EQ 69)
The right hand side of this equation is precisely the definition of the local vari-
ance , as defined in Equation 2. It follows that
(EQ 70)
The local variance is, therefore, the conditional expectation of the
instantaneous variance of index returns at the future time T, contingent on index
level ST being equal to K. If the instantaneous index volatility is only a function
of the spot index level and time, i.e. if σt = σ(St , t), then
(EQ 71)
Since the right hand side is independent of t and S, in this case the local volatil-
ity surface remains static as time t evolves and index level S changes. This situ-
ation corresponds to an effective theory where all sources of volatility
uncertainty, other than the future time t and the future index level S, are effec-
tively averaged out of the theory, leaving an effective volatility which is only a
function of t and S.
In the general stochastic setting the dynamics of local volatilities is described by
the stochastic differential equation
(EQ 72)
T ∂
∂CK T ,
r δ – ( )K –
K ∂
∂CK T ,
δCK T , –
1
2
-- -e
r T t – ( ) –
K
2
E σT
2
δ ST K – ( ) [ ] + =
E σT
2
δ ST K – ( ) [ ] E σT
2
ST [ K] E δ ST K – ( ) [ ] ⋅ = =
E σT
2
ST [ K] 2
T ∂
∂CK T ,
r δ – ( )K
K ∂
∂CK T ,
δCK T , + +
 
 
 
K2
K2
2
∂
∂ CK T ,
----------------------------------------------------------------------------------- - = =
σ
2
K T , t S , ( )
σ
2
K T , t S , ( ) E σT
2
ST [ K]
E σT
2
δ ST K – ( ) [ ]
E δ ST K – ( ) [ ]
-------------------------------------- - = = =
σ
2
K T , t S , ( )
σ
2
K T , t S , ( ) E σT
2
ST [ K] E σ
2
ST T , ( ) ST [ K] σ
2
K T , ( ) = = = = =
dσ2
K T , t S , ( )
σ2
K T , t S , ( )
----------------------------- - αK T , t S , ( )dt θi
K T , t S , ( )dW
i
t
i 0 =
n
∑ + =40
QUANTITATIVE STRATEGIES TECHNICAL NOTES Sachs
Goldman
As discussed in the text, , i = 0, ...,n, are independent Brownian motions
under the equivalent martingale measure and the volatility coefficients are
some given functions of time t, index level S and factor values Wi
t , or the past
histories of these variables. The drift coefficients have similar depen-
dencies, but are constrained by the requirement of no-arbitrage. In an effective
theory for all values of t and S, as seen by Equation 71, thus
the drift and volatility coefficients are all identically equal to zero.
The denominator on the right hand side of Equation 70 is the total transition
probability (see Equation 39):
(EQ 73)
Since , for all values of K and T, are jointly martingales under the equiva-
lent martingale measure, the stochastic differential equation governing their
evolution has the form
(EQ 74)
The numerator on the right hand side of Equation 70 is also a martingale under
this measure. Therefore, by taking differentials of both sides of this equation
and applying Ito’s lemma we find that
(EQ 75)
Let us define a new measure, , specifically depending on K
and T. From Equations 72 and 75 we observe that under this new measure local
variance is a martingale, i.e
(EQ 76)
We call this measure the K-strike and T-maturity forward risk-adjusted measure
in analogy with T-maturity forward risk-neutral measure in interest rates (see
Jamshidian [1993]). Letting denote expectations with respect to this
new measure, we can write Equation 70 as
(EQ 77)
Therefore, in the K-strike and T-maturity forward risk-adjusted measure the
local variance is the expectation of future spot variances at time T.
This is analogous to the similar situation in interest rate world where the for-
W
i
θi
K T ,
αK T , t S , ( )
dσ2
K T , t S , ( ) 0 =
PK T , t S , ( )
PK T , t S , ( ) E δ ST K – ( ) [ ] =
PK T ,
dPK T , t S , ( )
PK T , t S , ( )
-------------------------- - ζi
K T , t S , ( )dW
i
t
i 0 =
n
∑ =
αK T , ζi
K T , θi
K T ,
i 0 =
n
∑ + 0 =
dŴ
i
dW
i
ζ
i
K T , dt – =
σ
2
K T ,
dσ2
K T , t S , ( )
σ2
K T , t S , ( )
----------------------------- - θi
K T , t S , ( )dŴ
i
t
i 0 =
n
∑ =
E
K T , ( )
… [ ]
σ2
K T , E
K T , ( )
σT
2
[ ] =
σ
2
K T , σT
241
QUANTITATIVE STRATEGIES TECHNICAL NOTES
Goldman
Sachs
ward rate is the T-maturity forward risk-adjusted expectation of the future
spot rates at time T.
In this appendix we describe several mathematical relationships satisfied by the
propagators, transition probabilities and the standard option prices in the effec-
tive volatility theories.
The forward propagator in an effective volatility theory describes the
(standard) option price evolution forward in time and index price. It satisfies the
same backward equation as option prices, a dual forward equation and the
boundary condition for all time t. Alternatively we can work
with the forward transition probability density function, , which is
defined in terms of the forward propagator as . The
forward transition probability, with boundary condition
, satisfies the following backward equation
(EQ 78)
its dual forward equation
(EQ 79)
and, for any , the Chapman-Kolmogorov relation
(EQ 80)
fT
APPENDIX B: Mathematics of Effec-
tive Theories
pt S t' S' , , ,
pt S t S' , , ,
δ S S' – ( ) =
p t S t' S' , , , ( )
p t S t' S' , , , ( ) e
r t' t – ( )
pt S t' S' , , ,
=
p t S t S' , , , ( ) δ S S' – ( ) =
t ∂
∂
r δ – ( )S
S ∂
∂ 1
2
-- -σ2
S t , S2
S2
2
∂
∂
+ +
 
 
 
p t S t' S' , , , ( ) 0 =
t' ∂
∂
p t S t' S' , , , ( ) r δ – ( )
S' ∂
∂
S'p t S t' S' , , , ( ) ( )
1
2
-- -
S
2
2
∂
∂
σ2
S' t' , S'2p t S t' S' , , , ( ) ( ) ( ) – + 0 =
t t ˜ t' ≤ ≤
p t S t' S' , , , ( ) p t S t ˜ S ˜ , , , ( )p t ˜ S ˜ t' S' , , , ( ) S ˜ d
0
∞
∫ =42
QUANTITATIVE STRATEGIES TECHNICAL NOTES Sachs
Goldman
The forward transition probability (propagator) relates prices of a standard
option, with fixed strike K and maturity T, at different time and market levels
according to
(EQ 81)
Differentiating this relation twice and evaluating it at leads to
(EQ 82)
Similarly, the backward propagator describes option price evolution
backward in maturity time and strike price. It satisfies the same forward equa-
tion as the option prices, its dual backward equation, and the boundary condi-
tion for all T. Alternatively we can work with the
backward transition probability density function, , which is
defined in terms of the backward propagator as
. The backward transition probability density
function, with the boundary condition , satisfies the
following forward equation
(EQ 83)
its dual backward equation
(EQ 84)
and, for any , the chapman-Kolmogorov relation
(EQ 85)
The backward transition probability (propagator) relates prices of standard
options, with different strikes and maturities, at a fixed time t, , and
market level S according to
(EQ 86)
Differentiating this relation twice and evaluating it at leads to
CK T , t S , ( ) e
r T t – ( ) –
p t S t' S' , , , ( )CK T , t' S' , ( ) S' d
0
∞
∫ =
t' T =
p t S T K , , , ( ) e
r T t – ( )
K
2
2
∂
∂
CK T , t S , ( ) =
ΦK T K' T' , , ,
ΦK T K' T , , ,
δ K K' – ( ) =
Φ K T K' T' , , , ( )
Φ K T K' T' , , , ( ) e
δ T T' – ( )
ΦK T K' T' , , ,
=
Φ K T K' T , , , ( ) δ K K' – ( ) =
T ∂
∂
r δ – ( )K
K ∂
∂ 1
2
-- -σ2K T , K2
K2
2
∂
∂
– +
 
 
 
Φ K T K' T' , , , ( ) 0 =
T' ∂
∂
Φ K T K' T' , , , ( ) r δ – ( )
K' ∂
∂
K'Φ K T K' T' , , , ( ) ( )
1
2
-- -
K'2
2
∂
∂
σ2
K' T' , K'
2
Φ K T K' T' , , , ( )  
  + + 0 =
T' T ˜ T ≤ ≤
Φ K T K' T' , , , ( ) Φ K T K̃ T̃ , , , ( )Φ K̃ T̃ K' T' , , , ( ) K̃ d
0
∞
∫ =
t T' T ≤ ≤
CK T , t S , ( ) e
δ T T' – ( ) –
Φ K T K' T' , , , ( )CK' T' ,
t S , ( )
0
∞
∫ =
T' t =43
QUANTITATIVE STRATEGIES TECHNICAL NOTES
Goldman
Sachs
(EQ 87)
In this appendix we derive variational formulas describing sensitivity of the
transition probabilities (propagators) to a specific local volatility on the volatil-
ity surface. We work within the context of effective theories, (formally) chang-
ing the local volatility corresponding to a single future time and market level,
while leaving all other local volatilities unchanged.
We begin by studying the relationship between transition probabilities and local
volatilities in a discrete time setting. We then take the continuous-time limit by
letting the spacing go to zero. Consider one period forward transition probabili-
ties p*u, p*m and p*d, from the index level S* at time t* to the three nearby
index levels S*u, S*m and S*d at time t*+ ∆t*, as shown in the figure below:
Let denote the one-step forward price and the
local volatility, corresponding to the initial node (t*,S*). The three transition
probabilities in the figure add up to one, and are further constrained by the for-
ward and volatility conditions, i.e
Φ K T S t , , , ( ) e
δ T t – ( )
S
2
2
∂
∂
CK T , t S , ( ) =
APPENDIX C: Local Volatility
Variational Formulas in
Effective Volatility Theories
S*
S*u
S*m
S*d
p*u
p*m
p*d
F*
F∗ S∗e
r δ – ( )∆t∗
= σ∗ σS∗ t∗ , =44
QUANTITATIVE STRATEGIES TECHNICAL NOTES Sachs
Goldman
(EQ 88)
(EQ 89)
(EQ 90)
We can solve these expressions for transition probabilities in terms of the local
volatility. The results are
(EQ 91)
(EQ 92)
and .
Now consider the forward transition probability , describing the
total probability that starting with the level S at time t the index will move to the
level S' at the future time t', in the effective theory context. We can isolate the
sensitivity of this transition probability to a specific local volatility , corre-
sponding to the future time and future market level , using the
Chapman-Kolmogorov relation of Equation 80. In discrete-time this contribu-
tion is isolated in the following figure:
This figure describes the following decomposition of the total transition proba-
bility:
(EQ 93)
p∗u p∗m p∗d + + 1 =
p∗uS∗u p∗mS∗m p∗dS∗d + + F∗ =
p∗u S∗u F∗ – ( )
2
p∗m S∗m F∗ – ( )
2
p∗d S∗d F∗ – ( )
2
+ + F∗2
σ∗2
∆t∗ =
p∗u
F∗ S∗m – ( ) F∗ S∗d – ( )
S∗u S∗m – ( ) S∗u S∗d – ( )
------------------------------------------------------- - F∗2
S∗u S∗m – ( ) S∗u S∗d – ( )
------------------------------------------------------- -σ∗2
∆t∗ + =
p∗d
F∗ S∗m – ( ) F∗ S∗u – ( )
S∗m S∗d – ( ) S∗u S∗d – ( )
------------------------------------------------------- -
F∗2
S∗m S∗d – ( ) S∗u S∗d – ( )
------------------------------------------------------- -σ∗2
∆t∗ + =
p∗m 1 p∗u p∗d – – =
p t S t' S' , , , ( )
σS∗ t∗ ,
t t∗ t' ≤ ≤ S∗
S*u
S*m
S*d
p*u
p*m
p*d
S*
t t* t*+∆t* t'
S'
S
p t S t' S' , , , ( ) p t S t∗ S∗ , , , ( )p∗up t∗ ∆t∗ + S∗u t' S' , , , ( ) + =
p t S t∗ S∗ , , , ( )p∗mp t∗ ∆t∗ + S∗m t' S' , , , ( ) +45
QUANTITATIVE STRATEGIES TECHNICAL NOTES
Goldman
Sachs
terms with no sensitivity to σS*,t*
Taking the variational derivative with respect to gives
(EQ 94)
From Equations 91 and 92, and ignoring o(∆t*) terms, we have
(EQ 95)
(EQ 96)
. (EQ 97)
where we used the approximation . Insert these
relations back in Equation 94 leads to
(EQ 98)
In the limit we find the desired result
(EQ 99)
Similarly, the variational derivative of the backward transition probability
to the local volatility with is found using the
figure:
p t S t∗ S∗ , , , ( )p∗dp t∗ ∆t∗ + S∗d t' S' , , , ( ) +
σ
2
S∗ t∗ ,
δp t S t' S' , , , ( )
δσ
2
S∗ t∗ ,
------------------------------- - p t S t∗ S∗ , , , ( )
δp∗u
δσ
2
S∗ t∗ ,
------------------ -
 
 
 
p t∗ ∆t∗ + S∗u t' S' , , , ( ) + =
p t S t∗ S∗ , , , ( )
δp∗m
δσ
2
S∗ t∗ ,
------------------ -
 
 
 
p t∗ ∆t∗ + S∗m t' S' , , , ( ) +
p t S t∗ S∗ , , , ( )
δp∗d
δσ
2
S∗ t∗ ,
------------------ -
 
 
 
p t∗ ∆t∗ + S∗d t' S' , , , ( )
δp∗u
δσ
2
S∗ t∗ ,
------------------ -
S∗2
S∗u S∗m – ( ) S∗u S∗d – ( )
------------------------------------------------------- -
1
2
-- -
S∗
∆S∗
--------- -  
 
2
∼ =
δp∗d
δσ
2
S∗ t∗ ,
------------------ -
S∗2
S∗m S∗d – ( ) S∗u S∗d – ( )
------------------------------------------------------- -
1
2
-- -
S∗
∆S∗
--------- -  
 
2
∼ =
δp∗m
δσ
2
S∗ t∗ ,
------------------ -
δp∗u
δσ
2
S∗ t∗ ,
------------------ -
δp∗d
δσ
2
S∗ t∗ ,
------------------ - +
 
 
 
–
S∗
∆S∗
--------- -  
 
2
– ∼ =
S∗u S∗m – S∗m S∗d – ∼ ∆S∗ =
δp t S t' S' , , , ( )
δσ
2
S∗ t∗ ,
------------------------------- -
1
2
-- -p t S t∗ S∗ , , , ( )S∗2
p t∗ ∆t∗ + S∗ ∆S∗ + t' S' , , , ( ) – { =
2p t∗ ∆t∗ + S∗ t' S' , , , ( ) p t∗ ∆t∗ + S∗ ∆S∗ – t' S' , , , ( )} ∆S∗ ( ) ⁄
2
+
∆S∗ 0 →
δp t S t' S' , , , ( )
δσ
2
S∗ t∗ ,
------------------------------- -
1
2
-- -p t S t∗ S∗ , , , ( )S∗2
S∗2
2
∂
∂
p t∗ S∗ t' S' , , , ( ) =
Φ K T K' T' , , , ( ) σK∗ T∗ ,
T' T∗ T ≤ ≤46
QUANTITATIVE STRATEGIES TECHNICAL NOTES Sachs
Goldman
and can be written as
(EQ 100)
This appendix presents a proof of the no-arbitrage drift conditions of Equation
53. We also make the usual assumptions about the regularity, measurability and
integrability of various quantities. A more rigorous treatment will need to
address these issues.
Let us begin with Equation 40 in the text, describing the stochastic process fol-
lowed by the total transition probability in a stochastic volatility the-
ory:
The first term describes differential changes of the transition probability
restricted to the effective theory defined by the (non-random) local volatility
surface prevailing at time t and market level S. Restricted to this sur-
face, coincides with the effective theory total transition probability
and the instantaneous volatility coincides with the local vola-
tility . Therefore, in view of Equation 78, the following backward equation
holds:
K*u
K*m
K*d
φ*m
φ*d
K*
T T* T*-∆T* T'
K'
K
φ*u
δΦ K T K' T' , , , ( )
δσ
2
K∗ T∗ ,
--------------------------------------
1
2
-- -Φ K T K∗ T∗ , , , ( )K∗2
K∗2
2
∂
∂
Φ K∗ T∗ K' T' , , , ( ) =
APPENDIX D: The No-Arbitrage
Conditions and the Existence
of the Equivalent Martingale
Measure in Stochastic Volatility Theo-
ries
PK T , t S , ( )
dP
K T , t ∂
∂P
K T ,
µ t ( )S
S ∂
∂P
K T , 1
2
-- -σ2 t ( )S2
S2
2
∂
∂ P
K T ,
+ +
 
 
 
 
dt σ t ( )S
S ∂
∂P
K T ,
dW0 t ( ) +
t S , ( )
= +
δP
K T ,
δσ2
K' T' ,
----------------------- σ2
K' T' , d K' d T' d
0
∞
∫ t
T
∫
1
2
-- -
δ
2
P
K T ,
δσ2
K' T' , δσ2
K'' T'' ,
------------------------------------------------- σ2
K' T' , d σ2
K'' T'' , d K' d K'' d T' T'' d d
0
∞
∫ 0
∞
∫ t
T
∫ t
T
∫ +
σK T , t S , ( )
PK T , t S , ( )
p t S K T , , , ( ) σ t ( )
σt S ,
t ∂
∂PK T ,
r δ – ( )S
S ∂
∂PK T , 1
2
-- -σ2 t ( )S2
S2
2
∂
∂ PK T ,
+ + 0 =47
QUANTITATIVE STRATEGIES TECHNICAL NOTES
Goldman
Sachs
Using this expression, Equations 25 and 99, and some manipulations we arrive
at
Note that the effective theory transition probabilities p(..) implicitly depend on t
and S, whether or not they contain these variables explicitly.
Now assume that the drift parameters satisfy the following relations
with and (so far) arbitrary functions , i = 1, .., n:
Then we can define a new measure { , i = 0, .., n} by
; (i = 1, ..,n)
in terms of which we have
The measure { , i = 0, .., n } is an equivalent martingale probability mea-
sure. Applying the arguments of Harrison and Kreps [Harrison 1979] we can
show that this equivalent martingale measure is unique if (and only if) the mar-
ket prices of risk and ,
i = 1, .., n, remain independent of strike price K and maturity T. Under these
conditions the markets are complete and contingent claims valuation follows the
standard methods of Harrison and Pliska [Harrison 1989] and remains indepen-
dent of market prices of risk.
dPK T , σ t ( )S
S ∂
∂P
K T ,
dW0 t ( ) µ t ( ) r – δ + ( )dt + [ ]
δP
K T ,
δσ2
K' T' ,
---------------------- -θ
K' T' ,
i
K' d T' d
0
∞
∫ t
T
∫  
 
 
dWt
i
i 0 =
n
∑ + =
δP
K T ,
δσ2
K' T' ,
---------------------- -
0
∞
∫ α [
K' T' ,
t S , ( ) θ
i
K' T' , t S , ( )
1
p t S T' K' , , , ( )
------------------------------ - ×



i 0 =
n
∑ +
t
T
∫ 



θ
i
K'' T'' , t S , ( )p t S T'' K'' , , , ( )K''2
K''2
2
∂
∂
p T'' K , '' T' K' , , ( ) K' d ' T''}] K' d T' d d ) t d
0
∞
∫ t
T'
∫
σK T , t S , ( )
Π
0
0 = Π
i
σ
K T ,
t S , ( ) θ
i
K T , t S , ( )
1
p t S T K , , , ( )
---------------------------- - θ
i
K' T' , t S , ( )p t S T' K' , , , ( )K2'
K'2
2
∂
∂
p T' K' , T K , , ( ) K d ' T' d
0
∞
∫ t
T'
∫ Π
i
–
 
 
 
 
 
i 0 =
n
∑ – =
dW
i
dWt
0
dWt
0 µ t ( ) r – δ + ( )
σ t ( )
--------------------------------dt + = dWt
i
dWt
i
Πt
i
dt + =
dPK T , σ t ( )S
S ∂
∂PK T ,
dW
0 δPK T ,
δσ2
K' T' ,
---------------- -θK' T' ,
i
K' d T' d
0
∞
∫ t
T
∫  
 dWt
i
i 0 =
n
∑ + =
dW
i
µ r – δ + ( ) σ ⁄ Π
i48
QUANTITATIVE STRATEGIES TECHNICAL NOTES Sachs
Goldman
This appendix derives formulas for calculating drift parameters from the no-
arbitrage conditions in stochastic volatility theories. We work in the discrete
time context of the stochastic implied trinomial trees and show how to induc-
tively calculate the arbitrage-free drift parameters for all future nodes from the
martingale conditions on the total transition probabilities to the neighboring
nodes at the next time step.
We begin our analysis at the (i+1)th step of the simulation, at time ti, with index
level at node (i,j) of the stochastic implied tree. Our objective is to calculate the
arbitrage-free drift parameters , to all future nodes (n, m) at future
times tn for . We calculate the drift parameter iteratively, using
the results of the previous iteration steps and the condition that the total transi-
tion probability , from the node (i,j) to the node (n+1,m+2), is a
martingale under all possible future movements of the local volatility surface.
This situation is shown in the following figure:
The figure shows the subtree which starts at the initial node (i,j). All the future
movements of the index and local volatilities will be confined to the nodes of
this subtree. Our iteration for calculating drift parameters for all sub-
tree nodes begins with the calculation of the drift parameter at the initial node,
, and continues forward to subsequent time steps beginning with the
highest node at each time step.
To make matter simple, for now let us assume that the only possible movements
of the local volatility surface during the next instant ∆t are up or down (propor-
tionately), with some constant volatility , as in our example in the text, i.e
APPENDIX E: Computing Drift
Parameters in Arbitrage-Free
Stochastic Volatility Theories
αm n , i j , ( )
n i ≥ αm n , i j , ( )
Pm 2 + n 1 + , i j , ( )
αm n , i j , ( )
αj i , i j , ( )
θ
σ
u d , ( )
m n , i j , ( ) σm n , i j , ( ) αm n , i j , ( )
1
2
-- -θ
2
–
 
 ∆t θ ∆t ±
 
 
 
exp =49
QUANTITATIVE STRATEGIES TECHNICAL NOTES
Goldman
Sachs
Suppose that we have calculated the drift parameters for every node before time
tn, and also for every nodes at time tn which lies above the node (n,m), shown in
dark in the figure. We must now calculate from the previously known
quantities and the martingale condition on the total probability ,
of arriving at the node (n+1, m+2) at the next time step. We can decompose the
contributions to this probability into two components as follows:
As in the figure, p denotes the one period up transition probability from the
node (n,m) to the node (n+1, m+2). The first term describes the contribution of
the node (n,m) to the total transition probability, stemming from all the paths
which go through this node before arriving at (n+1,m+2). The second term
describes the contribution of all the nodes lying above the node (n,m) to this
transition probability.
(i,j)
2(n-i)+j
j
2(n-i)+j-1
2(n-i)+j+2
2(n-i)+j+1
2(n-i)+j
m+2
m+1
m
j+2
j+1
j
m
j+1
ti tn tn+1
...........
......... ..........
p
αm n , i j , ( )
Pm 2 + n 1 + , i j , ( )
Pm 2 n 1 + , + i j , ( ) Pm n , i j , ( )p Λm n , i j , ( ) + =50
QUANTITATIVE STRATEGIES TECHNICAL NOTES Sachs
Goldman
Consider now the next instant ∆t in time where all future local volatilities will
simultaneously move either to their up state, , or to their down state
. Since transition probabilities are direct functions of local volatili-
ties, then all probabilities will also simultaneously move to their up or down
states, i.e
The quantities and depend on drift parameters and
other quantities known from the previous iteration steps, but remain
unknown as they depend on the unknown drift parameter . We have
previously discussed the structure of this dependence in Equations 91 and 92.
The one period transition probability depends linearly on the local variance
, i.e , with coefficients A and B depending only
on the position of the nodes, which are fixed and known. Hence
Using this and previous relations, we can now determine the unknown drift
parameter from the martingale condition for the (known) total proba-
bility :
Therefore the desired formula is
σ
u ( )
m n , i j , ( )
σ
d ( )
m n , i j , ( )
P
u d , ( )
m 2 n 1 + , + i j , ( ) P
u d , ( )
m n , i j , ( )p
u d , ( )
Λ
u d , ( )
m n , i j , ( ) + =
P
u d , ( )
m n , i j , ( ) Λ
u d , ( )
m n , i j , ( )
p
u d , ( )
αm n , i j , ( )
p
σ
2
m n , i j , ( ) p A Bσ
2
m n , i j , ( ) + =
p
u d , ( )
A Bσ
u d , ( )2
m n , i j , ( ) + = =
A Bσ
2
m n , i j , ( ) 2 αm n , i j , ( ) 1
2
-- -θ
2
–
 
 ∆t 2θ ∆t ±
 
 
 
exp + =
αm n , i j , ( )
Pm 2 + n 1 + , i j , ( )
Pm 2 + n 1 + , i j , ( )
1
2
-- - P
u ( )
m 2 + n 1 + , i j , ( ) P
d ( )
m 2 + n 1 + , i j , ( ) + { } =
1
2
-- - P
u ( )
m n , i j , ( )p
u ( )
P
d ( )
m n , i j , ( )p
d ( )
Λ +
u ( )
m n , i j , ( ) Λ
d ( )
m n , i j , ( ) + + { } =
1
2
-- - P
u ( )
m n , i j , ( ) P
d ( )
m n , i j , ( ) + [ ]A Λ
u ( )
m n , i j , ( ) Λ
d ( )
m n , i j , ( ) + + { } + =
1
2
-- -Bσ
2
m n , i j , ( )e
θ
2
∆t –
P
u ( )
m n , i j , ( )e
2θ ∆t
P
d ( )
m n , i j , ( )e
2θ ∆t –
+ [ ] 2αm n , i j , ( )∆t { } exp
α
m n ,
i j , ( )
P
m 2 + n 1 + ,
i j , ( )
1
2
-- - P
u ( )
m n , i j , ( ) P
d ( )
m n , i j , ( ) + A Λ
u ( )
m n , i j , ( ) Λ
d ( )
m n , i j , ( ) + +
 
 
 
–
1
2
-- -Bσ
2
m n , i j , ( )e
θ
2
∆t –
P
u ( )
m n , i j , ( )e
2θ ∆t
P
d ( )
m n , i j , ( )e
2θ ∆t –
+
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- log
 
 
 
 
 
 
 
2∆t ( ) ⁄ =51
QUANTITATIVE STRATEGIES TECHNICAL NOTES
Goldman
Sachs
This result can be readily extended to the cases where the local volatility surface
can move to any number (more than two) of possible states during a time step,
has multiple stochastic factors, or has factor volatilities which are more compli-
cated functions of time, market level, factor values or their past histories.52
QUANTITATIVE STRATEGIES TECHNICAL NOTES Sachs
Goldman
REFERENCES
Black, F. and M. Scholes (1973). The Pricing of Options and Corporate Liabili-
ties, Journal of Political Economy, Vol. 81, 637-654.
Black, F., E. Derman and W. Toy (1990). A One-Factor Model of Interest Rates
and Its Application to Treasury Bond Options, Financial Analyst Journal, 817,
33-39.
Breeden, D. and R. Litzenberger (1978). The Pricing of State-Contingent
Claims Implicit in Option Prices, Journal of Business, Vol. 51, 621-651.
Cox, J., J. E. Ingersoll and S. Ross (1985). A Theory of the Term Structure of
Interest Rates, Econometrica, Vol. 53, No. 2, 385-407.
Cox. J. and S. Ross (1976). The Valuation of Options for Alternative Stochastic
Processes, Journal of Financial Economics, Vol. 3, 145-166.
Cox, J., S. Ross and M. Rubinstein (1979). Option Pricing: A Simplified
Approach, Journal of Financial Economics, Vol. 7, 229-263.
Derman, E. and I. Kani (1994). Riding on a Smile. RISK 7, No. 2, 32-39.
Derman, E., I. Kani and N. Chriss (1996). Implied Trinomial Trees of the Vola-
tility Smile, Journal of Derivatives, Vol. 3, No. 4, 7-22.
Dupire, B. (1993). Model Art. RISK 6, No. 9, 118-124.
Dupire, B. (1994). Pricing with a Smile. RISK 7, No. 1, 18-20.
Eisenberg L. and R. Jarrow (1994). Option Pricing With Random Volatilities in
Complete Markets, Review of Quantitative Finance and Accounting, Vol. 4, 5-
17.
Harrison, J. M. and D. Kreps (1979). Martingales and Arbitrage in Multiperiod
Securities Markets, Journal of Economic Theory, Vol. 20, 381-408.
Harrison, J. M. and S. Pliska (1981). Martingales and Stochastic Integrals in the
Theory of Continuous Trading. Stochastic Processes and Their Applications,
Vol. 20, 215-260.
Heath, D., R. Jarrow and A. Morton (1992). Bond Pricing and The Term Struc-
ture of Interest Rates: A New Methodology for Contingent Claims Valuation,
Econometrica, Vol. 60, No. 1, 77-105.
Ho, T. S. Y. and S. B. Lee (1986). Term Structure Movements and Pricing
Interest Rate Contingent Claims, The Journal of Finance, Vol. 41, No. 5, 1011-
1029.
Hull, J. and A. White (1987). The Pricing of Options on Assets With Stochastic
Volatilities, Journal of Finance, Vol. 42, 271-301.53
QUANTITATIVE STRATEGIES TECHNICAL NOTES
Goldman
Sachs
Jamshidian, F. (1993). Option and Futures Evaluation with Deterministic Vola-
tilities, Mathematical Finance, Vol. 3, No. 2, 149-159.
Johnson, H. and D. Shanno (1987). Option Pricing When Variance is Changing,
Journal of Financial and Quantitative Analysis, Vol. 22, 143-153.
Kani, I., E. Derman and M. Kamal (1996). Trading and Hedging Local Volatil-
ity, Quantitative Strategies Research Notes, Goldman Sachs & Co.
Merton, R. (1973). Theory of Rational Option Pricing, Bell Journal of Econom-
ics and Management Science, Vol. 4, 141-183.
Rubinstein, M.E. (1994). Implied Binomial Trees, Journal of Finance, Vol. 69,
771-818.
Stein, E. and J. Stein (1991). Stock Price Distribution With Stochastic Volatil-
ity: An Analytical Approach, The Review of Financial Studies, Vol 4, No. 4,
727-752.
Vasicek, O. A. (1977). An Equilibrium Characterization of the Term Structure,
Journal of Financial Economics Vol. 5, 177-188.
Wiggins, J. (1987). Option Values Under Stochastic Volatility: Theory and
Empirical Estimates, Journal of Financial Economics, Vol. 19, 351-372.54
QUANTITATIVE STRATEGIES TECHNICAL NOTES Sachs
Goldman
SELECTED QUANTITATIVE STRATEGIES PUBLICATIONS
June 1990 Understanding Guaranteed Exchange-Rate
Contracts In Foreign Stock Investments
Emanuel Derman, Piotr Karasinski
and Jeffrey S. Wecker
March 1992 Pay-On-Exercise Options
Emanuel Derman and Iraj Kani
June 1993 The Ins and Outs of Barrier Options
Emanuel Derman and Iraj Kani
January 1994 The Volatility Smile and Its Implied Tree
Emanuel Derman and Iraj Kani
May 1994 Static Options Replication
Emanuel Derman, Deniz Ergener
and Iraj Kani
May 1995 Enhanced Numerical Methods for Options
with Barriers
Emanuel Derman, Iraj Kani, Deniz Ergener
and Indrajit Bardhan
December 1995 The Local Volatility Surface
Emanuel Derman, Iraj Kani and Joseph Z. Zou
February 1996 Implied Trinomial Trees of the Volatility Smile
Emanuel Derman, Iraj Kani and Neil Chriss
August 1996 Trading and Hedging Local Volatility
Iraj Kani, Emanuel Derman and Michael Kamal
October 1996 Investing in Volatility
Emanuel Derman, Michael Kamal, Iraj Kani,
John McClure, Cyrus Pirasteh and Joseph ZouQuantitative Strategies
Technical Notes
Goldman
Sachs
Stochastic Implied Trees:
Arbitrage Pricing With
Stochastic Term and Strike
Structure of Volatility
Emanuel Derman
Iraj Kani
April 1997QUANTITATIVE STRATEGIES TECHNICAL NOTES Sachs
Goldman
SUMMARY
In this paper we present an arbitrage pricing framework for valuing and hedging
contingent equity index claims in the presence of a stochastic term and strike
structure of volatility. Our approach to stochastic volatility is similar to the
Heath-Jarrow-Morton (HJM) approach to stochastic interest rates. Starting from
an initial set of index options prices and their associated local volatility surface,
we show how to construct a family of continuous time stochastic processes
which define the arbitrage-free evolution of this local volatility surface through
time. The no-arbitrage conditions are similar to, but more involved than, the HJM
conditions for arbitrage-free stochastic movements of the interest rate curve.
They guarantee that even under a general stochastic volatility evolution the initial
options prices, or their equivalent Black-Scholes implied volatilities, remain fair.
We introduce stochastic implied trees as discrete implementations of our family
of continuous time models. The nodes of a stochastic implied tree remain fixed as
time passes. During each discrete time step the index moves randomly from its
initial node to some node at the next time level, while the local transition proba-
bilities between the nodes also vary. The change in transition probabilities corre-
sponds to a general (multifactor) stochastic variation of the local volatility
surface. Starting from any node, the future movements of the index and the local
volatilities must be restricted so that the transition probabilities to all future
nodes are simultaneously martingales. This guarantees that initial options prices
remain fair. On the tree, these martingale conditions are effected through appro-
priate choices of the drift parameters for the transition probabilities at every
future node, in such a way that the subsequent evolution of the index and of the
local volatility surface do not lead to riskless arbitrage opportunities among dif-
ferent option and forward contracts or their underlying index.
You can use stochastic implied trees to value complex index options, or other
derivative securities with payoffs that depend on index volatility, even when the
volatility surface is both skewed and stochastic. The resulting security prices are
consistent with the current market prices of all standard index options and for-
wards, and with the absence of future arbitrage opportunities in the framework.
The calculated options values are independent of investor preferences and the
market price of index or volatility risk. Stochastic implied trees can also be used
to calculate hedge ratios for any contingent index security in terms of its underly-
ing index and all standard options defined on that index.
________________________
We thank Indrajit Bardhan, Peter Carr, Michael Kamal and Joseph Zou for help-
ful conversations. We are also grateful to Barbara Dunn for her careful review of
the manuscript.-1
QUANTITATIVE STRATEGIES TECHNICAL NOTES
Goldman
Sachs
TABLE OF CONTENTS
INTRODUCTION10
QUANTITATIVE STRATEGIES TECHNICAL NOTES Sachs
Goldman
LOCAL VOLATILITY SURFACE: THE EFFECTIVE THEORY OF VOLATILITY ............................... 4
THE EFFECTIVE INTEREST RATE THEORY .................................................................................5
THE EFFECTIVE VOLATILITY THEORY .......................................................................................8
TOWARDS A STOCHASTIC THEORY OF VOLATILITY ................................................................11
The Stochastic Interest Rate Theory ..........................................................................11
The Stochastic Volatility Theory ...............................................................................12
The HJM Conditions and the Stochastic Theory of Interest Rates.............................14
The NO-ARBITRAGE CONDITIONS AND THE STOCHASTIC THEORY OF VOLATILITY ...............16
STOCHASTIC IMPLIED TREES....................................................................................................21
Our Notation in Discrete Time ..................................................................................24
A Simple Example .....................................................................................................27
Pricing of Some Contracts with Payoffs Based on Realized Volatility......................35
HEDGING INDEX AND VOLATILITY RISKS IN STOCHASTIC VOLATILITY MODELS...................36
MORE REALISTIC STOCHASTIC VOLATILITY MODELS.............................................................37
SUMMARY.................................................................................................................................38
APPENDIX A: EXPECTATION DEFINITIONS OF LOCAL VOLATILITY .....................................39
APPENDIX B: MATHEMATICS OF EFFECTIVE THEORIES ......................................................43
APPENDIX C: LOCAL VOLATILITY VARIATIONAL FORMULAS IN EFFECTIVE
VOLATILITY THEORIES ............................................................................................................45
APPENDIX D: THE NO-ARBITRAGE CONDITIONS AND THE EXISTENCE OF THE EQUIVALENT
MARTINGALE MEASURE IN STOCHASTIC VOLATILITY THEORIES ...........................................48
APPENDIX E: COMPUTING DRIFT PARAMETERS IN ARBITRAGE-FREE STOCHASTIC VOLATILI-
TY THEORIES ...........................................................................................................................50
The Black-Scholes theory of options pricing [Black 1973] assumes that stock prices are sto-
chastic and vary lognormally, but that future stock volatilities, interest rates and dividend
yields are known and deterministic. The theory is based on the exclusion of arbitrage: an
option’s payoff can be replicated by that of a time-varying portfolio of stock and riskless
INTRODUCTION1
QUANTITATIVE STRATEGIES TECHNICAL NOTES
Goldman
Sachs
bonds, and must therefore at any time have the same value as the portfolio. The
most compelling consequence of this arbitrage-free approach is that options values
are preference-free: investors of all risk preferences can agree on the unique fair
value of an option. This transcendent quality of the theory has led to its great practi-
cal success, spawning more than two decades of intensive research that extended it
to other underlyers and relaxed its basic assumptions so as to better match the
observed behavior of options markets and underlyers. The current generation of
models, even though they treat underlyers more realistically and can be calibrated to
prevailing options market prices, are still based on an arbitrage-free approach,
admitting no arbitrage opportunities in their theoretical framework.
The history of interest rate options pricing illustrates this development. Original
models were simple adaptations the Black-Scholes formula with bonds, rather than
stocks, as the underlyers. Today, most interest rate options pricing models assume
interest rates themselves are stochastic and mean-reverting, allow for several sto-
chastic factors, and can be calibrated to observed initial bond prices (and their vola-
tilities), while constraining future interest-rate evolution to be arbitrage-free. These
models fall into two basic families. Equilibrium models1
consider interest rate pro-
cesses depending on one or more state variables and are derived from general equi-
librium arguments. The market prices of risk are then derived from associated
characteristics of the yield curve (such as level, slope, curvature, etc.) or bond
prices. In general these models are not calibrated to all current bond prices, and may
therefore contain initial arbitrage violations. Arbitrage-free models, in contrast, are
calibrated to all initial bond prices and also admit no future arbitrage violations.
They achieve this in two different ways. The first class2 use stochastic interest rate
processes that automatically generate arbitrage-free future scenarios, and equip the
process with enough parameters to be forcibly calibrated to the initial traded bond
prices. The second class3, instead, start with exogenously specified stochastic pro-
cess for bond prices or forward rates. They then derive constraints on the evolution
of bond prices or forward rates so that no future arbitrages occur.
The history of stochastic volatility modeling is shorter but still similar to the history
of stochastic interest rates. Existing stochastic volatility models fall into two basic
families. Complete-market models4
specify conditions under which the financial
market is complete in the presence of the volatility risk. They posit (if necessary)
hypothetical traded volatility instruments that can be used to hedge the volatility risk
and complete the market. Contingent claim prices in these models depend critically
on the price dynamics of the volatility instruments and may also implicitly depend
1. See, for example, Cox, Ingersoll and Ross [1985].
2. See, for example, Vasicek [1977], Black, Derman and Toy [1990].
3. See, for example, Ho and Lee [1986], Heath-Jarrow and Morton [1992].
4. See, for example, Merton [1973], Cox and Ross [1976], Johnson and Shanno [1987], Eisenberg and
Jarrow [1994].2
QUANTITATIVE STRATEGIES TECHNICAL NOTES Sachs
Goldman
on the market price(s) of volatility risk. Equilibrium models5
tend to assume (rather
than derive) some parametric form for the stochastic evolution of the index and its
volatility in equilibrium, and then derive implicit options valuation formulas which
depend on the parameters of the process. The traded options prices are then inverted
for the unknown parameters.
Complete-market models can be somewhat arbitrary and sometimes unnatural
because of the specific assumptions they make about the hypothetical volatility
instruments. The equilibrium volatility models have the drawback that the choice of
the parametric form for the underlying stochastic processes remains largely arbi-
trary. In addition, it is usually difficult to invert complex and non-linear options
prices to obtain the parameters. Finally, ad hoc specification of the market prices of
risk can lead to violations of arbitrage6.
In this paper we propose a new arbitrage-based approach to contingent claims valu-
ation with stochastic volatility7
, similar to the Heath-Jarrow-Morton (HJM) method-
ology for stochastic interest rates8. We begin with a continuous time economy with
multiple factors. We work with local (forward) volatilities, instead of implied vola-
tilities (or option prices), imposing an exogenous stochastic structure on the local
volatility surface. The primacy of the local volatility surface in our work is analo-
gous to that of the forward rate curve in the HJM framework. Our model takes as
given the initial local volatility surface and posits a general multi-factor continuous
time stochastic process for its evolution across time. To ensure that this process is
consistent with an arbitrage-free economy we characterize the conditions which
guarantee absence of explicit arbitrage opportunities (at any future time) among the
various option (and futures) contracts defined and traded on the underlying index.
Under these conditions markets are complete and contingent claim valuation is pref-
erence-free. Unfortunately, in contrast to the HJM conditions, here the arbitrage-
free conditions are complex and non-linear (integral) equations, which are difficult
to use in their continuous form.
We then introduce Stochastic Implied Trees as a discrete-time framework where the
volatility surface undergoes multi-factor (arbitrage-free) stochastic variations. Here
we work with trinomial stochastic implied trees9
. The location of the nodes in this
kind of tree are fixed but the transition probabilities vary stochastically as time
changes and index level moves. As time evolves, the index level moves randomly
from node to node while local volatilities (and concurrently the transition probabili-
ties) fluctuate stochastically across the tree. Starting from any initial node, the future
5. See, for example, Wiggins [1977], Hull and White [1977], Stein and Stein [1991].
6. See Cox, Ingersoll and Ross [1985], Heath, Jarrow and Morton [1992].
7. Presented in Risk Advanced Mathematics for Derivatives Conference, New York, December 1997.
8. For attempts in this direction see, for example, Dupire [1993] and Bruno Dupire in the Proceedings
of Risk Derivatives Conference, Brussels, February 1997.
9. See Derman, Kani and Chriss [1996], Kani, Derman and Kamal [1996].3
QUANTITATIVE STRATEGIES TECHNICAL NOTES
Goldman
Sachs
movements of the index and the local volatility surface must be restricted so that total
transition probabilities to all future nodes are simultaneously martingales. On the tree,
these martingale conditions can be satisfied by making an appropriate choice of the
drift parameter for every future node. In the discrete time framework defined by the
stochastic implied tree, this process step-by-step guarantees absence of arbitrage
opportunities among different option (and forward) contracts and the underlying
index.
We draw extensively on the analogy between interest rates and volatility throughout
this paper. We begin by reviewing the concept of the local (forward) volatility surface
and the effective theory of volatility which it defines. The local volatility surface is the
options world analogue of the forward interest rate curve. Standard option prices cal-
culated using today’s local volatility surface match their market prices, just as the
bond prices calculated from today’s forward rate curve match their market prices. The
dynamics of standard option prices, as defined by today’s local volatility surface,
albeit arbitrage-free, is based on the assumption of non-stochastic volatility, as por-
trayed by the static (non-random) nature of the local volatility surface. This effective
dynamics of option prices is analogous to the deterministic, but arbitrage-free, bond
price dynamics which result from a static forward rate curve. To allow stochastic
dynamics we introduce exogenous stochastic structure on the effective theory. This is
to say that we allow general (multi-factor) fluctuations of the local volatility surface as
time and spot index level change. We impose dynamical conditions which explicitly
guarantee absence of arbitrage among standard options, forwards and the underlying
index. This process will augment an effective theory of volatility to a full stochastic
theory of volatility in a manner which is the hallmark of the HJM approach to stochas-
tic interest rates.
We can think of local volatility σK,T as the market’s consensus estimate of instanta-
neous volatility at the future market level K and future time T. Local volatilities corre-
sponding to different future market levels and times together comprise the local
volatility surface. The local volatility surface indicates the fair value of future index
volatility at future market levels and times as implied by the spectrum of available
standard option (and forward contract) prices.
The relationship between the local volatilities and option prices (or implied volatili-
ties) in the options world is analogous to the relationship between the forward rates
and bond prices (or yield-to-maturities) in the fixed income world. We can calculate
the forward interest rates fT corresponding to the future times T from the spectrum of
zero-coupon bond prices BT with different maturities T, using a well-known formula
(EQ 1)
Similarly, we can calculate the local volatility σK,T corresponding to the future market
level K and time T from the spectrum of standard option prices CK,T , with different
strikes K and maturities T, using the formula
LOCAL VOLATILITY SUR-
FACE: THE EFFECTIVE THE-
ORY OF VOLATILITY
fT
1
BT
----- -
dBT
dT
-------- - – =4
QUANTITATIVE STRATEGIES TECHNICAL NOTES Sachs
Goldman
(EQ 2)
The riskfree discount rate r and the dividend yield δ in Equation 2 are both
assumed to be constant. Also, the quantities which we will discuss throughout
this paper are usually evaluated at a specific times t or spot prices S, and contain
other explicit or implicit (deterministic or stochastic) parameters which we may
omit for brevity. For example, the quantities in Equations 1 and 2 are evaluated
at the present time and spot price, hence , etc.
Equations 1 often serves as a general definition for forward rates, regardless of
the specific nature of the interest rate process. It can be shown10 that under very
general assumptions, forward rates are risk-adjusted expectations of future short
rates
(EQ 3)
The expectation is performed at the present time and with respect to a
measure known as the T-maturity forward risk-adjusted measure. The precise
description of this measure is not necessary for our purposes here. The only
thing to remember is that Equation 1 gives us a direct way for extracting these
expectations of future short rates from the traded bond prices.
Similarly, it can be shown that local volatilities are risk-adjusted expectations of
future instantaneous volatilities. More precisely, local variance σ2
K,T is a risk-
adjusted expectation of future instantaneous variance σ2
(T) at time T as
(EQ 4)
Here the expectation is performed at the present time and market
level, and with respect to a new measure which we call the K-strike and T-matu-
rity forward risk-adjusted measure, as described in Appendix A. Again the pre-
cise details about the measure are unimportant at this point, only that these
expectations can be directly extracted from the market prices of standard
options, as given by Equation 2.
A static (non-random) local volatility surface defines an effective theory of vol-
atility in the same way as a static forward rate curve defines an effective theory
for interest rates. In an effective theory, specific expectations (or integrals) of
some or all of the underlying stochastic variables are extracted from the current
prices of the traded assets, and are subsequently assumed to remain unchanged
10. See, for example, Jamshidian [1993].
σ2
K T , 2
T ∂
∂CK T ,
r δ – ( )K
K ∂
∂CK T ,
δCK T , + +
 
 
 
K2
K2
2
∂
∂ CK T ,
----------------------------------------------------------------------------------- - =
fT fT t0 ( ) = σK T , σK T , t0 S0 , ( ) =
fT E
T ( )
r T ( ) [ ] =
E
T ( )
… [ ]
σK T ,
2
E
K T , ( )
σ2 T ( )] [ =
E
K T , ( )
… [ ]5
QUANTITATIVE STRATEGIES TECHNICAL NOTES
Goldman
Sachs
as time evolves. The effective dynamics which results is based on some of the
sources of uncertainty being “effectively” integrated out of the full stochastic
theory. Let us briefly review the interest rate case first.
In the effective interest rate setting, the forward rate curve is evaluated from the
available bond prices at time t0, and is assumed to remain unchanged thereafter
as time t evolves, thus for all :
(EQ 5)
As Figure 1 illustrates, this procedure integrates all sources of interest rate sto-
chasticity out of the original theory, and therefore, the effective dynamics of the
rates in the effective theory is completely deterministic. As physical time t
elapses, the spot rate (or short rate) r(t) rolls along the static forward rate curve,
coinciding with the forward rate at time t:
(EQ 6)
The dynamics of zero-coupon bond prices is also deterministic and is described
by a simple backward equation:
(EQ 7)
This equation, with the aid of Equation 6, shows that the asset price dynamics in
the effective theory is local and arbitrage-free. Equation 7 is also the dual of the
forward equation satisfied by the zero-coupon bond prices:
(EQ 8)
The Effective Interest Rate The-
ory
t t0 ≥
fT t ( ) fT =
r t ( ) ft =
d
dt
---- - ft –
 
 BT t ( ) 0 =
d
dT
------ fT +
 
 BT t ( ) 0 =6
QUANTITATIVE STRATEGIES TECHNICAL NOTES Sachs
Goldman
The forward equation is merely a restatement of Equation 1, and holds by the
definition of the forward rates regardless of specific assumptions concerning the
behavior of interest rates.
The backward equation describes propagation forward in physical time, for a
fixed maturity. More precisely, it relates the prices of a T-maturity bond at dif-
ferent time points t, with earlier times in terms of the later ones. This is best
understood by introducing the forward propagator (or forward Green’s func-
tion) pt,t', which relates bond prices at times t and t', with , for any T-matu-
rity bond, through a simple relationship:
(EQ 9)
The forward propagator pt,t' describes bond price evolution forward in physical
time, as illustrated by Figure 2(a). It satisfies the backward and forward differ-
ential equations with boundary conditions pt,t = 1:
; (EQ 10)
and for any , the composition relation:
(EQ 11)
Similarly, the forward equation describes propagation backward in maturity
time, for a fixed physical time. More precisely, it relates the prices of bonds
with different maturities T, but at a fixed time t, with longer maturity bonds in
terms of the shorter maturity ones. The backward propagator11
φT,T' relates
11. The forward and backward propagators for a static yield curve are both simply
equal to the discount function i.e .
FIGURE 1. In an effective theory defined by a static forward rate curve,
short rate follows the instantaneous forward rates.
0 t1
r(t1)
rate
t2
r(t2)
time
fT
t t' ≤
BT t ( ) pt t' ,
BT t' ( ) =
d
dt
---- - ft –
 
 pt t' ,
0 =
d
dt'
----- - ft'
+
 
 pt t' ,
0 =
t t ˜ t' ≤ ≤
p t t' , ( ) p t t̃ , ( )p t̃ t' , ( ) =
pu v , φu v , fτ τ d
u
v
∫ –
 
 
 
exp = =7
QUANTITATIVE STRATEGIES TECHNICAL NOTES
Goldman
Sachs
zero-coupon bond prices of maturities T and T', with , at any fixed time t,
using the relation
(EQ 12)
The backward propagator φT,T' describes bond price evolution backward in
maturity time, as depicted by Figure 2(b). It also satisfies the forward and back-
ward equations with boundary conditions φT,T = 1:
; (EQ 13)
and, for any , the composition relation
(EQ 14)
In the effective volatility setting, the local volatility surface is calculated using
the spectrum of available option prices (and futures) at time t0, and is assumed
to remain unchanged thereafter as time t and index price S change:
(EQ 15)
This procedure amounts to averaging out all sources of stochastic volatility,
leaving the index price uncertainty as the only source of uncertainty left within
the theory. The resulting effective dynamics only depends on the index price
and time and, as a function of these variables, is deterministic. As the physical
T' T ≤
BT t ( ) φT T' ,
BT'
t ( ) =
d
dT
------ fT +
 
 φT T' ,
0 =
d
dT'
------- fT'
–
 
 φT T' ,
0 =
T' T̃ T ≤ ≤
FIGURE 2. Forward propagator describes the evolution of bond prices
forward in physical time. Backward propagator describes evolution of
bond prices backward in maturity time.
BT(t) BT(t')
t t'
(T)
BT' (t) BT (t)
T' T
(t)
(a) forward propagator (b) backward propagator
φT,T' : pt,t' :
φT T' ,
φ
T T ˜ ,
φ
T ˜ T' ,
=
The Effective Volatility
Theory
σK T , t S , ( ) σK T , =8
QUANTITATIVE STRATEGIES TECHNICAL NOTES Sachs
Goldman
time t elapses and index price St moves, the instantaneous volatility σ(t) follows
along the local volatility surface, as depicted in Figure 3, coinciding with the
local volatility at time t and level St:
(EQ 16)
This is consistent with an equilibrium (effective) index price process described
by the stochastic differential equation:
(EQ 17)
where µt is the index’s expected return and dZt is the standard Wiener measure
at time t. In this process the instantaneous volatility is a known (deterministic)
function of time t and index price St. Implied Tree models are the discrete
frameworks for implementing the (effective) dynamics represented by Equation
17. The dynamics of standard option prices in the effective theory is described
by the backward equation:
(EQ 18)
Since the only remaining source of uncertainty is the index price, the standard
options are completely hedgeable (using index as the hedge) within the effective
theory. Equations 16 and 18 then show that the option price dynamics in this
theory is arbitrage-free. Equation 18 is also the dual of the forward equation sat-
isfied by the standard option prices:
FIGURE 3. In an effective theory represented by a static local volatility
surface, instantaneous volatility σ(t) at timet follows the local volatility at
time t and index price St.
t1
σ(t1)
t2
σ(t2)
time
level
l e v e l
time
vol
local
(t1,S1)
(t2,S2)
σ t ( ) σt St , =
dSt
St
------- µtdt σt St , dZt + =
t ∂
∂
r δ – ( )S
S ∂
∂ 1
2
-- -σ2
S t , S2
S2
2
∂
∂
r – + +
 
 
 
CK T , t S , ( ) 0 =9
QUANTITATIVE STRATEGIES TECHNICAL NOTES
Goldman
Sachs
(EQ 19)
This forward equation is the same as Equation 2 and holds by the definition of
local volatility, regardless of any specific assumptions about the behavior of
volatility.
The forward propagator pt,S,t',S' describes the relationship between the option
prices at the two points (t, S) and (t', S'), with , for any K-strike and T-matu-
rity standard option, through the relation
(EQ 20)
The forward propagator pt,S,t',S' describes option price evolution forward in time
and index price, as illustrated by Figure 4(a). We can define the forward transi-
tion probability density function p(t,S,t',S') in terms of the forward propagator as
p(t,S,t',S') = er(t'-t)
pt,S,t',S'. It describes the total probability that the index price will
reach level S' at time t', given that the index price at time t is S. The mathemati-
cal properties of pt,S,t',S' and p(t,S,t',S') are discussed in Appendix B.
T ∂
∂
r δ – ( )K
K ∂
∂ 1
2
-- -σ2K T , K2
K2
2
∂
∂
– δ + +
 
 
 
CK T , t S , ( ) 0 =
t t' ≤
CK T , t S , ( ) pt S t' S' , , , CK T , t' S' , ( ) S' d
0
∞
∫ =
FIGURE 4. Forward propagator describes the evolution of standard prices in
physical time and index price. Backward propagator describes the evolution
of option prices in maturity time and strike price.
CK,T
CK,T
CK,T
CK,T (t',S1')
(t',S2')
(t',Sn')
(t,S)
.........
(K,T)
(t, S) (t', S')
(t,S)
(K, T) (K',T')
CK,T
CK1',T'
CK2',T'
CKn',T'
.........
(t,S)
(t,S)
(t,S)
(t,S)
(a) forward propagator (b) backward propagator
pt,S,t',S': ΦK,T,K',T':10
QUANTITATIVE STRATEGIES TECHNICAL NOTES Sachs
Goldman
The backward propagator ΦK,T,K',T' describes the relationship between prices of
two standard options corresponding to strike-maturity pairs (K,T) and (K',T'), with
, at a fixed time t and index price S, as
(EQ 21)
As Figure 4(b) illustrates, We can also define the effective theory backward tran-
sition probability density function Φ(K,T,K',T') in terms of the backward propaga-
tor as Φ(K,T,K',T') = eδ(T-T')
ΦK,T,K',T' . Appendix B discusses some of the
mathematical properties of ΦK,T,K',T' and Φ(K,T,K',T').
We can use Equation 17, either by performing simulations or by using implied
tree methods, to price and hedge complex options, with the knowledge that the
standard options initially used to derive the local volatility surface will have
model prices which match their market values. In spite of this calibration, if the
volatility has a substantial stochastic behavior, the prices and hedge ratios of most
options with path-dependent or volatility-dependent payoffs will not be accurately
represented by the effective theory results. The reason is simply that effective the-
ory results are based on the assumption that local volatilities are static or, equiva-
lently, that the instantaneous volatility is substantially a function of the market
level (and time). This is a good assumption in situations where the volatility
exhibits strong correlation to the market level and, hence, can be viewed predomi-
nantly as a function of it. For most equity index option markets, for example, this
more or less holds, specially for shorter dated options. On the contrary, in the cur-
rency options markets or in longer dated equity (and most other) options markets,
the volatility is predominantly stochastic and the effective theory of static local
volatilities is not valid. We must therefore move towards a full stochastic frame-
work by allowing general multi-factor stochastic variations of the volatility sur-
face.
To allow for stochastic dynamics we must introduce exogenous stochastic struc-
ture on the effective theory. In general, there are few restrictions on the choice of
this structure. One important restriction, which is the cornerstone of the arbitrage
framework, is the absence of any explicit future arbitrage opportunities in the final
stochastic theory. Another restriction is how close the number or the behavior of
the stochastic factors are to what is empirically observed. For now, we will con-
sider very general (but sufficiently regular) stochastic structures and discuss the
conditions which must be imposed upon them to guarantee the absence of arbi-
trage. Let us briefly examine the stochastic interest rate theory first.
Figure 5 illustrates the dynamics of the forward rates in the stochastic framework.
Here, the forward rate curve is allowed to fluctuate stochastically with several
T' T ≤
CK T , t S , ( ) ΦK T K' T' , , ,
C
K' T' ,
t S , ( ) K' d
0
∞
∫ =
TOWARDS A STOCHASTIC
THEORY OF VOLATILITY
The Stochastic Interest
Rate Theory11
QUANTITATIVE STRATEGIES TECHNICAL NOTES
Goldman
Sachs
independent stochastic factors represented by Brownian motions Wi
, i = 1, ...,n,
with factor volatilities generally depending on both maturity T and time t,
according to the stochastic differential equation:
(EQ 22)
In the family of processes described by Equation 22, the volatility coefficients
reflect the sensitivities of specific maturity forward rates to the random
shocks introduced by the Brownian motions Wi
. These coefficients are left unre-
stricted, except for mild measurability and integrability conditions, and can
depend on the past histories of the Brownian motions Wi. The drift coefficients
must also satisfy mild measurability and integrability conditions, but must
be further constrained by the no-arbitrage requirement.
The spot rate at time t, r(t), is the instantaneous forward rate at time t, i.e,
. The stochastic integral equation satisfied by the spot rate is found
by integrating Equation 22 and evaluating the result at T = t. It is given by
(EQ 23)
It has been argued by Heath, Jarrow and Morton, that there will be no explicit
arbitrage opportunities in the theory defined by Equation 23 if (and only if) the
drift coefficients are of the form:
0 t1
r(t1)
rate
r(t0)
time
FIGURE 5. In a stochastic interest rate theory spot rate r(t) follows the
instantaneous forward rate ft(t).
fT(t0)
fT(t1)
ϑ
i
T t ( )
dfT t ( ) αT t ( )dt ϑT
i
t ( )dWt
i
i 1 =
n
∑ + =
ϑ
i
T t ( )
αT t ( )
r t ( ) ft t ( ) =
r t ( ) ft 0 ( ) αt u ( ) u d
0
t
∫ ϑi
t u ( ) Wi
u d
0
t
∫ i 1 =
n
∑ + + =12
QUANTITATIVE STRATEGIES TECHNICAL NOTES Sachs
Goldman
(EQ 24)
Here , i = 1, ..., n, denote the market prices of risk, which can not explicitly
depend on maturity T but are otherwise arbitrary. Under these conditions, they
have shown that markets are complete and contingent claims prices are indepen-
dent of the market prices of risk.
Our goal is to introduce a similar stochastic structure on the local volatility sur-
face. To do so, we allow the surface to undergo stochastic fluctuations with sev-
eral independent stochastic factors, W0, W1, ...,Wn, based on the following
stochastic differential equation:
(EQ 25)
We include W0
= Z, the index price’s source of uncertainty, among the factors
so that the stochastic variations of the local volatility surface may depend on the
prevailing market level. The family of processes of Equation 25 defines a multi-
factor dynamics for the local volatility surface, as illustrated by Figure 6. These
processes can be integrated, starting from a fixed (non-random) initial local vol-
atility surface σK,T(0,S0) at time t = 0, as
αT t ( ) ϑT
i
t ( ) ϑu
i
t ( ) u d
t
T
∫ λi t ( ) +
 
 
i 1 =
n
∑ =
λi t ( )
The Stochastic Volatility
Theory
dσ2
K T , t S , ( ) αK T , t S , ( )dt θi
K T , t S , ( )dWi
t
i 0 =
n
∑ + =
FIGURE 6. In a stochastic volatility theory instantaneous volatility σ(t)
follows the local volatility σSt,t (t,St), at time t and index price St.
0 t1 time
σ(t1) σ(t0)
level
l e v e l
time
local
vol
(t1,S1)
(t2,S2)13
QUANTITATIVE STRATEGIES TECHNICAL NOTES
Goldman
Sachs
(EQ 26)
The factor volatility reflects the sensitivity of local volatilities
σK,T(t,S), across the whole surface, to the shock introduced by the Brownian
motion Wi
. Except for mild measurability and integrability conditions12
, the
family of factor volatilities are unrestricted, generally depending on time and
index price, and on the factors or their past histories. However, for the sake of
brevity we have omitted explicit references to all variables other than time t and
index price S from the expressions for factor volatilities, and we will do the
same for other quantities such as drift coefficients and local volatilities.
The spot volatility (or instantaneous volatility) at time t, σ(t), is the instanta-
neous local volatility at time t and level St, i.e
(EQ 27)
It describes the variability of index price return process, as given by the differ-
ential equation
(EQ 28)
or its integral form
(EQ 29)
where µt is the index’s expected return. Setting T = t and K = St in Equation 26
we find the stochastic integral equation satisfied by the spot volatility as
(EQ 30)
The drift coefficients must also satisfy mild measurability and inte-
grability conditions, but they must be further restricted by the requirement that
the stochastic theory described by Equations 28 and 30 disallows explicit arbi-
trage opportunities among the standard options, forwards and their underlying
index. This is similar to the HJM arbitrage conditions on the spot rate process.
12. The factor volatility functions are assumed to be positive, adapted and jointly mea-
surable with respect to the Borel σ-algebra restricted to , for some fixed maximum
time T*. They must also satisfy , i = 0, ...,n, to assure regularity of spot vol-
atility process, and certain additional integrability conditions to assure regularity of the standard
option price processes.
σ2
K T , t St , ( ) σ2
K T , 0 S0 , ( ) αK T , u Su , ( ) u d
0
t
∫ θi
K T , u Su , ( ) Wi
u d
0
t
∫ i 0 =
n
∑ + + =
θi
K T , t S , ( )
θi
K T , t S , ( )
0 t T T∗ ≤ ≤ ≤
θi
K T , ( )2 u S
u
, ( ) u d
0
T
∫ ∞ <
σ t ( ) σSt t , t St , ( ) =
dSt
St
------- µtdt σ t ( )dWt
0 + =
St S0 µuSu u d
0
t
∫ σ u ( )Su Wu
0 d
0
t
∫ + + =
σ2 t ( ) σ2
t St , 0 S0 , ( ) αt St , u Su , ( ) u d
0
t
∫ θi
t St , u Su , ( ) Wi
u d
0
t
∫ i 0 =
n
∑ + + =
αK T , t S , ( )14
QUANTITATIVE STRATEGIES TECHNICAL NOTES Sachs
Goldman
Let us briefly examine (a variation of) the HJM argument below.
The bond price dynamics corresponding to the forward rate process of Equation
85 is, by applying Ito’s lemma, described by the stochastic integral equation
(EQ 31)
The symbol here denotes the variational (or functional) derivative with
respect to the function f evaluated at u. The first term in this equation describes
precisely the effective theory bond price dynamics restricted to the fixed for-
ward rate curve fT(t) at time t. The next two terms describe the bond price
dynamics resulting from the stochastic variations of the effective theory
(defined by fT(t)) during the next infinitesimal time interval dt.
It follows from the definition of the forward rates (Equation 1) that the price of
a T-maturity zero-coupon bond with unit face, at time t, is given by
(EQ 32)
From this expression it is simple to see that for any u ( ):
(EQ 33)
Another way of seeing this is by noticing how the forward and backward propa-
gators, pt,t' and φT,T', corresponding to an otherwise fixed (non-random) forward
rate curve, respond to sudden changes of a specific forward rate fu along the
curve. It is simple to see that pt,t' satisfies the following relation, as depicted in
Figure 7(a):
(EQ 34)
and, as shown in Figure 7(b), that φT,T' satisfies the relation:
(EQ 35)
These relations combined, respectively, with Equations 9 and 12, again lead to
Equation 33.
The HJM Conditions and the
Stochastic Theory of Interest
Rates
dBT t ( ) r t ( )BT t ( )dt
δBT t ( )
δfu t ( )
--------------- - fu t ( ) d u + d
t
T
∫ + =
1
2
-- -
δ2BT t ( )
δfu t ( )δfu'
t ( )
---------------------------- - fu t ( ) d fu'
t ( ) d u d u' d
t
T
∫ t
T
∫
δ
δf
u
------- -
BT t ( ) fu t ( ) u d
t
T
∫ –
 
  exp =
t u T ≤ ≤
δBT t ( )
δfu t ( )
--------------- - B – T t ( ) =
δp t t' , ( )
δfu
------------------ p – t u , ( )p u t' , ( ) p t t' , ( ) – = =
δφT T' ,
δfu
------------- - φ – T u , φu T' ,
φT T' ,
– = =15
QUANTITATIVE STRATEGIES TECHNICAL NOTES
Goldman
Sachs
Similarly, we can show that for the second order variational deriv-
atives are given by:
(EQ 36)
The special fu-independent form of variational relations 33-36 can be directly
attributed to the special form of the functional relationship between the zero-
coupon bond prices and the forward rates as described by Equation 32. This fea-
ture underlies the special simplicity of no-arbitrage conditions in the HJM
framework.
Using Equations 22, 33 and 36 inside Equation 31 we find
(EQ 37)
If the drift coefficients satisfy the no-arbitrage conditions of Equation 24
for some set of market prices of risk , then Equation 37 shows that in terms
of the equivalent measure , defined by the Brownian motions
, i = 1, ..., n, the dynamics of zero-coupon bond prices is:
FIGURE 7. Sensitivity of the forward and backward propagators pt,t' and
φT,T' to the sudden changes of the forward rate fu.
(a) forward propagator (b) backward propagator
t t'
u
-1
t t' u u+du T' T u u+du
T' T
u
-1
t u u' T ≤ ≤ ≤
δ2BT t ( )
δfu t ( )δfu'
t ( )
---------------------------- - BT t ( ) =
dBT t ( )
BT t ( )
--------------- - r t ( )dt ϑu
i
t ( ) u d
t
T
∫  
 
i 0 =
n
∑ dWt
i
– – =
αu t ( ) ϑu
i
t ( ) ϑv
i
t ( ) v d
t
u
∫ i 1 =
n
∑ – u d
t
T
∫  
 
 
dt
αT t ( )
λi t ( )
dW
i
dWi λidt + =
Wi
t Wi
t λi u ( ) u d
0
t
∫ + =16
QUANTITATIVE STRATEGIES TECHNICAL NOTES Sachs
Goldman
(EQ 38)
Therefore, {dWi ; i = 1,...,n} defines an equivalent martingale measure under
which the rescaled bond prices for all maturities T are
jointly martingale. Under this measure the interest rate contingent claims prices
are independent of the market prices of risk and, hence, remain preference-free.
The standard option prices CK,T(t,S) are functionals of the local volatilities at
time t and market level S, just as bond prices BT(t) are functionals of the forward
rates at time t. As a result, the dynamical variations of the local volatility surface
induce correpsonding dynamical variations of the standard option prices. Dur-
ing a time interval dt, the index price moves and the local volatilities also
change. We can think of the local volatility changes as comprised of two com-
ponents. A predictable component, due to movements of time and index price
restricted to the static local volatility surface σK,T(t,S) at time t and level S, and
a non-predictable (stochastic) component due to dynamic fluctuations away
from this surface. It is somewhat simpler, but entirely equivalent, to work with
the transition probabilities, instead of option prices. The transition probability,
PK,T(t,S), describes the total probability that the index price will reach level K at
time T, given that the index price at time t is S, when both the index price and
volatility are stochastic. It is related to the option prices CK,T(t,S) through a gen-
eral and well-known13
formula:
(EQ 39)
The dynamical evolution of transition probabilities PK,T(t,S) based on the local
volatility process of Equation 26 is given by the stochastic integral equation:
(EQ 40)
13. See Breeden and Litzenberger [1978].
dBT t ( )
BT t ( )
--------------- - r t ( )dt ϑu
i
t ( ) u d
t
T
∫  
 
i 1 =
n
∑ dWt
i
– =
BT t ( ) r u ( ) u d
0
t
∫ –
 
 
 
exp
THE NO-ARBITRAGE CONDITIONS
AND THE STOCHASTIC THEORY
OF VOLATILITY
PK T , t S , ( ) er T t – ( )
K2
2
∂
∂
CK T , t S , ( ) =
dPK T , t ∂
∂PK T ,
µ t ( )S
S ∂
∂PK T , 1
2
-- -σ2 t ( )S2
S2
2
∂
∂ PK T ,
+ +
 
 
 
dt σ t ( )S
S ∂
∂PK T ,
dW0 t ( ) +
t S , ( )
= +
δPK T ,
δσ2
K' T' ,
----------------- - σ2
K' T' , d K' d T' d
0
∞
∫ t
T
∫ +
1
2
-- -
δ
2
PK T ,
δσ2
K' T' , δσ2
K'' T'' ,
------------------------------------- - σ2
K' T' , d σ2
K'' T'' , d K' d K'' d T' T'' d d
0
∞
∫ 0
∞
∫ t
T
∫ t
T
∫17
QUANTITATIVE STRATEGIES TECHNICAL NOTES
Goldman
Sachs
All the probability and local volatility expressions in this equation are evaluated
at (t,S). The first term describes the effective dynamics of the transition proba-
bilities PK,T(t,S) restricted to the fixed local volatility surface σK,T(t,S), prevail-
ing at time t and level S. The bracket symbol, , therefore, expresses the
fact that in this term the future volatility is a deterministic function of the future
time T and market level K, given by σK,T(t,S) viewed as function of these two
variables. The next two terms describe the dynamical variations of the transition
probabilities resulting from the stochastic fluctuations of the local volatility sur-
face during the next instant of time dt.
Contrary to Equation 32, in general there are no explicit expressions describing
the functional relationship between option prices and local volatilities. There-
fore, we can not directly compute the variational derivatives in Equation 40.
Instead, we can look at the variations of the forward and backward transition
probabilities with respect to the specific local volatilities. As shown in Appen-
dix C and illustrated in Figure 8, the forward transition probability p(t,S,t',S'),
associated with the non-random local volatility surface σK,T(t,S) prevailing at
time t and spot price S, has the following variational derivative with respect to
the local volatility σv,u(t,S) on the surface, corresponding to future maturity u
and market level v:
(EQ 41)
This relation holds for any u in the range , otherwise the variational
derivative is equal to zero. Similarly, the backward transition probability
Φ(K,T,K',T') satisfies, for , the relation
(EQ 42)
and zero otherwise. Using Equations 21 and 39, the standard option prices
CK,T(t,S) and transition probabilities PK,T(t,S) satisfy similar relationships for
:
(EQ 43)
and
(EQ 44)
… [ ] t S , ( )
δp t S t' S' , , , ( )
δσ2
v u ,
------------------------------- -
1
2
-- -p t S u v , , , ( )v2
v2
2
∂
∂
p u v t' S' , , , ( ) =
t u t' ≤ ≤
T' u T ≤ ≤
δΦ K T K' T' , , , ( )
δσ2
v u ,
--------------------------------------
1
2
-- -Φ K T v u , , , ( )v2
v
2
2
∂
∂
Φ v u K' T' , , , ( ) =
t u T ≤ ≤
δCK T , t S , ( )
δσ2
v u ,
---------------------------
1
2
-- -Φ K T v u , , , ( )v
2
v
2
2
∂
∂
Cv u , t S , ( ) =
δPK T , t S , ( )
δσ2
v u ,
-------------------------- -
1
2
-- -p t S u v , , , ( )v
2
v
2
2
∂
∂
p u v T K , , , ( ) =18
QUANTITATIVE STRATEGIES TECHNICAL NOTES Sachs
Goldman
in which the effective transition probabilities and correspond to
the static local volatility surface σK,T(t,S) prevailing at time t and market level
S. In arriving at Equations 43 and 44 we have also used the following identities:
(EQ 45)
(EQ 46)
(EQ 47)
FIGURE 8. Sensitivity of the forward and backward transition probabilities
p(t,S,t',S') and Φ(K,T,K',T') to the sudden changes of the local volatility
σv,u.
u v , ( ) t' S' , ( ) t S , ( )
t S , ( )
t' S' , ( )
t S , ( ) t' S' , ( )
u v , ( )
v2
v2
2
∂
∂
–
K T , ( )
K' T' , ( )
K T , ( ) K' T' , ( )
v u , ( )
v2
v2
2
∂
∂
–
K' T' , ( ) K T , ( ) v u , ( )
(a) forward (b) backward
p … ( ) Φ … ( )
PK T , t S , ( ) p t S T K , , , ( ) =
p t S T K , , , ( ) e
r T t – ( )
K
2
2
∂
∂ CK T , t S , ( ) =
Φ K T S t , , , ( ) e
δ T t – ( )
S2
2
∂
∂
CK T , t S , ( ) =19
QUANTITATIVE STRATEGIES TECHNICAL NOTES
Goldman
Sachs
As discussed in Appendix B, these identities are all consequences of the fact
that the effective theory associated with σK,T(t,S) embodies all the information
necessary for pricing standard options of all strikes and maturities correctly.
Taking the variational derivatives of both sides of Equations 41 and 42 with
respect to the local volatility σv',u' we find the second order variational deriva-
tives as
(EQ 48)
for any , and
(EQ 49)
for . Figure 9 gives a graphical depiction of these identities. The
standard option prices CK,T(t,S) and transition probabilities PK,T(t,S) satisfy
similar relationships for :
(EQ 50)
(EQ 51)
Using these relations, Appendix D proves that Equation 40 leads to
δp t S t' S' , , , ( )
δσ2
v u , δσ2
v' u' ,
-------------------------------- - 1
4
-- -p t S u v , , , ( )v
2
v
2
2
∂
∂ p u v u' v' , , , ( )v'
2
v'
2
2
∂
∂ p u' v' t' S' , , , ( ) =
t u u' t' ≤ ≤ ≤
δΦ K T K' T' , , , ( )
δσ2
v u , δσ2
v' u' ,
--------------------------------------
1
4
-- -Φ K T v u , , , ( )v
2
v
2
2
∂
∂
Φ v u v' u' , , , ( )v'
2
v'
2
2
∂
∂
Φ v' u' K' T' , , , ( ) =
T' u' u T ≤ ≤ ≤
FIGURE 9. Second order variational derivatives of the forward and
backward transition probabilities p(t,S,t',S') and Φ(K,T,K',T') with
respect to the local volatilities.
K' T' , ( )
v' u' , ( )
v'2
v'2
2
∂
∂
–
v u , ( )
v2
v2
2
∂
∂
–
K T , ( ) t S , ( )
u v , ( )
v2
v2
2
∂
∂
–
u' v' , ( )
v'2
v'2
2
∂
∂
–
t' S' , ( )
(a) forward (b) backward
t u u' T ≤ ≤ ≤
δCK T , t S , ( )
δσ2
v u , δσ2
v' u' ,
-------------------------------- -
1
4
-- -p t S u v , , , ( )v
2
v
2
2
∂
∂
p u v u' v' , , , ( )v'
2
v'
2
2
∂
∂
Cv' u' ,
t S , ( ) =
δPK T , t S , ( )
δσ2
v u , δσ2
v' u' ,
-------------------------------- -
1
4
-- -p t S u v , , , ( )v
2
v
2
2
∂
∂
p u v u' v' , , , ( )v'
2
v'
2
2
∂
∂
p u' v' T K , , , ( ) =20
QUANTITATIVE STRATEGIES TECHNICAL NOTES Sachs
Goldman
(EQ 52)
if and only if, for any S, K and , the drift functions αK,T(t,S) satisfy the fol-
lowing no-arbitrage conditions
(EQ 53)
where and for i = 1, ...,n are arbitrary but independent of K and T,
and where the equivalent measure { } is defined by
; (EQ 54)
The quantities denote the market prices of risk associated with the volatility
risk factors Wi, i = 1, ..., n, while µ - (r-δ) is the market price of risk associated
with the index price risk factor W0
. Equation 52 shows that under the no-arbi-
trage conditions the measure { ; i = 1, ...,n} is an equivalent martingale
measure, with respect to which the rescaled index price and rescaled option
prices for all strikes and maturities are simultaneously martingales.
These no-arbitrage conditions in the present case are significantly more
involved than the HJM no-arbitrage conditions described in the previous sec-
tion. The basic reason is that local volatilities span a (two-dimensional) surface
on which (forward and backward) propagation depends, in a rather complicated
and non-linear manner, on the structure of local volatilities across the whole sur-
face. This is evident by the apparent complexity of Equations 44 and 51 as com-
pared to the simplicity of the corresponding Equations 33 and 36 in the interest
rate framework. It is, therefore, rather difficult to use the no-arbitrage conditions
for stochastic volatility in their continuous form directly.
In the next section we introduce Stochastic Implied Trees as a discrete-time
framework for describing arbitrage-free stochastic variations of the local vola-
tility surface.
Figure 11 gives a schematic illustration of the dynamics in a stochastic volatility
theory. As the physical time moves forward, the index price changes and, simul-
taneously, all local volatilities on the volatility surface undergo multi-factor sto-
chastic variations.
To provide a more quantitative description of this stochastic dynamics we
choose to work within a discrete-time framework described by a Stochastic
dPK T , σ t ( )S
S ∂
∂PK T ,
dW0
δPK T ,
δσ2
K' T' ,
----------------------σ2
K' T' , θ
K' T' ,
i
K' d T' d W
i
d
0
∞
∫ t
T
∫
i 0 =
n
∑ + =
t T ≤
α
K T ,
t S , ( ) θ
i
K T , t S , ( )
1
p t S T K , , , ( )
---------------------------- - θ
i
K' T' , t S , ( )p t S T' K' , , , ( )K'2
K'2
2
∂
∂
p T' K , ' T K , , ( ) K' d T' d
0
∞
∫ t
T
∫ Π
i
–
 
 
 
 
 
i 0 =
n
∑ – =
Π
0
0 = Π
i
W
i
dW
0
dW
0 µ t ( ) r – δ + ( )
σ t ( )
--------------------------------dt + = dW
i
dW
i
Π
i
dt + =
Π
i
dW
i
StOCHASTIC IMPLIED TREES21
QUANTITATIVE STRATEGIES TECHNICAL NOTES
Goldman
Sachs
Implied Tree. These trees are extensions of the standard (non-stochastic)
implied trees, which are used to describe effective volatility models (see Der-
man, Kani and Chriss [1996]). Figure 12 shows an example of a 1-year, 5-
period standard implied trinomial tree which is calibrated to a market where at-
the-money implied volatility is 25% and there is an implied volatility skew of
0.5% point per 10 strike points. In an implied trinomial tree the location of the
nodes, or the state space, is more or less arbitrarily. Once the state space is
fixed, however, the transition probabilities at different nodes are determined
from the requirement that standard options and forwards with strike prices coin-
ciding with those nodes and maturing at different periods of the tree all have
prices using the tree which match their market prices. Since local volatility at
any node depends on the nodal levels and the transition probabilities to the
nearby nodes, the local volatilities at different nodes are also determined in this
way.
Stochastic implied trinomial trees are extensions of the implied trinomial tree in
which the transition probabilities are, in addition, allowed to vary stochastically,
with several stochastic factors, as time elapses and index level moves. The
index level is allowed to move randomly from node to node, while the local vol-
atilities, and simultaneously the transition probabilities corresponding to the
future nodes, all vary stochastically across the tree. This behavior is shown in
Figure 13.
Starting from any initial node, the possible future movements of the local vola-
tility surface must be restricted to guarantee absence of any arbitrage opportuni-
ties in the discrete theory represented by the stochastic implied tree. As
discussed earlier, this is equivalent to the requirement that the total transition
probabilties to all future nodes be simultaneously martingales on the tree. This
FIGURE 11. Schematic illustration of the dynamics of the index price and
local volatility surface in a stochastic volatility theory.
time22
QUANTITATIVE STRATEGIES TECHNICAL NOTES Sachs
Goldman
is also the same as the requirement that all rescaled standard option prices be
simultaneously martingales on the tree. As Figure 14 shows, during the time
interval ∆t, the spot price will move randomly (by amount ∆S) to one of the
nearby nodes and, at the same time, the local volatility surface will assume one
of its N possible configurations, w1
, ...,wN
. As a result, the total transition prob-
ability PK,T(t,S) to any given future node (K,T) also moves to one of its several
possible values P(i)
K,T(t+∆t, S+∆S), i = 1, ..., M, during this time interval. To
guarantee no-arbitrage, PK,T must be a martingale (fair game), that is it must
equal the expectation , under some (equivalent) measure, of its future values
FIGURE 12. Example of an Implied Trinomial Tree describing an effective
volatility theory.
100.00
83.80
119.34 119.34 119.34 119.34
100.00 100.00 100.00 100.00
142.41 142.41 142.41
70.22 70.22 70.22
169.95 169.95
58.84 58.84
49.31
202.81
83.80 83.80 83.80
state space:
0.249
0.240 0.236 0.235
0.249 0.247 0.247
0.224 0.221
0.313 0.298
0.188
0.327
0.264 0.269 0.272
local volatilities:
0.259
0.241 0.236 0.233
0.259 0.255 0.255
0.214 0.209
0.392 0.358
0.160
0.425
0.287 0.296 0.304
0.241
0.220 0.213 0.209
0.241 0.236 0.236
0.188 0.181
0.400 0.359
0.123
0.438
0.274 0.285 0.294
probabilities: probabilities:
forward diffusion down forward diffusion up
0.000
1.000 0.285 0.278
0.000 0.306 0.301
1.000 0.253
0.000 0.000
1.000
0.000
0.350 0.000 0.000
0.189
0.246
0.275
0.301
0.339
0.423
0.000
0.000
1.000
0.000
0.000 0.000 0.176
0.000 0.200 0.195
0.000 0.000
1.000 0.331
0.000
1.000
0.236 0.244 1.000
0.000
0.150
0.174
0.195
0.227
0.298
0.363
1.000
0.000 probabilities: probabilities:
backward diffusion up backward diffusion down23
QUANTITATIVE STRATEGIES TECHNICAL NOTES
Goldman
Sachs
P(i)
K,T for all the future nodes (K,T) on the tree.
To make positivity manifest, it is more convenient to redefine the drift and vola-
tility functions in Equation 25 as and , l = 0,
FIGURE 13. In a Stochastic Implied Tree, as the index moves from node A to
node B in a single time step, the local volatilities and transition
probabilities, for every node on the future subtree beginning at node B,
vary stochastically with multiple stochastic factors.
A
B
t t +∆t
PK,T
P(1)
K,T
P(M)
K,T
FIGURE 14. During a time step ∆t, the total transition probability PK,T will
move to one of M values P(i)
K,T , i = 1, ...,M, as index price moves
randomly to one of the nearby nodes and the local volatility surface
assumes one of N possible configurations.
t t +∆t
w
w1
wN
Our Notation in Discrete Time
αK T , αK T , σK T ,
2
→ θ
l
K T , θ
l
K T , σK T ,
2
→24
QUANTITATIVE STRATEGIES TECHNICAL NOTES Sachs
Goldman
..., n, and begin by discretizing the following continuous-time differential equa-
tion:
(EQ 55)
We let the integer pair (i,j) label the node (ti,Sj) describing the current location
(i.e (t,S)) of the index at the ith
step of the simulation. We also let the pair (n,m)
label the future node (tn,Sm) corresponding the future time and level (i.e (T,K)).
Then the discrete form of Equation 55 can be written as
(EQ 56)
The vector (∆Wi
0
, ∆Wi
1
, ..., ∆Wi
n
) is random and is drawn, at time i, from the
sample space of the increments of n independent Brownian motions Wl.
The volatility parameters are pre-specified but the drift parameters
must be determined from the no-arbitrage requirements that the total
probabilities of arriving at the future node (n,m) from the (fixed) ini-
tial node (i,j) must be jointly martingales for all future nodes (n,m). As we shall
argue below, these martingale conditions are precisely enough to completely
determine all the drift parameters step by step during the simulation process.
A Stochastic Implied Tree simulation begins with the construction of a trino-
mial implied tree calibrated to today’s prices of standard options and forwards.
The simulation begins at the node (0,0) of this tree. During the first simulation
step the drift parameters , for all future nodes (m,n), are determined
from the martingale conditions on the total probabilities . Figure 15
illustrates that the drift parameter is determined from the martingale
condition for This also guarantees that the transition probabilities
and are martingales. The reason is that these probabilities
are constrained by two extra conditions which must hold irrespective of the spe-
cific behavior of the local volatilities:
(EQ 57)
The first condition is the normalization condition, requiring that the sum of the
three total transition probabilities at time t1 must be unity. The second is the for-
ward condition, requiring that the t1-maturity forward price at time t0 must
match its risk-neutral value.
dσ2
K T , t S , ( )
σ2
K T , t S , ( )
----------------------------- - αK T , t S , ( )dt θl
K T , t S , ( )dWt
l
l 0 =
n
∑ + =
∆σ
2
m n , i j , ( ) σ
2
m n , i j , ( ) αm n , i j , ( )∆ti θm n ,
l
i j , ( )∆Wi
l
l 0 =
n
∑ + =
θm n ,
l
i j , ( )
αm n , i j , ( )
Pm n , i j , ( )
αm n , 0 0 , ( )
Pm n , 0 0 , ( )
α0 0 , 0 0 , ( )
P1 2 , 0 0 , ( )
P1 1 , 0 0 , ( ) P1 0 , 0 0 , ( )
P1 0 , 0 0 , ( ) P1 1 , 0 0 , ( ) P1 2 , 0 0 , ( ) + + 1 =
P1 0 , 0 0 , ( )S1 0 , P1 1 , 0 0 , ( )S1 1 , P1 2 , 0 0 , ( )S1 2 , + + S0 0 , e
r δ – ( ) t1 t0 – ( )
=25
QUANTITATIVE STRATEGIES TECHNICAL NOTES
Goldman
Sachs
In a similar way, the three drift parameters , and
are determined from the martingale conditions of the three total transition prob-
abilities , and . The remaining transition probabil-
ities and will then also be martingales due to the
normalization and forward conditions at time t2. In this way all drift parameters
will be determined during the first simulation step. Finally, to com-
plete this step we draw a random vector (∆W0
0, ∆W0
1, ..., ∆W0
n) from the sam-
ple space of the increments of Wi
at time t0, and use this vector to
simultaneously arrive at a (random) new location for the index price and new
values for all future local volatilities. Equation 56 is used directly with i = j = 0
to calculate the new local volatility values from this choice of the random vec-
tor. As for the index price, we use the random number ∆W0
0
to determine which
of the three possible future nodes (i.e (1,2), (1,1) or (1,0)) does the index price
moves to during time interval ∆t. Figure 16 gives one simple possible method
for doing this starting from an arbitrary initial node (i,j). First ∆Wi
0
is renormal-
ized to represent a uniformly-distributed random number between 0 and 1. Let
Pu(i,j), Pm(i,j) and Pd(i,j) denote the one period transition probabilities, prevail-
ing at time ti and index price Sj, from the node (i,j) to the up, middle and down
nodes at time ti+1. We then compare our random number with these three prob-
abilities. If it is smaller than Pd(i,j), we move the index price to the down node.
On the other hand, if the random number is greater than the sum Pu(i,j) +
Pm(i,j), we allow the index price to move to the up node. In every other case we
move the index price to the middle node at the next time period.
FIGURE 15. The drift parameter α0,0(0,0) in a Stochastic Implied Tree is
determined from the martingale condition on the total transition
probability P1,2(0,0).
(0,0)
(1,2)
(0,0)
(1,2)
(0,0)
(1,2)
a0,0(0,0)
P1,2 (0,0) is martingale
α1 2 , 0 0 , ( ) α1 1 , 0 0 , ( ) α1 0 , 0 0 , ( )
P2 4 , 0 0 , ( ) P2 3 , 0 0 , ( ) P2 2 , 0 0 , ( )
P2 1 , 0 0 , ( ) P2 0 , 0 0 , ( )
αm n , 0 0 , ( )26
QUANTITATIVE STRATEGIES TECHNICAL NOTES Sachs
Goldman
We can continue this procedure, step-by-step, for any point (i,j) along a simu-
lated path through the stochastic implied tree. First, all the drift parameters
are determined from the martingale conditions on . Appen-
dix E gives the necessary details for doing this calculation. Subsequently, these
drift parameters are used to generate arbitrage-free (random) movements of the
future local volatility surface as the index price moves randomly forward across
the tree. We can generate many such sample paths through the tree. Along each
path, the movements of the index price and the local volatility surface are ran-
dom realizations of an arbitrage-free dynamics, which step-by-step guarantees
absence of arbitrage opportunities among different standard option (and for-
ward) contracts and their underlying index within the discrete time framework
of the stochastic implied tree.
Consider a one-factor stochastic volatility model with a lognormal volatility of
volatility structure, as described by the following pair of stochastic differential
equations:
where . For the purpose of this example we take the volatility
coefficient to be constant, so that the factor W1
has the interpretation of a
simultaneous constant (proportional) shift in all local volatilities. All the other
quantities can depend on t, S, factors W0
and W1
or their past values. More spe-
cifically, we consider a 1-year, 5-period example with the initial term and strike
structure of volatility given by an at-the-money implied volatility of 20% and a
constant skewness of 0.5% per 10 strike points. For instance, initially a 80 strike
option of any maturity has implied volatility of 21%. Let the riskfree discount
rate be equal to 10%, dividend yield 5% and the volatility (of volatility) param-
FIGURE 16. Determining which node the index price will go to during one
simulation step using the renormalized random number ∆Wi
0
.
(i, j)
(i+1, j+2) if ∆Wi
0
>= Pm + Pd
(i+1, j+1) if ∆Wi
0
>= Pd and ∆Wi
0
< Pm + Pd
(i+1, j) if ∆Wi
0 < Pd
Pu = Pu
(i,j)
Pd = Pd
(i,j)
Pm = Pm
(i,j)
αm n , i j , ( ) Pm n , i j , ( )
A SIMPLE EXAMPLE
dS
S
----- - µdt σdW
0
+ =
dσ
2
K T ,
σ
2
K T ,
---------------- - αK T , dt θdW
1
+ =
σ t ( ) σt St , t St , ( ) =
θ27
QUANTITATIVE STRATEGIES TECHNICAL NOTES
Goldman
Sachs
eter = 30%. We choose the state space of the stochastic implied trinomial tree
to be the same as a standard (CRR- type) trinomial tree with constant volatility
of 20%. Figure 17 shows this state space. It also shows the local volatilities and
total transition probabilities, corresponding to various nodes of this tree, at the
initial time t = 0. As we expect, local volatilities increase as the index level
decreases roughly twice as fast as implied volatilities. Also the probability dis-
tribution is skewed (around the forward price) towards the lower index levels.
The first step toward the construction of the stochastic implied tree is to deter-
mine the drift coefficients at time t0 = 0. Appendix E gives the for-
mulas for directly calculating these coefficients, which are shown in Figure 18.
θ
FIGURE 17. The state space of a Stochastic Implied Trinomial Tree, the
local volatility surface and the total transition probability distribution on
the tree at the initial time t = 0.
100.00
86.81
115.19 115.19 115.19 115.19
100.00 100.00 100.00 100.00
132.69 132.69 132.69
75.36 75.36 75.36
152.85 152.85
65.43 65.43
56.80
176.06
86.81 86.81 86.81
state space:
0.199
0.191 0.189 0.188
0.199 0.197 0.197
0.180 0.177
0.251 0.240
0.155
0.263
0.211 0.215 0.218 .
local vols σm,n(0,0):
1.000
0.182
0.275 0.281 0.267 0.251
0.493 0.376 0.311 0.271
0.071 0.112 0.135
0.066 0.070 0.083
0.016 0.037
0.026 0.028
0.011
0.003
0.197 0.206 0.232
total probs Pm,n(0,0):
αm n , 0 0 , ( )28
QUANTITATIVE STRATEGIES TECHNICAL NOTES Sachs
Goldman
We can justify the numbers by examining what can happen to the total transition
probabilities during the next time interval ∆t. All local volatilities will simulta-
neously move, with probability of 1/2, to their up values, , or their
down values, , as given by
FIGURE 18. The first step of the Stochastic Implied Tree construction
consists of determining all the drift coefficients αm,n(0,0), at time t0 = 0,
from the martingale conditions for the total probabilities Pm,n(0,0).
1.000
0.182
0.275 0.281 0.267 0.251
0.493 0.376 0.311 0.271
0.071 0.112 0.135
0.066 0.070 0.083
0.016 0.037
0.026 0.028
0.011
0.003
0.197 0.206 0.232
total probs Pm,n(0,0):
-0.044
-0.184 -0.037 0.009
0.139 0.072 0.063
-0.298 -0.194
-0.369 -0.195
-0.381
-0.452
-0.043 -0.051 -0.232
drifts αm,n(0,0):
choose a random vector (∆W0, ∆W1) -> (up, up)
0.199
0.191 0.189 0.188
0.199 0.197 0.197
0.180 0.177
0.251 0.240
0.155
0.263
0.211 0.215 0.218 .
local vols σm,n(0,0):
step 1
σ
u ( )
m n , 0 0 , ( )
σ
d ( )
m n , 0 0 , ( )
σ
u d , ( )
m n , 0 0 , ( ) σm n , 0 0 , ( ) αm n , 0 0 , ( )
1
2
-- -θ
2
–
 
 ∆t θ ∆t ±
 
 
 
exp =29
QUANTITATIVE STRATEGIES TECHNICAL NOTES
Goldman
Sachs
with given in Figure 18. As a result, all transition probabilities also
change across the tree, simultaneously moving to their up values, ,
or to their down values, , each with probability of 1/2. Figure 19
shows that with the present choice of drift coefficients the initial total probabili-
ties are precisely equal to the average value of their up and down values. To
complete the step 1 we draw a pair of independent random numbers between 0
and 1, say (0.853, 0.612). Since 0.853 is greater than the sum of prevailing
down and middle probabilities, 0.493+0.232 = 0.725, as discussed in Figure 16
we move the index to the node (1,2). Also, since 0.612 is greater than 1/2 we
1.000
0.175
0.343 0.278 0.243 0.220
0.346 0.303 0.256 0.226
0.103 0.142 0.154
0.107 0.089 0.102
0.027 0.055
0.046 0.042
0.021
0.005
0.197 0.209 0.311
up total probs P(u)
m,n(0,0):
1.000
0.190
0.206 0.284 0.291 0.282
0.640 0.448 0.367 0.315
0.038 0.082 0.116
0.026 0.051 0.063
0.006 0.018
0.006 0.014
0.001
0.001
0.198 0.203 0.154
down total probs P(d)
m,n(0,0):
1.000
0.182
0.275 0.281 0.267 0.251
0.493 0.376 0.311 0.271
0.071 0.112 0.135
0.066 0.070 0.083
0.016 0.037
0.026 0.028
0.011
0.003
0.197 0.206 0.232
average total probs (P(u)
m,n(0,0)+P(d)
m,n(0,0))/2:
FIGURE 19. Up- and down- values of local volatilities and total transition
probabilities corresponding the first simulation step.
0.226
0.210 0.215 0.216
0.237 0.231 0.230
0.192 0.194
0.264 0.262
0.161
0.270
0.240 0.244 0.236 .
up local vols σ(u)
m,n(0,0):
0.168
0.156 0.159 0.160
0.175 0.171 0.170
0.142 0.144
0.195 0.194
0.120
0.200
0.178 0.181 0.175 .
down local vols σ(d)
m,n(0,0):
αm n , 0 0 , ( )
P
u ( )
m n , 0 0 , ( )
P
d ( )
m n , 0 0 , ( )30
QUANTITATIVE STRATEGIES TECHNICAL NOTES Sachs
Goldman
move all local volatilities to their up values, before we begin the next simulation
step. The step 2 of the simulation is precisely the same as step 1, except con-
fined to the subtree that begins at the node (1,2). As shown in Figure 20, again
the martingale conditions on the total probabilities are used to solve
for the drift coefficients at time t1 = 0.25, and then these coefficients,
together with a pair of random numbers, are used to determine jointly the new
values for the index price and the future local volatilities. Steps 3 and 4 are also
FIGURE 20. During the step 2 of the simulation, the drift coefficients
αm,n(1,2), at time t1 = 0.25, are determined from the martingale
conditions for the total probabilities Pm,n(1,2).
0.210 0.215 0.216
0.231 0.230
0.192 0.194
0.161
0.240
local vols σm,n(1,2):
0.089
1.000 0.436 0.336 0.273
0.363 0.205 0.193
0.301 0.296 0.271
0.030
0.077 0.129
0.015
0.085
total probs Pm,n(1,2):
-0.044 0.189 0.051
-0.229 0.016
-0.186 -0.017
-0.299
-0.365
drifts αm,n(1,2):
choose a random vector (∆W0, ∆W1) -> (middle, down)
step 2
Pm n , 1 2 , ( )
αm n , 1 2 , ( )31
QUANTITATIVE STRATEGIES TECHNICAL NOTES
Goldman
Sachs
quite similar and their results have been shown in Figures 21 and 22, repsec-
tively.
In this example, we chose a simple two-state (up and down) representation for
the stochastic movements of the local volatility surface during the time step .
FIGURE 21. During the step 3 of the simulation, the drift coefficients
αm,n(2,3), at time t2 = 0.50, are determined from the martingale
conditions for the total probabilities Pm,n(2,3).
0.192 0.186
0.197
0.164 local vols σm,n(2,3):
0.048
1.000 0.529 0.389
0.213 0.213
0.258 0.298
0.051
0.001
total probs Pm,n(2,3):
-0.044 0.113
-0.235
-0.182 drifts αm,n(2,3):
choose a random vector (∆W0
, ∆W1
) -> (up, up)
step 3
∆t32
QUANTITATIVE STRATEGIES TECHNICAL NOTES Sachs
Goldman
We could instead choose any equivalent representation of the same process with
m states, for any integer m > 1. There are infinite number of equivalent repre-
sentations for any choice of m. If the model is well-behaved, these discrete rep-
resentations should all converge to the same continuous-time process as goes
to zero. However, a representation with large number of states may converge
substantially faster than the two-state representation we chose here. Table 1
FIGURE 22. During the step 4 of the simulation, the drift coefficients
αm,n(3,5), at time t3 = 0.75, are determined from the martingale
conditions for the total probabilities Pm,n(3,5).
0.180 local vols σm,n(3,5):
0.183
1.000 0.584
0.232
total probs Pm,n(3,5):
-0.044 drifts αm,n(3,5):
choose a random vector (∆W0
, ∆W1
) -> (down, - )
step 4
∆t33
QUANTITATIVE STRATEGIES TECHNICAL NOTES
Goldman
Sachs
shows the calibration results for a 50000 path simulation on the 5-period tree
described above.
TABLE 1. Calibration results of a 50000-path simulation on a 1-year, 5-
period Stochastic Implied Tree.
The fourth and fifth columns give, respectively, the standard (non-stochastic)
implied trinomial tree and the Stochastic Implied Tree results for a series of
standard European-style call and put options used to calibrate the trees. The
results are seen to agree well.
CAVIAT: Since the location of the nodes (i.e the state space) of the stochastic
implied trinomial tree is fixed throughout, it may not be possible to fit very
large local volatilities, which may occur at various nodes and at different times
during the simulation, with transition probabilities which lie between 0 and 1. In
such cases, we must overwrite the unacceptable transition probabilities (or,
equivalently, the local volatilities) at those nodes14. Even though, this overwrite
procedure makes for an imperfect calibration to the initial smile (and, theoreti-
cally, a violation of arbitrage), it must be diligently adhered to, in order to keep
the simulation process meaningful. We can define overwrite ratio as the number
of overwrites per future node, per simulation path. In the previous example, the
overwrite ratio for 5 periods and 50000 paths is found to be 2.7%, indicating
Strike Price
Option
Type
Black-Scholes
Price
Standard
Implied Tree
Price
Stochastic
Implied Tree
Price
130 call 1.142 1.118 1.176
120 call 2.629 2.764 2.775
110 call 5.332 5.529 5.556
100 call 9.628 9.395 9.432
90 put 2.452 2.566 2.556
80 put 0.840 0.936 0.928
70 put 0.202 0.244 0.230
14. This also occurs in the standard implied trees. See, for instance, Derman, Kani and Chriss
[1996].34
QUANTITATIVE STRATEGIES TECHNICAL NOTES Sachs
Goldman
that only a relatively small portion of the calculated local volatilities have been
overwritten.
Consider a realized variance forward contract15, defined as a forward contract
on the realized variance of index returns, , with strike price K and payoff
at the contract maturity. Table 2 shows the valuation results for a 1-
year realized variance contract with zero strike price, using 20-period, 10000
path stochastic implied tree simulations with four different volatility of volatil-
ity parameters θ = 0%, 20%, 30%, 50%. To make the results more clear, we
choose a flat initial volatility smile with a constant implied volatility of 20% for
all standard European options. Also the discount rate and dividend yield are
both chosen to be zero.
TABLE 2. Prices of a zero-strike realized variance forward contract for
different values of the volatility of volatility parameter.
It is clear from this table that the price of a realized variance forward contract is
independent of the volatility of volatility parameter, and is what one would
expect from a static 20% flat initial implied volatility surface. In fact, it can be
shown that under very general conditions (see footnote 14) the price of this for-
ward contract depends only on the initial volatility surface and not on the spe-
cific stochastic aspects of the volatility process. More precisely, it’s price equals
the discounted value of the expected (equilibrium) total index return variance
during the life of the contract. As discussed earlier, this expectation is fully
embodies in today’s local volatility surface. Therefore, we are able to price this
forward contract by using an effective theory (θ = 0), as the second column in
the table indicates. This is quite analogous to our ability to price index forwards
contracts using the static initial forward curve without any specific knowledge
of the stochastic behavior of the future index prices, or to price straight bonds
using the initial yield curve with no specific knowledge of the behavior of future
interest rates.
Now consider a realized variance (call) option contract with strike price K
whose payoff at maturity is given by . Table 3 shows the valua-
15. See also Investing in Volatility, Derman etal. [1996].
θ 0% 20% 30% 50%
price 399.81 400.37 401.10 400.69
Pricing of Some Contracts
with Payoffs Based on Realized
Volatility
Σ
2
Σ
2
K – ( )
Max Σ
2
K – 0 , ( )35
QUANTITATIVE STRATEGIES TECHNICAL NOTES
Goldman
Sachs
tion results for 1-year realized variance call options with different strike prices,
under precisely the same conditions as before.
TABLE 3. Prices of realized variance call option contracts with different
strike prices and volatility of volatility parameters.
According to this table the price of a realized variance option contract increases
with the volatility of volatility parameter. This result should be expected as most
options’ prices increase when their underlyer price becomes more volatile. Fur-
thermore, like most options, the pricing and hedging of a realized variance
option contract depends crucially on our choice of the stochastic volatility
model.
Appendix D gives conditions for the existence and uniqueness of an equivalent
martingale measure in multi-factor stochastic volatility models. Under these
conditions the markets are complete and, given a contingent claim C, there
exists an admissible self-financing trading strategy (Harrison and Pliska [1981])
involving the index S, the money market account B, and (any) n different stan-
dard options , i = 1,...,n, which replicate this contingent claim:
a.e.
This replication strategy is dynamical, so that the hedge ratios NB, NS and Ni, i =
1, ..,n, are in general functions of time and other dynamical variables.
To find the hedge ratios NS and Ni we must separately move the index price S
and introduce n independent shocks Wi (possibly corresponding to the n inde-
pendent factors) to the initial local volatility surface, and subsequently reprice
the contingent claim and the n hedge standard options. For the simple model in
our examples, we find these hedge ratios from solving the following system of
0% 20% 30% 50%
400 0.00 48.336 65.784 95.742
500 0.00 14.745 31.221 56.096
600 0.00 3.391 11.780 25.211
700 0.00 0.203 1.682 4.654
HEDGING THE INDEX AND
VOLATILITY RISKS IN STO-
CHASTIC VOLATILITY MOD-
ELS
Ci CKi Ti , =
NBB NSS NiCi
i 1 =
n
∑ + + C =36
QUANTITATIVE STRATEGIES TECHNICAL NOTES Sachs
Goldman
equations
This system has a unique solution if the sensitivity matrix on the right hand side
is non-singular. This is true if , i.e when the sensitivity of the
option to a parallel shift in the local volatility surface is positive. This condition
holds for any standard option with non-zero strike price.
In the previous example, all instantaneous changes of the volatility surface are
caused by a single source of randomness, a parallel shift factor. However,
empirical analyses16
of the daily changes of the volatility surface for index
options reveals other important sources of randomness. A more realistic sto-
chastic volatility model may be, for example, given by the following pair of sto-
chastic differential equations:
where and are all constants. The first factor has
the same interpretation as before, whereas the second and third factors may be
interpreted as the term structure factor and skewness factor, respectively. The
shocks to the local volatility surface resulting from these factors are shown in
the figure below:
16. To be presented in an upcoming Quantitative Strategies Research Note.
1 C1 ∂ S ∂ ⁄
0 C1 ∂ W
1
∂ ⁄
NS
N1
C ∂ S ∂ ⁄
C ∂ W
1
∂ ⁄
=
C1 W
1
∂ ⁄ ∂ 0 >
MORE REALISTIC STOCHAS-
TIC VOLATILITY MODELS
dS
S
----- - µdt σdW
0
+ =
dσ
2
K T , t S , ( )
σ
2
K T , t S , ( )
----------------------------- - αK T , t S , ( )dt θ1dW
1
θ2e
λ T t – ( ) –
dW
2
θ3e
η K S – ( ) –
dW
3
+ + + =
σ t ( ) σt St , t St , ( ) = θ1 θ2 θ3 λ η , , , ,
(a) parallel shift (b) term structure (c) skewness
K
T
σK,T σK,T σK,T
K K
T T
K
θ37
QUANTITATIVE STRATEGIES TECHNICAL NOTES
Goldman
Sachs
In this paper we discussed an arbitrage pricing approach to contingent claims
valuation with stochastic volatility similar to the Heath-Jarrow-Morton (HJM)
methodology for stochastic interest rates. We began with a continuous time
economy with multiple factors, and posited a general multi-factor continuous
time stochastic process for the evolution of the local volatility surface. We char-
acterized the conditions which guarantee absence of arbitrage opportunities
among the various option and forward contracts defined on the underlying
index. Under these conditions markets are complete and contingent claim valua-
tion is preference-free. However, these no-arbitrage conditions are non-linear
and difficult to use in their continuous form. We then introduced the Stochastic
Implied Tree as a discrete-time framework for implementing our family of mod-
els. Starting from any initial node, we can guarantee absence of future arbitrages
by choosing appropriate drift parameters for every future node. This procedure
guarantees arbitrage-free future movements of the index and local volatility sur-
face in the discrete-time world defined by the stochastic implied tree. We can
use Stochastic Implied Trees to price contingent claims with payoffs which
depend on the index and index volatility, when the volatility surface is skewed
and stochastic. The resulting contingent claim prices are independent of the
market prices of risk. They are also consistent with the current market prices of
all standard options and forwards defined on the underlying index and with the
absence of any future arbitrage opportunities.
This appendix provides expectation definitions for local volatility. It begins
with Equation 2 as the definition of local volatility and derives the expectation
relationships between local volatilities and future instantaneous volatilities,
given the assumption that the equivalent martingale measure exists.
Under the equivalent martingale measure, the index price evolution is given by
the stochastic differential equation
(EQ 58)
where the riskless discount rate r and continuously compounded dividend yield
δ are assumed to be constant, is the instantaneous volatility at time t and
is a standard Brownian motion under this measure, as discussed in the
text. Let denote the expectation corresponding to this measure, given
the information available at time t (with the index level at S = St). Aside from
the spot index level, the information at time t generally includes the past index
levels, the values of the n (independent) stochastic factors Wi
(governing the
stochastic behavior of volatility) and their past histories. Under the equivalent
martingale measure rescaled option prices are martingales. Therefore, the price,
SUMMARY
APPENDIX A: Expectation Defi-
nitions of Local Volatility
dSt
St
------- r δ – ( )dt σtdZt + =
σt
Z W
0
=
E Et S , =38
QUANTITATIVE STRATEGIES TECHNICAL NOTES Sachs
Goldman
, at time t and market level S of a standard European-style (call)
option, with strike K and maturity T, with terminal value
is given by
(EQ 59)
Differentiating this equation once with respect to K gives
(EQ 60)
where θ(.) is the Heaviside function. Differentiating twice with respect to K
gives
(EQ 61)
where δ(.) is the Dirac delta function. Lastly, differentiating with respect to T
gives
(EQ 62)
A formal application of Ito’s lemma to the option’s terminal payoff leads to the
identity
(EQ 63)
Taking Expectations of both sides of this equation and using Equation 58 leads
to
(EQ 64)
The first term in this expression can be rewritten as
(EQ 65)
Inserting this relation and multiplying both sides of Equation 64 by the discount
factor , and using Equations 59 and 60 we obtain
(EQ 66)
CK T , t S , ( )
CK T , T ST , ( ) ST K – ( ) + =
CK T , t S , ( ) e
r T t – ( ) –
E ST K – ( ) + [ ] =
K ∂
∂CK T ,
e –
r T t – ( ) –
E θ ST K – ( ) [ ] =
K2
2
∂
∂ CK T ,
e
r T t – ( ) –
E δ ST K – ( ) [ ] =
T ∂
∂CK T ,
r – CK T , e
r T t – ( ) –
T ∂
∂
E ST K – ( ) + [ ] + =
d ST K – ( ) + θ ST K – ( )dST
1
2
-- -σT
2
ST
2
δ ST K – ( )dT + =
dE ST K – ( ) + [ ] r δ – ( )E STθ ST K – ( ) [ ]dT
1
2
-- -E σT
2
ST
2
δ ST K – ( ) [ ]dT + =
E STθ ST K – ( ) [ ] E ST K – ( ) + [ ] KE θ ST K – ( ) [ ] + =
e
r T t – ( ) –
e
r T t – ( ) –
T ∂
∂
E ST K – ( ) + [ ] r δ – ( ) CK T , K
K ∂
∂CK T ,
–
 
 
  1
2
-- -e
r T t – ( ) –
K
2
E σT
2
δ ST K – ( ) [ ] + =39
QUANTITATIVE STRATEGIES TECHNICAL NOTES
Goldman
Sachs
Replacing this expression for the last term in Equation 62 gives
(EQ 67)
Finally, using conditional expectations we can write
(EQ 68)
which together with Equation 61, can be inserted back into Equation 67 to arrive
at
(EQ 69)
The right hand side of this equation is precisely the definition of the local vari-
ance , as defined in Equation 2. It follows that
(EQ 70)
The local variance is, therefore, the conditional expectation of the
instantaneous variance of index returns at the future time T, contingent on index
level ST being equal to K. If the instantaneous index volatility is only a function
of the spot index level and time, i.e. if σt = σ(St , t), then
(EQ 71)
Since the right hand side is independent of t and S, in this case the local volatil-
ity surface remains static as time t evolves and index level S changes. This situ-
ation corresponds to an effective theory where all sources of volatility
uncertainty, other than the future time t and the future index level S, are effec-
tively averaged out of the theory, leaving an effective volatility which is only a
function of t and S.
In the general stochastic setting the dynamics of local volatilities is described by
the stochastic differential equation
(EQ 72)
T ∂
∂CK T ,
r δ – ( )K –
K ∂
∂CK T ,
δCK T , –
1
2
-- -e
r T t – ( ) –
K
2
E σT
2
δ ST K – ( ) [ ] + =
E σT
2
δ ST K – ( ) [ ] E σT
2
ST [ K] E δ ST K – ( ) [ ] ⋅ = =
E σT
2
ST [ K] 2
T ∂
∂CK T ,
r δ – ( )K
K ∂
∂CK T ,
δCK T , + +
 
 
 
K2
K2
2
∂
∂ CK T ,
----------------------------------------------------------------------------------- - = =
σ
2
K T , t S , ( )
σ
2
K T , t S , ( ) E σT
2
ST [ K]
E σT
2
δ ST K – ( ) [ ]
E δ ST K – ( ) [ ]
-------------------------------------- - = = =
σ
2
K T , t S , ( )
σ
2
K T , t S , ( ) E σT
2
ST [ K] E σ
2
ST T , ( ) ST [ K] σ
2
K T , ( ) = = = = =
dσ2
K T , t S , ( )
σ2
K T , t S , ( )
----------------------------- - αK T , t S , ( )dt θi
K T , t S , ( )dW
i
t
i 0 =
n
∑ + =40
QUANTITATIVE STRATEGIES TECHNICAL NOTES Sachs
Goldman
As discussed in the text, , i = 0, ...,n, are independent Brownian motions
under the equivalent martingale measure and the volatility coefficients are
some given functions of time t, index level S and factor values Wi
t , or the past
histories of these variables. The drift coefficients have similar depen-
dencies, but are constrained by the requirement of no-arbitrage. In an effective
theory for all values of t and S, as seen by Equation 71, thus
the drift and volatility coefficients are all identically equal to zero.
The denominator on the right hand side of Equation 70 is the total transition
probability (see Equation 39):
(EQ 73)
Since , for all values of K and T, are jointly martingales under the equiva-
lent martingale measure, the stochastic differential equation governing their
evolution has the form
(EQ 74)
The numerator on the right hand side of Equation 70 is also a martingale under
this measure. Therefore, by taking differentials of both sides of this equation
and applying Ito’s lemma we find that
(EQ 75)
Let us define a new measure, , specifically depending on K
and T. From Equations 72 and 75 we observe that under this new measure local
variance is a martingale, i.e
(EQ 76)
We call this measure the K-strike and T-maturity forward risk-adjusted measure
in analogy with T-maturity forward risk-neutral measure in interest rates (see
Jamshidian [1993]). Letting denote expectations with respect to this
new measure, we can write Equation 70 as
(EQ 77)
Therefore, in the K-strike and T-maturity forward risk-adjusted measure the
local variance is the expectation of future spot variances at time T.
This is analogous to the similar situation in interest rate world where the for-
W
i
θi
K T ,
αK T , t S , ( )
dσ2
K T , t S , ( ) 0 =
PK T , t S , ( )
PK T , t S , ( ) E δ ST K – ( ) [ ] =
PK T ,
dPK T , t S , ( )
PK T , t S , ( )
-------------------------- - ζi
K T , t S , ( )dW
i
t
i 0 =
n
∑ =
αK T , ζi
K T , θi
K T ,
i 0 =
n
∑ + 0 =
dŴ
i
dW
i
ζ
i
K T , dt – =
σ
2
K T ,
dσ2
K T , t S , ( )
σ2
K T , t S , ( )
----------------------------- - θi
K T , t S , ( )dŴ
i
t
i 0 =
n
∑ =
E
K T , ( )
… [ ]
σ2
K T , E
K T , ( )
σT
2
[ ] =
σ
2
K T , σT
241
QUANTITATIVE STRATEGIES TECHNICAL NOTES
Goldman
Sachs
ward rate is the T-maturity forward risk-adjusted expectation of the future
spot rates at time T.
In this appendix we describe several mathematical relationships satisfied by the
propagators, transition probabilities and the standard option prices in the effec-
tive volatility theories.
The forward propagator in an effective volatility theory describes the
(standard) option price evolution forward in time and index price. It satisfies the
same backward equation as option prices, a dual forward equation and the
boundary condition for all time t. Alternatively we can work
with the forward transition probability density function, , which is
defined in terms of the forward propagator as . The
forward transition probability, with boundary condition
, satisfies the following backward equation
(EQ 78)
its dual forward equation
(EQ 79)
and, for any , the Chapman-Kolmogorov relation
(EQ 80)
fT
APPENDIX B: Mathematics of Effec-
tive Theories
pt S t' S' , , ,
pt S t S' , , ,
δ S S' – ( ) =
p t S t' S' , , , ( )
p t S t' S' , , , ( ) e
r t' t – ( )
pt S t' S' , , ,
=
p t S t S' , , , ( ) δ S S' – ( ) =
t ∂
∂
r δ – ( )S
S ∂
∂ 1
2
-- -σ2
S t , S2
S2
2
∂
∂
+ +
 
 
 
p t S t' S' , , , ( ) 0 =
t' ∂
∂
p t S t' S' , , , ( ) r δ – ( )
S' ∂
∂
S'p t S t' S' , , , ( ) ( )
1
2
-- -
S
2
2
∂
∂
σ2
S' t' , S'2p t S t' S' , , , ( ) ( ) ( ) – + 0 =
t t ˜ t' ≤ ≤
p t S t' S' , , , ( ) p t S t ˜ S ˜ , , , ( )p t ˜ S ˜ t' S' , , , ( ) S ˜ d
0
∞
∫ =42
QUANTITATIVE STRATEGIES TECHNICAL NOTES Sachs
Goldman
The forward transition probability (propagator) relates prices of a standard
option, with fixed strike K and maturity T, at different time and market levels
according to
(EQ 81)
Differentiating this relation twice and evaluating it at leads to
(EQ 82)
Similarly, the backward propagator describes option price evolution
backward in maturity time and strike price. It satisfies the same forward equa-
tion as the option prices, its dual backward equation, and the boundary condi-
tion for all T. Alternatively we can work with the
backward transition probability density function, , which is
defined in terms of the backward propagator as
. The backward transition probability density
function, with the boundary condition , satisfies the
following forward equation
(EQ 83)
its dual backward equation
(EQ 84)
and, for any , the chapman-Kolmogorov relation
(EQ 85)
The backward transition probability (propagator) relates prices of standard
options, with different strikes and maturities, at a fixed time t, , and
market level S according to
(EQ 86)
Differentiating this relation twice and evaluating it at leads to
CK T , t S , ( ) e
r T t – ( ) –
p t S t' S' , , , ( )CK T , t' S' , ( ) S' d
0
∞
∫ =
t' T =
p t S T K , , , ( ) e
r T t – ( )
K
2
2
∂
∂
CK T , t S , ( ) =
ΦK T K' T' , , ,
ΦK T K' T , , ,
δ K K' – ( ) =
Φ K T K' T' , , , ( )
Φ K T K' T' , , , ( ) e
δ T T' – ( )
ΦK T K' T' , , ,
=
Φ K T K' T , , , ( ) δ K K' – ( ) =
T ∂
∂
r δ – ( )K
K ∂
∂ 1
2
-- -σ2K T , K2
K2
2
∂
∂
– +
 
 
 
Φ K T K' T' , , , ( ) 0 =
T' ∂
∂
Φ K T K' T' , , , ( ) r δ – ( )
K' ∂
∂
K'Φ K T K' T' , , , ( ) ( )
1
2
-- -
K'2
2
∂
∂
σ2
K' T' , K'
2
Φ K T K' T' , , , ( )  
  + + 0 =
T' T ˜ T ≤ ≤
Φ K T K' T' , , , ( ) Φ K T K̃ T̃ , , , ( )Φ K̃ T̃ K' T' , , , ( ) K̃ d
0
∞
∫ =
t T' T ≤ ≤
CK T , t S , ( ) e
δ T T' – ( ) –
Φ K T K' T' , , , ( )CK' T' ,
t S , ( )
0
∞
∫ =
T' t =43
QUANTITATIVE STRATEGIES TECHNICAL NOTES
Goldman
Sachs
(EQ 87)
In this appendix we derive variational formulas describing sensitivity of the
transition probabilities (propagators) to a specific local volatility on the volatil-
ity surface. We work within the context of effective theories, (formally) chang-
ing the local volatility corresponding to a single future time and market level,
while leaving all other local volatilities unchanged.
We begin by studying the relationship between transition probabilities and local
volatilities in a discrete time setting. We then take the continuous-time limit by
letting the spacing go to zero. Consider one period forward transition probabili-
ties p*u, p*m and p*d, from the index level S* at time t* to the three nearby
index levels S*u, S*m and S*d at time t*+ ∆t*, as shown in the figure below:
Let denote the one-step forward price and the
local volatility, corresponding to the initial node (t*,S*). The three transition
probabilities in the figure add up to one, and are further constrained by the for-
ward and volatility conditions, i.e
Φ K T S t , , , ( ) e
δ T t – ( )
S
2
2
∂
∂
CK T , t S , ( ) =
APPENDIX C: Local Volatility
Variational Formulas in
Effective Volatility Theories
S*
S*u
S*m
S*d
p*u
p*m
p*d
F*
F∗ S∗e
r δ – ( )∆t∗
= σ∗ σS∗ t∗ , =44
QUANTITATIVE STRATEGIES TECHNICAL NOTES Sachs
Goldman
(EQ 88)
(EQ 89)
(EQ 90)
We can solve these expressions for transition probabilities in terms of the local
volatility. The results are
(EQ 91)
(EQ 92)
and .
Now consider the forward transition probability , describing the
total probability that starting with the level S at time t the index will move to the
level S' at the future time t', in the effective theory context. We can isolate the
sensitivity of this transition probability to a specific local volatility , corre-
sponding to the future time and future market level , using the
Chapman-Kolmogorov relation of Equation 80. In discrete-time this contribu-
tion is isolated in the following figure:
This figure describes the following decomposition of the total transition proba-
bility:
(EQ 93)
p∗u p∗m p∗d + + 1 =
p∗uS∗u p∗mS∗m p∗dS∗d + + F∗ =
p∗u S∗u F∗ – ( )
2
p∗m S∗m F∗ – ( )
2
p∗d S∗d F∗ – ( )
2
+ + F∗2
σ∗2
∆t∗ =
p∗u
F∗ S∗m – ( ) F∗ S∗d – ( )
S∗u S∗m – ( ) S∗u S∗d – ( )
------------------------------------------------------- - F∗2
S∗u S∗m – ( ) S∗u S∗d – ( )
------------------------------------------------------- -σ∗2
∆t∗ + =
p∗d
F∗ S∗m – ( ) F∗ S∗u – ( )
S∗m S∗d – ( ) S∗u S∗d – ( )
------------------------------------------------------- -
F∗2
S∗m S∗d – ( ) S∗u S∗d – ( )
------------------------------------------------------- -σ∗2
∆t∗ + =
p∗m 1 p∗u p∗d – – =
p t S t' S' , , , ( )
σS∗ t∗ ,
t t∗ t' ≤ ≤ S∗
S*u
S*m
S*d
p*u
p*m
p*d
S*
t t* t*+∆t* t'
S'
S
p t S t' S' , , , ( ) p t S t∗ S∗ , , , ( )p∗up t∗ ∆t∗ + S∗u t' S' , , , ( ) + =
p t S t∗ S∗ , , , ( )p∗mp t∗ ∆t∗ + S∗m t' S' , , , ( ) +45
QUANTITATIVE STRATEGIES TECHNICAL NOTES
Goldman
Sachs
terms with no sensitivity to σS*,t*
Taking the variational derivative with respect to gives
(EQ 94)
From Equations 91 and 92, and ignoring o(∆t*) terms, we have
(EQ 95)
(EQ 96)
. (EQ 97)
where we used the approximation . Insert these
relations back in Equation 94 leads to
(EQ 98)
In the limit we find the desired result
(EQ 99)
Similarly, the variational derivative of the backward transition probability
to the local volatility with is found using the
figure:
p t S t∗ S∗ , , , ( )p∗dp t∗ ∆t∗ + S∗d t' S' , , , ( ) +
σ
2
S∗ t∗ ,
δp t S t' S' , , , ( )
δσ
2
S∗ t∗ ,
------------------------------- - p t S t∗ S∗ , , , ( )
δp∗u
δσ
2
S∗ t∗ ,
------------------ -
 
 
 
p t∗ ∆t∗ + S∗u t' S' , , , ( ) + =
p t S t∗ S∗ , , , ( )
δp∗m
δσ
2
S∗ t∗ ,
------------------ -
 
 
 
p t∗ ∆t∗ + S∗m t' S' , , , ( ) +
p t S t∗ S∗ , , , ( )
δp∗d
δσ
2
S∗ t∗ ,
------------------ -
 
 
 
p t∗ ∆t∗ + S∗d t' S' , , , ( )
δp∗u
δσ
2
S∗ t∗ ,
------------------ -
S∗2
S∗u S∗m – ( ) S∗u S∗d – ( )
------------------------------------------------------- -
1
2
-- -
S∗
∆S∗
--------- -  
 
2
∼ =
δp∗d
δσ
2
S∗ t∗ ,
------------------ -
S∗2
S∗m S∗d – ( ) S∗u S∗d – ( )
------------------------------------------------------- -
1
2
-- -
S∗
∆S∗
--------- -  
 
2
∼ =
δp∗m
δσ
2
S∗ t∗ ,
------------------ -
δp∗u
δσ
2
S∗ t∗ ,
------------------ -
δp∗d
δσ
2
S∗ t∗ ,
------------------ - +
 
 
 
–
S∗
∆S∗
--------- -  
 
2
– ∼ =
S∗u S∗m – S∗m S∗d – ∼ ∆S∗ =
δp t S t' S' , , , ( )
δσ
2
S∗ t∗ ,
------------------------------- -
1
2
-- -p t S t∗ S∗ , , , ( )S∗2
p t∗ ∆t∗ + S∗ ∆S∗ + t' S' , , , ( ) – { =
2p t∗ ∆t∗ + S∗ t' S' , , , ( ) p t∗ ∆t∗ + S∗ ∆S∗ – t' S' , , , ( )} ∆S∗ ( ) ⁄
2
+
∆S∗ 0 →
δp t S t' S' , , , ( )
δσ
2
S∗ t∗ ,
------------------------------- -
1
2
-- -p t S t∗ S∗ , , , ( )S∗2
S∗2
2
∂
∂
p t∗ S∗ t' S' , , , ( ) =
Φ K T K' T' , , , ( ) σK∗ T∗ ,
T' T∗ T ≤ ≤46
QUANTITATIVE STRATEGIES TECHNICAL NOTES Sachs
Goldman
and can be written as
(EQ 100)
This appendix presents a proof of the no-arbitrage drift conditions of Equation
53. We also make the usual assumptions about the regularity, measurability and
integrability of various quantities. A more rigorous treatment will need to
address these issues.
Let us begin with Equation 40 in the text, describing the stochastic process fol-
lowed by the total transition probability in a stochastic volatility the-
ory:
The first term describes differential changes of the transition probability
restricted to the effective theory defined by the (non-random) local volatility
surface prevailing at time t and market level S. Restricted to this sur-
face, coincides with the effective theory total transition probability
and the instantaneous volatility coincides with the local vola-
tility . Therefore, in view of Equation 78, the following backward equation
holds:
K*u
K*m
K*d
φ*m
φ*d
K*
T T* T*-∆T* T'
K'
K
φ*u
δΦ K T K' T' , , , ( )
δσ
2
K∗ T∗ ,
--------------------------------------
1
2
-- -Φ K T K∗ T∗ , , , ( )K∗2
K∗2
2
∂
∂
Φ K∗ T∗ K' T' , , , ( ) =
APPENDIX D: The No-Arbitrage
Conditions and the Existence
of the Equivalent Martingale
Measure in Stochastic Volatility Theo-
ries
PK T , t S , ( )
dP
K T , t ∂
∂P
K T ,
µ t ( )S
S ∂
∂P
K T , 1
2
-- -σ2 t ( )S2
S2
2
∂
∂ P
K T ,
+ +
 
 
 
 
dt σ t ( )S
S ∂
∂P
K T ,
dW0 t ( ) +
t S , ( )
= +
δP
K T ,
δσ2
K' T' ,
----------------------- σ2
K' T' , d K' d T' d
0
∞
∫ t
T
∫
1
2
-- -
δ
2
P
K T ,
δσ2
K' T' , δσ2
K'' T'' ,
------------------------------------------------- σ2
K' T' , d σ2
K'' T'' , d K' d K'' d T' T'' d d
0
∞
∫ 0
∞
∫ t
T
∫ t
T
∫ +
σK T , t S , ( )
PK T , t S , ( )
p t S K T , , , ( ) σ t ( )
σt S ,
t ∂
∂PK T ,
r δ – ( )S
S ∂
∂PK T , 1
2
-- -σ2 t ( )S2
S2
2
∂
∂ PK T ,
+ + 0 =47
QUANTITATIVE STRATEGIES TECHNICAL NOTES
Goldman
Sachs
Using this expression, Equations 25 and 99, and some manipulations we arrive
at
Note that the effective theory transition probabilities p(..) implicitly depend on t
and S, whether or not they contain these variables explicitly.
Now assume that the drift parameters satisfy the following relations
with and (so far) arbitrary functions , i = 1, .., n:
Then we can define a new measure { , i = 0, .., n} by
; (i = 1, ..,n)
in terms of which we have
The measure { , i = 0, .., n } is an equivalent martingale probability mea-
sure. Applying the arguments of Harrison and Kreps [Harrison 1979] we can
show that this equivalent martingale measure is unique if (and only if) the mar-
ket prices of risk and ,
i = 1, .., n, remain independent of strike price K and maturity T. Under these
conditions the markets are complete and contingent claims valuation follows the
standard methods of Harrison and Pliska [Harrison 1989] and remains indepen-
dent of market prices of risk.
dPK T , σ t ( )S
S ∂
∂P
K T ,
dW0 t ( ) µ t ( ) r – δ + ( )dt + [ ]
δP
K T ,
δσ2
K' T' ,
---------------------- -θ
K' T' ,
i
K' d T' d
0
∞
∫ t
T
∫  
 
 
dWt
i
i 0 =
n
∑ + =
δP
K T ,
δσ2
K' T' ,
---------------------- -
0
∞
∫ α [
K' T' ,
t S , ( ) θ
i
K' T' , t S , ( )
1
p t S T' K' , , , ( )
------------------------------ - ×



i 0 =
n
∑ +
t
T
∫ 



θ
i
K'' T'' , t S , ( )p t S T'' K'' , , , ( )K''2
K''2
2
∂
∂
p T'' K , '' T' K' , , ( ) K' d ' T''}] K' d T' d d ) t d
0
∞
∫ t
T'
∫
σK T , t S , ( )
Π
0
0 = Π
i
σ
K T ,
t S , ( ) θ
i
K T , t S , ( )
1
p t S T K , , , ( )
---------------------------- - θ
i
K' T' , t S , ( )p t S T' K' , , , ( )K2'
K'2
2
∂
∂
p T' K' , T K , , ( ) K d ' T' d
0
∞
∫ t
T'
∫ Π
i
–
 
 
 
 
 
i 0 =
n
∑ – =
dW
i
dWt
0
dWt
0 µ t ( ) r – δ + ( )
σ t ( )
--------------------------------dt + = dWt
i
dWt
i
Πt
i
dt + =
dPK T , σ t ( )S
S ∂
∂PK T ,
dW
0 δPK T ,
δσ2
K' T' ,
---------------- -θK' T' ,
i
K' d T' d
0
∞
∫ t
T
∫  
 dWt
i
i 0 =
n
∑ + =
dW
i
µ r – δ + ( ) σ ⁄ Π
i48
QUANTITATIVE STRATEGIES TECHNICAL NOTES Sachs
Goldman
This appendix derives formulas for calculating drift parameters from the no-
arbitrage conditions in stochastic volatility theories. We work in the discrete
time context of the stochastic implied trinomial trees and show how to induc-
tively calculate the arbitrage-free drift parameters for all future nodes from the
martingale conditions on the total transition probabilities to the neighboring
nodes at the next time step.
We begin our analysis at the (i+1)th step of the simulation, at time ti, with index
level at node (i,j) of the stochastic implied tree. Our objective is to calculate the
arbitrage-free drift parameters , to all future nodes (n, m) at future
times tn for . We calculate the drift parameter iteratively, using
the results of the previous iteration steps and the condition that the total transi-
tion probability , from the node (i,j) to the node (n+1,m+2), is a
martingale under all possible future movements of the local volatility surface.
This situation is shown in the following figure:
The figure shows the subtree which starts at the initial node (i,j). All the future
movements of the index and local volatilities will be confined to the nodes of
this subtree. Our iteration for calculating drift parameters for all sub-
tree nodes begins with the calculation of the drift parameter at the initial node,
, and continues forward to subsequent time steps beginning with the
highest node at each time step.
To make matter simple, for now let us assume that the only possible movements
of the local volatility surface during the next instant ∆t are up or down (propor-
tionately), with some constant volatility , as in our example in the text, i.e
APPENDIX E: Computing Drift
Parameters in Arbitrage-Free
Stochastic Volatility Theories
αm n , i j , ( )
n i ≥ αm n , i j , ( )
Pm 2 + n 1 + , i j , ( )
αm n , i j , ( )
αj i , i j , ( )
θ
σ
u d , ( )
m n , i j , ( ) σm n , i j , ( ) αm n , i j , ( )
1
2
-- -θ
2
–
 
 ∆t θ ∆t ±
 
 
 
exp =49
QUANTITATIVE STRATEGIES TECHNICAL NOTES
Goldman
Sachs
Suppose that we have calculated the drift parameters for every node before time
tn, and also for every nodes at time tn which lies above the node (n,m), shown in
dark in the figure. We must now calculate from the previously known
quantities and the martingale condition on the total probability ,
of arriving at the node (n+1, m+2) at the next time step. We can decompose the
contributions to this probability into two components as follows:
As in the figure, p denotes the one period up transition probability from the
node (n,m) to the node (n+1, m+2). The first term describes the contribution of
the node (n,m) to the total transition probability, stemming from all the paths
which go through this node before arriving at (n+1,m+2). The second term
describes the contribution of all the nodes lying above the node (n,m) to this
transition probability.
(i,j)
2(n-i)+j
j
2(n-i)+j-1
2(n-i)+j+2
2(n-i)+j+1
2(n-i)+j
m+2
m+1
m
j+2
j+1
j
m
j+1
ti tn tn+1
...........
......... ..........
p
αm n , i j , ( )
Pm 2 + n 1 + , i j , ( )
Pm 2 n 1 + , + i j , ( ) Pm n , i j , ( )p Λm n , i j , ( ) + =50
QUANTITATIVE STRATEGIES TECHNICAL NOTES Sachs
Goldman
Consider now the next instant ∆t in time where all future local volatilities will
simultaneously move either to their up state, , or to their down state
. Since transition probabilities are direct functions of local volatili-
ties, then all probabilities will also simultaneously move to their up or down
states, i.e
The quantities and depend on drift parameters and
other quantities known from the previous iteration steps, but remain
unknown as they depend on the unknown drift parameter . We have
previously discussed the structure of this dependence in Equations 91 and 92.
The one period transition probability depends linearly on the local variance
, i.e , with coefficients A and B depending only
on the position of the nodes, which are fixed and known. Hence
Using this and previous relations, we can now determine the unknown drift
parameter from the martingale condition for the (known) total proba-
bility :
Therefore the desired formula is
σ
u ( )
m n , i j , ( )
σ
d ( )
m n , i j , ( )
P
u d , ( )
m 2 n 1 + , + i j , ( ) P
u d , ( )
m n , i j , ( )p
u d , ( )
Λ
u d , ( )
m n , i j , ( ) + =
P
u d , ( )
m n , i j , ( ) Λ
u d , ( )
m n , i j , ( )
p
u d , ( )
αm n , i j , ( )
p
σ
2
m n , i j , ( ) p A Bσ
2
m n , i j , ( ) + =
p
u d , ( )
A Bσ
u d , ( )2
m n , i j , ( ) + = =
A Bσ
2
m n , i j , ( ) 2 αm n , i j , ( ) 1
2
-- -θ
2
–
 
 ∆t 2θ ∆t ±
 
 
 
exp + =
αm n , i j , ( )
Pm 2 + n 1 + , i j , ( )
Pm 2 + n 1 + , i j , ( )
1
2
-- - P
u ( )
m 2 + n 1 + , i j , ( ) P
d ( )
m 2 + n 1 + , i j , ( ) + { } =
1
2
-- - P
u ( )
m n , i j , ( )p
u ( )
P
d ( )
m n , i j , ( )p
d ( )
Λ +
u ( )
m n , i j , ( ) Λ
d ( )
m n , i j , ( ) + + { } =
1
2
-- - P
u ( )
m n , i j , ( ) P
d ( )
m n , i j , ( ) + [ ]A Λ
u ( )
m n , i j , ( ) Λ
d ( )
m n , i j , ( ) + + { } + =
1
2
-- -Bσ
2
m n , i j , ( )e
θ
2
∆t –
P
u ( )
m n , i j , ( )e
2θ ∆t
P
d ( )
m n , i j , ( )e
2θ ∆t –
+ [ ] 2αm n , i j , ( )∆t { } exp
α
m n ,
i j , ( )
P
m 2 + n 1 + ,
i j , ( )
1
2
-- - P
u ( )
m n , i j , ( ) P
d ( )
m n , i j , ( ) + A Λ
u ( )
m n , i j , ( ) Λ
d ( )
m n , i j , ( ) + +
 
 
 
–
1
2
-- -Bσ
2
m n , i j , ( )e
θ
2
∆t –
P
u ( )
m n , i j , ( )e
2θ ∆t
P
d ( )
m n , i j , ( )e
2θ ∆t –
+
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- log
 
 
 
 
 
 
 
2∆t ( ) ⁄ =51
QUANTITATIVE STRATEGIES TECHNICAL NOTES
Goldman
Sachs
This result can be readily extended to the cases where the local volatility surface
can move to any number (more than two) of possible states during a time step,
has multiple stochastic factors, or has factor volatilities which are more compli-
cated functions of time, market level, factor values or their past histories.52
QUANTITATIVE STRATEGIES TECHNICAL NOTES Sachs
Goldman
REFERENCES
Black, F. and M. Scholes (1973). The Pricing of Options and Corporate Liabili-
ties, Journal of Political Economy, Vol. 81, 637-654.
Black, F., E. Derman and W. Toy (1990). A One-Factor Model of Interest Rates
and Its Application to Treasury Bond Options, Financial Analyst Journal, 817,
33-39.
Breeden, D. and R. Litzenberger (1978). The Pricing of State-Contingent
Claims Implicit in Option Prices, Journal of Business, Vol. 51, 621-651.
Cox, J., J. E. Ingersoll and S. Ross (1985). A Theory of the Term Structure of
Interest Rates, Econometrica, Vol. 53, No. 2, 385-407.
Cox. J. and S. Ross (1976). The Valuation of Options for Alternative Stochastic
Processes, Journal of Financial Economics, Vol. 3, 145-166.
Cox, J., S. Ross and M. Rubinstein (1979). Option Pricing: A Simplified
Approach, Journal of Financial Economics, Vol. 7, 229-263.
Derman, E. and I. Kani (1994). Riding on a Smile. RISK 7, No. 2, 32-39.
Derman, E., I. Kani and N. Chriss (1996). Implied Trinomial Trees of the Vola-
tility Smile, Journal of Derivatives, Vol. 3, No. 4, 7-22.
Dupire, B. (1993). Model Art. RISK 6, No. 9, 118-124.
Dupire, B. (1994). Pricing with a Smile. RISK 7, No. 1, 18-20.
Eisenberg L. and R. Jarrow (1994). Option Pricing With Random Volatilities in
Complete Markets, Review of Quantitative Finance and Accounting, Vol. 4, 5-
17.
Harrison, J. M. and D. Kreps (1979). Martingales and Arbitrage in Multiperiod
Securities Markets, Journal of Economic Theory, Vol. 20, 381-408.
Harrison, J. M. and S. Pliska (1981). Martingales and Stochastic Integrals in the
Theory of Continuous Trading. Stochastic Processes and Their Applications,
Vol. 20, 215-260.
Heath, D., R. Jarrow and A. Morton (1992). Bond Pricing and The Term Struc-
ture of Interest Rates: A New Methodology for Contingent Claims Valuation,
Econometrica, Vol. 60, No. 1, 77-105.
Ho, T. S. Y. and S. B. Lee (1986). Term Structure Movements and Pricing
Interest Rate Contingent Claims, The Journal of Finance, Vol. 41, No. 5, 1011-
1029.
Hull, J. and A. White (1987). The Pricing of Options on Assets With Stochastic
Volatilities, Journal of Finance, Vol. 42, 271-301.53
QUANTITATIVE STRATEGIES TECHNICAL NOTES
Goldman
Sachs
Jamshidian, F. (1993). Option and Futures Evaluation with Deterministic Vola-
tilities, Mathematical Finance, Vol. 3, No. 2, 149-159.
Johnson, H. and D. Shanno (1987). Option Pricing When Variance is Changing,
Journal of Financial and Quantitative Analysis, Vol. 22, 143-153.
Kani, I., E. Derman and M. Kamal (1996). Trading and Hedging Local Volatil-
ity, Quantitative Strategies Research Notes, Goldman Sachs & Co.
Merton, R. (1973). Theory of Rational Option Pricing, Bell Journal of Econom-
ics and Management Science, Vol. 4, 141-183.
Rubinstein, M.E. (1994). Implied Binomial Trees, Journal of Finance, Vol. 69,
771-818.
Stein, E. and J. Stein (1991). Stock Price Distribution With Stochastic Volatil-
ity: An Analytical Approach, The Review of Financial Studies, Vol 4, No. 4,
727-752.
Vasicek, O. A. (1977). An Equilibrium Characterization of the Term Structure,
Journal of Financial Economics Vol. 5, 177-188.
Wiggins, J. (1987). Option Values Under Stochastic Volatility: Theory and
Empirical Estimates, Journal of Financial Economics, Vol. 19, 351-372.54
QUANTITATIVE STRATEGIES TECHNICAL NOTES Sachs
Goldman
SELECTED QUANTITATIVE STRATEGIES PUBLICATIONS
June 1990 Understanding Guaranteed Exchange-Rate
Contracts In Foreign Stock Investments
Emanuel Derman, Piotr Karasinski
and Jeffrey S. Wecker
March 1992 Pay-On-Exercise Options
Emanuel Derman and Iraj Kani
June 1993 The Ins and Outs of Barrier Options
Emanuel Derman and Iraj Kani
January 1994 The Volatility Smile and Its Implied Tree
Emanuel Derman and Iraj Kani
May 1994 Static Options Replication
Emanuel Derman, Deniz Ergener
and Iraj Kani
May 1995 Enhanced Numerical Methods for Options
with Barriers
Emanuel Derman, Iraj Kani, Deniz Ergener
and Indrajit Bardhan
December 1995 The Local Volatility Surface
Emanuel Derman, Iraj Kani and Joseph Z. Zou
February 1996 Implied Trinomial Trees of the Volatility Smile
Emanuel Derman, Iraj Kani and Neil Chriss
August 1996 Trading and Hedging Local Volatility
Iraj Kani, Emanuel Derman and Michael Kamal
October 1996 Investing in Volatility
Emanuel Derman, Michael Kamal, Iraj Kani,
John McClure, Cyrus Pirasteh and Joseph Zou