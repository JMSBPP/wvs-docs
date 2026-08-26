---
sha256: 5e66ff0e64cd931346061f6eae88b09e9c8522720687d67b62153b90838ea711
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 216599
---
Discrete-Time Financial Engineering
Shiyong Yoo
Chung-Ang University
Fall 2017Chapter 1
Overview
## 1.0.1 Why Are Financial Markets Necessary?
Financial markets exist to enable the efficient allocation of resources across time
and states of nature.
Example 1
Consider a young worker with a very high salary. What should she do
with her earnings: spend and consume them all immediately? No: she would
probably want to invest them in the financial markets with various objectives
related to retirement, home ownership, children’s education, capital growth etc.
If there were no financial markets available to her, what could or would she do?
Example 2
Q: Assuming that the young worker above has access to financial markets, where
exactly does her money go?
A: (Via the stock and bond markets) To corporations and agents who use it to
create products / ideas / wealth.
Moreover, her money will often go to those corporations or agents who are best
qualified to use it! Why? Contrast this with the the mechanism used by a
dictator or central planner?
Example 3
Consider a farmer who produces wheat. What should the farmer do with
his wheat: make bread and then consume it all? No: he should sell it of course.
Note that it will be much easier to sell it if there is a market for wheat.
Given that the farmer will sell his wheat, should he sell it it in the spot market
or the futures market? Efficient markets are essential for a successful economy.
This statement is well supported by historical data.
Question: Can you name another structure or system that is also essential for
a successful economy?Fall 2009, 2
## 1.0.2 Modeling Financial Markets
When we study financial engineering we must decide what type of model we
will use for the nancial markets. A number of possibilities exist:
• Discrete-time models
– single-period models
– multi-period models
• Continuous-time models
In this course we will focus on discrete-time models. The advantage of discrete
time models is that less sophisticated mathematics are required to study them.
On the other hand, while continuous-time models require more sophisticated
mathematics, they often lead to explicit solutions to problems. These problems
would generally have to be solved numerically in discrete-time models. All of
the important concepts of financial engineering can be studied in discrete-time
models, however, and they will be the focus of this course.
Central Problems of Financial Engineering
There are many problems that may be classified as financial engineering prob-
lems. Perhaps the most obvious such problems are: securities pricing, risk
management and portfolio optimization.
Securities Pricing We can typically identify two classes of securities: primi-
tive securities and derivative securities. Examples of primitive securities
are stocks and bonds whereas options, futures and swaps are examples of
derivative securities. It is probably fair to say that financial economics is
more concerned with pricing primitive securities, usually using equilibrium
arguments (e.g., supply = demand) to do so. Financial engineering is typ-
ically more concerned with pricing derivative securities and uses arbitrage
arguments to do so. This distinction is not hard, however, and sometimes
it is necessary to use equilibrium arguments when pricing derivative se-
curities. Moreover, some models such as the Capital Asset Pricing Model
(CAPM), are equilibrium-based models that are of fundamental impor-
tance to both financial economists and financial engineers.
Risk Management Risk management is concerned with understanding the
risks that are inherent to your portfolio of securities. For example, you
might be interested in determining P(WT /W0 ≤ 0.8), i.e., the probability
that you will have lost more than 20% of your wealth by time T. If this
probability is unacceptably high then you need to adjust your portfolio to
reduce this probability. There are a number of interesting and challenging
questions that are related to risk management.Fall 2009, 3
Portfolio Optimization At the most basic level, portfolio optimization is the
problem of choosing a trading strategy with the goal of optimizing some
objective function that measures the performance of the portfolio. For
example, you may wish to solve
maxθ E[u(WT )] subject to various constraints
where θ is the (possibly dynamic) trading strategy, WT is terminal wealth
and E[u(WT )] is the objective function. Later in the course we will see how
the problems of security pricing and portfolio optimization are intimately
related.
There are of course many other problems and applications of financial engineer-
ing. They include problems in corporate finance (e.g., structuring deals, real
options), accounting, applied mathematics (probability theory, control theory),
economics and econometrics, and risk management more generally.
The No-Arbitrage Assumption
The no-arbitrage assumption is probably the most important assumption in
finance theory, and it is the assumption that generally distinguishes finance
from the remainder of economics. We will put this assumption to work many
times in this course. Basically it states that it is not possible to get something
for nothing, or alternatively, “there is no free lunch”.
Example 4 (Arbitrage)
Bank A is willing to borrow and lend money at 6% while bank B is willing to
borrow and lend at 8%.
Q: Why is this an opportunity to “get something for nothing”?
Q: Suppose more realistically, that bank A borrows at rA
b % and lends at rA
l %,
and that bank B borrows at rB
b % and lends at rB
l % What conditions must rA
b %,
rA
l %, rB
b %, and rB
l % satisfy if no arbitrage opportunity can exist?
Q: Why can arbitrage opportunities not exist (at least for very long) in the real
world?
We will define arbitrage more carefully when we study martingale pricing later
in the course.
Some Motivating Examples
Example 5 (Risk Aversion and the St. Petersberg Paradox)
Consider a game where a fair coin is tossed repeatedly until the first head
appears. If the first head appears on the nth
toss, then you will receive $2n
.
How much, X, would you be willing to pay in order to play this game?Fall 2009, 4
The expected payoff, E[P], is given by
E[P] =
∞ X
n=1
2n
P(1st
head on nth
toss) =
∞ X
n=1
2n 1
2n
= ∞.
Given the result in the above, would you now choose X = ∞?
Daniel Bernouilli resolved this paradox by introducing the idea of a utility func-
tion, u(x), defined on levels of wealth, x. The interpretation of u(x) is that it
measures how much utility or benefit someone obtains from holding x units of
wealth. Different people will have different utility functions. What properties
should u(·) have?
1. Increasing, decreasing or neither?
2. Convex, concave or neither?
The particular utility function that Bernouilli introduced was the log(·) utility
function. In particular, if an individual has log utility then his/her expected
utility is given by
E[u(P)] =
∞ X
n=1
log(2n
)P(1st
head on nth
toss) = log(2n
)
∞ X
n=1
n
2n
< ∞.
Many other utility functions1
are of course possible.
Exercise 1 How much do you think the opportunity to play the game is worth
to you if you have log utility?
When we study financial engineering problems, we sometimes (though not al-
ways) need to understand what the preferences of the decision-maker are. If
the decision-maker is an individual, we often assume that he is risk-averse and
endow him with an appropriate utility function.
Example 6 (The Binomial Model) Consider the following example of a
financial market. There are 3 periods, one risky asset and one risk-free asset.
At any time, t, the value of the risky asset, St, will either increase by a factor,
u, or decrease by a factor, d, over the next period. The possible evolutions of
St are given in Figure 1 where u = 1.06, d = 1/u and S0 = 100. The risk-free
asset is a cash account so that $1 invested in it at t = 0 will be worth (1 + r)t
dollars at time t, where r is the interest rate per period. A number of interesting
questions arise:
1. What is the value of an option that pays h(S3) := (S3 − 95)+
at time
t = 3?
1The theory of expected utility was formalized in the 1950’s by John Von Neumann and
Oscar Morgenstern. It has been a cornerstone of economics and finance ever since.Fall 2009, 5
Figure 1.1: Cash Flows of a Risky Asset
Figure 1.2: Cash Flows of Three Assets
(a) do we have enough information to answer this question?
(b) as in Example 5, shouldn’t the price somehow depend on the utility
functions of the buyer and seller?
(c) will the price depend on the probability of an upmove in each period?
2. (Risk management) Suppose you stand to lose a lot of money if at date
t = 3 the risky asset is worth 83.96. On the other hand, you stand to earn
a lot of cash if the risky asset is worth 119.10 at t = 3. Suppose you don’t
want this type of exposure. What could you do?
3. Suppose you have W0 = $100,000 available for investment at t = 0. You
can invest in both the risky and risk-free assets. What should you do?
In particular, what is your optimal investment strategy? What will this
strategy depend on?
will answer these questions and many others during the course.
Example 7 (A More General Tree) There are two time periods and three
securities. We will use S
(i)
t to denote the value of the ith
security on a given
node at date t for i = 0, 1, 2 and for t = 0, 1, 2. These values are given in the
tree below. For example, the value of the 0th
security at date t = 2 satisfies
S
(0)
2 (ωk) =



1.1235, for k =1, 2, 3
1.1025, for k =1, 2, 3
1.0815, for k =1, 2, 3.
We can pose the questions of Example 6 and others here. We will see later in
the course that the answers to these questions depend on (i) the security prices
at each node and (ii) the structure of the tree. If we can answer these questions
and understand the theory behind these answers then we will have succeeded
in understanding most of the important ideas in financial engineering. These
ideas will apply even when we work with considerably more complicated (e.g.,
continuous time and continuous space) models than those of Examples 6 and 7.
This is not surprising since it should be the case that even the most complicated
models can be approximated in some sense by the models of Examples 6 and 7.Fall 2009, 6
Challenge Question
When marketing their equity funds, salesmen often use statements like the fol-
lowing:
“Over any historical 20 year period, stocks have outperformed bonds.
Therefore stocks are better securities than bonds for people with long
investment horizons.”
Suppose the premise of this statement is true (it actually is in the U.S.). How
would you respond?Chapter 2
Deterministic Cash Flows
and the Term Structure of
Interest Rates
## 2.0.1 Basic Theory of Interest
Cashflow Notation: We use (c0,c1,··· ,ci,··· ,cn) to denote the series of
cashflows where ci is received at time t = i. The length of a period, i.e., the
interval of time between t = i and t = i+1, will usually be understood from the
context. Negative cashflows refer to cash payments. The initial cashflow, c0,
will often be negative while the remaining cashflows are positive. This situation
models the cashflows of many securities such as stocks and bonds. In such
circumstances, c0 denotes the cost of the security, while later cashflows refer to
dividends, coupons or sale receipts which are all positive.
Principal and Interest
Definition 1 If A is invested in an account for n periods with a simple interest
rate of r per period, then after n periods the account will be worth A(1 + rn).
Definition 2 If A is invested in an account for n periods with a compound
interest rate of r per period, then after n periods the account will be worth
A(1 + r)n
.
Interest rates are usually quoted on an annualized basis, even if the compounding
period is less than a year. For example, the phrase “10% interest, compounded
quarterly” implies that an investment of A will be worth A(1+0.1/4)4
one year
later. Similarly, the phrase “10% interest, compounded semi-annually” implies
that an investment of A will be worth A(1 + 0.1/2)2
after one year.Fall 2009, 8
In general, if there are n compounding periods per year and the interest rate is
r%, then an investment of A will be worth as follows after m years:
V = A(1 + r/n)mn
.
Definition 3 Continuous compounding refers to the situation where we let the
length of the compounding period go to 0. That is, after m years we see that
an investment of A will be worth
lim
n→∞
A(1 + r/n)mn
= Aerm
.
Definition 4 The effective interest rate is that rate which would produce the
same result if compounding were done per year rather than per period.
So if the length of a compounding period is one year, the effective interest rate
is the same as the quoted or nominal rate. For example, A invested for 1 year at
10% interest, compounded quarterly, will be worth 1.1038A and so the effective
interest rate is 10. 38%.
Present and Future Values of Cash Flow Streams
The value of $1 today is clearly not the same as the value of $1 next year.
However, the simple concepts of present value and future value allow us to
fairly compare cash flows that occur at different dates. For example
$1 invested today at t = 0 would be worth $(1+r) next year at t = 1 assuming1
annual compounding. So for r > 0, we can conclude that $1 at t = 0 is worth
more2
than $1 at t = 1.
We can then reverse the argument to say that $(1 + r) at t = 1 is worth $1 at
t = 0. That is, the present value of $(1 + r) at t = 1 is $1. We say that we are
discounting the cash flow at t = 1 back to t = 0. Likewise the future value at
t = 1 of $1 at t = 0 is $(1 + r).
More generally, the present value of the cash flow, (c0, c1, ··· , cn), is
PV = c0 +
c1
1 + r
+
c2
(1 + r)2
+ ··· +
cn
(1 + r)n
where we have assumed compounding is done per period. Likewise, the future
value (at t = n) of the cashflow is
FV = PV (1 + r)n
= c0(1 + r)n
+ c1(1 + r)n−1
+ c2(1 + r)n−2
+ ··· + cn
1The compounding convention should always be observed so that if we are using quarterly
compounding, for example, then $1 invested at t = 0 would be worth $(1 + r/4)4 at t = 1.
2This statement assumes that there will be no inflation over the next year. If there is
inflation then we should use real interest rates before concluding that $1 today is worth more
than $1 next year; see Luenberger, Section 2.6. We will not consider inflation or related issues
in this course.Fall 2009, 9
You must be careful to observe the compounding convention. For example, if
cash flow s occur yearly, interest rates are quoted on an annual basis (as usual)
but are compounded m times per year then
PV = c0 +
c1
(1 + r/m)m
+
c2
(1 + r/m)2m
+ ··· +
cn
(1 + r/m)nm
and
FV = PV (1 + r/m)nm
.
Note that the individual cash flows, ci, may be positive or negative.
Internal Rate of Return (IRR)
Definition 5 Given a cash flow stream (c0,c1,··· ,cn), the internal rate of
return (IRR) is a number, r, that satisfies
0 = c0 +
c1
1 + r
+
c2
(1 + r)2
+ ··· +
cn
(1 + r)n
(2.1)
• In most contexts, c0 will be negative and we can interpret it as the price
paid today for the cash flow stream, (c0,c1,··· ,cn). Then r is just the
number that makes this a “fair deal”.
• If we let z = 1/(1 + r) we can see that the above equation (2.1) is a
polynomial in degree n. In general, the above equation (2.1) could then
have zero, one or as many as n real roots so it is not always clear what
the appropriate value of r is. (But see the following exercise.)
Exercise 1 Show that when c0 < 0 and ck ≥ 0 for all k ≥ 1, there exists
a unique positive root, z∗
, to the equation
0 = c0 + c1z + c2z2
+ ··· + cnzn
.
Furthermore, if
Pn
k=1 ck > 0, then show the corresponding IRR, r =
1/z∗
− 1, is positive.
• Even when we know that there exists a unique positive solution to the
equation (2.1), we usually have to solve for it numerically.
Project Evaluation Criteria: NPV versus IRR
Many investment problems may be formulated as the problem of optimally
allocating funds among a number of competing projects. The word project is
significant as it usually implies that the projects cannot be scaled up or down.
For example, a project may represent developing an oil field or introducing a
new product to a market and the level of investment required for such projectsFall 2009, 10
is usually fixed.3
These investment allocation problems are often called capital
budgeting problems and they constitute an important topic in corporate finance.
When faced with a capital budgeting problem, we need to be able to evaluate
the competing projects so that the appropriate decision can be made. There are
a number of different criteria available for evaluating projects but the two most
common are Net Present Value (NPV) and Internal Rate of Return (IRR).
The NPV criterion amounts to selecting the project with the highest4
present
value while the IRR criterion amounts to selecting the project with the highest
IRR. It is widely believed by theorists that the NPV criterion, when correctly
applied, is the correct criterion. However, conflicting recommendations can
often be reconciled when common sense is applied.
A particular difficulty that arises when applying the NPV criterion is that of
choosing the correct discount factor. This problem does not arise when cash flow
s are deterministic in which case the appropriate risk-free interest rates should
be used for discounting. More generally, however, it is not always clear how to
discount cash flow s that are stochastic since the riskiness of the cashflows also
needs to be considered. This is an important problem in financial economics
and financial engineering. In fact, we shall see later in the course that the
problem of pricing derivative securities can also be viewed as one of choosing
the appropriate stochastic discount factor. When markets are complete,5
it
turns out that there is only one stochastic discount factor that can be used.
Further Examples and Applications
Example 1 (Sunk Costs (Exercise 2.6 in Luenberger))
A young couple has made a non refundable deposit of the first month’s rent
(equal to $1,000) on a 6-month apartment lease. The next day they find a
different apartment that they like just as well, but its monthly rent is only
$900. They plan to be in the apartment only 6 months. Should they switch to
the new apartment? What if they plan to stay 1 year? Assume an interest rate
of 12%.
Solution: Different interpretations are possible here. For example, the deposit
may be never be refundable and therefore represent a brokerage free that is paid
up front. Alternatively, the deposit may only be non refundable if the couple
choose not to take the apartment. We will adopt the latter interpretation but
note that regardless of the interpretation, the important aspect of this example
is that sunk costs are exactly that: sunk!
3This contrasts with portfolio optimization problems where it is commonly understood
that an investor may invest as little or as much as she chooses in a particular asset such as
a stock or bond. In this context of portfolio optimization, the term asset is preferred to the
term project.
4The criterion is called NPV since some of the cash flows are usually negative and these
have to be included in the analysis.
5We will dene market completeness when we study martingale pricing later in the course.Fall 2009, 11
(a) Compare the two alternatives.
1. Stay in the original apartment, for an NPV, C1, given by
C1 = −
5 X
i=0
1000
1.12i
+
1000
1.126
≈ −4,222.
2. Take the new apartment where we assume a security deposit is again
required. The NPV then is
C2 = −900 −
5 X
i=0
900
1.12i
+
900
1.126
≈ −4,700.
The couple should then take the $1000 apartment.
(b) You can do this as an exercise. What result do you expect?
Example 2 (An Appraisal (Exercise 2.9 in Luenberger))
You are considering the purchase of a nice home. It is in every way perfect
for you and in excellent condition, except for the roof. The roof has only 5 years
of life remaining. A new roof would last 20 years, but would cost $20,000. The
house is expected to last forever. Assuming that costs will remain constant and
that the interest rate is 5%, what value would you assign to the existing roof?
Solution: We know a new roof costs 20,000 and that it lasts 20 years. We can
therefore infer the value per year, A, of a roof by solving
20,000 =
19 X
i=0
A
1.05i
.
We find that A = 1,528.4. If V is the value of a roof that has 5 years of life
remaining, we can obtain that V = 6,948.
Exercise 2 Find an alternative method for solving the problem in Example 2.
Example 3 (Valuation of a Firm)
A simple model that is sometimes used to determine the value of a corpora-
tion is the Gordon Growth Model. It assumes that there is a constant interest
rate, r, and that dividends are paid annually and grow at a rate of g. The value
of the firm may then be expressed as
V0 =
D1
1 + r
+
D1(1 + g)
(1 + r)2
+ ··· = D1
∞ X
k=1
(1 + g)k−1
(1 + r)k
,
so that we obtain V0 = D1/(r − g) for g < r.Fall 2009, 12
• Clearly V0 is very sensitive to changes in g and r when g ≈ r. For this
reason, the Gordon model has been used to provide some intuition for the
volatility of growth stock prices; e.g., internet, biotech stocks.
• Obviously this model is very simple and is easy to generalize. For example,
we could assume that dividends only grow for a certain fixed number of
years, possibly beginning at some future date.
• More realistic models should of course assume that dividends are stochas-
tic. Moreover, since dividend policy is set by directors, we might prefer to
focus not on dividends, but instead on the underlying cash flow s of the
corporation.
## 2.0.2 Fixed Income Securities
Traditionally, the term fixed income securities refers to securities whose cash
flow s are fixed in advance and whose values therefore depend largely on the
current level of interest rates. The classic example of a fixed income security is
a bond which pays a fixed coupon every period until expiration when the final
coupon and original principal is paid.
A stock, on the other hand, is the classic example of a non-fixed income security
(or variable-income security) as the dividend payments (if they exist) and stock
value vary stochastically through time. It should be mentioned, however, that
since interest rates vary stochastically through time, so too do bond prices.
Furthermore, many securities (e.g., convertible bonds) have fixed-income and
non-fixed-income characteristics so the distinction is often blurred.
Question: Are fixed-income securities risk-free securities?
Annuities, Perpetuities and Amortization
Definition 6 An annuity is a contract that periodically pays a pre-determined
amount of cash over some interval of time.
Traditionally annuity payments were made on an annual basis (hence the term
‘annuity’) and the interval of time was fixed. However, there are many vari-
ations. Pensions, for example, sometimes periodically pay a pre-determined
amount of cash until a random time, T, usually the time of death of the recipi-
ent or the recipient’s spouse.
Definition 7 A perpetual annuity or a perpetuity pays a fixed amount of cash
periodically for ever.
Perpetuities are rare but do exist in some countries. In the UK, for example,
they are called consols. A perpetuity is easily priced. Suppose it pays a fixed
amount, A, per period beginning at the end of the current period, and that theFall 2009, 13
interest rate per period is r. Then the price, P, of the perpetuity satisfies
P =
∞ X
k=1
A
(1 + r)k
=
A
r
. (2.2)
The price of an annuity that pays A per period beginning at the end of the
current period for a total of n periods, satisfies
P =
n X
k=1
A
(1 + r)k
=
A
r

1 −
1
(1 + r)n

. (2.3)
As always, the formulae in (2.2) and (2.3) depend on the compounding conven-
tion and how interest rates are quoted. They may also be inverted to express A
as a function of P. For example, we may also write (2.3) in the form
A =
r(1 + r)n
P
(1 + r)n − 1
. (2.4)
This form of the annuity pricing formula is useful for determining the periodic
payments that correspond to a fixed value, P. It is also useful for amortization,
which is the process of substituting periodic cash payments for an obligation
today.
Yield-to-Maturity
The yield-to-maturity (YTM) of a bond is the interest rate (always quoted on
an annual basis) that makes the present value of all associated future payments
equal to the current value of the bond. In particular, the YTM is exactly the
IRR of the bond at the current price. The YTM, λ, therefore satisfies
P =
n X
k=1
C/m
[1 + (λ/m)]k
+
F
[1 + (λ/m)]n
=
C
λ

1 −
1
[1 + (λ/m)]n

+
F
[1 + (λ/m)]n
, (2.5)
where F is the face value of the bond, C is the annual coupon payment, m is
the number of coupon payments per year, n is the exact total number of coupon
payments remaining, and it is assumed that compounding is done m times per
year.
A lot of information is present in equation (2.5). In particular, it may be seen
that P is a decreasing function of λ. When λ = 0, the bond price is simply the
sum of the future payments, while if λ = C/F, it can then be shown(do it!)
that P = F.
Different bonds can have different yields but they generally track one anotherFall 2009, 14
quite closely, particularly when the bonds have similar maturities. It should also
be emphasized that bond yields, and therefore bond prices, generally change
stochastically through time. Hence bonds are risky securities, despite the fact
that their payment streams are fixed.
Macauley Duration
Consider a financial security that makes payments m times per year for a total of
n periods. Then if is the YTM of the security, we define its Macauley duration,
D, to be
D =
Pn
k=1(k/m)ck/[1 + (λ/m)]k
P
(2.6)
where P is the present value of the security, and ck is the payment made in
the kth
period. Note that D is a weighted average of the times at which the
payments are made, where the weight at period k is the contribution of ck to
the present value of the security. In particular, time and duration have the same
units and D satisfies 0 ≤ D ≤ T where T is the maturity time of the instrument.
Another expression of Macaulay’s duration is as follows:
D =
n X
t=1
t ×

ct/(1 + λ)t
P

