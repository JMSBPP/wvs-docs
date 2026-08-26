---
sha256: a5a7b8c77ba6dc7c4fabcbe1d5807ce3129886340d1580bead32283d93f47ccf
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 141102
---
DEFI’S CONCENTRATED LIQUIDITY FROM SCRATCH
REVIEW
Mark B. Richardson∗
Bancor Protocol
Zug, Switzerland
mark@bancor.network
Stefan Loesch
Topaze Blue
London, United Kingdom
stefan@topaze.blue
Edited: August 25, 2024
Original: July 4, 2024
ABSTRACT
The scope of this article includes the three preeminent descriptions of concentrated liquidity from
Bancor (2020 and 2022), and Uniswap (2021), as well as three additional descriptions informed by
trigonometric analysis of the same. The purpose of this contribution is to organize the seminal and
derivative forms of this cornerstone DeFi technology, and algebraically and geometrically elaborate
these descriptions to achieve an authoritative and near-exhaustive overview of the underlying theory
powering the current state-of-the-art in decentralized exchange infrastructure.
This material was created for the Token Engineering Academy Study Season 2024,2
a cohort-based
online program scheduled for April–July 2024. The Study Season offers access to a bachelor-level
online learning program, and complementary live tracks with the most influential practitioners and
researchers in the sector – all provided as free, public goods.
Keywords Bonding Curve · Concentrated Liquidity · Automatic Market Maker · Decentralized Exchange · Blockchain ·
Smart Contracts · Bancor · Uniswap · Carbon DeFi
∗
To whom correspondence should be addressed.
2
tokenengineering.net
arXiv:2407.02496v2 [q-fin.MF] 25 Aug 2024DeFi’s Concentrated Liquidity From Scratch REVIEW
Contents
## 1 Introduction 3
## 2 The Basics: Elementary Analysis of the Reference Curve 3
## 3 The Seminal Concentrated Liquidity Invariant 9
## 3.1 The Bancor v2 Virtual Curve . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 9
## 3.2 The Bancor v2 Real Curve . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 20
## 4 Other “Unnatural” Reparameterizations of the Concentrated Liquidity Invariant Function 31
## 4.1 The Uniswap v3 Real Curve . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 31
## 4.2 The Uniswap v3 Virtual Curve . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 41
## 4.3 The Uniswap v3 Reference Curve . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 45
## 4.4 The Carbon DeFi Real Curve . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 48
## 4.5 The Carbon DeFi Virtual Curve . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 58
## 4.6 The Carbon DeFi Reference Curve . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 64
## 5 The “Natural” Reparameterizations of the Concentrated Liquidity Invariant Function 67
## 5.1 Three “Pretty” Invariants . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 68
## 5.2 Transforming and Normalizing the Curves in a New Coordinate System . . . . . . . . . . . . . . . . 73
## 5.3 The Trigonometric Description of Liquidity Concentration . . . . . . . . . . . . . . . . . . . . . . . 82
## 6 Conclusion 85
2DeFi’s Concentrated Liquidity From Scratch REVIEW
## 1 Introduction
The objective with this piece is to formally derive amplified (aka "concentrated liquidity") bonding curves from first
principles, including their hyperbolic trigonometric descriptions. There are a plethora of white papers and research
articles on the subject that do a fine job of elucidating these concepts with rigor. However, as often happens in pursuits
of an academic nature, the literature has become somewhat piecemeal, and the establishing theory is no longer in vogue.
Those steeped in the industry for several years have the benefit of experiencing the evolution of the technology over
time, whereas new talent is left to contend with the patchy, unmaintained, and disorganized record that was left for them.
Worse still, the lack of an editorial process combined with the conflation of research and marketing efforts has produced
a sometimes confused, and often flawed knowledge base. More to the point of this article, even the high-quality papers
are written for an exclusive audience, as evidenced by the skilled density of their composition which often sacrifices
expository prose for brevity. As it should.
The impetus here is to take the opposite approach – one where the reader’s erudition in DeFi is not assumed. Of course,
these are technical concepts and so command a minimum working knowledge of algebra, calculus, and maybe a few
other things. However, the presentation format is designed to resemble a study guide more than a technical disclosure.
Therefore, those equipped with the necessary tools (e.g. undergraduate math, maybe high school) can quickly orient
themselves and get familiar with the theory and save some wasted effort.
The concentrated liquidity construction will begin from the description first published by Bancor in 2020, with an
exclusive focus on the now familiar two-dimensional, equal weights variety, as this has now reached market saturation
thanks largely to Uniswap v3. By itself, this is nothing to write home about. However, an additional step further is taken
to arrive at a trigonometric description of these concepts and derive what we refer to as the three "natural" concentrated
liquidity invariant equations. While these invariant equations have appeared previously in the Carbon DeFi Whitepaper3
and Invention Disclosure4
, this may be the first time their trigonometric origins have been elaborated in a public forum.
## 2 The Basics: Elementary Analysis of the Reference Curve
This exercise begins truly from scratch, with an empty Cartesian plane (Figure 1).
Choose any point (x = x0,y = y0). This point represents your beginning token balances. The choice of these token
balances is not incidental, and we will revisit this in a moment. For now, let x0 and y0 be any positive real number
(Figure 2).
Then, draw a rectangular hyperbola through this point. In its original 2017 form,5
the invariant was general, allowing
for the x- and y-axis to be scaled independently (Equation 1).
xα
· yβ
= xα
0 · yβ
0 (1)
Most of the industry has settled on the requirement for equal exponents, α = β, which simplifies the invariant function
a little (Equation 2).
from
(1) x · y = x0 · y0 (2)
While the general and multi-dimensional form is still very much in operation, the remainder of this exercise will focus
exclusively on the two-dimensional equal-weights variety.
To constrain the complexity of our discussion, we will ignore the [poorly named] “fee” parameter, which deserves a
dedicated exposé. Therefore, this curve represents all the allowed token balances for your liquidity pool, and anyone
can change the token balances so long as those balances satisfy the predicate x · y = x0 · y0. This means that someone
can add additional tokens to the liquidity pool in one dimension (e.g. ∆x) and remove tokens from the other dimension
(e.g. ∆y), thus performing a trade with you. To satisfy the predicate, the token trade amounts ∆x and ∆y can be easily
calculated as follows (Equations 3, 4 and 5).
from
(2) (x + ∆x) · (y + ∆y) = x0 · y0 (3)
3
resources.carbondefi.xyz/pages/CarbonWhitepaper.pdf
4
resources.carbondefi.xyz/pages/CarbonPatent.pdf
5
Hertzog, E.; Benartzi, G.; Benartzi, G.; Levi, Y. Methods for Exchanging and Evaluating Virtual Currency
3DeFi’s Concentrated Liquidity From Scratch REVIEW
Fig. 1 An empty Cartesian plane.
from
(3) ∆x =
x0 · y0
y + ∆y
− x (4)
from
(3) ∆y =
x0 · y0
x + ∆x
− y (5)
The calculation can be made dependent on only one of either the x or y coordinates by substituting their identities in
terms of each other (Equations 6 and 8), and the x0 and y0 constants (Equations 7 and 9).
from
(2) x =
x0 · y0
y
(6)
4DeFi’s Concentrated Liquidity From Scratch REVIEW
Fig. 2 The point x = x0,y = y0.
from
(4)
(6)
∆x =
x0 · y0
y + ∆y
−
x0 · y0
y
= −
∆y · x0 · y0
y · (y + ∆y)
(7)
from
(2) y =
x0 · y0
x
(8)
from
(5)
(8)
∆y =
x0 · y0
x + ∆x
−
x0 · y0
x
= −
∆x · x0 · y0
x · (x + ∆x)
(9)
There are a few important notes here. First, it is important to remember that ∆x and ∆y have opposite signs with
respect to each other; a positive change in one dimension is always coupled with a negative change in the opposite
5DeFi’s Concentrated Liquidity From Scratch REVIEW
Fig. 3 The rectangular hyperbola x · y = x0 · y0 (Equation 2), necessarily passing through the point x = x0,y = y0.
dimension. If ∆x > 0, then ∆y < 0 and vice-versa. Secondly, these are not the familiar swap equations you will see
elsewhere, but rest assured they are redundant forms. The representations chosen here have explicit x0 and y0 constants
to help to maintain consistency with the rest of the theory as it is presented below. To derive the more common forms,
consider that the x0 · y0 term in Equations 4, and 5 can be substituted for x · y, as implied by the invariant function
(Equation 2), which allows for further simplification (Equations 10, and 11). Note that this refactoring makes the
sign inversion of ∆x and ∆y explicit, which is appropriate given the liquidity pool’s frame of reference and preserves
consistency with some of the other manipulations we are going to explore. However, it is common to present these
equations with a moving frame of reference, where both ∆x > 0 and ∆y > 0. While this is likely a reflection of
their unsigned implementation in smart contracts, it also breaks a pleasing symmetry in the algebra and so is not the
convention used here. Traversal upon the implicit curve representing a token swap is depicted in Figure 4.
6DeFi’s Concentrated Liquidity From Scratch REVIEW
from
(7) ∆x = −
∆y · x · y
y · (y + ∆y)
= −
∆y · x
y + ∆y
(10)
from
(9) ∆y = −
∆x · x · y
x · (x + ∆x)
= −
∆x · y
x + ∆x
(11)
Fig. 4 The traversal upon the rectangular hyperbola x · y = x0 · y0 (Equation 2) representing a token swap against the liquidity
pool, where ∆x > 0 and ∆y < 0.
From here, we can derive the marginal rate of exchange in two convenient ways. First, we can rearrange Equations 10
and 11 to get the effective rate of exchange (Equations 12 and 14), then take the limit as the denominator goes to zero
(Equations 13 and 15) to determine the instantaneous rate of exchange (i.e. the marginal price).
7DeFi’s Concentrated Liquidity From Scratch REVIEW
from
(10)
∆x
∆y
= −
x
y + ∆y
(12)
from
(12)
∂x
∂y
= lim
∆y→0
∆x
∆y
= −
x
y
(13)
from
(11)
∆y
∆x
= −
y
x + ∆x
(14)
from
(14)
∂y
∂x
= lim
∆x→0
∆y
∆x
= −
y
x
(15)
Alternatively, rearrangement of Equation 2 to make either x or y the subject (Equations 6 and 8), followed by
differentiation with respect to the other term while treating x0 and y0 as constants delivers an equivalent result
(Equations 16 and 17). Again, this form is less familiar, but also more analytically robust and consistent with the bulk
of the following presentation.
from
(6)
∂x
∂y
= −
x0 · y0
y2
;
∂y
∂x
= −
y2
x0 · y0
(16)
from
(8)
∂y
∂x
= −
x0 · y0
x2
;
∂x
∂y
= −
x2
x0 · y0
(17)
It is important to recognize that the marginal rates of exchange, ∂x/∂y and ∂y/∂x, are commensurate with price quotes.
These are the onchain oracle prices for the token pair (simplified, but close enough) and represent the current price for a
trade value of zero, whereas the effective price experienced during a trade is dependent on the trade amounts and the
token balances inside the liquidity pool (Equations 12 and 14).
To complete this part of the exercise, consider that the familiar implicit curve of the invariant function, or bonding
curve, is the integrated form of the price function. Therefore, the swap equations can also be derived from explicit
integration of Equations 16 and 17 over the interval representing the number of tokens being swapped (Equations 18
and 19, which yield results identical to Equations 7 and 9). The integration above ∂y/∂x = −x0 · y0/x2
over the
interval x → x + ∆x representing a token swap is depicted in Figure 5.
from
(16) ∆x = −
Z y+∆y
y
x0 · y0
y2
· ∂y =

x0 · y0
y
y+∆y
y
⇒ Eqn. 7 (18)
from
(17) ∆y = −
Z x+∆x
x
x0 · y0
x2
· ∂x =
hx0 · y0
x
ix+∆x
x
⇒ Eqn. 9 (19)
Take special note that integration of the more familiar price functions over the same interval requires a more considered
approach, as x and y vary with each other. Beginning from the previously obtained differential equations (Equations 13
and 15), first separate the x and y variables across the equality (Equation 20) then evaluate their definite integrals over
x → x + ∆x and y → y + ∆y, independently (Equations 21 and 22). Following that, the minuends and subtrahends
resulting from integration of each variable are transformed into their corresponding quotients via the properties of
logarithms (Equation 23). Then, rearrangement of the expressions thus obtained to isolate either ∆x or ∆y gives
Equations 24 and 25, which can be further simplified to recreate the identities previously obtained (Equations 10 and
11).
from
(13)
(15)
1
y
· ∂y = −
1
x
· ∂x (20)
8DeFi’s Concentrated Liquidity From Scratch REVIEW
from
(20)
Z y+∆y
y
1
y
· ∂y = −
Z x+∆x
x
1
x
· ∂x = [ln(y)]
y+∆y
y = −[ln(x)]
x+∆x
x (21)
from
(21) ln(y + ∆y) − ln(y) = ln(x) − ln(x + ∆x) (22)
from
(22) ln

y + ∆y
y

= ln

x
x + ∆x

⇒
y + ∆y
y
=
x
x + ∆x
(23)
from
(23) ∆x = −x ·

1 −
y
y + ∆y

⇒ Eqn. 10 (24)
from
(23) ∆y = −y ·

1 −
x
x + ∆x

