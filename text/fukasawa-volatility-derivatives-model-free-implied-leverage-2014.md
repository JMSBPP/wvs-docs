---
sha256: 4bc359c3ec04d439c94d82b9276a76d523ec2fbbb1d8507330c83d7f4b53dfe9
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 47147
---
Title Volatility Derivatives and Model-free Implied
Leverage
Author(s) Fukasawa, Masaaki
Citation International Journal of Theoretical and Applied
Finance. 2014, 17(1), p. 1450002
Version Type AM
URL https://hdl.handle.net/11094/77642
rights © copyright World Scientific Publishing Company
Note
The University of Osaka Institutional Knowledge Archive : OUKA
https://ir.library.osaka-u.ac.jp/
The University of OsakaVolatility Derivatives and Model-free
Implied Leverage
Masaaki Fukasawa
Department of Mathematics, Osaka University
1-1 Machikaneyama, Toyonaka, Osaka, JAPAN
Center for the Study of Finance and Insurance, Osaka University
Japan Science and Technology Agency, CREST
October 24, 2013
Abstract
We revisit robust replication theory of volatility derivatives and intro-
duce a broader class which may be considered as the second generation
of volatility derivatives. One of them is a swap contract on the quadratic
covariation between an asset price and the model-free implied variance
(MFIV) of the asset. It can be replicated in a model-free manner and its fair
strike may be interpreted as a model-free measure for the covariance of the
assetpriceandtherealizedvariance. Thefairstrikeisgiveninaremarkably
simple form, which enable to compute it from the Black-Scholes implied
volatility surface. We call it the model-free implied leverage (MFIL) and
give several characterizations. In particular we show its simple relation to
the Black-Scholes implied volatility skew by an asymptotic method. Fur-
ther to get an intuition, we demonstrate some explicit calculations under
the Heston model. We report some empirical evidence from the time series
of the MFIV and MFIL of the Nikkei stock average.
Keywords: Variance swap; Gamma swap; Leverage eﬀect; Volatility
skew; Robust hedging; Asymptotic expansion.
11 Introduction
Ever since the Chicago Board Options Exchange (CBOE) revised in 2003 their
methodology for VIX, a volatility index of the SPX option market, both the
new method and an underlying model-free formula for the fair strike of a
variance swap have received much attention in the financial industry and have
been applied to many other markets in order to meet the demand of financial
practitioners for a model-free estimate of the future volatility of the underlying
asset price. Let T > 0 and denote by S1
,S0
, respectively, the market price
processes of a risky asset and the risk-free zero coupon bond with maturity
T, S0
T
= 1. By assuming the discounted process S = S1
/S0
to be a continuous
semi-martingale, a simple application of the Itô-Tanaka formula gives that
∫ T
0
g(Su)d⟨log(S)⟩u = fg(ST) − fg(S0) −
∫ T
0
f′
g(Su)dSu
for any locally integrable function g, where
fg(s) = 2
∫ s
1
∫ u
1
g(v)
v2
dvdu. (1)
Since the last term written as a stochastic integral with respect to S can be
replicated by dynamic rebalancing in a self-financing and model-free manner,
the option contract with maturity T and payoﬀ given by the left hand side
integral is equivalent to the European style option with the same maturity
and payoﬀ f(ST) − f(S0). The case g = 1 corresponds to the floating leg of the
varianceswap, whichhaszerovalueatinception(time0)andpaysattimeT the
diﬀerence between the floating leg ⟨log(S)⟩T and a fixed leg (strike) determined
at time 0. The above identity tells in particular that the strike multiplied by S0
0
must coincide with the price at time 0 of the European option with maturity
T and payoﬀ −2log(ST/S0) in order to avoid an arbitrage opportunity. The
strike may be interpreted as an expected, or predicted value of ⟨log(S)⟩T. In
fact it is the expectation of ⟨log(S)⟩T under the pricing measure. The idea of
the model-free implied variance (MFIV) underlying the VIX methodology is
to use the above relation between the strike and the European option price
2to obtain a model-free measure of market expectation of ⟨log(S)⟩T. It is well-
known that any European style convex payoﬀ is replicated by a static portfolio
of the underlying asset, the call and put options; we have
f(ST) =f(S0) + f′
(S0)(ST − S0)
+
∫
(0,S0]
(K − ST)+ f′
(dK) +
∫
(S0,∞)
(ST − K)+ f′
(dK)
(2)
for any convex function f. This identity is model-free and easily shown by the
integration by parts formula of the Stieltjes integral with respect to the right
derivative f′
of f. Consideringthecase f = −2log,thefairstrikeofthevariance
swap is given by
V0 = 2
∫ S0
0
P0(K)
dK
K2
+ 2
∫ ∞
S0
C0(K)
dK
K2
,
where P(K) = P1
(K)/S0
and C(K) = C1
(K)/S0
with P1
(K) and C1
(K) referring to
respectively the market price processes of the put and call options with strike
K and maturity T. More generally we can conclude that the fair strike at time
t ∈ [0,T] of a weighted variance swap which has floating leg
∫ T
t
g(Su)d⟨log(S)⟩u
is given by
Vt[g] =
∫
(0,St]
Pt(K)f′
g(dK) +
∫
(St,∞)
Ct(K)f′
g(dK)
and that the swap contract can be hedged in a model-free manner. For more
practical and historical details of the variance swap and the CBOE VIX, see
Gatheral [8] and Carr and Lee [1].
As seen so far, provided a market of the put and call options, any European
style convex payoﬀ can be replicated by a static portfolio with no knowledge
on the dynamics of S. Under the continuity assumption on S, any weighted
variance swap can be replicated by a semi-static portfolio in a model-free man-
ner. Here a semi-static portfolio means a combination of a static portfolio in the
option market and a dynamic portfolio in the underlying asset market. Then it
3would be natural to ask how the model-free replication theory can be extended
by allowing dynamic rebalancing of replicating portfolios in the option market
as in the underlying asset market. In this paper, we give a rigorous formulation
of this problem under the assumption that P(K) and C(K) are continuous for all
K > 0. In particular we observe that the swap contract with floating leg ⟨S,V⟩T
can be replicated in a model-free manner, where V is the fair strike process of
the variance swap, that is, Vt = Vt[1]. Since V is what we call the MFIV, the
fair strike of this swap may be interpreted as a model-free measure of market
expectation of the leverage eﬀect. We therefore propose to call it the model-
free implied leverage (MFIL). The leverage eﬀect, which refers to a negative
relation between an asset price and its volatility movement, is widely observed
in empirical studies. Also in calibration of a parametric stochastic volatility
model such as the Heston model, the implied leverage parameter usually takes
a non-zero value. The negative correlation between the SPX and VIX is actually
the major motivation for those who trade the VIX future of the CBOE to do
so. It is also known to be the source of the Black-Scholes implied volatility
skew and so, the reason why the VIX is sometimes referred as the fear gauge.
The MFIL serves as a benchmark of the leverage eﬀect predicted by the market
participants. It is as model-free as the MFIV. We may think of it as the fear
gauge of the fear gauge in that it measures how much the fear gauge includes
negative sentiment of the market participants. The MFIL turns out essentially
the same as the slope introduced by Neuberger [10].
The second part of this paper shows two remarkably simple relations be-
tween the MFIL and the Black-Scholes implied variance surface. One of them
is an extension of Gatheral’s elegant formula for the MFIV. The other char-
acterizes the MFIV and MFIL as the coeﬃcients of the leading terms of the
asymptotic expansion of the Black-Scholes implied variance. A related prop-
erty was formally shown by Neuberger [10] but we give more rigorous results.
The asymptotic expansion formula is validated in a unified framework which
4incorporates several existing techniques such as the regular perturbation, sin-
gular perturbation and small vol-of-vol expansions. Although the framework
isnon-parametric, wedemonstratesomeexplicitcalculationsundertheHeston
model in order to get an intuition of it.
The last part of this paper reports some empirical evidence from the time-
series of the MFIV and MFIL of the Nikkei stock average. The purpose of this
empirical study is to confirm the MFIL includes some information which is
not captured by the MFIV. More complete empirical analyses are left for future
research. See also Neuberger [10]. We observe that the MFIL reflected the
fear of the market participants for the eﬀect of a huge earthquake and tsunami
which hit Japan on March 11, 2011. The joint dynamics of the MFIV and MFIL
clearly distinguished the disaster and the financial crisis on 2008, the two dif-
ferent kinds of turmoil. Further we demonstrate a parametric estimation using
YUIMA, an R package for estimations and simulations of stochastic diﬀerential
equations. It indicates the existence of independent factors which drive the
time-series of the MFIV and MFIL.
## 2 Tradable assets and attainable processes
## 2.1 Definitions and assumptions
Here we give a rigorous setup of the model-free replication. Let (Ω,F) be
a measurable space and T > 0 be a fixed constant. We suppose that three
measurable maps S : Ω × [0,T] → (0,∞), P(·) : Ω × [0,T] × (0,∞) → [0,∞),
C(·) : Ω × [0,T] × (0,∞) → [0,∞) are given and satisfy
1. for each ω ∈ Ω and K ∈ (0,∞),
[0,T] ∋ t 7→ St(ω) ∈ (0,∞),
[0,T] ∋ t 7→ Pt(K)(ω) ∈ [0,∞)
are continuous and PT(K)(ω) = (K − ST(ω))+,
52. for each ω ∈ Ω and t ∈ [0,T],
(0,∞) ∋ K 7→ Pt(K)(ω) ∈ [0,∞)
is convex and
lim
K→0
Pt(K)(ω) = lim
K→0
P′
t(K)(ω) = 0, lim
K→∞
P′
t(K)(ω) = 1,
where P′
stands for the right derivative of P with respect to K,
3. for each ω ∈ Ω, K ∈ (0,∞) and t ∈ [0,T],
Ct(K)(ω) = Pt(K)(ω) + St(ω) − K.
Of course P(K) and S stand for the forward price processes of the put option
and the underlying asset respectively. The second condition excludes static
arbitrageopportunities atanytimet ∈ [0,T]withtheputoptions. Since P′
(·)(ω)
is non-decreasing and right continuous for each ω ∈ Ω, it is a distribution
function on (0,∞) and an integration by parts gives that
Pt(K) =
∫
(0,K]
P′
t(s)ds =
∫
(0,∞)
(K − s)+P′
t(ds),
where P′
t(ds) stands for the Stieltjes measure with respect to P′
t. The last condi-
tion is the put-call parity that makes C(K) be the forward price process of the
call option. One of easy but important consequences from the above is that
0 ≤ Pt(K)(ω) ≤ K, 0 ≤ Ct(K)(ω) ≤ St(ω) (3)
for any t ∈ [0,T], K ∈ (0,∞) and ω ∈ Ω.
For a given convex function f and t ∈ [0,T], put
Qt[f] = f(S0) + f′
(S0)(St − S0) +
∫
(0,S0]
Pt(K)f′
(dK) +
∫
(S0,∞)
Ct(K)f′
(dK),
where f′
(dK)standsfortheStieltjesmeasurewithrespecttotherightderivative
f′
of f. By (2), Qt[f] is the forward value at time t of the replicating portfolio
6initiated at time 0 of the European option with payoﬀ f(ST) and maturity T.
To exclude an arbitrage opportunity, Qt[f] must coincide with the forward
replication cost at time t of the same option for any t ∈ [0,T];
Qt[f] =f(St) +
∫
(0,St]
Pt(K)f′
(dK) +
∫
(St,∞)
Ct(K)f′
(dK)
=f(St) +
∫
(0,∞)
min{Pt(K),Ct(K)}f′
(dK).
(4)
The first identity actually follows from the put-call parity using integration by
parts for any convex function f and t ∈ [0,T]. The second identity is a simple
consequence from the put-call parity. Though Q[f] = {Qt[f]} is well-defined
for any convex function f, it may be infinite in general.
Definition 2.1 We say Q[f] is a tradable asset if
1. Qt[f](ω) is finite for any t ∈ [0,T], ω ∈ Ω, and
2. [0,T] ∋ t 7→ Qt[f](ω) ∈ R is continuous for any ω ∈ Ω.
By definition, S, P(K) and C(K) are tradable assets for any K ∈ (0,∞). More
generally we have the following assertion.
Lemma 2.2 If the Stieltjes measure f′
is finite, then Q[f] is a tradable asset.
Proof: The finiteness of Q[f] follows from (3) and the finiteness of f′
. The
families {P(K);K ≤ S0} and {C(K);K ≥ S0} are equi-continuous in t ∈ [0,T] since
{Pt(·)} and {Ct(·)} are families of continuous monotone functions and for each
K ∈ (0,∞), P(K) and C(K) are continuous in t. The continuity of Q[f] then
follows from the equi-continuity of the integrands since f′
is a finite measure.
////
Let {Ft} be the filtration defined by
Ft = σ(Su,Pu(K);u ≤ t,K ∈ (0,∞)).
Let {Gt} be a filtration of (Ω,F) with Ft ⊂ Gt ⊂ F for all t ∈ [0,T]. Let Q be
the set of probability measures Q on (Ω,F) such that S,P(K), K ∈ (0,∞) are
7{GQ
t }-local martingales under Q, where GQ
t = ∩u>t(Gu ∨NQ
) and NQ
is the null
sets of the probability space (Ω,F,Q). We suppose that Q is not empty. Note
that as in the construction of the Wiener space, we can use the canonical path
space
Ω0 = {ω = (ω1,ω2);(t,K) 7→ (ω1(t),ω2(t,K)); continuous }
equipped with the compact uniform topology to construct (Ω,F) as its Borel
subspace with the correspondence
St(ω) = ω1(t), Pt(K)(ω) = ω2(t,K)
and prove in fact that Q is not empty in this case by noticing that Ω includes at
least all the Black-Scholes scenarios.
Lemma 2.3 Let f be a convex function and Q ∈ Q. If Q[f] is a tradable asset, then it
is a {GQ
t }-local martingale under Q.
Proof: By monotonicity we have Pt(K) ≤ Pt(S0) for K ≤ S0 and Ct(K) ≤ Ct(S0)
for K ≥ S0 for all t ∈ [0,T]. Let
τn = inf{t > 0;St ∨ Pt(S0) ∨ Ct(S0) ∨ |Qt[f]| ≥ n}
for n ∈ N. Then S·∧τn
, P·∧τn
(KP) and C·∧τn
(KC) are uniformly integrable and so,
{GQ
t }-martingales for all KP ≤ S0 and KC ≥ S0. Let 0 ≤ u ≤ t ≤ T and X be an
arbitraryboundedGQ
u -measurablerandomvariable. ThenbytheFubini-Tonelli
theorem,
EQ[XQt∧τn
[f]] =EQ[Xf(S0)] + EQ[Xf′
(S0)(St∧τn
− S0)]
+
∫
(0,S0]
EQ[XPt∧τn
(K)]f′
(dK) +
∫
(S0,∞)
EQ[XCt∧τn
(K)]f′
(dK)
=EQ[Xf(S0)] + EQ[Xf′
(S0)(Su∧τn
− S0)]
+
∫
(0,S0]
EQ[XPu∧τn
(K)]f′
(dK) +
∫
(S0,∞)
EQ[XCu∧τn
(K)]f′
(dK)
=EQ[XQu∧τn
[f]].
8Since τn → ∞ as n → ∞, Q[f] is a Q-local martingale. ////
We regard the tradable assets as hedging instruments and define the class
of stochastic processes which can be replicated in a model-free manner.
Definition 2.4 We say a {Gt}-adapted process X : Ω×[0,T] → R is attainable, or an
attainable process, if it is continuous Q-almost surely for all Q ∈ Q and if there exists a
finitesetofconvexfunctions f1,... fn, n ∈ NsuchthatQ[fj]isatradableassetforeach
j and that there exists a {Gt}-progressively measurable process (H1
,....Hn
) satisfying
n ∑
j=1
∫ T
0
|H
j
s|2
d⟨Q[fj]⟩s < ∞, Xt = X0 +
n ∑
j=1
∫ t
0
H
j
sdQs[fj]
for all t ∈ [0,T], Q-almost surely for all Q ∈ Q.
Definition 2.5 We say a {Gt}-adapted process X : Ω×[0,T] → R is semi-attainable,
or a semi-attainable process, if it is the sum of an attainable process and a {Gt}-adapted
process whose path is continuous and of finite variation Q-almost surely for all Q ∈ Q.
IfXisanattainableprocess,thenthederivativewithpayoﬀXt withmaturity
t ∈ [0,T] can be hedged with forward replication cost at time s ∈ [0,t] being Xs.
The hedging strategy (H1
,...,Hn
) does not depend on Q. This interpretation
assumes the existence of a local martingale measure which is equivalent to the
law P on (Ω,F) that the underlying asset price S and the put and call option
prices P(K), C(K), K ∈ (0,∞) actually follow. This assumption is equivalent to
the No Free Lunch condition:
M − L+ ∩ L+ = {0},
L+ = {X ∈ L∞
(Ω,F,P) | X ≥ 0},
where M is the subspace of L∞
(Ω,F,P) generated by the elements of the form
Hτ∧σ(Sτ − Sτ∧σ), Fτ∧σ(Pτ(K) − Pτ∧σ(K))
with K ∈ (0,∞), finite {GP
t }-stopping times τ and σ such that supt≥0 St∧τ and
supt≥0 Pt∧τ(K) are bounded, and GP
τ∧σ-measurable bounded random variables
9Hτ∧σ and Fτ∧σ. Here the closure M − L+ of M − L+ is in σ(L∞
,L1
), that is, the
weak ∗ topology. This equivalence follows from Theorem 5.2.3 of Delbaen and
Schachermayer [3]. The point is that we do not specify P but still can replicate
Xt by a model-free hedging strategy, P-almost surely under the No Free Lunch
condition.
## 2.2 Examples of attainable process
Herewegiveexamplesofattainableprocess. Bydefinition,everytradableasset
isanattainableprocess. InparticularS,P(K)andC(K)areattainable. Obviously
the sum of two attainable processes is attainable. Let X be a semi-attainable
process and H be a {Gt}-adapted process whose path is cadlag Q-almost surely
for all Q ∈ Q. Then we can define a {Gt}-adapted process H · X as
H · Xt(ω) :=

  
  