=
n X
t=1
t × wt
Exercise 3 What is the duration of a zero-coupon bond?
Remark We have some established rules for duration.
1. Rule 1: The duration of a zero-coupon bond equals its time to maturity.
2. Rule 2: Holding maturity constant, a bond’s duration is lower when the
coupon rate is higher.
3. Rule 3: Holding the coupon rate constant, a bond’s duration generally in-
creases with its time to maturity. Duration always increases with maturity
for bonds selling at par or at a premium to par.
4. Rule 4: Holding other factors constant, the duration of a coupon bond is
higher when the bond’s yield to maturity is lower.
5. Rule 5: The duration of a level perpetuity is
Duration of perpetuity =
1 + y
y
.
The duration of a security may be interpreted as the length of time one has to
wait in order to receive the security’s payments. We will soon see how it gives aFall 2009, 15
measure of interest rate sensitivity and how it can be used to immunize a bond
against adverse interest rate movements.
In the case of a bond that has a coupon rate of c per period and yield y per
period6
, the summation in (2.6) may be simplified to obtain
D =
1 + y
my
−
1 + y + n(c − y)
mc[(1 + y)n − 1] + my
. (2.7)
Duration and Sensitivity
Duration is a key concept in fixed-income portfolio management for at least three
reasons. First, it is a simple summary statistic of the effective average maturity
of the portfolio. Second, it turns out to be an essential tool in immunizing
portfolios from interest rate risk. Third, duration is a measure of the interest
rate sensitivity of a portfolio.
Duration is useful because it measures directly the sensitivity of price to
changes in yield. This follows from a simple expression for the derivative of the
present value expression.
In the case where payments are made m times per year and yield is based on
those same periods, we have
PVk =
ck
(1 + (λ/m))k
.
The derivative with respect to λ is
dPVk
dλ
=
−(k/m)ck
(1 + (λ/m))k+1
= −
k/m
1 + (λ/m)
PVk.
We now apply this to the expression for price,
P =
n X
k=1
PVk.
Here we have used the fact that the price is equal to the total present value at
the yield (by definition of yield). We find that
dP
dλ
=
n X
k=1
dPVk
dλ
= −
n X
k=1
(k/m)PVk
1 + (λ/m)
= −
1
1 + (λ/m)
DP ≡ −DMP.
The value DM is called the modified duration. It is useful duration modified by
the extra term in the denominator. Note that DM ≈ D for large values of m or
small values of λ.
6That is, y = λ/m.Fall 2009, 16
Price Sensitivity Formula The derivative of price P with respect to yield λ
of a fixed-income security is
dP
dλ
= −DMP ⇔ DM = −
1
P
dP
dλ
(2.8)
where DM = D/(1 + (λ/m)) is the modified duration.
Hence DM measures the relative change in a bond’s price directly as yield λ
changes.
By using the approximation dP/dλ ≈ ∆P/∆λ, equation (2.8) can be used to
estimate the change in price due to a small change in yield (or vice versa).
Specifically, we would write
∆P ≈ −DMP∆λ.
This gives explicit values for the impact of yield variations.
Convexity
Modified duration measures the relative slope of the price-yield curve at a given
point. As we have seen, this leads to a straight-line approximation to the price-
yield curve that is useful both as a means of assessing risk and as a procedure
for controlling it.
An even better approximation can be obtained by including a second-order (or
quadratic) term. This second-order term is based on convexity, which is the
relative curvature at a given point on the price-yield curve.
We define the convexity, C, of a financial security with YTM λ to be
C =
1
P
d2
P
dλ2
=
1
P
n X
k=1
d2
PVk
dλ2
. (2.9)
For the financial security described above we obtain
C =
1
P[1 + (λ/m)]2
n X
k=1
k(k + 1)
m2
ck
[1 + (λ/m)]k
. (2.10)
Note that convexity has units of time squared. Convexity is the weighted average
of tktk+1 where, like for duration, the weights are proportional to the present
values of the corresponding cash flows. Then the result is modified by the factor
1/(1 + (λ/m))2
. Explicit formula can be derived for the case of equal-valued
coupon payments.Fall 2009, 17
Suppose that at a price P and a corresponding yield λ, the modified duration
DM and the convexity C are calculated. Then if ∆λ is a small change in λ and
∆P is the corresponding change in P, we have
∆P ≈ −DMP∆λ +
PC
2
(∆λ)2
.
This is the second-order approximation to the price-yield curve. Convexity can
be used to improve immunization in the sense that, compared to ordinary im-
munization, a closer match of asset portfolio value and obligation value is main-
tained as yields vary. To account for convexity in immunization, one structures
a portfolio of bonds such that its present value, its duration, and its convexity
match those of the obligation. Generally, at least three bonds are required for
this purpose.
We will now see how duration and convexity may be used to immunize a
bond against adverse changes in interest rates, or to be more precise, yield-
to-maturity.
Immunization
Let P(λ) be the price of a financial security (or a portfolio of financial securities)
when the YTM is λ. Then a simple second-order Taylor expansion implies
(check!)
P(λ + ∆λ) ≈ P(λ) + ∆λ
dP
dλ
(λ) +
(∆λ)2
2
d2
P
dλ2
(λ)
= P(λ) − DMP(λ)∆λ +
P(λ)C
2
(∆λ)2
, (2.11)
where
DM :=
D
1 + λ/m
is called the modified duration.7
Consider now a portfolio of n securities where we use Pk, Dk and Ck to denote
the present value, duration and convexity of the kth
security, 1 ≤ k ≤ n. Let
Pp, Dp and Cp denote the present value, duration and convexity of the overall
7We are implicitly assuming that compounding is done m times per year.Fall 2009, 18
portfolio. It is easy to check that Pp, Dp and Cp satisfy
Pp =
n X
k=1
Pk,
Dp =
n X
k=1
Pk
Pp
Dk,
Cp =
n X
k=1
Pk
Pp
Ck.
Suppose now that we own a portfolio (which may have negative value) of fixed
income securities, and the current value of this portfolio is P0. As λ changes, so
will P0, but in many circumstances we would like P0 to remain constant and not
change as λ changes. We can effectively arrange for this by adding securities to
our portfolio in such way that we are immunized against changes in λ.
The Taylor expansion in (2.11) implies that we can do this by adding securities
to our portfolio in such a way that the combined present value, duration and
convexity of the new securities match the present value, duration and convexity
of the original portfolio.8
To do this, we generally need to add at least three
securities to our portfolio. If we just use duration to immunize, then we gen-
erally only need to add two securities to the portfolio. The following example
illustrates how to do this.
Example 4 (Immunizing a Cash Flow)
Suppose the current YTM is 8% and we have an obligation9
to pay 1 million
dollars in 7 years. We wish to immunize this obligation by purchasing a portfolio
of bonds in such a way that the value, duration and convexity of the obligation
and bond portfolio coincide. Because this involves three equations, we will need
at least three bonds in our portfolio. There are two 6-year bonds, with coupon
rates 7% and 10%, and a 9-year bond with coupon rate 2%, available. Let P1,
P2 and P3 be the dollar amount invested in each of the three bonds, respectively.
We must then solve the following equations:
Pp = P1 + P2 + P3, (2.12)
Dp =
P1
P0
D1 +
P2
P0
D2 +
P3
P0
D3, (2.13)
Cp =
P1
P0
C1 +
P2
P0
C2 +
P3
P0
C3. (2.14)
8Note that the present value of the new portfolio will be unchanged at P0 though the
duration and convexity will both be zero. This is because the purchase (or sale) of the new
securities will be financed by a cash amount of P0 which will offset the cost of the new
securities. The cash amount of P0 has zero duration and convexity.
9Note that since we are immunizing an obligation, the signs on the left-hand-sides of
equations (2.12), (2.13) and (2.14) below are positive and not negative.Fall 2009, 19
where P0, D0 and C0 are the present value, duration and convexity, respectively,
of the obligation. We therefore have 3 linear equations in 3 unknowns and we
can solve to obtain P1 = 12.78 million, P2 = −11.63 million and P3 = −576
thousand dollars. Note that this means we need to sell short10
the second and
third bonds.
Let us now convince ourselves that we are indeed immunized against changes in
λ. We can consider our overall portfolio to be comprised of two sub-portfolios:
(i) the obligation and (ii) the portfolio consisting of positions in the three bonds.
Moreover, we have arranged it so that the value, duration and convexity of the
two sub-portfolios coincide with one another. As a result, if λ changes then
the values of the two sub-portfolios will change by equal amounts according to
(2.11). However, the changes will be in opposite directions and therefore cancel
each other because the first sub-portfolio is an obligation.
Excel Spreadsheet See the Excel spreadsheet, DurationConvexity.xls, for the
solution details and an analysis of how well the portfolio is immunized when
YTM changes to 7% or 9%.
These immunization methods are used a great deal in practice and have proven
successful at immunizing portfolios of fixed income securities against adverse
interest rate movements. This is despite the fact that interest rates are assumed
to be flat and only parallel shifts in interest rates are assumed to be possible.
Such assumptions are not at all consistent with reality and they do not allow
for a satisfactory theory of interest rates.
Further Examples and Applications
Example 5 (Callable Bond (Exercise 3.5 in Luenberger))
The Z corporation issues a 10%, 20-year bond at a time when yields are 10%.
The bond has a call provision that allows the corporation to force a bond holder
to redeem his or her bond at face value plus 5%. After 5 years the corporation
finds that exercise of this call provision is advantageous. What can you deduce
about the yield at that time? (Assume one coupon payment per year.)
Solution: If exercise of the call provision is advantageous, then it must be the
case (why?) that
15 X
k=1
0.1
(1 + λ)k
+
1
(1 + λ)15
> 1.05
In particular, it implies λ < 9.366%.
10The act of short-selling a security is achieved by first borrowing the security from some-
body and then selling it in the market. Eventually the security is purchased and returned to
the original lender. Note that a profit (loss) is made if the security price fell (rose) in value
between the times it was sold and purchased in the market.Fall 2009, 20
Example 6 (Need for a Better Theory! (Exercise 3.16 in Luenberger))
Suppose that an obligation occurring at a single time period is immunized
(matching duration, but not convexity) against interest rate changes with bonds
that have only nonnegative cash flows. Let P(λ) be the value of the resulting
portfolio, including the obligation, when the interest rate is r + λ and r is the
current interest rate. By construction P(0) = 0 and P′
(0) = 0. We will show
that P′′
(0) ≥ 0, i.e., P(0) is a local minimum. With a yearly compounding
convention, the discount factor for time t is dt(λ) = (1+r+λ)−t
. Without loss
of generality it is assumed that the magnitude of the obligation is 1 and it is
due at time t.
If ct are the cash flow s of the bonds that have been used to immunize the
obligation, the following equations must be satisfied (why?):
P(0) =
X
t
ctdt − dt̄ = 0, (2.15)
P′
(0)(1 + r) =
X
t
tctdt − t̄dt̄ = 0. (2.16)
(2.17)
(a) Show that for all values of α and β there holds
P′′
(0)(1 + r)2
=
X
t
(t2
+ αt + β)ctdt − (t̄2
+ αt̄ + β)dt̄ = 0. (2.18)
(b) Show that α and β can be selected so that the function (t2
+ αt + β) has
a minimum at t̄ and has a value of 1 there. Use these values to conclude that
P′′
(0) ≥ 0.
Solution
(a) Use equations (2.15) and (2.16) to obtain (2.18).
(b) Choose (why?) α = −2t̄ and β = 1+t̄2
. Using (2.15) we therefore see that
P′′
(0) ≥ 0.
Remark 1 The result of the previous example is significant. It seems to say
that we can make money from nothing (arbitrage) if we assume that interest
rates can only move in parallel. While duration and convexity are used a lot
in practice and often result in a well immunized portfolio, this result highlights
the need for a more sophisticated theory of interest rates. See Example 9 for a
more explicit example where a model that only permits parallel movements in
interest rates affords an arbitrage opportunity.Fall 2009, 21
## 2.0.3 The Term Structure of Interest Rates
Until now, we have discussed a bond’s yield-to-maturity and how this concept,
together with duration and convexity, may be used to immunize or hedge the
cash flow of a fixed income portfolio. We have also mentioned that bond prices
in the real world are stochastic (hence the need for immunization techniques),
but we have not discussed the precise stochastic nature of bond price processes.
Any theory of these processes, and the stochastic evolution of interest rates more
generally, should possess at least two qualities: it should provide an adequate
fit to real observed data, and it should preclude arbitrage possibilities. Towards
this end, it is necessary to develop a much more sophisticated theory of interest
rates. This need is evidenced in part by the existence in the real world of
bonds with very different YTMs, and by Examples 6 and 9 where we see that
arbitrage opportunities can exits in the YTM framework or frameworks where
only parallel movements in interest rates are possible. In order to develop a more
sophisticated theory of interest rates, we first need to study the term structure
of interest rates.
The Term Structure, Discount Factors and Present Values
If a bank lends you money for one year and lends money to someone else for
ten years, it is very likely that the rate of interest charged for the one-year
loan will differ from that charged for the ten-year loan. Term-structure theory
has as its basis the idea that loans of different maturities should incur different
rates of interest. This basis is consistent with what we observe in practice and
allows for a much richer and more realistic theory than that provided by the
yield-to-maturity (YTM) framework.
We will often assume that there are m compounding periods per year, but it
should be clear what changes need to be made for continuous-time models and
different compounding conventions. For example, we will also consider models
where we compound on a per period basis. Time may be measured in periods
or years, but it should be clear from the context what convention we are using.
Spot Rates: Spot rates are the basic interest rates that define the term struc-
ture. Usually defined on an annual basis, the spot rate, st, is the rate of interest
charged for lending money from today (t = 0) until time t. In particular, this im-
plies that if you lend A dollars for t years11
today, you will receive A(1+st/m)mt
dollars when the t years have elapsed.
The term structure of interest rates may be defined to constitute the sequence
of spot rates, {stk : k = 1, ··· , n}, if we have a discrete-time model with n
periods. Alternatively, in a continuous-time model the set {st : t ∈ [0,T]} may
be defined to constitute the term-structure.
11We assume that t is a multiple of 1/m both here and in the definition of the discount
factor, dt, above.Fall 2009, 22
The spot rate curve is defined to be a graph of the spot rates plotted against
time. In practice, it is almost always upwards sloping in which case sti < stj
whenever i < j.
Discount Factors: As before, there are discount factors corresponding to in-
terest rates, one for each time, t.
The discount factor, dt, for a deterministic cash-flow occurring t years from now
is given by
dt :=
1
(1 + st/m)mt
.
Using these discount factors we can compute the present value, P, of any
deterministic cash flow stream, (x0,x1,··· ,xn). It is given by
P = x0 + d1x1 + d2x2 + ··· + dnxn.
Example 7 In practice it is quite easy to determine the spot rate by observing
the price of U.S. government bonds. Government bonds should be used as
they do not bear default risk and so the contracted payments are sure to take
place. For example the price, P, of a 2-year zero-coupon government bond with
face value $100, satisfies P = 100/(1 + s2)2
where we have assumed an annual
compounding convention.
Forward Rates: A forward rate, ft1,t2
, is a rate of interest that is agreed upon
today for lending money from dates t1 to t2 where t1 and t2 are future dates.
It is easy using arbitrage arguments to compute forward rates given the set of
spot interest rates.
(1 + sj)j
= (1 + si)i
(1 + fi,j)j−i
, (2.19)
where i < j. Hence,
fi,j =