⇒ Eqn. 11 (25)
Therefore, the implicit curve of the invariant function and its first derivative are equally valid expressions of the
underlying theory, and the preference for presenting only one or the other is an arbitrary choice. You should expect to
see a combination of both throughout the DeFi whitepaper literature.
Something important to note here is that the price equation is asymptotic at ∂y/∂x = 0 and ∂y/∂x = −∞ for all real
positive token balances, ∀x,y ∈ R+
. Therefore, the x · y = x0 · y0 invariant can quote any price, regardless of the
relative values of the underlying tokens. This property is sacrificed in the concentrated liquidity extension.
## 3 The Seminal Concentrated Liquidity Invariant
The original motivation for concentrated liquidity has been articulated in Bancor’s announcement blog 6,7
on April 29,
2020, and later in Uniswap’s announcement blog8
on March 22, 2021.
Here is the short version. Two different liquidity pools will offer the same marginal exchange rate if the ratio of their
token balances is identical (Equations 13, 15, 16 and 17); however, the liquidity pool with the larger absolute quantity of
tokens can offer a better effective exchange rate for the same trade amount than the smaller pool (Equations 12 and 14).
The improvement in the overall exchange rate on the larger pool for the same trade quantities is the same as observing
that the larger pool has a reduced slippage compared to the smaller pool (these are equivalent statements).
Similarly, for the same effective exchange rate, or for the same relative move in the market price of the two tokens
inside the liquidity pool, the larger pool can process a larger trade volume than the smaller one. In other words, it takes
a larger trade volume to move the marginal price of the larger pool compared to the smaller one. If these characteristics
of the larger pool are desirable, then the smaller pool can pretend to be equivalent in size, thereby achieving the same
exchange rate profile and supporting larger trade volumes. The caveat is that emulation of the larger curve also restricts
the price interval over which it operates.
## 3.1 The Bancor v2 Virtual Curve
To begin this part of the exercise, suppose that the starting coordinates chosen for Figure 3 are multiplied by an
amplification constant, A, to give new virtual coordinates, xv and yv (Figure 6). Then, draw through this new point the
same rectangular hyperbola as we have before (Equation 26) (Figure 7). The only difference between Equations 2 and
26 is that the invariant part of the latter is increased by the square of the amplification constant.
from
(2) xv · yv = (A · x0) · (A · y0) = A2
· x0 · y0 (26)
6
Hertzog, E.; Levi, Y.; Manos, B.; Shachaf, A.; Benartzi, G. Smart Contract of a Blockchain for Management of Cryptocurrencies
7
blog.bancor.network/announcing-bancor-v2-2f56b515e9d8
8
blog.uniswap.org/uniswap-v3
9DeFi’s Concentrated Liquidity From Scratch REVIEW
Fig. 5 The integration above ∂y/∂x = −x0 · y0/x2
(Equation 17) over the interval x → x + ∆x representing a token swap
against the liquidity pool, where ∆x > 0 and ∆y < 0.
The amplified xv · yv = A2
· x0 · y0 curve has the same properties as its x · y = x0 · y0 counterpart. The expressions
above that explicitly refer to the constants x0 and y0 (Equations 3, 4, 5, 6, 7, 8, 9, 16, and 17) can be adapted easily by
introducing the amplification constant as appropriate (Equations 27, 28, 29, 30, 31, 32, 33, 34 and 35).
from
(8) yv =
A2
· x0 · y0
xv
(27)
from
(6) xv =
A2
· x0 · y0
yv
(28)
10DeFi’s Concentrated Liquidity From Scratch REVIEW
Fig. 6 The point (xv = A · x0,yv = A · y0), appended to the plot depicted in Figure 3.
from
(3) (xv + ∆x) · (yv + ∆y) = A2
· x0 · y0 (29)
from
(4) ∆x =
A2
· x0 · y0
yv + ∆y
− xv (30)
from
(7) ∆x = −
∆y · A2
· x0 · y0
yv · (yv + ∆y)
(31)
from
(5) ∆y =
A2
· x0 · y0
xv + ∆x
− yv (32)
11DeFi’s Concentrated Liquidity From Scratch REVIEW
Fig. 7 The rectangular hyperbola xv · yv = A2
· x0 · y0 (Equation 26), necessarily passing through the point
(xv = A · x0,yv = A · y0).
from
(9) ∆y = −
∆x · A2
· x0 · y0
xv · (xv + ∆x)
(33)
from
(16)
∂xv
∂yv
= −
A2
· x0 · y0
y2
v
;
∂yv
∂xv
= −
y2
v
A2 · x0 · y0
(34)
from
(17)
∂yv
∂xv
= −
A2
· x0 · y0
x2
v
;
∂xv
∂yv
= −
x2
v
A2 · x0 · y0
(35)
More significantly, the expressions that ignore the x0 and y0 terms (Equations 10, 11, 12, 13, 14, and 15) can be used
verbatim; they are intrinsically self-referential with respect to the size of the curve, emulated or not, and so no correction
12DeFi’s Concentrated Liquidity From Scratch REVIEW
is required. However, both the explicitly amplified and uncorrected expressions make no attempt to compensate for
the fact that the emulated curve is only pretending to have the liquidity it represents. In the common vernacular, these
emulated token balances are referred to as virtual token balances, and the amplified curve as the virtual curve.
Since the virtual curve has only the original tokens that were used to create it, x0 and y0, then it is possible to completely
deplete its real token balances, regardless of its virtual token balances. Therefore, there are two boundaries to discover:
the virtual token balances when the real x token balance is depleted, and when the real y token balance is depleted.
The derivation is straightforward. The virtual curve begins with A·x0 virtual xv tokens and will become depleted when
x0 tokens have been traded out of it (Equations 36) (Figure 8). Let this be the minimum virtual x-coordinate, min(xv);
which is necessarily coupled with the maximum virtual y-coordinate, max(yv). The identity of max(yv) can be found
by substitution of min(xv) into Equation 27 (Equation 37).
min(xv) = A · x0 − x0 = x0 · (A − 1) (36)
from
(27)
(36)
max(yv) =
A2
· x0 · y0
min(xv)
=
A2
· y0
A − 1
(37)
This process is repeated to discover the identity of the other boundary, with coordinates at max(xv) and min(yv)
(Figure 9). The virtual curve begins with A · y0 virtual y tokens and is depleted when y0 tokens have been traded out of
it (Equation 38). The identity of max(xv) can be found by substitution of min(yv) into Equation 28 (Equation 39).
min(yv) = A · y0 − y0 = y0 · (A − 1) (38)
from
(28)
(36)
max(xv) =
A2
· x0 · y0
min(yv)
=
A2
· x0
A − 1
(39)
Turning our attention now to the exchange rates implied at these points of interest. It is trivial that the gradient of the
curves at the points (x0,y0) on the reference curve and (A · x0,A · y0) on the virtual curve are equal (Equation 40);
this identity is proved by substitution of these values into Equation 15 for the reference curve, or any of Equations 15,
34, or 35 for the virtual curve (Figure 10).
from
(15)
(34)
(35)
∂yv
∂xv
= −
A · y0
A · x0
= −
(A · y0)
2
A2 · x0 · y0
= −
A2
· x0 · y0
(A · x0)
2 = −
y0
x0
(40)
The price boundaries represented by (min(xv),max(yv)) and (max(xv),min(yv)) can be defined via a similar
process; substituting their identities into any of Equations 15, 34, or 35 yields the same result (Equations 41 and 42).
Note that since the price curves implied by both the virtual and reference curves each encompass the same range,
−∞ < ∂yv/∂xv < 0,∀xv,yv ∈ R+
and −∞ < ∂y/∂x < 0,∀x,y ∈ R+
, there must exist points on the reference
curve where evaluation of the first derivative of x · y = x0 · y0 at these points yields the same marginal prices as the
boundaries of the virtual curve. Geometrically, these are the unique points where tangent lines drawn on the reference
curve are parallel to the tangent lines drawn at the boundaries of the virtual curve (Figure 11).
from
(36)
(37)
∂yv
∂xv
= −
max(yv)
min(xv)
= −
max2
(yv)
A2 · x0 · y0
= −
A2
· x0 · y0
min2
(xv)
= −
A2
(A − 1)
2 ·
y0
x0
(41)
from
(38)
(39)
∂yv
∂xv
= −
min(yv)
max(xv)
= −
min2
(yv)
A2 · x0 · y0
= −
A2
· x0 · y0
max2 (xv)
= −
(A − 1)
2
A2
·
y0
x0
(42)
Owing to their significance, let the marginal prices at the points (min(xv),max(yv)) and (max(xv),min(yv)) be
represented by the variable names Phigh, P0, and Plow, respectively. These variables are defined here to be the absolute
value of the marginal exchange rates at these points as this renders some of the analysis performed later in this document
13DeFi’s Concentrated Liquidity From Scratch REVIEW
Fig. 8 The min(xv) and max(yv) coordinates (Equations 36 and 37). The correspondence between the virtual token balance and
the real token balance is depicted with shaded areas for reference.
a little less complicated (Equations 43, 44 and 47). However, one ignores the implicit negative sign of the slopes on
these curves at their own peril. To save face, this negation is stated plainly in Equations 44, 46 and 48.
from
(41) Phigh =
A2
(A − 1)
2 ·
y0
x0
;
p
Phigh =
A
A − 1
·
√
y0
√
x0
(43)
from
(41)
(43)
∂yv
∂xv min(xv)
= −Phigh (44)
from
(40) P0 =
y0
x0
;
p
P0 =
√
y0
√
x0
(45)
14DeFi’s Concentrated Liquidity From Scratch REVIEW
Fig. 9 The max(xv) and min(yv) coordinates (Equations 38 and 39). The correspondence between the virtual token balance and
the real token balance is depicted with shaded areas for reference.
from
(40)
(45)
∂yv
∂xv A·x0
= −P0 (46)
from
(42) Plow =
(A − 1)
2
A2
·
y0
x0
;
p
Plow =
A − 1
A
·
√
y0
√
x0
(47)
from
(42)
(47)
∂yv
∂xv max(xv)
= −Plow (48)
There are a few significant capstone identities that can be found at this juncture. Firstly, the geometric mean of Phigh and
Plow is equal to P0 (Equations 49 and 50). Similarly, the geometric means of max(xv) and min(xv), and max(yv) and
15DeFi’s Concentrated Liquidity From Scratch REVIEW
Fig. 10 It is trivial that the gradient of the curves at the points (x0,y0) on the reference curve and (A · x0,A · y0) on the virtual
curve are equal (Equations 15 and 40).
min(yv) are equal to A · x0 and A · y0, respectively (which are the coordinates at which the first derivative evaluates
to P0) (Equations 49, 50, 51, 52, 53 and 54). These are expected results, and can be understood as a consequence of
the Mean Value Theorem9
applied to the implicit curve and price curve over the closed interval defined by the bounds
elucidated above. This is even more evident in the quotients of max(yv) and max(xv), and min(yv) and min(xv),
which evaluate to y0/x0 and is equal to P0 (Equations 55 and 56).
from
(43)
(47)
Phigh · Plow =
(A − 1)
2
A2
·
A2
(A − 1)
2 ·
y0
x0
·
y0
x0
=
y2
0
x2
0
(49)
from
(45)
(49)
p
Phigh ·
p
Plow = P0 =
y0
x0
(50)
9
wikipedia.org/wiki/Mean_value_theorem
16DeFi’s Concentrated Liquidity From Scratch REVIEW
Fig. 11 The slope of tangent lines drawn at the points (min(xv),max(yv)) and (max(xv),min(yv)) on the virtual curve are
commensurate with its price boundaries. Tangent lines are drawn on the reference curve parallel to those on the virtual curve; the
algebraic identities of the points where these parallel tangents kiss the reference curve are elucidated later in this exercise (Equations
43, 45 and 47).
from
(36)
(39)
max(xv) · min(xv) =
A2
· x0
A − 1
· x0 · (A − 1) = A2
· x2
0 (51)
from
(51)
p
max(xv)·
p
min(xv) = A · x0 (52)
from
(37)
(38)
max(yv) · min(yv) =
A2
· y0
A − 1
· y0 · (A − 1) = A2
· y2
0 (53)
from
(53)
p
max(yv)·
p
min(yv) = A · y0 (54)
17DeFi’s Concentrated Liquidity From Scratch REVIEW
from
(36)
(39)
max(yv)
max(xv)
=
A2
· y0
A − 1
A2
· x0
A − 1
=
y0
x0
= P0 (55)
from
(37)
(38)
min(yv)
min(xv)
=
y0 · (A − 1)
x0 · (A − 1)
=
y0
x0
= P0 (56)
Secondly, and less trivially, the quotient of Phigh and Plow can be expressed entirely as a function of A (Equations 57,
58 and 59). This result is commonly referred to as the “capital efficiency” identity without context or explanation but
can now be understood through the lens of a smaller liquidity pool emulating a larger liquidity pool A times larger than
itself.
from
(43)
(47)
Phigh
Plow
=
A2
(A − 1)
2 ·
y0
x0
(A − 1)
2
A2
·
y0
x0
=
A4
(A − 1)
4 (57)
from
(57)
4
p
Phigh
4
√
Plow
=
A
A − 1
(58)
from
(58) A =
1
1 −
4
√
Plow
4
p
Phigh
=
4
p
Phigh
4
p
Phigh − 4
√
Plow
(59)
The so-called “capital efficiency” term receives a lot of attention, but it is ultimately a red herring. The more important
observation is that the quotients of Phigh and P0, and P0 and Plow are equal to each other and to some other constant,
also expressed in terms of A (Equations 60, 61 and 62). For now, let this constant be the symbol C; its identity has a
deep connection to the underlying hyperbolic trigonometry demonstrated later in this exercise. The constant C is also
obtainable from the quotients of max(xv) and min(xv), and max(yv) and min(yv) (Equations 63 and 64).
from
(43)
(45)
Phigh
P0
=
A2
(A − 1)
2 ·
y0
x0
y0
x0
=
A2
(A − 1)
2 = C (60)
from
(45)
(47)
P0
Plow
=
y0
x0
(A − 1)
2
A2
·
y0
x0
=
A2
(A − 1)
2 = C (61)
from
(57)
(60)
(61)
Phigh
Plow
=
A4
(A − 1)
4 = C2
;
p
Phigh
√
Plow
=
A2
(A − 1)
2 = C (62)
from
(43)
(45)
max(xv)
min(xv)
=
A2
· x0
A − 1
x0 · (A − 1)
=
A2
(A − 1)
2 = C (63)
18DeFi’s Concentrated Liquidity From Scratch REVIEW
from
(45)
(47)
max(yv)
min(yv)
=
A2
· y0
A − 1
y0 · (A − 1)
=
A2
(A − 1)
2 = C (64)
Turning our attention now to the tangents drawn on the reference curve, parallel to those on the virtual curve. There are
two convenient methods to elucidate the algebraic identities of the points on the reference curve where the marginal
prices are equal to the price boundaries of the virtual curve. The naïve method (which still works) is to simply reverse
the amplification by taking the quotients of min(xv), max(yv), min(yv), max(xv), and the amplification constant A
(Equations 65, 66, 67 and 68).
from
(36) min(x) =
min(xv)
A
=
x0 · (A − 1)
A
(65)
from
(37) max(y) =
max(yv)
A
=
A2
· y0
A − 1
A
=
A · y0
A − 1
(66)
from
(38) max(x) =
max(xv)
A
=
A2
· x0
A − 1
A
=
A · x0
A − 1
(67)
from
(39) min(y) =
min(yv)
A
=
y0 · (A − 1)
A
(68)
The other method is by way of the previously derived marginal rate expressions, Equations 16 and 17, after substituting
the appropriate marginal rate identity from Equations 41 and 42. This method is demonstrated only for min(x) below
(Equations 69 and 70) but can be used to confirm all identities in Equations 65, 66, 67 and 68, adding some rigor to the
amplification reversal method used above.
from
(17)
(41)
∂y
∂x
= −
x0 · y0
min2
(x)
= −
A2
(A − 1)
2 ·
y0
x0
(69)
from
(69)
1
min2
(x)
=
A2
(A − 1)
2 ·
1
x2
0
⇒ min(x) =
x0 · (A − 1)
A
(70)
These points have been appended to the evolving plot in Figure 12. For completeness, the shadow of the Mean Value
Theorem can be observed here, too. The geometric means of min(x) and max(x), and max(y) and min(y) are equal
to x0 and y0, respectively (which are also the coordinates at which the first derivative evaluates to P0) (Equations 71,
72, 73 and 74). The quotients of max(y) and max(x), and min(y) and min(x) also evaluate to y0/x0 and are equal to
P0 (Equations 75 and 76). Further foreshadowing the hyperbolic trigonometry discussion, the quotients of max(x) and
min(x), and max(y) and min(y) also yield the previously observed constant, C (Equations 77 and 78).
from
(65)
(67)
min(x) · max(x) =
x0 · (A − 1)
A
·
A · x0
A − 1
= x2
0 (71)
from
(71)
p
min(x) ·
p
max(x) = x0 (72)
from
(66)
(68)
max(y) · min(y) =
A · y0
A − 1
·
y0 · (A − 1)
A
= y2
0 (73)
19DeFi’s Concentrated Liquidity From Scratch REVIEW
from
(73)
p
max(y) ·
p
min(y) = y0 (74)
from
(66)
(67)
max(y)
max(x)
=
A · y0
A − 1
A · x0
A − 1
=
y0
x0
= P0 (75)
from
(65)
(68)
min(y)
min(x)
=
y0 · (A − 1)
A
x0 · (A − 1)
A
=
y0
x0
= P0 (76)
from
(65)
(67)
max(x)
min(x)
=
A · x0
A − 1
x0 · (A − 1)
A
=
A2
(A − 1)
2 = C (77)
from
(66)
(68)
max(y)
min(y)
=
A · y0
A − 1
y0 · (A − 1)
A
=
A2
(A − 1)
2 = C (78)
A heuristic understanding of the token balance virtualization can now be attained. A section of the standard x·y = x0·y0
implicit curve, defined by a geometric center with the reference coordinates (x0,y0), and relative distances from this
reference point defined by the amplification constant A, is mapped to the implicit curve of xv ·yv = A2
·x0 ·y0. Shaded
areas and arrows which depict the mapping between the two curves have been added to the developing plot to visualize
the overall process (Figure 13).
The capacity of the virtual curve to absorb higher trading volumes compared to the reference curve can also be
interrogated by considering a token swap from one price bound to the other (Figures 14 and 15). Note that such an
action will execute at the same effective price in both cases. While the marginal rates before and after the exchange
(and therefore the overall exchange rate) are identical in both the reference and virtual curves, the trade amounts are
significantly greater in the virtual curve. The improved trade volume can be inspected visually from the increased arrow
lengths in Figure 14, and the integrated area in Figure 15.
While outside of the focus of the present discussion, the financial ramification of this process is worthy of consideration.
The token swaps depicted in Figures 14 and 15 obscure the fact that the virtual curve has traded its entire reserve of
one token for the other token, whereas the more conservative reference curve has only traded a small proportion of its
reserves. This can have dramatic consequences10
on the portfolio value represented by the liquidity position of the
virtual curve. In lieu of a more thorough investigation, the Medium articles11,12
authored by Peteris Erins and Ivan
Vakhmyanin do an excellent job of elaborating this topic material further.
## 3.2 The Bancor v2 Real Curve
The objective of this part of the exercise is to translate the virtual invariant into a form where there is no recourse to
virtual token balances. That is, to derive the real concentrated liquidity invariant which behaves identically to the virtual
curve, but which correctly reports its own true token balances. This can be interpreted visually as a second mapping
process which drives the boundaries of the virtual curve back to the x- and y-axes (Figure 16). Alternatively (and
equivalently), this construction can also be interpreted as a direct mapping of the previously identified points and prices
on the reference curve back to the x- and y-axes such that the geometric center remains stationary, and such that the
marginal price at this point remains unchanged during the transformation (Figure 17).
10
Loesch, S.; Hindman, N.; Richardson, M. B.; and Welch, N. Impermanent Loss in Uniswap v3. arxiv.org/abs/2111.09192, 2021.
11
medium.com/auditless/impermanent-loss-in-uniswap-v3-6c7161d3b445
12
medium.com/coinmonks/top-5-mysterious-liquidity-providers-in-uniswap-v3-and-what-we-can-learn-from-them-
1894bd27096f
20DeFi’s Concentrated Liquidity From Scratch REVIEW
Fig. 12 The algebraic identities of the points where the lines tangent to the reference curve and parallel to the tangent lines at the
price boundaries of the virtual curve are now elucidated (Equations 65, 66, 67 and 68).
Thankfully, this part is relatively easy. Introduction of horizontal, H, and vertical, V , shift parameters into the virtual
invariant equation (Equation 26) yields Equation 79. These shifts are equal to the gap between the x- and y-axes, and
the shaded areas representing the bounds of the virtual curve in Figure 16. Therefore, the horizontal shift is equal to
min(xv), and the vertical shift is equal to min(yv); substitution of the algebraic identities for these terms (Equations
36 and 38) into H and V in Equation 79 yields the real concentrated liquidity invariant (Equation 80).
from
(26) (x + H) · (y + V ) = A2
· x0 · y0 (79)
from
(36)
(38)
(79)
(x + x0 · (A − 1)) · (y + y0 · (A − 1)) = A2
· x0 · y0 (80)
Algebraic manipulation of the real invariant (Equation 80) to derive the token swap identities, ∆x and ∆y, and the
marginal rate equation is performed as follows. First, the expressions isolating x and y are derived (Equations 81 and
82).
21DeFi’s Concentrated Liquidity From Scratch REVIEW
Fig. 13 The amplification process is depicted with corresponding shaded areas of the reference and virtual curves, respectively.
Points where the first derivative of each curve evaluates to the same result are shown as white dots, and the mapping of these points
is depicted with white arrows.
from
(80) x =
A2
· x0 · y0
y + y0 · (A − 1)
− x0 · (A − 1) (81)
from
(80) y =
A2
· x0 · y0
x + x0 · (A − 1)
− y0 · (A − 1) (82)
The token swap equations are constructed as before; the x and y terms in Equation 80 or Equations 81 and 82 are
substituted for x + ∆x and y + ∆y (Equations 83, 84 and 85), then rearranged to make either ∆x or ∆y the subject.
from
(80) (x + ∆x + x0 · (A − 1)) · (y + ∆y + y0 · (A − 1)) = A2
· x0 · y0 (83)
22DeFi’s Concentrated Liquidity From Scratch REVIEW
Fig. 14 Traversal upon the rectangular hyperbolas x · y = x0 · y0 and xv · yv = A2
· x0 · y0 (Equations 2 and 26), representing a
token swap against the reference and amplified liquidity pools, where ∆x > 0 and ∆y < 0. The marginal rates of exchange before
and after the swap are identical. The ratio of the ∆x and ∆y arrow lengths for each curve are also identical, and therefore the overall
rate of exchange, ∆y/∆x is equal in both cases.
from
(81)
(83)
∆x =
A2
· x0 · y0
y + ∆y + y0 · (A − 1)
− x0 · (A − 1) − x (84)
from
(82)
(83)
∆y =
A2
· x0 · y0
x + ∆x + x0 · (A − 1)
− y0 · (A − 1) − y (85)
To reduce the number of dimensions, the identities for x and y in Equations 81 and 82 are substituted into Equations
84 and 85, respectively (Equations 86 and 88). Combining the minuends and subtrahends into a single fraction yields
Equations 87 and 89.
from
(81)
(84)
∆x =
A2
· x0 · y0
y + ∆y + y0 · (A − 1)
−
A2
· x0 · y0
y + y0 · (A − 1)
(86)
23DeFi’s Concentrated Liquidity From Scratch REVIEW
Fig. 15 The integration above ∂y/∂x = −x0 · y0/x2
and ∂yv/∂xv = −A2
· x0 · y0/x2
v (Equations 17 and 35) over the intervals
x → x + ∆x and A · x → A · (x + ∆x) (i.e. xv → xv + ∆x) representing a token swap against both the reference and amplified
liquidity pools, where ∆x > 0 and ∆y < 0. Note that that the integration areas for the reference and virtual curves are ∆y and
A · ∆y, respectively. By inference, any token swap against the virtual curve can be calculated from the reference curve by
multiplying the output by the amplification constant.
from
(86) ∆x = −
∆y · A2
· x0 · y0
(y + y0 · (A − 1)) · (y + ∆y + y0 · (A − 1))
(87)
from
(82)
(85)
∆y =
A2
· x0 · y0
x + ∆x + x0 · (A − 1)
−
A2
· x0 · y0
x + x0 · (A − 1)
(88)
24DeFi’s Concentrated Liquidity From Scratch REVIEW
Fig. 16 Construction of the real concentrated liquidity curve is depicted as a map of the virtual curve back to the x- and y-axes.
from
(88) ∆y = −
∆x · A2
· x0 · y0
(x + x0 · (A − 1)) · (x + ∆x + x0 · (A − 1))
(89)
As done previously for Equations 10 and 11, the invariant term A2
· x0 · y0 in Equations 87 and 89 can be substituted
for its identity, (x + x0 · (A − 1)) · (y + y0 · (A − 1)) (i.e. the LHS of Equation 80). This process yields the familiar
two-dimensional swap equations which depend on both the x and y coordinates (Equations 90 and 91).
from
(87) ∆x = −
∆y · (x + x0 · (A − 1))
y + ∆y + y0 · (A − 1)
(90)
from
(89) ∆y = −
∆x · (y + y0 · (A − 1))
x + ∆x + x0 · (A − 1)
(91)
Again, the marginal price equations can be derived in several ways. Repeating the process demonstrated in Equations
12, 13, 14 and 15, rearrangement of Equations 87 and 89 to get the effective rate of exchange, followed by determination
25DeFi’s Concentrated Liquidity From Scratch REVIEW
Fig. 17 Construction of the real concentrated liquidity curve is depicted as a map of the reference curve section to new coordinates
such that the previously defined price boundaries occur at the x- and y-intercepts, the geometric center remains stationary, and the
marginal exchange rate at its coordinates remains unchanged.
of the limit as the denominator goes to zero gives the instantaneous rate of exchange. It should be apparent that direct
differentiation of Equations 81 and 82 via the quotient rule yields the same results.
from
(87)
∆x
∆y
= −
A2
· x0 · y0
(y + y0 · (A − 1)) · (y + ∆y + y0 · (A − 1))
(92)
from
(92)
∂x
∂y
= lim
∆y→0
∆x
∆y
= −
A2
· x0 · y0
(y + y0 · (A − 1))
2 ;
∂y
∂x
= −
(y + y0 · (A − 1))
2
A2 · x0 · y0
(93)
from
(89)
∆y
∆x
= −
A2
· x0 · y0
(x + x0 · (A − 1)) · (x + ∆x + x0 · (A − 1))
(94)
26DeFi’s Concentrated Liquidity From Scratch REVIEW
from
(94)
∂y
∂x
= lim
∆x→0
∆y
∆x
= −
A2
· x0 · y0
(x + x0 · (A − 1))
2 ;
∂x
∂y
= −
(x + x0 · (A − 1))
2
A2 · x0 · y0
(95)
Lastly, the marginal rate equations can also be expressed in terms of both token balances via substitution of the x and y
terms in Equations 13 and 15 with their horizontally- or vertically-shifted transformations (Equation 96). If that seems
like a leap, the truth of this identity can also be proved by substituting the A2
· x0 · y0 term in Equations 93 and 95 for
its identity, the LHS of Equation 80.
from
(80)
(93)
(95)
∂x
∂y
= −
x + x0 · (A − 1)
y + y0 · (A − 1)
;
∂y
∂x
= −
y + y0 · (A − 1)
x + x0 · (A − 1)
(96)
The token swap equations can now be independently derived, and further understood, from the continuous summation
over the price curves. Explicit integration of Equations 93 and 95 over the interval representing the number of tokens
being swapped yields results identical to Equations 86, 87, 88 and 89 (Equations 97 and 98). The integration above
∂y/∂x = −A2
· x0 · y0/

