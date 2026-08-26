---
sha256: 54c8df0965054d2d3d41b8e315297dde4be022f4cb50fde3a806857a5d711e31
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 38995
---
arXiv:math/0412233v1 [math.CO] 13 Dec 2004
Extended finite operator calculus - an example
of algebraization of analysis
A.K.Kwaśniewski*, E.Borak**
*Higher School of Mathematics and Applied Informatics
PL - 15-021 Bialystok , ul.Kamienna 17, Poland
e-mail: kwandr@pl
* Institute of Computer Science, Bialystok University
PL-15-887 Bialystok, ul.Sosnowa 64, POLAND
November 2, 2018
Central European Journal of Mathematics (2005) to appear
Abstract
“A Calculus of Sequences” started in 1936 by Ward constitutes the
general scheme for extensions of classical operator calculus of Rota -
Mullin considered by many afterwards and after Ward. Because of the
notation we shall call the Ward‘s calculus of sequences in its afterwards
elaborated form - a ψ-calculus.
The ψ-calculus in parts appears to be almost automatic, natural
extension of classical operator calculus of Rota - Mullin or equivalently
- of umbral calculus of Roman and Rota.
At the same time this calculus is an example of the algebraization
of the analysis - here restricted to the algebra of polynomials. Many
of the results of ψ-calculus may be extended to Markowsky Q-umbral
calculus where Q stands for a generalized difference operator, i.e. the
one lowering the degree of any polynomial by one.
This is a review article based on the recent first author contribu-
tions [1]. As the survey article it is supplemented by the short indi-
catory glossaries of notation and terms used by Ward [2], Viskov [7,8]
1, Markowsky [12], Roman [28-32] on one side and the Rota-oriented
notation on the other side [9-11,1,3,4,35] (see also [33]).
KEY WORDS: extended umbral calculus , Graves-Heisenberg-Weyl algebra
MCS (2000) : 05A40 , 81S99
”The modern evolution... has on the whole been marked by a trend
of algebraization. ”
Herman Weyl
## 1 Introduction
We shall call the Wards calculus of sequences [2] in its afterwards last century elab-
orated form - a ψ-calculus because of the Viskov‘s efficient notation [3]-[8]- adopted
from Boas and Buck . The efficiency of the Rota oriented language and our nota-
tion used has been already exemplified by easy proving of ψ-extended counterparts
of all representation independent statements of ψ-calculus [2]. Here these are ψ-
labelled representations of Graves-Heisenberg-Weyl (GHW)[3],[1],[16],[17] algebra
of linear operators acting on the algebra P of polynomials.
As a matter of fact ψ-calculus becomes in parts almost automatic extension
of Rota - Mullin calculus [9] or equivalently - of umbral calculus of Roman and
Rota [9, 10, 11]. The ψ-extension relies on the notion of ∂ψ-shift invariance of
operators with ψ-derivatives ∂ψ staying for equivalence classes representatives of
special differential operators lowering degree of polynomials by one [7, 8, 12]. Many
of the results of ψ-calculus may be extended to Markowsky Q-umbral calculus [12]
where Q stands for arbitrary generalized difference operator, i.e. the one lowering
the degree of any polynomial by one. Q-umbral calculus [12] - as we call it - includes
also those generalized difference operators, which are not series in ψ-derivative ∂ψ
whatever an admissible ψ sequence would be (for - ”admissible” - see next section).
The survey proposed here reviews the operator formulation of “A Calculus
of Sequences” started in 1936 by Ward [2] with the indication of the decisive
role the ψ-representations of Graves-Heisenberg-Weyl (GHW) algebra account for
formulation and derivation of principal statements of the ψ-extension of finite
operator calculus of Rota and its extensions.
Restating what was said above let us underline that all statements of standard
finite operator calculus of Rota are valid also in the case of ψ-extension under
the almost mnemonic , automatic replacement of {D,x̂,id} generators of GHW
by their ψ-representation correspondents {∂ψ,x̂ψ,id} - see definitions 2.1 and 2.5.
Naturally any specification of admissible ψ - for example the famous one defining
2q-calculus - has its own characteristic properties not pertaining to the standard
case of Rota calculus realization. Nevertheless the overall picture and system of
statements depending only on GHW algebra is the same modulo some automatic
replacements in formulas demonstrated in the sequel. The large part of that kind
of job was already done in [1, 3, 35].
The aim of this presentation is to give a general picture ( see: Section 3) of the
algebra of linear operators on polynomial algebra. The picture that emerges dis-
closes the fact that any ψ-representation of finite operator calculus or equivalently
- any ψ-representation of GHW algebra makes up an example of the algebraization
of the analysis with generalized differential operators [12] acting on the algebra of
polynomials.
We shall delimit all our considerations to the algebra P of polynomials or some-
times to the algebra of formal series. Therefore the distinction between difference
and differentiation operators disappears. All linear operators on P are both dif-
ference and differentiation operators if the degree of differentiation or difference
operator is unlimited.
If all this is extended to Markowsky Q-umbral calculus [12] then many of the
results of ψ-calculus may be extended to Q-umbral calculus [12]. This is achieved
under the almost automatic replacement of {D, x̂,id} generators of GHW or their
ψ-representation {∂ψ,x̂ψ,id} by their Q-representation correspondents {Q,x̂Q,id}
- see definition 2.5.
The article is supplemented by the short indicatory glossaries of notation and
terms used by Ward [1], Viskov [7], [8], Markowsky [12], Roman [28]-[31] on one
side and the Rota-oriented [9]-[11] notation on the other side [3],[4, 35, 1].
## 2 Primary definitions, notation and general
observations
In the following we shall consider the algebra P of polynomials P =F[x] over the
field F of characteristic zero. All operators or functionals studied here are to be
understood as linear operators on P. It shall be easy to see that they are always
well defined.
Throughout the note while saying “polynomial sequence {pn}∞
0 ” we mean
deg pn = n; n ≥ 0 and we adopt also the convention that deg pn < 0 iff pn ≡ 0.
Consider ℑ - the family of functions‘ sequences (in conformity with Viskov
[7],[8],[3] notation ) such that:
ℑ = {ψ;R ⊃ [a,b] ; q ∈ [a,b] ; ψ (q) : Z → F ; ψ0 (q) = 1 ; ψn (q) 6= 0; ψ−n (q) =
0; n ∈ N}.
We shall call ψ = {ψn (q)}n≥0 ; ψn (q) 6= 0; n ≥ 0 and ψ0 (q) = 1 an admissible
3sequence. Let now nψ denotes [3, 4]
nψ ≡ ψn−1 (q)ψ−1
n (q),n ≥ 0.
Then (note that for admissible ψ, 0ψ = 0)
nψ! ≡ ψ−1
n (q) ≡ nψ (n − 1)ψ (n − 2)ψ (n − 3)ψ ....2ψ1ψ; 0ψ! = 1
n
k
ψ = nψ (n − 1)ψ ...(n − k + 1)ψ,