(1 + sj)j
(1 + si)i
1/(j−i)
− 1.
Exercise 4 Prove that (2.19) must hold by using an arbitrage argument. (It
is very important that you be able to construct these arguments. After a while
you should be able to write equations such as (2.19) that correspond to different
compounding conventions without explicitly needing to go through the arbitrage
argument.)
Forward Discount Factors: We can also discount a cash flow that occurs at
time j back to time i < j. The correct discount factor is
di,j :=
1
(1 + fi,j)j−i
,Fall 2009, 23
In particular, the present value at date i of a cash flow, xj, that occurs at date
j > i, is given by di,jxj. It is also easy to see that these discount factors satisfy
di,k = di,jdj,k for i < j < k and they are consistent with earlier definitions.
Short (Forward) Rates: The term structure of interest rates may equiva-
lently be defined to be the set of forward rates. There is no inconsistency in this
definition as the forward rates define the spot rates and the spot rates define the
forward rates. We also remark that in an n−period model, there are n spot rates
and n(n+1)/2 forward rates. The set of short forward rates, rf
k : k = 1, ··· , n,
is a particular subset of the forward rates that also defines the term structure.
The short forward rates are defined by rf
k := fk,k+1 and may easily be shown
to satisfy
(1 + sk)k
= (1 + rf
0 )(1 + rf
1 )···(1 + rf
k−1),
if time is measured in years and we assume m = 1.
Example 8 (Constructing a Zero-Coupon Bond; Replication Strategy)
Two bonds, A and B both mature in ten years time. Bond A has a 7%
coupon and currently sells for $97, while bond B has a 9% coupon and currently
sells for $103. The face value of both bonds is $100. Compute the price of a
ten-year zero-coupon bond that has a face value of $100.
Solution: Consider a portfolio that buys negative (i.e., is short) seven bonds of
type B and buys nine of type A. The coupon payments in this portfolio cancel
and the terminal value at t = 10 is $200. The initial cost is −7×103+9×97 =
152. The cost of a zero with face value equal to $100 is therefore $76. (The
10-year spot rate, s10, is then equal to 2.78%.
We need to solve the following system of two equations. Denote x as the number
of bond A and y the number of bond B.
7x + 9y = 0,
107x + 109y = 100,
=⇒ x∗
= 4.5, y∗
= −3.5.
The value of the replicating portfolio (x,y) must be the same as the value of
the 10-year zero-coupon bond with par $100, under the no-arbitrage condition.
Prove it! (bonus question).
Example 8-1 (Constructing an Immunized Portfolio) An insurance com-
pany must make a payment of $19,487 in 7 years. The market interest rate is
10%, so the present value of the obligation is $10,000. The company’s portfolio
manager wishes to fund the obligation using 3-year zero-coupon bonds and per-
petuities paying annual coupons. (We focus on zeros and perpetuities to keep
the algebra simple.) How can the manager immunize the obligation?Fall 2009, 24
Solution: Immunization requires that the duration of the portfolio of assets
equal the duration of the liability. We can proceed in four steps:
1. Calculate the duration of the liability. In this case, the liability duration
is simple to compute. It is single-payment obligation with duration of 7
years.
2. Calculate the duration of the asset portfolio. The portfolio duration is the
weighted average of duration of each component asset, with weights pro-
portional to the funds placed in each asset. The duration of zero-coupon
bond id simply its maturity, 3 years. The duration of the perpetuity is
1.10/.10 = 11 years. Therefore, if the fraction of the portfolio invested in
the zero is called w, and the fraction invested in the perpetuity is (1−w),
the portfolio duration will be
Asset duration = w × 3 years + (1 − w) × 11 years
3. Find the asset mix that sets the duration of asset equal to the 7-year dura-
tion of liabilities. This requires us to solve for w in the following equation:
w × 3 years + (1 − w) × 11 years = 7 years
This implies that w = 1/2. The manager should invest half the portfolio
in the zero and half in the perpetuity. This will result in an asset duration
of 7 years.
4. Fully fund the obligation. Because the obligation has a present value of
$10,000, must purchase $5,000 of the zero-coupon bond and $5,000 of the
perpetuity. (Note that face value of the zero will be $5,000 × (1.10)3
=
$6,655.)
Example 8-2 (Rebalancing)
Suppose that 1 year has passed, and the interest rate remains at 10%. The
portfolio manager of Example 8-1 needs to reexamine her position. Is the posi-
tion still fully funded? Is it still immunized? If not, what actions are required?
Solution: First, examine funding. The present value of the obligation will have
grown to $11,000, as it is 1 year closer to maturity. The manager’s funds also
have grown to $11,000: the zero-coupon bonds have increased in value from
$5,000 to $5,500 with the passage of time, while the perpetuity has its annual
$500 coupons and remains worth $5,000 therefore, the obligation is still fully
funded.
The portfolio weights must be changed, however. The zero-coupon bond
now will have a duration of 2 years, while the perpetuity duration remains atFall 2009, 25
11 years. The obligation is now due in 6 years. The weights must now satisfy
the equation
w × 2 + (1 − w) × 11 = 6
which implies that w = 5/9. To rebalance the portfolio and maintain the
duration manager now must invest a total of $11,000 × 5/9 = $6,111.11 in
the zero-coupon bond. This requires that the entire $500 coupon payment be
invested in the zero, with an additional $111.11 of the perpetuity sold and
invested in the zero-coupon bond.
Example 8-2 (Immunizing Weights) Look again at Example 8-1. What
would be the immunizing weights in the second year if the interest rate had
fallen to 8%?
Solution: The perpetuity’s duration now would be 1.08/0.08 = 13.5. We need
to solve the following equation for w:
w × 2 + (1 − w) × 13.5 = 6 =⇒ w = 0.6522.
Remark 2 Note that once we have the zero-coupon bond price we can easily
determine the corresponding spot rate. (This was the point of Example 7.)
We now demonstrate that even simple and apparently reasonable term-structure
models can contain arbitrage opportunities.
Example 9 (Arbitrage in a 1-Period Model)
Suppose at t = 0 the 1-year, 2-year and 3-year spot rates are given by 10%,
11% and 12%, respectively. One year from now the 1-year, 2-year and 3-year
spot rates will either have increased to [11% 12% 13%] or decreased to [9% 10%
11%]. Note that this example assumes that only parallel movements in the spot
rates can occur.
If we assume continuous compounding, then we can see that the forward
rate, f1,2, at t = 0 is given by
f1,2 =
2(0.11) − 1(0.1)
1
= 12%.
This forward rate, however, is higher than either of the possible 1-year spot
rates prevailing at t = 1 and so there is an arbitrage opportunity.
Exercise 5 Construct a trading strategy that would take advantage of the
arbitrage opportunity identified in Example 9.
At the end of the course (after we have studied martingale pricing) we will see
how to construct term structure models that are arbitrage free.Fall 2009, 26
Term Structure Explanations
There are three well known hypotheses that are commonly used for explaining
the observed term structure of interest rates: the expectations hypothesis, the
liquidity hypothesis and the market segmentation hypothesis.
Expectations Hypothesis: The expectations hypothesis states that the for-
ward rates, fi,j, are simply the spot rates, sj−i, that are expected to prevail at
time i. While this has some intuitive appeal, if the hypothesis was true then
the fact that the spot rate curve is almost always upwards sloping would mean
(why?) that the market is almost always expecting spot interest rates to rise.
This is not the case.
Liquidity Preference Hypothesis: This hypothesis states that investors gen-
erally prefer shorter maturity bonds to longer maturity bonds. This is because
longer-maturity bonds are generally more sensitive to changes in the general
level of interest rates and are therefore riskier. In order to persuade risk-averse
individuals to hold these bonds, they need to be sold at a discount, which is
equivalent to having higher interest rates at longer maturities.
Market Segmentation Hypothesis: This states that interest rates at date
t1 have nothing to do with interest rates at date t2 for t1 6= t2. The rationale for
this is that short-term securities might be of interest to one group of investors,
while longer term securities might be of interest to an altogether different group.
Since these investors have nothing in common, the markets for short- and long-
term securities should be independent of one another and therefore the interest
rates that are set by the market forces of supply and demand, should also be
independent. This explanation is not very satisfactory and explains very little
about the term structures that are observed in practice.
It is commonly perceived that the term structure is reasonably well explained
by a combination of the expectations and liquidity preference hypotheses.
Duration and Immunization
We saw earlier how to immunize portfolios against changes in the YTM when
we assumed that a bond’s YTM captured all the relevant economic information.
Now we have progressed to a term structure of interest rates, and we know how
to price a bond given the current term structure without making any reference
to the bond’s YTM. In this context, however, we could still define a bond’s
duration and convexity, and use them to immunize against, for example, parallel
movements in the term structure. The immunization procedure is very similar
to the one described earlier in the YTM context.
Further Examples and Applications
Example 10 (Floating Rate Bonds)Fall 2009, 27
A floating rate bond is the same as a regular bond except that the coupon
payments at the end of a period are determined by the prevailing short rate
at the beginning of the period. Since the term structure varies stochastically
through time, this implies that the payment stream of a floating rate bond is
also stochastic. Nonetheless, it is easy to price such a bond at a reset point by
using a simple dynamic programming type argument. In fact, at any such reset
point, it can be seen that the value of the floating rate bond is equal to the face
value, or par.
The argument works by noting that at the final reset point, the present value
must be (why?) par. The same argument can then be iterated back to date
t = 0.
Remark 3 The above comment regarding the price of floating rate bonds can
be useful for pricing interest rate swaps. We will see this later when we study
Forwards, Swaps and Futures.
Example 11 (Mortgage Mathematics (Exercise 4.14 in Luenberger))
This example is an introduction to the mathematics of mortgage-backed-
securities (MBS’s), a class of derivative instruments that play an enormous role
in the U.S. mortgage industry. They are credited with enabling a more efficient
allocation of risk and in the process, enabling consumers to obtain much cheaper
mortgages.
We assume the initial value of the mortgage is M = M(0), that equal periodic
payments of size B are made, and that the interest rate is r per period. We
also assume that there are a total of n periods in the mortgage and we use
M(k) to denote the mortgage principal after the kth
period. Note that after the
n payments of size B, the mortgage principal and interest have all been paid.
This means that each payment, B, pays both interest and some of the principal.
With this in mind, we can see that M(k) satisfies
M(k) = (1 + r)M(k − 1) − B, for k = 1, 2, 3, ···
This equation can be solved (how?) to obtain
M(k) = (1 + r)k
M −

(1 + r)k
− 1
r

B.
Since M(n) = 0 we have (see also equation (2.4))
B =
r(1 + r)n
M
(1 + r)n − 1
.
We can therefore substitute for B and write
M(k) = M
(1 + r)n
− (1 + r)k
(1 + r)n − 1
.Fall 2009, 28
Since we know M(k − 1) we can compute the interest, I(k) = rM(k − 1), on
M(k − 1) that would be due in the next period. This also means that we can
interpret the kth
payment as paying B −rM(k −1) of the remaining principal.
(a) Find the present value, V , (at rate r) of the principal payment stream in
terms of B, r, n, M.
(b) Find V in terms of r, n, M only.
(c) What is the present value, W, of the interest payment stream?
(d) What is the value of V as n → ∞?
(e) Which stream do you think has the larger duration: principal or interest?
Solution
(a) The present value, V , of the principal payment stream is given by
V =
n(B − rM)
1 + r
.
Does this agree with your intuition when n = 1?
(b) Substitute for B to obtain
V =
rnM
(1 + r)[(1 + r)n − 1]
.
(c) The present value, W, of the interest payment stream satisfies
W =
n X
k=1
I(k)
(1 + r)k
= M
(1 + r)n+1
− 1 − r − nr
(1 + r)[(1 + r)n − 1]
.
Does this agree with your intuition when n = 1?
(d) Check that V → M as n → ∞.
(e) The principal payment stream has longer duration. Why? What does this
say about the relative riskiness of the principal and interest payment streams?
Dynamic programming (DP) is a very useful tool in financial engineering.
It may be used whenever a decision-maker needs to make a sequence of decisions
through time. In such circumstances, the decision maker usually needs to find a
strategy that will describe her decision in each possible state of the world. DP12
is usually applied when there is uncertainty in the system but it also applies in
deterministic settings and that is the setting of Example 12 below.
Example 12 (Operating a Factory)
You own a lease on a factory that expires worthless exactly three years from
now. Each year the factory earns profits that are equal to the value of the
factory that prevailed at the beginning of the year. At the end of each year
12It is worth remarking that DP problems very often need to be solved numerically. This is
clearly true for discrete-time, discrete-state examples, but it is also often true for continuous-
state models. In such circumstances DP is often applied after discretizing the state space.Fall 2009, 29
Figure 2.1: Lattice Model
Figure 2.2: Optimal Strategy by Working Backwards
you can either withdraw these profits or reinvest them in the factory, thereby
doubling its value. The current value of the factory is $5 million and the interest
rate is 20% per year. What strategy should you adopt?
Solution
The lattice Figure 2.1 describes the various possibilities that can occur de-
pending on the choices you make. An upwards sloping arc corresponds to rein-
vesting the profits, whereas a horizontal arc corresponds to withdrawing the
profits at the end of the year. The value at a node represents the value of the
factory at that node.
We now compute the optimal strategy by working backwards from t = 3 to
compute the value of the lease. (It is convenient to assume that the decision
to reinvest profits at the end of a period will be made at the beginning of that
period.) See Figure 2.2. At t = 3 the lease expires worthless and so in the lattice
below we place a zero at each terminal node. At t = 2 it is clearly optimal to
choose to take the profits at the end of the period. Since these profits are
received at the end of the node, their value must be discounted backwards by
1/(1 + r) to t = 2. For example, we obtain 20/1.2 = 16.67 at the uppermost
node at t = 2. At t = 1, for example, the value of the lease at the lowermost
node is given by max(8.33,5 + 4.17)/1.2 = 7.64. Continuing in this manner we
find that the initial value of the lease is $12.73 million and that the optimal
strategy is to reinvest the profits after the first period and to withdraw the
profits after each of the remaining two periods.
Remark 4 Note that in Example 12 the optimal strategy is the same for all
values of r > 0.
Exercise 6 Suppose you have an option to sell the lease at t = 1 for $11 million.
What is the optimal strategy now? Is it still true that the optimal strategy is
independent of r for r > 0?
Even in the simple deterministic setting of these notes, it is possible to construct
many more examples ranging from capital-budgeting applications to problems
in asset-liability management. Standard mathematical tools for solving these
problems include linear, integer and dynamic programming.Fall 2009, 30
Challenge Question
A fund manager tells you that his Krypton Fund has outperformed all other
funds and benchmarks on both an absolute and risk-adjusted basis over the
past 5 years. For a considerable fee, you can invest in this fund but the fund
manager points out that even after taking this fee into account, the Krypton
Fund is still easily the best performing fund on the market.
You decide not to invest. Are you a complete fool(!) or might there be a good
reason for your decision?Chapter 3
Forwards, Swaps and
Futures
These notes introduce forwards, swaps and futures, and the basic mechanics of
their associated markets. We will also see how to price forwards and swaps,
but we will defer the pricing of futures contracts until after we have studied
martingale pricing.
While the underlying probability structure of the financial market plays only
a small role in these notes, you should not be under the impression that the
results we derive only hold for deterministic models and are therefore limited
in scope. On the contrary, these results are general and hold irrespective of the
underlying probability structure that we might find ourselves working with.
Finally, we mention again that it is easy to compute the value of a deterministic
cash flow given the current term-structure of interest rates and we will often
make use of this observation when pricing forwards and swaps. Pricing stochastic
cash-flows is more complicated and requires more sophisticated no-arbitrage, or
even equilibrium, methods. We will study these more sophisticated arbitrage
methods when we study martingale pricing. While the Capital Asset Pricing
Model (CAPM) is an example of a (single-period) equilibrium-based model that
you should be familiar with, we will not study equilibrium models in this course
as it is generally too difficult1
to solve realistic instances of these models for
(derivative) security prices.
1Financial economists often solve stylized equilibrium models to gain insight about how
markets and economies behave. They do not believe that the resulting security prices are
necessarily accurate estimates of real-world prices, a topic of greater interest to financial
engineers. For example, the value of the CAPM lies in the economic insights it provides
rather than in its use as a practical tool for pricing securities.Fall 2009, 32
## 3.0.1 Forwards
Definition 1 A forward contract on a security (or commodity) is a contract
agreed upon at date t = 0 to purchase or sell the security at date T for a price,
F, that is specified at t = 0.
When the forward contract is established at date t = 0, the forward price, F, is
set in such a way that the initial value of the forward contract, f0, satisfies f0 =
0. At the maturity date, T, the value of the contract is given2
by fT = ±(ST −F)
where ST is the time T value of the underlying security (or commodity).
It is very important to realize that there are two “prices” or “values” associated
with a forward contract at time t: ft and F. When we use the term “contract
value” or “forward value” we will always be referring to ft, whereas when we
use the term “contract price” or “forward price” we will always be referring to
F. That said, there should never be any ambiguity since ft is fixed (equal to
zero) at t = 0, and F is fixed for all t > 0 so the particular quantity in question
should be clear from the context. Note that ft need not be (and generally is
not) equal to zero for t > 0.
Examples of forward contracts include.
• A forward contract for delivery (i.e., purchase) of a non-dividend paying
stock with maturity 6 months.
• A forward contract for delivery of a 9-month T-Bill with maturity 3
months. (This means that upon delivery, the T-Bill has 9 months to
maturity.)
• A forward contract for the sale of gold with maturity 1 year.
• A forward contract for delivery of 10m Euro (in exchange for dollars) with
maturity 6 months.
Computing Forward Prices
We first consider forward contracts on securities that can be stored at zero cost.
The origin of the term “stored” is that of forward contracts on commodities
such as gold or oil which typically are costly to store. However, we will also use
the term when referring to financial securities. For example, while non-dividend
paying stocks and zero-coupon bonds may be stored at zero cost, it is also the
case that dividend paying stocks and coupon paying bonds can be stored at a
negative cost.
Forward Price for a Security that Can Be Stored at Zero Cost: Suppose
2If the contact specifies a purchase of the security then the date T payoff is ST −F whereas
if the contact specifies a sale of the security then the payoff is F − ST .Fall 2009, 33
a security can be stored at zero cost and that short3 selling is allowed. Then
the forward price, F, at t = 0 for delivery of that security at date T is given by
F = S/d(0,T), (3.1)
where S is the current spot price of the security and d(0T) is the discount factor
applying to the interval [0,T].
Proof: The proof works by constructing an arbitrage portfolio if F 6= S/d(0,T).
• Case (i): F < S/d(0,T): Consider the portfolio that at date t = 0 is short
one unit of the security, lends S until date T, and is long one forward
contract. The initial cost of this portfolio is 0 and it has a positive payoff,
S/d(0,T) − F, at date T. Hence it is an arbitrage.
• Case (ii): F > S/d(0,T): In this case, construct the reverse portfolio and
again obtain an arbitrage opportunity.
Example 1 (A Forward on a Non-Dividend Paying Stock)
Consider a forward contract on a non-dividend paying stock that matures
in 6 months. The current stock price is $50 and the 6-month interest rate is 4%
per annum. Compute the forward price, F.
Solution: Assuming semi-annual compounding, the discount factor is given by
d(0,0.5) = 1/1.02 = 0.9804. Equation (3.1) then implies that F = 50/0.9804 =
51.0.
Suppose now that we wish to compute the forward price of a security that has
non-zero storage costs. We will assume that we are working in a multi-period4
setting and that the security has a deterministic holding cost of c(j) in period
j, payable at the beginning of the period. Note that for a commodity, c(j) will
generally represent a true holding cost, whereas for a stock or bond, c(j) will
be a negative cost and represent a dividend or coupon payment.
Forward Price for a Security with Non-Zero Storage Costs: Suppose a
security can be stored for period j at a cost of c(j), payable at the beginning of
the period. Assuming that the security may also be sold short, then the forward
price, F, for delivery of that security at date T (assumed to be M periods away)
is given by
F =
S
d(0,M)
+
M−1 X
j=0
c(j)
d(j,M)
, (3.2)
where S is the current spot price of the security and d(j,M) is the discount
factor between dates j and M.Fall 2009, 34
Proof: As before, we could prove (3.2) using an arbitrage argument. An alter-
native proof is to consider the strategy of buying one unit of the security on the
spot market at t = 0, and simultaneously entering a forward contract to deliver
it at time T. The cash-flow associated with this strategy is
(−S − c(0), −c(1), ··· , −c(j), ··· , −c(M − 1), F),
and its present value must (why?) be equal to zero. Since the cash-flow is
deterministic we know how to compute its present value and we easily obtain
(3.2).
Example 2 (A Bond Forward)
Consider a forward contract on a 4-year bond with maturity 1 year. The
current value of the bond is $920, it has a face value of $1000 and a coupon
rate of 10% per annum. A coupon has just been paid on the bond and further
coupons will be paid after 6 months and after 1 year, just prior to delivery.
Interest rates for 1 year out are flat at 8%. Compute the forward price of the
bond.
Solution: Note that in this problem, the ‘storage costs’ (i.e., the coupon pay-
ments) are paid at the end of the period, which in this example is of length 6
months. As a result, we need to adjust (3.2) slightly to obtain
F =
S
d(0,M)
+
M−1 X
j=0
c(j)
d(j + 1,M)
.
In particular, we now obtain
F =
920
d(0,2)
−
50
d(1,2)
− 50,
where d(0,2) = 1.04−2
and d(1,2) = d(0,2)/d(0,1) = 1.04−1
.
Computing the Value of a Forward Contract When t > 0
So far we have discussed how to compute F = F0, the forward price at date
0 for delivery of a security at date T. We now concentrate on computing the
forward value, ft, for t > 0. (Recall that by construction, f0 = 0.) Let Ft be
the current forward price at date t for delivery of the same security at the same
maturity date, T. Then we have
ft = (Ft − F0)d(t,T). (3.3)
Proof: Consider a portfolio that at date t goes long one unit of a forward
contract with price Ft and maturity T, and short one unit of a forward contract
with price F0 and maturity T. This portfolio has a deterministic cash-flow ofFall 2009, 35
F0 − Ft at date T and a deterministic cash-flow of ft at date t. The present
value at date t of this cash-flow stream, (ft, F0 − Ft) must be zero (why?) and
hence we obtain (3.3).
Tight Markets
Examination of equation (3.2) implies that the forward price for a commodity
with positive storage costs should be increasing in M. Frequently, however,
this is not the case and yet it turns out that arbitrage opportunities do not
exist. This apparent contradiction can be explained by the fact that it is not
always possible to short commodities, either because they are in scarce supply,
or because holders of the commodity are not willing to lend them to would-be
short sellers. The latter situation might occur, for example, if the commodity
has a utility value over and beyond its spot market value.
If short selling is not allowed, then the arbitrage argument used to derive (3.2)
is no longer valid. In particular, we can only conclude that
F ≤
S
d(0,M)
+
M−1 X
j=0
c(j)
d(j,M)
. (3.4)
Exercise 1 Convince yourself that we can indeed only conclude that (3.4) is
true if short-selling is not permitted.
In such circumstances, we say that the market is tight. An artifice that is often
used to restore equality in (3.4) is that of the convenience yield. The convenience
yield, y, is defined in such a way that the following equation is satisfied.
F ≤
S
d(0,M)
+
M−1 X
j=0
c(j) − y
d(j,M)
. (3.5)
The convenience yield may be thought of as a negative holding cost that
measures the convenience per period of having the commodity on hand.
## 3.0.2 Swaps
Another important class of derivative security are swaps, perhaps the most
common of which are interest rate swaps and currency swaps. Other types
of swaps include equity and commodity swaps. A plain vanilla swap usually
involves one party swapping a series of fixed level payments for a series of variable
payments.
Swaps were introduced primarily for their use in risk-management. For example,
it is often the case that a party faces a stream of obligations that are floating
or stochastic, but that it will have to meet these obligations with a stream of
fixed payments. Because of this mismatch between floating and fixed, there isFall 2009, 36
no guarantee that the party will be able to meet its obligations. However, if the
present value of the fixed stream is greater than or equal to the present value
of the floating stream, then it could purchase an appropriate swap and thereby
ensure than it can meet its obligations.
Plain Vanilla Interest Rate Swap
In a plain vanilla interest rate swap, there is a maturity date, T, a notional
principal, P, and a fixed3
number of periods, M. There are two parties, A
and B say, to the swap. Every period party A makes a payment to party B
corresponding to a fixed rate of interest on P. Similarly, in every period party
B makes a payment to party A that corresponds to a floating rate of interest
on the same notional principal, P.
It is important to note that the principal itself, P, is never exchanged. Moreover,
it is also important to specify whether the payments occur at the end or the
beginning of each period.
For example, assuming cash payments are made at the end of periods, i.e., in
arrears, the cash flow that party A receives4
is given by
C = (0, S0 − X, ··· , SM−1 − X)
where X = rfP is constant, and Si = riP is the interest payment that occurs at
the end of period i based on the interest rate that prevailed at the beginning of
period i, ri. S0 −X the payment at the end of the first period and SM−1 −X)
the cash flow at the end of Mth
period. In general, ri will be stochastic and
so the swap’s cash-flow, C, will also be stochastic. As is the case with forward
contracts, the value X (equivalently rf) is usually chosen in such a way that
the initial value of the swap is zero. Even though the initial value of the swap is
zero, we say that party A is “long” the swap and party B is “short” the swap.
Exercise 2 Make sure you understand how to use the terms “long” and “short”
when referring to a swap.
Currency Swaps
A simple type of currency swap would be an agreement between two parties
to exchange fixed rate interest payments and the principal on a loan in one
currency for fixed rate interest payments and the principal on a loan in another
currency. Note that for such a swap, the uncertainty in the cash flow is due to
uncertainty in the currency exchange rate. In a Dollar/Euro swap, for example,
a US company may receive the Euro payments of the swap while a German
company might receive the dollar payments. Note that the value of the swap
3It is assumed that the date of the terminal payment coincides with the maturity date, T.
4Party B receives −C.Fall 2009, 37
to each party will vary as the USD/Euro exchange rate varies. As a result, the
companies are exposed to foreign exchange risk but if necessary this risk can be
hedged by trading in the forward foreign exchange market.
Why might the US and German companies enter such a transaction? A possible
explanation might be that the US company wishes to invest in the Eurozone
while the German company wishes to invest in the U.S. Each company therefore
needs foreign currency. However, they may have a comparative advantage bor-
rowing in their domestic currency at home as opposed to borrowing in a foreign
currency abroad. If this is the case, it makes sense to borrow domestic currency
at home and use a swap to convert it into the foreign currency.
Pricing Swaps
Pricing swaps is quite straightforward. For example, in the currency swap de-
scribed above, it is easily seen that the swap cash-flow is equivalent to being
long a bond in one currency and short the bond in another currency. Therefore,
all that is needed to price5
the swap is the term structure of interest rates in
each currency (to price the bonds) and the spot currency exchange rate.
More generally, we will see that the cash-flow stream of a swap can often be
considered as a stream of forward contracts. Since we can price forward con-
tracts, we will be able to price6
swaps. We will see how to do this by way of the
first example below where we price a commodity swap.
Example 3 (Pricing a Commodity Swap)
Let Si be the spot price of a commodity at the beginning of period i. Party
A receives the spot price for N units of the commodity and pays a fixed amount,
X, per period. We will assume that payments take place at the beginning of
the period and there will be a total of M payments, beginning one period from
now. The cash-flow as seen by the party that is long the swap is
C = N × (0, S1 − X, S2 − X, ··· , SM − X).
Note that this cash-flow is stochastic and so we cannot compute its present
value directly by discounting. However, we can decompose C into a stream of
fixed payments (of −NX) that we can easily price, and a stochastic stream,
N(0,S1,S2,··· ,SM). The stochastic stream is easily seen to be equivalent to
a stream of forward contacts on N units of the commodity. We then see that
receiving NSi at period i has the same value of receiving NFi at period i where
Fi is the date 0 forward price for delivery of one unit of the commodity at date
5As mentioned above, the fixed payment stream of a swap is usually chosen so that the
initial swap value is zero. However, once the swap is established its value will then vary
stochastically and will not in general be zero.
6Later in the course we will develop the theory of martingale pricing. Then we will be able
to price swaps directly, without needing to decompose it into a series of forward contracts.Fall 2009, 38
i. As the forward prices, Fi, are deterministic and known at date 0, we can see
that the value of the commodity swap is given by
V = N
M X
i=1
d(0,i)(Fi − X).
where, d(0,i) is the discount factor applying to the interval [0,i]. X is usually
chosen so that the initial value of V is zero.
Example 4 (Pricing an Interest Rate Swap)
Party A agrees to make payments of a fixed rate of interest, r, on a notional
principal, P, while receiving floating rate payments on P for M periods. We
assume that the payments are made at the end of each period and that the
floating rate payment will be based on the short rate that prevailed at the
beginning of the period. The cash-flow corresponding to the long side of the
swap is then given by
C = P(0, c0 − r, c1 − r, ··· , cM−1 − r).
where ci is the short rate for the period beginning at date i. Again this cash-flow
can be decomposed into a series of fixed payments that can be easily priced, and
a stochastic stream, P(0,c0,c1,··· ,cM−1). We can value the stochastic stream
either using an arbitrage argument (see the next example) or by recalling that
the price of a floating rate bond is always par at any reset point. Note that the
stochastic stream is exactly the stream of coupon payments corresponding to a
floating rate bond with face value P. Hence the value of the stochastic stream
must be (why?) P(1 − d(0,M)) and so the value of the swap is given by
V = P
"
1 − d(0,M) − r
M X
i=1
d(0,i)
#
. (3.6)
As before, r is usually chosen so that the initial value of the swap is zero.
Remark: The example below is quite tricky. the key with these types of
questions is to construct a portfolio that includes the security you wish to price
as well as other securities whose prices are already known. If the price of the
resulting portfolio is also known then you should have enough information to
price the security of interest.
Example 5 (Luenberger Exercise 10.10)
The floating rate portion of a plain vanilla interest swap with yearly pay-
ments and a notional principal of one unit has cash flows at the end of each year
defining a stream starting at time t = 1 of (c0,c1,c2,··· ,cM−1), where ci is
the actual short rate at the beginning of year i, Using the concepts of forwards,
argue that the value at time zero of ci to be received at time i+1 is d(0,i+1)ri,
where ri is the short rate for time i implied by the current (time zero) termFall 2009, 39
structure and d(0,i + 1) is the implied discount factor to time i + 1. The value
of the stream is therefore
PM−1
i=0 d(0,i + 1)ri. Show that this reduces to the
required term in the formula for V in (3.6).
Solution: Let W be the time 0 value of the contract in question, i.e., the
security that pays ci at time i+1. Now consider the following portfolio strategy.
A: Borrow $1 today until date i. Then at date i borrow again the principal
and resulting interest until date i + 1 at the prevailing short rate, ci. That is,
borrow $1 today until date i + 1.
B: Lend $1 today until date i + 1.
C: Purchase d(0,i)−1
contracts today.
We then have the following cash-flows.
t = 0 t = i t = i + 1
A 1 0 −d(0,i)−1
(1 + ci)
B −1 0 d(0,i + 1)−1
C −d(0,i)−1
W 0 d(0,i)−1
ci
Total −d(0,i)−1
W 0 d(0,i + 1)−1
− d(0,i)−1
Note that the row marked Total consists only of deterministic cash flows.
We therefore have that
d(0,i)−1
W = d(0,i + 1)(d(0,i + 1)−1
− d(0,i)−1
)
implying that
W = d(0,i + 1)

1 −
d(0,i)
d(0,i + 1)

= −rid(0,i + 1),
as required.
In the last line we used the fact that ri satisfies
ri =
d(0,i)
d(0,i + 1)
− 1
and this also enables us to obtain
M−1 X
i=0
d(0,i + 1)ri =
M−1 X
i=0
d(0,i + 1)

d(0,i)
d(0,i + 1)
− 1