x + x0 · (A − 1)
2

over the interval x → x + ∆x representing a token swap is depicted in
due course.
from
(86)
(87)
(93)
∆x = −
Z y+∆y
y
A2
· x0 · y0
(y + y0 · (A − 1))
2 · ∂y =

A2
· x0 · y0
y + y0 · (A − 1)
y+∆y
y
⇒ Eqns. 86 and 87 (97)
from
(88)
(89)
(95)
∆y = −
Z x+∆x
x
A2
· x0 · y0
(x + x0 · (A − 1))
2 · ∂x =

A2
· x0 · y0
x + x0 · (A − 1)
x+∆x
x
⇒ Eqns. 88 and 89 (98)
Be reminded that since x and y are dependent on each other, trying to obtain the token swap equation from direct
integration of Equation 96 requires separation of the x and y variables first (Equations 99 and 100). Evaluation of the
definite integrals over x → x + ∆x and y → y + ∆y (Equations 101, 102 and 103) followed by rearrangement of the
resulting expression to isolate either ∆x or ∆y gives the familiar two-dimensional swap equations (Equations 104 and
105), which are redundant with those previously obtained (Equations 90 and 91).
from
(96)
1
y + y0 · (A − 1)
· ∂y = −
1
x + x0 · (A − 1)
· ∂x (99)
from
(99)
Z y+∆y
y
1
y + y0 · (A − 1)
· ∂y = −
Z x+∆x
x
1
x + x0 · (A − 1)
· ∂x (100)
from
(100) [ln(y + y0 · (A − 1))]
y+∆y
y = −[ln(x + x0 · (A − 1))]
x+∆x
x (101)
from
(101) ln

y + ∆y + y0 · (A − 1)
y + y0 · (A − 1)

= ln

x + x0 · (A − 1)
x + ∆x + x0 · (A − 1)

(102)
from
(102)
y + ∆y + y0 · (A − 1)
y + y0 · (A − 1)
=
x + x0 · (A − 1)
x + ∆x + x0 · (A − 1)
(103)
from
(90)
(103)
∆x = −(x + x0 · (A − 1)) ·

1 −
y + y0 · (A − 1)
y + ∆y + y0 · (A − 1)

⇒ Eqn. 90 (104)
27DeFi’s Concentrated Liquidity From Scratch REVIEW
from
(91)
(103)
∆y = −(y + y0 · (A − 1)) ·

1 −
x + x0 · (A − 1)
x + ∆x + x0 · (A − 1)