n
k

ψ
≡
n
k
ψ
kψ! and expψ{y} =
∞ P
k=0
yk
kψ!.
Definition 2.1. Let ψ be admissible. Let ∂ψ be the linear operator lowering
degree of polynomials by one defined according to ∂ψxn = nψxn−1 ; n ≥ 0. Then
∂ψ is called the ψ-derivative.
Remark 2.1. a) For any rational function R the corresponding factorial R(qn)! of
the sequence R(qn) is defined naturally [3, 4, 1] as it is defined for nψ sequence , i.e.
: R(qn)! = R(qn)R(qn−1)...R(q1) The choice ψn (q)=[R(qn)!]−1
and R(x) = 1−x
1−q
results in the well known q-factorial nq! = nq (n − 1)q!; 1q! = 0q! = 1 while the
ψ-derivative ∂ψ becomes now (nψ = nq) the Jackson’s derivative [25, 26, 27, 2, 3]
∂q:
(∂qϕ)(x) = ϕ(x)−ϕ(qx)
(1−q)x .
b) Note also that if ψ = {ψn (q)}n≥0 and ϕ = {ϕn (q)}n≥0 are two admissible se-
quences then [∂ψ , ∂ϕ]= 0 iff ψ = ϕ. Here [,] denotes the commutator of operators.
Definition 2.2. Let Ey (∂ψ) ≡ expψ{y∂ψ} =
∞ P
k=0
yk∂k
ψ
kψ! . Ey (∂ψ) is called the
generalized translation operator.
Note 2.1. [3, 4, 1]
Ea (∂ψ)f(x) ≡ f(x +ψ a) ; (x +ψ a)n ≡ Ea (∂ψ)xn ; Ea (∂ψ)f =
P
n≥0
an
nψ!∂n
ψf;
and in general (x +ψ a)n 6= (x +ψ a)n−1(x +ψ a).
Note also [1] that in general (1+ψ (−1))2n+1 6= 0 ; n ≥ 0 though (1+ψ (−1))2n = 0;
n ≥ 1.
Note 2.2. [1]
expψ (x +ψ y) ≡ Ex (∂ψ)expψ{y} - while in general expψ{x+y} 6= expψ{x}expψ{y}.
Possible consequent use of the identity expψ (x +ψ y) ≡ expψ{x}expψ{y} is
quite encouraging. It leads among others to “ψ-trigonometry” either ψ-elliptic or
4ψ-hyperbolic via introducing cosψ, sinψ [1], coshψ , sinhψ or in general ψ-hyperbolic
functions of m-th order
n
h
(ψ)
j (α)
o
j∈Zm
defined according to [13]
R ∋ α → h
(ψ)
j (α) =
1
m
X
k∈Zm
ω−kj
expψ
n
ωk
α
o
; j ∈ Zm, ω = exp

i
2π
m

.
where 1 < m ∈ N and Zm = {0,1,...,m − 1}.
Definition 2.3. A polynomial sequence {pn}∞
o is of ψ -binomial type if it satisfies
the recurrence
Ey
(∂ψ)pn (x) ≡ pn (x +ψ y) ≡
X
k≥0

n
k

ψ
pk (x)pn−k (y).
Polynomial sequences of ψ-binomial type [3, 4, 1] are known to correspond in
one-to-one manner to special generalized differential operators Q, namely to those
Q = Q(∂ψ) which are ∂ψ-shift invariant operators [3, 4, 1]. We shall deal in this
note mostly with this special case,i.e. with ψ-umbral calculus. However before to
proceed let us supply a basic information referring to this general case of Q-umbral
calculus.
Definition 2.4. Let P = F[x]. Let Q be a linear map Q : P → P such that:
∀p∈P deg (Qp) = (deg p)−1 (with the convention deg p = −1 means p = const =
0). Q is then called a generalized diﬀerence-tial operator [12] or Gel‘fond-Leontiev
[7] operator.
Right from the above definitions we infer that the following holds.
Observation 2.1. Let Q be as in Definition 2.4. Let Qxn =
n P
k=1
bn,kxn−k where
bn,1 6= 0 of course. Without loose of generality take b1,1 = 1. Then ∃ {qk}k≥2 ⊂ F
and there exists admissible ψ such that
Q = ∂ψ +
X
k≥2
qk∂k
ψ (2.1)
if and only if
bn,k =

n
k