= 1 − d(0,M),
which is consistent with (3.6).Fall 2009, 40
## 3.0.3 Futures
While forwards markets have proved very useful for both hedging and invest-
ment purposes, they have a number of weaknesses. First, forward markets are
not organized through an exchange. This means that in order to take a position
in a forward contract, you must first find someone willing to take the opposite
position. This is the double-coincidence-of-wants problem. Second, because for-
ward contracts are not exchange-traded, there can sometimes be problems with
price transparency and liquidity. Finally, in addition to the financial risk of a
forward contract, there is also counter-party risk. This is the risk that one party
to the forward contract will default on it’s obligations. These problems have
been eliminated to a large extent through the introduction of futures markets.
That is not to say that forward markets are now redundant; they are not, and
they are used, for example, in the many circumstances when suitable futures
markets are not available.
Perhaps the best way to understand the mechanics of a futures market is by
example.
Example 6 (Cricket Futures)
We consider an example of a futures market where the futures contracts are
not written on an underlying financial asset or commodity. Instead, they are
written on the total number of runs that are scored in a cricket7
test match. The
market opens before the cricket match takes place and expires at the conclusion
of the match. Similar futures markets do exist in practice and this example
simply demonstrates that in principle, futures markets can be created where
just about any underlying variable can serve as the underlying asset.
The particular details of the cricket futures market are as follows.
• The futures market opens on June 3rd and the test match itself begins on
June 15th. The market closes when the match is completed on June 19th.
• The closing price on the first day of the market was 720. This can be
interpreted as the market forecast for the total number of runs that will
be scored by both teams in the test match. This value varies through time
as new events occur and new information becomes available. Examples of
such events include information regarding player selection and fitness, cur-
rent form of players, weather forecast updates, umpire selection, condition
of the field etc.
• The contract size is $1. This means if you go long one contract and
the price increases by one, then you will have $1 added to your cash
7You do not need to know anything about cricket in order to understand this example!
An Excel worksheet, Futures.xls, is available for this example and may be downloaded from
the course website. There we assume that the closing price on any given day is normally
distributed with mean equal to the previous day’s closing price, and standard deviation, σ.
We use σ = 10 for the pre-test match data and a σ = 25 after the test match has actually
begun. This reflects the fact that you would expect a greater volatility once the match has
begun.Fall 2009, 41
Figure 3.1: Mechanics of the Futures Market
balance. On the other hand, if the price had decreased by 8, say, and you
were short 5 contracts then your balance would decrease by $40. This
process of marking-to-market is usually done on a daily basis. Moreover,
the value of your futures position immediately after marking-to-market is
identically zero, as any accrued profits or losses have already been added
to or subtracted from your cash balance.
In the table below we present one possible evolution13 of the futures market
between June 3 and June 19. The initial position is 100 contracts and it is
assumed that this position is held until the test match ends on June 19.
An initial balance of $10 000 is assumed and this balance earns interest at a rate
of .005% per day. It is also important to note that when the futures position is
initially adopted the cost is zero, i.e., initially there is no exchange of cash.
Remark 1 You should make sure that you fully understand the mechanics
of this futures market as these are the same mechanics used by other futures
markets.
In Example 6 we did not discuss the details of margin requirements which are
intended to protect against the risk of default. A typical margin requirement
would be that the futures trader maintain a minimum balance in her trading
account. This minimum balance will often be a function of the contract value
(perhaps 5% to 10%) multiplied by the position, i.e., the number of contracts
that the trader is long or short. When the balance drops below this minimum
level a margin call is made after which the trader must deposit enough funds
so as to meet the balance requirement. Failure to satisfy this margin call will
result in the futures position being closed out
Strengths and Weaknesses of Futures Markets
Futures markets are useful for a number of reasons:
• It is easy to take a position using futures markets without having to pur-
chase the underlying asset. Indeed, it is not even possible to buy the
underlying asset in some cases, e.g., interest rates, cricket matches and
presidential elections.
• Futures markets allow you to leverage your position. That is, you can
dramatically increase your exposure to the underlying security by using
the futures market instead of the spot market.Fall 2009, 42
• They are well organized and designed to eliminate counter-party risk as
well as the “double-coincidence-of-wants” problem.
• The mechanics of a futures market are generally independent of the un-
derlying ‘security’ so they are easy to “operate” and easily understood by
investors.
Futures markets also have some weaknesses.
• The fact that they are so useful for leveraging a position also makes them
dangerous for unsophisticated and/or rogue investors.
• Futures prices are (more or less) linear in the price of the underlying
security. This limits the types of risks that can be perfectly hedged using
futures markets. Nonetheless, non-linear risks can still be partially hedged
using futures. See, for instance, Example 8 below.
Relationship of Futures Prices to Forward and Spot Prices
While forwards and futures prices are clearly closely related, they are not
equal in general. One important case where they do coincide is when interest
rates are deterministic and a proof of this may be found in Section 10.7 of
Luenberger. However, we will see a more general proof of this and related
results after we have studied martingale pricing.
When interest rates are stochastic, as they are in the real world, forwards and
futures prices will generally not coincide. In particular, when movements in
interest rates are positively correlated with price movements in the asset un-
derlying the futures contract, futures prices will tend to be higher than the
corresponding forward price. Similarly, when the correlation is negative, the
futures price will tend to be lower than the forward price. We will see an expla-
nation for this after we have studied martingale pricing.
Another interesting question that arises is the relationship between F and E[ST ],
where ST is the price of the underlying asset at the expiration date, T. In
particular, we would like to know whether F < E[ST ], F = E[ST ] or F > E[ST ].
We can already guess at the answer to this question. Using the language of the
CAPM8
, for example, we would expect (why?) F < E[ST ] if the underlying
security has positive systematic risk, i.e., a positive beta.
Hedging Using Futures Markets: the Perfect and Minimum-Variance
Hedges
Futures markets are of great importance for hedging against risk. They are
particularly suited to hedging risk that is linear in the underlying asset. This is
8Recall that the CAPM states that the expected return on a risky security, E[r] say, satisfies
E[r]−rf = β(E[rm]−rf), where rf is the risk-free interest rate, rm is the return on the market
portfolio and β = Cov(r,rm) = Var(rm).Fall 2009, 43
because the final payoff at time T from holding a futures contract is linear9
in
the terminal price of the underlying security, ST . In this case we can achieve a
perfect hedge by taking an equal and opposite position in the futures contract.
Example 7 (Perfect Hedge)
Suppose a wheat producer knows that he will have 100,000 bushels of wheat
available to sell in three months time. He is concerned that the spot price of
wheat will move against him (i.e., fall) in the intervening three months and so
he decides to lock in the sale price now by hedging in the futures markets. Since
each wheat futures contract is for 5,000 bushels, he therefore decides to sell 20
three-month futures contracts. Note that as a result, the wheat producer has a
perfectly hedged position.
In general, perfect hedges are not available for a number of reasons.
1. None of the expiration dates of available futures contracts may exactly
match the expiration date of the payoff, PT , that we want to hedge.
2. PT may not correspond exactly to an integer number of futures contracts.
3. The security underlying the futures contract may be different to the secu-
rity underlying PT .
4. PT may be a non-linear function of the security price underlying the fu-
tures contract.
5. Combinations of all the above are also possible.
When perfect hedges are not available, we often use the minimum-variance
hedge to identify a good hedging position in the futures markets. To derive the
minimum-variance hedge, we let ZT be the cash flow that occurs at date T that
we wish to hedge, and we let Ft be the time t price of the futures contract.
At date t = 0 we adopt a position10
of h in the futures contract and hold this
position until time T. Since the initial cost of a futures position is zero, we can
(if we ignore issues related to interest on the margin account) write the terminal
cash-flow, YT , as
YT = ZT + h(FT − F0).
9The final payoff is ±x(FT −F0) = ±x(ST −F0) depending on whether or not we are long
or short x futures contracts and this position is held for the entire period, [0,T]. This assumes
that we are ignoring the costs and interest payments associated with the margin account.
As they are of of secondary importance, we usually do this when determining what hedging
positions to take.
10A positive value of h implies that we are long the futures contract while a negative value
implies that we are short. More generally, we could allow h to vary stochastically as a function
of time. We might want to do this, for example, if ZT is path-dependent or if it is a non-
linear function of the security price underlying the futures contract. When we allow h to vary
stochastically, we say that we are using a dynamic hedging strategy. Such strategies are often
used for hedging options and other derivative securities with non-linear payoffs.Fall 2009, 44
Our objective then is to minimize
var(YT ) = Var(ZT ) + h2
Var(FT ) + 2hCov(ZT ,FT )
and we find that the minimizing h and minimum variance are given by
h∗
= −
Cov(ZT ,FT )
Var(FT )
Var(Y ∗
T ) = Var(ZT ) −
Cov(ZT ,FT )2
Var(FT )
Such static hedging strategies are often used in practice, even when dynamic
hedging strategies are capable of achieving a smaller variance. Note also, that
unless E[FT ] = F0, it will not be the case that E[ZT ] = E[Y ∗
T ]. It is also
worth noting that the mean-variance hedge is not in general the same as the
equal-and-opposite hedge.
Example 8 (Luenberger Exercise 10.14)
Assume that cash flow is given by y = ST W+(FT −F0)h. Let σ2
S = Var(ST ),
σ2
F = Var(FT ) and σSF = Cov(ST ,FT ).
In an equal and opposite hedge, h is taken to be an opposite equivalent dollar
value of the hedging instrument. Therefore h = −kW, where k is the price ratio
between the asset and the hedging instrument. Express the standard deviation
of y with the equal and opposite hedge in the form
σy = Wσs × B. (That is, find B.)
Solution
We have y = ST W − (FT − F0)Wk, where k = S0/F0. Note that h is
determined at date 0 and is therefore a function of date 0 information only. It
is easy to obtain
σ2
y = W2
σ2
S +
W2
S2
0
F2
0
σ2
F − 2
W2
S0
F0
σSF
=⇒ σy = WσS
s
1 +

S0σF
F0σS
2
− 2
S0σSF
F0σ2
S
,
which implicitly defines B.
As a check, suppose that ST and FT are perfectly correlated. We then obtain
(check) that
σy = WσS

1 −
S0σF
F0σS

,
which is not in general equal to 0! However, if Ft and St are scaled appropriately
(alternatively we could scale h), then we can obtain a perfect hedge.Fall 2009, 45
Example 9 (Hedging Operating Profits)
A corporation manufactures a particular type of widget. It has orders to
supply D1 and D2 of these widgets at dates t1 and t2, respectively. The revenue,
R, of the corporation may then be written as
R = D1P1 + D2P2,
where Pi represents the price per widget at time ti. We assume that Pi is
stochastic and that it will depend in part on the general state of the economy
at date ti. In particular, we assume
Pi = aSieǫi
+ c
where a and c are constants, Si is the time ti value of the market index,
and ǫ1 and ǫ2 are independent random variables that are also independent of
Si. Furthermore, they satisfy E[eǫi
] = 1 for each i. The manufacturer wishes to
hedge the revenue, R, by taking a position h at t = 0 in a futures contract that
expires at date t2 and where the market index is the underlying security. The
date t2 payoff, Y , is then given by
Y = D1(aS1eǫ1
+ c) + D2(aS2eǫ2
+ c) + h(S2 − F0).
If we assume that St is a geometric Brownian motion so that St = S0 exp((µ−
σ2
/2)t+σBt), where Bt is a standard Brownian motion, we can easily find the
minimum variance hedge, h∗
= −Cov(R − S2) = Var(S2).
Exercise 3 Compute h∗
and the variance reduction that is achieved.
Remark: A more sophisticated hedge would be to choose a position of size h1
at date t = 0 and then to update this position to h2 at date t1 where h1 and h2
are constants that are chosen at date t = 0. In this case the resulting hedging
strategy is still a static hedging strategy.
Note, however, that since h2 need not be chosen until date t1, it makes sense to
allow h2 to be a function of available information at date t1. In particular, we
could allow h2 to depend on P1 and S1, thereby obtaining a dynamic hedging
strategy, (h1,h2(P1,S1)). Such a strategy should be able to eliminate most of
the uncertainty in R.
Exercise 4 How would you go about solving for the optimal (h∗
1,h∗
2(P1,S1))?
Would you need to make an assumption regarding F1?
Note that the most general class of dynamic hedging strategy would allow you
to adjust h stochastically at every date in [0,t2) and not just at dates t0 and t1.Fall 2009, 46
Final Remarks
• As stated earlier, futures markets generally work in much the same way,
regardless of the underlying asset. Popular futures markets include inter-
est rate futures and equity index futures. Interest futures, for example,
can be used to immunize bond portfolios by matching durations and/or
convexities. Index futures are often used in place of the actual index itself
for hedging index options. Of course, interest rate and index futures are
also used for many other reasons.
• Sometimes the expiration dates of available futures contracts are sooner
than the expiration date of some obligation or security that needs to be
hedged. In such circumstances, it is often common to roll the hedge
forward. That is, a hedging position in an available futures contract is
adopted until that futures contract expires. At this point the futures po-
sition is closed out and a new position in a different (and newly available)
futures contract is adopted. This procedure continues until the expiration
date of the obligation or security.
Exercise 5 What types of risk do you encounter when you roll the hedge
forward?
In order to answer Exercise 5, assume you will have a particular asset
available to sell at time T2. Today, at time t = 0, you would like to
hedge your time T2 cash-flow by selling a single futures contract that
expires at time T2 with the given asset as the underlying security. Such
a futures contract, however, is not yet available though there is a futures
contract available at t = 0 that expires at time T1 < T2. Moreover, upon
expiration of this contract the futures contract with expiration T2 will
become available. You therefore decide to adopt the following strategy:
at t = 0 you sell one unit of the futures contract that expires at time
T1. At T1 you close out this contract and then sell one unit of the newly
available futures contract that expires at time T2. What is your net cash-
flow, i.e., after selling the asset and closing out the futures contract, at
time T2?
• Note that we have only discussed the mechanics of futures markets and
how they can be used to hedge linear and non-linear risks. We have not
seen how to compute the futures price, Ft, but instead will return to this
after we have studied martingale pricing.
Challenge Question
The University of Iowa Presidential Futures Market was very successful in the
2000 election at predicting the share of the popular vote that was won by Gore
and Bush, respectively. One of the rules of all of the Iowa futures markets is
that people are limited in the size of the positions that they can take. For
example, you are not allowed to open a trading account with more than $500Fall 2009, 47
and multiple accounts per person are not allowed. Do you think this particular
rule might in any way help account for the success in predicting the outcome of
the presidential election? (After all, there are many other reasons why such a
rule might be enacted.)Chapter 4
Martingale Pricing Theory
These notes develop the modern theory of martingale pricing in a discrete-time,
discrete-space framework. This theory is also important for the modern theory
of portfolio optimization as the problems of pricing and portfolio optimization
are now recognized as being intimately related. We choose to work in a discrete-
time and discrete-space environment as this will allow us to quickly develop
results using a minimal amount of mathematics: we will use only the basics of
linear programming duality and martingale theory. Despite this restriction, the
results we obtain hold more generally for continuous-time and continuous-space
models once various technical conditions are satisfied. This is not too surprising
as one can imagine approximating these latter models using our discrete-time,
discrete-space models by simply keeping the time horizon fixed and letting the
number of periods and states go to infinity in an appropriate manner.
## 4.0.1 Notation and Definitions for Single-Period Models
We first consider a one-period model and introduce the necessary definitions and
concepts in this context. We will then extend these definitions to multi-period
models.
Let t = 0 and t = 1 denote the beginning and end, respectively, of the period.
At t = 0 we assume that there are N +1 securities available for trading, and at
t = 1 one of m possible states will have occurred. Let S(i) denote the time t = 0
value of the ith
security for 0 ≤ i ≤ N, and let S
(i)
1 (ωj) denote its payoff at date
t = 1 in the event that ωj occurs. Let P = (p1,··· ,pm) be the true probability
distribution describing the likelihood of each state occurring. We assume that
pk > 0 for each k.
Figure 4.1: Time and StatesFall 2009, 49
Arbitrage
A type A arbitrage is an investment that produces immediate positive reward
at t = 0 and has no future cost at t = 1. An example of a type A arbitrage would
be somebody walking up to you on the street, giving you a positive amount of
cash, and asking for nothing in return, either then or in the future.
A type B arbitrage is an investment that has a non-positive cost at t =
0 but has a positive probability of yielding a positive payoff at t = 1 and
zero probability of producing a negative payoff then. An example of a type B
arbitrage would be a stock that costs nothing, but that will possibly generate
dividend income in the future.
In finance we always assume that arbitrage opportunities do not exist1
since if
they did, market forces would quickly act to dispel them.
Linear Pricing
Definition 1 Let S
(1)
0 and S
(2)
0 be the date t = 0 prices of two securities whose
payoffs at date t = 1 are d1 and d2, respectively.2
We say that linear pricing
holds if for all α1 and α2, α1S
(1)
0 +α2S
(2)
0 is the value of the security that pays
α1d1 + α2d2 at date t = 1.
It is easy to see that absence of type A arbitrage implies that linear pricing
holds. As we always assume that arbitrage opportunities do not exist, we also
assume that linear pricing always holds.
Elementary Securities, Attainability and State Prices
Definition 2 An elementary security is a security that has date t = 1 payoff
of the form ej = (0,··· ,0,1,0,··· ,0), where the payoff of 1 occurs in state j.
As there are m possible states at t = 1, there are at most m elementary securi-
ties.
Definition 3 A security or contingent claim, X, is said to be attainable if
there exists a trading strategy, θ = [θ0 θ1 ··· θN+1]T
, such that



X(ω1)
. . .
X(ωm)


 =




S
(0)
1 (ω1) ··· S
(N)
1 (ω1)
. . .
. . .
. . .
S
(0)
1 (ωm) ··· S
(N)
1 (ωm)







θ0
. . .
θN


 (4.1)
1This is often stated as assuming that “there is no free lunch”.
2d1 and d2 are therefore m × 1 vectors.Fall 2009, 50
Figure 4.2: Time and States
In shorthand we write X = S1θ where S1 is the m × (N + 1) matrix of date 1
security payoffs. Note that θj represents the number of units of the jth
security
purchased at date 0. We call θ the replicating portfolio.
Example 1 (An Attainable Claim)
Consider the one-period model below where there are 4 possible states of
nature and 3 securities, i.e., m = 4 and N = 2. At t = 1 and state ω3, for
example, the values of the 3 securities are 1.03 , 2 and 4, respectively.
The claim X = [7.47 6.97 9.97 10.47]T
is an attainable claim since X = S1θ
where θ = [−1 1.5 2]T
is a replicating portfolio for X.
Note that the date t = 0 cost of the three securities has nothing to do with
whether or not a claim is attainable. We can now give a more formal definition
of arbitrage in our one-period models.
Definition 4 A type A arbitrage is a trading strategy, θ, such that S0θ < 0
and S1θ = 0. A type B arbitrage is a trading strategy, θ, such that S0θ ≤ 0,
S1θ ≥ 0 and S1θ 6= 0.
Note for example, that if S0θ < 0 then θ has negative cost and therefore produces
an immediate positive reward if purchased at t = 0.
Definition 5 We say that a vector π = (π1,··· ,πm) > 0 is a vector of state
prices if the date t = 0 price, P, of any attainable security, X, satisfies
P =
m X
k=1
πkX(ωk). (4.2)
We call πk the kth
state price.3
Remark 1 It is important to note that in principle there might be many state
price vectors. If the kth
elementary security is attainable, then it’s price must
be πk and the kth
component of all possible state price vectors must therefore
coincide. Otherwise an arbitrage opportunity would exist.
Example 2 (State Prices)
3We insist that each πj is strictly positive as later we will want to prove that the existence
of state prices is equivalent to the absence of arbitrage.Fall 2009, 51
Returning to the model of Example 1 we can easily check that [π1 π2 π3 π4]T
=
[0.0737 0.1910 0.3705 0.3357]T
is a vector of state prices. More generally, how-
ever, we can check that




π1
π2
π3
π4



 =




0
0.3102
0.4113
0.2682



+ ǫ




0.7372
−0.5898
−0.2949
0.1474




is also a vector of state prices for any ǫ such πi > 0 for 0 ≤ i ≤ 4.
Deflating by the Numeraire Security
Let us recall that there are N + 1 securities and that S
(i)
1 (ωj) denotes the date
t = 1 price of the ith
security in state ωj. The date t = 0 price of the ith
security
is denoted by S
(i)
0 .
Definition 6 A numeraire security is a security with a strictly positive price
at all times, t.
It is often convenient to express the price of a security in units of a chosen
numeraire. For example, if the nth
security is the numeraire security, then we
define
S̄
(i)
t (ωj) :=
S
(i)
t (ωj)
S
(n)
t (ωj)
,
to be the date t, state ωj price (in units of the numeraire security) of the ith
security. We say that we are deflating by the nth
or numeraire security. Note
that the deflated price of the numeraire security is always constant and equal
to 1.
Definition 7 The cash account is a particular security that earns interest at
the risk-free rate of interest. In a single period model, the date t = 1 value of
the cash account is 1 + r (assuming that $1 had been deposited at date t = 0),
regardless of the terminal state and where r is the one-period interest rate that
prevailed at t = 0.
In practice, we often deflate by the cash account if it is available. Note that
deflating by the cash account is then equivalent to the usual process of discount-
ing. We will use the zeroth
security with price process, S
(0)
t , to denote the cash
account whenever it is available.
Example 3 (Numeraire and Cash Account)
Note that any security in Example 1 could serve as a numeraire security
since each of the 3 securities has a strictly positive price process. It is also clear
that the zeroth security in that example is actually the cash account.Fall 2009, 52
Equivalent Martingale Measure (EMM)
We assume that we have chosen a specific numeraire security with price process,
S
(n)
t .
Definition 8 An equivalent martingale measure (EMM) is a set of proba-
bilities, Q = (q1,··· ,qm) such that
1. qk > 0 for all k.
2. The deflated security prices are martingale. That is
S̄
(i)
0 :=
S
(i)
0
S
(n)
0
= EQ
0
"
S
(i)
1
S
(n)
1
#
=: EQ
0 [S̄
(i)
1 ]
for all i where EQ
0 [·] denotes expectation with respect to the risk-neutral
probability measure, Q.
Remark 2 Note that a set of risk-neutral probabilities, or EMM, is specific to
the chosen numeraire security, S
(n)
t . In fact it would be more accurate to speak
of an EMM-numeraire pair.
Complete Markets
We now assume that there are no arbitrage opportunities. If there is a full set
of m elementary securities available (i.e., they are all attainable), then we can
use the state prices to compute the date t = 0 price, S0, of any security. To
see this, let x = (x1,··· ,xm) be the vector of possible date t = 1 payoffs of a
particular security. We may then write
x =
m X
i=1
xiei,
and use linear pricing to obtain S0 =
Pm
i=1 xiπi.
If a full set of elementary securities exists, then as we have just seen, we can
construct and price every possible security. We have the following definition.
Definition 9 If every random variable X is attainable, then we say that we
have a complete market. Otherwise we have an incomplete market.
Note that if a full set of elementary securities is available, then the market is
complete.
Exercise 1 Is the model of Example 1 complete or incomplete?Fall 2009, 53
## 4.0.2 Martingale Pricing Theory: Single-Period Models
We are now ready to derive the main results of martingale pricing theory for
single period models.
Proposition 1 If an equivalent martingale measure, Q, exists, then there can
be no arbitrage opportunities.
Exercise 2 Prove Proposition 1.
Exercise 3 Convince yourself that if we did not insist on each qk being strictly
positive in Definition 8 then Proposition 1 would not hold.
Theorem 2 Assume there is a security with a strictly positive price process,
S
(n)
t . If there is a set of positive state prices, then a risk-neutral probability
measure, Q, exists with S
(n)
t as the numeraire security. Moreover, there is a
one-to-one correspondence between sets of positive state prices and risk-neutral
probability measures.
Proof: Suppose a set of positive state prices, π = (π1,··· ,πm), exists. For all
j we then have (by linear pricing)
S
(j)
0 =
m X
k=1
πkS
(j)
1 (ωk)
=
m X
l=1
πlS
(n)
1 (ωl)
! m X
k=1
πkS
(n)
1 (ωk)
Pm
l=1 πlS
(n)
1 (ωl)
S
(j)
1 (ωk)
S
(j)
1 (ωk)
, (4.3)
Now observe that
Pm
l=1 πlS
(n)
1 (ωl) = S
(n)
0 and that if we define
qk :=
πkS
(n)
1 (ωk)
Pm
l=1 πlS
(n)
1 (ωl)
, (4.4)
then Q := (q1,··· ,qm) defines a probability measure. Equation (3) then implies
S
(j)
0
S
(n)
0
=
m X
k=1
qk
S
(j)
0 (ωk)
S
(n)
0 (ωk)
= EQ
0
"
S
(j)
1
S
(n)
1
#
, (4.5)
and so Q is a risk-neutral probability measure, as desired.
The one-to-one correspondence between sets of positive state prices and risk-
neutral probability measures is clear from (4.4).
Remark 3 The true real-world probabilities, P = (p1,··· ,pm), are almost
irrelevant here. The only connection between P and Q is that they must be
equivalent. That is pk > 0 ⇔ qk > 0. Note that in the statement of Theorem
2 we assumed that the set of state prices was positive. This and equationFall 2009, 54
(4.4)implied that each qk > 0 so that Q is indeed equivalent to P. (Recall it
was assumed at the beginning that each pk > 0.)
Absence of Arbitrage ≡ Existence of Positive State Prices ≡ Existence
of EMM
Before we establish the main result, we first need the following theorem which
we will prove using the theory of linear programming.
Theorem 3 Let A be an m × n matrix and suppose that the matrix equation
Ax = p for p ≥ 0 cannot be solved except for the case p = 0. Then there exists
a vector y > 0 such that AT
y = 0.
Proof: We will use the following result from the theory of linear programming:
If a primal linear program, P, is infeasible then its dual linear program, D,
is either also infeasible, or it has an unbounded objective function.
Now consider the following sequence of linear programs, Pi, for i = 1,··· ,m:
min 0T
x (Pi)
subject to Ax ≥ ǫi
where ǫi has a 1 in the ith
position and 0 everywhere else. The dual, Di, of each
primal problem, Pi is
max yi (Di)
subject to AT
y = 0
y ≥ 0
By assumption, each of the primal problems, Pi, is infeasible. It is also clear
that each of the dual problems are feasible (take y equal to the zero vector).
By the LP result above, it is therefore the case that each Di has an unbounded
objective function. This implies, in particular, that corresponding to each Di,
there exists a vector yi
≥ 0 with AT
yi
= 0 and yi
i > 0, i.e., the ith
component
of yi
is strictly positive. Now taking
y∗
=
m X
i=1
yi
,
we clearly see that AT
y∗
= 0 and y∗
is strictly positive.
We now prove the following important result regarding absence of arbitrage and
existence of positive state prices.
Theorem 4 In the one-period model there is no arbitrage if and only if there
exists a set of positive state prices.Fall 2009, 55
Proof: (i) Suppose first that there is a set of positive state prices, π :=
(π1,··· ,πm). If x ≥ 0 is the date t = 1 payoff of an attainable security, then
the price, S, of the security is given by
S =
m X
j=1
πjxj ≥ 0.
If some xj > 0 then S > 0, and if x = 0 then S = 0. Therefore there is no
arbitrage opportunity.
(ii) Suppose now that there is no arbitrage. Consider the (m + 1) × (N + 1)
matrix, A, defined by
A =