0 if liminfn→∞
∑∞
j=0 Hτn
j
(ω)(Xτn
j+1
∧t(ω) − Xτn
j
∧t(ω)) < R,
liminfn→∞
∑∞
j=0 Hτn
j
(ω)(Xτn
j+1
∧t(ω) − Xτn
j
∧t(ω)) otherwise,
where
τn
0 = 0, τn
j+1 = inf{t > τn
j ;|Ht − Hτn
j
| ≥ 2−n
}.
For any Q ∈ Q, the limit exists and gives a continuous version of the stochastic
integral of H with respect to X, Q-almost surely. See Karandikar [9] for the
detail. If X is attainable, then the defined map H · X is clearly an example of
attainable process. Moreover we can define the quadratic covariation ⟨X,Y⟩ of
two semi-attainable processes X and Y as a measurable map on Ω × [0,T]:
⟨X,Y⟩t(ω) := Xt(ω)Yt(ω) − X0(ω)Y0(ω) − X · Yt(ω) − Y · Xt(ω).
By this definition, XY − ⟨X,Y⟩ is attainable if X and Y are attainable. Put
⟨X⟩ := ⟨X,X⟩ for a semi-attainable process X. This is again semi-attainable.
Proposition 2.6 Let X be an attainable process and f be a diﬀerentiable function with
absolutely continuous derivative f′
defined on a domain which includes the image
{Xt|t ∈ [0,T]}, Q-almost surely for all Q ∈ Q. Then f(X) is semi-attainable and
f(X) −
1
2
∫ ·
0
f′′
(Xt)d⟨X⟩t, ⟨f(X)⟩ −
∫ ·
0
|f′
(Xt)|2
d⟨X⟩t
are attainable.
10Proof: This follows from the Itô-Tanaka formula. ////
Proposition 2.7 Let X be an attainable process. Let hj, j ∈ Z+, be the j-th Hermite
polynomial defined by
exp
{
tx −
t2
2
}
=
∞ ∑
j=0
hj(x)
tj
j!
,
or equivalently,
hj(x) =
∫
R
(x + iz)j
Φ(dz),
where i =
√
−1 and Φ is the standard normal distribution function. Then
e(X) := exp
{
X −
1
2
⟨X⟩
}
,
Hj(X) := ⟨X⟩j/2
hj(⟨X⟩−1/2
X)
are attainable.
Proof: This is because φ(x,t) := exp(x − t/2), φj(x,t) := tj/2
hj(t−1/2
x) satisfy
∂φ
∂t
+
1
2
∂2
φ
∂x2
= 0,
∂φj
∂t
+
1
2
∂2
φj
∂x2
= 0
for any j ∈ Z+. Then apply Itô’s formula to have the result. ////
Corollary 2.8 Attainable are
log(S) +
1
2
⟨log(S)⟩,
Slog(S) +
1
2
S⟨log(S)⟩ − ⟨S,log(S)⟩,
log(S)⟨log(S)⟩ +
1
4
⟨log(S)⟩2
+ (log(S))2
− ⟨log(S)⟩.
## 2.3 Volatility derivatives
AsseeninIntroduction, anyweightedvarianceswapishedgedbyamodel-free
strategy. This fact is described as follows in terms of attainable process.
Proposition 2.9 Let g be a locally integrable non-negative function and fg be defined
by (1). Put V[g] = {Vt[g]}, Vt[g] = Qt[fg] − fg(St). If Q[fg] is a tradable asset, then
V[g] +
∫ ·
0
g(St)d⟨log(S)⟩t
11is attainable and
V[g] =
∫
(0,∞)
min{P(K),C(K)}f′
g(dK), VT[g] = 0.
Proof: This is a combination of Proposition 2.6, the fact that a tradable asset is
attainable, and the identity (4). ////
Thefairstrikeattimes ∈ [0,T]oftheweightedvarianceswapwithmaturity
T and floating leg
∫ T
s
g(St)d⟨log(S)⟩t = VT[g] +
∫ T
0
g(St)d⟨log(S)⟩t −
∫ s
0
g(St)d⟨log(S)⟩t
is therefore given by Vs[g]. Put V = {Vt}, Vt = Vt[1], which represents the fair
strike of the variance swap. Combining Propositions 2.7 and 2.9, we obtain the
following corollary.
Corollary 2.10 If V is finite and continuous, then
V + ⟨log(S)⟩, (V + ⟨log(S)⟩)2
− ⟨V⟩, S(V + ⟨log(S)⟩) − ⟨S,V⟩
are attainable.
In particular we find that the fair strike at time 0 of the swap contract with
maturity T and floating leg ⟨log(S)⟩2
T
− ⟨V⟩T is V2
0
. Since V0 is the expected
value of ⟨log(S)⟩T under the pricing measure Q, we reach a surprisingly simple
conclusion that the variance of ⟨log(S)⟩T under Q coincides with the expected
valueof⟨V⟩T underQ. SimilarlythecovariancebetweenST and⟨log(S)⟩T under
Q coincides with the expectation of ⟨S,V⟩T under Q. The quantity V has been
paid much attention in industry as a model-free measure of the volatility of
S. The CBOE is dealing with the future and options of the VIX that represents
100
√
V0/T with T = 30 days.
Besides the aspect of V as a descriptive statistics of the option data, the
importance of trading the variance swap may be explained as follows. For a
12given Borel function f : (0,∞) → R of polynomial growth, define pf
: (0,∞) ×
[0,∞) → R as
pf
(s,t) =
∫
R
f(sexp{
√
tz − t/2})Φ(dz), (5)
whereΦisthestandardnormaldistributionfunction. Adirectcalculationgives
the partial diﬀerential equation
∂pf
∂t
=
1
2
s2 ∂2
pf
∂s2
(6)
with boundary condition pf
(s,0) = f(s) for all s ∈ (0,∞). One can notice that
S0
t pf
(St,σ2
(T − t)) is the Black-Scholes price at time t with volatility σ of the
European option with payoﬀ f and maturity T. Now taking f = −log, we have
pf
(s,t) = p−log
(s,t) = −log(s) +
t
2
.
By definition, for all t ∈ [0,T],
p−log
(St,Vt) = Qt[−log].
This identity allows us to interpret
√
Vt/(T − t) as the Black-Scholes implied
volatility corresponding to the payoﬀ f = −log. The speciality of this payoﬀ is
that
∂pf
∂t
=
1
2
s2 ∂2
pf
∂s2
=
1
2
,
∂2
pf
∂s∂s
=
∂2
pf
∂t2
= 0.
This “constant Vega” property is attractive to financial practitioners who want
to control their exposure to the volatility risk. As seen in Introduction, trading
the variance swap is essentially equivalent to trading this log contract.
Another payoﬀ enjoying a special property is f(s) = slog(s). For this, we
have that pf
(s,t) = slog(s) + st/2, so that
∂pf
∂t
=
1
2
s2 ∂2
pf
∂s2
=
s
2
,
∂2
pf
∂s∂s
=
1
2
,
∂2
pf
∂t2
= 0.
Let g(s) = s be the identity map and
Gt =
1
St
Vt[g] =
2
St
∫ St
0
Pt(K)
K
dK +
2
St
∫ ∞
St
Ct(K)
K
dK.
13Then
pf
(St,Gt) = Qt[f].
This means that
√
Gt/(T − t) is the Black-Scholes implied volatility correspond-
ing to the payoﬀ f(s) = slog(s). Under the Black-Scholes model with volatility
σ, we have that Gt = Vt = σ2
(T −t) for all t ∈ [0,T]. If the Black-Scholes implied
volatility smile is symmetric at time t, then we still have Gt = Vt. See Carr and
Lee [2] for the detail of this symmetry.
Proposition 2.11 If Q[f] is a tradable asset for f(s) = slog(s), or equivalently, G is
finite and continuous, then
⟨log(S)⟩ + ⟨log(S),G⟩ + G
is attainable. If, in addition, V is finite and continuous, then
⟨log(S),G⟩ + G − V
is attainable.
Proof: Notice that S and G are semi-martingales under Q for any Q ∈ Q. By
Itô’s formula,
dQt[f]
St
=
∂pf
∂s
(St,Gt)
dSt
St
+
1
2
[d⟨log(S)⟩t + dGt + d⟨log(S),G⟩t]
under Q for any Q ∈ Q, which gives the result. If V is finite and continuous, we
can combine this with Corollary 2.10. ////
In particular we find that the fair strike at time 0 of the swap contract
with floating leg ⟨log(S),G⟩T is G0 − V0. This fact has been already found by
Neuberger [10]. By definition, Gt is the fair strike at time t of the Gamma swap
with maturity T, that is, the swap with floating leg
∫ T
t
Su
St
d⟨log(S)⟩u.
Due to the weight Su/St, this swap contract is more attractive than the variance
swap to those who expect some correlation structure between S and ⟨log(S)⟩.
Itô’s formula and Corollary 2.10 give the following corollary.
14Corollary 2.12 If G is finite and continuous, then
SG +
∫ ·
0
Sud⟨log(S)⟩u, SG + S⟨log(S)⟩
are attainable. If, in addition, V is finite and continuous, then
S(G − V) + ⟨S,V⟩
is attainable.
We come back to these attainable processes in the next section. So far we
consider f(s) = −log(s) and f(s) = slog(s) to obtain simple structures of the
higherorderderivativesofpf
whichyieldratherneatattainableprocesses. Next
we treat the power payoﬀ f(s) = 2sα
/(α(α−1)), α ∈ R\{0,1}. A straightforward
calculation gives that
pf
(s,t) =
2
α(α − 1)
sα
exp
{
1
2
α(α − 1)t
}
and
∂pf
∂t
=
1
2
s2 ∂2
pf
∂s2
=
1
2
α(α − 1)pf
=
s
α
∂2
pf
∂s∂t
=
2
α(α − 1)
∂2
pf
∂t2
.
Define Σ(α) = {Σt(α)} by the equation
Qt[f] = pf
(St,Σt(α)),
or equivalently, putting gα(s) = sα
,
Vt[gα] =
2
α(α − 1)
Sα
(
exp
{
1
2
α(α − 1)Σt(α)
}
− 1
)
.
Thefirstidentitymeansthat
√
Σt(α)/(T − t)istheBlack-Scholesimpliedvolatil-
ity at time t corresponding to the payoﬀ f(s) = 2sα
/(α(α − 1)).
Proposition 2.13 If Q[f] is a tradable asset, or equivalently, Σ(α) is finite and con-
tinuous, then
⟨log(S)⟩ + Σ(α) + α⟨log(S),Σ(α)⟩ +
α(α − 1)
4
⟨Σ(α)⟩
is attainable.
15Proof: As in the proof of the previous proposition, Itô’s formula gives that
⟨log(S)⟩t + Σt(α) + α⟨log(S),Σ(α)⟩t +
α(α − 1)
4
⟨Σ(α)⟩t
=
2
α(α − 1)
∫ t
0
dQu[f]
Qu[f]
−
2
α − 1
∫ t
0
dSu
Su
for all t ∈ [0,T]. ////
Corollary 2.14 If V[gα] is finite and continuous, then
V[gα] +
∫ ·
0
Sα
ud⟨log(S)⟩u, SV[gα] +
∫ ·
0
Sα+1
u d⟨log(S)⟩u − ⟨S,V(α)⟩
are attainable. If V[gα+1] is finite and continuous in addition, then
V[gα+1] − SV[gα] + ⟨S,V[gα]⟩
is attainable.
Remark that the cases α = 0 and α = 1 formally correspond to V and G
respectively.
## 3 Implied Leverage
## 3.1 Model-free measure of the leverage eﬀect
Corollary 2.12 implies that the swap contract with maturity T and floating leg
⟨S,V⟩T is replicated with the fair strike at time 0 being S0(G0 − V0) provided
that G and V are finite and continuous. Since V is regarded as the model-
free implied variance (MFIV) of S, the quadratic covariation ⟨S,V⟩T may be
interpreted as the realized leverage eﬀect of S. The fair strike S0(G0 − V0) is the
expectation of ⟨S,V⟩T under the pricing measure Q. Dividing it by S0V0, we
put L0 := G0/V0 −1. By Proposition 2.11 and Corollaries 2.10 and 2.12, L0 is the
the expectation under Q of the following quantities:
1
S0V0
⟨S,V⟩T,
1
V0
⟨log(S),G⟩T,
(
ST
S0
− 1
) ⟨log(S)⟩T
V0
.
In particular it coincides with the covariance of ST/S0 and ⟨log(S)⟩T/V0 under
Q. Since G0 and V0 are uniquely determined by the market prices of the put
16and call options at time 0 without specifying any model, we regard L0 as a
model-free measure of the leverage eﬀect implied by the option market data.
ThisisexactlyinthesamemannerasconsideringV0 tobeamodel-freemeasure
or the market’s expectation of the volatility of S. Motivated by this, we propose
to call L0 the model-free implied leverage (MFIL). Neuberger [10] found that
G0 − V0 = V0L0 is the model-free expectation of ⟨log(S),G⟩T and called it the
slope. Our new approach enabled us to show in particular that ⟨S,V⟩T, that is a
morenatural quantity as a measureof realizedleverageeﬀect, canbereplicated
in a model-free manner as well. The reason why we consider L0 instead of
G0 − V0 is that, as we will see, the former naturally arises as the leading term
of the Black-Scholes implied variance skew. A related property was formally
shown by Neuberger [10], which was the reason why G0 − V0 was called the
slope.
## 3.2 Representation
HerewegivearepresentationformulaoftheMFILintermsoftheBlack-Scholes
implied variance. This is an application of Fukasawa [6] extending Gatheral’s
formula of the MFIV given in Gatheral [8]. The Black-Scholes implied variance
ΣBS(k), k ∈ R at time 0 is defined by
P(S0ek
) = S0QBS(k,ΣBS(k)),
where k represents the log-moneyness of strike price, and
QBS(k,Σ) = ek
Φ(−d2(k,Σ)) − Φ(−d1(k,Σ)),
d2(k,Σ) =
−k − Σ/2
√
Σ
,
d1(k,Σ) = d2(k,Σ) +
√
Σ.
By (3), ΣBS(k) is well-defined for each k ∈ R because Σ 7→ QBS(k,Σ) is strictly in-
creasing and limΣ→∞ QBS(k,Σ) = ek
, limΣ→−∞ QBS(k,Σ) = 0. The prices in option
marketsareusually quoted intermsof the Black-Scholesimplied volatility, that
is,
√
ΣBS(log(K/S0))/T for each strike price K. The following theorem character-
izes G0 and V0 as weighted averages of the Black-Scholes implied variances.
17Theorem 3.1 Suppose that P′
0
is absolutely continuous in K and that there exists
ϵ > 0 such that
1 − P′
0(K) = O(K−1−ϵ
), as K → ∞
and
P′
0(K) = O(Kϵ
), as K → 0.
Then, fi : R ∋ k 7→ −di(k,ΣBS(k)) ∈ R, i = 1,2 are homeomorphisms and
G0 =
∫
R
ΣBS(g1(k))Φ(dk), V0 =
∫
R
ΣBS(g2(k))Φ(dk),
where gi, i = 1,2 are the inverse functions of fi respectively.
Proof: This follows from Theorem 4.1 of Fukasawa [6]. ////
The assumptions in the above theorem are mild regularity and integrability
conditions on the law of ST under the pricing measure Q. The former (the
absolute continuity of P′
0
) is equivalent to say ST admits a density under Q
and the latter is equivalent to say there exists ϵ > 0 such that S1+ϵ
T
and S−ϵ
T
are
integrable under Q. From this theorem it is clear that L0 = G0/V0 − 1 = 0 if the
Black-Scholes implied variance ΣBS(·) is symmetric, that is, if ΣBS(k) = ΣBS(−k)
forallk ∈ R. Therefore, L0 isameasureoftheskewintheBlack-Scholesimplied
volatility surface. As shown in Carr and Lee [2], stochastic volatility models
with no leverage eﬀect enjoys this symmetry property in general. This fact
supports our interpretation that L0 is a measure of the leverage eﬀect.
AsillustratedinFukasawaetal.[7],theabovetypeofrepresentationformula
has a computational advantage compared to one written in terms of direct
integrals of {P0(K),C0(K);K ∈ (0,∞)}. In brief, the formula is involved only with
integrals with respect to the standard normal distribution, which enjoys a nice
relationship with polynomial interpolations of the volatility surface. We use
this formula in our empirical analysis in the last section.
183.3 The Heston model
The model-free hedging theory would be useful in managing financial risks
due to various misspecifications of models especially if the relation between
model-free measures and their counterparts under models is well-understood.
Here we treat the Heston model to illustrate the relation between the MFIL and
the model parameters. Suppose
dSt = St
√
Yt(ρdW1
t +
√
1 − ρ2dW2
t ),
dYt = α(θ − Yt)dt + σ
√
YtdW1
t .
Then, for u ≥ t ≥ 0
y(u) := y(u;t) := E[Yu|Ft] = Yt + E[
∫ u
t
α(θ − Ys)ds],
so
y′
(u) = α(θ − y(u)),
which implies
y(u;t) = θ + (Yt − θ)e−α(u−t)
.
Therefore
Vt =E[⟨log(S)⟩T − ⟨log(S)⟩t|Ft]
=E[
∫ T
t
Ysds|Ft]
=
∫ T
t
y(s;t)ds
=θ(T − t) + (Yt − θ)
1 − e−α(T−t)
α
.
Note that V does not depend on ρ and so has no information on the leverage
eﬀect. On the other hand, since
d(SY)t = YtdSt + StdYt + d⟨S,Y⟩t,
we have for u ≥ t ≥ 0,
x(u) := x(u;t) :=
1
St
E[SuYu|Ft]
=Yt + αθ(u − t) − α
∫ u
t
x(s)ds + σρ
∫ u
t
x(s)ds,
19and so,
x′
(u) = αθ − (α − σρ)x(u).
This implies that
x(u;t) =
αθ
α − σρ
+
(
Yt −
αθ
α − σρ
)
e−(α−σρ)(u−t)
and that
Gt =
1
St
E[
∫ T
t
Sud⟨log(S)⟩u|Ft]
=
1
St
E[
∫ T
t
SuYudu|Ft]
=
∫ T
t
x(s;t)ds
=
αθ
α − σρ
(T − t) +
(
Yt −
αθ
α − σρ
)
1 − e−(α−σρ)(T−t)
α − σρ
.
Thus we can obtain an explicit expression of L0 = G0/V0 − 1. Notice that G
coincides with V if ρ = 0.
We can check directly that
E[⟨log(S),G⟩T − ⟨log(S),G⟩t|Ft] =
1
St
E[⟨S,V⟩T − ⟨S,V⟩t|Ft] = Gt − Vt
as follows. Notice that
E[⟨log(S),G⟩T − ⟨log(S),G⟩t|Ft] = σρ
∫ T
t
1 − e−(α−σρ)(T−s)
α − σρ
y(s;t)ds,
and that
1
St
E[⟨S,V⟩T − ⟨S,V⟩t|Ft] = σρ
∫ T
t
1 − e−α(T−s)
α
x(s;t)ds.
Both of them are 0 at t = T. Diﬀerentiating in T yields
σρθ
α − σρ
(1 − e−(α−σρ)(T−t)
) + (Yt − θ)(e−(α−σρ)(T−t)
− e−α(T−t)
)
=
σρθ
α − σρ
(1 − e−α(T−t)
) +
(
Yt −
αθ
α − σρ
)
(e−(α−σρ)(T−t)
− e−α(T−t)
)
=x(T;t) − y(T;t)
20for both, which proves the identity.
To get a simpler expression of L0, let us consider the fast mean-reverting
region of parameters: σ = σ0/ϵ, α = 1/ϵ2
and ϵ → 0. Then,
L0 =
G0
V0
− 1 =
α
α − σρ
+ O(ϵ2
) = σ0ρϵ + O(ϵ2
).
Therefore L0 is asymptotically proportional to the leverage parameter ρ. This
fact again supports our interpretation of L0 as a measure of the leverage eﬀect.
For the fast mean-reverting stochastic volatility models including the Heston
case with |ρ| < 1, Fukasawa [4] proved the validity of a singular perturbation
expansion of the European option prices. The result for the Heston case gives
as a corollary the asymptotic expansion of the Black-Scholes implied variance
ΣBS(k) = θ
(
1 +
1
2
σ0ρϵ
)
+ σ0ρϵk + O(ϵ2
)
as ϵ → 0 for all k ∈ R. This means that the Black-Scholes implied variance
surface is an aﬃne function of log-moneyness up to O(ϵ2
). Combining this and
our calculation above, we have
ΣBS(k) = V0
(
1 +
L0
2
)
+ L0k + O(ϵ2
).
Therefore the MFIV and MFIL coincide with the baseline and the slope of the
surface respectively. In the next subsection we observe that this remarkable
relation remains valid under a more general perturbation structure.
## 3.4 Asymptotic expansion
Here we consider a sequence of stochastic volatility models which converges to
the Black-Scholes model. This extends the asymptotic analysis in the previous
subsection. We see that the MFIV and MFIL appear in the leading term of
the asymptotic expansion of the Black-Scholes implied variance surface. The
result is obtained as an application of Fukasawa [5]. We introduce an artificial
variable n ∈ N which drives the asymptotics and consider a sequence Qn
∈ Q.
21We suppose (Ω,F,Qn
) = (Ω′
⊗ W,F′
⊗ H,Qn′
⊗ µ), where (Ω′
,F′
,Qn,′
,{F′
t })
is a filtered probability space and (W,H,µ) is the Wiener space with canonical
process W. Let X be an {F′
t }-local martingale under Qn′
for any n ∈ N and F be
an {F′
t }-adapted process. We suppose that S is of the form
log(St/S0) = Mt −
1
2
⟨M⟩t, Mt := Xt +
∫ t
0
FsdWs.
under Qn
for all n ∈ N. This is an abstract representation of S and up to this
point there is essentially no restriction on S other than its continuity. Regarding
Qn
as the pricing measure, the MFIV is given as Vn
:= EQn [⟨M⟩T]. The idea of
the following asymptotic analysis is to consider the pricing measure Q to be in
some sense close to a probability measure QBS
under which ST follows a log-
normal distribution. This generalizes analyses for various perturbation models
around the Black-Scholes model. We embed Q in the sequence Qn
and let Qn
converge to QBS
. By the martingale central limit theorem, this convergence
is equivalent to that the law of ⟨M⟩T under Qn
converges to a constant, which
usuallycoincideswiththelimitofVn
. Byspecifyingtherateofthisconvergence,
we get the following asymptotic expansion result that is a simplified version of
Theorem2.5andCorollary2.6ofFukasawa[5], wheretheyareappliedtomany
concrete examples including the fast mean reverting, regular perturbation and
small vol-of-vol expansions.
Theorem 3.2 Suppose that liminfn→∞ Vn
> 0, limsupn→∞ Vn
< ∞ and that there
exists a positive sequence ϵn with limn→∞ ϵn = 0 such that the law of
(
MT
√
Vn
,
⟨M⟩T − Vn
ϵnVn
√
Vn
)
underQn
convergestoa2-dimensionalnormaldistributionwithcovarianceα. Suppose
also that the p-th absolute moments of
MT
√
Vn
,
⟨M⟩T − Vn
ϵnVn
√
Vn
,
{∫ T
0
F2
sds
}−1
under Qn
are bounded for any p > 0. Then, for any Borel function f with f ◦ exp
22being of polynomial growth,
EQn [f(ST)] =
∫
R
f(S0 exp(
√
Vnz −
Vn
2
))ϕn(z)dz + o(ϵn),
where
ϕn(z) = ϕ(z)
{
1 +
αVn
2
ϵn
(
z3
− 3z
√
Vn
− (z2
− 1)
)}
and ϕ is the standard normal density. Further for all k ∈ R,
ΣBS(k) = Vn
(1 + αϵn(k +
Vn
2
)) + o(ϵn).
Theorem 3.3 In addition to the assumptions in Theorem 3.2, if the law of
STϵ−1
n (⟨log(S)⟩T − Vn
)
under Qn
is uniformly integrable, then
ΣBS(k) = Vn
(1 +
Ln
2
) + Ln
k + o(ϵn),
where Ln
is the MFIL;
Ln
:= EQn
[(
ST
S0
− 1
) ⟨log(S)⟩T
Vn
]
.
Proof: The additional assumption is equivalent to that the law of
exp
(
MT −
1
2
⟨M⟩
)
⟨M⟩T − Vn
ϵnVn
√
Vn
under Qn
is uniformly integrable. Therefore,
Ln
= EQn
[
ST
S0
⟨log(S)⟩T − Vn
Vn
]
= ϵn
√
VnEQn
[
exp
(√
VnN1 −
Vn
2
)
N2
]
+ o(ϵn),
where (N1,N2) follows the 2-dimensional normal distribution appeared in the
assumptions of Theorem 3.2. Since the covariance between N1 and N2 is α,
Ln
= ϵnαVn
+ o(ϵn).
The result then follows from Theorem 3.2. ////
234 The time-series of the MFIV and MFIL
In this section we report some empirical evidence from the time-series of the
MFIV and MFIL of the Nikkei stock average. We show that the MFIL reflected
the fear of the market participants for the eﬀect of a huge earthquake and
tsunami which hit Japan on March 11, 2011. The joint dynamics of the MFIV
and MFIL clearly distinguished the disaster and the financial crisis on 2008, the
two diﬀerent kinds of turmoil. Further we demonstrate a parametric estima-
tion using YUIMA, an R package for estimations and simulations of stochastic
diﬀerential equations. It indicates the existence of independent factors which
drive the time-series of the MFIV and MFIL.
We use the representation obtained in the last section
L0 =
G0
V0
− 1 =
∫
R
ΣBS(g1(z))Φ(dz)
∫
R
ΣBS(g2(z))Φ(dz)
− 1.
See Fukasawa et al. [7] for the advantages of this type of formula compared
to the CBOE’s VIX type formula. Our data are from Nikkei NEEDS, the daily
closing quote prices of call and put options traded on the Osaka Securities
Exchange. We fix T = 30 days = 30/365 year and compute G0 and V0 for every
day from 4 January 2006 to 21 October 2011. Since there is no option with
maturity exactly T = 30 days for every day, we use the option prices with the
closesttwomaturitiesT1 andT2 tocalculatethecorrespondingquantitiesG0(Ti)
and V0(Ti) for i = 1,2 and then interpolate them. For most of days T1 < T < T2.
After this interpolation, we set L0 to be G0/V0 − 1. This idea of interpolation
follows the CBOE’s method for computing the VIX; however we introduce a
slightly diﬀerent interpolation formula in order to avoid unpleasant jumps of
the time-series of L0 which the CBOE’s formula yields. We set
log(G0) = log(G0(T1)) + (log(G0(T2)) − log(G0(T1)))
log(T) − log(T1)
log(T2) − log(T1)
,
log(V0) = log(V0(T1)) + (log(V0(T2)) − log(V0(T1)))
log(T) − log(T1)
log(T2) − log(T1)
.
24Jan 04
2008
Jul 01
2008
Jan 05
2009
Jul 01
2009
Jan 04
2010
Jul 01
2010
Jan 04
2011
Jul 01
2011
Oct 21
2011
−0.2 −0.1 0.0 0.1 0.2
Implied Leverage and Implied Variance (2008−)
−1.0 −0.5 0.0 0.5 1.0
Implied Leverage
Implied Variance
Figure 1: The time-series of the MFIL and MFIV
Thisis thelog-linearinterpolation, whiletheCBOEusethelinearinterpolation.
Figure 1 shows the time-series of the MFIL and MFIV divided by T. The
MFIV divided by T, or Implied Variance, took its maximum 0.96 on 27 October
2008 in the middle of a financial crisis. The MFIL divided by T, or Implied
Leverage, stayed negative in this period and took its minimum -0.15 on 16
March 2011, when the damage caused by an earthquake and tsunami which hit
Japan on 11 March had been recognized in detail. During the financial crisis
the MFIL was strongly negative as well but its reaction to the huge disaster was
muchstronger. IncontrastthepeakoftheMFIVafter11Marchdidnotreachits
level for the financial crisis and it quickly came back to the usual level. Recall
that the MFIV is, or more precisely its annualized square root is sometimes
referred as the fear gauge due to its negative relation to the market return. If
one was monitoring the MFIV only, he might conclude that the market’s fear
was over soon after the earthquake. On the other hand, as clearly seen from the
25−3 −2 −1 0 1 2 3
−4 −3 −2 −1 0
Normal QQ plot: Log(V)
Theoretical Quantiles
Sample Quantiles
−3 −2 −1 0 1 2 3
−7 −6 −5 −4 −3 −2
Normal QQ plot: Log(−L)
Theoretical Quantiles
Sample Quantiles
Figure 2: Normal QQ plots
figure, the MFIL have stayed at unusual level, which means that the negative
eﬀect of the disaster to the market sentiment was not over at all. The MFIL
may be regarded as the fear gauge of the fear gauge in that it measures how
strongly the fear gauge is correlated to the underlying market return. In light
of the result in the previous section, the Black-Scholes implied volatility skew
became more strongly negative after the earthquake. First both of the call and
put option prices jumped up. Then the OTM call prices came back to the usual
level soon, while the OTM put prices remained high. Consequently, the MFIL
provides an important information which we cannot derive from the MFIV
solely.
Figure 2 presents the normal QQ plots of the time-series log(V0/T) and
log(−L0/T). These suggest that the ergodic distributions of the two processes
are, if they exist, not so far from normal distributions. The most elementary
diﬀusion process that has a normal distribution as its ergodic distribution is
the OU process. Motivated by this observation, here we conduct a parametric
26estimation by assuming X1
:= log(V0/T) and X2
:= log(−L0/T) to follow
dX1
t = (a1 + b1X1
t + c1X2
t )dt + σ1dW1
t ,
dX2
t = (a2 + b2X1
t + c2X2
t )dt + ρdW1
t + σ2dW2
t
where (W1
,W2
) is a standard Brownian motion. We use YUIMA, an R package
for inference and simulations for stochastic diﬀerential equations, to obtain the
following quasi-maximum likelihood estimates;
(a1,a2,b1,b2,c1,c2,σ1,σ2,ρ)
= (−10.26,−18.60,−6.10,4.90,1.59,−8.64,2.21,2.27,1.23)
with standard deviation
(4.33,5.07,1.91,2.24,1.67,1.95,0.04,0.04,0.06).
In particular the 99% confidence interval for σ2 is (2.17,2.37), which means that
the value for σ2 is significant, so that the MFIL contains a factor which is not
explained by the movement of the MFIV. The standard deviations for the drift
coeﬃcients are large in contrast to those for the diﬀusion coeﬃcients. This is
consistent with what the the theory of high-frequency data analysis suggests.
See for example Yoshida [12] for the detail of the quasi-likelihood estimation
for diﬀusion processes. Due to the large standard deviation, the value for c1 is
not significant. We may therefore consider a reduced model
dX1
t = (a1 + b1X1
t )dt + σ1dW1
t ,
dX2
t = (a2 + b2X1
t + c2X2
t )dt + ρdW1
t + σ2dW2
t
and compare with the full model by CIC proposed by Uchida [11]. The CIC,
standing for Contrast-based Information Criterion, is a criterion for model
selection and defined as
CIC = −2l(θ̂qmle) + 2dim(Θ),
where l : Θ → R is a quasi-log-likelihood function, θ̂qmle is the quasi-maximum
likelihood estimator and Θ is the domain of unknown parameters. For the full
model, dim(Θ) = 9 and for the reduced model, dim(Θ) = 8. The smaller the
27CIC, the better the model is expected to predict the distribution of the time-
series. Again by YUIMA, we get the quasi-maximum likelihood estimates
(a1,a2,b1,b2,c2,σ1,σ2,ρ)
= (−12.61,−19.89,−4.75,5.66,−9.54,2.21,2.27,1.23)
with standard deviation
(3.57,4.88,1.29,2.10,1.72,0.04,0.04,0.06).
The CIC for the full model is −3080.59 and that for the reduced model is
−3081.67. The CIC therefore suggests to select the latter. The 99% confidence
interval for σ2 is the same as before, so the value for σ2 remains significant.
So far we confirmed that the MFIL conveys an additional information to the
MFIV. More detailed empirical analysis is left for future research.
## 5 Conclusion
In this paper we have developed a rigorous formulation of robust replication
theory for volatility derivatives. We have introduced several new derivatives,
one of which is a swap contract on the quadratic covariation between an as-
set price and the model-free implied variance (MFIV) of the asset. It can be
replicated in a model-free manner and its fair strike can be interpreted as a
model-free measure for the covariance of the asset price and the realized vari-
ance. Based on this, we have proposed to call the fair strike the “model-free
implied leverage” (MFIL). We have given a simple representation formula for
the MFIL in terms of the Black- Scholes implied volatility. We have also shown
itssimplerelationtotheBlack-Scholesimpliedvolatilityskewbyanasymptotic
method. Some explicit calculations under the Heston model have been given,
and some empirical evidence from the time series of the MFIV and MFIL of the
Nikkei stock average have been reported. Left for future research are exten-
sions to semi-martingales with jumps, extensions to discrete-time rebalancing,
28managing discrete sets of strike prices for call and put options, applications
to hedging other derivatives, modeling of the time-series of the MFIL, and
empirical analysis for its ability to predict the realized leverage and market
returns.
Acknowledgement: The author is grateful to anonymous Managing Editor
and Referee for their suggestions to improve the quality of this paper. This
work is supported by Japan Society for the Promotion of Science, KAKENHI
(Grants-in-Aid for Scientific Research) Grant Numbers 22243021 and 24684006.
References
[1] Carr, P. and Lee, R. (2009): Volatility Derivatives, Annu. Rev. Financ. Econ.
1:1-21.
[2] Carr, P. and Lee, R. (2009): Put-Call Symmetry: Extensions and Applica-
tions, Math. Finance, 19, 523-560.
[3] Delbaen, F. and Schachermayer, W. (2006): The Mathematics of Arbitrage,
Springer Finance.
[4] Fukasawa, M. (2011): Asymptotic analysis for stochastic volatility: Edge-
worth expansion, Electronic J. Probab. 16, 764-791.
[5] Fukasawa, M. (2011): Asymptotic analysis for stochastic volatility: mar-
tingale expansion, Finance Stoch. 15, 635-654.
[6] Fukasawa, M. (2012): The normalizing transformation of the implied
volatility smile, Mathematical Finance 22, 753-762.
[7] Fukasawa, M., Ishida, I., Maghrebi, N., Oya, K., Ubukata, M. and Ya-
mazaki, K. (2011) Model-free implied volatility: from surface to index,
International J. Theor. Appl. Finance 14, 433-463.
29[8] Gatheral, J. (2006): The Volatility Surface: A Practitioner’s guide, Wiley Fi-
nance.
[9] Karandikar, R.L. (1995): On pathwise stochastic integration, Stochastic
Process. Appl. 57 (1995), no. 1, 11-18.
[10] Neuberger, A. (2009): The Slope of the Smile, and the Co-
movement of Volatility and Returns, Available at SSRN:
http://ssrn.com/abstract=1358863
[11] Uchida, M. (2010): Contrast-based information criterion for ergodic diﬀu-
sionprocessesfromdiscreteobservations,Ann.Inst.Stat.Math.62,161-187.
[12] Yoshida,N.(2011): Polynomialtypelargedeviationinequalitiesandquasi-
likelihood analysis for stochastic diﬀerential equations, Ann. Inst. Stat.
Math. 63, 431-479.
30