---
sha256: 9b496d9068b472e558f1df1ecf06ff8d72aff4554e10f189d36bffb8149bd139
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 78205
---
Lecture Notes for
Mathematical Finance
in discrete time
University of Vienna, Faculty of Mathematics,
Fall 2015/16
Christa Cuchiero
University of Vienna
christa.cuchiero@univie.ac.at
Draft Version June 2016Contents
## 1 Basic notions from probability theory 3
## 1.1 Filtered probability spaces, random variables and stochastic pro-
cesses . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 3
## 1.2 Lp spaces . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 6
## 1.2.1 The case of finite Ω . . . . . . . . . . . . . . . . . . . . . 7
## 1.3 The conditional expectation in the case of finite Ω . . . . . . . . 8
## 1.4 Martingales . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 10
## 2 Models of financial markets on finite probability spaces 13
## 2.1 Description of the model . . . . . . . . . . . . . . . . . . . . . . . 13
## 2.2 No-arbitrage and the fundamental theorem of asset pricing . . . 17
## 2.3 Complete models and their properties . . . . . . . . . . . . . . . 25
## 2.4 Pricing by No-arbitrage . . . . . . . . . . . . . . . . . . . . . . . 27
## 2.5 The optional decomposition theorem . . . . . . . . . . . . . . . . 30
## 3 The Binomial model (Cox-Ross-Rubinstein model) 33
## 3.1 Definition of the Binomial model and first properties . . . . . . . 33
## 3.2 Exotic derivatives . . . . . . . . . . . . . . . . . . . . . . . . . . . 38
## 3.2.1 Reflection principle . . . . . . . . . . . . . . . . . . . . . . 39
## 3.3 Convergence to the Black Scholes Price . . . . . . . . . . . . . . 40
## 3.3.1 Derivative pricing and limits . . . . . . . . . . . . . . . . 43
## 4 American Options 45
## 4.1 Pricing and Hedging from the perspective of the seller . . . . . . 45
## 4.2 Stopping strategies for the buyer . . . . . . . . . . . . . . . . . . 45
iii CONTENTSPreface
The present lecture notes are based on the following literature.
• F. Delbaen and W. Schachermayer. The mathematics of arbitrage. Springer
Finance. Springer-Verlag, Berlin, 2006.
• H. Föllmer and A. Schied. Stochastic finance. Walter de Gruyter & Co.,
Berlin, extended edition, 2011. An introduction in discrete time.
• S. E. Shreve. Stochastic calculus for finance. I. Springer Finance.
Springer-Verlag, New York, 2004. The binomial asset pricing model.
Throughout we consider models of financial markets in discrete time, i.e., trad-
ing is only allowed at discrete time points 0 = t0 < t1 < ··· < tN = T. Here,
T > 0 denotes a finite time horizon. This is in contrast to models in continuous
time, where continuous trading during the interval [0,T] is possible.
The following topics of mathematical finance will be covered:
• arbitrage theory;
• completeness of financial markets;
• superhedging;
• pricing of derivatives (European and American options);
• concrete modeling of financial markets via the Binomial asset price model
and (its convergence to) the Black Scholes model.
From a mathematical point of view, probability theory and stochastic analysis
play a key role in mathematical finance.
12 CONTENTSChapter 1
Basic notions from probability
theory
We recall here basic notions from probability theory which we will need for
modeling financial markets.
## 1.1 Filtered probability spaces, random variables and
stochastic processes
Let us start by recalling the ingredients of a probability space. A probability
space consists of three parts:
• a non-empty set Ω (Ergebnismenge), which is the set of possible outcomes;
• a σ-algebra F, i.e., a set consisting of sets of Ω to model all possible events
(Ereignisse) (where an event is a set containing zero or more outcomes);
• a probability measure P assigning probabilities to each event.
The precise mathematical definition of these notions are as follows:
Definition 1.1.1. A set F ⊂ P(Ω) is called σ-algebra if it satisfies
• Ω ∈ F;
• A ∈ F ⇒ Ac = Ω \ A ∈ F;
• A1,A2,... ∈ F ⇒
S∞
n=1 ∈ F.
The above definition implies that a σ-algebra is closed under countable inter-
sections.
Definition 1.1.2. Let (Ω,F) be a measurable space, i.e. F is σ-algebra on Ω.
Then a probability measure is a function P : F → [0,1] such that
34 Basic notions from probability theory
• P[Ω] = 1;
• it is σ-additive, i.e. for any sequence of pairwise disjoint sets in F (i.e.,
An ∪ Am = ∅ for n 6= m), we have P[
S∞
n=1 An] =
P∞
n=1 P[An].
Definition 1.1.3. • Two probability measures P, Q are called equivalent,
which is denoted by P ∼ Q if
P[A] = 0 ⇔ Q[A] = 0, A ∈ F.
• Q is absolutely continuous with respect to P, which is denoted by Q  P
if
P[A] = 0 ⇒ Q[A] = 0, A ∈ F.
Remark 1.1.4. • From the above definition, we immediately get
Q ∼ P ⇔ P  Q,Q  P.
and
Q  P ⇔ Q[A] > 0 ⇒ P[A] > 0.
• In the case when Ω consists of finitely many elements and P[{ω}] >
0 for every ω, then for every probability measure Q we have Q  P.
Equivalence means Q[{ω}] > 0 for every ω.
Let us recall the notion of an atom:
Definition 1.1.5. Given a probability space (Ω,F,P), then a set A is called
atom if P[A] > 0 and for any measurable subset B ⊂ A with P[B] < P[A] we
have P[B] = 0. In the case of a finite probability space where only the empty set
has probability zero, we have the following equivalent definition a set A is called
atom if P[A] > 0 and for any measurable subset B ⊂ A with P[B] < P[A] we
have B = ∅.
Example 1.1.6. Let Ω = {ω1,ω2,ω3,ω4} and F = P(Ω). Consider a probability
measure P which satisfies P[ωi] > 0. Then the atoms are {ωi}, i ∈ {1,...,4}.
If the σ-Algebra is given by F = {∅,Ω,{ω1,ω2},{ω3,ω3}}, then the atoms are
{ω1,ω2} and {ω3,ω4}.
Definition 1.1.7. A family of σ-algebras with F0 ⊆ F1 ⊆ ···FT is called
filtration and (Ω,F,(Ft){t∈[0,...,T]},P) filtered probability space.
Remark 1.1.8. Ft is interpreted as the set of all events which can happen up to
time t or equivalently as the information which is available up to time t.1.1 Filtered probability spaces, random variables and stochastic
processes 5
Assumption. Unless explicitly mentioned, we shall assume that FT = F. We
do not assume F0 to be necessarily the trivial σ-algebra (∅,Ω), although in many
applications this is the case.
For modeling asset prices we consider stochastic processes which are families of
random variables, whose definition we recall subsequently.
Definition 1.1.9. Let (Ω,F) and (E,E) be two measurable spaces. A random
variable X with values in E is a (F-E)-measurable function X : Ω → E, i.e. the
preimage of any measurable set B ∈ E is in F: ∀B ∈ E, we have X−1(B) ∈ F.
In our setting (E,E) is typically (Rn,B(Rn)), where B(Rn) denotes the Borel
σ-algebra, defined as the smallest σ-algebra containing the open sets of Rn.
Remark 1.1.10. In the case (E,E) = (R,B(R)), (F-B(R))-measurability (or
simply F-measurability) is equivalent to
∀a ∈ R : {ω ∈ Ω : X(ω) ∈ (−∞,a]} ∈ F.
Definition 1.1.11. Let Ω be some set and (E,E) be a measurable spaces. Con-
sider a function X : Ω → E. Then the σ-algebra generated by X, denoted by
σ(X), is the collection of all inverse images X−1(B) of the sets B in E, i.e.,
σ(X) = {X−1
(B)|B ∈ E}.
Definition 1.1.12. Let T be an index set, either {0,1,...,T} or {1,...,T},
and (Ω,F) and (E,E) two measurable spaces. A stochastic process with values
in (E,E) is a family of random variables X = (Xt)t∈T = {Xt |t ∈ T } (i.e.
F-measurable).
Definition 1.1.13. Let (Ω,F,(Ft)t∈{0,1...,T},P) a filtered probability space.
1. A stochastic process X is called adapted with respect to the filtration (Ft)
if for every t ∈ {0,1,...,T}, Xt is Ft-measurable.
2. A stochastic process Y is called predictable with respect to the filtration
(Ft) if for every t ∈ {1,...,T}, Yt is Ft−1-measurable.
Example 1.1.14. Let T = 2, Ω = {1,2,3,4} and E = R. Consider the following
filtration F0 = {∅,Ω}, F1 = {∅,Ω,{1,2},{3,4}} and F2 = P(Ω). Question:
How do adapted stochastic processes look like? Answer: For t = 0, a (F0-
measurable) random variable is constant, for t = 1 a (F1-measurable) random
variable is piece-wise constant (constant on {1,2} and {3,4}) and for t = 2 all
functions are (F2-measurable) random variables.6 Basic notions from probability theory
1.2 Lp
spaces
Let us now pass to Lp spaces which are spaces of random variables whose pth
power is integrable.
Definition 1.2.1. Let (Ω,F,P) be a probability space. For random variables
X : Ω → R we define
kXkp :=
Z
Ω
|X(ω)|p
dP(ω)
1
p
= E [|X|p
]
1
p , if p ∈ [1,∞)
and for p = ∞
kXk∞ := inf{K ≥ 0 : P[{|X| > K}] = 0}.
For every p ∈ [1,∞], Lp(Ω,F,P) is the vector space for which the above ex-
pressions are finite, i.e.,
Lp
(Ω,F,P) := {X : Ω → R is F-measurable and kXkp < ∞}.
This definition implies that k·k is a semi-norm, i.e., for all X,Y ∈ Lp(Ω,F,P)
und α ∈ R we have
kXkp ≥ 0 for all X and kXkp = 0, if X = 0 P-a.s.,
kαXkp = αkXkp,
kX + Y kp ≤ kXkp + kY kp.
In other words all properties of a norm are satisfied except that kXkp = 0 ⇒
X = 0. Indeed we have
kXkp = 0 ⇔ X = 0 P-a.s.
In order to make k · kp to be a true norm, we define
N = {X is F-measurable and X = 0 P-a.s.}.
For every p ∈ [1,∞], N is a subvector space of Lp(Ω,F,P). We can thus build
the quotient space via the equivalence relation X ∼ Y , if X = Y P-a.s.
Definition 1.2.2. For p ∈ [1,∞], the vector space Lp(Ω,F,P) is defined as
the quotient space
Lp
(Ω,F,P) = Lp
(Ω,F,P)/N = {[X] := X + N |X ∈ Lp
(Ω,F,P)}.
For [X] ∈ Lp(Ω,F,P) we set k[X]kp = kXkp and
R
[X]dP =
R
XdP with
X ∈ [X].
On Lp(Ω,F,P) , k · kp is a true norm. Moreover it is complete with respect to
this norm, i.e. every Cauchy-sequence converges. Such a space is called Banach
space.1.2 Lp spaces 7
For p = 0, L0(Ω,F,P) denotes the vector space of equivalence classes of random
variables, i.e.,
L0
(Ω,F,P) = {[X] := X + N |X : Ω → R,X is F − measurable}.
For notational convenience we usually omit the brackets [·] when we talk about
elements in Lp(Ω,F,P).
## 1.2.1 The case of finite Ω
In the case where Ω consists only of finitely many elements, i.e.
Ω = {ω1,...,ωN}
for some N ∈ N and a probability measure P such that
P[ωn] = pn ≥ 0, for n = {1,...,N},
the above notions simplify as follows. A general random variable X : Ω → R
corresponds to a vector in RN
X = (X(ω1),...,X(ωN))>
=: (x1,...,xN)>
,
where xn is the evaluation of X at ωn. Two random variables X and Y are
equivalent, if xn = yn for all n for which pn > 0. This means we identify
random variables whose jth component is different, if pj = 0 (in the case of
finite Ω it is also possible to remove those elements ωj which have probability
0.) For p ∈ [1,∞), Lp(Ω,F,P) are now equivalence classes of vectors with the
following norm
kXkp =
N X
n=1
|X(ωn)|p
P[ωn]
!1
p
=
N X
n=1
|xn|p
pn
!1
p
= E[|X|p
]
1
p
and in case of p = ∞ the norm is given by
kXk∞ = max
n∈{1,...,N}
{X(ωn)|P[ωn] > 0} = max
n∈{1,...,N}
{xn |pn > 0}.
Since all these norms are always finite in the case of finite Ω, it follows that for
every p ∈ [1,∞], Lp(Ω,F,P) contains the same random variables, i.e. vectors
in RN. If we do not specify a specific norm on these space we thus simply write
L(Ω,F,P) = {[X] := X + N |X : Ω → R,X is F-measurable} (1.1)
for the space of equivalence classes of F-measurable random variables, which
also corresponds to L0(Ω,F,P) in the above notation. If F = P(Ω), L(Ω,F,P)
can be identified with RN.8 Basic notions from probability theory
## 1.3 The conditional expectation in the case of finite
Ω
Let (Ω,F,P) be a probability space as above where Ω only consists of finitely
many elements, i.e.
Ω = {ω1,...,ωN}
for some N ∈ N and a probability measure P such that
P[ωn] = pn ≥ 0, for n = {1,...,N}.
As above let L(Ω,F,P) denote the space of equivalence classes of F-measurable
random variables.
Let B ∈ F be an event with P[B] > 0, then the conditional probability
P[A|B] = P[A ∩ B]/P[B] is a measure for the probability of event A given
event B. Accordingly the conditional expectation
E[X |B] =
E[1BX]
P[B]
(1.2)
is a measure for the mean of the random variable X given the information con-
cerning the occurrence of B. This elementary notion of conditional expectations
is however not always sufficient. Indeed, we are more interested in conditional
expectations of the form
E[X |G],
i.e. in case where we have information concerning the occurrence of a set of
events (a σ-algebra) G ⊂ F. In contrast to (1.2) this expression is again a
random variable. As we will see E[X |B] for B ∈ G ⊂ F is the evaluation of
the random variable E[X |G](ω) for ω ∈ B.
Definition 1.3.1. Für X,Y ∈ L(Ω,F,P) (for general Ω this would be L2(Ω,F,P))
we define the scalar product
hX,Y i :=
N X
n=1
X(ωn)Y (ωn)p(ωn) =
K X
n=1
xnynpn = E[XY ].
The induced norm k·k2 corresponds to kxk =
p
hx,xi, whence (L(Ω,F,P),h·,·i)
is a finite dimensional Hilbert space.
Let G ⊂ F be a sub-σ-algebra of F, then L(Ω,G,P) is a linear subspace of
L(Ω,F,P). The conditional expectation is the random variable Y ∈ L(Ω,G,P),
which has the shortest distance to X ∈ L(Ω,F,P), i.e. Y is the solution to the
following minimizing problem:
kX − Y k2 = E