⇒ Eqn. 91 (105)
Turning our attention back to the plot, the intercepts of the real curve (i.e. the points where it cuts either the x- or
y-axes) can be determined easily (Figure 18). There are two convenient methods to achieve this. Substitution of y and x
for zero in Equations 81 and 82, respectively, services the same result as taking the difference between max(xv) and
min(xv), and max(yv) and min(yv), respectively (Equations 106 and 107). The latter approach is more geometrically
intuitive given the construction thus far, but to each their own.
from
(36)
(39)
(81)
xint = max(xv) − min(xv) =
A2
· x0
A − 1
− x0 · (A − 1) =
x0 · (2A − 1)
A − 1
(106)
from
(37)
(38)
(82)
yint = max(yv) − min(yv) =
A2
· y0
A − 1
− y0 · (A − 1) =
y0 · (2A − 1)
A − 1
(107)
Since the real curve is shifted wholesale relative to the origin, so are its horizontal and vertical asymptotes. Again, the
geometric intuition is to simply subtract from the origin the magnitude of the shift in the x- and y-dimensions, whereas
the analytic approach is to substitute the y- or x-component of Equations 81 and 82 as required to set the denominator
of the curve’s equation to zero (Equations 108 and 109). In either case you get the same result for about the same effort
(Figure 19).
from
(36)
(82)
xasym = −x0 · (A − 1) (108)
from
(38)
(81)
yasym = −y0 · (A − 1) (109)
The quotient properties of xint, yint, xasym and yasym are preserved with respect to P0 (Equations 110 and 111), analogous
to that previously observed for the virtual and reference curves (Equations 55, 56, 75 and 76).
from
(106)
(107)
yint
xint
=
y0 · (2A − 1)
A − 1
x0 · (2A − 1)
A − 1
=
y0
x0
= P0 (110)
from
(108)
(109)
yasym
xasym
=
−y0 · (A − 1)
−x0 · (A − 1)
=
y0
x0
= P0 (111)
The geometric means of the significant x- and y-coordinates is also preserved, but the perspective needs to be generalized
to be their distances from the asymptotes, instead of implicitly their distance relative to the origin (which was the
case previously). While many of the manipulations in this document may be [justly] criticized for their mathematical
redundancy, this one is especially so (Equations 112, 113, 114 and 115). Measuring the distance of the intercepts and
the origin from the asymptotes is literally the same as reversing the shift of the real curve back to the virtual curve,
making these identities and the process of acquiring them identical to Equations 51, 52, 53 and 54. The mysterious
constant C shows up again here for the same reason (Equations 116 and 117). This part of the exercise is not entirely
without merit, though; these symbolic representations provide a convenient handle for further algebraic abstraction
when reparametrizing the curve, as will be discussed shortly.
from
(88)
(92)
(xint − xasym) · (0 − xasym) = max(xv) · min(xv) = A2
· x2
0 (112)
28DeFi’s Concentrated Liquidity From Scratch REVIEW
Fig. 18 The x- and y-intercepts of the real curve (Equations 106 and 107) are annotated, which completes its characterization. The
real and virtual curves are depicted with the capstone algebraic identities elucidated thus far, including the value of the derivative
evaluated at these points, illustrated with annotated tangent lines to the curve.
from
(112)
q
(xint − xasym) ·
q
(0 − xasym) =
p
max(xv) ·
p
min(xv) = A · x0 (113)
from
(89)
(93)
(yint − yasym) · (0 − yasym) = max(yv) · min(yv) = A2
· y2
0 (114)
from
(114)
q
(yint − yasym) ·
q
(0 − yasym) =
p
max(yv) ·
p
min(yv) = A · y0 (115)
from
(88)
(92)
(xint − xasym)
(0 − xasym)
=
max(xv)
min(xv)
=
A2
(A − 1)
2 = C (116)
29DeFi’s Concentrated Liquidity From Scratch REVIEW
Fig. 19 The horizontal and vertical asymptotes of the virtual (Equations 108 and 109) and reference curves, and the real curve are
depicted with dotted lines, and their coordinates are annotated appropriately.
from
(89)
(93)
(yint − yasym)
(0 − yasym)
=
max(yv)
min(yv)
=
A2
(A − 1)
2 = C (117)
Tying up loose ends, the same simulated token swap performed in Figures 14 and 15 is repeated for the real curve and
compared with the virtual curve in Figures 19 and 20. The important thing to note is that the change in the coordinates
conventions makes zero difference with respect to the outcome of the swap. The magnitudes of the ∆x and ∆y arrows
in Figure 19, and the integrated area in Figure 20 are identical; only the position on the plane where the algorithm is
performed has changed, which has no effect on either the marginal or effective rates of exchange. Therefore, they are
equivalent in every way that matters to us.
30DeFi’s Concentrated Liquidity From Scratch REVIEW
Fig. 20 Traversal upon the rectangular hyperbolas xv · yv = A2
· x0 · y0 and
(x + x0 · (A − 1)) · (y + y0 · (A − 1)) = A2
· x0 · y0 (Equations 26 and 80), representing a token swap against the virtual and real
depictions of the amplified liquidity pools, where ∆x > 0 and ∆y < 0. The swap quantities ∆x and ∆y, and marginal rates of
exchange before and after the swap are identical. Therefore, with respect to the outcome of the exchange the difference between the
two curve implementations is nothing.
## 4 Other “Unnatural” Reparameterizations of the Concentrated Liquidity Invariant
Function
## 4.1 The Uniswap v3 Real Curve
The most common reparameterization of the real concentrated liquidity invariant (Equation 80) is that popularized by
Uniswap v3 in its whitepaper.13
To construct this form, first obtain the identities of (A − 1) in terms of the square
roots of the price bounds via Equations 43 and 47 (Equations 118, 119, 120 and 121). Then, substitute the obtained
(A − 1) identities into the horizontal and vertical shift components of Equation 80 as appropriate (Equation 122); the
substitution pattern must be such that the coefficient of the shift (x0 or y0) simplifies to its square root (
√
x0 or
√
y0) as
shown in Equation 123. Substitution of the constant term A ·
√
x0 ·
√
y0 for L (Equation 124) yields the Uniswap v3
real curve equation (Equation 125).
13
Adams, H.; Zinmeister, N.; Salem, M.; Keefer, R.; Robinson, D. Uniswap v3 Core uniswap.org/whitepaper-v3.pdf
31DeFi’s Concentrated Liquidity From Scratch REVIEW
Fig. 21 The integration above ∂yv/∂xv = −A2
· x0 · y0/x2
v and ∂y/∂x = −A2
· x0 · y0/(x + x0 · (A − 1))2
(Equations 35
and 95) over the intervals x → x+∆x and x+x0 ·(A − 1) → x+x0 ·(A − 1)+∆x representing a token swap against both the
real and virtual curves, where ∆x > 0 and ∆y < 0. Apart from the shift along the x-axis, these are identical in every other aspect.
Note that whereas the relationship between the reference and virtual price curves in Figure 15 was multiplicative (x and ∆x, versus
A · x and A · (x + ∆x), the relationship between the real and virtual price curves depicted here is additive (x and ∆x versus
x + x0 · (A − 1) and x + x0 · (A − 1) + ∆x).
from
(43)
p
Phigh =
A
A − 1
·
√
y0
√
x0
(118)
from
(118) A − 1 =
A
p
Phigh
·
√
y0
√
x0
(119)
32DeFi’s Concentrated Liquidity From Scratch REVIEW
from
(47)
p
Plow =
A − 1
A
·
√
y0
√
x0
(120)
from
(120) A − 1 = A ·
p
Plow ·
√
x0
√
y0
(121)
from
(80)
(119)
(121)
x + x0 ·
A
p
Phigh
·
√
y0
√
x0
!!
·

y + y0 ·

A ·
p
Plow ·
√
x0
√
y0

= A2
· x0 · y0 (122)
from
(119) x +
A ·
√
y0 ·
√
x0
p
Phigh
!
·

y + A ·
√
y0 ·
√
x0 ·
p
Plow

= A2
· x0 · y0 (123)
from
(123) A ·
√
y0 ·
√
x0 = L (124)
from
(123)
(124)
x +
L
p
Phigh
!
·

y + L ·
p
Plow

= L2
(125)
This process affords a new expression for the same mathematical object; fundamentally, Equations 80 and 125 are
one and the same thing. However, this does not mean that they are equally useful given their context in smart contract
implementations. For example, Equation 125 conveniently lists its own price bounds in the invariant itself but requires
one to perform a little extra work to deduce its reference coordinates and relative scaling. On the other hand, Equation
80 reports its own reference coordinates and relative scaling at the expense of the price bounds. From an analytical
perspective the difference is meaningless, but from an implementation perspective the difference could be important.
In the case of Uniswap v3, the price bounds are commensurate with an overall smart contract architecture decision
that requires these parameters (i.e. the tick boundaries) to be available and reliable. While on-the-fly calculations can
recreate these parameters in situ, these operations add more computational overhead and rounding errors which may
present gas efficiency issues, or even smart contract security concerns. Therefore, the expression used (Equation 125)
reflects the overall systems design and serves as an abstraction of how to interpret and use the data one is likely to find
stored there.
This is an important discussion point, because the difference between well and poorly designed systems can come down
to the choice of how to parameterize the equations that describe it, even if those descriptions are analytically redundant.
In the case of Uniswap v3, Equation 125 is in some sense the correct parameterization for that system; however, it is a
dangerous idea to consider it a catch all that should be used by any concentrated liquidity system.
The Uniswap v3 real curve (Equation 125) is plotted in Figure 22 and annotated with the slopes of the tangent lines at
the intercepts, which is the only information presently available at this stage of the analysis.
Returning to the objective of this part of the exercise, we will now fully elucidate the reparametrized version of the
model beginning from the Uniswap v3 invariant function (Equation 125), characterise the real, virtual, and reference
curves, and re-contextualize them in terms of the general theory as outlined in the previous sections. Manipulation of
the Uniswap v3 invariant (Equation 125) is performed using the same methods as before. First, the expressions isolating
x and y are derived (Equations 126 and 127).
from
(125) x =
L2
y + L ·
√
Plow
 −
L
p
Phigh
(126)
from
(125) y =
L2
x +
L
p
Phigh
− L ·
p
Plow (127)
33DeFi’s Concentrated Liquidity From Scratch REVIEW
Fig. 22 Initial Uniswap v3 real curve. Due to its parameterisation and prior to performing any additional analysis, only the slopes
of the tangent lines at the intercepts are known (−Phigh and −Plow).
Then, the token swap equations are constructed as normal; the x and y terms in Equation 125 or Equations 126 and 127
are substituted for x + ∆x and y + ∆y then rearranged to make either ∆x or ∆y the subject (Equations 128, 129 and
130).
from
(125) x + ∆x +
L
p
Phigh
!
·

y + ∆y + L ·
p
Plow

= L2
(128)
from
(126)
(128)
∆x =
L2
y + ∆y + L ·
√
Plow
 −
L
p
Phigh
− x (129)
34DeFi’s Concentrated Liquidity From Scratch REVIEW
from
(127)
(128)
∆y =
L2
x + ∆x +
L
p
Phigh
− L ·
p
Plow − y (130)
Dimension reduction is achieved via the same process as previously demonstrated; the identities for x and y in Equations
126 and 127 are substituted into Equations 129 and 130, respectively (Equations 131 and 133). Simplifying these
expressions into single fractions yields Equations 132 and 134.
from
(126)
(129)
∆x =
L2
y + ∆y + L ·
√
Plow
 −
L
p
Phigh
−
L2
y + L ·
√
Plow
 +
L
p
Phigh
(131)
from
(128) ∆x = −
∆y · L2
y + L ·
√
Plow

· y + ∆y + L ·
√
Plow
 (132)
from
(127)
(130)
∆y =
L2
x + ∆x +
L
p
Phigh
− L ·
p
Plow −
L2
x +
L
p
Phigh
+ L ·
p
Plow (133)
from
(133) ∆y = −
∆x · L2
x +
L
p
Phigh
!
· x + ∆x +
L
p
Phigh
! (134)
Note that Equations 132 and 134 can also be obtained directly from their predecessors, Equations 87 and 89, by
substituting the scaling term, A2
· x0 · y0, and the horizontal and vertical shift terms, x0 · (A − 1) and y0 · (A − 1), for
their implicit identities, L2
, L/
p
Phigh, and L ·
√
Plow, respectively (Equations 118, 119, 120, 121, 122, 123, 124 and
125). This substitution pattern can also be used to obtain the effective and marginal price equations, but for consistency
with the previous work, these identities will be elaborated below according to the previously established methods.
Repeating the process demonstrated in Equations 12, 13, 14, 15 and Equations 92, 93, 94, 95, rearrangement of
Equations 129, and 131 to get the effective rate of exchange, followed by determination of the limit as the denominator
goes to zero gives the instantaneous rate of exchange (i.e. the marginal price)(Equations 135, 136, 137, 138).
from
(132)
∆x
∆y
= −
L2
y + L ·
√
Plow

· y + ∆y + L ·
√
Plow
 (135)
from
(135)
∂x
∂y
= lim
∆y→0
∆x
∆y
= −
L2
y + L ·
√
Plow
2 ;
∂y
∂x
= −
y + L ·
√
Plow
2
L2
(136)
from
(134)
∆y
∆x
= −
L2
x +
L
p
Phigh
!
· x + ∆x +
L
p
Phigh
! (137)
from
(137)
∂y
∂x
= lim
∆x→0
∆y
∆x
= −
L2
x +
L
p
Phigh
!2 ;
∂x
∂y
= −
x +
L
p
Phigh
!2
L2
(138)
35DeFi’s Concentrated Liquidity From Scratch REVIEW
The Uniswap v3 marginal rate equations can also be expressed in terms of both token balances via substitution of the x
and y terms in Equations 13, and 15 with their horizontally or vertically shifted transformations (Equation 139), or via
substitution of the identity of L2
from the LHS of Equation 125 into Equations 136, and 138. Simplifying the fractions
in Equation 139 yields Equation 140.
from
(125)
(136)
(138)
∂x
∂y
= −
x +
L
p
Phigh
y + L ·
√
Plow
;
∂y
∂x
= −
y + L ·
√
Plow
x +
L
p
Phigh
(139)
from
(139)
∂x
∂y
= −
x ·
p
Phigh + L
p
Phigh · y + L ·
√
Plow
;
∂y
∂x
= −
p
Phigh · y + L ·
√
Plow

x ·
p
Phigh + L
(140)
Continuous summation over the price curves (Equations 136 and 138) over the interval representing the number of
tokens being swapped yields results identical to Equations 131, 132, 133 and 134. Again, do not be tempted to ignore
the dependence of x and y on each other and attempt an integration of Equations 139 and 140, without separating these
variables first (not shown).
from
(131)
(132)
(136)
∆x = −
Z y+∆y
y
L2
y + L ·
√
Plow
2 · ∂y =

L2
y + L ·
√
Plow
y+∆y
y
⇒ Eqns. 131 and 132 (141)
from
(133)
(134)
(138)
∆y = −
Z x+∆x
x
L2
x +
L
p
Phigh
!2 · ∂x =




L2
x +
L
p
Phigh




x+∆x
x
⇒ Eqns. 133 and 134 (142)
Both the direct token swap by traversal upon the bonding curve x + L/
p
Phigh

· y + L ·
√
Plow

= L2
and the
integration above ∂y/∂x = −L2
/ x + L/
p
Phigh
2
over the interval x → x + ∆x are depicted in Figures 23 and 24.
The x- and y-intercepts under the Uniswap v3 parameterization are afforded by direct substitution of y and x for zero in
Equations 126, and 127 (Equations 143, 144, and 145) (Figure 25). As expected, the quotient of yint and xint is equal to
P0 as previously observed in Equation 110 (Equation 146). The x- and y-asymptotes can again be derived geometrically
or analytically (Figure 26). Since the Uniswap v3 curve makes use of the same horizontal and vertical shift parameters
as previously discussed, albeit expressed in terms of L and either
p
Phigh or
√
Plow, the same geometric intuition can
be applied here. Simply subtract from the origin these shift terms to obtain the asymptotes. Alternatively, substitute
the y- or x-component of Equations 126 and 127 as required to set the denominator of the curve’s equation to zero
(Equations 147 and 148). Again, as seen previously (Equation 111), the quotient of the y- and x-asymptotes is equal to
P0 (Equation 149).
from
(126) xint =
L
√
Plow
−
L
p
Phigh
=
L
p
Phigh ·
√
Plow
·
p
Phigh −
p
Plow

(143)
from
(143) xint =
L
P0
·
p
Phigh −
p
Plow

(144)
from
(127) yint = L ·
p
Phigh − L ·
p
Plow = L ·
p
Phigh −
p
Plow

(145)
from
(143)
(144)
(145)
yint
xint
=
p
Phigh ·
p
Plow = P0 (146)
36DeFi’s Concentrated Liquidity From Scratch REVIEW
Fig. 23 Traversal upon the rectangular hyperbola x + L/
p
Phigh

· y + L ·
√
Plow

= L2
(Equation 125), representing a token
swap against the Uniswap v3 real curve, where ∆x > 0 and ∆y < 0.
from
(127) xasym = −
L
p
Phigh
(147)
from
(126) yasym = −L ·
p
Plow (148)
from
(147)
(148)
yasym
xasym
=
p
Phigh ·
p
Plow = P0 (149)
37DeFi’s Concentrated Liquidity From Scratch REVIEW
Fig. 24 The integration above ∂y/∂x = −L2
/ x + L/
p
Phigh
2
(Equation 138) over the interval x → x + ∆x representing a
token swap against the Uniswap v3 real curve, where ∆x > 0 and ∆y < 0.
The remainder of this section is not strictly necessary – the algebra does not lie; however, as we are now several layers
of abstraction above the original construction, this cross-referencing also helps to re-contextualize the derivation and
connect back to some of the establishing theory.
The truth of the x- and y-intercept identities, xint and yint, derived in Equations 143, 144 and 145 can be verified with
reference to work already completed. Since Equations 106 and 144 refer to the same object (i.e. the x-intercept of the
real curve), we can assert their equivalence (Equation 150). Substitution of the P0 and L terms via their definitions
(Equations 45 and 124) results in Equation 151, which after handling the radicals yields a new relationship between
A and the quotient of the difference of the square roots of the price bounds,
p
Phigh and
√
Plow, and the square root
of their geometric mean,
√
P0 (Equation 152). Similar algebraic manipulations of Equations 107 and 145 (i.e. the
y-intercepts) produce the same result (Equations 153, 154 and 155). The independent verification of these expressions
38DeFi’s Concentrated Liquidity From Scratch REVIEW
Fig. 25 The x- and y-intercepts of the Uniswap v3 real curve are annotated on the appropriate axes (Equations 143, 144 and 145).
can then be obtained directly from Equations 43, 45 and 47, which affords additional proof that these parameterizations
are indeed describing the same object (Equations 156 and 157).
from
(107)
(144)
x0 · (2A − 1)
A − 1
=
L
P0
·
p
Phigh −
p
Plow

(150)
from
(45)
(124)
(150)
x0 · (2A − 1)
A − 1
=
A ·
√
x0 ·
√
y0
y0
x0
·
p
Phigh −
p
Plow

(151)
from
(45)
(151)
2A − 1
A · (A − 1)
=
√
x0
√
y0
·
p
Phigh −
p
Plow

=
p
Phigh −
√
Plow
√
P0
(152)
from
(107)
(145)
y0 · (2A − 1)
A − 1
= L ·
p
Phigh −
p
Plow

(153)
39DeFi’s Concentrated Liquidity From Scratch REVIEW
Fig. 26 The horizontal and vertical asymptotes of the Uniswap v3 virtual and reference curves, and its real curve (Equations 147
and 148), are depicted with dotted lines and their coordinates are annotated appropriately. While we have not yet approached the
characterization of the reference and virtual curves, it is trivial that their asymptotes are at zero.
from
(124)
(153)
y0 · (2A − 1)
A − 1
= A ·
√
x0 ·
√
y0 ·
p
Phigh −
p
Plow

(154)
from
(45)
(154)
(2A − 1)
A · (A − 1)
=
√
x0
√
y0
·
p
Phigh −
p
Plow

=
p
Phigh −
√
Plow
√
P0
(155)
from
(43)
(45)
(47)
p
Phigh −
p
Plow =
A
A − 1
·
√
y0
√
x0
−
A − 1
A
·
√
y0
√
x0
=
(2A − 1)
A · (A − 1)
·
√
y0
√
x0
(156)
40DeFi’s Concentrated Liquidity From Scratch REVIEW
from
(45)
(156)
p
Phigh −
√
Plow
√
P0
=
(2A − 1)
A · (A − 1)
(157)
Further confirmation is possible via analysis of the x- and y-asymptotes, via Equations 108 and 147, and 109 and 148,
respectively, which produce the identities previously obtained in Equations 43 and 47 for Phigh and Plow (Equations 158
and 159).
from
(108)
(124)
(147)
x0 · (A − 1) =
L
p
Phigh
⇒
A2
(A − 1)
2 ·
y0
x0
= Phigh (158)
from
(109)
(124)
(148)
y0 · (A − 1) = L ·
p
Plow ⇒
(A − 1)
2
A2
·
y0
x0
= Plow (159)
## 4.2 The Uniswap v3 Virtual Curve
The objective of this next section is to derive the same identities as was done for Equations 112, 113, 114, 115, 116 and
117, then prove these identities by way of substitution with previously obtained relationships.
Recall that the geometric means of the x- and y-bounds of the virtual curve have a correspondence with the amplified
coordinates of the reference curve (to which its size is being compared). To perform this process for the Uniwap v3
reparametrized real curve, as before, we are comparing the bounds with respect to the asymptotes of the shifted curve,
which is equivalent to reversing the shift before measuring these geometric means (Equations 160, 161, 162, 163, 164,
165, 166, 167, 168 and 169), thus recreating the virtual curve coordinates from the corresponding real curve coordinates
(Figure 27). Consistent with prior work, the quotient of the maximum and minimum bounds in both dimensions are
equal to the [yet] unexplained mystery constant, C (Equations 170 and 171). However, unlike last time it is now
presented in terms of
p
Phigh and
√
Plow, instead of A. This identity has already been proven via Equation 62.
from
(143)
(147)
max(xv) = (xint − xasym) =
L
√
Plow
−
L
p
Phigh
+
L
p
Phigh
(160)
from
(160) max(xv) =
L
√
Plow
(161)
from
(147) min(xv) = (0 − xasym) =
L
p
Phigh
(162)
from
(161)
(162)
max(xv) · min(xv) =
L2
p
Phigh ·
√
Plow
=
L2
P0
(163)
from
(163)
p
max(xv) ·
p
min(xv) =
L
4
p
Phigh · 4
√
Plow
=
L
√
P0
(164)
from
(145)
(148)
max(yv) = (yint − yasym) = L ·
p
Phigh −
p
Plow

+ L ·
p
Plow (165)
from
(165) max(yv) = L ·
p
Phigh (166)
41DeFi’s Concentrated Liquidity From Scratch REVIEW
from
(148) min(yv) = (0 − yasym) = L ·
p
Plow (167)
from
(166)
(167)
max(yv) · min(yv) = L2
·
p
Phigh ·
p
Plow = L2
· P0 (168)
from
(168)
p
max(yv) ·
p
min(yv) = L · 4
p
Phigh · 4
p
Plow = L ·
p
P0 (169)
from
(161)
(162)
max(xv)
min(xv)
=
p
Phigh
√
Plow
= C (170)
from
(166)
(167)
max(yv)
min(yv)
=
p
Phigh
√
Plow
= C (171)
Finally, validation of the geometric means of max(xv) and min(xv), and max(yv) and min(yv) (i.e. the x- and
y-bounds of the implied virtual curve) (Equations 164 and 169) can be found by asserting their equivalence to the
identities previously attained (Equations 113 and 115), and then deriving the identity of P0 from this relationship
(Equations 172 and 173).
from
(113)
(124)
(164)
A · x0 =
L
√
P0
⇒
y0
x0
= P0 (172)
from
(115)
(124)
(169)
A · y0 = L ·
p
P0 ⇒
y0
x0
= P0 (173)
To complete the characterisation of the real curve and begin reconstructing the reparametrized reference curve, recall
that the point at the coordinates (x0, y0) has two useful properties: the derivative of the reference curve evaluated at
this point is equal to P0, and its position relative to the point on the virtual curve with the same derivative is uniquely
determined by the same horizontal and vertical shift parameters as the real curve (none of the other points on the
reference curve align with the virtual curve after performing the shift). Moreover, this is the one unique point that is
shared by both the reference and the real curve, and their derivative evaluated at this point is also equal.
To obtain the identities of x0 and y0, the shift parameter (equivalent to xasym and yasym) is applied as appropriate to the
corresponding coordinates on the reference curve (i.e. the geometric means of min(xv) and max(xv), and min(yv) and
max(yv)) (Equations 174 and 176). In both cases, the expressions can be homogenized by distributing a lone radical
into the square of its fourth root before factoring (Equations 175 and 177). There are two different representations
apiece for the x0 and y0 identities included in Equations 175 and 177, respectively. One of these is a “better fit” for the
real curve and the other for the reference curve, and both are used as appropriate when annotating the plots. With these
coordinates, the characterization of the real curve is now complete (Figure 28).
from
(147)
(164)
x0 =
p
max(xv) ·
p
min(xv) + xasym =
L
4
p
Phigh · 4
√
Plow
−
L
p
Phigh
(174)
from
(174) x0 = L ·
1
4
p
Phigh
·
1
4
√
Plow
−
1
4
p
Phigh
!!
=
L
4
p
Phigh · 4
√
Plow
· 1 −
4
√
Plow
4
p
Phigh
!
(175)
from
(148)
(169)
y0 =
p
max(yv) ·
p
min(yv) + yasym = L · 4
p
Phigh · 4
p
Plow − L ·
p
Plow (176)
42DeFi’s Concentrated Liquidity From Scratch REVIEW
Fig. 27 The completed characterisation of the Uniswap v3 virtual curve, with the coordinates at its price bounds and geometric
mean of the price bounds annotated as appropriate (Equations 161, 162, 166 and 167).
from
(176) y0 = L ·

4
p
Plow ·

4
p
Phigh − 4
p
Plow

= L · 4
p
Phigh · 4
p
Plow · 1 −
4
√
Plow
4
p
Phigh
!
(177)
In contrast to the prior construction, which began with a reference curve followed by its virtual amplification and then
horizontal and vertical shifts to arrive at the real curve, here, we have derived the virtual curve beginning from the
shifted real curve. While the process is backwards, the result is the same, and it is still appropriate to define the real
curve in terms of the virtual curve and the horizontal and vertical shifts (Figure 29).
Recall that the amplified virtual curve is just a regular rectangular hyperbola. The only important piece of information is
its scaling constant, previously defined as A2
· x0 · y0; none of these terms are native parameters in this case. However,
the same scaling constant can be obtained directly from inspection of the RHS of Equation 125, or from the product
of any set of coordinates along the curve, for which we have already elucidated three unique pairs. It does not matter
which you use, the result will be the same (Equation 178). After that, the elaboration of the marginal price and token
swap equations is performed as was done for Equations 26, 27, 28, 29, 30, 31, 32, 33, 34, and 35 (Equations 178, 179,
180, 181, 182, 183, 184, and 185).
43DeFi’s Concentrated Liquidity From Scratch REVIEW
Fig. 28 Completed characterizations of the Uniswap v3 real and virtual curves are depicted and annotated appropriately (Equations
143, 145, 161, 162, 164, 166, 167, 169, 175, 177).
from
(2) xv · yv =
L
4
p
Phigh · 4
√
Plow
· L · 4
p
Phigh · 4
p
Plow = L2
(178)
from
(8) yv =
L2
xv
(179)
from
(6) xv =
L2
yv
(180)
from
(3) (xv + ∆x) · (yv + ∆y) = L2
(181)
from
(4)
(7)
∆x =
L2
yv + ∆y
− xv = −
∆y · L2
yv · (yv + ∆y)
(182)
from
(5)
(9)
∆y =
A2
· L2
xv + ∆x
− yv = −
∆x · L2
xv · (xv + ∆x)
(183)
44DeFi’s Concentrated Liquidity From Scratch REVIEW
Fig. 29 Reconstruction of the Uniswap v3 real curve is depicted as a map of the virtual curve back to the x- and y-axes.
from
(16)
∂xv
∂yv
= −
L2
y2
v
;
∂yv
∂xv
= −
y2
v
L2
(184)
from
(17)
∂yv
∂xv
= −
L2
x2
v
;
∂xv
∂yv
= −
x2
v
L2
(185)
The indifference of the real and virtual curves with respect the calculated swap quantities is again evident in the analysis
(Figures 30, 31). Translocation upon the integrated forms (i.e. the bonding curves, Figure 30) and integration above
their implied price curves (Figure 31) yields the same token amounts, ∆x and ∆y. The only difference is the frame of
reference, which is shifted by (−xasym, −yasym) in the virtual curve compared to the real curve, which has no effect
on either the marginal rate, or the effective rate of exchange. Since the L term is exposed directly on the Uniswap v3
smart contracts, legacy infrastructure that was developed to integrate with prior iterations of the canonical x · y = k
on-chain liquidity system can be retrofit with relatively little effort. Therefore, the virtual curve is in some aspect the
preferred context through which third party software observes and interacts with the Uniswap v3 system, which was
likely designed and implemented with x · y = k as a core assumption. It would be naïve to assume that this in an
accident. The parameterization is deliberately self-explanatory and allows for legacy software to be quickly patched
with conditional arguments regarding the price boundaries, while allowing the core swap functions to remain in-tact.
## 4.3 The Uniswap v3 Reference Curve
To begin constructing the Uniswap v3 reference curve, first recall that the product of x0 and y0 is used as its scaling
constant (Equation 2). In other words, x0 ·y0 is equl to k in the proverbial “constant product” equation, x·y = k. With
45DeFi’s Concentrated Liquidity From Scratch REVIEW
Fig. 30 Traversal upon the rectangular hyperbolas x + L/
p
Phigh

· y + L ·
√
Plow

= L2
, and xv · yv = L2
(Equations 125
and 178), representing a token swap against the Uniswap v3 real and virtual curves, where ∆x > 0 and ∆y < 0. The swap
quantities ∆x and ∆y, and marginal rates of exchange before and after the swap are identical. Therefore, with respect to the
outcome of the exchange the difference between the two curve implementations is zero.
the identities of x0 and y0 in-hand, this scaling constant can be derived from the product of the RHS of Equations 175
and 177 (Equations 186 and 187). While there are many compelling algebraic rearrangements for this identity, the form
in Equation 187 was chosen for its ease of use in the derivations to follow, and as a call-back to the so-called “capital
efficiency” term previously isolated in Equation 59.
from
(2)
(175)
(177)
x · y = L ·
1
4
p
Phigh
·
1
4
√
Plow
−
1
4
p
Phigh
!!
· L ·

4
p
Plow ·

4
p
Phigh − 4
p
Plow

(186)
from
(186) x · y = L2
·

1 − 2 ·
4
√
Plow
4
p
Phigh
+
4
√
Plow
4
p
Phigh
!2

 = L2
· 1 −
4
√
Plow
4
p
Phigh
!2
(187)
With the reference curve’s scaling constant now defined in terms of L, Phigh and Plow, the coordinates corresponding to
the price bounds, min(x), max(x), min(y), max(y), can also be expressed with the same parameters. In an earlier
demonstration, this process was made trivial by “reversing” the effective amplification of the virtual curve relative to the
reference curve by taking the quotients of min(xv), max(yv), max(xv), and min(yv), and the amplification constant
A (Equations 65, 66, 67, 68). While this process is still possible via the definition of A in terms of Phigh and Plow
(Equation 59), it no longer has the same intuitive benefit with respect to the construction process. This is a good excuse
46DeFi’s Concentrated Liquidity From Scratch REVIEW
Fig. 31 The integration above ∂y/∂x = −L2
/ x + L/
p
Phigh
2
and ∂yv/∂xv = −L2
/x2
v (Equations 138 and 185) over the
intervals x → x + ∆x and x + L/
p
Phigh → x + L/
p
Phigh + ∆x (i.e. xv → xv + ∆x) representing a token swap against both
the real and virtual curves, where ∆x > 0 and ∆y < 0. Apart from the shift along the x-axis, these are identical in every other
aspect. Note that the relationship between the real and virtual price curves is additive (x and ∆x versus x + L/
p
Phigh and
x + L/
p
Phigh + ∆x).
to explore the more analytical approach. The process is identical to that demonstrated when attempting to add some
rigor to the amplification reversal method (Equations 69 and 70); the derivative of the reference curve (Equations 16 and
17) is forced to either Phigh or Plow (native parameters in this case), and the x or y variable is substituted for min(x),
max(x), min(y), or max(y), as appropriate. Then the coordinate of interest is obtained via trivial rearrangements of
the resulting expressions (Equations 188, 189, 190, 191, 192, 193, 194 and 195) (Figure 32).
47DeFi’s Concentrated Liquidity From Scratch REVIEW
from
(17)
(177)
∂y
∂x
= −Phigh = −
L2
· 1 −
4
√
Plow
4
p
Phigh
!2
min2
(x)
(188)
from
(188) min(x) =
L
p
Phigh
· 1 −
4
√
Plow
4
p
Phigh
!
(189)
from
(17)
(177)
∂y
∂x
= −Plow = −
L2
· 1 −
4
√
Plow
4
p
Phigh
!2
max2(x)
(190)
from
(190) max(x) =
L
√
Plow
· 1 −
4
√
Plow
4
p
Phigh
!
(191)
from
(16)
(177)
∂y
∂x
= −Plow = −
min2
(y)
L2 · 1 −
4
√
Plow
4
p
Phigh
!2 (192)
from
(192) min(y) = L ·
p
Plow · 1 −
4
√
Plow
4
p
Phigh
!
(193)
from
(16)
(177)
∂y
∂x
= −Phigh = −
max2
(y)
L2 · 1 −
4
√
Plow
4
p
Phigh
!2 (194)
from
(194) max(y) = L ·
p
Phigh · 1 −
4
√
Plow
4
p
Phigh
!
(195)
As noted above, the analysis of the Uniswap v3 reparameterization and its real, virtual, and reference curves has been
necessarily performed in the reverse order compared to the seminal work (Figures 1 to 21). Regardless, the liquidity
amplification heuristic applies all the same, and can be represented as before with arrows connecting pairs of points on
the reference and virtual curves, where the derivatives evaluated at these points are equal (Figures 33).
The relative trade volumes supported by the reference and virtual curves over the same price interval can now be
compared (Figures 34 to 35). As before, note that while the trade action executes from and terminates at the same
marginal price values and achieves the same overall effective exchange rate, the trade amounts are significantly greater
in the virtual curve. The increased trade volume can be inspected visually from the increased arrow lengths in Figure
34, and the expansion observed for the integrated area in Figure 35.
This concludes our examination of the Uniswap v3 reparameterization.
## 4.4 The Carbon DeFi Real Curve
Bancor’s peer-to-peer trading product, Carbon DeFi, also uses a unique, “unnatural” reparameterization of the seminal
concentrated liquidity invariant informed by the protocol’s specific requirements. Unlike its predecessors, Carbon
48DeFi’s Concentrated Liquidity From Scratch REVIEW
Fig. 32 The algebraic identities of the points where the lines tangent to the Uniswap v3 reference curve and parallel to the tangent
lines at the price boundaries of the virtual curve are now elucidated (Equations 175, 177, 189, 191, 193, 195).
Defi’s purpose is not to re-create Bancor’s original vision for automatic liquidity systems vis-à-vis continuous pricing
methods that attempt to follow the market, but rather to support the arbitrary price quoting behaviours exhibited by
market participants. The particulars of the Carbon DeFi design are beyond the scope of this document and deserve a
dedicated discourse. However, the necessary context is simple enough to state ad hoc.
In short, Carbon DeFi system must be able to adjust the curve’s scaling parameter reliably and accurately as required
under certain circumstances to maintain price quote boundaries as dictated by its users. This is potentially a sensitive
process. Naïvely shoe-horning either of the implementations previously discussed for Bancor v2 or Uniswap v3 is
an inelegant and unnecessarily computationally intensive choice at best, and risks exposing an exploit resulting from
precision loss during fixed-point operations at worst. Therefore, Carbon DeFi requires the scaling parameter of the
curve to be expressed exclusively in terms of one token balance, which can be adjusted with reference to the same
without performing any calculations at all, thus observing best practices in defensive programming. Just as the Uniswap
v3 reparameterization is the correct form for the system it represents, the Carbon DeFi reparameterization is correct for
is own systems, but both refer to the same underlying mathematical object.
As an aside, Carbon DeFi’s curves are also unusual because they refer to only one token balance, rather than two. This
has no immediate ramifications for the analyses we are about to perform but is worth raising for its own sake and to
foreshadow a future publication which will handle these details more thoroughly. The only detail needed is that, by
convention, Carbon DeFi treats the y-axis as belonging to the only token its bonding curve describes. Therefore, the
derivation of the Carbon DeFi real curve begins from its most conspicuous identity, the y-intercept.
Since Carbon DeFi is a price quoting protocol, the price boundaries represented by Phigh and Plow are obvious choices
to encapsulate natively. The objective then becomes to substitute the L term in Equation 125 with a redundant definition
expressed in terms of the y-intercept, yint, and the price boundaries, Phigh and Plow. This can be accomplished easily
49DeFi’s Concentrated Liquidity From Scratch REVIEW
Fig. 33 The amplification process is depicted with corresponding shaded areas of the Uniswap v3 reference and virtual curves,
respectively. Points where the first derivative of each curve evaluates to the same result are shown as white dots, and the mapping of
these points is depicted with white arrows.
with reference to the work already done. The y-intercept was previously defined in terms of L, Phigh, and Plow in
Equation 145; rearrangement of this identity to isolate L (Equation 196), followed by substitution into Equation 125
yields the reparametrized Carbon DeFi real curve invariant (Equation 197). Refactoring the expression into a more
presentable phenotype is done by defining the parameters a, b, and z, which are equal to
p
Phigh −
√
Plow,
√
Plow, and
the y-intercept, yint, of the real curve, respectively (Equations 198, 199 and 200). Substitution of these definitions into
Equation 197 yields Equation 201, and rearrangement yields Equations 202 and 203. Note that the differences between
Equations 197, 201, 202 and 203 are only cosmetic. These features are depicted in Figure 36.
from
(145) L =
yint
p
Phigh −
√
Plow
(196)
from
(125)
(196)
x +
yint
p
Phigh ·
p
Phigh −
√
Plow

!
· y +
√
Plow · yint
p
Phigh −
√
Plow
!
=
yint
2
p
Phigh −
√
Plow
2 (197)
a =
p
Phigh −
p
Plow (198)
b =
p
Plow (199)
50DeFi’s Concentrated Liquidity From Scratch REVIEW
Fig. 34 Traversal upon the rectangular hyperbolas xv · yv = L2
and x · y = L2
· 1 − 4
√
Plow/ 4
p
Phigh
2
(Equations 178 and 187),
representing a token swap against the reference and amplified liquidity pools, where ∆x > 0 and ∆y < 0. The marginal rates of
exchange before and after the swap are identical. The ratio of the ∆x and ∆y arrow lengths for each curve are also identical, and
therefore the overall rate of exchange, ∆y/∆x is equal in both cases.
z = yint (200)
from
(197)
(198)
(199)
(200)

x +
z
a · (a + b)

·

y +
z · b
a

=
z2
a2
(201)
from
(201) y · (z + x · a · (a + b)) = z · (z − x · b · (a + b)) (202)
from
(201)
y
z
=
z − x · b · (a + b)
z + x · a · (a + b)
(203)
It might be helpful to consider how this arrangement can be expressed in more familiar terms. The expression a·(a + b)
is redundant with Phigh − P0, and b · (a + b) is redundant with P0 (Equations 204, 205 and 206). Substitution of these
relationships and the identity z = yint into Equation 203 yields Equation 206.
51DeFi’s Concentrated Liquidity From Scratch REVIEW
Fig. 35 The integration above ∂y/∂x = −L2
· 1 − 4
√
Plow/ 4
p
Phigh
2
/x2
(i.e. ∂/∂x Equation 187) and ∂y/∂x = −L2
/x2
(Equation 185) over the intervals x → x + ∆x and x/ 1 − 4
√
Plow/ 4
p
Phigh

→ (x + ∆x)/ 1 − 4
√
Plow/ 4
p
Phigh

(i.e.
xv → xv + ∆x) representing a token swap against both the reference and amplified liquidity pools, where ∆x > 0 and ∆y < 0.
Note that that the integration areas for the reference and virtual curves are ∆y and ∆y/ 1 − 4
√
Plow/ 4
p
Phigh

, respectively. By
inference, any token swap against the virtual curve can be calculated from the reference curve by taking its quotient versus the poorly
named “capital efficiency” term (Equation 59).
from
(198)
(199)
a · (a + b) =
p
Phigh −
p
Plow

·
p
Phigh −
p
Plow +
p
Plow

= Phigh − P0 (204)
52DeFi’s Concentrated Liquidity From Scratch REVIEW
Fig. 36 Initial Carbon DeFi real curve. Due to its parameterization and prior to performing any additional analysis, only the slopes
of the tangent lines at the intercepts −Phigh = −(a + b)2
and −Plow = −b2
, and the y-intercept itself, yint = z, are known.
from
(198)
(199)
b · (a + b) =
p
Plow ·
p
Phigh −
p
Plow +
p
Plow

= P0 (205)
from
(201)
(202)
(203)
y
yint
=
yint − x · P0
yint + x · (Phigh − P0)
= Eqn. 194 (206)
As was performed for the Uniswap v3 reparameterization, we will now begin the process of completely elucidating the
Carbon DeFi model commencing from its real curve description (Equations 201, 202 and 203). The objectives are the
same as before – to characterise the real, virtual, and reference curves, and recontextualize them in terms of the general
53DeFi’s Concentrated Liquidity From Scratch REVIEW
theory. First, manipulation of the Carbon DeFi invariant (Equation 201) to isolate the x and y terms yields Equations
207 and 208.
from
(201) x =
z2
a2 ·

y +
b · z
a
 −
z
a · (a + b)
(207)
from
(201) y =
z2
a2 ·

x +
z
a · (a + b)
 −
b · z
a
(208)
The token swap equations are obtained via now familiar methods. The x and y terms in Equation 201, or Equations 207
and 208 are substituted for x + ∆x and y + ∆y then rearranged to make either ∆x or ∆y the subject (Equations 209,
210 and 211).
from
(201)

x + ∆x +
z
a · (a + b)

·

y + ∆y +
b · z
a

=
z2
a2
(209)
from
(207)
(209)
∆x =
z2
a2 ·

y + ∆y +
b · z
a
 −
z
a · (a + b)
− x (210)
from
(208)
(209)
∆y =
z2
a2 ·

x + ∆x +
z
a · (a + b)
 −
b · z
a
− y (211)
Substituting the identities for x and y in Equations 207 and 208 into Equations 210 and 211 (Equations 212 and 214),
then simplifying, results in the single-dimension swap equations (Equations 213 and 215).
from
(207)
(210)
∆x =
z2
a2 ·

y + ∆y +
b · z
a
 −
z
a · (a + b)
−
z2
a2 ·

y +
b · z
a
 +
z
a · (a + b)
(212)
from
(212) ∆x = −
∆y · z2
(a · y + b · z) · (a · (y + ∆y) + b · z)
(213)
from
(208)
(211)
∆y =
z2
a2 ·

x + ∆x +
z
a · (a + b)
 −
b · z
a
−
z2
a2 ·

x +
z
a · (a + b)
 +
b · z
a
(214)
from
(214) ∆y = −
∆x · z2
· (a + b)2
(x · a · (a + b) + z) · ((x + ∆x) · a · (a + b) + z)
(215)
The swap formulas Equations 213 and 215 can also be obtained directly from their seminal counterparts, Equations
87 and 89, by substituting the scaling term, A2
· x0 · y0, and the horizontal and vertical shift terms, x0 · (A − 1) and
y0 · (A − 1), for their reparameterized forms z2
, z/(a · (a + b)), and (b · z)/a, respectively (Equations 196, 197,
198, 199, 200, 201, 202 and 203). This approach is similarly well-suited to obtaining the effective and marginal rate
equations, but as before, these identities will be elaborated according to the previously established methods. Repeating
54DeFi’s Concentrated Liquidity From Scratch REVIEW
the process demonstrated in Equations 12, 13, 14 and 15, Equations 92, 93, 94 and 95, and Equations 135, 136, 137 and
138, rearrangement of Equations 213 and 215 gives the effective rate of exchange (Equations 216 and 218), followed by
determination of the limit as the denominator goes to zero gives the instantaneous rate of exchange (i.e. the marginal
price) (Equations 217 and 219).
from
(211)
∆x
∆y
= −
z2
(a · y + b · z) · (a · (y + ∆y) + b · z)
(216)
from
(214)
∂x
∂y
= lim
∆y→0
∆x
∆y
= −
z2
(a · y + b · z)2
;
∂y
∂x
= −
(a · y + b · z)2
z2
(217)
from
(213)
∆y
∆x
= −
z2
· (a + b)2
(x · a · (a + b) + z) · ((x + ∆x) · a · (a + b) + z)
(218)
from
(216)
∂y
∂x
= lim
∆x→0
∆y
∆x
= −
z2
· (a + b)2
(x · a · (a + b) + z)
2 ;
∂x
∂y
= −
(x · a · (a + b) + z)
2
z2 · (a + b)2
(219)
The Carbon DeFi marginal rate equations can also be expressed in terms of both the x- and y-dimensions (remember,
for Carbon DeFi only the y-dimension is a token balance) via substitution of the x and y terms in Equations 13 and 15
with their horizontally or vertically shifted transformations (Equation 220). Simplifying the fractions in Equation 220
yields Equation 221.
from
(125)
(136)
(138)
∂x
∂y
= −
x +
z
a · (a + b)
y +
b · z
a
;
∂y
∂x
= −
y +
b · z
a
x +
z
a · (a + b)
(220)
from
(139)
∂x
∂y
= −
x · a · (a + b) + z
(a + b)(a · y + b · z)
;
∂y
∂x
= −
(a + b)(a · y + b · z)
x · a · (a + b) + z
(221)
Continuous summation over the price curves (Equations 217 and 219) over the interval representing the number of
tokens being swapped yields results identical to Equations 212, 213, 214 and 215. Be reminded that x and y are
functions of each other, so it is a mistake to attempt direct integration of Equation 221 without separating these variables
first (not shown).
from
(212)
(213)
(217)
∆x = −
Z y+∆y
y
z2
(a · y + b · z)2
; · ∂y =

z2
a · y + b · z
y+∆y
y
⇒ Eqns. 212 and 213 (222)
from
(214)
(215)
(219)
∆y = −
Z x+∆x
x
z2
· (a + b)2
(x · a · (a + b) + z)
2 · ∂x =

z2
· (a + b)2
x · a · (a + b) + z
x+∆x
x
⇒ Eqns. 214 and 215 (223)
Both the direct token swap by traversal upon the bonding curve y · (z + x · a · (a + b)) = z · (z − x · b · (a + b))
(Equation 202) and the integration above ∂y/∂x = −z2
· (a + b)
2
/(x · a · (a + b) + z)
2
(Equation 219) over the
interval x → x + ∆x are depicted in Figures 37 and 38.
The y-intercept of the Carbon DeFi invariant is one of its parameters, z (Equation 200), and the x-intercept is obtained
by direct substitution of y for zero in Equation 207 (Equation 224) (Figure 39). As anticipated, the quotient of yint
and xint is equal to P0 as previously observed in Equations 110 and 146 (Equation 225). The x- and y-asymptotes can
be obtained as demonstrated before, either geometrically (subtract from the origin the implied horizontal and vertical
shift parameters in Equation 201), or analytically (substitute the y- or x-component required to set the denominator of
55DeFi’s Concentrated Liquidity From Scratch REVIEW
Fig. 37 Traversal upon the rectangular hyperbola y · (z + x · a · (a + b)) = z · (z − x · b · (a + b)) (Equation 202), representing
a token swap against the Carbon DeFi real curve, where ∆x > 0 and ∆y < 0.
Equations 207 and 208 to zero) (Equations 226 and 227) (Figure 40). Consistent with prior observations (Equations 111
and 147), the quotient of the y- and x-asymptotes is equal to P0 (Equation 228).
from
(207) xint =
z
a · b
−
z
a · (a + b)
=
z
b · (a + b)
(224)
from
(200)
(205)
(224)
yint
xint
= b · (a + b) = P0 (225)
56DeFi’s Concentrated Liquidity From Scratch REVIEW
Fig. 38 The integration above ∂y/∂x = −z2
· (a + b)2
/(x · a · (a + b) + z)2
(Equation 219) over the interval x → x + ∆x
representing a token swap against the Carbon DeFi real curve,where ∆x > 0 and ∆y < 0.
from
(208) xasym = −
z
a · (a + b)
(226)
from
(206) yasym = −
b · z
a
(227)
from
(224)
(225)
yasym
xasym
= b · (a + b) = P0 (228)
57DeFi’s Concentrated Liquidity From Scratch REVIEW
Fig. 39 The x- and y-intercepts of the Carbon DeFi real curve are annotated on the appropriate axes (Equations 200 and 224), and
the algebraic identity for the first derivative of the curve evaluated at these points (via Equations 198 and 199), and their geometric
mean (Equation 205), are illustrated with annotated tangent lines to the curve.
## 4.5 The Carbon DeFi Virtual Curve
The process of characterizing the Carbon DeFi virtual curve is essentially identical to that demonstrated for the Bancor
v2 and Uniswap v3 virtual curves (Equations 112, 113, 114, and 115; and 160, 161, 162, 163, 164, 165, 166, 167, 168,
and 169). First, the max(xv), min(xv), max(yv), and min(yv) coordinates are obtained by reversing the horizontal
and vertical shifts implied by the real curve description (Equations 229, 230, 233 and 234), then locating “center” by
evaluating the geometric means of the virtual curve boundaries (Equations 232 and 236) (Figure 41). Lastly, the mystery
constant C is confirmed by taking the quotient of the maximum and minimum bounds in both dimensions (Equations
237 and 238).
58DeFi’s Concentrated Liquidity From Scratch REVIEW
Fig. 40 The horizontal and vertical asymptotes of the Carbon DeFi virtual and reference curves, and its real curve (Equations 226
and 227), are depicted with dotted lines and their coordinates are annotated appropriately. While we have not yet approached the
characterization of the reference and virtual curves, it is trivial that their asymptotes are at zero.
from
(224)
(226)
max(xv) = (xint − xasym) =
z
b · (a + b)
+
z
a · (a + b)
=
z
a · b
(229)
from
(226) min(xv) = (0 − xasym) =
z
a · (a + b)
(230)
from
(229)
(230)
max(xv) · min(xv) =
z
a · b
·
z
a · (a + b)
=
z2
a2 · b · (a + b)
(231)
59DeFi’s Concentrated Liquidity From Scratch REVIEW
from
(231)
p
max(xv) ·
p
min(xv) =
z
a ·
p
b · (a + b)
(232)
from
(200)
(227)
max(yv) = (yint − yasym) = z +
b · z
a
=
z · (a + b)
a
(233)
from
(227) min(yv) = (0 − yasym) =
b · z
a
(234)
from
(233)
(234)
max(yv) · min(yv) =
z · (a + b)
a
·
b · z
a
=
z2
· b · (a + b)
a2
(235)
from
(235)
p
max(yv) ·
p
min(yv) =
z ·
p
b · (a + b)
a
(236)
from
(229)
(230)
max(xv)
min(xv)
=
z
a · b
z
a · (a + b)
=
a + b
b
=
p
Phigh
√
Plow
= C (237)
from
(233)
(234)
max(yv)
min(yv)
=
z · (a + b)
a
b · z
a
=
a + b
b
=
p
Phigh
√
Plow
= C (238)
To complete the characterization of the real curve (and begin characterizing the reference curve), the identities of
x0 and y0 must be acquired by compensating for the shift parameter (equivalent to xasym and yasym) with respect to
the “center” coordinates of the virtual curve (i.e., the geometric means of min(xv) and max(xv), and min(yv) and
max(yv)). Reversing the shift (Equations 239 and 241) then simplifying (Equations 240 and 242) yields the identities
of x0 and y0 in terms of a, b, and z. In both cases, the simplified forms, as well as a seemingly unnecessary expansion
of b · (a + b) into the square of its square root, are presented. The simplified versions are innocuous with respect to the
annotation of the real curve; however, the expanded version reveals a continued pattern with respect to the reference
curve capstone identities. Both are used in their appropriate contexts.
With these coordinates, the characterization of the real curve is now complete (Figure 42).
from
(226)
(232)
x0 =
p
max(xv) ·
p
min(xv) + xasym =
z
a ·
p
b · (a + b)
−
z
a · (a + b)
(239)
from
(239) x0 =
z ·
p
b · (a + b) − b

a · b · (a + b)
=
z
a ·
p
b · (a + b)
·
p
b · (a + b) − b
p
b · (a + b)
(240)
from
(227)
(236)
y0 =
p
max(yv) ·
p
min(yv) + yasym =
z ·
p
b · (a + b)
a
−
b · z
a
(241)
from
(241) y0 =
z ·
p
b · (a + b) − b

a
=
z ·
p
b · (a + b)
a
·
p
b · (a + b) − b
p
b · (a + b)
(242)
60DeFi’s Concentrated Liquidity From Scratch REVIEW
Fig. 41 The completed characterisation of the Carbon DeFi virtual curve, with the coordinates at its price bounds and geometric
mean of the price bounds annotated as appropriate (Equations 229, 230, 232, 233, 234 and 236).
Similar to the Uniswap v3 curve constructions and in contrast to the Bancor v2 constructions, we have derived the
virtual curve beginning from the shifted real curve. Regardless, it is still appropriate to define the real curve in terms of
the virtual curve and the horizontal and vertical shifts (Figure 43).
To complete the virtual curve characterization, recall that it is just a regular rectangular hyperbola. Its scaling constant
can be obtained directly from inspection of the RHS of Equation 201, or from the product of any set of coordinates along
the curve, (e.g., min(xv)·max(yv), max(xv)·min(yv), or
p
max(xv)·
p
min(xv)·
p
max(yv)·
p
min(yv)) (Equation
243). Then, elaboration of the marginal price and token swap equations is performed as was done for Equations 26, 27,
28, 29, 30, 31, 32, 33, 34 and 35 and Equations 178, 179, 180, 181, 182, 183, 184, and 185 (Equations 243, 244, 245,
246, 247, 248, 249, and 250).
from
(2) xv · yv =
z
a ·
p
b · (a + b)
·
z ·
p
b · (a + b)
a
=
z2
a2
(243)
61DeFi’s Concentrated Liquidity From Scratch REVIEW
Fig. 42 Completed characterizations of the Carbon DeFi real and virtual curves are depicted and annotated appropriately
(Equations 200, 224, 229, 230, 232, 233, 234, 236, 240 and 242).
from
(8) yv =
z2
a2 · xv
(244)
from
(6) xv =
z2
a2 · yv
(245)
from
(3) (xv + ∆x) · (yv + ∆y) =
z2
a2
(246)
from
(4)
(7)
∆x =
z2
a2 · (yv + ∆y)
− xv = −
∆y · z2
a2 · (yv · (yv + ∆y))
(247)
62DeFi’s Concentrated Liquidity From Scratch REVIEW
Fig. 43 Reconstruction of the Carbon DeFi real curve is depicted as a map of the virtual curve back to the x- and y-axes.
from
(5)
(9)
∆y =
A2
· z2
a2 · (xv + ∆x)
− yv = −
∆x · z2
a2 · (xv · (xv + ∆x))
(248)
from
(16)
∂xv
∂yv
= −
z2
a2 · y2
v
;
∂yv
∂xv
= −
a2
· y
2
v
z2
(249)
from
(17)
∂yv
∂xv
= −
z2
a2 · x2
v
;
∂xv
∂yv
= −
a2
· x
2
v
z2
(250)
The indifference of the real and virtual curves with respect the calculated swap quantities is again evident in the analysis
(Figures 44 and 45). Translocation upon the integrated forms (i.e. the bonding curves, Figure 44) and integration above
their implied price curves (Figure 45) yields the same token amounts, ∆x and ∆y. The only difference is the frame of
63DeFi’s Concentrated Liquidity From Scratch REVIEW
reference, which is shifted by (−xasym, −yasym) in the virtual curve compared to the real curve, which has no effect
on either the marginal rate, or the effective rate of exchange. As with Uniswap v3, Carbon Defi exposes the terms
necessary to adapt legacy software that is dependent on the x · y = k assumption; simply read z and a from the smart
contracts and k becomes the square of their quotient, k = (z/a)
2
.
Fig. 44 Traversal upon the rectangular hyperbolas y · (z + x · a · (a + b)) = z · (z − x · b · (a + b)) and xv · yv = z2
/a2
(Equations 202 and 243), representing a token swap against the Carbon DeFi real and virtual curves, where ∆x > 0 and ∆y < 0.
The swap quantities ∆x and ∆y, and marginal rates of exchange before and after the swap are identical. Therefore, with respect to
the outcome of the exchange the difference between the two curve implementations is zero.
## 4.6 The Carbon DeFi Reference Curve
The Carbon DeFi reference curve is constructed according to the general methods established above. The product of
x0 and y0 is equal to its scaling constant (i.e. k in the proverbial “constant product” equation, x · y = k), and can be
obtained from the RHS of Equations 240 and 242 (Equations 251 and 252). The form the expression takes in Equation
252 is to make the re-scaling of the reference curve with respect to the virtual curve obvious, which also allows for the
original amplification term, A, to be extracted and represented in terms of a, b, and z (Equations 59, 252 and 253).
64DeFi’s Concentrated Liquidity From Scratch REVIEW
Fig. 45 The integration above ∂y/∂x = −z2
· (a + b)2
/(x · a · (a + b) + z)2
and ∂yv/∂xv = −z2
/(a · xv)2
(Equations 219
and 250) over the intervals x → x + ∆x and x + z/(a · (a + b)) → x + z/(a · (a + b)) + ∆x (i.e. xv → xv + ∆x) representing
a token swap against both the real and virtual curves, where ∆x > 0 and ∆y < 0. Apart from the shift along the x-axis, these are
identical in every other aspect. Note that the relationship between the real and virtual price curves is additive (x and ∆x versus
x + z/(a · (a + b)) and x + z/(a · (a + b)) + ∆x).
from
(2)
(240)
(242)
x · y =
z ·
p
b · (a + b) − b

a · b · (a + b)
·
z ·
p
b · (a + b) − b

a
(251)
from
(251) x · y =
z2
·
p
b · (a + b) − b
2
a2 · b · (a + b)
=
z2
a2
·
p
b · (a + b) − b
p
b · (a + b)
!2
(252)
65DeFi’s Concentrated Liquidity From Scratch REVIEW
from
(59)
(199)
(205)
(252)
p
b · (a + b)
p
b · (a + b) − b
=
√
P0
√
P0 −
√
Plow
⇒
4
p
Phigh
4
p
Phigh − 4
√
Plow
= A (253)
With the reference curve’s scaling constant now defined in terms of a, b, and z, the coordinates corresponding to the
price bounds, min(x), max(x), min(y), and max(y), can also be expressed with the same parameters. As was done
for the Uniswap v3 case, we will approach this analytically. First, the derivative of the reference curve (Equations
16 and 17) is forced to either −Phigh or −Plow; in the Carbon DeFi parameterization, Plow = b2
and Phigh = (a + b)
2
.
Then, the x or y variable is substituted for min(x), max(x), min(y), or max(y), as appropriate, and the coordinate of
interest is obtained via trivial rearrangements of the resulting expressions (Equations 254, 255, 256, 257, 258, 259, 260,
and 261) (Figure 46).
from
(17)
(252)
∂y
∂x
= −(a + b)2
= −
z2
a2
·
p
b · (a + b) − b
p
b · (a + b)
!2
min2
(x)
(254)
from
(254) min(x) =
z
a · (a + b)
·
p
b · (a + b) − b
p
b · (a + b)
!
(255)
from
(17)
(252)
∂y
∂x
= −b2
= −
z2
a2
·
p
b · (a + b) − b
p
b · (a + b)
!2
max2(x)
(256)
from
(256) max(x) =
z
a · b
·
p
b · (a + b) − b
p
b · (a + b)
!
(257)
from
(16)
(252)
∂y
∂x
= −b2
= −
min2
(y)
z2
a2
·
p
b · (a + b) − b
p
b · (a + b)
!2 (258)
from
(258) min(y) =
z · b
a
·
p
b · (a + b) − b
p
b · (a + b)
!
(259)
from
(16)
(252)
∂y
∂x
= −(a + b)2
= −
max2
(y)
z2
a2
·
p
b · (a + b) − b
p
b · (a + b)
!2 (260)
from
(260) max(y) =
z · (a + b)
a
·
p
b · (a + b) − b
p
b · (a + b)
!
(261)
As with the Uniswap v3 constructions, the Carbon DeFi constructions have been performed in the reverse order
compared to the seminal work (Figures 1 to 21). However, the liquidity amplification heuristic is still useful, and can be
66DeFi’s Concentrated Liquidity From Scratch REVIEW
Fig. 46 The algebraic identities of the points where the lines tangent to the Carbon DeFi reference curve and parallel to the tangent
lines at the price boundaries of the virtual curve are now elucidated (Equations 240, 242, 255, 257, 259 and 261).
depicted as before with arrows connecting pairs of points on the reference and virtual curves, where the derivatives
evaluated at these points are equal (Figure 47).
Trade volumes between reference and virtual curves within the same price range are compared (Figures 48 and 49).
Despite trading at the same marginal and effective exchange rates, the virtual curve shows significantly higher trade
volumes, as seen by longer arrows in Figure 48 and a larger integrated area in Figure 49.
This concludes our examination of the Carbon DeFi curves, and the section on “unnatural” parameterizations. The
critical algebraic identities for all three protocols examined here (Bancor’s v2 and Carbon DeFi, and Uniswap’s v3)
are tabulated in Table 1, which provides something akin to a concentrated liquidity Rosetta stone, allowing for direct
translation of key parameters between the contexts wherein each protocol resides. Remember - from the analytical and
geometric perspectives, all three descriptions are mathematically redundant. Their apparent differences emerge from
the choice of notation and parameterization, which only reflects their smart contract implementation; the underlying
pricing algorithm remains unchanged in all three.
## 5 The “Natural” Reparameterizations of the Concentrated Liquidity Invariant Function
The previous sections are referred to as the “unnatural” parameterizations because the way they are constructed is
artificial; they are created by deliberately asserting something, such as the relative amplification of the virtual curve
compared to the reference curve, the price bounds, or one of the intercepts of the real curve, whereas a “natural”
construction might begin at a more fundamental level, free from the context of the protocol for which it is being defined.
67DeFi’s Concentrated Liquidity From Scratch REVIEW
Fig. 47 The amplification process is depicted with corresponding shaded areas of the Carbon DeFi reference and virtual curves,
respectively. Points where the first derivative of each curve evaluates to the same result are shown as white dots, and the mapping of
these points is depicted with white arrows.
Withthatsaid, itisnotimmediatelyclearhowtogoaboutobtainingthenaturaldescriptionoftheseobjects. Contributions
of an academic nature are often presented as though one already possessed the intuition and depth of understanding to
have arrived at what is disclosed, effortlessly. That was not the case here. In fact the opposite is true – a conspicuously
compact set of equations for the concentrated real curve was discovered first, and their connection to more fundamental
concepts was found later while investigating their significance.
The following sections are [mostly] presented in chronological order with respect to the investigation of this topic
material, which has the benefit of a top-down trajectory towards the underlying hyperbolic trigonometry of these curves.
## 5.1 Three “Pretty” Invariants
In Section 3.1, following the discussion of amplification term, A, expressed with respect to the price boundaries, Phigh
and Plow, (Equations 57, 58 and 59), it was stated that there is a more conspicuous identity, C, which almost seems
as though it wants to assert its own existence (Equations 60, 61, 62, 63 and 64). This term itches, and its persistence
motivates a refactorization which includes it as a native parameter. Beginning from the seminal concentrated liquidity
function (Equation 80), and the xint, yint, xasym, and yasym identities derived therefrom (Equations 106, 107, 108 and
109), it is a relatively easy task to identify A, A−1, and 2A−1 as key terms which will need to be defined with respect
to C. Note that this process alone begins to reveal a symmetry that was hidden there all along (Equations 262, 263 and
264).
68DeFi’s Concentrated Liquidity From Scratch REVIEW
Fig. 48 Traversal upon the rectangular hyperbolas xv · yv = z2
/a2
and x · y = z2
·
√
b
√
a + b − b
2
/ a2
· b · (a + b)

(Equations 243 and 252), representing a token swap against the reference and amplified liquidity pool, where ∆x > 0 and ∆y < 0.
The marginal rates of exchange before and after the swap are identical. The ratio of the ∆x and ∆y arrow lengths for each curve are
also identical. Therefore the overall rate of exchange, ∆y/∆x is equal in both cases.
from
(60)
(61)
(62)
(63)
(64)
A =
1
1 −
4
√
Plow
4
p
Phigh
=
4
p
Phigh
4
p
Phigh − 4
√
Plow
=
√
C + 1
C − 1
+ 1 =
√
C
√
C − 1
(262)
from
(60)
(61)
(62)
(63)
(64)
A − 1 =
1
4
p
Phigh
4
√
Plow
− 1
=
4
√
Plow
4
p
Phigh − 4
√
Plow
=
√
C + 1
C − 1
=
1
√
C − 1
(263)
from
(262)
(263)
2A − 1 =
1
1 −
4
√
Plow
4
p
Phigh
+
1
4
p
Phigh
4
√
Plow
− 1
=
4
p
Phigh + 4
√
Plow
4
p
Phigh − 4
√
Plow
=
√
C + 1
2
C − 1
=
√
C + 1
√
C − 1
(264)
69DeFi’s Concentrated Liquidity From Scratch REVIEW
Fig. 49 The integration above ∂y/∂x = −z2
·
√
b ·
√
a + b − b
2
/ a2
· b · (a + b) · x2

and ∂yv/∂xv = −z2
/(a · xv)2
over
the intervals x → x + ∆x and x ·
√
b ·
√
a + b/
√
b ·
√
a + b − b

→ (x + ∆x) ·
√
b ·
√
a + b/
√
b ·
√
a + b − b

(i.e.
xv → xv + ∆x) representing a token swap against both the reference and amplified liquidity pools, where ∆x > 0 and ∆y < 0
(∂/∂x Equation 252 and Equation 250). Note that that the integration areas for the reference and virtual curves are ∆y and
∆y ·
√
b ·
√
a + b/
√
b ·
√
a + b − b

, respectively. By inference, any token swap against the virtual curve can be calculated from
the reference curve by applying the amplification term (Equations 59 and 253).
Incorporating the identities of A and A − 1 in terms of C (Equations 262 and 263) from above into the seminal Bancor
v2 invariant (Equation 80) yields Equation 265, and its rearrangement to isolate C yields Equation 266.
70DeFi’s Concentrated Liquidity From Scratch REVIEW
Table 1 Summary of the real curve capstone identities for Bancor v2, Uniswap v3, and Carbon DeFi, in their native
parameterizations.
from
(80)
(262)
(263)

x +
x0
√
C − 1

·

y +
y0
√
C − 1

=
x0 · y0 · C
√
C − 1
2 (265)
from
(265)
(x − x0)
2
· (y − y0)
2
(x · y − x0 · y0)
2 = C (266)
After that, rearrangement of Equations 106 and 107 to express x0 and y0 in terms of A, xint and yint (Equation 267)
followed by their substitution into the general invariant (Equation 80) yields Equation 268. Then, substitution of the A,
A−1 and 2A−1 terms from Equations 262, 263 and 264 as needed yields Equation 269, which after rearrangement to
isolate C yields Equation 270.
71DeFi’s Concentrated Liquidity From Scratch REVIEW
from
(106)
(107)
x0 = xint ·
(A − 1)
(2A − 1)
; y0 = yint ·
(A − 1)
(2A − 1)
(267)
from
(80)
(267)
x + xint ·
(A − 1)
2
(2A − 1)
!
· y + yint ·
(A − 1)
2
(2A − 1)
!
= xint · yint ·
A2
· (A − 1)
2
(2A − 1)2
(268)
from
(262)
(263)
(264)
(268)

x +
xint
C − 1

·

y +
yint
C − 1

=
xint · yint · C
(C − 1)2
(269)
from
(269)
(xint − x) · (yint − y)
x · y
= C (270)
Lastly, rearrangement of Equations 108 and 109 to express xasym and yasym in terms of A, xint and yint (Equation 271)
followed by their substitution into the general invariant (Equation 80) yields Equation 272. In contrast to Equations 80
and 268, Equation 272 features A2
/(A − 1)
2
as the only term requiring substitution, which has already been proved to
be equal to C (Equations 60, 61, 62, 63 and 64). Therefore, effective replacement of the A terms to yield Equation 273
can be performed without reference to Equations 262, 263 and 264. Then, rearrangement to isolate C yields Equation
274.
from
(108)
(109)
x0 = −
xasym
(A − 1)
; y0 = −
yasym
(A − 1)
(271)
from
(80)
(271)
(x − xasym) · (y − yasym) = xasym · yasym ·
A2
(A − 1)
2 (272)
from
(60)
(61)
(62)
(63)
(64)
(272)
(x − xasym) · (y − yasym) = xasym · yasym · C (273)
from
(273)
(x − xasym) · (y − yasym)
xasym · yasym
= C (274)
Note that Equations 266, 270 and 274 are conspicuously simple, even “pretty”, at least compared to the status quo
for the “unnatural” archetypes in the previous sections. Moreover, they are all equal to each other (Equation 275).
Combined with the other identities already proven (and implied) earlier in Equations 63, 64, 77, 78, 116, 117, 170, 171,
237 and 238 (Equation 276), we are starting to approach something akin to an algebraic universal translator for any
concentrated real curve, regardless of its parameterization. While this is certainly not the only way to achieve this (e.g.
Table 1), there is something peculiarly terse about this one, and its prettiness hints at something more fundamental.
from
(273)
(x − x0)
2
· (y − y0)
2
(x · y − x0 · y0)
2 =
(xint − x) · (yint − y)
x · y
=
(x − xasym) · (y − yasym)
xasym · yasym
= C (275)
from
(273)
yasym − yint
yasym
=
xasym − xint
xasym
=
(yasym − y0)
2
y2
asym
=
(xasym − x0)
2
x2
asym
=
p
Phigh
√
Plow
= C (276)
72DeFi’s Concentrated Liquidity From Scratch REVIEW
## 5.2 Transforming and Normalizing the Curves in a New Coordinate System
The analysis in the following section employs the hyperbolic trigonometry functions. However, these functions are only
defined for a unit hyperbola, which opens to the left and the right, with its vertices at (−1, +1). Therefore, we have two
options. Either we redefine these functions to operate in the native parameter space of the bonding curves, or transform
the bonding curves into a compatible representation. There is fundamentally no difference between either option, only a
difference of perspective and intuition. Since the hyperbolic trigonometry functions are relatively exotic and given that
transforming the curves is a core theme of this exploration, we are going to operate on the curves themselves and then
apply the trigonometric analysis on their transformed versions.
This part of the exercise begins by first returning to the standard x · y = x0 · y0 curve. Prior to the hyperbolic
trigonometric analysis, we must first perform a rotation about the origin and then re-scale to create a unit hyperbola.
The rotation is −45
◦
(a clockwise rotation is negative), or −π/4 radians. Therefore, the transformation matrix, R−45
◦ ,
is derived from the general rotation matrix (Equation 277) by substituting θ = −π/4 (Equation 278).
R =

cos(θ) −sin(θ)
sin(θ) cos(θ)

(277)
from
(277) R−45
◦ =




cos

−
π
4

−sin

−
π
4

sin

−
π
4

cos

−
π
4




 =





1
√
2
−
1
√
2
1
√
2
1
√
2





(278)
The above matrix can be used to apply the transformation on all points (x, y) on the curve x · y = x0 · y0 as follows
(Equation 279):
from
(278)

t
u

= R−45
◦ ·

x
y

=





1
√
2
−
1
√
2
1
√
2
1
√
2





·

x
y

=




x
√
2
+
y
√
2
−
x
√
2
+
y
√
2



 (279)
Therefore, any set of coordinates (x, y) is transformed to (t, u), thus rotating the x · y = x0 · y0 curve 45
◦
clockwise
(Equations 280 and 281). The overall process is depicted in Figure 50.
from
(279) t = fx,y→t(x,y) =
x + y
√
2
(280)
from
(279) u = fx,y→u(x,y) =
y − x
√
2
(281)
As we have done previously in the context of swap equations and marginal price formulas, we can reduce the dimensions
needed for performing the rotation such that the transformation can be performed with reference only to one coordinate
in the set by substituting the identities of x and y (Equations 6 and 8) as required to eliminate the opposite dimension,
denoted by fx→t and fy→u. In other words, t can be expressed entirely as a function of x (Equation 282) and u can be
expressed entirely as a function of y (Equation 283).
from
(8)
(280)
t = fx→t(x) =
x +
x0 · y0
x √
2
=
x2
+ x0 · y0
x ·
√
2
(282)
from
(6)
(281)
u = fy→u(y) =
y −
x0 · y0
y
√
2
=
y2
− x0 · y0
y ·
√
2
(283)
73DeFi’s Concentrated Liquidity From Scratch REVIEW
Fig. 50 A general depiction of coordinate system transformation and rotation. This figure visualizes the transformation and rotation
of a coordinate system from the standard Cartesian x- and y-axes to a rotated system denoted by t- and u- axes. Arrows indicate the
direction of rotation from each of the Cartesian axes (x, y) to the new rotated axes (t, u), mimicking the motion of a steering wheel
as it turns to the right. Note that the hyperbola drawn in the left panel opens towards the bottom-left and top-right quadrants, whereas
the hyperbola drawn in the right panel opens towards the left and right. The equation of the hyperbola in the left subplot is of the
form x · y = k, which after the linear transform becomes t2
− u2
= 2 · k.
We can also map y to t (fy→t), and x to u (fx→u) (Equations 282 and 283); we can use both forms to prove the invariant
equation of the transformed hyperbola, which opens to the left and right in the t dimension.
from
(6)
(280)
t = fy→t(y) =
x0 · y0
y
+ y
√
2
=
x0 · y0 + y2
y ·
√
2
(284)
from
(8)
(281)
u = fx→u(x) =
x0 · y0
x
− x
√
2
=
x0 · y0 − x2
x ·
√
2
(285)
Then, to obtain the identity of the transformed hyperbola, which has the form t2
− u2
= 2 · k, we can substitute the
reduced-dimensions expressions for t and u from either Equations 282 and 285, or Equations 283 and 284; the pair
of expressions used must eliminate the remaining x or y dimension, which yields the transformed invariant equation
entirely in its native dimensions t and u (Equations 286 and 287). Alternatively, the x0 · y0 terms can be substituted for
its identity x · y Equation 2, which delivers the same result. Remember, x0 and y0 are constants; while the notation
references the x and y dimensions, the values themselves are not dependent on them. Therefore Equations 286 and 287
are truly two-dimensional, not four-dimensional expressions.
from
(282)
(285)
t2
− u2
=
x2
+ x0 · y0
2
2 · x2
−
x0 · y0 − x2
2
2 · x2
= 2 · x0 · y0 (286)
from
(283)
(284)
t2
− u2
=
x0 · y0 + y2
2
2 · y2
−
y2
− x0 · y0
2
2 · y2
= 2 · x0 · y0 (287)
Our objective is now to apply this rotation to the key points defining the reference and virtual curves (Figure 51).
The elements of the real curve that inform this analysis are implicit; to incorporate the real curve into the following
74DeFi’s Concentrated Liquidity From Scratch REVIEW
derivations, simply scale it down in-place (i.e. without moving the point at (x0, y0)) to become the reference curve or
reverse its horizontal and vertical shifts to become the virtual curve as we have done previously (Equations 160, 162,
164, 165, 167, 169, 229, 230, 232, 233, 234 and 236). The analysis being performed here for either of the reference or
virtual curves, individually, generalize to each other, and by extension, also to the real curve. Therefore, as with much
of the work demonstrated in this document, performing these steps for both the reference and virtual curves is done for
its pedagogical benefit and not necessarily because it is required by the analysis. The analysis can be completed with
only one of these.
Fig. 51 The key identities associated with the reference and virtual curves are drawn with rays emanating from the origin, which
enclose a shaded region. The desired linear transformation (Equation 279) is depicted with arrows beginning from these same points
in the Cartesian (x, y) plane, and ending at their implied destinations in the new coordinate system (t, u). The transformation from
the (x, y) to the (t, u) coordinates is represented as an apparent −45
◦
rotation between the left and right panels of the figure.
The redundancy produced by the dimension reduction in Equations 284, 285, 286 and 287 means that the transformation
from the Cartesian (x, y) plane to the new (t, u) coordinate system can be performed in at least three different ways.
Either both the x and y coordinates can be used as arguments (Equations 280 and 281), or only one of the x or y
coordinates can be used as arguments (Equations 282 and 285, and Equations 283 and 284, respectively). This is
easily demonstrated. Recall that the point (x0, y0) lies on the reference curve (Figure 2). To obtain its transformed t
coordinate, the result of passing both x0 and y0 as arguments to Equation 280 is identical to passing only x0 to Equation
282 and passing only y0 to Equation 284 (Equation 288). Similarly, to obtain its transformed u coordinate, the result of
passing both x0 and y0 as arguments to Equation 281 is identical to passing only x0 to Equation 283 and passing only
y0 to Equation 285 (Equation 289).
75DeFi’s Concentrated Liquidity From Scratch REVIEW
from
(280)
(282)
(284)
fx,y→t (x0,y0) = fx→t (x0) = fy→t (y0) =
x0 + y0
√
2
(288)
from
(281)
(283)
(285)
fx,y→u (x0,y0) = fx→u (x0) = fy→u (y0) =
y0 − x0
√
2
(289)
The remainder of this part of the exercise will use the two-argument functions, Equations 280 and 281. Just know this is
a completely arbitrary decision and it makes no difference whatsoever if you would prefer to use the single-argument
alternatives. Substituting the other key identities previously obtained for the reference curve (Equations 65, 66, 67 and
68) into Equations 280 and 281 yields their transformed (u, t) coordinates (Equations 290, 291, 292 and 293).
from
(65)
(66)
(280)
fx,y→t (min(x),max(y)) =
x0 · (A − 1)
A
+
A · y0
A − 1 √
2
=
x0 · (A − 1)
2
+ A2
· y0
√
2 · A · (A − 1)
(290)
from
(65)
(66)
(281)
fx,y→u (min(x),max(y)) =
A · y0
A − 1
−
x0 · (A − 1)
A √
2
=
A2
· y0 − x0 · (A − 1)
2
√
2 · A · (A − 1)
(291)
from
(67)
(68)
(280)
fx,y→t (max(x),min(y)) =
A · x0
A − 1
+
y0 · (A − 1)
A √
2
=
A2
· x0 + y0 · (A − 1)
2
√
2 · A · (A − 1)
(292)
from
(67)
(68)
(281)
fx,y→u (max(x),min(y)) =
y0 · (A − 1)
A
−
A · x0
A − 1 √
2
=
y0 · (A − 1)
2
− A2
· x0
√
2 · A · (A − 1)
(293)
Then, via the same process, substituting the other key identities previously obtained for the virtual curve (Equations 36,
37, 38, 39, 52 and 54) into Equations 280 and 281 yields their transformed (u, t) coordinates (Equations 294, 295, 296,
297, 298 and 299).
from
(52)
(54)
(280)
fxv,yv→tv (A · x0, A · y0) =
A · (x0 + y0)
√
2
(294)
from
(52)
(54)
(281)
fxv,yv→uv (A · x0, A · y0) =
A · (y0 − x0)
√
2
(295)
from
(36)
(37)
(280)
fxv,yv→tv (min(xv),max(yv)) =
x0 · (A − 1) +
A2
· y0
A − 1 √
2
=
x0 · (A − 1)
2
+ A2
· y0
√
2 · (A − 1)
(296)
from
(36)
(37)
(281)
fxv,yv→uv (min(xv),max(yv)) =
A2
· y0
A − 1
− x0 · (A − 1)
√
2
=
A2
· y0 − x0 · (A − 1)
2
√
2 · (A − 1)
(297)
76DeFi’s Concentrated Liquidity From Scratch REVIEW
from
(38)
(39)
(280)
fxv,yv→tv
(max(xv),min(yv)) =
A2
· x0
A − 1
+ y0 · (A − 1)
√
2
=
A2
· x0 + y0 · (A − 1)
2
√
2 · (A − 1)
(298)
from
(38)
(39)
(281)
fxv,yv→uv
(max(xv),min(yv)) =
y0 · (A − 1) −
A2
· x0
A − 1 √
2
=
y0 · (A − 1)
2
− A2
· x0
√
2 · (A − 1)
(299)
Turning our attention back to the plot, the algebraic identities derived in Equations 290, 291, 292, 293, 294, 295, 296,
297, 298 and 299 have been appended as point annotations in Figure 52.
Fig. 52 The reference and virtual curves are depicted before and after the linear −45
◦
transformation has been applied. The
capstone identities from both curves appear as annotations in (x, y) and (u, t) format in the left and right panels, respectively
(Equations 288, 289, 290, 291, 292, 293, 294, 295, 296, 297, 298 and 299).
Unsurprisingly, even in the transformed coordinate system, the difference between corresponding points on the virtual
and reference curves is a factor of A (because of course it is!). For completeness, the invariant for the transformed virtual
curve is proved by substitution of the reference curve x·y = x0 ·y0 (Equation 2) for the virtual curve x·y = A2
·x0 ·y0
77DeFi’s Concentrated Liquidity From Scratch REVIEW
(Equation 26) while repeating the process detailed in Equations 282, 283, 284, 285, 286 and 287, which yields Equation
300.
from
(282)
(285)
t2
v − u2
v = 2 · A2
· x0 · y0 (300)
Following the rotation, the hyperbola must then be rescaled (i.e. normalized) into unit format such that its vertices lie at
t ± 1. To capture this re-scaling in situ, let the re-scaled t and u coordinates be t̂ and û, respectively. Then, the goal is
to define t̂ and û in terms of x and y, and xv, and yv, respectively, such that t̂2
− û2
= 1 in both cases. This is easily
achieved by taking the quotient of the LHS and RHS of Equation 286 or Equation 287 for x and y, and the quotient of
the LHS and RHS of Equation 286 for xv and yv (Equation 301). Distributing the division and leveraging the properties
of exponents and radicals yields Equations 302 and 303. In both cases, the LHS and RHS of the equality are expressed
as a difference of squares and the identities of t̂ and û can be obtained by asserting a literal 1:1 correspondence between
the minuends and subtrahends on either side. In our context this is okay – but note that the abstraction a − b = c − d,
therefore a = c and b = d is not always true. The equation for the hyperbola in its rescaled form directly leads to the
new definitions of t̂ and û, and because we are applying the transformation uniformly to both sides of the equation, the
equality and the relationship between the variables is maintained in this case (Equations 304 and 305).
from
(286)
(287)
(300)
t̂2
− û2
= 1 =
t2
− u2
2 · x0 · y0
=
t2
v − u2
v
2 · A2 · x0 · y0
(301)
from
(286)
(287)
(301)
t̂2
− û2
=
t
√
2 ·
√
x0 ·
√
y0
!2
−
u
√
2 ·
√
x0 ·
√
y0
!2
(302)
from
(300)
(301)
t̂2
− û2
=
tv
√
2 · A ·
√
x0 ·
√
y0
!2
−
uv
√
2 · A ·
√
x0 ·
√
y0
!2
(303)
from
(302)
(303)
t̂ =
t
√
2 ·
√
x0 ·
√
y0
=
tv
√
2 · A ·
√
x0 ·
√
y0
(304)
from
(302)
(303)
û =
u
√
2 ·
√
x0 ·
√
y0
=
uv
√
2 · A ·
√
x0 ·
√
y0
(305)
By establishing this correspondence, we effectively align the structure of the hyperbola’s equation in its original and
transformed states. This allows for the direct inference of t̂ and û from x and y, and xv, and yv, respectively, adhering
to the normalization criterion t̂2
− û2
= 1. From here, the new single-argument mapping functions, fx→t̂, fy→û,
fy→t̂, fx→û, fxv→t̂, fyv→û, fyv→t̂, and fxv→û can be derived from the previous mapping functions without any trouble
(Equations 306, 307, 308, 309, 310, 311, 312 and 313). The two-argument expressions, fx,y→t̂, fx,y→û, fxv,yv→t̂, and
fxv,yv→û can be recomposed from their single-argument counterparts by substitution of x0 · y0 for x · y in the reference
curve transformation, and substitution of A2
· x0 · y0 for x · y in the virtual curve transformation, via Equations 2 and
26 (Equations 314 and 315). Rather pleasingly, the two-argument reference- and virtual-to-unit hyperbola mapping
functions are identical. You won’t have to think about it for too long to convince yourself that this is an obvious result.
from
(282)
(304)
t̂ = fx→t̂(x) =
fx→t
√
2 ·
√
x0 ·
√
y0
=
x2
+ x0 · y0
2 · x ·
√
x0 ·
√
y0
(306)
from
(283)
(305)
û = fy→û(y) =
fy→u
√
2 ·
√
x0 ·
√
y0
=
y2
− x0 · y0
2 · y ·
√
x0 ·
√
y0
(307)
78DeFi’s Concentrated Liquidity From Scratch REVIEW
from
(284)
(304)
t̂ = fy→t̂(y) =
fy→t
√
2 ·
√
x0 ·
√
y0
=
x0 · y0 + y2
2 · y ·
√
x0 ·
√
y0
(308)
from
(285)
(305)
û = fx→û(x) =
fx→u
√
2 ·
√
x0 ·
√
y0
=
x0 · y0 − x2
2 · x ·
√
x0 ·
√
y0
(309)
from
(284)
(302)
t̂ = fxv→t̂ (xv) =
fxv→tv
√
2 · A ·
√
x0 ·
√
y0
=
x2
v + A2
· x0 · y0
2 · xv · A ·
√
x0 ·
√
y0
(310)
from
(285)
(302)
û = fyv→û (yv) =
fyv→uv
√
2 · A ·
√
x0 ·
√
y0
=
y2
v − A2
· x0 · y0
2 · yv · A ·
√
x0 ·
√
y0
(311)
from
(284)
(302)
t̂ = fyv→t̂ (yv) =
fyv→tv
√
2 · A ·
√
x0 ·
√
y0
=
A2
· x0 · y0 − y2
v
2 · yv · A ·
√
x0 ·
√
y0
(312)
from
(285)
(302)
û = fxv→û (xv) =
fxv→uv
√
2 · A ·
√
x0 ·
√
y0
=
A2
· x0 · y0 − x2
v
2 · xv · A ·
√
x0 ·
√
y0
(313)
from
(2)
(26)
(306)
(308)
(310)
(312)
t̂ = fx,y→t̂(x,y) = fxv,yv→t̂ (xv,yv) =
x + y
2 ·
√
x ·
√
y
=
xv + yv
2 ·
√
xv ·
√
yv
(314)
from
(2)
(26)
(307)
(309)
(311)
(313)
û = fx,y→û(x,y) = fxv,yv→û(x,y) =
y − x
2 ·
√
x ·
√
y
=
yv − xv
2 ·
√
xv ·
√
yv
(315)
To conclude this section, we will derive the algebraic identities for the key points on the unit hyperbola by passing the
corresponding points on the reference and virtual curves to the fx,y→t̂ and fx,y→û mapping functions, Equations 314
and 315. First, the mapping is performed for the reference curve (Equations 316, 317, 318, 319, 320 and 321).
from
(314) t̂ = fx,y→t̂ (x0,y0) =
x0 + y0
2 ·
√
x0 ·
√
y0
(316)
from
(315) û = fx,y→û (x0,y0) =
y0 − x0
2 ·
√
x0 ·
√
y0
(317)
from
(65)
(66)
(314)
t̂ = fx,y→t̂ (min(x),max(y)) =
x0 · (A − 1)
A
+
A · y0
A − 1
2 ·
r
x0 · (A − 1)
A
·
r
A · y0
A − 1
=
x0 · (A − 1)
2
+ A2
· y0
2 · A ·
√
x0 ·
√
y0 · (A − 1)
(318)
79DeFi’s Concentrated Liquidity From Scratch REVIEW
from
(65)
(66)
(315)
û = fx,y→û (min(x),max(y)) =
A · y0
A − 1
−
x0 · (A − 1)
A
2 ·
r
x0 · (A − 1)
A
·
r
A · y0
A − 1
=
A2
· y0 − x0 · (A − 1)
2
2 · A ·
√
x0 ·
√
y0 · (A − 1)
(319)
from
(67)
(68)
(314)
t̂ = fx,y→t̂ (max(x),min(y)) =
A · x0
A − 1
+
y0 · (A − 1)
A
2 ·
r
A · x0
A − 1
·
r
y0 · (A − 1)
A
=
A2
· x0 + y0 · (A − 1)
2
2 · A ·
√
x0 ·
√
y0 · (A − 1)
(320)
from
(67)
(68)
(315)
û = fx,y→û (max(x),min(y)) =
y0 · (A − 1)
A
−
A · x0
A − 1
2 ·
r
A · x0
A − 1
·
r
y0 · (A − 1)
A
=
y0 · (A − 1)
2
− A2
· x0
2 · A ·
√
x0 ·
√
y0 · (A − 1)
(321)
The expectation is that both the reference and virtual curves should map to the same coordinates on the unit hyperbola,
since the difference in the relative scaling has been appropriately and separately accounted for in the derivations
presented in this section. The fact that the final, two-argument mapping functions for both the reference and virtual
coordinates are identical is irrelevant; the output for passing key points on the reference and virtual curves should be the
same. Indeed, this is now shown to be true (Equations 322, 323, 324, 325, 326 and 327).
from
(314) t̂ = fxv,yv→t̂ (A · x0,A · y0) =
A · x0 + A · y0
2 ·
√
A · x0 ·
√
A · y0
=
x0 + y0
2 ·
√
x0 ·
√
y0
(322)
from
(315) û = fxv,yv→û (A · x0,A · y0) =
A · y0 − A · x0
2 ·
√
A · x0 ·
√
A · y0
=
y0 − x0
2 ·
√
x0 ·
√
y0
(323)
from
(36)
(37)
(314)
t̂ = fxv,yv→t̂ (min(xv),max(yv)) =
x0 · (A − 1) +
A2
· y0
A − 1
2 ·
p
x0 · (A − 1) ·
r
A2
· y0
A − 1
=
x0 · (A − 1)
2
+ A2
· y0
2 · A ·
√
x0 ·
√
y0 · (A − 1)
(324)
from
(36)
(37)
(315)
û = fxv,yv→û (min(xv),max(yv)) =
A2
· y0
A − 1
− x0 · (A − 1)
2 ·
p
x0 · (A − 1) ·
r
A2
· y0
A − 1
=
A2
· y0 − x0 · (A − 1)
2
2 · A ·
√
x0 ·
√
y0 · (A − 1)
(325)
from
(38)
(39)
(314)
t̂ = fxv,yv→t̂ (max(xv),min(yv)) =
A2
· x0
A − 1
+ y0 · (A − 1)
2 ·
r
A2
· x0
A − 1
·
p
y0 · (A − 1)
=
A2
· x0 + y0 · (A − 1)
2
2 · A ·
√
x0 ·
√
y0 · (A − 1)
(326)
from
(38)
(39)
(315)
û = fxv,yv→û (max(xv),min(yv)) =
y0 · (A − 1) −
A2
· x0
A − 1
2 ·
r
A2
· x0
A − 1
·
p
y0 · (A − 1)
=
y0 · (A − 1)
2
− A2
· x0
2 · A ·
√
x0 ·
√
y0 · (A − 1)
(327)
80DeFi’s Concentrated Liquidity From Scratch REVIEW
Fig. 53 The new linear transformation, which incorporates both a −45
◦
rotation and normalization is depicted with arrows
beginning from the key points on both the reference and virtual curves in the Cartesian (x, y) plane, and ending at their implied
destinations in the new coordinate system (t̂, û). Both the reference and virtual curves appear in the left panel, which after the −45
◦
rotation and normalization converge on the same points, the unit hyperbola, which appears in the right panel.
Therefore, we now have the functions which both rotate and normalize either of the reference or virtual curves, and they
are the same functions in both cases. After rotating and re-scaling, both the reference and virtual curves are consolidated
into each other; the overall process is summarized in Figure 53.
The expressions obtained that describe the transformed and normalized curve, t̂2
− û2
− 1 via Equations 316, 317, 318,
319, 320, 321, 322, 323, 324, 325, 326 and 327, are a little cumbersome. The process for refactoring all of these is the
same. First, remove a common factor of 1/2 before distributing the division, which produces a sum (for t̂) or difference
(for û) of two quotients, where these quotient identities have previously been established as the square roots of the price
boundaries, the square root of the geometric mean of the price boundaries, or the reciprocals of the same (Equations 43,
45 and 47). Substitution allows for all three parameters, x0, y0,and A to be replaced for single terms, either P0, Phigh
or Plow, depending on the context (Equations 328, 329, 330, 331, 332 and 333) (Figure 54).
from
(45)
(322)
t̂0 =
1
2
·
√
y0
√
x0
+
√
x0
√
y0

=
1
2
·
p
P0 +
1
√
P0

=
P0 + 1
2 ·
√
P0
(328)
81DeFi’s Concentrated Liquidity From Scratch REVIEW
from
(45)
(323)
û0 =
1
2
·
√
y0
√
x0
−
√
x0
√
y0

=
1
2
·
p
P0 −
1
√
P0

=
P0 − 1
2 ·
√
P0
(329)
from
(43)
(324)
min t̂

=
1
2
·

A
A − 1
·
√
y0
√
x0
+
A − 1
A
·
√
x0
√
y0

=
1
2
·
p
Phigh +
1
p
Phigh
!
=
Phigh + 1
2 ·
p
Phigh
(330)
from
(43)
(325)
max(û) =
1
2
·

A
A − 1
·
√
y0
√
x0
−
A − 1
A
·
√
x0
√
y0

=
1
2
·
p
Phigh −
1
p
Phigh
!
=
Phigh − 1
2 ·
p
Phigh
(331)
from
(53)
(326)
max t̂

=
1
2
·

A − 1
A
·
√
y0
√
x0
+
A
A − 1
·
√
x0
√
y0

=
1
2
·
p
Plow +
1
√
Plow

=
Plow + 1
2 ·
√
Plow
(332)
from
(47)
(327)
min(û) =
1
2
·

A − 1
A
·
√
y0
√
x0
−
A
A − 1
·
√
x0
√
y0

=
1
2
·
p
Plow −
1
√
Plow

=
Plow − 1
2 ·
√
Plow
(333)
The notation above deserves a brief note. The terms t̂0, û0, min(t̂), max(t̂), min(û), and max(û) inherit the syntax of
their Cartesian counterparts, x0, y0, min(x), max(x), min(y), and max(y). The choice of notation here was made to
preserve a sense of provenance. For û0, min(û), and max(û), the implicit meaning of the notation is guaranteed to be
preserved after the transformation and scaling; min(û) ≤ û0 ≤ max(û), always and with no exceptions. However,
the same cannot be said for t̂0, min(t̂), and max(t̂). Due to the −45◦
rotation about the origin, there is no general
inequality that applies for the relative sizes of t̂0, min(t̂), and max(t̂), and all permutations are possible. This is both
briefly annoying, but also ultimately irrelevant, as the remainder of the exercise will focus exclusively on û. The
justification for this is coming in due course.
The max(û) and min(û) coordinates represent points along the vertical axis of the unit hyperbola, and the area
enclosed by the curve and the rays drawn from these points through the origin defines one half the hyperbolic angle,
denoted here as ϕ. This is not the familiar angle from circle trigonometry; it is something else (vide infra).
## 5.3 The Trigonometric Description of Liquidity Concentration
In both Euclidean and hyperbolic geometry, angles serve as fundamental measures of separation between intersecting
lines. For the unit circle in Euclidean geometry, the angle θ is commonly understood to represent a rotation (indeed, we
have already used this intuition in the linear transformation of the curves). However, θ is equally well described as
representing an area. Specifically, θ corresponds to the area of the sector enclosed by the unit circle itself and two rays
that originate from the circle’s centre and intersect its perimeter.
Consider the unit circle, x2
+ y2
= 1. The angle, θ, measured in radians, directly corresponds to the area of the sector
formed by the radius of the circle and two rays extending from the origin to two different points on the circle’s boundary.
This area is equal to one half the angle, θ/2. This relationship arises because the full circle, having an area of π (the
area of a circle is 2π · r2
, and r = 1 for the unit circle) is spread across 2π radians. Thus, the area covered by any angle
θ is proportionally θ/(2π) times the total area of the circle, which simplifies to half the angle, θ/2, for a unit circle.
This is the intuition you should have when considering hyperbolic angles – not as a rotation, but as an area. Specifically,
half the hyperbolic angle, ϕ/2, is precisely the area enclosed by two rays emanating from the origin and intersecting
the unit hyperbola, just as half the circular angle, θ/2, is precisely the area enclosed by two rays emanating from
the origin and intersecting the unit circle. Circle and hyperbola trigonometry also share some common ground. The
most important for our purpose is that the coordinates for a point on both curves can be expressed with respect to the
trigonometric functions, sine and cosine (sin and cos, respectively) for a circle, and their hyperbola counterparts, the
hyperbolic sine and hyperbolic cosine (sinh and cosh, respectively) (Figure 55).
The angle that we are interested to determine in the context of concentrated liquidity is the one that measures the
separation between Phigh and Plow; that is, the size of the sector of the hyperbola wherein exchange can occur between
tokens. We have the algebraic identities for these points in the (t, u) plane; to measure ϕ, we turn to the inverse
82DeFi’s Concentrated Liquidity From Scratch REVIEW
Fig. 54 The transformed reference and virtual curves, t2
− u2
= 2 · x0 · y0 and t2
v − u2
v = 2 · A2
· x0 · y0 are depicted alongside
their normalized counterpart, t̂2
− û2
= 1. The point annotations correspond to the capstone identities for all three curves, and
appear in (u, t) format in both panels. The scale of the first panel is sufficient to include all three curves and their key points, whereas
the second panel is zoomed-in such that the detail around the unit curve can be inspected. The area of the shaded region enclosed by
the outer-most rays and the unit hyperbola in the second panel is equal to half its hyperbolic angle, ϕ/2, annotated accordingly and
depicted with a circular arc between its enclosing rays (Equations 328, 329, 330, 331, 332, 333).
hyperbolic sine function, arsinh (or sinh−1
), which takes the vertical displacement from the origin, û as an argument,
and returns the value ϕ (Equation 334).
arsinh(û) = sinh−1
(û) = ln

û +
p
û2 + 1

(334)
While Equation 334 is the form you are likely to have shown to you as The Arsinh Function, it is also an incomplete
description.
The output for any value of û passed to Equation 334 returns a value for ϕ with an implicit reference to û = 0. It might
be helpful to think of the above form of the arsinh (or sinh−1
) function as being the definite integral evaluated from 0
to some upper bound, û, rather than evaluated specifically at û. Fortunately, or unfortunately, we need to explore this a
little bit before we can progress any further.
The function sinh(û) is continuously differentiable over the reals; it is smooth everywhere and there exists a derivative
at all points in its domain (i.e. it is a C1
function). Since arsinh(û) is the inverse of sinh(û), it inherits similar
83DeFi’s Concentrated Liquidity From Scratch REVIEW
Fig. 55 The circle (first panel) and hyperbola (second panel) trigonometric functions, sin and cos, and sinh and cosh, respectively,
and their relationships to the vertical and horizontal axes of their cognate coordinate systems is presented for clarity’s sake. Note the
convention used here is that θ refers to the angle measured for a circle, and ϕ refers to the angle measured for a hyperbola.
Elsewhere, you will likely encounter other symbols to represent the hyperbolic angle; θ and ψ are common, and so are a and x, but
there is no prevailing standard, it seems.
differentiability properties through the inverse function theorem. Therefore, both arsinh(û) and its derivative (Equation
335) are well-defined over the real number line as well, −∞ < û < +∞. This is the reason we are using arsinh(û)
and not arcosh t̂

, which is only well-defined for t̂ > 1 and is ambiguously multi-valued in this domain. We have
already observed this behavior. Recall that there is an annoying lack of a general inequality that applies for the relative
sizes of t̂0, min t̂

, and max t̂

, mentioned above (Equations 328, 330 and 332). The fact that arsinh(û) provides
all the information we require, unambiguously, is the justification for why such a lack of a general inequality in the t̂
notation can safely be ignored; we have no use for t̂ because the functions that accept it as an argument are simply not
general enough to be useful in this context.
∂ϕ
∂û
=
∂
∂û
· arsinh(û) =
1
√
û2 + 1
, ∀ û∈ R (335)
With that out of the way, we can define a more general arsinh(û) function (which yields the hyperbolic angle, ϕ) as the
definite integral of its derivative (Equation 335) evaluated from min(û) to max(û) (Equation 336). Note that forcing
min(û) in Equation 336 to zero yields Equation 334; however, we can now pass any value for min(û) and max(û)
and measure the hyperbolic angle, ϕ, relative to any positions we want. Much better!
ϕ =
Z max(û)
min(û)
1
√
û2 + 1
·∂û =
h
ln

û +
p
û2 + 1
imax(û)
min(û)
(336)
Then, evaluation of the definite integral begins with substitution of the identities for max(û) and min(û) from
Equations 331 and 333, respectively, into the integration bounds in Equation 336 yields a rather grotesque expression
for ϕ (Equation 337). However, this can be refactored and simplified into at least three very pleasing redundant forms
(Equation 339).
from
(331)
(333)
(336)
ϕ = ln



Phigh − 1
2 ·
p
Phigh
+
v
u
u
t Phigh − 1
2 ·
p
Phigh
!2
+ 1


 − ln

 Plow − 1
2 ·
√
Plow
+
s
Plow − 1
2 ·
√
Plow
2
+ 1

 (337)
84DeFi’s Concentrated Liquidity From Scratch REVIEW
from
(337) ϕ = ln








Phigh − 1
2 ·
p
Phigh
+
v
u
u
t Phigh − 1
2 ·
p
Phigh
!2
+ 1
Plow − 1
2 ·
√
Plow
+
s
Plow − 1
2 ·
√
Plow
2
+ 1








= ln




√
Plow ·

Phigh +
q
(Phigh + 1)
2
− 1

p
Phigh ·

Plow +
q
(Plow + 1)
2
− 1




 (338)
from
(338) ϕ = ln
p
Phigh
√
Plow
!
= ln
p
Phigh

−ln
p
Plow

=
ln(Phigh) − ln(Plow)
2
(339)
At long last, the “natural” parametrization for concentrated liquidity becomes evident. Passing ϕ as an argument to the
exponential function, (i.e. eϕ
) yields the square root of the quotient of Phigh and Plow, which is equal to the [no longer a
mystery] constant C, from which the three “pretty” invariant equations emerged (see Section 5.1), which brings this
part of the exercise full-circle (Equations 340, 341 and 342).
from
(339) eϕ
= C (340)
from
(275)
(340)
eϕ
=
(x − x0)
2
· (y − y0)
2
(x · y − x0 · y0)
2 =
(xint − x) · (yint − y)
x · y
=
(x − xasym) · (y − yasym)
xasym · yasym
(341)
from
(276)
(340)
eϕ
=
yasym − yint
yasym
=
xasym − xint
xasym
=
(yasym − y0)
2
y2
asym
=
(xasym − x0)
2
x2
asym
=
p
Phigh
√
Plow
(342)
The remaining trigonometric identities are easily elucidated from the defining relationships of the hyperbolic sine,
cosine, and tangent functions (sinh, cosh, and tanh, respectively) (Equations 343, 344, 345 and 346). Curiously,
cosh(ϕ) is equal to the quotient of the arithmetic mean and the geometric mean of the price boundaries, which despite
being a meaningless coincidence, is a surprising and potentially useful result in and of itself.
from
(339) eϕ
= sinh(ϕ) + cosh(ϕ) =
p
Phigh
√
Plow
(343)
from
(339) sinh(ϕ) =
eϕ
− e−ϕ
2
=
1
2
·
p
Phigh
√
Plow
−
√
Plow
p
Phigh
!
=
Phigh − Plow
2 ·
p
Phigh ·
√
Plow
(344)
from
(339) cosh(ϕ) =
eϕ
+ e−ϕ
2
=
1
2
·
p
Phigh
√
Plow
+
√
Plow
p
Phigh
!
=
Phigh + Plow
2 ·
p
Phigh ·
√
Plow
(345)
from
(339) tanh(ϕ) =
sinh(ϕ)
cosh(ϕ)
=
eϕ
− e−ϕ
eϕ + e−ϕ
=
Phigh − Plow
Phigh + Plow
(346)
This concludes both our examination of the “natural” concentrated liquidity curve reparameterizations, and our
examination of concentrated liquidity in general.
## 6 Conclusion
This document provides a detailed elaboration of the three preeminent descriptions of concentrated liquidity from
Bancor and Uniswap, as well as three additional descriptions informed by their trigonometric analysis in a transformed
and normalized coordinate system. Importantly, the equivalence of all six parameterizations is rigorously demonstrated
with a view to establish necessary reference standards, and ameliorate an apparent confusion exhibited by fledgling
developers as to how to wield the underlying theory.
85