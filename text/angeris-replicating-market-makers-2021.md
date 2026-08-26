---
sha256: d972f2141c55495bc2570e10103fb5850cba004e8d504b4c55b862d75712da90
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 42661
---
Replicating Market Makers
Guillermo Angeris
angeris@stanford.edu
Alex Evans
alex@placeholder.vc
Tarun Chitra
tarun@gauntlet.network
March 2021
Abstract
We present a method for constructing Constant Function Market Makers (CFMMs)
whose portfolio value functions match a desired payoff. More specifically, we show that
the space of concave, nonnegative, nondecreasing, 1-homogeneous payoff functions and
the space of convex CFMMs are equivalent; in other words, every CFMM has a concave,
nonnegative, nondecreasing, 1-homogeneous payoff function, and every payoff function
with these properties has a corresponding convex CFMM. We demonstrate a simple
method for recovering a CFMM trading function that produces this desired payoff. This
method uses only basic tools from convex analysis and is intimately related to Fenchel
conjugacy. We demonstrate our result by constructing trading functions corresponding
to basic payoffs, as well as standard financial derivatives such as options and swaps.
Introduction
Constant Function Market Makers (CFMMs) [AC20] are a family of automated market
makers that enable censorship-resistant asset exchange on public blockchains. CFMMs are
capitalized by liquidity providers (LPs) who supply reserves to an on-chain smart contract.
The CFMM uses these reserves to execute swaps for traders, allowing a swap only if it
preserves some function of reserves, known as the trading function or invariant. For example,
Uniswap [ZCP18] only allows trades that keep the product of the reserves after the trade
equal to the product of the reserves before the trade.
A key question first explored in [AKC+
19] concerns the returns that LPs receive for their
capital. As shown in [AC20], the value of the LP’s assets in a CFMM can be determined
by solving a convex problem over the CFMM’s trading set. This method allows one to
compute explicit expressions for the value LPs receive from most popular CFMMs, such as
Uniswap and Balancer, as well practical lower bounds for a larger class for trading functions.
Additional work such as [AEC20, EAC21] has explored the impact of parameters such as
trading-function curvature and swap fees on LP returns.
Here, we consider what may be called the ‘inverse’ problem. Rather than deriving the
LP’s payoff for a given trading function, we seek to find the trading function that guarantees
1
arXiv:2103.14769v1 [q-fin.MF] 26 Mar 2021that LPs receive a certain payoff. By contributing capital to the CFMM, LPs will statically
replicate their desired payoff. This is a generalization of the problem considered in [Eva20, §5]
that shows how to replicate continuously-differentiable payoffs using constant mean trading
functions with dynamically-adjusted weights. These constructions require continual updates
from on-chain oracles that may be expensive, complex to manage, and are often vulnerable to
front-running attacks. In contrast, the trading functions we derive in this work are not time-
varying and do not depend on external price oracles, so they are likely easier to implement
in practice.
Hedging. One obvious question is: why would one want to implement such desired payoffs?
Trading on blockchains has a number of idiosyncrasies that make dynamic hedging strategies
expensive to execute. In particular, unlike centralized venues, most blockchains prevent spam
and denial of service attacks by charging users a fee per transaction. This fee, known as gas
on networks like Ethereum, can be a dominant cost to on-chain traders during times of high
market volatility [DGK+
19, KCCM20]. Moreover, the volatility of gas costs on Ethereum
makes on-chain dynamic hedging strategies more complex to manage successfully.
In contrast, CFMMs allow the LP to achieve a desired payoff by passively contributing
capital. Rather than requiring LPs to continually rebalance their holdings through on-chain
trades, CFMMs incentivize arbitrageurs to adjust reserves to the level required to achieve
their desired hedge. In effect, this approach outsources the cost and complexity of on-chain
trading to specialized parties. As discussed in §A, the added simplicity for the hedger is
not without trade-offs as LPs are subject to arbitrage losses. However, small fees have been
shown mitigate these costs in certain settings [EAC21].
Limitations. The payoffs one can replicate using the methodology presented in this paper
are limited to concave, nonnegative, nondecreasing functions of price. An instructive analogy
is as follows. In limit order books, a resting limit order can roughly be thought of as an
option which the market maker sells to participants—who are executing market (liquidity
removing) orders—that allows them to purchase or sell a quantity of an asset at a given
price [Gre16, Chapter 6]. (The precise replication of a market maker’s portfolio of limit
orders as a covered options is complicated somewhat by the fact that trades depend on the
positions in the queue [FMT07, MY14], but this point is not essential here.) Being short
an option generates a concave, or ‘negative gamma,’ payoff. By virtue of allowing users to
execute a set of trades at predetermined prices, CFMMs can also be seen as having negative
gamma payoffs which lead to ‘impermanent loss’ [AC20, AEC20, Cla20] for LPs. On the
other hand, replicating convex payoffs (such as long positions in options) requires the ability
to short shares in a CFMM, or to use external price oracles, as described in [Eva20].
Summary. The outline of this article is as follows. In the next section, we describe the
problem of constructing a trading function that produces a CFMM with a desired payoff
function. In §1, we present some basic definitions along with a solution method for recovering
the desired trading set and corresponding (equivalent) trading functions. We derive trading
2functions for some basic examples such as linear and quadratic payoffs in §2. In §3, we
proceed with practical applications, such as recovering the constant-mean function used in
Balancer [MM19] as well as constructing trading functions for replicating the Black-Scholes
prices of covered European calls and perpetual American puts. We give some possible future
directions in §4.
## 1 General solution
In this section, we will present a general method for constructing a CFMM trading function
whose value function matches a desired payoff function, within a reasonable domain. We
start with some basic definitions and provide a relatively general solution method. We
continue with some basic (and not so basic) applications of the method.
Trading function. A (path independent) CFMM is defined by its trading function ψ :
Rn
→ R and its reserves R ∈ Rn
+. The reserve Ri specifies the quantity of coin i available
to the CFMM contract, while the function ψ specifies the behavior of the contract. More
specifically, the contract will allow any agent to trade with the reserves, so long as the new
reserves, R0
∈ Rn
+, after the agent has added or withdrawn the required quantities, satisfy
ψ(R0
) ≥ ψ(R).
Some definitions require that the inequality be an exact equality, but this point is not
essential, since, in practice ψ can always be made an increasing function in its arguments,
so any rational agent will ensure that the inequality is saturated; see, e.g., [AC20, §2.1] for
more.
Portfolio value function. We will assume there exists some external market with a fixed
reference price c ∈ Rn
+. Here c is the price vector for the n coins the CFMM trades, such that
ci is the price of coin i in this external market. We will call the total value of reserves, after
arbitrage, the portfolio value or liquidity provider payoff of a CFMM, represented by some
function V : Rn
+ → R. In the case where the CFMM is path-independent, with concave
nonincreasing trading function ψ : Rn
→ R and constant k, [AC20, §2.5] shows that the
function V is equal to
V (c) = inf{cT
R | ψ(R) ≥ k, R ∈ Rn
+}.
The economic interpretation of this definition of V is simple: an arbitrageur is engaged in
a zero-sum game with liquidity providers. The arbitrageur’s payoff is maximized when the
portfolio value, cT
R, of a liquidity provider is minimized over the valid reserves R; i.e., those
that satisfy ψ(R) ≥ k. (This is a simple restatement of the optimal arbitrage problem. For
more see, e.g., [AC20, EAC21].)
Very generally, we will define the portfolio value over a feasible set of reserves S ⊆ Rn
as
V (c) = inf{cT
R | R ∈ S}. (1)
3This includes the previous definition by setting S = {R ∈ Rn
+ | ψ(R) ≥ k}, and this
‘more general’ definition will slightly simplify the derivation presented below. (In fact, both
definitions are equivalent in that, given a convex set S, we can construct a concave function
ψ whose 0-superlevel set is equal to S. We give an explicit construction later in this section.)
Desired payoff. One very natural question is: given a desired payoff function (i.e., a
desired V ), is it possible to create a trading function ψ which results in this payoff? Another
slightly more casual way of phrasing this problem is: can we ‘invert’ formula (1), given V ?
In general, the answer is no. It is nearly immediate, given any ψ, the function V is
always a concave function because it is the infimum of a family of linear functions, indexed
by R ∈ S. Second, because V (c) is some infimum over cT
R with both c and R nonnegative,
it must be nonnegative. Third, given any c0
≥ c ≥ 0, we have that
V (c0
) = V (c + c0
− c) ≥ V (c) + V (c0
− c) ≥ V (c),
so V is nondecreasing in its arguments. And, finally, note that the function V is 1-
homogeneous in terms of c, by definition; i.e., for any η ≥ 0, the payoff function V satisfies
V (ηc) = ηV (c).
This limits the set of payoff functions we can find a CFMM trading function for, since
V must be concave, nonnegative, nondecreasing, and 1-homogeneous in order for there to
exist a CFMM trading function with V as its liquidity provider payoff. (We will see that
1-homogeneity is not as strong of a condition as it appears at first glance, and we show how
to deal with this in §2.)
Consistent payoff functions. We will then say V is a consistent payoff function if it is
concave, nonnegative, nondecreasing, and 1-homogeneous. Clearly, then, the value function
of any CFMM will always be consistent, from the discussion above. In the next section, we
will also see that the converse of the above statement is true: any consistent payoff function
has a path independent CFMM that yields this payoff. We will also show how to construct
a CFMM with a desired consistent payoff.
Discussion. The conditions above all have nice economic interpretations. The concavity
of the function implies that ‘impermanent loss’, also known as ‘negative gamma’ in finance,
is an intrinsic property of liquidity provision in path-independent CFMMs, as it holds for
any possible CFMM in practice. The nonnegativity simply implies that a liquidity provider
position always has nonnegative value, while the fact that V is nondecreasing implies that
the position of liquidity providers does not get worse as coins increase in value. Finally,
the 1-homogeneity is a notion of ‘scale-invariance,’ i.e., scaling the numéraire should simply
scale the total portfolio value of a liquidity provider’s position. While we have shown that
these conditions are necessary, we will also show that they are sufficient in the remainder of
this section.
41.1 Solution method and equivalence
The method presented here can be seen as a special case of Fenchel conjugacy, with some
slight modifications. Though not necessary, since we will introduce the tools required in this
note and give self-contained proofs, the results here are essentially corollaries of well-known
theorems in convex analysis, with the most notable being strong duality. We refer the reader
to, e.g., [BV04, §5] for further reading.
Given a consistent payoff function V , we will first find a set of reserves S corresponding
to the payoff function V . We will then show that the set S will also have V as its payoff
function, as defined in (1). We then find an explicit trading function, ψV , whose 0-superlevel
set is equal to S and therefore has the desired payoff function, V .
Feasible reserve set. Given some concave payoff function V : Rn
+ → R, we will define
its feasible reserve set S ⊆ Rn
+ as
S = {R ∈ Rn
+ | V (c) ≤ cT
R, for all c ∈ Rn
}. (2)
In other words, S is the set of reserves for which the portfolio value of the reserves, at any
cost vector c, is always no smaller than V (c). Note that the set S is convex as it is the
intersection of a family of hyperplanes parametrized by c.
## 1.1.1 Equivalence
We will show that, if V is a nonnegative, concave, 1-homogeneous payoff function with
feasible reserve set S, then S has payoff, as defined in (1), given by V .
Using the definition of S in (2), we can rewrite problem (1) in extended form
minimize cT
R
subject to V (q) ≤ qT
R, for all q ∈ Rn
,
(3)
with variable R ∈ Rn
. We will write V ?
(c) for the optimal value of (3), which depends on c.
Lower bound. Clearly, we know that
V ?
(c) ≥ V (c),
since, if R?
is optimal for c, then
V ?
(c) = cT
R?
≥ V (c),
where the inequality follows from the fact that R?
is a feasible point for problem (3). (In
the case that an optimal value doesn’t exist, though one can show it always does, we may
replace R?
with a sequence that is feasible and converges to the optimal value.)
5Upper bound. It will suffice to show that there exist some reserves R ∈ S such that
cT
R = V (c); i.e., R is feasible for problem (3) with objective value equal to V (c). Because
R is feasible for (3), then, by definition of optimality, we will have that cT
R ≥ V ?
(c), as
required.
First, pick any R ∈ ∂V (c); i.e., R is a supergradient of V at c, such that, for any q ∈ Rn
we have
V (q) ≤ V (c) + RT
(q − c). (4)
Such an R exists because V is a concave function and is nonnegative because V is nonde-
creasing. (As a side note, R is equal to ∇V (c) when the function V is differentiable at c.
See, e.g., [Roc70, Thm. 25.1].) Now, let q = 0 in (4) to get
cT
R ≤ V (c),
where V (0) = 0 by the homogeneity of V . On the other hand, let q = 2c in (4) to get
V (2c) ≤ V (c) + cT
R.
Since V (2c) = 2V (c) because V is 1-homogeneous, we have
V (c) ≤ cT
R,
so V (c) = cT
R. We can now rearrange (4) to get
V (q) − qT
R ≤ V (c) − cT
R = 0,
for any q, which means that R ∈ S by the definition of S in (2). From before, this means
that R is feasible for (3) and, because its objective value is cT
R = V (c), we must have that
V (c) ≥ V ?
(c).
Result. Putting both statements together yields that V (c) = V ?
(c) for every c, and there-
fore the set S has the desired payoff. In fact, the proof given above has a few simple but
important consequences. For example, dropping the monotonicity requirement on V implies
that there might exist reserves in S which are negative. One way to deal with such a problem
is to take the intersection of S with the nonnegative reals, S ∩ Rn
+, but then V need not
equal V ?
as defined above, and the proof above also gives a simple way of quantifying the
gap. Similar results and extensions also hold for the nonnegativity requirement for V , the
concavity of V , and so on, which we leave as open questions for future research.
## 1.1.2 Constructing a trading function
From the previous discussion, given a desired payoff function V we can easily find a trading
set S such that S has payoff equal to V . While this may suffice for some applications, it is
often easier to work with the functional form of a CFMM. More specifically, we will look for
a concave trading function ψS such that some superlevel set of the function is equal to the
set S.
6One example of such a functional form (there are many equivalent ones) is given by
ψV (R) = inf
c
(cT
R − V (c)), (5)
where c ∈ Rn
ranges over all real n-vectors. This function has the desired property since
ψV (R) ≥ 0, if, and only if, cT
R ≥ V (c) for all c ∈ Rn
,
and therefore ψV (R) ≥ 0 if, and only if, R ∈ S, so ψV can be used as the CFMM trading
function, as required. We also note that ψV is the negative Fenchel conjugate of −V , with
negated arguments, i.e.:
ψV (R) = −sup
c
(−cT
R − (−V )(c)) = −(−V )∗
(−R).
This equation, along with the portfolio value equation in [AC20, §2.5] implies, roughly speak-
ing, that the portfolio value function and the trading function for a CFMM are essentially
Fenchel conjugates of each other.
Discussion. In general, unless certain conditions are satisfied, it is possible that applying
equation (5) directly to any desired payoff function V need not yield a CFMM whose payoff
function is equal to V at all prices. We only guarantee equality in the case that V is
consistent, but find that this procedure is also useful in cases where V is not. (As discussed,
the proof given in §1.1.1 gives a way of quantifying how much the payoff might differ in
cases where V is not consistent.) Additionally, we note that the function (5) will always be
a set-indicator function; i.e., ψV will always be either 0 or +∞ at every point, due to the
1-homogeneity of V . In some cases, the set-indicator description can be simplified, but this
need not always be true.
## 2 Basic examples and properties
We show two basic examples, where the desired payoff is linear and, later, quadratic, and
introduce some basic tools which help simplify derivations.
## 2.1 Linear payoffs and offsets
In this case, we will find a CFMM that produces a linear payoff function; i.e., what is a
CFMM that corresponds to the payoff function:
V (c) = aT
c,
where c ∈ Rn
+, a ∈ Rn
+. It is not difficult to intuit what the behavior of the LP (and
therefore, of the CFMM’s trading function) should be. In order to replicate this payoff, the
LP should simply hold ai of asset i, which would be equivalent to the CFMM disallowing
any trades other than the null trade. We will apply the method to this example, where the
solution is known, as a simple, but potentially useful exercise.
7Linear payoff. As before, we have that
ψV (R) = inf
c
(cT
R − aT
c) = inf
c
((R − a)T
c) =
(
0 R = a
−∞ otherwise,
which is exactly the CFMM we expect from the intuitive result: the CFMM can only allow
trading if it a trade leaves the reserves at a.
Linear offsets. A useful and general tool used in the previous derivation is that a linear
offset of the payoff function V results in a linear offset of the arguments of the trading
function. More specifically, given a payoff function V , with trading function ψV , the trading
function corresponding to the ‘linearly offset’ payoff:
V 0
(c) = V (c) + aT
c (6)
where a ∈ Rn
+, is
ψV 0(R) = ψV (R − a).
This follows immediately from (5) and has an obvious economic interpretation: any linear
offset in the value function is simply equivalent to adding that quantity of coins to the
reserves. This may help in simplifying derivations since a number of payoffs are simply
linear offsets of other, potentially well-known payoff functions.
## 2.2 Perspective transform and quadratic payoffs
It is also sometimes easier in practice to specify the payoff with respect to a numéraire,
rather than with respect to a general price vector. For example, if we assume that the nth
coin is the numéraire, and c0
is the price vector for the first n − 1 coins with respect to the
nth coin, then this is equivalent to specifying the ‘reduced payoff function’ U(c0
) for each
c0
∈ Rn−1
, which depends only on the first n − 1 coins.
Perspective transform. A simple approach to constructing an n coin, 1-homogeneous
payoff function that is concave, nonnegative whenever U is also concave, nonnegative is by
the use of the perspective transform of U, which we define here as the function V : Rn
→ R
such that
V (c0
,cn) =
(
cnU(c0
/cn) cn > 0
−∞ otherwise,
(7)
where c0
∈ Rn−1
+ is the price of the first n − 1 coins while cn ∈ R+ is the price of the
numéraire. The concavity of V , given the concavity of U, follows from a basic argument
(see, e.g., [BV04, §3.2.6]), while positivity is immediate from the definition. The fact that
V is 1-homogeneous is easy to see as well since, if cn > 0 and η > 0 we have
V (ηc0
,ηcn) = (ηcn)U(ηc0
/ηcn) = η(cnU(c0
/cn)) = ηV (c0
,cn),
8while the case where cn = 0 is obvious. Additionally, it is worth noting that
V (c0
,1) = U(c0
),
so this recovers the original payoff when the numéraire’s value, cn, is set to 1, as expected.
Quadratic payoff. Given the affine case, the next natural question is, can we find the
CFMMs corresponding to more complicated payoff functions? For this case, we will consider
a CFMM whose payoff is a concave quadratic. To our knowledge, a CFMM of this form is
not known in the literature, but the procedure above gives a simple derivation. In particular,
we want a CFMM that yields a payoff of
U(c0
) = −
1
2
(c0
)T
Ac0
+ bT
c0
+ d,
where A is a strictly positive definite matrix (the case of positive semidefinite matrices is also
easy to identify, but requires some additional conditions on b and the nullspace of A, which
we leave as a simple extension). Note that this is not positive everywhere so the payoff of
this CFMM cannot match that of V 0
everywhere. On the other hand, we will see that both
are equal within some specific set of cost vectors c0
.
To start, we will first consider the perspective transformation (7) of V 0
to get
V (c0
,cn) =
1
2cn
(c0
)T
Ac0
+ bT
c0
+ dcn.
Using (6), it suffices to consider the simpler function
V (c0
,cn) = −
1
2cn
(c0
)T
Ac0
,
as the rest is simply a linear offset of this function, which follows from the previous discussion.
From (5) we have
ψV (R0
,Rn) = inf
cn>0,c0
((R0
)T
c0
+ Rncn − V (c0
,cn))
where R0
∈ Rn−1
+ are the reserves of the first n−1 coins, while Rn ∈ R+ is the reserve of the
numéraire. To find ψV we will first partially minimize over c0
, using the first order optimality
conditions, to get
ψV (R0
,Rn) = inf
cn>0

Rncn −
cn
2
(R0
)T
A−1
R0

.
so
ψV (R0
,Rn) =
(
0 1
2
(R0
)T
A−1
R0
≤ Rn
−∞ otherwise.
Finally, adding the linear offset V (c0
,cn) → V (c0
,cn) + aT
c0
+ bcn, using (6) gives
ψV (R0
,Rn) =
(
0 1
2
(R0
− a)T
A−1
(R0
− a) ≤ Rn − b
−∞ otherwise,
9as required. Note that, because U(c0
) is negative and decreasing for large enough c0
, the
payoff may not be correctly replicated at all possible price vectors c0
. In fact it is not hard
to show that once c0
is outside of some compact set, the resulting payoff is always 0, and we
leave this as a simple, but interesting, exercise for the reader.
## 3 Practical applications
In this section, we outline several practical applications of this general solution method in
the more specific case where we have two coins, a traded coin and the numéraire. The first
example gives a simple way of reconstructing the well-known constant mean market makers,
such as those created and implemented by Balancer, by attempting to replicate an intuitive
payoff function.
We then proceed with a realistic financial product, the covered call. We present both
static replication of the asset payoff at expiry and of the option price using the Black-Scholes
model. In [Eva20] it was shown that the covered call can be statically replicated by a constant
mean market maker with dynamic weights. The replication methodology used here does not
require one to update the trading function using an external price oracle. We expect that
this will reduce the cost and complexity of implementing these CFMMs in practice. Finally,
we present the example of a perpetual American put option. In this subsection, unlike in the
previous subsections, we have that c1 ∈ R+, R1 ∈ R+, and R2 ∈ R+ are all scalar quantities,
where c1 is the price of the asset in question.
## 3.1 Balancer
We can recover some known payoff functions in a few important cases. For example, we can
ask: what is a CFMM trading function whose payoff is a (concave) power of the price? In
other words, can we find a CFMM whose payoff is:
U(c1) = cw
1 ,
for some 0 < w < 1? As is known in the literature (see, e.g., [AC20, Eva20, MM19]) we will
see that the trading function for Balancer, or that of a constant mean market, is one such
trading function (and, in fact, will be the trading function we recover).
Taking the perspective of U as in (7), we have, where c2 is the new variable (the ‘price
of the numéraire’), we have
V (c1,c2) = cw
1 c1−w
2 .
(Note that V is then the weighted geometric mean of c1 and c2 with weights (w,1−w).) So,
we can recover the trading function by using (5),
ψV (R1,R2) = inf
c2>0,c1
(c1R1 + c2R2 − V (c1,c2)).
This implies that
ψV (R1,R2) =
(
0 R1
w
w R2
1−w
1−w
≥ 1
−∞ otherwise.
(8)
10It is also easy to show that
ψ(R1,R2) =

R1
w
w 
R2
1 − w
1−w
is equivalent to ψV . We can of course simplify this further by dropping the constant multiplier
w−w
(1 − w)−(1−w)
, which yields the usual form for constant mean markets; i.e.,
ψ(R1,R2) = Rw
1 R1−w
2 .
To show (8), we consider three separate cases. First, R1,R2 ≥ 0, otherwise ψV is un-
bounded from below. On the other hand, if

R1
w
w 
R2
1 − w
1−w
< 1,
then picking c1 = tw/R1 and c2 = t(1 − w)/R2 for t ∈ R with t ≥ 0 means that
ψV (R1,R2) ≤ c1R1 + c2R2 − V (c1,c2) = t 1 −

R1
w
−w 
R2
1 − w
−(1−w)
!
| {z }
<0
→ −∞,
as t → ∞. Finally, if 
R1
w
w 
R2
1 − w
1−w
≥ 1,
then, using the weighted AM-GM inequality we find, for any c1,c2 > 0,
c1R1 + c2R2 = wc1
R1
w
+ (1 − w)c2
R2
1 − w
≥

c1
R1
w
w 
c2
R2
1 − w
1−w
≥ cw
1 c1−w
2 ,
which means that ψV (R1,R2) ≥ 0. Clearly, equality is achievable by choosing c1,c2 ↓ 0,
yielding (8).
This proof easily generalizes to the case where c ∈ Rn
+ and
V (c) =
n Y
i=1
cwi
i ,
where 1T
w = 1 and wi > 0 for i = 1,...,n, with equivalent trading function, for R ∈ Rn
+,
ψ(R) =
n Y
i=1

Ri
wi
wi
.
(This is just the n coin constant mean market maker, e.g., Balancer, as is used in practice.)
113.2 Covered call at expiry
In the following examples, we assume that we have a ‘risky’ asset with reserve amount R1
and a ‘risk-free’ asset with reserve amount R2. We seek to find the trading function that
corresponds to certain derivative securities. We will restrict our attention to ‘covered’ in-
struments whose replication does not require short positions in either asset (negative reserve
quantities). We note that lending markets and offsetting positions have been proposed as
solutions for replicating these types of instruments [Eva20], but do not explore this further
in this work.
In this first application, we consider the terminal payoff of a covered call. This strategy
involves combining a long position in the risky asset with a short position in a call option on
the risky asset. A covered call allows the writer to generate additional income from a long
position in exchange for giving up upside for prices above the strike. At expiry, the payoff
of a covered call with strike K at expiry is
U(c) = c1 − max(c1 − K,0)
We take the perspective,
V (c1,c2) =
(
c1 c1 < K
c2K c1 ≥ K.
For (R1,R2) ∈ R2
+, we have the trading function
ψV (R1,R2) = sup
c
(V (c1,c2) − c1R1 − c2R2) = min{f1(R1,R2),f2(R1,R2)}
where
f1(R1,R2) = sup
c1≥K,c2>0
(c1 − c1R1 − c2R2) =
(
K − KR1 − R2 = 0 (R1,R2) = (1,0)
+∞ otherwise
and
f2(R1,R2) = sup
c1<K,c2>0
(c2K − c1R1 − c2R2) =
(
K − KR1 − R2 = 0 (R1,R2) = (0,K)
+∞ otherwise.
We therefore have the trading function,
ψV (R1,R2) = sup
c1<K,c2>0
(c2K − c1R1 − c2R2) =

 
 
0 (R1,R2) = (1,0)
0 (R1,R2) = (0,K)
+∞ otherwise.
In other words, the CFMM only will either hold one unit of the underlying asset or K units
of the risk-free asset. When the option is out of the money, c1 < K, the CFMM will hold
only one unit of the risky asset (R1,R2) = (1,0). The CFMM will function equivalently to
12a limit order to sell one unit of the underlying at K. When the option is in the money,
the CFMM will therefore hold only K units of the risk free asset, i.e. (R1,R2) = (0,K).
In either case, the arbitrageur will ensure that the CFMM holdes the lower of of (0,1) and
(0,K). This implies that the constant sum curve,
ψV (R1,R2) = K − KR1 − R2 = 0
will yield the same payoff by allowing the arbitrageur to trade between the underlying and
the risk-free asset. This is analogous to the trading rule used in the stop-loss start-gain
strategy for replicating an option position [CJ90], but requires full collateralization.
## 3.3 Black-Scholes covered call price
While the previous example gives the terminal payoff of a covered call, it requires full col-
lateralization, which we expect will not be particularly useful in practice. In this example,
we instead replicate the price of the covered call under the Black-Scholes. We chose this
model as a standard example because it is well-studied, but note that our approach could
accommodate different pricing models and assumptions. The replication in this section will
require less initial capital and apply to the price of the instrument at any time prior to
expiry. In this case, given a price c1 ≥ 0, we can create a two-coin CFMM whose portfolio
value function replicates the Black-Scholes price of a covered call, given by
U(c1) = c1(1 − Φ(d1)) + KΦ(d2),
where τ > 0 is the time to maturity, K ≥ 0 is the strike price, Φ(·) is the standard normal
CDF, and
d1 =
log(c1/K) + (σ2
/2)τ
σ
√
τ
, d2 = d1 − σ
√
τ,
where σ ≥ 0 is the implied volatility. Here, we assume zero risk-free rate, i.e., r = 0, but the
extension to the case of a positive risk-free rate is immediate. Taking the perspective of U
V (c1,c2) = c1 − c1Φ(d0
1) + Kc2Φ(d0
2),
where we have modified the constants to satisfy
d0
1 =
log( c1
c2K
) + (σ2
/2)τ
σ
√
τ
, d0
2 = d0
1 − σ
√
τ.
Using (5), we write, for R,R0
≥ 0, So, we can recover the trading function by using (5),
ψV (R1,R2) = sup
c2>0,c1
(V (c1,c2) − c1R1 − c2R2).
Partially minimizing over c, we have the first-order conditions
R1 − 1 + Φ(d0
1) = 0, d0
1 = Φ−1
(1 − R1), c1 = c2Kh(R1),
13� �
�
� �
�
Figure 1: The left figure plots the trading function of the replicating CFMM for a covered call with
τ = 10 for different values of implied volatility. The right figure shows how the trading function
changes with time to maturity for σ = 0.1.
where h is defined as
h(R1) = eσ
√
τΦ−1(1−R1)−τσ2
,
for convenience. We can substitute this result back, and, after cancellations, find:
ψV (R1,R2) = sup
c2>0
c2(R2 − KΦ(Φ−1
(1 − R1) − σ
√
τ)

.
It is then immediate that:
ψV (R1,R2) =
(
0 R2 − KΦ(Φ−1
(1 − R1) − σ
√
τ) ≤ 0
+∞ otherwise.
We plot some examples in Figure 1. When the price of the risky asset and the time to
matury are both strictly positive, the covered call payoff will require more capital to replicate
a covered call closer to maturity. This can be seen in both the formula for V 0
(c) and
visually in Figure 1. If one were to update the trading function over time as the option
neared maturity, each update would require additional capital. The difference over time
is determined by ‘theta’ which captures the time-decay of the option’s price. The no-fee
CFMM will not capture gains from theta decay and as such will fail to offer self-financing
replication. We conjecture that fees may restore the ability of the LP to profit from theta
decay when replicating such positions, as demonstrated in a simpler case in [EAC21]. We
discuss theta decay further in §A, but do not resolve this question directly in this work.
## 3.4 Perpetual American put option price
We consider a payoff of K − P(c), where P(c) is the Black-Scholes price of a perpetual put
option struck at K. From [Shr04, Chapter 6], this payoff is
U(c1) =
(
c1 c1 ≤ L
K − (K − L)(c1
L
)− 2r
σ2
c1 > L.
14where L = 2r
2r+σ2 K, σ is the volatility of the risky-asset and r is the risk-free rate. Taking
the perspective,
V (c1,c2) =



c1 c1 ≤ L
c2K − c
2r+σ2
σ2
2 (K − L)(c1
L
)− 2r
σ2
c1 > L.
We have the trading function
ψV (R1,R2) = sup
c2>0,c1
(V (c1,c2) − c1R1 − c2R2) = min{f1(R1,R2),f2(R1,R2)}
where
f1(R1,R2) = sup
c1≤L,c2>0
(c1 − c1R1 − c2R2) =
(
L − LR1 − R2 = 0 (R1,R2) = (1,0)
+∞ otherwise
and
f2(R1,R2) = sup
c2>0,c1>L
(c2K − c
2r+σ2
σ2
2 (K − L)(
c1
L
)− 2r
σ2
− c1R1 − c2R2)
The first-order condition is
c1 = c2
R1σ2
2r
L− 2r
σ2
K − L
!− σ2
2r+σ2
Substituting this back and after some cancellations we get
ψ2(R1,R2) = sup
c2>0
(c2(K − R2 − KR
2r
2r+σ2
1 )) =
(
0 K − R2 − KR
2r
2r+σ2
1 ≤ 0
+∞ otherwise
Noting that f1(1,0) = f2(1,0) = 0, we can simply use f2 as our trading function. Unlike the
previous example, the perpetual American put does not require one to update the curve or
contribute additional capital to continue the replication.
## 4 Conclusion
We demonstrated an equivalence between CFMM trading functions and consistent (i.e., con-
cave, nonnegative, nondecreasing, 1-homogeneous) payoff functions. Our methodology relies
only on basic tools from convex analysis and can produce the appropriate trading function
for replicating a number of theoretically and practically interesting payoffs. However, we
also point to cases where replication requires additional initial capital due to arbitrage costs.
Finally, the results presented in this article may have implications for the design of existing
CFMMs and indeed qualitatively matches some results in previous work. In particular, the
result of [AEC20] that lower-curvature CFMMs are more suitable to lower- volatility assets
appears to be confirmed in the discussion of options in 3, wherein the trading functions have
lower curvature for lower implied volatility (for a visual illustration, see figures 1 and 2).
15� �
�
� �
�
Figure 2: The left figure plots the trading function of the replicating CFMM for a perpetual
American put with r = 0.1 for different values of implied volatility. The right figure plots the
trading function for different values of r when σ = 0.25.
Future work. There are several interesting directions for future research. For example, de-
termining whether fees can mitigate arbitrage losses, allowing replication without additional
capital, would be a very useful result. We conjecture that such a result would generalize the
framework of [EAC21] from constant-mean marker makers to arbitrary CFMMs. As previ-
ously discussed, another possibility is, when the replication of a given payoff is impossible,
how closely one can approximate the payoff with a CFMM. Another area for research involves
extending the results to include convex payoffs as well as positions that require leverage to
replicate. Convex instruments may require the ability to establish short positions in CFMMs
shares. Similarly, levered instruments require one to facilitate lending secured by the value of
CFMM shares. A model for secure lending and borrowing of CFMM shares would therefore
expand the range of payoffs one can replicate with a CFMM.
References
[AC20] Guillermo Angeris and Tarun Chitra. Improved price oracles: Constant func-
tion market makers. In Proceedings of the 2nd ACM Conference on Advances
in Financial Technologies, AFT ’20, page 80–91, New York, NY, USA, 2020.
Association for Computing Machinery.
[AEC20] Guillermo Angeris, Alex Evans, and Tarun Chitra. When does the tail wag the
dog? curvature and market making. arXiv preprint arXiv:2012.08040, 2020.
[AKC+
19] Guillermo Angeris, Hsien-Tang Kao, Rei Chiang, Charlie Noyes, and Tarun Chi-
tra. An analysis of Uniswap markets. Cryptoeconomic Systems, 2019.
[BV04] Stephen P. Boyd and Lieven Vandenberghe. Convex Optimization. Cambridge
University Press, Cambridge, UK ; New York, 2004.
16[CJ90] Peter P. Carr and Robert A. Jarrow. The stop-loss start-gain paradox and option
valuation: A new decomposition into intrinsic and time value. The Review of
Financial Studies, 3(3):469–492, 1990.
[Cla20] Joseph Clark. The replicating portfolio of a constant product market. Available
at SSRN 3550601, 2020.
[DGK+
19] Philip Daian, Steven Goldfeder, Tyler Kell, Yunqi Li, Xueyuan Zhao, Iddo
Bentov, Lorenz Breidenbach, and Ari Juels. Flash Boys 2.0: Frontrunning,
transaction reordering, and consensus instability in decentralized exchanges.
arXiv:1904.05234 [cs], April 2019.
[EAC21] Alex Evans, Guillermo Angeris, and Tarun Chitra. Optimal fees for geometric
mean market makers. https://web.stanford.edu/ guillean/papers/g3m-optimal-
fee.pdf, 2021.
[Eva20] Alex Evans. Liquidity provider returns in geometric mean markets. arXiv
preprint arXiv:2006.08806, 2020.
[FMT07] Thierry Foucault, Sophie Moinas, and Erik Theissen. Does anonymity matter
in electronic limit order markets? The Review of Financial Studies, 20(5):1707–
1747, 2007.
[Gre16] Greg N. Gregoriou. The Handbook of Trading: Strategies for Navigating and
Profiting from Currency, Bond, and Stock Markets. The McGraw-Hill Compa-
nies, 2016.
[KCCM20] Hsien-Tang Kao, Tarun Chitra, Rei Chiang, and John Morrow. An analysis of
the market risk to participants in the compound protocol. In Third International
Symposium on Foundations and Applications of Blockchains, 2020.
[MM19] Fernando Martinelli and Nikolai Mushegian. Balancer: A non-custodial portfolio
manager, liquidity provider, and price sensor. 2019.
[MY14] Ciamac Moallemi and K Yuan. The value of queue position in a limit order book.
Market Microstructure: Confronting Many Viewpoints, 2014.
[Neu94] Anthony Neuberger. The log contract. The Journal of Portfolio Management,
20(2):74–80, 1994.
[Roc70] R. Tyrrell Rockafellar. Convex Analysis, volume 28. Princeton university press,
1970.
[Shr04] S. E. Shreve. Stochastic Calculus for Finance II: Continuous-Time Models.
Springer, 2004.
[ZCP18] Yi Zhang, Xiaohong Chen, and Daejun Park. Formal specification of constant
product (xy=k) market maker model and implementation. 2018.
17A Delta hedging
As in section 3, we have that c1 ∈ R+, R1 ∈ R+, and R2 ∈ R+ are all scalar quantities,
where c1 is the price of the asset in question. We seek to construct a trading function such
that R1 = R1(c1) for all c1. We define,
p(R1) = R−1
1 (c1),
which is the marginal price of the traded coin. Recalling that R2 can be thought of as an
implicit function of R1, we have
dR2
dR1
= −p(R1).
Therefore, Z
p(R1)dR = −R2
will give a family of trading functions with the desired property.
Hedging a covered call. Extending the example in section 3, we now look at delta
hedging a covered call. In this case, we hold d
dc
V (c) units of the risky asset, i.e. R1(c) =
1 − Φ(d1). We therefore have, Z
Kh(R1) = −R2,
where h is defined as before where h is defined as h(R) = eσ
√
τΦ−1(1−R)−τσ2
. In this case, we
have the trading function
ψ(R1,R2) = k −
1
2
K + KΦ(Φ−1
(1 − x) − σ
√
τ) − R2 = 0
where k is an arbitrary constant. As before, k will control where the hedge will fail as the
CFMM runs out of reserves. An appropriate choice wil be to select k such that the intial
value of reserves match the initial price of the covered call. In this case, we have
c1R1 + R2 = c1(1 − Φ(d1)) + KΦ(d2).
Substituting the values for R1(c) = 1 − Φ(d1) and R2 = k − 1
2
K + KΦ(Φ−1
(1 − x) − σ
√
τ)
and solving for k, one obtains k = K
2
. Substituting this value recovers the trading function
we derived in 3.
Hedging a log contract. We consider the case of delta-hedging a short position in a log
contract. As noted in [Neu94], delta-hedging a contract paying the natural logarithm of the
futures price will replicate a variance swap. In this case, we seek a trading function for which
R1(c) = 1
c1
. In other words, to achieve the desired hedge, we seek a CFMM that holds one
unit of asset 2 worth of asset 1. Noting that,
p(R1) =
1
R1
18� �
�
Figure 3: Delta-hedging CFMM for the log contract with different parameter choices for the
constant k
we get Z
p(R1)dR1 = k − lnR1 = R2,
where k is an arbitrary constant. Any trading function of the form
ψ(R1,R2) = k − lnR1 − R2 = 0 (9)
will achieve the desired hedge insofar as k ≥ lnR1 or c1 ≥ e−k
, as the CFMM will otherwise
run out of the reserves required to continue hedging.
Path dependence and arbitrage loss. Suppose the price of the asset at time t is c1(t)
and consider delta-hedging a short position in the log contract by holding 1
c1(t)
units of
the asset under zero transaction costs. The PNL of this strategy over a discrete period
[t,t + 1] is 1
c1(t)
(c1(t + 1) − c1(t)). When continuously rebalancing over [0,T], we have PNL
RT
0
1
c1(t)
dc1(s). For simplicity of illustration, suppose c1(t) follows a geometric Brownian
motion with stochastic differential
dc1(t) = σdW(t),
where W(t) is a standard Brownian motion. One can check that the expected PNL of the
delta-hedging strategy is zero. Now, we contrast this with delta-hedging with the CFMM
we recovered in (9). One can check that this CFMM has payoff
V (c1) = k + lnc1.
19The expected PNL of this strategy is therefore,
E[V (c1(T)) − V (c1(0))] = −
σ2
2
T
In other words, implementing the delta-hedge through a no-fee CFMM instead of continual
rebalancing under no transaction costs will result in a supermartingale. This observation is
analogous to the result in [AC20, Eva20] that the portfolio value of a G3M or constant-mean
market maker is a supermartingale under the risk-neutral measure due to arbitrage losses.
More generally, a no-fee CFMM has payoff V (c) = R1c + R2, which is always path-
independent. In contrast, the equivalent delta-hedging strategies continually-rebalanced at
no cost are path-dependent. When delta-hedging a convex strategy, one’s portfolio will be
short gamma and long theta [Shr04]. The equivalent CFMM does not benefit from positive
theta due to arbitrage, resulting in the supermartingale behavior. In other words, delta
hedging a convex claim with a CFMM with the appropriate concave payoff will underperform
the equivalent delta hedge rebalanced under no transaction costs. We conjecture that a result
similar to that of [EAC21] may allow one to arbitrarily approximate unconstrained delta-
hedging strategies with CFMMs by taking the directional limit as the fee approaches zero,
but do not pursue this direction further in this paper.
20