ψ
bk,k; n ≥ k ≥ 1; bn,1 6= 0; b1,1 = 1. (2.2)
If {qk}k ≥ 2 and an admissible ψ exist then these are unique.
5Notation 2.1. In the case (2.2) is true we shall write : Q = Q(∂ψ) because then
and only then the generalized differential operator Q is a series in powers of ∂ψ.
Remark 2.2. Note that operators of the (2.1) form constitute a group under
superposition of formal power series (compare with the formula (S) in [13]). Of
course not all generalized difference-tial operators satisfy (2.1) i.e. are series just
only in corresponding ψ-derivative ∂ψ (see Proposition 3.1 ). For example [15] let
Q = 1
2Dx̂D − 1
3D3. Then Qxn = 1
2n2xn−1 − 1
3n3xn−3 so according to Observa-
tion 2.1 nψ = 1
2n2 and there exists no admissible ψ such that Q = Q(∂ψ).Here x̂
denotes the operator of multiplication by x while nk is a special case of n
k
ψ for the
choice nψ = n.
Observation 2.2. From theorem 3.1 in [12] we infer that generalized differential
operators give rise to subalgebras
P
Q of linear maps (plus zero map of course)
commuting with a given generalized difference-tial operator Q. The intersection
of two different algebras
P
Q1
and
P
Q2
is just zero map added.
The importance of the above Observation 2.2 as well as the definition below
may be further fully appreciated in the context of the Theorem 2.1 and the Propo-
sition 3.1 to come.
Definition 2.5. Let {pn}n≥0 be the normal polynomial sequence [12] ,i.e. p0 (x) =
1 and pn (0) = 0 ; n ≥ 1. Then we call it the ψ-basic sequence of the generalized
difference-tial operator Q if in addition Qpn = nψpn−1. In parallel we define a
linear map x̂Q: P → P such that x̂Qpn = (n+1)
(n+1)ψ
pn+1; n ≥ 0. We call the
operator x̂Q the dual to Q operator.
When Q = Q(∂ψ) = ∂ψ we write for short: x̂Q(∂ψ) ≡ x̂∂ψ
≡ x̂ψ (see: Definition
2.9).
Of course [Q,x̂Q]= id therefore {Q,x̂Q,id} provide us with a continuous family of
generators of GHW in - as we call it - Q-representation of Graves-Heisenberg-Weyl
algebra.
In the following we shall restrict to special case of generalized differential operators
Q, namely to those Q = Q(∂ψ) which are ∂ψ-shift invariant operators [3, 4, 1] (see:
Definition 2.6).
At first let us start with appropriate ψ-Leibnitz rules for corresponding ψ-
derivatives.
ψ-Leibnitz rules:
It is easy to see that the following hold for any formal series f and g:
for ∂q: ∂q (f · g) = (∂qf) · g +

Q̂f

· (∂qg), where

Q̂f

(x) = f (qx);
for ∂R = R

qQ̂

∂0: ∂R(f · g)(z) = R

qQ̂

{(∂0f)(z) · g(z) + f(0)(∂0g)(z)}
6where - note - R

qQ̂

xn−1 = nRxn−1 ; (nψ = nR = nR(q) = R(qn)) and finally
for ∂ψ = n̂ψ∂0:
∂ψ(f · g)(z) = n̂ψ{(∂of)(z) · g(z) + f(0)(∂0g)(z)}
where n̂ψxn−1 = nψxn−1 ; n ≥ 1.
Example 2.1. Let Q(∂ψ) = Dx̂D, where x̂f(x) = xf(x) and D = d
dx. Then
ψ =
n
n2