S
(0)
1 (ω1) ··· S
(N)
1 (ω1)
. . .
. . .
. . .
S
(0)
1 (ωm) ··· S
(N)
1 (ωm)
−S
(0)
0 ··· −S
(N)
0






and observe (convince yourself) that the absence of arbitrage opportunities im-
plies the non-existence of an N-vector, x, with
Ax ≥ 0 and Ax 6= 0.
In this context, the ith
component of x represents the number of units of the
ith
security that was purchased or sold at t = 0. Theorem 3 then assures us
of the existence of a strictly positive vector π that satisfies AT
π = 0. We can
normalize π so that πm+1 = 1 and we then obtain
S
(i)
0 =
m X
j=1
πjS
(i)
1 (ωj).
That is, π := (π1,··· ,πm) is a vector of positive state prices.
Theorems 2 and 4 imply the following theorem which encapsulates the principal
results for our single-period model.
Theorem 5 Assume there exists a security with strictly positive price process.
Then the absence of arbitrage, the existence of positive state prices and the
existence of an EMM, Q, are all equivalent.
Example 4 (An Arbitrage-Free Market)
The model in Example 1 is arbitrage-free since we saw in Example 2 that a
vector of positive state prices exists for this marketFall 2009, 56
Figure 4.3: One-Period, Two-State Model
Figure 4.4: Complete Market
Example 5 (A Market with Arbitrage Opportunities)
Consider the one-period, 2-state model below.
No positive state price vector exists for this model so there must be an
arbitrage opportunity.
Exercise 4 Find an arbitrage strategy, θ, in the model of Example 5.
Complete Markets ≡ Unique EMM
We now turn to the important question of completeness and we have the follow-
ing formulation that is equivalent to Definition 9. We state this as a theorem
but the proof is immediate given our original definition.
Theorem 6 Assume that there are no arbitrage opportunities. Then the market
is complete if and only if the matrix of date t = 1 payoffs, S1, has rank m.
Example 6 (An Incomplete Market)
The model of Example 1 is arbitrage-free by Theorem 4 since we saw in
Example 2 that a vector of positive state prices exists for this model. However
the model is incomplete since the rank of the payoff matrix, S1, can be at most
3 which is less than the number of possible states, 4.
Example 7 (A Complete Market)
Consider the one-period model below where there are 4 possible states of
nature and 4 securities, i.e., m = 4 and N = 3.
We can easily check that rank(S1) = 4 = m, so that this model is indeed
complete. (We can also confirm that this model is arbitrage free by Theorem
4 and noting that the state price vector of Example 4 is a (unique) state price
vector here.)
Exercise 5 Show that if a market is incomplete, then at least one elementary
security is not attainable.
Suppose now that the market is incomplete so that at least one elementary
security, say ej, is not attainable. By Theorem 4, however, we can still define aFall 2009, 57
set of positive state prices if there are no arbitrage opportunities. In particular,
we can define the state price πj > 0 even though the jth
elementary security is
not attainable. A number of interesting questions arise regarding the uniqueness
of state price and risk-neutral probability measures, and whether or not markets
are complete. The following theorem addresses these questions.
Theorem 7 Assume there exists a security with strictly positive price process
and there are no arbitrage opportunities. Then the market is complete if and
only if there exists exactly one equivalent martingale measure (or equivalently,
one vector of positive state prices).
Proof: (i) Suppose first that the market is complete. Then there exists a unique
set of positive state prices, and therefore by Theorem 2, a unique risk-neutral
probability measure.
(ii) Suppose now that there exists exactly one risk-neutral probability measure.
We will derive a contradiction by assuming that the market is not complete.
Suppose then that the random variable X = (X1,··· ,Xm) is not attainable.
This implies that there does not exist an (N +1)-vector, θ, such that S1θ = X.
Therefore, using a technique similar to that in the proof of Theorem 3, we can
show there exists a vector, h, such that hT
S1 = 0 and hT
X > 0. Let Q be some
risk-neutral probability measure4
and define Q̂ by
Q̂(ωj) = Q(ωj) + λhjS
(n)
1 (ωj),
where S
(n)
1 is the date t = 1 price of the numeraire security and λ > 0 is chosen
so that Q̂(ωj) > 0 for all j. Note Q̂ is a probability measure since hT
S1 = 0
implies
P
j hjS
(n)
1 (ωj) = 0. It is also easy to see (check) that since Q is an
equivalent probability measure, so too is Q̂ and Q 6= Q̂. Therefore we have a
contradiction and so the market must be complete.
Remark: It is easy to check that the price of X under Q is different to the price
of X under Q̂ in Theorem 7. This could not be the case if X was attainable.
Why?
## 4.0.3 Notation and Definitions for Multi-Period Models
Before extending our single-period results to multi-period models, we first need
to extend some of our single-period definitions and introduce the concept of
trading strategies and self-financing trading strategies. We will assume5
for now
4We know such a Q exists since there are no arbitrage opportunities.
5This assumption can easily be relaxed at the expense of extra book-keeping. The existence
of an equivalent martingale measure, Q, under no arbitrage assumptions will still hold as
will the results regarding market completeness. Deflated security prices will no longer beFall 2009, 58
Figure 4.5: Multi-Period Model
that none of the securities in our multi-period models pay dividends. (We will
return to the case where they do pay dividends at the end of these notes.)
As before we will assume that there are N + 1 securities, m possible states of
nature and that the true probability measure is denoted by P = (p1 ··· ,pm).
We assume that the investment horizon is [0,T] and that there are a total of
T trading periods. Securities may therefore be purchased or sold at any date
t for t = 0,1,··· ,T − 1. Figure 4.5 below shows a typical multi-period model
with T = 2 and m = 9 possible states. The manner in which information is
revealed as time elapses is clear from this model. For example, at node I4,5
1 the
available information tells us that the true state of the world is either ω4 or ω5.
In particular, no other state is possible at I4,5
1 .
Note that the multi-period model is composed of a series of single-period models.
At date t = 0 in Figure 4.5, for example, there is a single one-period model
corresponding to node I0. Similarly at date t = 1 there are three possible
one-period models corresponding to nodes I1,2,3
1 , I4,5
1 and I6,7,8,9
1 , respectively.
The particular one-period model that prevails at t = 1 will depend on the
true state of nature. Given a probability measure, P = (p1,··· ,pm), we can
easily compute the conditional probabilities of each state. In Figure 4.5, for
example, P(ω1|I1,2,3
1 ) = p1/(p1 + p2 + p3). These conditional probabilities can
be interpreted as probabilities in the corresponding single-period models. For
example, p1 = P(I1,2,3
1 |I0)P(ω1|I1,2,3
1 ). This observation (applied to risk-neutral
probabilities) will allow us to easily generalize our single-period results to multi-
period models.
Trading Strategies and Self-Financing Trading Strategies
Definition 10 A predictable stochastic process is a process whose time t
value, Xt say, is known at time t − 1 given all the information that is available
at time t − 1.
Definition 11 A trading strategy is a vector, θt = (θ
(0)
t (ω),··· ,θ
(N)
t (ω)),
of predictable stochastic processes that describes the number of units of each
security held just before trading at time t, as a function of t and ω.
For example, θ
(i)
t (ω) is the number of units of the ith
security held6
between
Q-martingales, however, if they pay dividends. Instead, deflated gains processes will be Q-
martingales where the gains process of a security at time t is the time t value of the security
plus dividends that have been paid up to time t.
6If θ
(i)
t is negative then it corresponds to the number of units sold short.Fall 2009, 59
times t−1 and t in state ω. We will sometimes write θ
(i)
t , omitting the explicit
dependence on ω. Note that θt is known at date t−1 as we insisted in Definition
11 that θt be predictable. In our financial context, ‘predictable’ means that θt
cannot depend on information that is not yet available at time t − 1.
Example 8 (Constraints Imposed by Predictability of Trading Strate-
gies)
In Figure 4.5 it must be the case that for all i = 0,··· ,N,
θ
(i)
2 (ω1) = θ
(i)
2 (ω2) = θ
(i)
2 (ω3)
θ
(i)
2 (ω4) = θ
(i)
2 (ω5)
θ
(i)
2 (ω6) = θ
(i)
2 (ω7) = θ
(i)
2 (ω8) = θ
(i)
2 (ω9).
Exercise 6 What can you say about the relationship between the θ
(i)
1 (ωj)’s for
j = 1,··· ,m?
Definition 12 The value process, Vt(θ), associated with a trading strategy,
θt, is defined by
Vt =
( PN
i=0 θ
(i)
1 S
(i)
0 , for t = 0;
PN
i=0 θ
(i)
t S
(i)
t , for t ≥ 1.
Definition 13 A self-financing trading strategy is a strategy, θt, where changes
in Vt are due entirely to trading gains or losses, rather than the addition or with-
drawal of cash funds. In particular, a self-financing strategy satisfies
Vt =
N X
i=0
θ
(i)
t+1S
(i)
t for t = 1,··· ,T − 1.
Definition 13 states that the value of a self-financing portfolio just before trading
or re-balancing is equal to the value of the portfolio just after trading, i.e., no
additional funds have been deposited or withdrawn.
Exercise 7 Show that if a trading strategy, θt, is self-financing then the corre-
sponding value process, Vt, satisfies
Vt+1 − Vt =
N X
i=0
θ
(i)
t+1

S
(i)
t+1 − S
(i)
t

for t = 1,··· ,T − 1
Clearly then changes in the value of the portfolio are due to capital gains or
losses and are not due to the injection or withdrawal of funds.
We can now extend the one-period definitions of arbitrage opportunities, at-
tainable claims and completeness.Fall 2009, 60
Arbitrage
Definition 14 We define a type A arbitrage opportunity to be a self-financing
trading strategy, θt, such that V0(θ) < 0 and VT (θ) = 0. Similarly, a type B
arbitrage opportunity is defined to be a self-financing trading strategy, θt, such
that V0(θ) = 0, VT (θ) ≥ 0 and EP
0 [VT (θ)] > 0.
Attainability and Complete Markets
Definition 15 A contingent claim, C, is a random variable whose value at
time T is known at that time given the information available then. It can be
interpreted as the time T value of a security (or, depending on the context, the
time t value if this value is known by time t < T).
Definition 16 We say that the contingent claim C is attainable if there exists
a self-financing trading strategy, θt, whose value process, VT , satisfies VT = C.
Note that the value of the claim, C, in Definition 16 must equal the initial value
of the replicating portfolio, V0, if there are no arbitrage opportunities available.
We can now extend our definition of completeness.
Definition 17 We say that the market is complete if every contingent claim
is attainable. Otherwise the market is said to be incomplete.
Note that the above definitions of attainability and (in)completeness are con-
sistent with our definitions for single-period models. With our definitions of
a numeraire security and the cash account remaining unchanged, we can now
define what we mean by an equivalent martingale measure (EMM), or set
of risk-neutral probabilities.
Equivalent Martingale Measures (EMMs)
We assume again that we have in mind a specific numeraire security with price
process, S
(n)
t .
Definition 18 An equivalent martingale measure (EMM), Q = (q1,··· ,qm),
is a set of probabilities such that
1. qi > 0 for all i = 1,··· ,m.
2. The deflated security prices are martingale. That is,
S̄
(i)
t :=
S
(i)
t
S
(n)
t
= EQ
t
"
S
(i)
t+s
S
(n)
t+s
#
=: EQ
t
h
S̄
(i)
t+s
iFall 2009, 61
for s,t ≥ 0, for all i = 1,··· ,N, and where EQ
t [·] denotes the expectation
under Q conditional on information available at time t. (We also refer to
Q as a set of risk-neutral probabilities.)
## 4.0.4 Martingale Pricing Theory: Multi-Period Models
We will now generalize the results for single-period models to multi-period mod-
els. This is easily done using our single-period results and requires very little
extra work.
Absence of Arbitrage ≡ Existence of EMM
We begin with two propositions that enable us to generalize Proposition 1.
Proposition 8 If an equivalent martingale measure, Q, exists, then the deflated
value process, Vt, of any self-financing trading strategy is a Q-martingale.
Proof: Let θt be the self-financing trading strategy and let V̄t+1 := Vt+1/S
(n)
t+1
denote the deflated value process. We then have
EQ
t [V̄t+1] = EQ
t
" N X
i=0
θ
(i)
t+1S̄
(i)
t+1
#
=
N X
i=0
θ
(i)
t+1EQ
t
h
S̄
(i)
t+1
i
=
N X
i=0
θ
(i)
t+1S̄
(i)
t
= V̄t
demonstrating that V̄t is indeed a martingale, as claimed.
Remark 4 Note that Proposition 8 implies that the deflated price of any at-
tainable security can be computed as the Q-expectation of the terminal deflated
value of the security.
Proposition 9 If an equivalent martingale measure, Q, exists, then there can
be no arbitrage opportunities.
Proof: The proof follows almost immediately from Proposition 8.
We can now now state our principal result for multi-period models, assuming
as usual that a numeraire security exists.
Theorem 10 In the multi-period model there is no arbitrage if and only if there
exists an EMM, Q.Fall 2009, 62
Proof: (i) Suppose first that there is no arbitrage as defined by Definition
14. Then we can easily argue there is no arbitrage (as defined by Definition 4)
in any of the embedded one-period models. Theorem 5 then implies hat each
of the the embedded one-period models has a set of risk-neutral probabilities.
By multiplying these probabilities as described in the paragraph immediately
following Figure 4.5, we can construct an EMM, Q, as defined by Definition 18.
(ii) Suppose there exists an EMM, Q. Then Proposition 9 gives the result.
Complete Markets Unique EMM
As was the case with single-period models, it is also true that multi-period
models are complete if and only if the EMM is unique. (We are assuming here
that there is no arbitrage so that an EMM is guaranteed to exist.)
Proposition 11 The market is complete if and only if every embedded one-
period model is complete.
Exercise 8 Prove Proposition 11.
We have the following theorem.
Theorem 12 Assume there exists a security with strictly positive price process
and that there are no arbitrage opportunities. Then the market is complete if
and only if there exists exactly one risk-neutral martingale measure, Q.
Proof: (i) Suppose the market is complete. Then by Proposition 11 every
embedded one-period model is complete so we can apply Theorem 7 to show
that the EMM, Q, (which must exist since there is no arbitrage) is unique.
(ii) Suppose now Q is unique. Then the risk-neutral probability measure corre-
sponding to each one-period model is also unique. Now apply Theorem 7 again
to obtain that the multi-period model is complete.
State Prices
As in the single-period models, we also have an equivalence between equivalent
martingale measures, Q, and sets of state prices. We will use πt+s
t (Λ) to denote
the time t price of a security that pays $1 at time t+s in the event that ω ∈ Λ.
We are implicity assuming that we can tell at time t + s whether or not ω ∈ Λ.
In Figure 4.5, for example, π
{1}
0 (ω4,ω5) is a valid expression whereas π
{1}
0 (ω4)
is not.Fall 2009, 63
Why is Absence of Arbitrage ≡ Existence of an EMM ?
Let us now develop some intuition for why the discounted price process, St
j/St
i,
should be a Q-martingale if there are no arbitrage opportunities. First, it is clear
that we should not expect a non-deflated price process to be a martingale under
the true probability measure, P. After all, if a cash account is available, then
it will always grow in value as long as the risk-free rate of interest is positive.
It cannot therefore be a P-martingale.
It makes sense then that we should compare the price processes of securities
relative to one another rather than examine them on an absolute basis. This
is why we deflate by some positive security. Even after deflating, however, it is
still not reasonable to expect deflated price processes to be P-martingales. After
all, some securities are riskier than others and since investors are generally risk
averse it makes sense that riskier securities should have higher expected rates of
return. However, if we change to an equivalent martingale measure, Q, where
probabilities are adjusted to reflect the riskiness of the various states, then we
can expect deflated price processes to be martingales under Q. The vital point
here is that each qk must be strictly positive since we have assumed that each
pk is strictly positive.
As a further aid to developing some intuition, we might consider the following
three scenarios:
Scenario 1 Imagine a multi-period model with two assets, both of whose price
processes, Xt and Yt say, are deterministic and positive. Convince yourself
that in this model it must be the case that Xt/Yt is a martingale if there
are to be no arbitrage opportunities. (A martingale in a deterministic
model must be a constant process. Moreover, in a deterministic model a
risk-neutral measure, Q, must coincide with the true probability measure,
P.)
Scenario 2 Generalize scenario 1 to a deterministic model with n assets, each
of which has a positive price process. Note that you can choose to deflate
by any process you choose. Again it should be clear that deflated security
price processes are (deterministic) martingales.
Scenario 3 Now consider a one period stochastic model that runs from date
t = 0 to date t = 1. There are only two possible outcomes at date t = 1
and we assume there are only two assets, S
(1)
t and S
(2)
t . Again, convince
yourself that if there are to be no arbitrage opportunities, then it must
be the case that there is probability measure, Q, such that S
(1)
t /S
(2)
t is a
Q-martingale. Of course we have already given a proof of this result (and
much more), but it helps intuition to look at this very simple case and see
directly why an EMM must exist if there is no arbitrage.
Once these simple cases are understood, it is no longer surprising that theFall 2009, 64
Figure 4.6: Complete Market
result (equivalence of absence of arbitrage and existence of an EMM) extends
to multiple periods, multiple assets and even continuous time. You can also see
that the numeraire asset can actually be any asset with a strictly positive price
process. Of course we commonly deflate by the cash account in practice as it is
often very convenient to do so, but it is important to note that our results hold
if we deflate by other positive price processes. We now consider some examples
that will use the various concepts and results that we have developed.
Example 9 (A Complete Market)
There are two time periods and three securities. We will use S
(i)
t (ωk) to denote
the value of the ith
security in state ωk at date t for i = 0,1,2, for k = 1,··· ,9
and for t = 0,1,2. These values are given in the tree above, so for example, the
value of the 0th
security at date t = 2 satisfies
S
(0)
2 (ωk) =



1.1235, for k = 1,2,3;
1.1025, for k = 4,5,6;
1.0815, for k = 7,8,9.
Note that the zeroth
security is equivalent to a cash account that earns money at
the risk-free interest rate. We will use Rt(ωk) to denote the gross risk-free rate
at date t, state ωk. The properties of the cash account imply that R satisfies
R0(ωk) = 1.05 for all i, and7
R1(ωk) =



1.07, for k = 1,2,3;
1.05, for k = 4,5,6;
1.03, for k = 7,8,9.
Questions
(1) Are there any arbitrage opportunities in this market?
(2) If not, is this a complete or incomplete market?
(3) Compute the state prices in this model.
(4) Compute the risk-neutral or martingale probabilities when we discount by
the cash account, i.e., the zeroth
security.
(5) Compute the risk-neutral probabilities (i.e., the martingale measure) when
we discount by the second security.
(6) Using the state prices, find the price of a call option on the the first asset
with strike k = 2 and expiration date t = 2.
(7) Confirm your answer in (6) by recomputing the option price using the mar-
tingale measure of (5).
7Of course the value of R2 is unknown and irrelevant as it would only apply to cash-flows
between t = 2 and t = 3.Fall 2009, 65
Solutions
(1) No, because there exists a set of state prices or equivalently, risk-neutral
probabilities. (Recall that by definition, risk neutral probabilities are strictly
positive.) We can confirm this by checking that in each embedded one-period
model there is a strictly positive solution to St = πtSt+1 where St is the vector
of security prices at a particular time t node and St+1 is the matrix of date
t = 1 prices at the successor nodes.
(2) Complete, because we have a unique set of state prices or equivalently a
unique equivalent martingale measure. We can check this by confirming that
each embedded one-period model has a payoff matrix of full rank.
(3) First compute (how?) the prices at date 1 of $1 to be paid in each of the
terminal states at date 2. These are the state prices at date 1, π
{2}
1 , and we find
π
{2}
1 (ω1) = 0.2, π
{2}
1 (ω2) = 0.3, π
{2}
1 (ω3) = 0.4346, at I1,2,3
1
π
{2}
1 (ω4) = 0.3, π
{2}
1 (ω5) = 0.3, π
{2}
1 (ω6) = 0.3524, at I4,5,6
1
π
{2}
1 (ω7) = 0.25, π
{2}
1 (ω8) = 0.4, π
{2}
1 (ω9) = 0.3209, at I7,8,9
1
The value at date 0 of $1 at nodes I1,2,3
1 , I4,5,6
1 and I7,8,9
1 , respectively, is given
by
π
{1}
0 (I1,2,3
1 ) = 0.3,π
{1}
0 (I4,5,6
1 ) = 0.3, and π
{1}
0 (I7,8,9
1 ) = 0.3524.
Therefore the state prices at date t are (why?)
π
{2}
0 (ω1) = 0.06, π
{2}
0 (ω2) = 0.09, π
{2}
0 (ω3) = 0.1304,
π
{2}
0 (ω4) = 0.09, π
{2}
0 (ω5) = 0.09, π
{2}
0 (ω6) = 0.1057,
π
{2}
0 (ω7) = 0.0881, π
{2}
0 (ω8) = 0.1410, π
{2}
0 (ω9) = 0.1131.
We can easily check that these state prices do indeed correctly price (subject to
rounding errors) the three securities at date t = 0.
(4) When we deflate by the cash account the risk-neutral probabilities for the
nine possible paths at time 0 may be computed using the expression
qk =
π
{2}
0 (ωk)S
(0)
2 (ωk)
P
j π
{2}
0 (ωj)S
(0)
2 (ωj)
(4.6)
We have not shown that the expression in (4.6) is in fact correct, though
note that it generalizes the one-period expression in (4.4).
Exercise 9 Check that (4.6) is indeed correct. (You may do this by deriving
it in exactly the same manner as (4.4). Alternatively, it may be derived byFall 2009, 66
using equation (4.4) to compute the risk-neutral probabilities of the embedded
one-period models and multiplying them appropriately to obtain the qk’s. Note
that the risk-neutral probabilities in the one-period models are conditional risk-
neutral probabilities of the multi-period model.)
We therefore have
q1 q2 q3 q4 q5 q6 q7 q8 q9
0.0674 0.1011 0.1465 0.0992 0.0992 0.1165 0.0953 0.1525 0.1223
(5) Similarly, when we deflate by the second asset, the risk-neutral probabilities
are given by:
q1 q2 q3 q4 q5 q6 q7 q8 q9
0.0282 0.1267 0.1224 0.1267 0.0845 0.0992 0.0414 0.2647 0.1062
(6) The payoffs of the call option and the state prices are given by:
State 1 2 3 4 5 6 7 8 9
Payoff 0 0 0 0 0 1 2 0 3
State Price 0.06 0.09 0.1304 0.09 0.09 0.1057 0.0881 0.1410 0.1131
The price of the option is therefore (why?) given by 0.1057+(2×0.0881)+(3×
0.1131) = 0.6212.
(7) Using the risk-neutral probabilities when we deflate by the second asset we
have:
State Deflated Payoff State Price
1 0 0.0282
2 0 0.1267
3 0 0.1224
4 0 0.1267
5 0 0.0845
6 1/2 0.0992
7 2/1 0.0414
8 0 0.2647
9 3/2 0.1062
The price of the option deflated by the initial price of the second asset is therefore
given by (0.0992 × 0.5) + (2 × 0.0414) + (3/2) × 0.1062 = 0.2917. And so the
option price is given by 0.2917 × 2.1303 = 0.6214, which is the same answer
(modulo rounding errors) as we obtained in (4.6).Fall 2009, 67
In Example 9 we computed the option price by working directly from the date
t = 2 payoffs to the date t = 0 price. Another method for pricing derivative
securities is to work backwards through the tree in the manner of dynamic
programming, or backwards iteration. That is we first compute the price at
the date t = 1 nodes and then use the date t = 1 price to compute the date
t = 0 price. This technique of course, is also implemented using the risk-neutral
probabilities or equivalently, the state prices.
Exercise 10 Repeat Question 6 of Example 9, this time using dynamic pro-
gramming to compute the option price.
Remark 5 While Rt was stochastic in Example 9, we still refer to it as a risk-
free interest rate. This interpretation is valid since we know for certain at date
i the date i + 1 value of $1 invested in the cash account at date i.
Example 10 (An Incomplete Market)
Consider the same tree as in Example 9 only now state ω6 is a successor
state to node I6,7,8,9
1 instead of node I4,5
1 . We have also changed the payoff of
the zeroth
asset in this state so that our interpretation of the the zeroth asset
as a cash account remains appropriate. The new tree is given below.
Questions
(1) Is this model arbitrage free?
(2) Suppose the prices of the three securities were such that there were no
arbitrage opportunities. Without bothering to compute such prices, do you
think the model would then be a complete or incomplete model?
(3) Suppose again that the security prices were such that there were no arbitrage
opportunities. Give a simple argument for why forward contracts are attainable.
(We can therefore price them in this model.)
Solutions
(1) We know the absence of arbitrage is equivalent to the existence of positive
state prices or, equivalently, risk-neutral probabilities. Moreover, if the model is
arbitrage free then so is every one-period sub-market so all we need to do is see
if we can construct positive state prices for each of the four one-period markets
represented by the nodes I1,2,3
1 , I4,5
1 , I6,7,8,9
1 and I0.
First, it is clear that the one-period market beginning at I1,2,3
1 is arbitrage-free
since this is the same as the corresponding one-period model in Example 9. ForFall 2009, 68
the subproblem beginning at I6,7,8,9
1 we can take (check)
h
π
{2}
1 (ω6) π
{2}
1 (ω7) π
{2}
1 (ω8) π
{2}
1 (ω9)
i
= [0.0737 0.191 0.3705 0.3357]
so this sub-market is also arbitrage free.
However, it is not possible to find a state price vector, [π
{2}
1 (ω4) π
{2}
1 (ω5)], for
the one-period market beginning at I4,5
1 . In particular, this implies there is
an arbitrage opportunity there and so we can conclude that the model is not
arbitrage-free.
(2) The model is incomplete as the rank of the payoff matrix in the one-period
model beginning at I6,7,8,9
1 is less than 4.
(3) This is left as an exercise. (However we will return to this issue and the pric-
ing of futures contracts in the Martingale Pricing Applied to Forwards, Futures
and Options lecture notes.)
Exercise 11 Find an arbitrage opportunity in the one-period model beginning
at node I4,5
1 in Example 10.
## 4.0.5 Dividends and Intermediate Cash-Flows
Thus far, we have assumed that none of the securities pay intermediate cash-
flows. An example of such a security is a dividend-paying stock. This is not
an issue in the single period models since any such cash-flows are captured in
the date t = 1 value of the securities. For multi-period models, however, we
sometimes need to explicitly model these intermediate cash payments. All of
the results that we have derived in these notes still go through, however, as long
as we make suitable adjustments to our price processes and are careful with
our bookkeeping. In particular, deflated cumulative gains processes rather than
deflated security prices are now Q-martingales. The cumulative gain process,
Gt, of a security at time t is equal to value of the security at time t plus
accumulated cash payments that result from holding the security.
Consider our discrete-time, discrete-space framework where a particular security
pays dividends. Then if the model is arbitrage-free there exists an EMM, Q,
such that
S̄t = EQ
t


t+s X
j=t+1
D̄j + S̄t+s


where Dj is the time j dividend that you receive if you hold one unit of the
security, and St is its time t ex-dividend price. This result is easy to derive
using our earlier results. All we have to do is view each dividend as a separateFall 2009, 69
security with St then interpreted as the price of the portfolio consisting of these
individual securities as well as a security that is worth St+s at date t + s.
The definitions of complete and incomplete markets are unchanged and the
associated results we derived earlier still hold when we also account for the
dividends in the various payoff matrices. For example, if θt is a self-financing
strategy in a model with dividends then Vt, the corresponding value process,
should satisfy
Vt+1 − Vt =
N X
i=0
θ
(i)
t+1

S
(i)
t+1 + D
(i)
t+1 − S
(i)
t

. (4.7)
Note that the time t dividends, D
(i)
t , do not appear in (4.7).
Exercise 12 Adapt the various definitions and results of earlier sections to
accommodate models with dividends. This is easy but tedious and so you might
prefer to just think about it instead of actually doing it!
## 4.0.6 Martingale Pricing in Practice When Markets Are
Incomplete
When markets are incomplete there are infinitely many EMM’s and it is nec-
essary to choose one when we wish to price a derivative security that is not
attainable. There are numerous ways that this is done in practice but they all
seem to be variations of the following algorithm.
1. A subset of EMM’s, {Q(θ) : θ ∈ Rk
}, is assumed to contain the ‘correct’
EMM, Q∗
. This class is parameterized by the k-dimensional parameter
vector, θ.
2. Liquid securities with prices available in the market are chosen as the
‘calibration’ securities.
3. The parameter vector, θ, is then chosen to make the prices of the ‘cali-
bration’ securities in our model match their observed market prices. If k
is small relative to the number of ‘calibration’ securities, then an exact
match will in general not be possible and it will be necessary to solve an
optimization problem to find the best possible fit. The optimization prob-
lem will typically be non-linear and will need to be performed numerically.
If k is large relative to the number of ‘calibration’ securities, then an exact
fit might be possible.
It is worth mentioning that there is no reference to the true data-generating
measure, P, in the above algorithm. This is no accident: it is common in practice
to go straight to the class {Q(θ) : θ ∈ Rk
} without first considering or estimating
P. This approach is not without merit as the resulting model is arbitrage-freeFall 2009, 70
and calibrated to market prices (possibly only approximately) by construction.
It does have some weaknesses, however. For example, little attention is paid to
whether or not there is an equivalent probability measure, P, that is consistent
with empirical data. It is also necessary in practice to frequently update the
estimated parameter, θ, as market prices of the ‘calibration’ securities change
through time. It is clear that this is unsatisfactory, as it implies that our model
is ‘wrong’. But unless we can find the perfect model (and this is very unlikely
as market conditions are always changing), there is little we can do about this.
## 4.0.7 Appendix A
In Example 1 we saw that [π1 π2 π3 π4]T
= [0.0737 0.1910 0.3705 0.3357]T
was
a vector of state prices for the security market of that example. In particular,
it satisfied ST
1 π = S0, that is


1.03 1.03 1.03 1.03
3.00 4.00 2.00 5.00
2.00 1.00 4.00 2.00






0.0737
0.1910
0.3705
0.3357



 =


1.0194
3.4045
2.4917


where S0 was the vector of date 0 security prices, and S1 was the matrix of date
1 security prices. How did we find such a vector π?
Consider the equation Ax = b where A is a known m×n matrix and b is a known
m×1 vector. We would like to solve this equation for the vector x. There may
be no solution, infinitely many solutions or a unique solution. If more than one
solution exists so that Ax1 = Ax2 = b with x1 6= x2 then y := x1 − x2 is an
element of the nullspace of A. That is Ay = 0. In particular, any solution to
Ax = b can be written as the sum of a particular solution, x1, and an element,
ω, of the nullspace.
How do we apply this to finding a vector positive state prices, assuming such a
vector exists. First try and find a particular solution. In Matlab, for example,
this can be done14 by using the matrix divide command “ \”:
>> x1 = S1’\S0
x1 =
0
0.3102
0.4113
0.2682
We then find the nullspace8
of S1T
by using the “null” command:
8The nullspace of a matrix is a vector space and the “null” command in Matlab will return
a basis for this vector space. Any element of the nullspace can then be written as a linearFall 2009, 71
>> w=null(S’)
w =
0.7372
-0.5898
-0.2949
0.1474
Now every possible solution to ST
1 π = S0 can be written as




π1
π2
π3
π4



 =




0
0.3102
0.4113
0.2682



+ ǫ




0.7372
−0.5898
−0.2949
0.1474




where ǫ is any real number. We just need to find an ǫ such that the solution is
strictly positive. If no such epsilon exists, then there is no state prices.
## 4.0.8 Challenge Question
A mathematically inclined fund manager has constructed a very sophisticated
trading strategy. He has spent considerable time doing this and his strategy
was computed without reference to any historical data. Now that the strategy
is complete, he wishes to test it by applying it to historical stock market data of
the past 20 years. In order to get a clean data-set, he only includes the return
data for stocks of companies that existed 20 years ago and that still exist today.
As a result he can test his strategy using a clean set of historical returns over
20 years for a fixed number of stocks. The fund manager is a little concerned,
however, that there might be problems with his data-set. What do you think?
combination of elements in the basis. In our example, the dimensionality of the nullspace is
1 and so there is only one element in the basis which we have denoted by ‘w’.Chapter 5
Martingale Pricing Applied
to Options, Forwards and
Futures
We now apply martingale pricing theory to the problems of pricing European
and American options, as well as forwards and futures contracts. We first con-
sider the problem of pricing European and American options. We will interpret
the classic binomial model in the context of martingale pricing theory and use it
to further develop our intuition. Then after using the binomial model to derive
the famous Black-Scholes formula, we will consider American options. After a
brief discussion on hedging, we then end with forwards and futures prices, and
in the process we will determine under what situations the two coincide.
## 5.0.1 Options Theory: Put-Call Parity and No-Arbitrage
Arguments
Definition 1 A European call option on a security with strike K and expi-
ration T is worth max(0,ST − K) at expiration where ST is the time T value
of the security. We will use Ct to denote the date t value of a call option.
Definition 2 A European put option on a security with strike K and expi-
ration T is worth max(0,K − ST ) at expiration. We will use Pt to denote the
date t value of a put option.
Option pricing theory refers to the methodology and theory that is used to
compute Ct and Pt, as well as the prices of other classes of options. The general
theory of arbitrage pricing is of fundamental importance in this regard. We
begin with the famous put-call parity equation that relates European call option
prices to the corresponding European put option prices.Fall 2009, 73
Theorem 1 (Put-Call Parity) The call and put options prices, Ct and Pt
respectively, satisfy
St = Ct − Pt + d(t,T)K, (5.1)
where d(t,T) is the discount factor for lending between dates t and the expiration
date of the options, T. K is the strike of both the call option and the put option,
and the security is assumed to pay no intermediate dividends.
Proof: Consider two portfolios: at date t the first portfolio is long a call option,
short a put option and invests $d(t,T)K at the risk-free rate until T. At date
t the second portfolio is long a single share of stock. It is easy to see that at
time T, the value of both portfolios is exactly equal to ST , the terminal stock
price. This means that both portfolios must have the same value at date t for
otherwise there would be an arbitrage opportunity. In particular, this implies
(5.1).
As with put-call parity, simple applications of the no-arbitrage assumption often
allow us to derive results that must hold independently of the underlying prob-
ability model. Example 1 provides some other instances of these applications.
Example 1 (Luenberger Exercise 12.4)
Consider a family of call options on a non-dividend paying stock, each option
being identical except for its strike price. The value of a call option with strike
price K is denoted by C(K). Prove the following three general relations using
arbitrage arguments.
1. K2 > K1 implies C(K1) ≥ C(K2).
2. K2 > K1 implies K2 − K1 ≥ C(K1) − C(K2).
3. K3 > K2 > K1 implies
C(K2) ≤

K3 − K2
K3 − K1

C(K1) +

K2 − K1
K3 − K1

C(K3).
Solution:
(a) is trivial and (b) is also very simple if you consider the maximum possible
difference in value at maturity of two options with strikes K1 and K2.
(c) Perhaps the easiest way to show this (and solve other problems like it)
is to construct a portfolio whose properties imply the desired inequality. For
example, if a portfolio’s value at maturity is non-negative in every possible state
of nature, then the value of the portfolio today must be also be non-negative.Fall 2009, 74
Figure 5.1: Binomial Lattice Model
Otherwise, there would be an arbitrage opportunity. What would it be? We
will use this observation to solve this question.
Construct a portfolio as follows: short one option with strike K2, go long (K3 −
K2)/(K3−K1) options with strike K1, and go long (K2−K1)/(K3−K1) options
with strike K3. Now check that the value of this portfolio is non-negative in
every possible state of nature, i.e., for every possible value of the terminal stock
price. As a result, the value of the portfolio must be non-negative today and
that gives us the desired inequality.
## 5.0.2 The Binomial Lattice Model for Security Prices
The binomial model is a discrete-time, discrete space model that describes the
price evolution of a single risky stock1
that does not pay dividends. If the stock
price at the beginning of a period is X then it will either increase to uX or
decrease to dX at the beginning of the next period. In Figure 5.1 we have set
S0 = 100, u = 1.06 and d = 1/u.
The binomial model assumes that there is also a cash account available that
earns risk-free interest at a gross rate of R per period. We assume R is constant2
and that the two securities (stock and cash account) may be purchased or sold3
short. We let Bk = Rk
denote the value at time k of $1 that was invested in
the cash account at date 0.
In order to avoid arbitrage opportunities, it must be the case (why?) that
d < R < u. (5.2)
We will always assume that (5.2) is satisfied and so we can therefore conclude
that a risk-neutral or equivalent martingale measure (EMM), Q, exists. More-
over, the binomial model is a complete model4
and so Q is unique. We will
1Binomial models may also be used to model commodity and foreign exchange prices, as
well as dividend-paying stock prices and interest rate dynamics.
2This assumption may easily be relaxed. For example, in the Martingale Pricing Theory
lecture notes, we saw the market in Example 9 was a complete market with stochastic interest
rates. We could therefore allow R to vary from node to node in the binomial model here and
still maintain market completeness.
3Short selling the cash account is equivalent to borrowing.
4The binomial model is complete since each embedded one-period model is complete. This
is true because the matrix of payoffs corresponding to each embedded one-period model has
rank 2 which is equal to the number of possible outcomes.Fall 2009, 75
usually use the cash account, Bk, as the numeraire security. The price of any
security can therefore be computed by evaluating the discounted expected pay-
off of the security using the risk-neutral probability measure, Q. Thus the time
t price of a security5
that is worth XT at time T (and does not provide any cash
flows in between) is given by
Xt = BtEQ
t

Xt
BT

=
1
RT−t
EQ
t [XT ] (5.3)
We restate one of our martingale pricing results in the specific case of the bino-
mial model:
Theorem 2 The deflated price process, Xt = Bt, is a Q-martingale.
As we stated in the Martingale Pricing Theory lecture notes, this is an ex-
tremely important result that holds in just about every model where arbitrage
opportunities are precluded.
Exercise 1 Show that the Q-probability of an up-move is q = R−d
u−d . This then
implies that the Q-probability of a down-move is 1 − q = u−R
u−d .
The binomial model is one of the workhorses of financial engineering. In addition
to being a complete model (which means we can identify a unique Q), it is also
recombining. For example, an up-move followed by a down-move leads to the
same node as a down-move followed by an up-move. This recombining feature
implies that the number of nodes in the tree grows linearly with the number
of time periods rather than exponentially. This leads to a considerable gain in
computational eciency when it comes to pricing path-independent securities.
Example 2 (Pricing a Call Option)
Compute the price of a European call option on the security of Figure 5.1
with expiration at T = 3, and strike K = 95. Assume also that R = 1.02.
Solution: First, we find q = R−d
u−d = 1.02−1.06−1
1.6−1.06−1 = 0.657 which is the Q-
probability of an up-move. If C0 denotes the date 0 price of the option then
(5.3) implies that it is given by
C0 =
1
R3
EQ
0 [CT ] =
1
R3
EQ
0 [max(0,S3 − 95)]. (5.4)
At this point, there are two possible ways in which we can proceed:
(i) Compute the Q-probabilities of the terminal nodes and then use (5.4) to
determine C0. This method does not bother to compute the intermediate prices,
Ct.
5Xt can also be the value process of a self-financing trading strategy.Fall 2009, 76
(ii) Alternatively, we can work backwards in the tree one period at a time to
find Ct at each node and at each time t. This procedure is sometimes referred
to as backwards recursion and is no more than a simple application of dynamic
programming.
Stock Price European Option Price
119.10 24.10
112.36 106.00 19.22 11.00
106.00 100.00 94.34 14.76 7.08 0.00
100.00 94.34 89.00 83.93 11.04 4.56 0.00 0.00
t=0 t=1 t=2 t=3 t=0 t=1 t=2 t=3
For example in the European Option Payoff table above, we see that 14.76 =
1
R(q(19.22) + (1 − q)(7.08)), i.e., the value of the option at any node is the
discounted expected value of the option one time period ahead. This is just
restating the Q-martingale property of discounted security price processes. We
find that the call option price at t = 0 is given by $11.04.
Example 3 (A Counter-Intuitive Result)
Consider the same option-pricing problem of Example 2 except that we now
take R = 1.04. We then obtain a European call option price of 15.64 as may
be seen from the lattices given below. Note that this price is greater than the
option price, 11.04, that we obtained in Example 2.
Stock Price European Option Price
119.10 24.10
112.36 106.00 21.01 11.00
106.00 100.00 94.34 18.19 8.76 0.00
100.00 94.34 89.00 83.93 15.64 6.98 0.00 0.00
t=0 t=1 t=2 t=3 t=0 t=1 t=2 t=3
This observation seems counterintuitive: after all, we are dealing only with
positive cash flows, the values of which have not changed, i.e., the option payoffs
upon expiration at t = 3 have not changed. On the other hand, the interest rate
that is used to discount cash flows has increased in this example and so we might
have expected the value of the option to have decreased. What has happened?
(Certainly this situation would never have occurred in a deterministic world!)
First, from a purely mechanical viewpoint we can see that the risk-neutral prob-
abilities have changed. In particular, the risk-neutral probability of an up-move,
q = (R − d)/(u − d), has increased since R has increased. This means that we
are more likely to end up in the higher-payoff states. This increased likelihoodFall 2009, 77
of higher payoffs more than offsets the cost of having a larger discount factor
and so we ultimately obtain an increase in the option value.6
This, however, is only one aspect of the explanation. It is perhaps more inter-
esting to look for an intuitive explanation as to why q should increase when R
increases. You should think about this!
Calibrating the Binomial Model and Convergence to Black-Scholes
In continuous-time models, it is often assumed that security price processes are
geometric Brownian motions. In that case we write St ∼ GBM(µ,σ) if
St+s = St exp[(µ − σ2
/2)s + σ(Bt+s − Bt)], (5.5)
where Bt is a standard Brownian motion. Note that this model has the nice
property that the gross return, Rt,t+s, in any period, [t,t + s], is independent
of returns in earlier periods. In particular, it is independent of St. This follows
by noting
Rt,t+s =
St+s
St
= e(µ−σ2
/2)s+σ(Bt+s−Bt)
,
and recalling the independent increments property of Brownian motion. It is
appealing7
that Rt,t+s is independent of St since it models real world markets
where investors care only about returns and not the absolute price level of
securities. The binomial model has similar properties since the gross return in
any period of the binomial model is either u or d, and this is independent of
what has happened in earlier periods.
Calibrating the Binomial Model
We often wish to calibrate the binomial model so that its dynamics match that
of the geometric Brownian motion in (5.5). To do this we need to choose u, d
and p, the real-world probability of an up-move, appropriately. There are many
possible ways of doing this, but one of the more common choices8
is to set
pn =
eµT/n
− dn
un − dn
(5.6)
un = exp(σ
p
T/n) (5.7)
dn = 1/un = exp(−σ
p
T/n) (5.8)
6Recall that in a recent assignment we introduced the concept of a stochastic discount
factor. Increasing R from 2% to 4% does not mean we have increased the stochastic discount
factor. In fact, since the value of the option has increased, it must be the case that the
stochastic discount factor decreased at least in some states!
7More sophisticated models will sometimes allow for return predictability where Rt,t+s is
not independent of St. Even then, it is still appropriate to model returns rather than absolute
security values.
8We write pn, un and dn to emphasize that their values depend explicitly on the number
of periods, n, for a fixed expiration, T.Fall 2009, 78
where T is the expiration date and n is the number of periods. (This cali-
bration becomes more accurate as n increases.) Note then, for example, that
E[Si+1|Si] = pnunSi +(1−pn)dnSi = Si exp(µT/n), as desired. We will choose
the gross risk-free rate per period, Rn, so that it corresponds to a continuously-
compounded rate, r, in continuous time. We therefore have
Rn = erT/n
. (5.9)
Remark 1 Recall9
that the true probability of an up-move, p, has no bearing
upon the risk-neutral probability, q, and therefore it does not directly affect how
securities are priced. From our calibration of the binomial model, we therefore
see that µ, which enters the calibration only through p, does not impact security
prices. On the other hand, u and d depend on σ which therefore does impact
security prices. This is a recurring10
theme in derivatives pricing as you will
see in Financial Engineering: Continuous-Time Asset Pricing when you study
continuous-time models.
Remark 2 We just stated that p does not directly affect how securities are
priced. This means that if p should suddenly change but S0, R, u and d re-
main unchanged, then q, and therefore derivative prices, would also remain un-
changed. This seems very counter-intuitive but an explanation is easily given.
In practice, a change in p would generally cause one or more of S0, R, u and
d to also change. This would in turn cause q, and therefore derivative prices,
to change. We could therefore say that p has an indirect effect on derivative
security prices.
Convergence of the Binomial Model to Black-Scholes
The Black-Scholes formula for the price of a call option on a non-dividend
paying security with initial price S0, strike K, time to expiration T, continuously
compounded interest rate r, and volatility parameter σ, is given by
C(S0,T) = S0N(d1) − Ke−rT
N(d2), (5.10)
where
d1 =
log(S0/K) + (r + σ2
/2)T
σ
√
T
,
d2 = d1 − σ
√
T,
and N(·) is the CDF of a standard Normal random variable.
9We saw this in the Martingale Pricing Theory lecture notes, though we do insist that
qi > 0 ⇔ pi > 0.
10While a technical explanation is beyond the scope of this course, it is related to the fact
that in continuous time diffusion models, the set of equivalent martingale measures depends
explicitly on σ and does not depend at all on µ.Fall 2009, 79
For a fixed expiration, T, we consider the sequence of binomial models, Mn, that
are parameterized by (5.6), (5.7), (5.8) and (5.9). The following steps outline
how (5.10) may be obtained by letting n → ∞ in this sequence.
Step 1: First observe that the call option price, C, in the model, Mn, is given
by
Cn =
1
Rn
n
n X
j=ηn

n
j

qj
n(1 − qn)n−j
(uj
ndn−j
n S0 − K)
= S0D

n,ηn;
qnun
Rn

−
K
Rn
n
D(n,ηn;qn), (5.11)
where qn = (Rn − dn)/(un − dn) is the risk-neutral probability of an up-move
in Mn,
D(n,ηn;qn) :=
n X
j=ηn

n
j

qj
n(1 − qn)n−j
and
ηn := int

ln(K/S0dn
n)
ln(un/dn)

+ 1,
is the minimum number of up-moves required for the call option to expire in
the money.
Step 2: Note the similarity between the Black-Scholes formula, (5.10), and
(5.11). Clearly all that is now required is to show that D(n,ηn; qnun
Rn
) and
D(n,ηn;qn) converge to the appropriate normal CDF probabilities.
Step 3: For example, D(n,ηn;qn = 1 − P(Xn < ηn) where Xn is a sum of n
independent Bernouilli random variables with parameter, qn. We can therefore
write
P(Xn < ηn) = P
Xn − nqn
p
nqn(1 − qn)
<
ηn − nqn
p
nqn(1 − qn)
!
, (5.12)
and apply the Central Limit Theorem11
to obtain the appropriate normal CDF
term in (5.10). (It will also be necessary when substituting for ηn and qn in the
right-hand-side of (5.12) to take exp(a
√
T) ≈ 1 + a
√
T + a2
T/2. Higher order
terms can be neglected as they will vanish as n → ∞.)
11We cannot apply the standard Central Limit Theorem (CLT) as the distribution of the
random variables, i.e., the Bernouilli random variables in this case, depend on n. Instead we
have to apply a version of the CLT known as Lindeberg’s CLT.Fall 2009, 80
Step 4: We can deal in a similar manner with D(n,ηn; qnun
Rn
) and obtain Cn →
C as defined by (5.10) when n → ∞.
The price of a put option, P(S0,T), in the Black-Scholes model can be obtained
either by a similar argument or by invoking put-call parity. In particular, we
have
P(S0,T) = Ke−rT
N(−d2) − S0N(−d1). (5.13)
It may also be seen that the binomial stock price process in Mn converges to a
(µ,σ) geometric Brownian motion, and in the limit satisfies St = S0e(µ−σ2
/2)t+σBt
,
where Bt is a standard Brownian motion.
## 5.0.3 American Options
An American option on a security gives the holder of the option the right to
exercise it at any date on or before the expiration date, T. An exercise strategy,
τ, is a rule specifying when the option should be exercised. Because τ can
depend on the evolution of information in the model, it is in general a random
variable. However, it should not be possible to base the decision to exercise
or not on information that is not yet available. We therefore insist that τ is a
stopping time.
Let Vt denote the date s price of an American option that expires at date T > t.
The owner of the option may exercise it any date s ∈ {t,··· ,T}. If exercised at
time s, the owner of the option then receives Ys. We assume that markets are
complete and that there are no arbitrage opportunities so there exists a unique
equivalent martingale measure, Q, relative to some numeraire security, Bt. We
want to determine an expression for Vt.
Theorem 3 (a) Let τ denote a generic stopping time and define
Zt := max
τ∈{t,···,T}
EQ
t

YτBt
Bτ

.
Then Zt/Bt is the smallest supermartingale satisfying Zt ≥ Yt for all t. More-
over τ∗
(t) := min{s ≥ t : Zs = Ys} is an optimal stopping time.
(b) The American option price, Vt, satisfies Vt = Zt for all t ∈ {0,··· ,T} and
τ∗
(0) is an optimal exercise strategy.
Proof: (a) First note that ZT /BT = YT /BT . This therefore implies
ZT−1
BT−1
= max

YT−1
BT−1
, EQ
T−1

ZT
BT

.Fall 2009, 81
More generally, we can easily see that
Zt
Bt
= max

Yt
Bt
, EQ
t

max
τ≥t+1
EQ
t+1

Yτ
Bτ

= max

Yt
Bt
, EQ
t

Zt+1
Bt+1

, (5.14)
so it is clear12
that Zt/Bt is a supermartingale. Moreover, it is clear that
Zt ≥ Yt. Now suppose that Ut/Bt is any other supermartingale satisfying
Ut ≥ Yt. Since ZT = YT it is clear that ZT ≤ UT . Moreover, by hypothesis
Ut−1 clearly satisfies
Ut−1
Bt−1
≥ max

Yt−1
Bt−1
, EQ
t−1

Ut
Bt

.
Iterating backwards from t = T it is clear that Ut ≥ Zt. Finally, it is clear that
τ∗
(t) := min{s ≥ t : Zs = Ys} is an optimal stopping time.
(b) Note that since markets are complete, we know that Yτ is attainable for
every stopping time, τ. We need to consider two situations: (i) Vt < Zt and
(ii) Vt > Zt. If (i) prevails, you should purchase the option, adopt an optimal
exercise policy and adopt a trading strategy that is equivalent to selling the
security with payoff Yτ∗(t) at time τ∗
(t). It is easy to show that this leads
to arbitrage profits. If (ii) prevails, you should sell the option and invest the
proceeds appropriately to construct an arbitrage. The details are left as an
exercise but note that you have no control over the exercise strategy that the
purchaser of the option might adopt.
We can use the result of Theorem 3 and in particular, equation (5.14), to price
American options. For example, in the binomial model we can use dynamic
programming to compute the optimal strategy. As usual, we will use the cash
account (with value Bk at date k), as the numeraire security.
Example 4 (Pricing an American Put Option)
Compute the price of an American put option on the security of Figure 5.1
with expiration at T = 3, and strike K = 95. Assume again that R = 1.02.
Solution: We know from Example 2 that q = 0.657, and we know the value of
the American option at date T = 3. We then work backwards in the tree until
we have found Ca
0 , the date t = 0 value of the American option. For example at
date t = 2 when the stock price is $89 we know that the option value is given
by
Ca
2 ($89) = max

K − 89,
1
R
[q(0.66) + (1 − q)(11.04)]

= K − 89 = 6.
12Note that a simple dynamic programming argument could also be used to derive (5.14).Fall 2009, 82
That is, the value of the option at that node is $6 and it is optimal to exercise
the option there. Continuing in this recursive manner, we find that Ca
0 = $0.77.
Stock Price American Option Price
119.10 0.00
112.36 106.00 0.00 0.00
106.00 100.00 94.34 0.07 0.22 0.66
100.00 94.34 89.00 83.93 0.77 2.16 6.00 11.04
t=0 t=1 t=2 t=3 t=0 t=1 t=2 t=3
In Example 4 we found that it was sometimes optimal to exercise the option
prior to expiration. This raises the interesting question of whether or not there
are American options for which it is never optimal to exercise them prior to
maturity. We have the following result.
Theorem 4 If interest rates are non-negative, it is never optimal to exercise an
American call option on a non-dividend paying security prior to expiration.
Proof: Using the Q-martingale property of the deflated security price process
and the non-negativity of interest rates, we have
EQ
t

(St+s/Bt+s − K/Bt+s)+

≥ EQ
t [St+s/Bt+s − K/Bt+s]
= St/Bt − KEQ
t [1/Bt+s]
≥ St/Bt − K/Bt.
Since it is also the case that (St+s/Bt+s −K/Bt+s)+
≥ 0, we therefore also have
EQ
t

(St+s/Bt+s − K/Bt+s)+

≥ (St/Bt − K/Bt)+
.
That is, (St/Bt − K/Bt)+
is a sub-martingale. Now the Optional Sampling
Theorem for sub-martingales states that if Yt is a sub-martingale and τ ≤ T
is a stopping time, then EQ
[Yτ] ≤ EQ
[YT ]. If we apply this result to (St/Bt −
K/Bt)+
and recall that the price, Ca
0 , of the American option is given by
Ca
0 = max
τ
EQ
0

(Sτ/Bτ − K/Bτ)+

,
we see that Ca
0 = EQ
0 [(ST /BT − K/BT )+
] and it is never optimal to exercise
early.
Remark 3 Note that if the security paid dividends in [0,T], then St = Bt would
not be a Q-martingale and the above proof would not go through. The result
generalizes to other types of American options where the underlying security,
St, again does not pay dividends in [0,T], and where the payoff function is
a convex function of S. The proof is similar and relies on the application of
Jensen’s Inequality.Fall 2009, 83
Figure 5.2: Cash-flows of a Non-dividend Paying Stock
Example 5
(a) Consider the binomial lattice below that describes the evolution of a non-
dividend paying stock in a 3-period world. You may assume that there is a
risk-free asset which pays a total return of R = 1.005 per period.
Making the usual assumptions, compute the price of an American call option
on the stock with strike = 110 and expiration date t = 3.
(b) Without doing any backward recursions, compute the price of a European
put option on the stock with strike = 110 and expiration date t = 3. Explain
your reasoning.
(c) Again without doing any backward recursions, compute the price of a secu-
rity that pays out $100 in every state at time t = 3 except in the state where
S3 = 119.1016, when it only pays out $50. Explain your reasoning.
(d) Compute the price of an Asian call option that expires at time t = 2
with strike k = $100. The payoff of this option at time t = 2 is given by
max(0, S1+S2
2 − k).
Solution
(a) Work backwards in the lattice to see that the call price, C, is given by
C =
1
R3
q3
9.1016 = 1.3222.
(b) American call price equals European call price so we can use put-call parity
to compute put price, P. We find that P = C−S+1/R3
K = 1.3222−100+(1/1 :
0053
) × 110 = 9.6886.
(c) This security is the same as being long a zero-coupon bond with face value
$100 and short 50/9.1016 of the call options of part (a). Therefore it’s price is
100/R3
− (50/9.1016) × 1.3222 = 91.2513.
(d) There are 4 possible paths: uu, ud, du and dd, each with risk-neutral
probabilities q2
, q(1 − q), (1 − q)q and (1 − q)2
, respectively. The paths have
payoffs 9.18, 3, 0 and 0 respectively. Hence the arbitrage free price is
1
R3
(q2
9.18 + q(1 − q)3) = 3.2771.Fall 2009, 84
## 5.0.4 Hedging and the Greeks
In the binomial model we know that we can compute the price of any derivative
security by constructing a replicating portfolio.13
Besides being important for
pricing securities, replicating portfolios are also important for hedging. For
example, suppose you have written a put option that expires at date T, and
you have received P0 for this at date 0. If you do not wish to take on the risk
associated with this position you could either purchase the same put option
or, alternatively, you could choose to synthetically purchase the put option.
Synthetically purchasing the put option refers to adopting the self-financing
trading strategy that replicates a long position in the put option. This strategy
will cost P0 initially and will have a final payoff that will exactly cancel your
short position in the put that you sold. Hence you will have eliminated all risk
associated with your original position.
In discrete-time, discrete-space models it is easy to construct the replicating
portfolio when the security in question is replicable. In continuous-time com-
plete models we can also construct replicating portfolios. We briefly describe
how to do this in the context of the Black-Scholes model when the underlying
security follows a geometric Brownian motion. First, we define the delta of an
option at time t to be
∆t =
∂Ct
∂St
,
where Ct is the price of the option at time t, and St is the price of the underlying
security at time t. ∆t measures the sensitivity of the option price to changes
in the price of the underlying security. The option may then be replicated by
adopting the following self-financing trading strategy:
1. Commit the initial value, C0, to the replicating portfolio.
2. At each time t, adjust your portfolio so that you have a position of ∆t
units in the underlying security and the remainder of your cash invested
in the risk-free asset. (Sometimes this will require borrowing rather than
investing in the risk-free asset.)
This strategy will replicate the terminal payoff of the option. In practice, how-
ever, the presence of transactions costs and other market frictions implies that it
is not possible to adjust the portfolio (i.e., re-hedge) at each instant, t. Instead
the portfolio is hedged periodically and because of this, hedging is sometimes
conducted by also matching the second derivative, Γ := ∂2
Ct/∂S2
t , of the repli-
cating portfolio with that of the option to be hedged. The second derivative is
referred to as the gamma of the option. Using ∆ and Γ to hedge is analogous
to using duration and convexity to immunize bond portfolios.
13Recall that a replicating portfolio for a derivative security is a self-financing trading strat-
egy whose terminal value is equal to the terminal value of the derivative security.Fall 2009, 85
Exercise 2 When Γ is also used to hedge, why is it necessary to include a
derivative security, other than the derivative being hedged, in the replicating
portfolio.
Other price sensitivities that are often mentioned include Θ := ∂Ct/∂t, Vega
:= ∂Ct/∂σ and ρ := ∂Ct/∂r. Interestingly, vega and ρ are defined despite
the fact that σ and r are assumed to be constant in the original Black-Scholes
framework. Collectively, delta, gamma, theta, vega14
and rho are known as the
Greeks.
While derivative securities in general cannot be replicated in incomplete models,
similar strategies that match the Greeks can be used to reduce the risk associated
with holding a particular position. This is true for both discrete and continuous
models.
## 5.0.5 Forwards and Futures
We consider a general discrete-time, discrete-space financial market. For ease
of exposition we will assume that the market is complete15
and that none of the
securities pay dividends. We will also assume that the numeraire security is the
cash account with time k value, Bk.
Computing Futures Prices
Let Fk be the date k price of a futures contract written on a particular underlying
security. We assume that the contract expires after n periods and we let Sk
denote the time k price of the security. Then we know that Fn = Sn, i.e.,
at expiration the futures price and the security price must coincide. We can
compute the futures price at t = n − 1 by recalling that anytime we enter a
futures contract, the initial value of the contract is 0. Therefore the futures
price, Fn−1, at date t = n − 1 must satisfy
0 = EQ
n−1

Fn − Fn−1
Bn

Since Bn and Fn−1 are both known at date t = n−1, we therefore have Fn−1 =
EQ
n−1[Fn]. By the same argument, we also have more generally that Fk =
EQ
k [Fk+1] for 0 ≤ k < n. We can then use the law of iterated expectations to
see that F0 = EQ
0 [Fn], implying in particular that the futures price process is a
martingale. Since Fn = Sn it is also worth observing that
14Vega is the only one that is not a Greek letter.
15We do not actually require market completeness to derive (5.15) and (5.16). Indeed, it
is only necessary that certain securities are available, i.e., replicable. Can you identify what
these securities are?Fall 2009, 86
F0 = EQ
0 [Sn]. (5.15)
Exercise 3 What property of the cash account did we use in deriving (5.15)?
(Note as a result that (5.15) only holds when Q is the EMM corresponding to
taking the cash account as numeraire.)
Exercise 4 Does (5.15) change if the underlying security pays dividends? You
can assume that Si is then the ex-dividend price of the security at time i.
Computing Forward Prices
Now let us consider the date 0 price, G0, of a forward contract for delivery of
the security at the same date, t = n. We recall that G0 is chosen in such a way
that the contract is initially worth zero. In particular, our general Martingale
Pricing Theorem implies
0 = EQ
0

Sn − G0
Bn

.
Rearranging terms and using the fact that G0 is known at date t = 0 we obtain
G0 =
EQ
0 [Sn/Bn]
EQ
0 [1/Bn]
. (5.16)
Remark 4 Note that (5.16) holds regardless of whether or not the underlying
security pays dividends or coupons (storage costs may be viewed as negative
dividends). Dividends (or other intermediate cash-flows) influence G0 through
the evaluation of EQ
0 [Sn/Bn].
Remark 5 If the underlying security does not pay dividends then we obtain
G0 = S0/EQ
0 [1/Bn]. This is consistent with the expression, S/d(0,n), that was
given in the Forwards, Futures and Swaps lecture notes. This is clear since
EQ
0 [1/Bn] is the time 0 value of $1 at time n and this, by definition, is equal to
d(0,n).
Exercise 5 If the underlying security does pay dividends (or have storage costs)
then show that the expression in (5.16) is consistent with the expression given
in the Forwards, Futures and Swaps lecture notes.
We are also in a position now to identify when forwards and futures price coin-
cide. In particular, if we compare (5.16) with (5.15) then we immediately obtain
the following result.
Theorem 5 If Bn and Sn are Q-independent, then G0 = F0. In particular, if
interest rates are deterministic, we have G0 = F0.Fall 2009, 87
Corollary 1 In the binomial model with a constant (or deterministic) gross
interest rate, R, we must have G0 = F0.
Exercise 6 In practice, interest rates are stochastic and often tend to be pos-
itively correlated with movements in the stock market. In such circumstances,
convince yourself by considering (5.15) and (5.16) that the futures price, F0,
will generally be greater than the forward price, G0.
Example 6 (Futures and American Options)
Consider the commodity price lattice below where u = 1.03 and d = 0.98. If
we assume R = 1.01 per period and there are no storage costs, then we easily
find that the risk-neutral probabilities of an up-move and down-move are given
by q = 0.6 and 1 − q = 0.4, respectively.
Commodity Price
119.41
115.93 113.61
112.55 110.30 108.09
109.27 107.09 104.95 102.85
106.09 103.97 101.89 99.85 97.85
103.00 100.94 98.92 96.94 95.00 93.10
100.00 98.00 96.04 94.12 92.24 90.39 88.58
t=0 t=1 t=2 t=3 t=4 t=5 t=6
We will use Sk to denote the commodity price at time k and assume that a
futures contract on the commodity exists and that it expires after six periods.
We wish to compute the futures price lattice and we can do this in a number of
different (though essentially equivalent) ways. The method we choose is to use
our earlier observation that any time time k, 0 ≤ k ≤ 6, the futures price, Fk
satisfies Fk = EQ
k [S6] where Q is the EMM corresponding to the cash account
as numeraire. But EQ
k [S6] = R6−k
Sk (why?) and so we have
Fk = R6−k
Sk.
For example, F0 = R6
S0 = (1.016
)100 = 106.15 and the futures prices at all
times may be computed this way. We obtain the futures price lattice below.
Futures Price
119.41
117.09 113.61
114.81 111.40 108.09
112.58 109.24 105.99 102.85
110.40 107.12 103.94 105.85 97.85
108.25 105.04 101.92 98.89 95.95 93.10
106.15 103.00 99.94 96.97 94.09 91.30 88.58
t=0 t=1 t=2 t=3 t=4 t=5 t=6Fall 2009, 88
Suppose now that we wish to find the price of an American put option with the
futures price as the underlying security. If we assume that the option expires
at the same time as the futures contract, i.e., after 6 periods, and the strike is
$105, then we obtain the price lattice below for the option. In particular, we
obtain an initial price of $2.
Price of American Put Option on Futures Price
0.00
0.00 0.00
0.00 0.00 0.00
0.13 0.34 0.85 2.15
0.50 1.05 2.15 4.15 7.15
1.12 2.09 3.70 6.11 9.05 11.90
2.00 3.37 5.38 8.03 10.91 13.70 16.42
t=0 t=1 t=2 t=3 t=4 t=5 t=6
## 5.0.6 Challenge Question
One of the most important results in financial economics is the Modigliani-
Miller-Williams theorem. One version of this theorem states that in a perfect
world, there is no need for companies to hedge their financial risks as individual
shareholders can do this themselves. In practice, however, many companies
hedge their financial risks and consider this to be a very important activity.
Presumably then, the world has some imperfections. What might some of these
imperfections be?Chapter 6
Martingale Pricing Applied
to Dynamic Portfolio
Optimization and Real
Options
We consider some further applications of martingale pricing to problems in
financial engineering. In particular, we will show how dynamic portfolio opti-
mization problems in complete markets may be solved using martingale pricing
methods. We will see, as a result, how the problems of security pricing and
portfolio optimization are very closely related. We then introduce real options
and discuss some of the issues and solution methods that arise when tackling
these problems.
## 6.0.1 Portfolio Optimization: The Martingale Method
The traditional technique for solving dynamic portfolio optimization problems is
dynamic programming (DP), or as it is known in continuous-time applications,
control theory. While DP is a very important technique, it suffers from the so-
called curse of dimensionality. That is, the computational requirements of a DP
(that needs to be solved numerically) grow exponentially in the dimensionality
of the problem. Any new techniques for solving dynamic control problems are
therefore most welcome. One such technique that applies to portfolio optimiza-
tion problems in complete markets, is the martingale method.
The idea behind this method is very simple: since markets are complete, ev-
ery contingent claim is attainable and therefore the initial price of any random
variable representing a contingent claim can be computed. Now consider a port-
folio optimization problem where, for example, we seek to maximize expectedFall 2009, 90
utility of terminal wealth, E[U(WT )]. Instead of trying to solve for the optimal
dynamic trading strategy, we simply choose the optimal (contingent claim) W∗
T
subject to a budget constraint stating that the cost of W∗
T may not exceed the
initial wealth, W0. Once W∗
T has been chosen, we then find the trading strat-
egy, θ∗
t , that replicates W∗
T . The problem of finding W∗
T is therefore a static
optimization problem that can be decomposed into two stages: find W∗
T and
then find θ∗
t . In comparison, the problem of directly finding the optimal trading
strategy is a dynamic problem and in general more difficult to solve. Consider
the following example.
Example 1 (Portfolio Optimization: Power Utility)
Consider the complete market model of Example 9 in the Martingale Pricing
Theory lecture notes. The evolution of information is represented in the tree
below and the prices of each of the three securities are given at each node.
Let pi denote the true probability that the terminal state will be ωi and let
π
{2}
0 (i) := π
{2}
0 (ωi) represent1
the ith
state price as described earlier in the
Martingale Pricing Theory lecture notes. Suppose now that you wish to solve
the following portfolio optimization problem where we wish to maximize the
expected utility of terminal wealth:
max
WT
E[U(WT )] subject to
9 X
i=1
π
{2}
0 (i)WT,i = W0.
Instead of using dynamic programming, we will solve the problem using the
martingale method.
Note that because there are nine possible states, the problem amounts to choos-
ing WT := (WT,1,··· ,WT,9) where WT,i := WT (ωi). If we have a power utility
function, i.e., U(WT ) = W1−γ
T /(1 − γ) for γ > 0, then the problem may be
expressed as
max
WT,i
9 X
i=1
pi
W1−γ
T,i
1 − γ
subject to
9 X
i=1
π
{2}
0 (i)WT,i = W0. (6.1)
This is a static optimization problem and may be solved by using a single
Lagrange multiplier, λ, for the budget constraint.
The first order conditions are
piW−γ
T,i − λπ
{2}
0 (i) = 0, for i = 1,··· ,9.
1That is, π
{2}
0 (i) is the date 0 price of a security that pays $1 at date 2 if and only if the
true state is ωi.Fall 2009, 91
(6.2)
In particular, this implies
WT,i =
λπ
{2}
0 (i)
pi
!−1/γ
, (6.3)
and we can now use the budget constraint to compute
λ∗−1/γ
=
W0
P9
i=1 π
{2}
0 (i)(γ−1)/γp
1/γ
i
. (6.4)
We can now substitute (6.4) into (6.3) to obtain the optimal wealth, W∗
T . We
can also obtain that the optimal objective function is given by
E[U(W∗
T )] = E
"
W1−γ
T
1 − γ
#
=
W1−γ
0
1 − γ
E

Π
{2}
0
(γ−1)/γ
γ
, (6.5)
where Π
{2}
0 is the state-price density (SPD) or pricing kernel. The SPD is
simply the vector of state prices divided by the true probability of each state,
i.e., Π
{2}
0 (ωk) = π
{2}
0 (k)/pk.
The final stage of the solution is to find the trading strategy that replicates W∗
T .
This is straightforward and is done by working backwards in time, starting from
date t = 2.
Remarks
1. The martingale technique can be applied to a broad range of complete-
market problems in both discrete- and continuous-time models. For ex-
ample, it is easy to handle the case where utility is obtained in each period
t by consuming some of the wealth, Wt.
2. Note that the method will not work if the market is incomplete. This
is because we do not have a unique set of state prices and so we do not
know how to price all the possible contingent claims, WT . In particular,
it is not the case that every possible WT is attainable. It is also worth
remarking at this point that trading constraints, e.g., no-borrowing or no
short-selling, can also render a market incomplete.
3. In recent years, however, there has been a considerable amount of re-
search directed at extending the martingale method to incomplete market
problems. This effort has been quite successful and a number of related
methods have been developed. One such method, for example, uses dual-
ity theory to identify an optimal set of state prices that should be used.Fall 2009, 92
Figure 6.1: Dynamic Optimization
4. At the beginning of the course we mentioned that the problems of security
pricing and portfolio optimization are intimately related. We now see why
this is the case as both problems rely on the availability of state prices, or
equivalently, martingale probabilities.
## 6.0.2 The Dynamic Programming (DP) Approach to our
Portfolio Optimization Problem
We could also attempt to solve portfolio optimization problems using dynamic
programming. Assume again that we wish to maximize the expected utility of
terminal wealth, E[u(WT)]. We write Vt(W,I) for the value function at time t
when the current wealth is W and we are at node I in the tree. For example, in
the notation of Example 1 we therefore want to find V := V0(W0,I0). If there
are N periods, Rj is the vector of gross returns on the securities between dates
j and j + 1, and θj is the corresponding vector of portfolio weights, then our
DP algorithm is:
set VN(W,I) := u(W) for all W and terminal nodes, I
for j = N − 1 down to 0
Solve for all W and date j nodes, I:
Vj(W,I) := maxθj Ej[Vj+1(WθT
j Rj, succ(I))]
set V := V0(W0,I0)
where succ(I) in the above algorithm refers to the time j+1 node that succeeds
the time j node, I.
Remark 1 The difficulty with using DP in general is that it is typically the
case that the maximization problem in the above algorithm cannot be solved
explicitly. The DP problem then needs to be solved numerically, thereby limiting
the size of problems that can be practically solved. Note also that when using
the DP approach we need to find the date t value function, Vt(·,·), for all possible
values of W. The martingale method did not need to do this, requiring only a
single optimization problem for a single wealth value, W0.
It so happens that for the case of power utility (as in Example 1) it may be shown
that the maximization problem in the DP algorithm has the same2
solution, θ∗
j ,
regardless of the value of W. That is, the optimal trading strategy is wealth
independent. The DP approach in this case therefore turns out to be more
2This only holds when the problem is formulated so that θ represents the vector of port-
folio weights, that is, the fractions of wealth that are invested in the securities. (With this
interpretation, it is clear that the portfolio weights must sum to one.)Fall 2009, 93
straightforward than usual, but it is still more difficult to implement that the
martingale approach.
Exercise 1 Show that the optimal θ∗
j in Example 1 is wealth independent.
The State-Price-Density Process
We have seen how the concept of state prices are important for financial engi-
neering problems. As we mentioned in Example 1, we can equivalently work
with the state price density, Π, where Π(ω) is defined to be π(ω)/p(ω), i.e., the
state price divided by the probability of the state.
As time elapses in dynamic models, it is clear that the probabilities of the various
states and their state prices should adapt to the new information that arises.
Just as security prices vary stochastically, so too do the state prices and state
probabilities. In particular, just as security prices are stochastic processes, so
too is the state price density a stochastic process. We refer to it simply as the
SPD process.
Example 2 (The SPD Process)
Recall Example 9 in the Martingale Pricing Theory lecture notes where we com-
puted the date t = 0 state prices, π
{2}
0 (ωi) for i = 1,··· ,9. We also computed,
for example, the state prices, π
{2}
0 (ωi) and found that
π
{2}
0 (ω1) = 0.2, π
{2}
0 (ω2) = 0.3, and π
{2}
0 (ω3) = 0.4346 at node I1,2,3
1 .
What we didn’t say (but was implicitly understood) was that π
{2}
0 (ωi) = 0 at
node I1,2,3
1 for 4 ≤ i ≤ 9. In other words, we have seen how the values of
the nine state prices depend on the date and the particular node at which we
find ourselves. That is, the state prices, and therefore the SPD, constitute a
stochastic process.
## 6.0.3 Introduction to Real Options
The term “real options” is often used to describe investment situations involving
non-financial (i.e., real) assets together with some degree of optionality. For
example, an industrialist who owns a factory with excess capacity has an option
to increase production that she may exercise at any time. This option might
be of particular value when demand for the factory’s output increases. The
owner of an oilfield has an option to drill for oil that he may exercise at any
time. In fact since he can drill for oil in each time period he actually holds an
entire series of options. On the other hand if he only holds a lease on the oilfield
that expires on a specified date, then he holds only a finite number of drilling
options. For a final example, consider a company that is considering investing
in a new technology. Taken in isolation, this investment may have a negativeFall 2009, 94
NPV so that it does not appear to be worth pursuing. However, it may be the
case that investing in this new technology affords the company the option to
develop more advanced and profitable technology at a later date. As a result,
the investment might ultimately be a positive NPV value project that is indeed
worth pursuing.
In this section we describe some of the main ideas and issues that arise in the
context of real options problems. It is perhaps unfortunate that the term “real
options” has become such a ’buzzword’ in recent years, as this has helped fuel
the exaggerated claims that are often made by ’practitioners’ on its behalf. For
example, proponents often claim3
that the NPV investment criterion is flawed
as it does not take optionality into account. This claim makes little sense,
however, as there is no reason why a good NPV analysis would not account for
optionality. A more accurate term than “real options” might be “investment
under uncertainty” but this is not quite glamorous enough so its usage4
appears
to be confined to the academic literature in finance and economics.
The above criticisms notwithstanding, it is worth stating that real options prob-
lems arise in many important contexts, and that economics and financial engi-
neering provide useful guidance towards solving these problems. The principal
characteristics shared by real options5
problems are:
1. They involve non-financial assets, e.g., factory capacity, oil leases, com-
modities, technology from R&D etc. It is often the case, however, that
financial variables such as foreign exchange rates, interest rates, market
indices are also present in the problem formulation.
2. The natural framework for these problems is one of incomplete markets
as the stochastic processes driving the non-financial variables will not be
spanned6
by the financial assets. For example, it is not possible to con-
struct a self-financing trading strategy in the financial markets that repli-
cates a payoff whose value depends on whether or not there is oil in a
particular oilfield, or whether or not a particular manufacturing product
will be popular with consumers. Because of the market incompleteness,
we do not have a unique EMM that we can use to evaluate the investment
opportunities. We therefore use (financial) economics theory to guide us
in choosing a good EMM (or indeed a good set of EMM’s) that we should
work with. It is worth remarking again that choosing an EMM is equiva-
lent to choosing a (stochastic) discount factor. We can therefore see that
3Some knowledgeable practitioners also make this claim, choosing to interpret the phrase
‘NPV analysis’ as ‘naive NPV analysis’ that does not take optionality into account. I can see
no justification for this!
4Indeed, the standard academic reference for real options is Investment Under Uncertainty
by Dixit and Pindyck, a PhD level economics text.
5We will persevere with the term “real options”.
6That is, a security that depends at least in part on such a stochastic process will not be
attainable using a self-financing trading strategy in the financial market.Fall 2009, 95
the problem of choosing an EMM may be formulated in the traditional
economics and corporate finance context as a problem of finding the cor-
rect way to discount cash-flows.
3. There are usually options available to the decision-maker. More generally,
real options problems are usually control problems where the decision-
maker can (partially) control some of the quantities under consideration.
Moreover, it is often inconvenient or unnecessary7
to explicitly identify
all of the ’options’ that are available. For example, in Example 3 below,
the owner of the lease has an option each year to mine for gold but in
valuing the lease we don’t explicitly consider these options and evaluate
them separately.
Our first example of a real options problem concerns valuing a lease on a gold
and an option to increase the rate at which gold can be extracted.
Example 3 (Luenberger’s Simplico Gold Mine)
Gold Price Lattice
2476.7
2063.9 1857.5
1719.9 1547.9 1393.1
1433.3 1289.9 1161.0 1044.9
1194.4 1075.0 967.5 870.7 783.6
995.3 895.8 806.2 725.6 653.0 587.7
829.4 746.5 671.8 604.7 544.2 489.8 440.8
691.2 622.1 559.9 503.9 453.5 408.1 367.3 330.6
576.0 518.4 466.6 419.9 377.9 340.1 306.1 275.5 247.9
480.0 432.0 388.8 349.9 314.9 283.4 255.1 229.6 206.6 186.0
400 360.0 324.0 291.6 262.4 236.2 212.6 191.3 172.2 155.0 139.5
Date 0 1 2 3 4 5 6 7 8 9 10
Gold can be extracted from the simplico gold mine at a rate of up to 10,000
ounces per year at a cost of $200 per ounce. The current market price of gold
is $400 and it fluctuates randomly in such a way that it increases each year
by a factor of 1.2 with probability 0.75 or it decreases by a factor of 0.9 with
probability 0.25, i.e., gold price fluctuations are described by a binomial model
with each period corresponding to 1 year. Interest rates are flat at 10% per
year. We want to compute the price of a lease on the gold mine that expires
after 10 years. It is assumed that any gold that is extracted in a given year is
sold at the end of the year at the price that prevailed at the beginning of the
year. The gold price lattice is given8
above.
The risk-neutral probabilities are found to be q = 2/3 and 1 − q = 1/3. The
7This is another reason why there has been too much ‘hype’ surrounding the term “real
options”.
8It is easy to create more general recombining lattices for the gold price fluctuations if
necessary. For example, if it was felt to be extremely unlikely that the price of gold would
ever go above $2,000, then we could force the binomial lattice to respect this by only allowing
very small up-moves when the gold price got suciently high. We could also use multinomial
trees if appropriate. (Similar remarks apply to most of the examples in this course that use
the binomial model.)Fall 2009, 96
price of the lease is then computed by working backwards in the lattice below.
Because the lease expires worthless the node values at t = 10 are all zero.
The value 16.9 on the uppermost node at t = 9, for example, is obtained by
discounting the profits earned at t = 10 back to the beginning of the year. We
therefore obtain 16.94 = 10,000(2063.9 − 200)/1.1. The value at a node in any
earlier year is obtained by discounting the the value of the lease and the profit
obtained at the end of the year back to the beginning of the year and adding
the two quantities together. For example, in year 6 the central node has a value
of 12.6 million and this is obtained as
12,000,000 =
10,000(503.9 − 200)
1.1
+
q × 11,500,000 + (1 − q) × 7,400,000
1.1
.
Note that in any year when the price of gold is less than $200, it is optimal to
extract no gold and so no profits are recorded for that year. We find the value
of the lease at t = 0 is 24.1 million.
Lease Value (in millions)
0.0
16.9 0.0
27.8 12.3 0.0
34.1 20.0 8.7 0.0
37.1 24.3 14.1 6.1 0.0
37.7 26.2 17.0 9.7 4.1 0.0
36.5 26.4 18.1 11.5 6.4 2.6 0.0
34.2 25.2 17.9 12.0 7.4 3.9 1.5 0.0
31.2 23.3 16.7 11.5 7.4 4.3 2.1 0.7 0.0
27.8 20.7 15.0 10.4 6.7 4.0 2.0 0.7 0.1 0.0
24.1 17.9 12.9 8.8 5.6 3.2 1.4 0.4 0.0 0.0 0.0
Date 0 1 2 3 4 5 6 7 8 9 10
Suppose now that it is possible to enhance the extraction rate to 12,500 ounces
per year by purchasing new equipment that costs $4 million. Once the new
equipment is in place then it remains in place for all future years. Moreover the
extraction cost would also increase to $240 per year with the enhancement in
place and at the end of the lease the new equipment becomes the property of
the original owner of the mine. The owner of the lease therefore has an option
to install the new equipment at any time and we wish to determine the value of
this option. To do this, we first compute the value of the lease assuming that the
new equipment is in place at t = 0. This is done in exactly the same manner as
before and the values at each node and period are given in the following lattice:
Lease Value Assuming Enhancement in Place (in millions)
0.0
20.7 0.0
33.9 14.9 0.0
41.4 24.1 10.5 0.0
44.8 29.2 16.8 7.2 0.0
45.2 31.2 20.0 11.3 4.7 0.0
43.5 31.0 21.0 13.2 7.2 2.8 0.0
40.4 29.3 20.4 13.4 8.0 4.1 1.4 0.0
36.4 26.6 18.7 12.5 7.7 4.1 1.8 0.4 0.0
31.8 23.3 16.3 10.8 6.5 3.4 1.3 0.2 0.0 0.0
27.0 19.5 13.5 8.6 4.9 2.3 0.8 0.1 0.0 0.0 0.0
Date 0 1 2 3 4 5 6 7 8 9 10
We see that the value of the lease at t = 0 assuming that the new equipment is in
place (the $4 million cost of the new equipment has not been subtracted) is $27Fall 2009, 97
million. We now value the option to install the new equipment as follows. We
construct yet another lattice (shown below) that, starting at t = 10, assumes the
new equipment is not in place, i.e., we begin by assuming the original equipment
and parameters apply. We work backwards in the lattice, computing the value
of the lease at each node as before but now with one added complication: after
computing the value of the lease at a node we compare this value, A say, to the
value, B say, at the corresponding node in the lattice where the enhancement
was assumed to be in place. If B − $4million ≥ A then it is optimal to install
the equipment at this node, if it has not already been installed. We also place
max(B−$4m, A) at the node in our new lattice. We continue working backwards
in this manner, determining at each node whether or not the new equipment
should be installed if it hasn’t been installed already. The new lattice is displayed
below.
Lease Value Assuming Enhancement in Place (in millions)
0.0
16.9 0.0
29.9* 12.3 0.0
37.4* 20.1* 8.7 0.0
40.8* 25.2* 14.1 6.1 0.0
41.2* 27.2* 17.0 9.7 4.1 0.0
39.5* 27.0* 18.1 11.5 6.4 2.6 0.0
36.4* 25.6 17.9 12.0 7.4 3.9 1.5 0.0
32.6 23.5 16.7 11.5 7.4 4.3 2.1 0.7 0.0
28.6 20.9 15.0 10.4 6.7 4.0 2.0 0.7 0.1 0.0
24.6 18.0 12.9 8.8 5.6 3.2 1.4 0.4 0.0 0.0 0.0
Date 0 1 2 3 4 5 6 7 8 9 10
We see that the value of the lease with the option is $24.6 million, slightly greater
than the value of the lease without the option. Entries in the lattice marked
with a ’*’ denote nodes where it is optimal to install the new equipment. (Note
that the values at these nodes are the same as the values at the corresponding
nodes in the preceding lattice less $4 million.)
Example 3 is an interesting real options problem as there is no non-financial
noise in the problem, implying in particular that the market is complete. As
mentioned earlier, most real options problems have non-financial noise and
therefore require an incomplete markets treatment. Example 3 could easily be
generalized in this direction by introducing uncertainty regarding the amount
of gold that can be extracted or by introducing stochastic storage or extrac-
tion costs for the gold. Note that for these generalizations the financial part of
the problem, i.e., the binomial lattice for gold prices, would still be complete
and so we would still have unique risk-neutral (i.e., EMM) probabilities for the
up-moves and down-moves in the price of gold. (We would have to use other eco-
nomic considerations to help us determine9
the risk-neutral dynamics of storage
and extraction costs etc.) When there is non-financial noise and the problem is
therefore incomplete, it is often a good modeling technique to assume that the
financial market in your model is ’complete’, i.e., it is financially complete. In
this context, financial completeness now means that any random variable, i.e.,
9Note that a storage cost process or extraction rate process is not a financial asset and so
martingale pricing theory does not imply that these processes should be martingales under
an EMM.Fall 2009, 98
contingent claim, that depends only on financial noise can indeed be replicated
by a self-financing trading strategy in the financial assets.
Exercise 2 Compute the value of the enhancement option of Example 3 when
the enhancement costs $5 million but raises the mine capability by 40% to 14,000
ounces at an operating cost of $240 per ounce. Moreover, due to technological
considerations, you should assume that the enhancement (should it be required)
will not be available until the beginning of the 5th
year.
The Problem Context Guides the Solution Technique
In Example 3 the market was complete and so there was only one valuation
technique available, i.e., martingale pricing using the unique equivalent martin-
gale measure. When markets are incomplete there are many10
pricing methods
available. They include:
Zero-Level Pricing: Zero-level pricing is based on utility maximization for
portfolio optimization problems. It is that security11
price that leaves
the decision-maker indifferent between purchasing and not purchasing an
infinitesimal amount of the security.
Utility Indifference Pricing: If the decision-maker is risk-averse and has a
utility function then the problem may be recast as a portfolio optimization
problem where the price of the real option is taken to be that price that
leaves the agent indifferent between purchasing and not purchasing the
entire project. This method might be suitable for a risk averse decision
maker considering a project that could only be undertaken at the zero-level
or in its entirety.
Super-Replication and Quadratic Hedging: These pricing methods are based
on hedging cash-flows and are therefore not particularly suited to real op-
tions problems where hedging is usually not the primary focus. In fact
these methods are more theoretical in nature and are often of more inter-
est to the mathematical finance community. In particular, they are not
suitable for the more complex real options problems that often arise in
practice.
‘Good-Deal Bounds’: This is a heuristic method based on the observation
that expected returns on any security should be neither too ‘high’ nor too
‘low’. The method simultaneously considers many plausible EMMs and
constructs an interval of plausible prices for the real option.
Projection Methods: These methods work by projecting the real option’s
cash flows onto the space spanned by the financial assets. An EMM that
10Actually there are infinitely many EMM’s available when markets are incomplete.
11Equilibrium models generally use zero-level pricing to price derivative securities in incom-
plete models when these derivatives are assumed to be in zero net supply in the economy.Fall 2009, 99
prices this projection correctly is then used with the remaining part of the
cash-flow priced using the true probability distribution and discounting
with the cash account.
In general, these methods may be interpreted as selecting a particular EMM
for pricing the cash-flow in question, and so they are consistent with martingale
pricing theory. The ‘good-deal bounds’ method might also be interpreted as a
robust pricing method as it (effectively) considers many plausible EMMs and
constructs an interval of plausible prices.
Zero-Level Pricing with Private Uncertainty
We say that a source of uncertainty is private if it is independent of the financial
markets and is specific to the problem at hand. For example, the success of an
R&D project, the quantity of oil in an oilfield, the reliability of a vital piece
of manufacturing equipment or the successful launch of a new product are all
possible sources of private uncertainty. More generally, while the incidence of
natural disasters or political upheavals would not constitute sources of private
uncertainty, it would be very difficult,12
if not impossible, to adequately hedge
against these events using the financial markets. As a result, they could often
be treated as if they did constitute private sources of uncertainty.
Economic considerations suggest that if we want to use zero-level pricing to
compute real option prices when there is only private uncertainty involved, then
we should use the true13
probability distribution to do so and discount by the
risk-free interest rate. A CAPM-based argument can provide some intuition for
this observation. In particular, the CAPM states
E[r0] = rf + β0(E(rm) − rf),
where β0 := Cov(rm,r0)/Var(rm) and rm is the return on the market portfolio.
Therefore, if r0 is the return on an investment that is only exposed to private
uncertainty so that Cov(rm,r0) = 0, the CAPM implies E[r0] = rf. This implies
the value, P0, of the investment in a CAPM world is given by
P0 =
E[P1]
1 + rf
,
where P1 is the terminal payoff of the investment. This and other similar argu-
ments have been used to motivate the practice of using risk-neutral probabilities
to price the ‘financial uncertainty’ of an investment and the true probabilities
12As markets become ever more sophisticated, however, it should become increasingly pos-
sible to hedge, at least partly, against some of these events. For example, the introduction
of catastrophe bonds and the expanding use of financial technology in the insurance industry
suggest that we will be able to hedge against ever more sources of uncertainty in the future.
13If there is only private uncertainty, then it can be shown that the financial markets are
irrelevant when we use zero-level pricing.Fall 2009, 100
to price the ‘non-financial uncertainty’ of the investment. Note that this prac-
tice is consistent with martingale pricing as the use of risk-neutral probabilities
ensures that deflated (financial) security prices are martingales. In particular,
this methodology ensures that there are no arbitrage opportunities available if
trading in the financial markets is also permitted as part of the problem formu-
lation.
Remark 2 This practice (of using the true probability distribution to price
private uncertainty) is much easier to justify if we can disentangle the financial
uncertainty from the non-financial uncertainty. For example consider a one
period model where at t = 1 you will have X barrels of oil that you can sell in
the spot oil markets for $P per barrel. You therefore will earn $XP at t = 1. If
X is a random variable that is only revealed to you at t = 1, then it is impossible
to fully hedge your oil exposure by trading at t = 0 as you do not know then
how much oil you will have at t = 1. On the other hand if X is revealed to
you at t = 0 then you can fully hedge at t = 0 your resulting oil exposure
using the spot oil market. Only non-financial uncertainty then remains and so
the situation is similar to that in our CAPM argument above. The reasons
for using the true probabilities to price the non-financial uncertainty (X in our
example) is therefore more persuasive here. In the former case where X is not
revealed until t = 1, the financial uncertainty cannot be perfectly hedged and
the economic argument for using the true probabilities to price the non-financial
uncertainty is not as powerful.
Example 4 (A Foreign Venture)
A particular investment gives you the rights to the monthly profits of a foreign
venture for a fixed period of time. The first payment will be made one month
from now and the final payment will be in 5 months time after which the in-
vestment will be worthless. The monthly payments are denominated in Euro,
and are IID random variables with expectation µ. They are also independent
of returns in both the domestic and foreign financial markets. You would like
to determine the value of the investment.
Let us first assume that the domestic (i.e., US) interest rate is 5% per annum,
compounded monthly. This implies a gross rate of 1.0042 per month. Similarly,
the annual interest rate in the Euro zone (i.e., the foreign interest rate) is
assumed to be 10%, again compounded monthly. This implies a per month
gross interest rate of 1.0083. We can construct a binomial lattice for the $/Euro
exchange rate process if we view the foreign currency, i.e., the Euro, as an asset
that pays dividends, i.e., interest, each period. Martingale pricing in a binomial
model for the exchange rate with up- and down-factors, u and d respectively,
implies that
X0 = EQ
0
"
X1(1 + r
(f)
0 )
1 + r
(d)
0
#
(6.6)Fall 2009, 101
where Xi is the $/Euro exchange rate at time i, and r
(d)
i and r
(f)
i are the
domestic and foreign interest rates, respectively, for the period [i,i+1]. Solving
(6.6) for the risk-neutral probabilities q and 1 − q, we see that
q =
Rp − d
u − d
, (6.7)
where Rp := (1+r
(d)
0 )/(1+r
(f)
0 ). This of course is our usual expression for q in
the binomial model, except that we now have a new pseudo-interest rate, Rp.
The binomial lattice is given below with X0 = 1.20, u = 1.05 and d = 1/u.
Dollar/Euro Exchange Rate
1.53
1.46 1.39
1.39 1.32 1.26
1.32 1.26 1.20 1.14
1.26 1.20 1.14 1.09 1.04
1.20 1.14 1.09 1.04 0.99 0.94
t=0 t=1 t=2 t=3 t=4 t=5
Valuing the investment using zero-level pricing (and using the the true proba-
bility measure, P, for the non-financial uncertainty) is now straightforward. At
each time-t node in the lattice we assume there is a cash-flow of $µXt. These
cash-flows are valued as usual by backwards iteration using the risk-neutral
probabilities computed in (6.7).
Exercise 3 If the monthly cash-flows and the foreign financial market were
dependent, how would you go about valuing the security? What assumptions
would you need to make?
Real Options in Practice
In practice, real options problems are often too complex to be solved exactly,
either analytically or numerically. There are many reasons for this:
1. High dimensionality due to the presence of many state variables, control
variables and / or sources of uncertainty.
2. Complexity of real world constraints. For example, in Example 3 we
assumed that the mine operator could choose not to extract gold when
prices were unfavorable. However, political considerations might not allow
such action to be taken as it would presumably result in the unemployment
of most people associated with operating the mine.
3. Data uncertainty. Every model is limited by the quality of the data and
in particular, the quality of parameter estimates. Real options problems
are no different in this regard.Fall 2009, 102
4. Game theoretic considerations. Sometimes it might be necessary take the
actions of competitors into account but this only complicates the analysis
further.
Because of these complications, it often makes more sense to seek good approx-
imate solutions to real options problems. There is a tradeoff between model
complexity and tractability and finding the right balance between the two is
more of an art than a science. While there has not been a lot of (academic) work
done in this area, techniques such as simulation and approximate dynamic pro-
gramming methods should prove useful. Moreover, if the solution technique is
utility independent, e.g., zero-level pricing, then economic considerations should
be used to guide the choice of the EMM or equivalently, the stochastic discount
factor. More generally, by considering several ‘plausible’ EMMs it should be
possible to construct an interval of plausible valuations. Such an interval might
be more than adequate in many contexts.
Deterministic Discount Factors
In practice, however, corporations often (incorrectly) use a single determinis-
tic discount factor to value cash-flows. While the corporate finance literature
has long recognized that this is not appropriate, whether or not the resulting
valuations are significantly skewed will depend on the problem in question.
In order to (re)emphasize the necessity of using a stochastic discount factor,
consider the Black-Scholes framework where the stock-price follows a geometric
Brownian motion and there is a constant interest rate, r. In this model the
stock price at time T is given by
ST = S0e(µ−σ2
/2)T+σBT
,
where BT is the time T value of a standard Brownian motion. Note that the only
deterministic discount factor that correctly prices the stock is d = exp(−µT).
However using this discount factor to price options on the stock is incorrect and
will produce arbitrage opportunities! In fact the only way to price all securities
depending on the underlying Brownian motion correctly is to use a stochastic
discount factor14
or equivalently, an equivalent martingale measure. You can
easily check that the same comments apply to pricing in the discrete-time models
we have considered in this course. That said, if a particular payoff is very similar
to ST then using the deterministic discount factor, d = exp(−µT), to price the
payoff should lead to a reasonably accurate result.
## 6.0.4 Challenge Question
Consider a broker who accepts bets on the possible outcomes of sports events.
The broker is smart, successful and owns his own business. Suppose now that
14In fact the early research into option pricing was focussed on identifying the correct
discount factor.Fall 2009, 103
the broker quotes odds for a certain big sporting event that involves a very
popular local team. The team will either win or lose and a tie is not possible.
The broker has decided to quote fair odds so that the probabilities for winning
and losing implied by his odds sum exactly to one. Given this information, do
you think it is reasonable to expect that the quoted odds reflect the brokers
true view regarding the probabilities of the local team winning and losing?
While interesting in its own right, this question also has implications for financial
markets.