|X − Y |2
1
2
= min
n
E

|X − Z|2
1
2
= kX − Zk2 |Z ∈ L(Ω,G,P)
o
.1.3 The conditional expectation in the case of finite Ω 9
This minimizing problem has a unique solution, namely the orthogonal projec-
tion of X on L(Ω,G,P). Thus X − Y is orthogonal to all Z ∈ L2(Ω,G,P),
i.e.,
hX − Y,Zi = E[(X − Y )Z] = 0.
In other words, Y satisfies
E[XZ] = E[Y Z]
for all Z ∈ L(Ω,G,P). The following definition of the conditional expectation
thus makes sense:
Definition 1.3.2. Let X ∈ L(Ω,F,P) and G ⊂ F be a sub-σ-Algebra. Then
we call the orthogonal projection on L(Ω,G,P) the conditional expectation of X
given G. We write E[X |G]. In other words, E[X |G] is the unique element in
L(Ω,G,P), such that
E[XZ] = E[E[X |G]Z] (1.3)
holds for all Z ∈ L(Ω,G,P).
Since Ω is finite dimensional, we get a more explicit expression for the condi-
tional expectation. Indeed, for every σ-algebra G ⊆ F there exists a partition
(Bi)i∈I of Ω, i.e., a decomposition of Ω in disjoint, non-empty sets, where I
denotes a finite index set. The functions
1Bi
k1Bik
=
1Bi
p
h1Bi,1Bii
=
1Bi
p
P[Bi]
form an orthonormal basis of L(Ω,G,P) and the orthogonal projection of a
random variable X ∈ L(Ω,F,P) on L(Ω,G,P) is thus given by
E[X |G] =
X
i∈I,P(Bi)>0
*
X,
1Bi
p
P[Bi]
+
1Bi
p
P[Bi]
. =
X
i∈I,P(Bi)>0
E[X1Bi]
1Bi
P[Bi]
.
(1.4)
For all ω ∈ Bi and A ∈ F the value of E[1A |G](ω) = P[A|G](ω) is given by
P[A|G](ω) = E[1A |G](ω) =
E[1A1Bi]
P[Bi]
=
P[A ∩ Bi]
P[Bi]
, ω ∈ Bi
and on events Bi with P(Bi) > 0 this corresponds to the definition of the
conditional probability.
Example 1.3.3. Let N = 3 such that Ω = {ω1,ω2,ω3}, F = P(Ω) and
G = {∅,Ω,{ω1},{ω2,ω3}}.
Consider the uniform distribution, i.e., P(ωi) = 1
3 for all i = 1,2,3 and the
random variable X : Ω → R,ωi 7→ X(ωi) = i. Then inserting in (1.4) yields
E[X|G](ω1) = E[X1ω1]
1ω1
P[ω1]
= 1 ·
1
3
· 13 = 1,
E[X|G](ωi) = E[X1{ω2,ω3}]
1ω2,ω3
P[{ω2,ω3}]
= (2 ·
1
3
+ 3 ·
1
3
) ·
3
2
=
5
2
, i = 2,3.10 Basic notions from probability theory
Subsequently we state some important notions of the conditional expectation.
For this purpose recall the notion of independence of a random variable X and a
σ-algebra G, which means that the σ-algebra generated by X, denoted by σ(X)
is independent of G. Two σ-algebras G,H are independent if for all events A ∈ G
and B ∈ H, P(A ∩ B) = P(A)P(B).
Proposition 1.3.4. Let X ∈ L(Ω,F,P) and G ⊂ F be a sub-σ-algebra. Then
we have:
i) The map X 7→ E[X |G] is linear.
ii) If X ≥ 0, then E[X |G] ≥ 0.
iii) E[E[X |G]] = E[X].
iv) Let H ⊂ G be a sub-σ-algebra of G. Then E[X |H] = E[E[X |G]|H].
v) If X is independent of G, then E[X |G] = E[X]
vi) If Y ∈ L(Ω,G,P), then E[XY |G] = Y E[X |G].
vii) Let Y ∈ L(Ω,G,P) and X be independent of G. Then we have for all
measurable functions f : R → R
E[f(X + Y )|G](ω) = E[f(X + Y )|σ(Y )](ω),
where σ(Y ) is the σ-algebra generated by Y . For the evaluation at Y (ω) =
y we have
E[f(X + Y )|Y = y] = E[f(X + y)].
## 1.4 Martingales
The main reason for introducing the concept of the conditional expectation is
to define the notion of a martingale, which will play a particular role for asset
prices in financial markets.
Definition 1.4.1. An adapted process (X)t∈{1,...,T} is called martingale, if for
all t ∈ {1,...,T}
E[Xt|Ft−1] = Xt−1.
Similarly we have the notion of a super- and sub-martingale defined below:
Definition 1.4.2. • An adapted process (X)t∈{1,...,T} is called supermartin-
gale, if for all t ∈ {1,...,T},
E[Xt|Ft−1] ≤ Xt−1.
• An adapted process (X)t∈{1,...,T} is called submartingale, if for all t ∈
{1,...,T},
E[Xt|Ft−1] ≥ Xt−1.1.4 Martingales 11
Let us now state the Doob-decomposition of an adapted process which plays a
crucial role in the representation of a supermartingale.
Theorem 1.4.3 (Doob-Decomposition). Let X be an adapted process defined
on some filtered probability space (Ω,F,(Ft),P). Then there exists a unique
decomposition
X = M − A, (1.5)
where M is a martingale and A is a process such that A0 = 0 and (At)t=1,...,T
is predictable. The decomposition (1.5) is called the Doob decomposition of X.
Proof. Define
At − At−1 = −E[Xt − Xt−1|Ft−1], t = 1,...,T.
Then A is predictable, i.e. At is Ft−1 measurable (by definition of the condi-
tional expectation) and Mt := Xt + At is a martingale. Indeed
E[Mt|Ft−1] = E[Xt − E[Xt − Xt−1|Ft−1] + At−1|Ft−1] = Xt−1 + At−1 = Mt−1.
Concerning uniqueness, suppose that there are two representations of X, i.e.,
Xt = Mt − At = M0
t − A0
t,
from which we get At − A0
t = Mt − M0
t. Taking conditional expectations it
follows that
At − A0
t = Mt−1 − M0
t−1
and by setting t = 1 we have A1 − A0
1 = M0 − M0
0 = X0 − X0 = 0. Hence
M1 = X1 + A1 = X1 + A0
1 = M0
1. Uniqueness then follows by induction.
Proposition 1.4.4. Let X be an adapted process. Then the following assertions
are equivalent.
1. X is a supermartingale.
2. The predictable process A in the Doob decomposition is increasing.
An analogous statement holds for submartingales.
Proof. Let X be a supermartingale. Then by definition of the process A in the
Doob decomposition and the supermartingale property we have
At − At−1 = −E[Xt − Xt−1|Ft−1] ≥ 0,
which implies that A is increasing. Conversely, suppose that A is increasing.
Then again by the definition of A we obtain
0 ≤ At − At−1 = −E[Xt − Xt−1|Ft−1],
from which we obtain the supermartingale property
E[Xt|Ft−1] ≤ Xt−1.
For submartingales the proof works analogously.12 Basic notions from probability theoryChapter 2
Models of financial markets on
finite probability spaces
We consider a financial market with 1 ≤ T ∈ N periods and d + 1 financial
instruments. More precisely, the modeling framework consists of
• discrete trading times t = 0,1,...,T;
• d + 1 financial instruments (often a riskless bank account and d risky
assets), whose modeling requires a probability space (Ω,F,P), a filtration
(Ft)t∈{0,1,...,T} and the notion of stochastic processes as introduced in the
previous chapter.
## 2.1 Description of the model
This section is mainly based on [1, Chapter 2].
Adapted stochastic processes are used to model asset price processes. The
idea is that Ft represents the information up to time t and the asset price is
measurable with respect to Ft, i.e., its value can be inferred from the knowledge
of Ft.
Definition 2.1.1. A multi-period model of a financial market in discrete time
t ∈ {0,1,...,T}, T ∈ N, consists of an Rd+1-valued adapted stochastic process
b S = (b S0, b S1,..., b Sd) defined on a filtered probability space (Ω,F,(Ft),P), where
• b S0 is the so-called numéraire asset used as denomination basis, which is
supposed to be strictly positive, i.e. b S0
t > 0 for all t ∈ {0,1,...,T};
• (b S1,..., b Sd) are Rd-valued adapted stochastic processes for the risky as-
sets.
The interpretation is as follows: The prices of the assets 0,...,d are measured in
a fixed money unit, say Euro. The 0th asset plays a special role, it is supposed
1314 Models of financial markets on finite probability spaces
to be strictly positive and will be used as numéraire. It allows to compare
money (Euros) at time 0 to money at time t > 0. In many elementary models,
b S0 is simply the bank account, which is in case of constant interest rates given
by b S0
t = (1 + r)t.
Definition 2.1.2. • A trading strategy for the d risky assets (b S1,..., b Sd) is
an Rd-valued predictable process Ht = (H1
t ,...,Hd
t )t∈{1,...,T}. The set of
all such trading strategies is denoted by H. (In other words H corresponds
to all Rd-valued predictable processes.)
• Similarly, a trading strategy for the d + 1 assets (b S0,..., b Sd) is an Rd+1-
valued predictable process, which we denote as follows
( b Ht)t∈{1,...,T} = (H0
t ,H1
t ,...,Hd
t )t∈{1,...,T} = (H0
t ,Ht)t∈{1,...,T}.
Remark 2.1.3. The component Hi
t corresponds to the number of shares invested
in asset i from period t−1 up to t. This means Hi
tSi
t−1 is the invested amount
at time t − 1 and Hi
tSi
t is the resulting wealth at time t. Predictability of b H
means that an investment can only be made without knowledge of future asset
price movements.
Definition 2.1.4. A trading strategy for the d + 1 assets (b S0,..., b Sd) is self-
financing if for every t = 1,...,T − 1, we have
b H>
t
b St = b H>
t+1
b St
or more explicitly
Pd
i=0 Hi
t
b Si
t =
Pd
i=0 Hi
t+1
b Si
t.
The self-financing condition means that the portfolio is always adjusted in such
a way that the current wealth remains the same (one does not remove or add
wealth). Accumulated gains or losses are only achieved through changes in the
asset prices.
Definition 2.1.5. The undiscounted wealth process (b Vt){t∈{0,1,...,T}} with respect
to a trading strategy b H is given by
b V0 = b H>
1
b S0 =
d X
i=0
Hi
1
b Si
0,
b Vt = b H>
t
b St =
d X
i=0
Hi
t
b Si
t, t ∈ {1,...,T}. (2.1)
The Ft-measurable random variable b Vt defined in (2.1) is interpreted as the
value of the portfolio at time t defined by the trading strategy b H.
Remark 2.1.6. Note that if b H is self-financing, we have b Vt = b H>
t
b St = b H>
t+1
b St.2.1 Description of the model 15
In the sequel we shall work with discounted price and wealth processes, that
means we consider everything in terms of units of the numéraire asset S0.
Definition 2.1.7. The discounted asset prices are given by
Si
t :=
b Si
t
b S0
t
, i ∈ {1,...,d}, t ∈ {0,1,...,T},
and we write S = (S1,...,Sd). The discounted wealth process is given by
Vt =
b Vt
b S0
t
, t ∈ {0,1,...,T}.
Remark 2.1.8. Note that the discounted numéraire asset S0
t ≡ 1 for all t ∈
{0,...,T}.
The self-financing property can be characterized by the following proposition,
where we use the notation ∆Su = Su − Su−1.
Proposition 2.1.9. Let b S be a model of a financial market as of Defini-
tion 2.1.1 and consider an Rd+1-valued trading strategy b H = (H0,H) for b S.
Then the following are equivalent:
1. b H is self-financing.
2. The (undiscounted) wealth process satisfies
b Vt = b V0 +
t X
j=1
b H>
j ∆b Sj, t = 0,...,T.
3. We have
H0
t + H>
t St = H0
t+1 + H>
t+1St, t = 1,...,T − 1,
where S denotes the discounted price process as of Definition 2.1.7.
4. The discounted wealth process satisfies
Vt = V0 +
t X
j=1
H>
j ∆Sj, t = 0,...,T, (2.2)
where S denotes the discounted price process as of Definition 2.1.7 and
V0 =
b V0
b S0
0
=
b H>
1
b S0
b S0
0
= H0
1 + H>
1 S0.
Moreover, there is a bijection between self-financing Rd+1-valued trading strate-
gies b H = (H0,H) and pairs (V0,H), where V0 is a F0-measurable random
variable and H an Rd-valued trading strategies for the risky assets. Explicitly,
H0
t = V0 +
Pt
u=1 H>
u ∆Su − H>
t St.16 Models of financial markets on finite probability spaces
Proof. 1) ⇔ 2): b H is self-financing if and only if
b Vj+1 − b Vj = b H>
j+1
b Sj+1 − b H>
j
b Sj = b Hj+1(b Sj+1 − b Sj), j = 0,...,T − 1
which in turn is equivalent to
b Vt = b V0 +
t X
j=1
(b Vj − b Vj−1) = b V0 +
t X
j=1
b Hj(b Sj − b Sj−1).
1) ⇔ 3) 3) is obtained from 1) by dividing through S0
t and conversely 1) is
obtained from 3) by multiplying with S0
t .
3) ⇔ 4): 3) holds if and only if
Vj+1−Vj = H0
j+1+H>
j+1Sj+1−H0
j −H>
j Sj = H>
j+1(Sj+1−Sj), j = 0,...,T−1,
which in turn is equivalent to
Vt = V0 +
t X
j=1
(Vj − Vj−1) = V0 +
t−1 X
j=0
H>
j (Sj − Sj−1).
For the last statement let (V0,H) be given. Since the self-financing property of
b H is equivalent to (2.2), we can determine H0 from (V0,H) via
V0 +
t X
j=1
H>
j (Sj − Sj−1) = Vt = H0
t + H>
t St,
where the last equality is simply the definition of the discounted wealth process.
Thus
H0
t = V0 +
t X
j=1
H>
j (Sj − Sj−1) − H>
t St = V0 +
t−1 X
j=1
H>
j (Sj − Sj−1) − H>
t St−1
which is predictable. Conversely, for a given self-financing Rd+1-valued strategy
(H0,H), V0 is determined via H0
1 + H>
1 S0.
Definition 2.1.10. Let S = (S1,...,Sd) be a model of a financial market in
discounted terms (as of Definition 2.1.7) and consider an Rd-valued trading
strategy H ∈ H. The discounted gains process with respect to H is defined
through the stochastic integral (in discrete time)
Gt := (H • S)t :=
t X
j=1
H>
j (Sj − Sj−1) =:
t X
j=1
H>
j ∆Sj
and corresponds to the gains or losses accumulated up to time t in discounted
terms.2.2 No-arbitrage and the fundamental theorem of asset pricing 17
Remark 2.1.11. Note that by Proposition 2.1.9 the discounted wealth process V
of a self-financing strategy is given as the sum of the discounted initial wealth
V0 and the discounted gains process. Moreover due to the second part of 2.1.9,
for any Rd-valued trading strategy H ∈ H and initial wealth V0 we can define
Vt := V0 + (H • S)t which then corresponds to the discounted wealth processes
of a self-financing Rd+1-valued trading strategy b H = (H0,H) where H0
t =
V0 +
Pt
u=1 H>
u ∆Su − H>
t St.
From now on we shall work in terms of the discounted Rd-valued process denoted
by S and discounted wealth process V .
## 2.2 No-arbitrage and the fundamental theorem of
asset pricing
This section is mainly based on [1, Chapter 2].
Definition 2.2.1. Let S = (S1,...,Sd) be a model of a financial market in
discounted terms.
• An Rd-valued trading strategy H ∈ H is called arbitrage opportunity if
(H • S)T ≥ 0 P-a.s. and P[(H • S)T > 0] > 0.
• We call a model arbitrage-free or satisfies the no-arbitrage condition (NA)
if there exists no arbitrage strategy.
Remark 2.2.2. The notion of arbitrage can equivalently be formulated as follows:
A self-financing Rd+1-valued strategy b H is called arbitrage opportunity if the
associated wealth process b V satisfies b V0 = 0 and b VT ≥ 0 P-a.s and P[b VT > 0] >
0.
Assumption 1. From now on we assume that the probability space Ω under-
lying our model is finite.
Ω = {ω1,...,ωN}
for some N ∈ N and a probability measure P such that
P[ωn] = pn > 0, for n = {1,...,N}
and that F = FT = P(Ω).
Recall the notation L(Ω,F,P) from (1.1) which denotes in the present case (as
pn > 0 for all n) the space of random variables (which are under the above
assumption on F all functions from Ω → R).
Definition 2.2.3. A (discounted) European contingent claim (derivative/option)
f is an element of L(Ω,F,P).18 Models of financial markets on finite probability spaces
Remark 2.2.4. The random variable f corresponds to the (discounted) payoff
function at time T. For instance, in a model with bank account S0
t = (1 + r)t
where r denotes the constant interest rate, we have in the case of a European
call option on the first asset with strike K,
f =
(b S1
T − K)+
(1 + r)T
= (S1
T − e K)+
,
where e K = K
(1+r)T .
Definition 2.2.5. • We call the subspace K ⊂ L(Ω,F,P)
K = {(H • S)T |H ∈ H}
the vector space of contingent claims attainable (replicable) at price 0.
• For a ∈ R, we call Ka := a + K the set of contingent claims attainable
(replicable) at price a.
The economic interpretation is the following: If f ∈ K, then there exists a
trading strategy H ∈ H such that f = (H • S)T , i.e. we can replicate f with
0 initial capital and trading accordingly to H. Similarly f ∈ Ka means that it
can be replicated with initial capital a and trading accordingly to some strategy
H such that f = a + (H • S)T .
Definition 2.2.6. • We call the set C ∈ L(Ω,F,P) defined by
C = {g ∈ L(Ω,F,P)|∃f ∈ K with f ≥ g}
the set of contingent claims super-replicable at price 0.
• For a ∈ R, we call Ca := a+C the set of contingent claims super-replicable
at price a.
The economic interpretation is as follows: If g ∈ C, it can be super-replicated
with 0 initial capital and trading accordingly to some strategy H such that we
arrive at some contingent claim f = (H • S)T ∈ K which satisfies f(ω) ≥ g(ω)
for every ω ∈ Ω (for general probability space it would be P-almost every ω).
For ω where f(ω) > g(ω) we consume or “throw away money”.
Remark 2.2.7. • The no-arbitrage condition (NA) is equivalent to
K ∩ L+(Ω,F,P) = {0},
where L+(Ω,F,P) denotes in our case (as pn > 0 for all n) the space of
nonnegative random variables, i.e. L+(Ω,F,P) = {f ∈ L(Ω,F,P)|f ≥
0} and 0 denotes the random variable which is identically equal to zero.
• (NA) is also equivalent to
C ∩ L+(Ω,F,P) = {0}.2.2 No-arbitrage and the fundamental theorem of asset pricing 19
• (NA) implies C ∩ (−C) = K.
Lemma 2.2.8. C is a closed convex cone.
Proof. For C to be a convex cone, we have to verify that for any positive
scalars λ1,λ2 and elements g1,g2 ∈ C, λ1g1 + λ2g2 ∈ C. Denote by f1,f2
the elements in K which dominate g1,g2 ∈ C. Then λ1f1 + λ2f2 ∈ K and
λ1f1 +λ2f2 ≥ λ1g1 +λ2g2. Concerning closedness, let (gk) ∈ C be a convergent
sequence with g = limk gk. Denote by fk ∈ K the elements dominating gk.
Then g ∈ C since g ≤ limsupfk ∈ K.
The goal is now to characterize models for which (NA) holds. The answer is
given by the so-called Fundamental Theorem of Asset Pricing of which we state
a first version:
Theorem 2.2.9 (FTAP (first formulation)). Let S = (S1,...,Sd) be a model
of a financial market in discounted terms. Suppose that Assumption 1 holds
true. Then the following assertions are equivalent:
1. S satisfies (NA).
2. There exists a measure Q ∼ P such that EQ[g] ≤ 0 for all g ∈ C.
Remark 2.2.10. A measure Q ∼ P which satisfies EQ[g] ≤ 0 for all g ∈ C is
usually called separating measure.
For the proof of this theorem (direction (1) ⇒ (2)) we need a version of the
separating hyperplane theorem. Basically, this theorem tells that, if we have two
convex sets, one closed and the other one compact (in the version we state) then
it is possible to stick a hyperplane between them. This should be intuitively
clear in R2, where a hyperplane is simply a line.
Theorem 2.2.11 (Separating Hyperplane Theorem, Hahn-Banach). Let A ⊆
RN be convex and closed and B ⊆ RN convex and compact such that A∩B = ∅.
Then there exists some non zero linear functional l : RN → R, i.e. a non-zero
vector y ∈ RN, and numbers α < β such that
l(a) = y>
a ≤ α for all a ∈ A,
l(b) = y>
b ≥ β for all b ∈ B.
Moreover, if A is a closed convex cone such that A ⊃ RN
−, α = 0.
The proof is based on the following lemma.
Lemma 2.2.12. Let D ⊆ RN be a closed convex set which does not contain
the origin 0. Then there exists a non-zero linear functional l : RN → R, i.e. a
non-zero vector y ∈ RN, such that for all x ∈ D, l(x) = y>x ≥ kyk2 > 0.20 Models of financial markets on finite probability spaces
Proof. Consider a closed ball of radius r which intersects the set D. Then the
function x 7→ kxk achieves its minimum at B(r)∩D at some x0 6= 0 as B(r)∩D
is compact and we have for all x ∈ D, kxk ≥ kx0k. As D is convex, we have for
λ ∈ [0,1]
λx + (1 − λ)x0 = x0 + λ(x − x0) ∈ D.
Hence kλx + (1 − λ)x0k2 ≥ kxk2. Expanding the left hand side yields
2λx>
0 (x − x0) + λ2
kx − x0k2
≥ 0,
from which we obtain x>
0 (x−x0) ≥ 0 (indeed, take λ small enough and suppose
that x>
0 (x−x0) < 0, then there appears a contradiction in the above inequality).
Hence and since x0 6= 0, we obtain
x>
0 x ≥ kx0k2
> 0.
The assertion follows by choosing y = x0.
We now apply this lemma to prove the Separating Hyperplane Theorem:
Proof. Proof of Theorem 2.2.11. Define D = B − A. Then D is closed and
convex and does not contain the origin as A ∩ B = ∅. Therefore we can apply
Lemma 2.2.12, stating that there exists some non-zero vector y, such that for
every D 3 x = b − a
y>
x = y>
(b − a) ≥ kyk2
.
This implies that
inf
b∈B
y>
b ≥ kyk2
+ sup
a∈A
y>
a,
whence infb∈B y>b > supa∈A y>a and defining β := infb∈B y>b and α := supa∈A y>a
yields the assertion.
Finally we prove that for a closed convex cone A with A ⊃ RN
−, α = 0. As
a = 0 ∈ A in this case, we certainly have α ≥ 0. Assume that α can not be
chosen 0. Then there exists some a such that y>a > α0 > 0. Since ka ∈ A for
every k ∈ R+ we obtain y>ka > kα0 and for k large enough kα0 > α which
contradicts the fact y>a ≤ α for all a ∈ A.
We are now ready to give the proof of the FTAP:
Proof. Proof of Theorem 2.2.9. (2) ⇒ (1): This is the obvious implication.
Assume by contradiction that (NA) does not hold. Then by Remark 2.2.7 there
exists some g ∈ C ∩L+(Ω,F,P) with g 6= 0. Then since Q ∼ P, we would have
EQ[g] > 0
which contradicts (2). (1) ⇒ (2): We apply the Separating Hyperplane Theo-
rem 2.2.11, with A := C, which is convex and closed by Lemma 2.2.8. Define
the set
B := {b ∈ L+(Ω,F,P)|EP [b] = 1}.2.2 No-arbitrage and the fundamental theorem of asset pricing 21
Then B is convex and compact. Indeed, concerning convexity we have for all
λ ∈ [0,1] and elements b1,b2 ∈ B
EP [λb1 + (1 − λ)b2] = λEP [b1] + (1 − λ)EP [b2] = 1.
Concerning compactness, we prove that B is closed and bounded. Indeed let
(bk)k ∈ B such that b̄ = limk bk then
EP [b̄] = EP [lim
k
bk] =
N X
n=1
lim
k
bk(ωn)pn = lim
k
N X
n=1
bk(ωn)pn = lim
k
E[bk] = 1,
whence B is closed. Concerning boundedness we have maxn∈{1,...,N} b(ωn) ≤
1
minn∈{1,...,N} pn
, which proves the claim. By Theorem 2.2.11 there exists some
functional l : L(Ω,F,P) → R, i.e., a random variable Y , and numbers α < β,
such that
l(g) =
N X
n=1
Y (ωn)g(ωn) ≤ α for all g ∈ C, (2.3)
l(b) =
N X
n=1
Y (ωn)b(ωn) ≥ β for all b ∈ B. (2.4)
As C is a closed convex cone containing L−(Ω,F,P), α = 0 by the second
assertion of Theorem 2.2.11. For every n we define now
Q[ωn] =
l(1ωn)
l(1Ω)
=
Y (ωn)
PN
i=1 Y (ωi)
,
which is strictly positive since l(1ωn) = pnl(1ωn
pn
) > 0 due to the fact that the
random variable b = 1ωn
pn
∈ B. Due to (2.3), we thus have for all g ∈ C
EQ[g] =
N X
n=1
g(ωn)Q[ωn] =
N X
n=1
g(ωn)
Y (ωn)
PN
n=1 Y (ωn)
≤ 0,
which proves the assertion.
In order to formulate a second version of the fundamental theorem, let us in-
troduce the notion of an equivalent martingale measure.
Definition 2.2.13. A probability measure Q on (Ω,F) is called an equivalent
martingale measure for the discounted assets S = (S1,...,Sd) if Q ∼ P and if
S is a martingale under Q, i.e.
E[St|Ft−1] = St−1, t ∈ 1,...,T.
We write Me(S) for the set of equivalent martingale measures and Ma(S) for
the set of absolutely continuous martingale measures (which are, due to the fact
that P(ω) > 0 for all ω ∈ Ω, all measures under which S is a martingale).22 Models of financial markets on finite probability spaces
The following lemma is left as an exercise to the reader.
Lemma 2.2.14. Let S be an Rd-valued martingale. Consider the stochastic
integral (H•S), where H denotes a predictable Rd-valued process. Then (H•S)
is a martingale, i.e.
E[(H • S)T |Ft] = (H • S)t, t = 0,...,T,
and in particular E[(H • S)T ] = 0.
Lemma 2.2.15. For a probability measure Q on (Ω,F) the following are equiv-
alent:
1. Q ∈ Ma,
2. EQ[f] = 0 for all f ∈ K,
3. EQ[g] ≤ 0 for all g ∈ C.
Proof. 1) ⇒ 2) This follows from Lemma 2.2.14.
2) ⇒ 1) We have to show that S is a Q martingale: S is adapted by definition,
thus it remains to prove EQ[St|Ft−1] = St−1. By the definition of the conditional
expectation we have for all Z ∈ L(Ω,Ft−1,Q)
EQ[EQ[St|Ft−1]Z] = EQ[StZ].
We thus have to prove that
EQ[St−1Z] = EQ[StZ]
for all Z ∈ L(Ω,Ft−1,Q), which is equivalent to
EQ[Z(St−1 − St)] = 0. (2.5)
By choosing Hu = Z1{t=u}, we can write Z(St−1 −St) = (H •S)T which lies in
K and therefore proves (2.5),
2) ⇒ 3) Let g ∈ C. Then there exists some K 3 f ≥ g and we know 0 =
EQ[f] ≥ EQ[g].
3) ⇒ 2) Let f ∈ K. Then f and −f ∈ C. Thus EQ[f] ≤ 0 and EQ[−f] ≤ 0,
whence EQ[f] = 0.
By the above lemma, we now get the following formulation of the FTAP, which
is the statement commonly used in the literature.
Theorem 2.2.16 (FTAP (usual formulation)). Let S = (S1,...,Sd) be a model
of a financial market in discounted terms. Suppose that Assumption 1 holds
true. Then the following assertions are equivalent:
1. S satisfies (NA)
2. There exists an equivalent martingale measure Q ∼ P for S, i.e. Me(S) 6=
∅.2.2 No-arbitrage and the fundamental theorem of asset pricing 23
Proof. The assertion follows from the first formulation of FTAP in Theorem 2.2.9
and the equivalence of (1) and (3) in the Lemma 2.2.15.
Remark 2.2.17. The intuitive interpretation of this result is as follows: A mar-
tingale S is a mathematical model for a perfectly fair game. Applying any
strategy H ∈ H we always have E[(H • S)T ] = 0, i.e., an investor can neither
lose or win in expectation. The above theorem tells that in the case of No-
arbitrage we can always pass to an equivalent measure Q ∼ P under which S
is a martingale, i.e. a perfectly fair game. Note that the passage from P to Q
may change the probabilities but not the impossible events. This means that
through a change of the probabilities the market becomes totally fair.
On the other hand a process allowing for arbitrage is a model for an utterly
unfair game. Choosing an appropriate strategy H, the investor is sure not
to lose but has strictly positive probability to gain something. Note that the
possibility of making an arbitrage is not affected by passing to an equivalent
probability Q.
Corollary 2.2.18. Let S satisfy (NA) and let f ∈ Ka be an attainable claim
at price a for some a ∈ R. In other words, f is of the form
f = a + (H • S)T
for some trading strategy H. Then the constant a and the process (H • S)t are
uniquely determined and satisfy for every Q ∈ Me(S)
a = EQ[f], a + (H • S)t = EQ[f|Ft], 0 ≤ t ≤ T. (2.6)
Proof. The equations in (2.6) arise from Lemma 2.2.14. Indeed under every
Q ∈ Me(S) we have EQ[(H • S)T ] = 0, whence a = EQ[f] and EQ[f|Ft] =
a+(H•S)t. Concerning uniqueness, assume that there are two representations,
namely f = a+(H •S)T and f = e a+( e H •S)T . By taking expectations under
some Q ∈ Me(S) we have
EQ[a + (H • S)T ] = EQ[e a + ( e H • S)T ],
whence a = e a. This implies (H • S)T = ( e H • S)T and taking conditional
expectations yields (H • S)t = ( e H • S)t.
Remark 2.2.19. • Note that the process H •S is unique, but there could be
strategies H 6= e H such that (H • S)t = ( e H • S)t.
• The representation f = a + (H • S)T means, that a is the fair price at
which we should buy or sell the contingent claim f. The strategy H is
the hedging strategy to perfectly replicate the claim.
The goal of the following propositions is to obtain a characterization of the
sets C and K in terms of Ma(S) and Me(S). Let us start with the following
proposition:24 Models of financial markets on finite probability spaces
Proposition 2.2.20. Suppose S satisfies (NA). Then the set Me(S) is dense
in Ma(S).
Proof. By Theorem 2.2.16, there is at least one Q∗ ∈ Me(S). For any Q ∈
Ma(S) and 0 < α < 1, we have that αQ∗ + (1 − α)Q ∈ Me(S), which clearly
implies the density of Me(S) in Ma(S).
In the following we introduce the notion of a polar set:
Definition 2.2.21. Let A ⊆ RN. Then the polar set is defined through
Ao
= {b ∈ RN
|b>
a ≤ 1 for all a ∈ A}.
If A is a cone, then the above definition is equivalent to
Ao
= {b ∈ RN
|b>
a ≤ 0 for all a ∈ A}.
Remark 2.2.22. The following properties are satisfied:
• If A ⊆ B, then Ao ⊇ Bo.
• If A is a cone, then Ao is a cone.
The so-called Bipolar-Theorem which we state without proof plays an important
role in the sequel:
Theorem 2.2.23 (Bipolar-Theorem). We always have A ⊆ Aoo and A = Aoo
holds if and only if A is convex and closed.
In analogy with the above definition (by a slight adaption of the scalar product),
we define the polar set of a set A ∈ L(Ω,F,P) as follows:
Ao
= {b ∈ L(Ω,F,P)|E[ba] ≤ 1 for all a ∈ A}.
and for a cone A as
Ao
= {b ∈ L(Ω,F,P)|E[ba] ≤ 0 for all a ∈ A}.
In the present context the polar cone of C plays a particular role and we have
the announced characterization of the cone C.
Proposition 2.2.24. Suppose S satisfies (NA). Then we have
Co
= cone(Ma
(S)),
where cone denotes the conic hull of Ma(S). Moreover, the following assertions
are equivalent:
1. g ∈ C.
2. EQ[g] ≤ 0 for all Q ∈ Ma(S).2.3 Complete models and their properties 25
3. EQ[g] ≤ 0 for all Q ∈ Me(S).
Proof. The assertions are a consequence of Lemma 2.2.15, Proposition 2.2.20
and the Bipolar-Theorem. See [1, Proposition 2.2.9] for details.
Similarly we get a characterization of the vector space K:
Corollary 2.2.25. Suppose S satisfies (NA). Then the following assertions are
equivalent:
1. f ∈ K.
2. EQ[f] = 0 for all Q ∈ Ma(S).
3. EQ[f] = 0 for all Q ∈ Me(S).
Proof. We have that f ∈ K if and only if f ∈ C ∩ (−C). Hence the result
follows from the preceding Proposition 2.2.24
This corollary has the following consequence:
Corollary 2.2.26. Suppose S satisfies (NA) and EQ[f] = a for all Q ∈ Me(S).
Then there exists some H ∈ H such that
f = a + (H • S)T ,
i.e. f is attainable at price a.
## 2.3 Complete models and their properties
Definition 2.3.1. A model of a financial market S (in discounted terms) is
called complete if every contingent claim f ∈ L(Ω,F,P) is attainable at some
price a, i.e for every f ∈ L(Ω,F,P) there exists some a ∈ R and H ∈ H such
that
f = a + (H • S)T .
From Corollary 2.2.26, we therefore obtain the so-called Second Fundamental
Theorem of Asset pricing, which states that an arbitrage-free model is complete
if an only if the equivalent martingale measure is unique.
Corollary 2.3.2 (Second Fundamental Theorem of Asset pricing). Suppose S
satisfies (NA). The following assertions are equivalent:
1. Me(S) consists of one single element.
2. The model is complete.26 Models of financial markets on finite probability spaces
Remark 2.3.3. Examples of complete models which are used in practice are the
Binomial model (see Chapter 3) and (in continuous time) the Black-Scholes
model.
For the following proposition, recall the notion of an atom as given in Defini-
tion 1.1.5.
Proposition 2.3.4. Let F0 = {∅,Ω}. Suppose that S satisfies (NA) and that it
is a complete model. Then the number of atoms in (Ω,FT ,P) is bounded from
above by (d + 1)T .
Proof. By proceed by induction on T. For T = 1 the assertion holds, since
solvability of the following linear system for any atom Ai ∈ F1
f(Ai) = a +
d X
j=1
Hj
1(S1(Ai) − S0)
for a ∈ R and H1 ∈ Rd, requires the number of atoms in Ω to be at most d+1.
Suppose the assertions holds for T−1. By assumption any claim f ∈ L(Ω,F,P)
can be written as
f = a + (H • S)T = VT−1 + HT (ST − ST−1).
VT−1 and HT are FT−1 measurable and hence constant (i.e. elements in R and
Rd respectively) on every atom A of (Ω,FT−1,P). Thus (Ω,FT ,P[·|A]) has at
most d + 1 atoms. Applying the induction hypothesis where we supposed that
(Ω,FT−1,P) has (d + 1)T−1 atoms concludes the proof.
For the formulation of the subsequent theorem, recall that Me(S) and Ma(S)
are convex sets. An element of a convex set is called an extreme point if it
cannot be written as a non-trivial convex combination of members of this set.
Theorem 2.3.5. Let F0 = {∅,Ω}. For Q ∈ Me(S), the following conditions
are equivalent:
• Me(S) = {Q}.
• Q is an extreme point of Me(S).
• Q is an extreme point of Ma(S).
• Every Q-martingale M can be represented as stochastic integral, i.e.
Mt = M0 + (H • S)t
The latter property is called predictable representation property or mar-
tingale representation property.2.4 Pricing by No-arbitrage 27
Proof. (1)⇒ (3): Suppose by contradiction that Q can be represented by a
non-trivial convex combination of elements in Ma(S), i.e. there exist some
λ ∈ (0,1) such that Q = λQ1 + (1 − λ)Q2 for Q1,Q2 ∈ Ma(S). By defining
Pi =
1
2
(Q + Qi)
we obtain two martingale measures which are equivalent to Q. Since Me(S)
contains only one element it follows that P1 = P2 = Q and thus also Q1 = Q2 =
Q.
(3)⇒ (2): This is obvious since Me(S) ⊂ Ma(S).
(2) ⇒ (1): Suppose there exists some Q∗ ∈ Me(S) which is different from Q.
Moreover, there exists a constant c such that Q∗
Q is bounded by c. For 0 < ε < 1
c,
we can define
Q0
= (1 + ε)Q − εQ∗
,
which defines another measure in Me(S). Then Q can be represented by
Q =
1
1 + ε
Q0
+
ε
1 + ε
Q∗
which contradicts (2).
(1) ⇒ (2): The terminal value of the martingale X, i.e. XT is a claim in
L(Ω,F,P) which is attainable by the second fundamental theorem. Hence
there exists some a and H ∈ H such that
XT = a + (H • S)T
By the martingale property of X and since a+(H•S)t is a martingale it follows
that
Xt = EQ[XT |Ft] = EQ[a + (H • S)T |Ft] = a + (H • S)t,
which proves the desired representation.
(4)⇒ (1): Let f ∈ L(Ω,F,P) be any claim. Define the martingale Xt =
EQ[f|Ft]. Then XT = f can be written as
XT = X0 + (H • S)T ,
and is thus attainable at price X0. Since f was arbitrary, we obtain that every
claim is attainable, and by the second fundamental theorem Me consists only
one element Q.
## 2.4 Pricing by No-arbitrage
In the general case when the market is not complete, the subsequent theorem
tells us what the principle of no-arbitrage implies about the possible prices for
a contingent claim f.
Let f ∈ L(Ω,F,P). Then we define an enlarged market by introducing a
new financial instrument Sd+1 which can be bought (or sold) at price a at28 Models of financial markets on finite probability spaces
t = 0 and generates a random payment f at time t = T. We do not postulate
anything about the price of this financial instrument at the intermediate times
t = 1,...,T − 1.
Definition 2.4.1. For a given discounted claim f ∈ L(Ω,F,P) we call a ∈ R
an arbitrage-free price, if there exists an adapted stochastic process Sd+1 such
that
Sd+1
0 = a and Sd+1
T = f (2.7)
and such that the enlarged market model (S1,...,Sd+1) is arbitrage-free.
Theorem 2.4.2. Suppose S = (S1,...,Sd) satisfies (NA) and let f ∈ L(Ω,F,P)
and suppose F0 = {∅,Ω}. Define
π(f) = inf
Q∈Me(S)
EQ[f],
π(f) = sup
Q∈Me(S)
EQ[f].
Then either (1) or (2) is satisfied:
1. π(f) = π(f). Then f is attainable at price a := π(f) = π(f), i.e.
f = a + (H • S)T
for some H ∈ H and a is the unique arbitrage-free price.
2. π(f) < π(f). Then we have
(π(f),π(f)) = {EQ[f]|Q ∈ Me
(S)}
and a is an arbitrage-free price for f if and only if a ∈ (π(f),π(f)).
Remark 2.4.3. From the above theorem we see that the arbitrage-free prices are
in any case of the form EQ[f] for some Q ∈ Me(S).
Proof. • Case 1: π(f) = π(f) =: a implies a = EQ[f] for all Q ∈ Me(S) and
by Corollary 2.2.26 there exists some H ∈ H such that f = a+(H •S)T .
If one could buy f for another price this would generate an arbitrage
opportunity.
• Case 2: First observe that I := {EQ[f]|Q ∈ Me(S)} is an interval, since
it is convex and bounded. Concerning convexity let a1,a2 ∈ I. Then there
exists some Q1 and Q2 with a1 = EQ1[f] and a2 = EQ2[f]. For λ ∈ [0,1],
we then have a = λa1 + (1 − λ)a2 = λEQ1[f] + (1 − λ)EQ2[f] = EQ[f]
where Q = λQ1 +(1−λ)Q2 ∈ Me(S) since Me(S) is convex. Concerning
boundedness, we have mini f(ωi) ≤ EQ[f] ≤ maxi f(ωi).
We now claim that a ∈ I if and only if a is an arbitrage-free price. First, let
a ∈ I. Then there exists some Q ∈ Me(S) with a = EQ[f]. Let us define2.4 Pricing by No-arbitrage 29
the stochastic process Sd+1
t := EQ[f|Ft], which satisfies all requirements
of (2.7). Note that Q is an equivalent martingale measure for the extended
market (S1,...,Sd+1), since EQ[Sd+1
t+1 |Ft] = EQ[EQ[f|Ft+1]|Ft] = Sd+1
t .
Hence by the FTAP the extended market satisfies (NA).
Let a be an arbitrage-free price, i.e. the extended market (S1,...,Sd+1)
satisfies (NA). By FTAP (Theorem 2.2.16) there exists some b Q such that
(S1,...,Sd+1) is a martingale, i.e.
Eb Q
[Si
T |Ft] = Si
t, t = 0,...,T, ,i = 1,...,d + 1.
This implies that b Q ∈ Me(S) and Eb Q
[f] = a and thus a ∈ I.
It remains to prove that I is an open interval: This means that we have
to show that π(f) / ∈ I (and analogously for π(f) / ∈ I). Note first that
EQ[f −π(f)] ≤ 0 for all Q ∈ Me(S), which implies by Proposition 2.2.24
that f − π(f) ∈ C. Therefore there exists some g ∈ K such that g ≥
f−π(f). If π(f) ∈ I, i.e. if there exists some Q∗ such that EQ∗[f] = π(f),
then we have
0 = EQ∗[g] ≥ EQ∗[f − π(f)] = 0,
and thus EQ∗[g − (f − π(f))] = 0, which implies in view of g ≥ f − π(f)
that K 3 g ≡ f −π(f). Therefore f ∈ Kπ(f), i.e. f is attainable at price
π(f), which in turn implies that EQ[f] = π(f) for all Q ∈ Me(S) and I
is therefore reduced to the singleton {π(f)} and we are back in case 1,
which is a contradiction.
The analog proof works for π(f) and it follows that the I is the open
interval (π(f),π(f)).
Corollary 2.4.4 (Superreplication). Suppose S = (S1,...,Sd) satisfies (NA).
Then we have for f ∈ L(Ω,F,P)
π(f) = sup
Q∈Me(S)
EQ[f] = max
Q∈Ma(S)
EQ[f]
= min{a ∈ R| there exists H ∈ H with f ≤ a + (H • S)T },
and
π(f) = inf
Q∈Me(S)
EQ[f] = min
Q∈Ma(S)
EQ[f]
= max{a ∈ R| there exists H ∈ H with f ≥ a + (H • S)T }.
Proof. The set Ma(S) is closed and bounded (in the topology of RN), thus
compact. The function Q 7→ EQ[f] is continuous. A continuous function on a
compact set takes its maximum/minimum. We only prove the first assertion,
the second one follows analogously. We first prove
max
Q∈Ma(S)
EQ[f] ≤ inf{a ∈ R| there exists H ∈ H with f ≤ a + (H • S)T }.30 Models of financial markets on finite probability spaces
Take some a such that there exists some H ∈ H such that f ≤ a + (H • S)T .
Taking Q ∈ Ma(S) yields
EQ[f] ≤ EQ[a + (H • S)T ].
and thus EQ[f] ≤ a as Q ∈ Ma(S). Since this holds for all Q, it follows that
max
Q∈Ma(S)
EQ[f] ≤ inf{a ∈ R| there exists H ∈ H with f ≤ a + (H • S)T }.
In order to prove the other direction, we have that f − π(f) ∈ C since EQ[f −
π(f)] ≤ 0 for all Q ∈ Ma(S). Thus there exists an element g ∈ K such that
f − π(f) ≤ g. As g ∈ K there exists some H ∈ H such that g = (H • S)T and
we obtain
f − π(f) ≤ (H • S)T ⇔ f ≤ π(f) + (H • S)T ,
from which we obtain
π(f) ∈ {a ∈ R| there exists H ∈ H with f ≤ a + (H • S)T }
and thus
inf{a ∈ R| there exists H ∈ H with f ≤ a+(H•S)T } ≤ π(f) = max
Q∈Ma(S)
EQ[f].
All together we have
inf{a ∈ R| there exists H ∈ H with f ≤ a + (H • S)T } = π(f),
which implies that the infimum is actually a minimum as
π(f) ∈ {a ∈ R| there exists H ∈ H with f ≤ a + (H • S)T }.
Remark 2.4.5. • The expression {a ∈ R| there exists H ∈ H with f ≤
a + (H • S)T } is called superhedging price. The interpretation of the
above theorem is π(f) is exactly the minimal capital which is needed to
superhedge the claim.
• In the case π(f) ≤ π(f), the interval (π(f),π(f)) is exactly the set of
arbitrage-free prices. This means if one buys or sells f at price π(f), then
there exists an arbitrage opportunity.
## 2.5 The optional decomposition theorem
We now present a dynamic version of the superreplication result due to Dimitry
Kramkov, who proved this result in a much more general context (continuous
time).2.5 The optional decomposition theorem 31
Theorem 2.5.1 (Optional decomposition). Assume that S satisfies (NA) and
let V be an adapted process. Then the following assertions are equivalent:
1. V is a supermartingale for all Q ∈ Me(S).
2. V is a supermartingale for all Q ∈ Ma(S).
3. V can be decomposed into Vt = V0 +(H •S)t −Ct where H ∈ H and C is
an increasing adapted process starting at C0 = 0.
Remark 2.5.2. 1. Let us compare the assertion of the above theorem with
the Doob composition of supermartingales. Indeed the latter asserts that
there is equivalence between a supermartingale and the fact that a process
can be written in terms of V = V0+M−A where M is a martingale and A
an increasing predictable process. The above theorem is similar in spirit,
but there are significant differences:
• The supermartingale property pertains to all (absolutely continu-
ous/equivalent) martingale measures Q and the role of the martin-
gale is played by the stochastic integral H • S.
• Another difference is the fact that the decomposition is no longer
unique and one cannot choose, in general, C to be predictable but
only adapted. In continuous time it is a so-called optional process
(which is equivalent to adapted in discrete time), which explains the
name optional decomposition.
2. In the case of complete models when |Me(S)| = 1, the above theorem is
essentially the Doob decomposition.
3. The economic interpretation of the optional decomposition theorem reads
as follows: A process of the form V = V0 + H • S − C describes the
wealth process. Starting with initial capital V0, trading according to the
strategy H and consuming according to the process C which models the
accumulated consumption, one obtains Vt. The assertion of the optional
decomposition theorem is that these wealth processes are characterized
by condition (i) (or (ii)), namely the supermartingale property for all
martingale measures.
4. It is possible to obtain the superhedging result from the optional decom-
position. Indeed assume F0 = {∅,Ω} and let f ∈ L(Ω,F,P) Define
Vt = sup
Q∈Me(S)
EQ[f|Ft].
Then it can be shown that Vt is a supermartingale for all Q ∈ Me. Indeed,
it holds that
Vt = sup
Q∈Me(S)
EQ[Vt+1|Ft].
Hence for every specific Q ∈ Me(S) we have
Vt ≥ EQ[Vt+1|Ft],32 Models of financial markets on finite probability spaces
implying that V is a supermartingale. By the optional decomposition
theorem there exists H,C with Vt = V0 + (H • S)t − Ct and
f = VT = V0 + (H • S)T − CT ≤ V0 + (H • S)T
= sup
Q∈Me(S)
EQ[f] + (H • S)T = π(f) + (H • S)T
Proof. First assume T = 1. Then V is a supermartingale for all Q ∈ Me(S) is
equivalent to
EQ[V1] ≤ V0 for all Q ∈ Me
(S) ⇔ EQ[V1 − V0] ≤ 0 for all Q ∈ Me
(S) .
This means that V1 − V0 ∈ C, hence there exists a strategy H such that (H •
S)1 ≥ V1−V0. Letting C0 = 0 and writing C1 = C1−C0 = −V1+V0+(H•S)1 ≥
0 yields the desired decomposition in the case T = 1.
For general T, consider for every t ∈ {1,...,T} the one period market from
t − 1 to t. The supermartingale property for all Q ∈ Me(S) means that
EQ[Vt − Vt−1|Ft−1] ≤ 0 for all Q ∈ Me
(S),
and implies EQ[Vt − Vt−1] ≤ 0 for all Q ∈ Me(S). Therefore there exists a
Ft−1 measurable random variable Ht such that Vt −Vt−1 ≤ H>
t (St −St−1) and
Ct − Ct−1 := H>
t (St − St−1) − (Vt − Vt−1) ≥ 0. Note that C is inductively
defined if we start with C0 = 0 and we have
Ct = Ct−C0 =
t X
i=1
(Ci−Ci−1) =
t X
i=1
(H>
i (Si−Si−1)−(Vi−Vi−1)) = (H•S)t+Vt−V0,
which is an increasing adapted process. Hence Vt = V0 + (H • S)t − Ct, which
proves (1) ⇒ (3). Concerning the direction (3) ⇒ (2) we have for all Q ∈ Ma(S)
EQ[Vt|Ft−1] = EQ[V0 + (H • S)t − Ct|Ft−1]
= V0 + (H • S)t−1 − Ct−1 − EQ[Ct − Ct−1|Ft−1]
≤ V0 + (H • S)t−1 − Ct−1,
which proves (2). The direction (2) ⇒ (1) is obvious.Chapter 3
The Binomial model
(Cox-Ross-Rubinstein model)
The Binomial model or Cox-Ross-Rubinstein model is a particular complete
model. Therefore all properties derived in Section 2.3 pertain to this model.
## 3.1 Definition of the Binomial model and first prop-
erties
This section is mainly based on [2, Chapter 5.5].
By Proposition 2.3.4 a complete market with only one asset must have a binary
tree structure (the number of atoms is bounded from above by 2T ). Under an
additional homogeneity assumption this reduces to the following particularly
simple model, which was introduced by Cox, Ross, Rubinstein. The model
consist of only one (discounted) asset S = S1, whose return
Rt :=
St − St−1
St−1
can take two values a,b ∈ R such that −1 < a < b. Therefore the asset prices
can be expressed via
St = St−1(1 + Rt) =
(
St−1(1 + b),
St−1(1 + a).
We construct the model on the following probability space:
Ω := {−1,1}T
= {ω = (y1,...,yT )|yi ∈ {−1,1}}
The canonical process is defined as follows:
Yt : Ω → R, Yt(ω) = Yt(y1,...,yT ) = yt
3334 The Binomial model (Cox-Ross-Rubinstein model)
Formally, we define
Rt(ω) =
(
b if Yt(ω) = yt = 1,
a if Yt(ω) = yt = −1.
The price process of S is modeled as
St = S0Πt
k=1(1 + Rk), S0 ∈ R+.
As filtration we take
Ft = σ(S0,...,St) = σ(Y0,...,Yt)) = σ(R0,...,Rt)
and note that F0 = {∅,Ω} as S0 is constant and FT = P(Ω). Let us fix a
probability measure P such that P[ω] > 0 for every ω ∈ Ω. Such a model is
called Binomial or CRR model.
The following theorem characterizes the parameter values for which the model
is arbitrage free.
Theorem 3.1.1. The CRR model satisfies (NA) if and only if a < 0 < b. In
this case, the CRR model is complete and Me(S) = Q. The martingale measure
is characterized by the fact that
1. R1,...,RT are independent.
2. Q[Rt = b] = q = −a
b−a.
Remark 3.1.2. Recall the independence of random variables X1,...,XN. In-
deed X1,...,XN are independent if the σ-algebras generated by them, i.e.
σ(X1),...,σ(XN) are independent. This in turn means that for any combi-
nation of Ai ∈ σ(Xi), i = 1,...,n ≤ N, we have P[
T
Ai] =
Q
P[Ai].
Remark 3.1.3. Recall the following notions of independence:
• A set A is independent of a σ-algebra G if for all sets B ∈ G, P[A ∩ B] =
P[A]P[B].
• A random variable X is called independent of a sigma algebra G if all sets
of σ(X) are independent of G.
Lemma 3.1.4. A set A is independent of a σ-algebra G if and only if
P[A|G] = P[A]
Proof. Let B1,...Bm denote the atoms of G. Then
P[A|G] = P[A] ⇔ P[A|Bi] = P[A] for all i,
⇔
P[A ∩ Bi]
P[Bi]
= P[A] for all i,
⇔ P[A ∩ Bi] = P[A]P[Bi] for all i.3.1 Definition of the Binomial model and first properties 35
Proof. Proof of Theorem 3.1.1: S satisfies (NA) if and only if there exists some
Q ∈ Me(S), i.e.
EQ[St|Ft−1] = St−1, t = 1,...,T.
This is turn equivalent to
EQ[St−1(1 + Rt)|Ft−1] = St−1
⇔St−1EQ[(1 + Rt)|Ft−1] = St−1
⇔EQ[(1 + Rt)|Ft−1] = 1
⇔EQ[Rt|Ft−1] = 0
⇔bQ[Rt = b|Ft−1] + aQ[Rt = a|Ft−1] = 0
⇔bQ[Rt = b|Ft−1] + a(1 − Q[Rt = b|Ft−1]) = 0
⇔(b − a)Q[Rt = b|Ft−1] = −a
⇔Q[Rt = b|Ft−1](ω) =
−a
b − a
=: q, for all ω ∈ Ω.
For notational reasons we leave ω away in all equations except the last one.
This holds if and only if Rt is independent of Ft−1 and we have Q[Rt = b] = q.
Indeed by the above Lemma the set {Rt = b} is independent of Ft−1, thus also
the set {Rt = a} and thus also the random variable Rt since
σ(Rt) = {∅,Ω,{Rt = b},{Rt = a}}.
As the sigma algebra Ft is generated by R1,...,Rt−1 the independence of
R1,...,RT follows.
As Q ∈ Me(S), the condition P ∼ Q, implies that
Q[Rt = b] = q ∈ (0,1),
which holds if and only if a < 0 < b.
Conversely , if a < 0 < b we can define a measure Q ∼ P such that
Q[ω] = qk
(1 − q)T−k
> 0,
where k denotes the number of occurrences of +1 in ω. Under Q, Y1,...,YT
and thus R1,...,Rk are independent and Q[Yt = 1] = q = −a
b−a. Independence
holds because
Q[
n \
i=1
{Yi = ±1}] = qk
(1 − q)n−k
=
Y
Q[{Yi = ±1}],
where k denotes the number of +1 in the sets {Yi = ±1}. As Q[Yt = 1] =
Q[Rt = b] = −a
b−a, it follows from above that Q ∈ Me(S).
Let us now turn to the problem of pricing and hedging a given contingent claim
f ∈ L(Ω,FT ,P). Note that since the σ-algebra FT is generated by S0,...,ST
the claim f is of form
f = f(S0,...,ST )
for some suitable function f.36 The Binomial model (Cox-Ross-Rubinstein model)
Proposition 3.1.5. Let f ∈ L(Ω,FT ,P) with f = f(S0,...,ST ) = a+(H•S)T
for some a ∈ R and H ∈ H. Then the value process of the replicating strategy,
i.e.
Vt = a + (H • S)t = EQ[f|Ft]
satisfies Vt = vt(S0,S1,...,St) where vt : Rt+1 → R,
vt(x0,...,xt) = EQ[f(x0,...,xt,
xt
S0
S1,...,
xt
S0
ST−t)].
For the proof of this assertion we apply the so-called Independence Lemma,
which we here state without proof.
Lemma 3.1.6 (Independence Lemma). Let (Ω,F,P) be a probability space
and G ⊂ F a sub-σ-algebra. Assume that the random variables X1,...,Xk are
G-measurable and that the random variables Y1,...,Ym are independent of G.
Moreover, let f : Rk+m → R be a function and define g : Rk → R via
g(x1,...,xk) = E[f(x1,...,xk,Y1,...,Ym)].
Then we have
E[f(X1,...,Xk,Y1,...,Ym)|G] = g(X1,...,Xk).
Remark 3.1.7. The interpretation is as follows the realizations of the random
variables X1,...,Xk are known due their G measurability. Therefore they can
be treated like constants. The other random variables Y1,...,Ym are indepen-
dent of G and therefore we can simply build the usual expectation.
Proof. Proof of Proposition 3.1.5 We have to show that
Vt = EQ[f(S0,...,ST )|Ft] = vt(S0,...,St).
First note that vt(S0,...,St) is Ft-measurable. Let us write
EQ[f(S0,...,ST )|Ft] = EQ[f(S0,...,St,
St+1
St
,...St
ST
St
)|Ft].
Since S0,...,St is Ft-measurable and since St+s
St
=
Qt+s
k=t+1(1 + Rk) is indepen-
dent of Ft (under Q) and has the same distribution as Ss
S0
=
Qs
k=1(1+Rk), the
independence lemma yields the assertion.
Remark 3.1.8. 1. The above proof can be rephrased as follows: We have to
find the conditional distribution of (S1,...,St) given Ft, which means
finding Q[···|{S0 = x0,S1 = x1,...,St = xt}]. This is again a Binomial
model with T −t periods and starts at xt instead of S0 and thus we have
to rescale Si with the factor xt
S0
.3.1 Definition of the Binomial model and first properties 37
2. Note that VT = f and by the martingale property of Vt = EQ[f|Ft]
we have Vt = EQ[Vt+1|Ft]. Therefore we obtain the following recursion
formula:
vT (x0,...,xt) = f(x0,...,xT ),
vt(x0,...,xt) = EQ[Vt+1|{S0 = x0,...,St = xt}]
= EQ[vt+1(x0,...,xt,xt
St+1
xt
)]
= qvt+1(x0,...,xt,xt(1 + b)) + (1 − q)vt+1(x0,...,xt,xt(1 + a)).
3. In particular for an option whose payoff f only depends on St we have
Vt = vt(St) = qvt+1(St(1 + b)) + (1 − q)vt+1(St(1 + a))
and formula of Proposition 3.1.5 simplifies to the expectation with respect
to the binomial distribution B(T − t,q).
vt(xt) =
T−t X
k=0
f(xt(1 + a)T−t−k
(1 + b)k
)

T − t
k

qk
(1 − q)T−t−k
.
Note that for the conditional (with respect to Ft) distribution of ST we
have
Q[ST = xt(1 + a)T−t−k
(1 + b)k
|St = xt] =

T − t
k

qk
(1 − q)T−t−k
.
In particular the unique arbitrage-free price of a derivative with payoff
f(ST ) is given by
v0(S0) =
T X
k=0
f(S0(1 + a)T−t−k
(1 + b)k
)

T
k

qk
(1 − q)T−k
.
Example 3.1.9. Denote by Mt := maxs≤t Ss, t ≤ T, the running maximum
and consider a claim f = f(ST ,MT ), for instance a lookback put with floating
strike, i.e.
f(ST ,MT ) = MT − ST .
Then the value process Vt is of the form
Vt = vt(St,Mt),
where vt(xt,mt) = EQ[f(xt
ST−t
S0
,mt ∨xt
MT−t
S0
)]. This follows from the fact that
MT = Mt ∨ St max
t≤u≤T
Su
St
,
where maxt≤u≤T
Su
St
is independent of Ft and has the same law as MT−t/S0
under Q.38 The Binomial model (Cox-Ross-Rubinstein model)
Let us now derive the following hedging formula in the Binomial model.
Proposition 3.1.10. In order to replicate an option f(S0,S1,...,ST ), one has
to trade according to the strategy H given by
Ht+1(ω) = ∆t+1(S0,S1(ω),...,St(ω)), (3.1)
where
∆t+1(x0,x1,...,xt) =
vt+1(x0,x1,...,xt(1 + b)) − vt+1(x0,x1,...,xt(1 + a))
xt(b − a)
,
i.e., the strategy H in the representation
Vt = a + (H • S)t
is given by (3.1)
Proof. Subtracting Vt = a + (H • S)t from Vt+1 = a + (H • S)t+1 yields
Vt+1 − Vt = Ht+1(St+1 − St).
The left hand side is given by
Vt+1 − Vt =
(
vt+1(S0,S1,...,St(1 + b)) − Vt if Rt+1 = b
vt+1(S0,S1,...,St(1 + a)) − Vt if Rt+1 = a
(3.2)
=
(
Ht+1(St(1 + b) − St) if Rt+1 = b
Ht+1(St(1 + a) − St) if Rt+1 = a
(3.3)
Solving for Ht+1 yields the claim.
## 3.2 Exotic derivatives
This section is taken from [2, Section 5.6].
The above recursion formula can be used for the numeric computation of the
value process of any contingent claim. For the value processes of certain exotic
derivatives which depend on the maximum of the stock price, it is possible to
obtain simple closed-form solutions if we make the additional assumption that
1 + a =
1
1 + b
.
In this case we have
St = S0(1 + b)Zt
,
where
Z0 = 0, Zt :=
t X
i=1
Yi, t = 1,...,T.3.2 Exotic derivatives 39
Let P denote the uniform distribution on Ω, i.e.,
P[{ω}] =
1
|Ω|
= 2−T
.
Under P, the random variables Yt are independent with common distribution
P[Yt = +1] =
1
2
.
Thus, the stochastic process Z becomes a standard random walk under P.
Therefore,
P[Zt = k] =
(
2−t t
t+k
2

if t + k even
0 if t + k odd.
(3.4)
For further use, we denote the running maximum of Z by Mt := max0≤s≤t Zs.
## 3.2.1 Reflection principle
The following proposition is a classical result for the standard random walk and
can be proved by the reflecting the paths of the random walk at some level k.
Lemma 3.2.1 (Reflection principle). For all k ∈ N and l ∈ N0, we have
P[MT ≥ k and ZT = k − l] = P[ZT = k + l]
and
P[MT = k and ZT = k − l] = 2
k + l + 1
T + 1
P[ZT+1 = 1 + k + l]
Proof. For the proof we refer to [2, Lemma 5.48].
We are now interested in getting a similar result under the martingale measure
Q. Under the martingale measure Q with Q[Yt = 1] = −a
b−a = q, we have for
n ∈ N
Q[Zt = n − (t − n)] = Q[Zt = 2n − t] =

t
n

qn
(1 − q)t−n
.
Thus for k = 2n − t, i.e. for k + t an even number it follows that
Q[Zt = k] =

t
t+k
2

q
t+k
2 (1 − q)
t−k
2
otherwise Q[Zt = k] = 0.
The reflection principle under Q now reads as follows:40 The Binomial model (Cox-Ross-Rubinstein model)
Lemma 3.2.2 (Reflection principle under Q). For all k ∈ N and l ∈ N0, we
have
Q[MT ≥ k and ZT = k−l] =

1 − q
q
l
Q[ZT = k+l] =

q
1 − q
k
Q[ZT = −k−l]
and
Q[MT = k and ZT = k − l] =

1 − q
q
l
1
q
k + l + 1
T + 1
Q[ZT+1 = 1 + k + l].
Proof. We show first that the Radon Nykodym derivative is given by
Q[{ω}]
P[{ω}]
= 2T
q
T+ZT
2 (1 − q)
T−ZT
2 .
Indeed, we have
Q[{ω}] = qk
(1 − q)T−k
, P[{ω}] = (
1
2
)T
for each ω = (y1,...,YT ) which contains exactly k components with yi = 1.
Since for such an ω, ZT = k−(T −k) = 2k−T the above formula follows. Take
now
Q[MT ≥ k,ZT = k − l] = 2T
q
T+k−l
2 (1 − q)
T+l−k
2 P[MT ≥ k,ZT = k − l]
Applying the reflection principle using again the density formula we have
P[ZT = k + l] = 2−T
q
−(T+k+l)
2 (1 − q)
−(T−k−l)
2 Q[ZT = k + l],
which yields the claim for the first identity. The rest follows analogously.
The above reflection principle can now be applied in order to compute the prices
of exotic options in the CRR model, i.e. options whose payoff depends on the
path of the asset price (in contrast to plain vanilla options whose payoff only
depends on the terminal value).
An example is the so-called Up-and-in call option whose price is computed in [2,
Example 5.50].
## 3.3 Convergence to the Black Scholes Price
The goal of this section is to prove the convergence of pricing formulas in the
CRR model in discrete time to a limit in continuous time. More precisely, we
will show that the CRR model converges to the Black Scholes model and that
we obtain the famous Black Scholes formula for the price of a call option.
Let T be a fixed time horizon (not the number of trading periods as usual) and
divide the interval [0,T] in N equidistant time steps T
N , 2T
N ,..., NT
N for some
N ∈ N.3.3 Convergence to the Black Scholes Price 41
For each market N we consider a CRR model with
1 + aN =
1
1 + bN
.
Recall that in this case we can write
SkT
N
(ω) = S0(1 + bN)Zk(ω)
,
where Zk(ω) =
Pk
i=1 Yi(ω). Set now 1 + bN = e
σ
q
T
N and 1 + aN = e
−σ
q
T
N .
We denote the risk neutral measure by QN for which QN[Rt = b] = −aN
bN−aN
=:
qN.
We have the following lemma whose proof is left to the reader.
Lemma 3.3.1. We have
qN =
1
2
−
σ
4
r
T
N
+ o(
1
√
N
)
1 − qN =
1
2
+
σ
4
r
T
N
+ o(
1
√
N
),
where the notation o( 1 √
N
) stands for a term which goes ot 0 faster than 1 √
N
.
Lemma 3.3.2. Under the risk-neutral measure QN we have
EQN
[Yj] = −
σ
2
r
T
N
+ o

1
√
N

,
VarQN
[Yj] = 1 + o

1
√
N

.
Proof.
EQN
[Yj] = qN1 + (1 − qN)(−1) =
1
2
−
σ
4
r
T
N
−
1
2
−
σ
4
r
T
N
= −
σ
2
r
T
N
+ o

1
√
N

.
For the variance we have
VarQN
[Yj] = EQN
[Y 2
j ]−(EQN[Yj])2
= 1−(
σ
2
r
T
N
+o

1
√
N

)2
= 1+o(
1
√
N
).
We now apply the following version of the Central Limit Theorem which we
state without proof:
Theorem 3.3.3. Suppose for each N ∈ N we are given N independent random
variables X
(N)
1 ,...,X
(N)
N on (ΩN,FN,QN) which satisfy the following condi-
tions42 The Binomial model (Cox-Ross-Rubinstein model)
• There exist constants γN such that γN → 0 and |X
(N)
k | ≤ γN;
•
PN
k=1 EQN
[X
(N)
k ] → m;
•
PN
k=1 V arQN
[X
(N)
k ] → σ2.
Then the distribution of
N X
k=1
X
(N)
k ,
converges weakly to the normal distribution with mean m and variance σ2.
Theorem 3.3.4. Under the above assumptions, the distribution of S
(N)
T =
S
(N)
TN
N
= S0(1 + bN)ZN under QN converge weakly to the log-normal distribution
with parameters logS0 − 1
2σ2T and σ2T, i.e. to the distribution of
ST = S0 exp(σ
√
TY −
1
2
σ2
T), (3.5)
where Y is standard normally distributed.
Proof. We apply the above CLT to the random variable X
(N)
i = Yi √
N
. Then we
have |X
(N)
k | = | Yi √
N
| ≤ 1 √
N
. Moreover,
N X
k=1
EQN
[
Yk
√
N
] = NEQN
[
Yk
√
N
] =
√
NEQN
[Yk] = −
σ
2
√
T + o(1)
and for the variance we have due to the independence
N X
k=1
VarQN
[
Yk
√
N
] = NVarQN
[
Yk
√
N
] = N
1
N
VarQN
[Yk] = 1 + o(
1
√
N
).
Therefore
ZN
√
N
=
N X
i=1
Yi
√
N
converges weakly to the normal distribution with mean σ
2
√
T and variance 1.
Then in turn S
(N)
T = S0(e
σ
q
T
N )ZN converges weakly to
ST = S0eσ
√
T(Y −σ
2
√
T)
where Y is a standard normal distributed random variable. This proves the
assertion.3.3 Convergence to the Black Scholes Price 43
## 3.3.1 Derivative pricing and limits
Consider a payoff C(N) = f(S
(N)
T ). Then the following corollary allows to obtain
its price in the Black & Scholes model as limit of the arbitrage-free prices in
the Binomial model.
Corollary 3.3.5. Let f be continuous and bounded, then the arbitrage-free price
of the derivative with payoff C(N) computed as expectation under the risk neutral
measure QN converges to the expectation under a log-normal distribution, which
is often called the Black & Scholes price. More precisely,
lim
N→∞
EQN
h
C(N)
i
= EQ[f(ST )] =
1
√
2π
Z ∞
−∞
f(S0eσ
√
Ty−σ2 T
2 )e
y2
2 dy,
where ST has the form (3.5) under Q.
Proof. This is a consequence of the definition of weak convergence and the
continuous mapping theorem.
This result applies in particular to the bounded payoff of a put (K −x)+. The
Put-Call Parity relation then allows to transfer the convergence also to the call,
which then yields the famous Black & Scholes formula. We refer to [2, Example
5.57] and the discussions below.44 The Binomial model (Cox-Ross-Rubinstein model)Chapter 4
American Options
This chapter is based to a great extend on [2, Section 6.1 and 6.2].
## 4.1 Pricing and Hedging from the perspective of the
seller
We refer to [2, Section 6.1].
## 4.2 Stopping strategies for the buyer
This section is based on [2, Section 6.2].
As in [2, Section 6.1] we assume that the model is a complete model of a financial
market in discrete time with finite time horizon T and martingale measure Q.
We consider here the perspective of the buyer. Her goal is to optimize the
exercise strategy. The natural assumption is that the decision to exercise the
option only depends on the information at time t (modeled via the filtration
(F)t). This leads to the concept of a stopping time.
Definition 4.2.1. A random variable τ : Ω → {0,1,...,T} ∪ {∞} is called
stopping time if {τ = t} is Ft-measurable for t = 0,...,T.
The buyer’s problem is to find the optimal exercise time within the following
set of stopping times:
T := {τ |τ is a stopping time with τ ≤ T},
i.e. all stopping times which do not take the value ∞.
Let (ft) be the payoff of the American option. Then the buyer’s goal is to
choose τ such that
EQ[fτ] maximal among all τ ∈ T .
4546 American Options
This is called optimal stopping problem. The stopping time being a solution of
such an optimal stopping problem is called optimal, which is precisely defined
below.
Definition 4.2.2. A stopping time τ∗ is called optimal for an American option
with payoff (ft) if
E[fτ∗] = sup
τ∈T
EQ[fτ].
We are now interested in finding optimal stopping times. Denote the Snell
envelope of (ft) by (Vt) and define the stopping time
τmin := min{t ≥ 0|Vt = ft}.
Note that τmin ≤ T since VT = fT . In the theorem below we prove that τmin is
optimal. For the formulation of the theorem let us introduce
τ
(t)
min := min{u ≥ t|Vu = fu}
which is a member of the set Tt := {τ ∈ T |τ ≥ t}.
Theorem 4.2.3. The Snell envelope V of f satisfies
Vt = EQ[fτ
(t)
min
|Ft] = sup
τ∈Tt
EQ[fτ|Ft].
In particular
V0 = EQ[fτmin] = sup
τ∈T
EQ[fτ],
i.e. τmin is optimal.
Proof. Since V is a supermartingale, we know that for every stopping time τ,
(Vt∧τ)t is a supermartingale. In particular, for τ ∈ Tt, we have
Vt = Vt∧τ ≥ EQ[VT∧τ|Ft] = EQ[Vτ|Ft] ≥ EQ[fτ|Ft].
Therefore, Vt ≥ supτ∈Tt
EQ[fτ|Ft]. Since EQ[fτ
(t)
min
|Ft] ≤ supτ∈Tt
EQ[fτ|Ft]
holds trivially, the theorem is proved if we can show that Vt = EQ[fτ
(t)
min
|Ft]. By
the definition of τ
(t)
min, we have fτ
(t)
min
= Vτ
(t)
min
. Thus this is implied by
Vt = EQ[Vτ
(t)
min
|Ft]. (4.1)
In order to prove (4.1), denote
V (t)
s = Vs∧τ
(t)
min
, s ∈ [t,T].
On the set {t
(t)
min > s}, Vs > fs. Hence
V (t)
s 1{t
(t)
min>s}
= Vs1{t
(t)
min>s}
= (fs ∨ EQ[Vs+1|Fs])1{t
(t)
min>s}
= EQ[Vs+1|Fs]1{t
(t)
min>s}
= EQ[V
(t)
s+1|Fs]1{t
(t)
min>s}
.4.2 Stopping strategies for the buyer 47
On the set {t
(t)
min ≤ s}, we have V
(t)
s+1 = Vt
(t)
min
= V
(t)
s . Hence
1{t
(t)
min≤s}
V (t)
s = EQ[V
(t)
s+1|Fs]1{t
(t)
min≤s}
.
Hence V
(t)
s = EQ[V
(t)
s+1|Fs] is a martingale for s ∈ [t,T − 1] and in particular
EQ[Vτ
(t)
min
|Ft] = EQ[V
(t)
T |Ft] = V
(t)
t = Vt.
which proves (4.1).
Remark 4.2.4. • The stopping time τmin is not the only optimal stopping
time, but the minimal one.
• The above theorem states that the buyer can in fact meet the value of
the seller’s hedging portfolio and this happens if and only if the option is
exercised at an optimal stopping time. In this sense the arbitrage-free or
fair price of an American option with payoff f is given by V0, where V is
defined as the Snell envelope of f or equivalently by supτ∈T EQ[fτ].
Let us now compare American claims with the corresponding European. In
particular we are intersted in the relation of American and European Call or
Put options. Let
V E
t := EQ[fT |Ft]
be the unique arbitrage free price of the European claim fT .
Proposition 4.2.5. Let V denote the Snell envelope of f. Then Vt ≥ V E
t .
Moreover if Vt ≥ ft then V E
t = Vt.
Proof. The first assertion follows from the supermartingale property.
Vt ≥ EQ[VT |Ft] = EQ[fT |Ft] = V E
t .
If for the martingale Vt we have V E
t ≥ ft then it also dominates Vt, since V is
the smallest supermartingale dominating f. Thus V E = V .
Remark 4.2.6. • The situation where V E
t ≥ f occurs, when (ft) is a sub-
martingale. This happens if f = g(St) for a convex function g : Rd → R+.
Indeed, in this case we have by Jensen’s inequality
V E
t = EQ[ft+1|Ft] = EQ[g(St+1)|Ft] ≥ g(EQ[St+1|Ft]) = g(St) = ft.
• As x 7→ (x − K)+ and x 7→ (K − x)+ are convex, the American call and
the American put price are equal to their European counterparts in the
absence of interest rates. This changes when we have interest rates. In
this case the price of the American call is still equal to the price of the
European, but this does not hold true for the put any longer.48 American OptionsBibliography
[1] F. Delbaen and W. Schachermayer. The mathematics of arbitrage. Springer
Finance. Springer-Verlag, Berlin, 2006.
[2] H. Föllmer and A. Schied. Stochastic finance. Walter de Gruyter & Co.,
Berlin, extended edition, 2011. An introduction in discrete time.
49