!
−1
o
n≥0
and Q = ∂ψ. Let Q(∂ψ)R(qQ̂)∂0 ≡ ∂R. Then ψ =
n
[R(qn)!]−1
o
n≥0
and Q = ∂ψ ≡ ∂R. Here R(z) is any formal Laurent series;
Q̂f(x) = f(qx) and nψ = R(qn). ∂0 is q = 0 Jackson derivative which as a matter
of fact - being a difference operator is the differential operator of infinite order at
the same time:
∂0 =
∞ X
n=1
(−1)n+1 xn−1
n!
dn
dxn
. (2.3)
Naturally with the choice ψn (q) = [R(qn)!]−1
and R(x) = 1−x
1−q the ψ-derivative
∂ψ becomes the Jackson’s derivative [25, 26, 27, 2, 3] ∂q:
(∂qϕ)(x) =
1 − qQ̂
(1 − q)
∂0ϕ(x).
The equivalent to (2.3) form of Bernoulli-Taylor expansion one may find [16]
in Acta Eruditorum from November 1694 under the name “series univeralissima”.
(Taylor‘s expansion was presented in his “Methodus incrementorum directa et
inversa” in 1715 - edited in London).
Definition 2.6. Let us denote by End(P) the algebra of all linear operators acting
on the algebra P of polynomials. Let
X
ψ
= {T ∈ End(P); ∀ α ∈ F; [T,Eα
(∂ψ)] = 0}.
Then
P
ψ is a commutative subalgebra of End(P) of F-linear operators. We shall
call these operators T : ∂ψ-shift invariant operators.
We are now in a position to define further basic objects of “ψ-umbral calculus”
[3, 4, 1].
Definition 2.7. Let Q(∂ψ) : P → P; the linear operator Q(∂ψ) is a ∂ψ-delta
operator iff
a) Q(∂ψ) is ∂ψ - shift invariant;
7b) Q(∂ψ)(id) = const 6= 0 where id(x)=x.
The strictly related notion is that of the ∂ψ-basic polynomial sequence:
Definition 2.8. Let Q(∂ψ) : P → P; be the ∂ψ-delta operator. A polynomial
sequence {pn}n≥0; deg pn= n such that:
1) p0 (x) = 1;
2) pn (0) = 0; n > 0;
3) Q(∂ψ)pn = nψpn−1 ,∂ψ-delta operator Q(∂ψ)is called the ∂ψ-basic polyno-
mial sequence of the ∂ψ-delta operator.
Identification 2.1. It is easy to see that the following identification takes place:
∂ψ-delta operator Q(∂ψ) = ∂ψ-shift invariant generalized differential operator Q.
Of course not every generalized differential operator might be considered to be
such.
Note 2.3. Let Φ(x;λ) =
P
n≥0
λn
nψ!pn (x) denotes the ψ-exponential generating
function of the ∂ψ-basic polynomial sequence {pn}n≥0 of the ∂ψ-delta operator
Q ≡ Q(∂ψ) and let Φ(0;λ) = 1. Then QΦ(x;λ) = λΦ(x;λ) and Φ is the unique
solution of this eigenvalue problem. If in addition (2.2) is satisfied then there exists
such an admissible sequence ϕ that Φ(x;λ) = expϕ {λx} (see Example 3.1).
The notation and naming established by Definitions 2.7 and 2.8 serve the
target to preserve and to broaden simplicity of Rota‘s finite operator calculus also
in its extended “ψ-umbral calculus” case [3, 4, 1]. As a matter of illustration of
such notation efficiency let us quote after [3] the important Theorem 2.1 which
might be proved using the fact that ∀ Q(∂ψ) ∃! invertible S ∈ Σψ such that
Q(∂ψ) = ∂ψS. ( For Theorem 2.1 see also Theorem 4.3. in [12], which holds for
operators, introduced by the Definition 2.5). Let us define at first what follows.
Definition 2.9. (compare with (17) in [8])
The Pincherle ψ-derivative is the linear map ’ : Σψ → Σψ;
T ’ = T x̂ψ - x̂ψT ≡[T, x̂ψ]
where the linear map x̂ψ : P → P; is defined in the basis {xn}n≥0 as follows
x̂ψxn
=
ψn+1 (q)(n + 1)
ψn (q)
xn+1
=
(n + 1)
(n + 1)ψ
xn+1
; n ≥ 0.
Then the following theorem is true [3]
8Theorem 2.1. (ψ-Lagrange and ψ-Rodrigues formulas [34, 11, 12, 23, 3])
Let {pn (x)}∞
n=0 be ∂ψ-basic polynomial sequence of the ∂ψ-delta operator Q(∂ψ).
Let Q(∂ψ) = ∂ψS. Then for n > 0:
(1) pn(x) = Q(∂ψ)’ S−n−1 xn ;
(2) pn(x) = S−nxn −
nψ
n (S−n )’xn−1;
(3) pn(x) =
nψ
n x̂ψS−nxn−1;
(4) pn(x) =
nψ
n x̂ψ(Q(∂ψ)’ )−1pn−1(x) (← Rodrigues ψ-formula ).
For the proof one uses typical properties of the Pincherle ψ-derivative [3].Because
∂ψ’ = id we arrive at the simple and crucial observation.
Observation 2.3. [3,35]
The triples {∂ψ,x̂ψ,id} for any admissible ψ-constitute the set of generators of the
ψ-labelled representations of Graves-Heisenberg-Weyl (GHW) algebra [17, 18, 19,
35, 1]. Namely, as easily seen [∂ψ,x̂ψ] = id. (compare with Definition 2.5)
Observation 2.4. In view of the Observation 2.3 the general Leibnitz rule in ψ-
representation of Graves-Heisenberg-Weyl algebra may be written (compare with
## 2.2.2 Proposition in [18]) as follows
∂n
ψ x̂m
ψ =
X
k≥0

n
k

m
k

k!x̂m−k
ψ ∂n−k
ψ . (2.4)
One derives the above ψ-Leibnitz rule from ψ-Heisenberg-Weyl exponential com-
mutation rules exactly the same way as in {D,x̂,id} GHW representation - (com-
pare with 2.2.1 Proposition in [18] ). ψ-Heisenberg-Weyl exponential commutation
relations read:
exp{t∂ψ}exp{ax̂ψ} = exp{at}exp{ax̂ψ}exp{t∂ψ}. (2.5)
To this end let us introduce a pertinent ψ-multiplication ∗ψ of functions as
specified below.
Notation 2.2.
x ∗ψ xn = x̂ψ(xn) = (n+1)
(n+1)ψ
xn+1; n ≥ 0 hence x ∗ψ 1 = 1−1
ψ x 6≡ x
xn ∗ψ x = x̂n
ψ(x) =
1ψ(n+1)!
(n+1)ψ! xn+1; n ≥ 0 hence 1 ∗ψ x = x therefore
x ∗ψ α1 = x ∗ψ α = α1−1
ψ x and α1 ∗ψ x = α ∗ψ x = αx and
∀x,α ∈ F; f(x) ∗ψ xn = f(x̂ψ)xn.
9For k 6= n xn ∗ψ xk 6= xk ∗ψ xn as well as xn ∗ψ xk 6= xn+k - in general i.e. for
arbitrary admissible ψ; compare this with (x +ψ a)n 6= (x +ψ a)n−1(x +ψ a).
In order to facilitate in the future formulation of observations accounted for on the
basis of ψ-calculus representation of GHW algebra we shall use what follows.
Definition 2.10. With Notation 2.2 adopted let us define the ∗ψ powers of x
according to
xn∗ψ ≡ x ∗ψx(n−1)∗ψ = x̂ψ(x(n−1)∗ψ ) = x ∗ψ x ∗ψ ... ∗ψ x = n!
nψ!xn; n ≥ 0.
Note that xn∗ψ ∗ψ xk∗ψ = n!
nψ!x(n+k)∗ψ 6= xk∗ψ ∗ψ xn∗ψ = k!
kψ!x(n+k)∗ψ for k 6= n
and x0∗ψ = 1.
This noncommutative ψ-product ∗ψ is deviced so as to ensure the following obser-
vations.
Observation 2.5.
(a) ∂ψxn∗ψ = nx(n−1)∗ψ ; n ≥ 0
(b) expψ[αx] ≡ exp{αx̂ψ}1
(c) exp[αx] ∗ψ (expψ{βx̂ψ}1) = (expψ{[α + β]x̂ψ})1
(d) ∂ψ(xk ∗ψ xn∗ψ ) = (Dxk) ∗ψ xn∗ψ + xk ∗ψ (∂ψxn∗ψ ) hence
(e) ∂ψ(f ∗ψ g) = (Df) ∗ψ g + f ∗ψ (∂ψg) ; f,g - formal series
(f) f(x̂ψ)g(x̂ψ) 1 = f(x) ∗ψ g̃(x) ; g̃(x) = g(x̂ψ)1.
Now the consequences of Leibniz rule (e) for difference-ization of the prod-
uct are easily feasible. For example the Poisson ψ-process distribution πm(x) =
1
N(λ,x)pm(x);
P
m≥0
pm(x) = 1 is determined by
pm(x) =
(λx)m
m!
∗ψ expψ[−λx] (2.6)
which is the unique solution (up to a constant factor) of the ∂ψ-difference equations
systems
∂ψpm(x) + λpm(x) = λpm−1(x) m > 0 ; ∂ψp0(x) = −λp0(x) (2.7)
Naturally N(λ,x) = exp[λx] ∗ψ expψ[−λx].
As announced - the rules of ψ -product ∗ψ are accounted for on the basis of
ψ-calculus representation of GHW algebra. Indeed,it is enough to consult Obser-
vation 2.5 and to introduce ψ-Pincherle derivation ˆ ∂ψ of series in powers of the
symbol x̂ψ as below. Then the correspondence between generic relative formulas
turns out evident.
10Observation 2.6. Let ˆ ∂ψ ≡ ∂
∂x̂ψ
be defined according to ˆ ∂ψf(x̂ψ) = [∂ψ,f(x̂ψ)].
Then ˆ ∂ψx̂n
ψ = nx̂n−1
ψ ; n ≥ 0 and ˆ ∂ψx̂n
ψ 1 = ∂ψxn∗ψ hence [ˆ ∂ψf(x̂ψ)]1 = ∂ψf(x)
where f is a formal series in powers of x̂ψ or equivalently in ∗ψ powers of x.
As an example of application note how the solution of 2.7 is obtained from the
obvious solution pm(x̂ψ) of the ˆ ∂ψ-Pincherle differential equation 2.8 formulated
within G-H-W algebra generated by {∂ψ,x̂ψ,id}
ˆ ∂ψpm(x̂ψ) + λpm(x̂ψ) = λpm−1(x̂ψ)m > 0 ; ∂ψp0(x̂ψ) = −λp0(x̂ψ.) (2.8)
Namely : due to Observation 2.5 (f) pm(x) = pm(x̂ψ)1, where
pm(x̂ψ) =
(λx̂ψ)m
m!
expψ[−λx̂ψ]. (2.9)
3 The general picture of the algebra End(P)
from GHW algebra point of view
The general picture from the title above relates to the general picture of the algebra
End(P) of operators on P as in the following we shall consider the algebra P of
polynomials P = F[x] over the field F of characteristic zero.
With series of Propositions from [1,3,35,21] we shall draw an over view picture
of the situation distinguished by possibility to develop further umbral calculus
in its operator form for any polynomial sequences {pn}∞
0 [12] instead of those of
traditional binomial type only.
In 1901 it was proved [20] that every linear operator mapping P into P may
be represented as infinite series in operators x̂ and D. In 1986 the authors of [21]
supplied the explicit expression for such series in most general case of polynomials
in one variable ( for many variables see: [22] ). Thus according to Proposition 1
from [21] one has:
Proposition 3.1. Let Q be a linear operator that reduces by one the degree of
each polynomial. Let {qn (x̂)}n≥0 be an arbitrary sequence of polynomials in the
operator x̂. Then T̂ =
P
n≥0
qn (x̂)Qn defines a linear operator that maps polyno-
mials into polynomials. Conversely, if T̂ is linear operator that maps polynomials
into polynomials then there exists a unique expansion of the form
T̂ =
X
n≥0
qn (x̂)Qn
.
11It is also a rather matter of an easy exercise to prove the Proposition 2 from
[21]:
Proposition 3.2. Let Q be a linear operator that reduces by one the degree of
each polynomial. Let {qn (x̂)}n≥0be an arbitrary sequence of polynomials in the
operator x̂. Let a linear operator that maps polynomials into polynomials be given
by
T̂ =
P
n≥0
qn (x̂)Qn.
Let P (x;λ) =
P
n≥0
qn (x)λn denotes indicator of T̂. Then there exists a unique
formal series Φ(x;λ); Φ(0;λ) = 1 such that:
QΦ(x;λ) = λΦ(x;λ).
Then also P (x;λ) = Φ(x;λ)−1
T̂Φ(x;λ).
Example 3.1. Note that ∂ψ expψ{λx} = λexpψ{λx}; expψ [x]|x=0 = 1. (*)
Hence for indicator of T̂; T̂ =
P
n≥0
qn (x̂)∂n
ψ we have:
P (x;λ) = [expψ{λx}]−1 T̂ expψ{λx}. (**)
After choosing ψn (q) = [nq!]−1
we get expψ{x} = expq{x}. In this connection
note that exp0 (x) = 1
1−x and exp(x) are mutual limit deformations for |x| < 1 due
to:
exp0(z)−1
z = expo (z) ⇒ exp0 (z) = 1
1−z =
∞ P
k=0
zk; |z| < 1 , i.e.
exp(x) ←−
1←q
expq (x) =
∞ X
n=0
xn
nq!
−→
q→0
1
1 − x
.
Therefore corresponding specifications of (*) such as exp0 (λx) = 1
1−λx or exp(λx)
lead to corresponding specifications of (**) for divided difference operator ∂0 and
D operator including special cases from [21].
To be complete let us still introduce [3, 4] an important operator x̂Q(∂ψ) dual
to Q(∂ψ).
Definition 3.1. (see Definition 2.5)
Let {pn}n≥0 be the ∂ψ-basic polynomial sequence of the ∂ψ-delta operator Q(∂ψ).
A linear map x̂Q(∂ψ): P → P ; x̂Q(∂ψ) pn = (n+1)
(n+1)ψ
pn+1; n ≥ 0 is called the
operator dual to Q(∂ψ).
12Comment 3.1. Dual in the above sense corresponds to adjoint in ψ-umbral cal-
culus language of linear functionals’ umbral algebra (compare with Proposition
1.1.21 in [23] ).
It is now obvious that the following holds.
Proposition 3.3. Let {qn

x̂Q(∂ψ)

}n≥0 be an arbitrary sequence of polynomials
in the operator x̂Q(∂ψ). Then T =
P
n≥0
qn

x̂Q(∂ψ)

Q(∂ψ)n
defines a linear operator
that maps polynomials into polynomials. Conversely, if T is linear operator that
maps polynomials into polynomials then there exists a unique expansion of the
form
T =
X
n≥0
qn

x̂Q(∂ψ)

Q(∂ψ)n
. (3.1)
Comment 3.2. The pair Q(∂ψ), x̂Q(∂ψ) of dual operators is expected to play a
role in the description of quantum-like processes apart from the q-case now vastly
exploited [3, 4].
Naturally the Proposition 3.2 for Q(∂ψ) and x̂Q(∂ψ) dual operators is also
valid.
Summing up: we have the following picture for End(P) - the algebra of all linear
operators acting on the algebra P of polynomials.
Q(P) ≡
S
Q
P
Q ⊂ End(P)
and of course Q(P) 6= End(P) where the subfamily Q(P) (with zero map) breaks
up into sum of subalgebras
P
Q according to commutativity of these generalized
difference-tial operators Q (see Definition 2.4 and Observation 2.2). Also to each
subalgebra
P
ψ i.e. to each Q(∂ψ) operator there corresponds its dual operator
x̂Q(∂ψ)
x̂Q(∂ψ) / ∈
X
ψ
and both Q(∂ψ) & x̂Q(∂ψ) operators are sufficient to build up the whole algebra
End(P) according to unique representation given by (3.1) including the ∂ψ and x̂ψ
case. Summarising: for any admissible ψ we have the following general statement.
General statement:
End(P) =[{∂ψ,x̂ψ}] = [{Q(∂ψ) , x̂Q(∂ψ)}] = [{Q , x̂Q}]
13i.e. the algebra End(P) is generated by any dual pair {Q , x̂Q} including any dual
pair {Q(∂ψ) , x̂Q(∂ψ)} or specifically by {∂ψ,x̂ψ} which in turn is determined by
a choice of any admissible sequence ψ.
As a matter of fact and in another words: we have bijective correspondences be-
tween different commutation classes of ∂ψ-shift invariant operators from End(P),
different abelian subalgebras
P
ψ, distinct ψ-representations of GHW algebra, dif-
ferent ψ-representations of the reduced incidence algebra R(L(S)) - isomorphic to
the algebra Φψ of ψ-exponential formal power series [3] and finally - distinct ψ-
umbral calculi [8, 12, 15, 24, 34, 3, 35]. These bijective correspondences may be
naturally extended to encompass also Q-umbral calculi[12,1], Q-representations of
GHW algebra [1] and abelian subalgebras
P
Q.
(Recall: R(L(S)) is the reduced incidence algebra of L(S) where
L(S)={A; A⊂S; |A| < ∞}; S is countable and (L(S); ⊆) is partially ordered set
ordered by inclusion [11, 3] ).
This is the way the Rota‘s devise has been carried into effect. The devise
“much is the iteration of the few” [11] - much of the properties of literally all poly-
nomial sequences - as well as GHW algebra representations - is the application of
few basic principles of the ψ-umbral difference operator calculus [3, 35, 1].
ψ− Integration Remark :
Recall : ∂oxn = xn−1. ∂o is identical with divided difference operator. ∂o is iden-
tical with ∂ψ for ψ = {ψ (q)n}n≥0 ; ψ (q)n = 1 ; n ≥ 0 . Let Q̂f(x)f(qx).
Recall also that there corresponds to the “∂q difference-ization” the q-integration
[25, 26, 27] which is a right inverse operation to “q-difference-ization”[35, 1].
Namely
F (z) :≡
Z
q
ϕ

(z) := (1 − q)z
∞ X
k=0
ϕ

qk
z

qk
(3.2)
i.e.
F (z) ≡
Z
q
ϕ

(z) = (1 − q)z
∞ X
k=0
qk
Q̂k
ϕ
!
(z) =
=

(1 − q)z
1
1 − qQ̂
ϕ

(z). (3.3)
Of course
∂q ◦
Z
q
= id (3.4)
as
1 − qQ̂
(1 − q)
∂0

(1 − q)ẑ
1
1 − qQ̂

= id. (3.5)
14Naturally (3.5) might serve to define a right inverse operation to “q-difference-
ization”
(∂qϕ)(x) = 1−qQ̂
(1−q)∂0ϕ(x)
and consequently the “q-integration “ as represented by (3.2) and (3.3). As it is
well known the definite q-integral is an numerical approximation of the definite
integral obtained in the q → 1 limit. Following the q-case example we introduce
now an R-integration (consult Remark 2.1).
Z
R
xn
=

x̂
1
R

qQ̂


xn
=
1
R(qn+1)
xn+1
; n ≥ 0 (3.6)
Of course ∂R ◦
R
R = id as
R

qQ̂

∂o

x̂
1
R

qQ̂


 = id. (3.7)
Let us then finally introduce the analogous representation for ∂ψ difference-ization
∂ψ = n̂ψ∂o; n̂ψxn−1
= nψxn−1
; n ≥ 1. (3.8)
Then Z
ψ
xn
=

x̂
1
n̂ψ

xn
=
1
(n + 1)ψ
xn+1
; n ≥ 0 (3.9)
and of course
∂ψ ◦
Z
ψ
= id (3.10)
Closing Remark:
The picture that emerges discloses the fact that any ψ-representation of finite
operator calculus or equivalently - any ψ-representation of GHW algebra makes up
an example of the algebraization of the analysis - naturally when constrained to
the algebra of polynomials. We did restricted all our considerations to the algebra
P of polynomials. Therefore the distinction in-between difference and differen-
tiation operators disappears. All linear operators on P are both difference and
differentiation operators if the degree of differentiation or difference operator is
unlimited. For example d
dx =
P
k≥1
dk
k! ∆k where dk =
 d
dxxk

x=0
= (−1)k−1
(k − 1)!
or ∆ =
P
n≥1
δn
n!
dn
dxn where δn = [∆xn]x=0 = 1. Thus the difference and differential
operators and equations are treated on the same footing. For new applications -
15due to the first author see [4,1,36-41]. Our goal here was to deliver the general
scheme of ”ψ-umbral” algebraization of the analysis of general differential opera-
tors [12]. Most of the general features presented here are known to be pertinent
to the Q representation of finite operator calculus (Viskov, Markowsky, Roman)
where Q is any linear operator lowering degree of any polynomial by one . So it is
most general example of the algebraization of the analysis for general differential
operators [12].
## 4 Glossary
In order to facilitate the reader a simultaneous access to quoted references of
classic Masters of umbral calculus - here now follow short indicatory glossaries of
notation used by Ward [2], Viskov [7, 8], Markowsky [11], Roman [28]-[32] on one
side and the Rota-oriented notation on the other side. See also [33].
Ward Rota - oriented (this note)
[n]; [n]! nψ; nψ!
basic binomial coefficient [n,r] = [n]!
[r]![n−r]! ψ-binomial coefficient n
k

ψ
≡
n
k
ψ
kψ!
D = Dx - the operator D ∂ψ - the ψ-derivative
Dxn = [n] xn−1 ∂ψ xn = nψ xn−1
(x + y)n (x +ψ y)n
(x + y)n ≡
n P
r=0
[n,r]xn−ryr (x +ψ y)n =
n P
k=0
n
k

ψ
xkyn−k
16Ward Rota - oriented (this note)
basic displacement symbol generalized shift operator
Et; t ∈ Z Ey (∂ψ) ≡ expψ{y∂ψ}; y ∈ F
Eϕ(x) = ϕ(x + 1) E(∂ψ)ϕ(x) = ϕ(x +ψ 1)
Etϕ(x) = ϕ x + t

Ey(∂ψ)xn ≡ (x +ψ y)n
basic difference operator ψ-difference delta operator
∆ = E − id ∆ψ = Ey(∂ψ) − id
∆ = ε(D) − id =
∞ P
n=0
Dn
[n]! − id
Roman Rota - oriented (this note)
t; txn = nxn−1 ∂ψ - the ψ-derivative
∂ψxn = nψxn−1
htk|p(x)i = p(k)(0) [∂k
ψp(x)]|x=0
17Roman Rota - oriented (this note)
evaluation functional generalized shift operator
ǫy(t) = exp{yt} Ey(∂ψ) = expψ {y∂ψ}
htk|xni = n!δn,k
hǫy(t)|p(x)i = p(y) [Ey(∂ψ)pn(x)]|x=0 = pn(y)
ǫy(t)xn =
P
k≥0
n
k

xkyn−k Ey(∂ψ)pn(x) =
P
k≥0
n
k

ψ
pk(x)pn−k(y)
formal derivative Pincherle derivative
f′(t) ≡ d
dtf(t) [Q(∂ψ)]‘≡ d
d∂ψ
Q(∂ψ)
f(t) compositional inverse of Q−1(∂ψ) compositional inverse of
formal power series f(t) formal power series Q(∂ψ)
θt; θtxn = xn+1; n ≥ 0 x̂ψ; x̂ψxn = n+1
(n+1)ψ
xn+1; n ≥ 0
θtt = x̂D x̂ψ∂ψ = x̂D = N̂
P
k≥0
sk(x)
kψ! tk =
P
k≥0
sk(x)
kψ! zk =
[g(f(z))]−1 exp{xf(t)} s(q−1(z))expψ {xq−1(z)}
{sn(x)}n≥0 - Sheffer sequence q(t), s(t) indicators
for (g(t),f(t)) of Q(∂ψ) and S∂ψ
18Roman Rota - oriented (this note)
g(t)sn(x) = qn(x) - sequence sn(x) = S−1
∂ψ
qn(x) - ∂ψ - basic
associated for f(t) sequence of Q(∂ψ)
The expansion theorem: The First Expansion Theorem
h(t) =
∞ P
k=0
hh(t)|pk(x)i
k! f(t)k T =
P
n≥0
[T pn(z)]|z=0
nψ
Q(∂ψ)n
pn(x) - sequence associated for f(t) ∂ψ - basic polynomial sequence {pn}∞
0
exp{yf(t)} =
∞ P
k=0
pk(y)
k! tk expψ{xQ−1(x)} =
P
k≥0
pk(y)
k! zk
The Sheffer Identity: The Sheffer ψ-Binomial Theorem:
sn(x + y) =
n P
k=0
n
k

pn(y)sn−k(x) sn(x +ψ y) =
P
k≥0
n
k

ψ
sk(x)qn−k(y)
Viskov Rota - oriented (this note)
θψ - the ψ-derivative ∂ψ - the ψ-derivative
θψ xn = ψn−1
ψn
xn−1 ∂ψ xn = nψ xn−1
19Viskov Rota - oriented (this note)
Ap (p = {pn}∞
0 ) Q
Ap pn = pn−1 Qpn = nψpn−1
Bp (p = {pn}∞
0 ) x̂Q
Bp pn = (n + 1)pn+1 x̂Q pn = n+1
(n+1)ψ
pn+1
Ey
p (p = {pn}∞
0 ) Ey (∂ψ) ≡ expψ{y∂ψ}
Ey
ppn(x) =
n P
k=0
pn−k(x)pk(y) Ey (∂ψ)pn(x) =
=
P
k≥0
n
k

ψ
pk(x)pn−k(y)
T − εp-operator: Ey - shift operator:
T Ap = Ap T Eyϕ(x) = ϕ(x +ψ y)
T - ∂ψ-shift invariant operator:
∀y∈F TEy
p = Ey
pT ∀α∈F [T,Eα(∂ψ)] = 0
Q - δψ-operator: Q(∂ψ) - ∂ψ-delta-operator:
Q - ǫp-operator and Q(∂ψ) - ∂ψ-shift-invariant and
Qx = const 6= 0 Q(∂ψ)(id) = const 6= 0
20Viskov Rota - oriented (this note)
{pn(x),n ≥ 0} - (Q,ψ)-basic {pn}n≥0 -∂ψ-basic
polynomial sequence of the polynomial sequence of the
δψ-operator Q ∂ψ-delta-operator Q(∂ψ)
ψ-binomiality property ψ-binomiality property
Ψysn(x) = Ey(∂ψ)pn(x) =
=
n P
m=0
ψnψn−m
ψn
sm(x)pn−m(y) =
P
k≥0
n
k

ψ
pk(x)pn−k(y)
T =
P
n≥0
ψn[V Tpn(x)]Qn T =
P
n≥0
[Tpn(z)]|z=0
nψ! Q(∂ψ)n
TΨyp(x) = Tp(x +ψ y) =
P
n≥0
ψnsn(y)QnSTp(x)
P
k≥0
sk(y)
kψ! Q(∂ψ)kSTp(x)
21Markowsky Rota - oriented
L - the differential operator Q
Lpn = pn−1 Qpn = nψpn−1
M x̂Q
M pn = pn+1 x̂Q pn = n+1
(n+1)ψ
pn+1
Ly Ey (Q) =
P
k≥0
pk(y)
kψ! Qk
Ly pn(x) = Ey (Q) pn(x) =
=
n P
k=0
n
k

pk(x)pn−k(y) =
P
k≥0
n
k

ψ
pk(x)pn−k(y)
Ea - shift-operator: Ey - ∂ψ-shift operator:
Ea f(x) = f(x + a) Eyϕ(x) = ϕ(x +ψ y)
G - shift-invariant operator: T - ∂ψ-shift invariant operator:
EG = GE ∀α∈F [T,E(Q)] = 0
G - delta-operator: L = L(Q) - Qψ-delta operator:
G - shift-invariant and [L,Q] = 0 and
Gx = const 6= 0 L(id) = const 6= 0
22Markowsky Rota - oriented
DL(G) G′ = [G(Q),x̂Q]
L - Pincherle derivative of G Q - Pincherle derivative
DL(G) = [G,M]
{Q0,Q1,...} - basic family {pn}n≥0 -ψ-basic
for differential operator L polynomial sequence of the
generalized difference operator Q
binomiality property Q - ψ-binomiality property
Pn(x + y) = Ey(Q)pn(x) =
=
n P
i=0
n
i

Pi(x)Pn−i(y) =
P
k≥0
n
k

ψ
pk(x)pn−k(y)
Acknowledgements: The authors thank the Referee for suggestions , which have
led us to improve the presentation of the paper. The authors express also their
gratitude to Katarzyna Kwaśniewska for preparation the L A TEXversion of this con-
tribution.
References
[1] A. K. Kwaśniewski: Bulletin de la Soc. des Sciences et des Letters de
Lódź 52 SERIE Reserchers sur les deformations 36, 45 (2002).ArXiv:
math.CO/0312397
[2] M. Ward: Amer. J. Math. 58, 255 (1936).
23[3] A. K. Kwaśniewski: Rep. Math. Phys. 48 (3), 305 (2001) ArXiv:
math.CO/0402078 Feb 2004
[4] A. K. Kwaśniewski: Integral Transforms and Special Functions2 (4), 333
(2001)
[5] R. P. Boas and Jr. R. C. Buck: Am. Math. Monthly 63, 626 (1959).
[6] R. P. Boas and Jr. R. C. Buck: Polynomial Expansions of Analytic Functions,
Springer, Berlin 1964.
[7] O.V. Viskov: Soviet Math. Dokl. 16, 1521 (1975).
[8] O.V. Viskov: Soviet Math. Dokl. 19, 250 (1978).
[9] G.-C. Rota and R. Mullin: On the foundations of combinatorial theory, III.
Theory of Binomial Enumeration in ”Graph Theory and Its Applications”,
Academic Press, New York 1970.
[10] G. C. Rota, D.Kahaner and A. Odlyzko: J. Math. Anal. Appl. 42, 684 (1973).
[11] G. C. Rota: Finite Operator Calculus, Academic Press, New York 1975.
[12] G. Markowsky: J. Math. Anal. Appl. 63, 145 (1978).
[13] A. K. Kwaśniewski: Advances in Applied Cliﬀord Algebras 9, 41 (1999).
[14] O.V. Viskov: Trudy Matiematicz‘eskovo Instituta AN SSSR 177, 21 (1986).
[15] A. Di Bucchianico and D.Loeb: J. Math. Anal. Appl. 92, 1 (1994).
[16] N. Ya. Sonin: Izw. Akad. Nauk 7, 337 (1897).
[17] C. Graves: Proc. Royal Irish Academy 6, 144 (1853-1857).
[18] P. Feinsilver and R. Schott: Algebraic Structures and Operator Calculus,
Kluwer Academic Publishers, New York 1993.
[19] O.V. Viskov: Integral Transforms and Special Functions 1, 2 (1997).
[20] S. Pincherle and U. Amaldi: Le operazioni distributive e le loro applicazioni
all‘analisi, N. Zanichelli, Bologna 1901.
[21] S. G. Kurbanov and V. M. Maximov: Dokl. Akad. Nauk Uz. SSSR 4, 8 (1986).
[22] A. Di Bucchianico and D.Loeb: Integral Transforms and Special Functions 4,
49 (1996).
24[23] P. Kirschenhofer: Sitzunber. Abt. II Oster. Ackad. Wiss. Math. Naturw. Kl.
188, 263 (1979).
[24] A. Di Bucchianico and D.Loeb: J. Math. Anal. Appl. 199, 39 (1996).
[25] F. H. Jackson: Quart. J. Pure and Appl. Math. 41, 193 (1910).
[26] F. H. Jackson: Messenger of Math. 47, 57 (1917).
[27] F. H. Jackson: Quart. J. Math. 2, 1 (1951).
[28] S. M. Roman: J. Math. Anal. Appl. 87, 58 (1982).
[29] S. M. Roman: J. Math. Anal. Appl. 89, 290 (1982).
[30] S. M. Roman: J. Math. Anal. Appl. 95, 528 (1983).
[31] S. M. Roman: The umbral calculus, Academic Press, New York 1984.
[32] S. R. Roman: J. Math. Anal. Appl. 107, 222 (1985).
[33] A. K. Kwasniewski and E. Gradzka: Rendiconti del Circolo Matematico di
Palermo Serie II , Suppl. 69, 117(2002).
[34] J. F. Steffensen Acta Mathematica 73, 333 (1944).
[35] A. K. Kwasniewski: Integral Transforms and Special Functions 14, 499(2003).
[36] A.K.Kwasniewski The logarithmic Fib-binomial formula Advan. Stud. Con-
temp. Math. 9 No 1 (2004):19-26 ArXiv: math.CO/0406258 13 June 2004
[37] A. K. Kwasniewski On basic Bernoulli-Ward polynomials Bulletin de la So-
ciete des Sciences et des Lettres de Lodz 54 Serie: Recherches sur les Defor-
mations Vol. 45 (2004) : 5–10 ArXiv: math.CO/0405577 30 May 2004
[38] A. K. Kwasniewski ψ-Appell polynomials‘ solutions of the -diﬀerence calculus
nonhomogeneous equation Bulletin de la Societe des Sciences et des Lettres
de Lodz 54 Serie: Recherches sur les Deformations Vol. 45 (2004) : 11-15 in
print ArXiv: math.CO/0405578 30 May 2004
[39] A. K. Kwasniewski On ψ-umbral diﬀerence Bernoulli-Taylor formula with
Cauchy type remainder Bulletin de la Societe des Sciences et des Lettres de
Lodz 54 Serie: Recherches sur les Deformations Vol. 44 (2004) :21-29 ArXiv:
math.GM/0312401 December 2003
25[40] A. K. Kwasniewski First contact remarks on umbra diﬀerence calculus refer-
ences streams , Bull. Soc. Sci. Lett. Lodz to appear ArXiv: math.CO/0403139
v1 8 March 2004
[41] A.K.Kwasniewski On extended umbral calculus, oscillator-like algebras and
Generalized Cliﬀord Algebra, Advances in Applied Clifford Algebras , 11 No2
(2001):267-279 , ArXiv: math.QA/0401083 January 2004
26