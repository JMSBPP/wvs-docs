---
sha256: a022d3cbd6a762cdc39653abfb03deb6797d03182de9808447a2fdb7f792dbbe
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 113415
---
Monotone Comparative Statics without
Lattices
Yeon-Koo Che, Jinwoo Kim, Fuhito Kojima∗
March 6, 2026
Abstract
The theory of Monotone Comparative Statics (MCS) has traditionally re-
quired a lattice structure, excluding certain multi-dimensional environments
like mixed-strategy games where this property fails. We show this structure is
not essential. We introduce a weaker notion, pseudo lattice property, and pre-
serve the theory’s core results by generalizing the MCS theorems for individual
choice and Tarski’s fixed-point theorem. Our framework expands compara-
tive statics to pseudo quasi-supermodular games. Crucially, it enables the first
MCS analysis of mixed strategy Nash equilibria and (trembling-hand) perfect
equilibria.
JEL Classification Numbers: C61, C72, D47.
Keywords: monotone comparative statics, pseudo lattice, fixed-point theo-
∗
Che: Department of Economics, Columbia University (email: yeonkooche@gmail.com); Kim:
Department of Economics, HKUST (email: jikim72@gmail.com); Kojima: Department of Economics
and Market Design Center, the University of Tokyo (email: fuhitokojima1979@gmail.com). The
authors are grateful to the editor and the referees for their thoughtful comments and constructive
suggestions, which have greatly improved the paper. We are also grateful to Gregorio Curello, Piotr
Dworczak, Drew Fudenberg, Haoyu Liu, Paul Milgrom, Stephen Morris, Xiaosheng Mu, John Quah,
Chris Shannon, Ludvig Sinander, Joel Sobel, and Bruno Strulovici, and participants of numerous
seminars, for their comments. We thank Yutaro Akita, Nanami Aoi, César Barilla, Masato Eguchi,
William Grimme, Taiyo Inamura, Takuto Kaneko, Haruki Kono, Tianhao Liu, Shinpei Noguchi,
Ryo Shirakawa, Tomoya Takei, Kenji Utagawa, and Yutong Zhang for excellent research assistance.
Yeon-Koo Che is supported by National Science Foundation Grant SES-1851821, and Fuhito Kojima
is supported by the JSPS KAKENHI Grant-In-Aid 21H04979 and JST ERATO Grant Number
JPMJER2301, Japan. This work was supported by the Ministry of Education of the Republic of
Korea and the National Research Foundation of Korea (NRF-2024S1A5A2A03038509).
1
arXiv:1911.06442v5 [econ.TH] 5 Mar 2026rem, pseudo quasi-supermodular games, mixed-strategy Nash equilibria, perfect
equilibria.
## 1 Introduction
Comparative statics analysis is a cornerstone of economic inquiry. It concerns how
economic behavior—whether individual choices, collective outcomes, or game-theoretic
equilibria—responds to changes in the underlying environment. As such, compara-
tive statics provides the principal means by which economic models generate falsifiable
predictions, forming a critical link between theory and empirical work.
The modern methodological framework for this analysis is Monotone Compar-
ative Statics (MCS). Pioneered by Topkis (1979, 1998), Milgrom and Roberts
(1990), and Milgrom and Shannon (1994), it is built upon a powerful order-theoretic
foundation. The universal requirement of this framework is that the underlying do-
main of choice must be a lattice—a partially ordered set where any two elements have
a least upper bound and greatest lower bound. This structure is essential for defining
the notions of complementarity and supermodularity that are central to the theory,
both with respect to parameters and among the dimensions of a choice variable.
The reliance on the lattice property, however, raises critical conceptual and prac-
tical questions. Conceptually, is this rigid mathematical structure truly necessary for
monotone comparative statics? Practically, many important economic environments
fail to satisfy the lattice property. A leading example is the domain of stochastic
decisions. The set of lotteries ∆pXq over a choice space, X, fails to form a lattice
under standard stochastic orders, even when X is itself a lattice. This limitation has
severely constrained the application of MCS to settings involving risk, uncertainty,
or strategic randomization.
This paper demonstrates that the analytical power of monotone comparative stat-
ics can be preserved without the rigid lattice requirement. We show that the lattice
property can be replaced by a much weaker condition, a pseudo lattice, which
merely requires the existence of, possibly non-unique, minimal upper bounds and
maximal lower bounds. This property is remarkably general; for instance, any finite
or compact set with largest and smallest elements is a complete pseudo lattice.1
1
While a formal definition is provided later, this is a mild requirement: for instance, any compact
set that contains the largest and smallest elements is a complete pseudo lattice.
2This relaxation significantly expands the scope of MCS, allowing us to analyze envi-
ronments previously beyond its reach, including mixed strategy Nash equilibria and,
most strikingly, (trembling-hand) perfect equilibria.
Our analysis begins by rebuilding the theory for the canonical individual choice
problem, substituting the standard lattice assumption with our weaker pseudo lattice
structure. This section delivers two foundational results that parallel the cornerstones
of the classic theory. First, we provide a full characterization—a necessary and suffi-
cient condition—for the set of optimal choices by an individual to be monotone with
respect to changes in the economic environment. This result directly generalizes the
celebrated Monotonicity Theorem of Milgrom and Shannon (1994), demonstrating
that the core comparative statics conclusions can be obtained with virtually no loss
of analytical power, with appropriately generalized ordinal conditions. Second, we
show that the set of maximizers inherits the complete pseudo lattice structure of the
domain. This finding is analogous to the well-known result of Milgrom and Roberts
(1990) that the optimizer set forms a complete sublattice in the standard framework,
a property that is often useful for equilibrium analysis.
The analysis of equilibrium in strategic environments requires a tool for estab-
lishing existence and characterizing the structure of the solution set. To this end,
we develop a fixed-point theorem that serves as the analytical engine for our paper.
This result generalizes the celebrated theorems by Tarski (1955) and Zhou (1994)
by replacing the restrictive assumption of a complete lattice with that of a complete
pseudo lattice. The theorem establishes that any monotonic correspondence from a
complete pseudo lattice into itself has a nonempty set of fixed points that itself forms
a complete pseudo lattice, thus admitting largest and smallest elements. We accom-
pany this existence result with a comparative statics theorem (Theorem 6) which
shows that as the correspondence shifts upwards, the set of fixed points also shifts
upwards in the weak-set order.
With the results for individual choice and the fixed-point theorem in hand, we
turn to the analysis of Nash equilibria in games with strategic complementarities.
We apply our conditions to player payoffs to identify a broad class of pseudo quasi-
supermodular games. In these games, the results from our individual choice analysis
ensure that each player’s best-response correspondence is monotonic in the manner
required by our generalized fixed-point theorem. Applying the theorem to the joint
best-response correspondence immediately establishes our main equilibrium results:
3the set of pure-strategy Nash equilibria is nonempty and forms a complete pseudo
lattice. Furthermore, when an exogenous parameter shifts the game in a way that
strengthens each player’s incentive to take higher actions, the entire set of Nash
equilibria shifts upward monotonically.
The power and scope of this generalized framework are best illustrated through its
applications. We first analyze a generalized Bertrand game with product substitutes,
showing that our machinery accommodates a wider range of competitive environments
than the existing literature. Notably, our approach is capable of handling the pure
Bertrand game, whose discontinuous payoff functions prevent it from being analyzed
by standard supermodularity methods like those in Milgrom and Shannon (1994).
Second, and more fundamentally, we address the long-standing challenge of applying
MCS to mixed strategy Nash equilibria. The domain of mixed strategies is a canonical
example of a non-lattice space, making traditional methods inapplicable. We show
that the set of mixed strategy equilibria is bounded by the extremal pure-strategy
equilibria and therefore inherits their monotone comparative statics properties. While
this result is implied by earlier work under the assumption of payoff continuity, our
approach provides a more direct proof and, crucially, establishes the result without
requiring payoff continuity.
The ability of our framework to handle non-lattice domains, particularly the space
of mixed strategies, culminates in our paper’s most novel contribution: the first gen-
eral monotone comparative statics analysis of (trembling-hand) perfect equilibria.
Our analysis applies to a broad class of supermodular games. We extend Selten
(1975)’s classic concept to potentially infinite games by defining a perfect equilibrium
as the limit of Nash equilibria from a sequence of perturbed games. In each perturbed
game, players are constrained to play from a parameterized set of full-support mixed
strategies, ensuring that each open set of pure strategies is played with some positive
minimal probability.
Our proof strategy is to first establish existence and comparative statics properties
for the Nash equilibria along the sequence of these perturbed games, and then to show
that these properties are preserved in the limit. Specifically, we show that each per-
turbed game possesses extremal “constrained-pure” Nash equilibria that bound the
entire equilibrium set and shift monotonically as the environment changes. The limit
of these extremal equilibria yields the existence of perfect equilibria in pure strate-
gies and, crucially, ensures that the set of perfect equilibria inherits the monotone
4comparative statics property of equilibria of the perturbed games. This entire line of
argument would be impossible with standard methods. The space of mixed strategies
in each perturbed game forms a pseudo lattice but not a lattice, rendering traditional
fixed-point theorems inapplicable. Thus, our generalized fixed-point theorem is the
essential tool that enables the analysis at each step of the sequence.
Related Literature. This paper contributes to the large and influential litera-
ture on the general methodology of monotone comparative statics. The workhorse
methods in modern economic analysis were developed and refined in foundational
contributions by Topkis (1979, 1998), Vives (1990), Milgrom and Roberts (1990),
Milgrom and Shannon (1994), and Quah and Strulovici (2009). A unifying feature of
this entire body of work is its reliance on the mathematical structure of a lattice for
the domain of choice, which provides the foundation for defining complementarities
and comparing sets of optima. Our primary methodological contribution is to show
that this structural assumption can be substantially weakened. We demonstrate that
the core analytical power of the theory is preserved when we dispense with the lattice
property in favor of the more general pseudo lattice.
Several papers analyze monotone comparative statics and fixed points of mono-
tone operators in non-lattice environments. Quah (2007) considers individual choice
problems in which a constraint set lacks a lattice structure. Similarly, Abian and
Brown (1961), Smithson (1971), and Li (2014) establish fixed-point existence under
monotonicity without lattice assumptions. Compared with these papers, we require
a more structure on the domain but obtain stronger results, including the extremal
predictions. More detailed comments will follow.
The remainder of the paper is organized as follows. Section 2 introduces the
preliminary mathematical concepts central to our analysis, including the formal def-
inition of a pseudo lattice and the associated set orders. Section 3 develops the
monotone comparative statics results for the individual choice problem in this new
domain. Section 4 presents our generalized fixed-point theorem to establish the exis-
tence, structure, and comparative statics of (pure and mixed) Nash equilibria. Sec-
tion 5 extends the analysis to perfect equilibria. Finally, Section 6 offers concluding
remarks. All proofs omitted from the main text are provided in the Appendix and a
Supplementary Appendix.
52 Preliminaries
This section introduces a set of notions and terminologies and establishes a number
of preliminary results that will be used throughout the paper. Our theory weakens
the structural properties of the domain (e.g., choice or strategy sets for players) as
well as the set order.
## 2.1 The structural properties of domain.
Throughout, the choice domain X is assumed to be a partially ordered set with regard
to a primitive partial order ě, namely a binary relation that is reflexive, transitive
and anti-symmetric on X. For any set S, let US :“ tx P X : x ě x1
,@x1
P Su
and LS :“ tx P X : x ď x1
,@x1
P Su, that is, upper and lower contour sets of S,
respectively. When S “ txu, we will simply write Ux and Lx. We assume that X
is endowed with a topology under which the order ě is closed, meaning that the
set tpx,yq P X ˆ X : x ě yu is closed in the associated product topology.2
Also,
throughout the paper, we endow any space of probability measures with the weak
topology.
Existing literature imposes additional order properties. X is a lattice if for any
x,x1
P X, x _ x1
P X and x ^ x1
P X, where x _ x1
:“ inf Utx,x1u is their join, or the
least (common) upper bound, of tx,x1
u and x ^ x1
:“ supLtx,x1u is their meet, or the
greatest (common) lower bound, of tx,x1
u. (We will write _S and ^S when the sup
or the inf is taken over a set S ‰ X.) X is a complete lattice if, for any S Ă X,
inf US P X and supLS P X, that is, its supremum and infimum exist in X. A subset
S Ă X is a sublattice of X if, for any x,x1
P S, x _ x1
P S and x ^ x1
P S. A subset
S Ă X is a complete sublattice of X if inf US1 P S and supLS1 P S for all S1
Ď S.3
Throughout, we require much weaker structural properties for the partial order
pX,ěq. For any x,x1
P X, let x O x1
:“ ty P Utx,x1u : z P Utx,x1u ñ y ­ą zu be their
pseudo join—the set of minimal upper bounds of tx,x1
u in X—and let x N x1
:“
ty P Ltx,x1u : z P Ltx,x1u ñ y ­ă zu be their pseudo meet—the set of maximal lower
2
This assumption is required to ensure that the induced stochastic order ěsd
on ∆pXq is a
partial order—particularly, that it satisfies antisymmetry—when we analyze mixed-strategy Nash
equilibria and perfect equilibria. In other parts of the analysis, specifically Lemma 1 and Corollary 1,
it suffices to assume that ě is semi-closed, in the sense that Ux and Lx are closed for each x P X.
3
Some other terminologies are used for the same notion: Topkis (1998) uses subcomplete sub-
lattice and Zhou (1994) uses closed sublattice. In particular, the “closedness” of Zhou (1994) should
not be confused with the topological “closedness” used in this paper.
6bounds of x and x1
in X. If X is a lattice, x O y and x N y reduce to singleton sets
tx _ yu and tx ^ yu, respectively. In that sense, O and N are generalizations of the
usual join and meet operations to the non-lattice sets. We consider a non-lattice set
where O and N are well-defined.
We say that X is a pseudo lattice if x O y and x N y are nonempty for every
x,y P X. We also say X is a complete pseudo lattice if it is chain complete and,
for all S Ă X, both OX S :“ tz P US : x P US ñ x ­ă zu and NX S :“ tz P LS : x P
LS ñ x ­ą zu are nonempty.4
A subset S Ă X is a weak pseudo sublattice of X
if, for any x,x1
P S, px O x1
q X S and px N x1
q X S are both nonempty, and a pseudo
sublattice if, for any x,x1
P S, x O x1
Ă S and x N x1
Ă S. Clearly, if S is a pseudo
sublattice of X, then it is a weak pseudo sublattice of X; but the converse need not
hold. A subset S of X is a complete pseudo sublattice if it is chain complete and,
for every nonempty S1
Ď S, OX S1
and NX S1
are nonempty subsets of S.
A pseudo lattice and a complete pseudo lattice are considerably weaker than a
lattice and a complete lattice. As we will see later (Corollary 1), any compact set is a
complete pseudo lattice if (and only if) it contains the largest and smallest elements.
We provide several examples of X that is a pseudo lattice but not a lattice.
Example 1. Every finite set X is compact, and hence it becomes a complete pseudo
lattice whenever it contains both the largest and smallest elements. To see such a set
need not be a lattice, consider X “ tp0,0q,p1,0q,p0,1q,p2,1q,p1,2q,p3,3qu.
p0,0q x “ p1,0q
x1
“ p0,1q
p2,1q
p1,2q
p3,3q
Figure 1: A complete pseudo lattice that is not a lattice.
4
A partially ordered X is chain complete if every chain C Ă X has a supremum and infimum
in X. (This notion is sometimes called “chain complete in both directions.”) Note that a chain is a
totally ordered subset C Ă X; that is, for any x,y P C, either x ď y or y ď x.
7This set has the largest and smallest elements, p3,3q and p0,0q, and thus forms a
complete pseudo lattice. However, it is not a lattice: for example, for x “ p1,0q and
x1
“ p0,1q, xOx1
“ tp2,1q,p1,2qu. Since this set is non-singleton, p1,0q_p0,1q is not
well-defined, so X fails to be a lattice.
Example 2 (Stochastic dominance order). Consider the set X “ ∆pSq of all
Borel probability measures on a compact, partially ordered Polish space S containing
largest and smallest elements s and s. We endow X with the (first-order) stochastic
dominance order, ěsd
: x ěsd
y if
ş
fdx ě
ş
fdy for all bounded nondecreasing function
f : S Ñ R.5
If S contains largest and smallest elements (s and s), then X is a complete
pseudo lattice by Corollary 1, as it is compact and has largest (δs) and smallest (δs)
elements (where δs is the Dirac measure at s).
However, X is not a lattice in general, particularly if S is multidimensional, as an
example from Kamae, Krengel, and O’Brien (1977) shows. Let S “ t0,1uˆt0,1u, as
depicted below.
1
2
1
2
1
2
1
2
Figure 2: Failure of the lattice property
To see why X “ ∆pSq fails to be a lattice, consider the two lotteries x “ 1
2
δp1,1q `
1
2
δp0,0q and x1
“ 1
2
δp1,0q`1
2
δp0,1q. Both lotteries a “ 1
2
δp0,0q`1
2
δp1,0q and b “ 1
2
δp0,0q`1
2
δp0,1q
are maximal lower bounds of x and x1
. Since xNx1
is a non-singleton set, X fails to be
a lattice. This space is a canonical example for our later analysis of mixed strategies.
5
This is equivalent to requiring that xpS1
q ě ypS1
q for every upward closed set S1
Ă S, where S1
is upward closed if s P S1
and s1
ě s imply s1
P S1
. That ěsd
is a partial order is shown by Kamae
and Krengel (1978).
8Example 3 (Mean-preserving spread/convex order). Another important ex-
ample is the set of information structures (distributions of posteriors) ordered by
the mean-preserving spread, or convex, order (ěcx
). Consider a compact, convex set
Θ Ă Rd
. For a fixed prior µ P ∆pΘq, the set Xµ of all distributions x P ∆p∆pΘqq over
posterior beliefs with mean µ constitutes a feasible set.6
Note that this is a compact
set and contains a largest and a smallest element, xµ and xµ: xµ represents the no-
information experiment; xµ represents the experiment that fully reveals every θ P Θ.
Hence, by Corollary 1, Xµ is a complete pseudo lattice.7
However, Xµ generally fails
to be a lattice as shown in Example 5 of the Online Appendix.
The next result characterizes a complete pseudo lattice X in terms of the existence
of its extremal elements. In particular, X is a complete pseudo lattice whenever it is
compact (or, more generally, chain complete) and possesses the largest and smallest
elements.
Theorem 1. A chain complete set X is a complete pseudo lattice if and only if it
admits both the largest and smallest elements.
Chain completeness is a mild condition. It is automatically satisfied under com-
pactness, which is often assumed for other purposes.
Lemma 1. If X is compact, then it is chain complete.8
Corollary 1. A compact set X is a complete pseudo lattice if and only if it admits
both a largest and a smallest element.
## 2.2 Set orders
Consider a nonempty pseudo lattice pX,ěq. One can define several set orders induced
by ě, and two of them are of particular interest to us: pseudo strong-set (pSS) order
ěpss and weak-set (WS) order ěws.
6
The order ěcx
is defined as: x ěcx
y if
ş
fdx ě
ş
fdy for all continuous, convex function
f : ∆pΘq Ñ R. This defines a partial order. In particular, Corollary 3.24 of Elton and Hill (1992)
ensures the antisymmetry of ěcx
since the set is a compact metrizable convex subset of a locally
convex topological vector space.
7
Often, we restrict attention to the distribution over posterior means rather than posterior
beliefs. The feasible set of distributions of the posterior mean then becomes the convex-order interval
tν P ∆pRd
q : δm̄ ďcx
ν ďcx
µu, where m̄ “
ş
Θ
θdµpθq. This set is also a complete pseudo lattice.
8
The converse does not hold. For example, X “ r0,1qYt2u is chain complete but not compact.
9We say S1
Ă X pSS dominates S Ă X, and write S1
ěpss S, if @x P S,@x1
P S1
,
x O x1
Ă S1
and x N x1
Ă S. S1
Ă X weak pSS dominates S Ă X, and write
S1
ěwpss S, if @x P S,@x1
P S1
, pxOx1
qXS1
and pxNx1
qXS are both nonempty. We
say S1
weak-set dominates S, and write S1
ěws S, if, for each x P S, there exists
x1
P S1
such that x1
ě x; and for each x1
P S1
, there exists x P S such that x ď x1
.
As is easily seen, S1
ěpss S implies S1
ěws S. The following result further clarifies
the relationship between these two orders by decomposing pseudo strong-set order
into weak-set order and a couple of “extra properties” when the choice domain is a
pseudo lattice (and the compared sets are pseudo sublattices):9
Theorem 2. Consider a pseudo lattice X and its subsets S and S1
. Then, S1
ěpss S
if (i) S1
ěws S; (ii) SYS1
is a pseudo sublattice; and (iii) (sandwich property) for any
x P S and y,z P S1
(resp., any x P S1
and y,z P S), x P ry,zs implies x P S1
(resp.,
x P S). Conversely, if S and S1
are nonempty pseudo sublattices, then S1
ěpss S
implies the properties (i)–(iii).
Proof. To prove the first statement, let us consider any x P S and x1
P S1
. To show
x O x1
Ă S1
, suppose not. Then, there exists x̂ P x O x1
such that [JW: x̂ R S1
] and
x̂ P S by (ii). By (i), there exists z P S1
such that z ě x̂. So we have x1
ď x̂ ď z while
x1
,z P S1
and x̂ P S. Thus, by (iii), x̂ P S1
, a contradiction. The proof of x N x1
Ă S
is analogous and omitted.
Suppose now that S1
ěpss S where S and S1
are nonempty pseudo sublattices.
Clearly, (i) holds. To see that (ii) holds, consider any x,x1
P SYS1
. If either x,x1
P S
or x,x1
P S1
, then clearly x O x1
and x N x1
are subsets of S Y S1
since S and S1
are
pseudo sublattices. If x P S and x1
P S1
, then S1
ěpss S implies that both x O x1
and
x N x1
are subsets of S Y S1
. To verify (iii), observe that for any x P S and y,z P S1
with x P ry,zs, we have txu “ x O y and thus x P S1
since S1
ěpss S. Also, for any
x P S1
and y,z P S with x P ry,zs, we have txu “ x N z and thus x P S. □
This characterization clarifies precisely what is “lost” when we use the weak-set
order instead of the (pseudo) strong-set order—namely, properties (ii) and (iii).
9
One can easily construct examples showing that each property is indispensable for this charac-
terization.
103 Individual Choices
Consider an individual who chooses an action x from a feasible set S Ă X, facing a
parameter t P T, by maximizing an objective function u : X ˆ T Ñ R, where X is a
pseudo lattice and T is a partially ordered set. We are interested in how the set of
optimal choices,
MSptq :“ argmax
xPS
upx,tq,
responds to changes in the environment from pt,Sq to pt1
,S1
q. We write Mptq when
S “ X and MS when t is fixed. The next subsection provides conditions that char-
acterize the monotone comparative statics for the set MSptq in the weak pseudo
strong-set order.
3.1 MCS characterization of individual choices
We begin with some definitions. First, we say that f : X Ñ R is pseudo quasi-
supermodular if, for any x,y P X, x P x O y, and x P x N y,
fpxq ´ fpxq ěpąq 0 ñ fpxq ´ fpyq ěpąq 0, (pQSUP)
and pseudo supermodular if, for any x,y P X, x P x O y, and x P x N y,
fpxq ´ fpxq ď fpxq ´ fpyq. (pSUP)
As is well-known, the prefix “quasi” weakens the notion from a cardinal concept to
an ordinal one. More importantly for our purposes, “pseudo” extends the property
to a pseudo lattice. If X is a lattice (i.e., not just a pseudo lattice), then pseudo
quasi-supermodularity reduces to quasi-supermodularity, and pseudo supermodularity
reduces to supermodularity, well known in the literature. These conditions capture
the sense of complementarities across multiple dimensions of action under the payoff
function f.
Next, let us consider a parametrized family of functions u : X ˆ T Ñ R. We say
that upx,tq satisfies single-crossing in px,tq if, for each x,x1
P X with x1
ě x and
t,t1
P T with t1
ě t,
upx1
,tq ´ upx,tq ěpąq 0 ñ upx1
,t1
q ´ upx,t1
q ěpąq 0, (SC)
11and increasing differences in px,tq if, for each x,x1
P X with x1
ě x and t,t1
P T with
t1
ě t,
upx1
,tq ´ upx,tq ď upx1
,t1
q ´ upx,t1
q. (ID)
These conditions capture the idea that an individual faces a stronger incentive to raise
her action under up¨,t1
q than under up¨,tq. As is clear, increasing differences imply
single-crossing. Also, we say that u is pseudo (quasi-)supermodular in x if upx,tq is
pseudo (quasi-)supermodular as a function of x for each t P T.
Milgrom and Shannon (1994) characterize monotone comparative statics of the
optima in the strong-set order for lattice domains with quasi-supermodular and single-
crossing payoffs. We extend the characterization when X is (only) a pseudo lattice.10
Theorem 3 (Characterization). MS1pt1
q ěwpss MSptq for all t1
ě t and S1
ěwpss S if
and only if u is pseudo quasi-supermodular in x and satisfies single-crossing in px,tq.
This result reduces to the aforementioned result by Milgrom and Shannon (1994),
their Theorem 4, if X is a lattice, since the qualifier “pseudo” then becomes im-
material. The pseudo quasi-supermodularity and single-crossing conditions, just like
quasi-supermodularity and single-crossing under the lattice environment, play a key
role in our subsequent applications. These conditions deliver MCS in the “weak” pSS
order, but they require a correspondingly weaker condition for the feasible sets. We
can obtain MCS in the “strong” pSS order, for free, under a stronger condition on
the feasible sets:
Proposition 1 (Monotonicity). If u is pseudo quasi-supermodular in x and satisfies
single-crossing in px,tq, then MS1pt1
q ěpss MSptq for all t1
ě t and S1
ěpss S.
Proof. For any x P MSptq and x1
P MS1pt1
q, choose z P x N x1
and z1
P x O x1
.
Then, z P S and z1
P S1
(from S1
ěpss S), so upx,tq ě upz,tq and, by pseudo
quasi-supermodularity, it follows that upz1
,tq ě upx1
,tq. By single-crossing, upz1
,t1
q ě
upx1
,t1
q, so z1
P MS1pt1
q. That z P MSptq follows analogously from the strict inequality
parts of (pQSUP) and (SC). □
10
Quah (2007) considers the individual choice problem in which the constraint set (defined in
a lattice) lacks a sublattice property and identifies conditions under which optimal choices rise in
weak-set order when a constraint set also rises in weak-set order. The current theorem strengthens
both the hypothesis (a monotonic pSS shift of the constraint set) and the conclusion (a monotonic
pSS shift of the optimal choices), and hence complements Quah (2007).
12Since the cardinal conditions imply the ordinal ones, the following is trivial:
Corollary 2. If u is pseudo supermodular in x and satisfies increasing differences in
px,tq, then MS1pt1
q ěpss MSptq for all t1
ě t and S1
ěpss S.
As in Milgrom and Shannon (1994), a strengthening of single crossing yields mono-
tonicity regardless of how an optimal choice is selected.
Corollary 3 (Monotone Selection). Suppose u is pseudo quasi-supermodular in x
and satisfies strict single-crossing in px,tq: for any x1
ą x, t1
ą t,
upx1
,tq ´ upx,tq ě 0 ñ upx1
,t1
q ´ upx,t1
q ą 0,
and assume S1
ěpss S. Then, @z P MSptq, @z1
P MS1pt1
q, we have z1
ě z.
Proof. Fix z P MSptq and z1
P MS1pt1
q. By Proposition 1, any z̃ P z N z1
satisfies z̃ P
MSptq, so upz,tq´upz̃,tq “ 0. If z1
­ě z, then z̃ ă z, and strict single crossing implies
upz,t1
q´upz̃,t1
q ą 0. Pseudo quasi-supermodularity then implies upẑ,t1
q´upz1
,t1
q ą 0
for some ẑ P z O z1
Ă MS1pt1
q, contradicting z1
P MS1pt1
q. □
Directional weakening. One can provide a weaker “directional” version of The-
orem 3 by splitting the conditions into upper and lower versions. We say S1
Ă X
upper (resp. lower) weak pSS dominates S Ă X, and write S1
ěuwpss S (resp.
S1
ělwpss S), if @x P S,@x1
P S1
, x O x1
X S1
(resp. x N x1
X S) is nonempty. Next,
we say that a function u is upper (resp. lower) pseudo quasi-supermodular if
the weak (resp. strict) inequality part of (pQSUP) holds, and that u is upper (resp.
lower) single-crossing if the weak (resp. strict) inequality part of (SC) holds. Then,
we have:
Theorem 31
. MS1pt1
q ěuwpss MSptq for all t1
ě t and S1
ěwpss S if and only if u is
upper pseudo quasi-supermodular in x and satisfies upper single-crossing in px,tq. An
analogous statement holds for the lower case.11
The upper and lower versions of Theorem 31
jointly imply Theorem 3, which is
how the latter theorem is proven in Section B.
11
That is, the same statement holds when ěuwpss, upper pseudo quasi-supermodularity, and
upper single-crossing are replaced by ělwpss, lower pseudo quasi-supermodularity, and lower single-
crossing, respectively.
133.2 The structure of the maximizer set
As in the lattice case, the complementarity property of the payoff function over a
pseudo lattice domain induces a distinctive structure for the set of maximizers. To
ensure that this set is well defined, we assume that the payoff function u : X Ñ R is
order upper semicontinuous: for any chain C “ txαuα Ă X,
inf
α
sup
βěα
upxβq ď upxq,
where x is the infimum or supremum of C, if it exists.
Theorem 4. Assume X is a pseudo lattice and u : X Ñ R is pseudo quasi-
supermodular.
(i) argmaxxPX upxq is a pseudo sublattice of X whenever it is nonempty.
(ii) If, in addition, X is a complete pseudo lattice and u is order upper semicontinu-
ous, then argmaxxPX upxq is a nonempty, complete pseudo sublattice, admitting
the largest and the smallest point.
That the maximizers inherit the complete pseudo lattice structure is interesting
in its own right, but it will also be crucial for the subsequent analyses of games. This
result generalizes Theorem 2 of Milgrom and Roberts (1990) and Theorem A4 of
Milgrom and Shannon (1994). However, the lack of a lattice structure of the domain
makes the argument distinct and more involved.
## 3.3 Decision under uncertainty
We now apply our framework to optimal behavior under uncertainty—a setting central
to mixed-strategy equilibrium analysis—where an agent chooses a potentially random
action to maximize expected utility. Let u : AˆΘ Ñ R be the utility function, with A
and Θ denoting partially ordered sets of actions and states, respectively. The agent’s
uncertainty is represented by a probability distribution η P ∆pΘq over the state space;
in game-theoretic contexts, η often represents the mixed strategy profile of opponents.
For any randomized action x P X “ ∆pAq and state distribution η P ∆pΘq, we define
the expected utility as
upx,ηq :“
ż
A
ˆż
Θ
upa,θqηpdθq
˙
xpdaq (1)
14and the associated choice correspondence as
Mpηq :“ argmax
xPX
upx,ηq. (2)
We endow both ∆pAq and ∆pΘq with the stochastic dominance order induced by the
underlying orders on A and Θ.
Our aim is to establish the monotone comparative statics of Mpηq as η shifts.
However, applying Theorem 3 directly to this lottery space is difficult. As illustrated
next, the induced expected utility function upx,ηq may fail to satisfy pseudo quasi-
supermodularity even when the underlying utility upa,θq is supermodular.
Example 4 (Failure of pQSUP). Consider the space described in Example 2, where
X “ ∆pt0,1u ˆ t0,1uq is endowed with the stochastic dominance order, alongside a
utility function u : t0,1uˆt0,1u Ñ R defined by up0,0q “ up1,0q “ 2, up0,1q “ 0, and
up1,1q “ 1. While u is supermodular, the associated expected utility u fails (pQSUP).
To see this, let x “ 1
2
δp0,0q ` 1
2
δp1,1q, x1
“ 1
2
δp1,0q ` 1
2
δp0,1q, x “ 1
2
δp0,0q ` 1
2
δp0,1q, and x “
1
2
δp0,1q ` 1
2
δp1,1q. Note that x P xNx1
and x P xOx1
. We have upxq “ 3{2 ą 1 “ upxq,
but upxq “ 1{2 ă 1 “ upx1
q, violating (pQSUP).
Since pseudo quasi-supermodularity is necessary for the characterization in The-
orem 3, its failure implies that optimal choices do not generally exhibit monotone
comparative statics on arbitrary subsets S Ă ∆pAq, such as the set tx,x1
,x,xu in the
example. Nevertheless, we can recover monotone comparative statics in “standard”
cases where the choice set includes pure actions. Our analytical approach is to exploit
the linearity of the expected payoff u in x P X. In such cases, monotone compar-
ative statics of Mpηq can be obtained in the weak-set order directly from standard
conditions on the underlying utility u.
Proposition 2. Assume that A is a complete pseudo lattice. Assume also that upa,θq
is bounded, order upper semicontinuous, pseudo supermodular in a, and satisfies in-
creasing differences in pa,θq. Then, for each η P ∆pΘq, Mpηq :“ argmaxxP∆pAq upx,ηq
has largest and smallest elements, both of which belong to A and are nondecreasing
in η. Hence, Mpη1
q ěws Mpηq for all η,η1
P ∆pΘq with η1
ěsd
η.
The result consists of two main observations. Consider first a maximization where
the choice set is restricted to only pure actions A. By Theorem 4, this restricted prob-
lem admits extremal optima, and Theorem 3 implies that they are pSS monotonic
15in η with respect to first-order stochastic dominance. This is because pseudo super-
modularity and increasing-difference—the cardinal conditions—are preserved under
expectation over pure actions.
Now, when we extend the choice space to the lottery space ∆pAq, these pure
actions remain optimal because up¨,ηq is linear in lotteries. Moreover, they remain
extremal because any optimal lottery must assign its entire probability mass within
the interval bounded by the two extremal pure optima. Note, however, that we still
pay a price for the failure of pseudo quasi-supermodularity: the monotone compara-
tive statics property holds only in the weak-set order. As will be seen in the following
sections, Proposition 2 is sufficiently powerful to establish the desired comparative
statics for mixed-strategy Nash equilibria and perfect equilibria.
## 4 Fixed Points and Nash Equilibria
This section develops the analytical machinery for equilibrium analysis on non-lattice
domains. We first establish a fixed-point theorem for pseudo monotonic correspon-
dences along with associated comparative statics results. We then apply these tools to
generalize the theory of games with strategic complementarities, providing a unified
framework that encompasses both pure and mixed strategies.
## 4.1 Existence and comparative statics of fixed points
Consider a self correspondence F : X Ñ X defined over a complete pseudo lattice X
endowed with a partial order ě. We say that an element x P X is a fixed point of F
if x P Fpxq.
Let us call a self-correspondence F : X Ñ X pseudo monotonic if (i) Fpxq is
a nonempty complete pseudo sublattice for each x P X and (ii) F is pSS monotonic,
i.e., Fpx1
q ěpss Fpxq for all x1
,x P X with x1
ě x.
Theorem 5. If F : X Ñ X is a pseudo monotonic correspondence on a complete
pseudo lattice X, then its fixed-point set is a nonempty complete pseudo lattice, thus
admitting the largest and smallest points.
When F is a function, the following generalization of Tarski (1955)’s theorem
obtains:
16Corollary 4. If F : X Ñ X is a nondecreasing function on a complete pseudo lattice
X, then its fixed-point set is a nonempty complete pseudo lattice.
The theorems by Zhou (1994) and Tarski (1955) are the closest antecedents of The-
orem 5 and Corollary 4, respectively. The crucial differences are that they require
X to be a complete lattice and F, in case of a correspondence, to satisfy additional
lattice properties.12
Our results relax these lattice properties to pseudo-lattice coun-
terparts. Recall these properties are substantially weaker. For example, a set X
is a complete pseudo lattice if X is compact and contains the largest and smallest
points (Corollary 1).13
The only price paid is that the fixed points form a complete
pseudo lattice rather than a complete lattice. Crucially, a complete pseudo lattice
always admits extremal elements; thus, our framework remains sufficiently powerful
to guarantee the existence of largest and smallest fixed points, which provides the
foundation for the equilibrium analysis in the subsequent sections.
Crucially for our purposes, pseudo monotonic correspondences are readily amenable
to monotone comparative statics analysis. Let Fptq denote the set of fixed points of
a parametrized self-correspondence Fp¨,tq : X Ñ X.
Theorem 6. For a family of pseudo monotonic self-correspondences Fp¨,tq on a
complete pseudo lattice X, if Fpx,t1
q ěws Fpx,tq for all x P X, then Fpt1
q ěws Fptq.
Directional weakening. As in the individual-choice setup, one may introduce di-
rectional weakenings of the monotonicity requirement for the fixed-point correspon-
dence.14
A subset S of X is a complete upper (resp. lower) pseudo sublattice
if it is chain complete and, for every nonempty S1
Ď S, OX S1
(resp. NX S1
) is
12
Specifically, the correspondence F is required to be complete sublattice-valued and monotonic
in the strong-set dominance sense; see Zhou (1994).
13
Abian and Brown (1961), Smithson (1971), and Li (2014)’s fixed-point theorems require even
weaker conditions. For instance, the version of Li’s theorem invoked by Che, Kim, and Kojima (2019)
requires X to be only a compact partially-ordered set, together with some regularity conditions
ensuring the existence of an upper diagonal or lower diagonal point. The complete pseudo lattice
condition is not much stronger than this; it is weaker than the compactness with extremal points (see
Lemma 1), which only strengthens the regularity condition. However, the results are considerably
more powerful: fixed points are a complete pseudo lattice, so they contain the largest and smallest
points, which is not guaranteed by that theorem (see Che, Kim, and Kojima (2019)). As will be
seen, these properties will be used crucially for the later application, particularly the monotone
comparative statics of perfect equilibria.
14
See the generalized Bertrand game in Section 4.2 for an instance where such a weakening is
needed.
17a nonempty subset of S. We say S1
Ă X upper (resp. lower) pSS dominates
S Ă X, and write S1
ěupss S (resp. S1
ělpss S), if @x P S,@x1
P S1
, x O x1
Ă S1
(resp.
x N x1
Ă S).
If Fpxq is a nonempty complete upper pseudo sublattice for each x P X, and
Fpx1
q ěupss Fpxq,@x1
ě x, then we say F is upper pseudo monotonic—and lower
pseudo monotonicity is defined analogously.
Theorem 51
. If F : X Ñ X is an upper (resp. lower) pseudo monotonic correspon-
dence on a complete pseudo lattice X, then its fixed-point set is nonempty and admits
the largest (resp. smallest) point.
To establish the comparative statics result, let us weaken the weak-set order sim-
ilarly: we say that S1
upper weak-set dominates S, and write S1
ěuws S, if for
every x P S, there exists x1
P S1
with x1
ě x; S1
lower weak-set dominates S,
written S1
ělws S, if for every x1
P S1
, there exists x P S with x ď x1
.
Theorem 61
. Let Fp¨,tq and Fp¨,t1
q be self-correpondences defined on a complete
pseudo lattice X. If Fp¨,t1
q is upper pseudo monotonic and Fpx,t1
q ěuws Fpx,tq
for all x P X, then Fpt1
q ěuws Fptq.15
If Fp¨,tq is lower pseudo monotonic and
Fpx,t1
q ělws Fpx,tq for all x P X, then Fpt1
q ělws Fptq.16
## 4.2 Pseudo quasi-supermodular games
Consider a normal-form game Γ “ pI,S,uq, where S “ ˆiPISi. We assume that each
player’s strategy set Si is a complete pseudo lattice and that S is endowed with the
product order. A strategy profile s “ psiqiPI is a (pure-strategy) Nash equilibrium if
uipsq ě uips1
i,s´iq for every i P I and s1
i P Si.
We say that Γ is a pseudo quasi-supermodular game if, for all i P I,
(P1) ui is bounded, and order upper semicontinuous in si for each s´i P S´i;
(P2) ui is pseudo quasi-supermodular in si and satisfies single-crossing in psi,s´iq.
15
Notice that the monotonicity restriction is imposed only on Fp¨,t1
q, but not on Fp¨,tq. This
generality will play an important role in our later analysis.
16
This result is related to Theorem 3 in Acemoglu and Jensen (2015), in that both the fixed-point
operator and the fixed-point set shift in the weak-set order. Their analysis, however, does not rely
on pseudo-monotonicity; instead, it requires X to be compact and F to be upper hemicontinuous.
18This class generalizes the quasi-supermodular games of Milgrom and Shannon
(1994). It relaxes the crucial requirements that strategy spaces be lattices and that
best-response correspondences form sublattices. Drawing on our individual choice
results (Section 3), conditions (P1) and (P2) together ensure that each player’s best-
response correspondence is pSS monotonic. This allows us to apply our fixed-point
results (Section 4.1) to establish the existence and comparative statics of equilibria.
As a cardinal specialization of a pseudo quasi-supermodular game, we say that Γ
is a pseudo supermodular game if, for all i P I, (P1) holds and
(P21
) ui is pseudo supermodular in si and satisfies increasing-differences in psi,s´iq.
Pseudo supermodular games prove useful in later sections when we study mixed-
strategy Nash equilibria and perfect equilibria. This is because, as a cardinal concept,
the property (P21
) is preserved under randomization.
We next establish the existence, structure, and monotone comparative statics of
Nash equilibria for pseudo quasi-supermodular games. For this purpose, we parametrize
the players’ payoff functions as uip¨,tq : S Ñ R and up¨,tq “ puip¨,tqqiPI. Letting
Γptq “ pI,S,up¨,tqq, we denote the set of pure Nash equilibria of Γptq by Eptq.
Proposition 3. For a family of pseudo quasi-supermodular games Γptq,
(i) the set of (pure) Nash equilibria Eptq is a nonempty complete pseudo lattice;
(ii) if ui satisfies single-crossing in psi,tq for all i P I, then Ept1
q ěws Eptq for all
t1
ą t.
The proof builds directly on our earlier results. By Theorem 4, each player’s best-
response correspondence Bips´i,tq is a nonempty complete pseudo sublattice. By
Proposition 1, it is also pSS monotonic in s´i. The joint best-response correspondence
Bp¨,tq is therefore pseudo monotonic, so applying Theorem 5 establishes that the
equilibrium set Eptq is a nonempty complete pseudo lattice. The comparative statics
result in part (ii) follows from Theorem 6.
Application to generalized Bertrand games. We now apply our equilibrium
framework to a class of generalized Bertrand games. Consider a finite set of firms I,
where each firm i P I chooses a price pi from a finite set Pi Ă R`. Given a price profile
19p P P :“
ś
jPI Pj, firm i sells Dippi,p´iq units of its product at a cost determined by
an increasing, convex function Ci : R` Ñ R`. Firm i’s payoff is its profit
Uippq :“ piDippq ´ CipDippqq. (3)
We assume that each firm’s demand function Di : P Ñ R` satisfies:
(D1) Di is weakly decreasing in pi and weakly increasing in p´i;
(D2)
Dipp1
i,p´iq
Dippi,p´iq
ď
Dipp1
i,p1
´iq
Dippi,p1
´iq
for any pi ă p1
i and p´i ă p1
´i such that Dippi,p´iq ą 0.
The second part of (D1) indicates that the firms’ products are substitutes. Condi-
tion (D2) strengthens this property by implying that firm i’s demand becomes more
inelastic as rivals’ prices increase.
This framework generalizes the Bertrand games studied by Milgrom and Shannon
(1994), who assume a stronger version of (D2) requiring Di to be strictly positive and
continuously differentiable.17
In contrast, our condition applies only when demand
is strictly positive. Notably, our weaker requirement encompasses pure Bertrand
games, which their analysis excludes.18
Beyond pure Bertrand competition, this class
includes various games where demand may drop to zero at certain price profiles or
where demand functions are discontinuous—scenarios typically excluded from the
existing monotone comparative statics literature.
Notably, a generalized Bertrand game is not necessarily pseudo quasi-supermodular,
so our earlier theorems do not apply directly. To see this, consider a standard Bertrand
game with two firms and focus on firm 1’s payoff when it has constant marginal cost
c1. If firm 2 sets p2 ă c1, then any p1 ą p2 yields zero demand and thus maximizes
firm 1’s profit at zero. By contrast, if firm 2 raises its price to some p1
2 ą c1, then
firm 1 can earn strictly positive profit, and no price p1 ą p1
2 maximizes its profit (as-
suming P1 is sufficiently dense). Consequently, firm 1’s payoff fails the single-crossing
property, meaning that the game is not pseudo quasi-supermodular.
17
Strictly speaking, Milgrom and Shannon (1994) do not assume the finiteness of Pi. It ensures
condition (P1) required of (lower) pseudo quasi-supermodular games and ensures the existence of a
Nash equilibrium in pure strategies.
18
More formally, a generalized Bertrand game is a pure Bertrand game if, for each i, Cipqq “ ciq for
some ci P r0,maxpiPPi
pis, and Dippq “ 1{|argminjPI pj| if pi “ minjPI pj and Dippq “ 0 otherwise.
Then, one can show that a pure Bertrand game is a generalized Bertrand game; see Lemma S4 in
Section F.2 of the Supplementary Appendix.
20Despite this failure, the game satisfies the “lower” requirements of a pseudo quasi-
supermodular game—the violation occurs only in the “upper” single-crossing condi-
tion. Thus, our directional results (Proposition 21
in the Appendix) apply, ensuring
both the existence and comparative statics of equilibria.19
For our comparative statics analysis, consider a family of games Γptq “ pI,P,pUip¨,tqqiPIq
satisfying:
(B1) If Dippi,p´i,tq ą 0, then Dippi,p´i,t1
q ą 0 and
Dipp1
i,p´i,t1q
Dippi,p´i,t1q
ě
Dipp1
i,p´i,tq
Dippi,p´i,tq
for all
t1
ą t and p1
i ą pi.
(B2) Cipq1
,tq ´ Cipq,tq is weakly increasing in t for all q1
ą q.
Intuitively, a higher parameter t corresponds to more inelastic demand or higher
marginal costs. To derive payoff implications, we consider a slight strengthening of
condition (B2):
(B21
) For t ă t1
, Cipq,tq “ ciq ď c1
iq “ Cipq,t1
q with maxpiPPi
pi ě ci, and Dipp,tq ď
Dipp,t1
q for all q P R` and p P P.
Condition (B21
) implies condition (B2). With these preparations, we state our results
for generalized Bertrand games below.
Corollary 5. For a family of generalized Bertrand games Γptq,
(i) if (B1) and (B2) hold for each i P I, then Eptq ‰ H and Ept1
q ělws Eptq for all
t1
ą t;
(ii) if (B1) and (B21
) hold for each i P I, then the set of equilibrium profits for each
firm i with c1
i “ ci in Γpt1
q lower weak-set dominates that in Γptq for all t1
ą t.
## 4.3 Mixed-strategy Nash equilibria
A long-standing challenge in the theory of monotone comparative statics is its exten-
sion to mixed strategies. While mixed strategies are essential for game-theoretic anal-
ysis, the set of mixed strategies ∆pSiq, ordered by first-order stochastic dominance,
19
To intuitively see why this directional generalization holds, note that our equilibrium existence
and comparative statics results are derived from the properties of best-response correspondences and
the associated fixed-point theorems. As established in Section 3 and Section 4.1, both the individual
choice results and the fixed-point theory admit directional counterparts that remain valid in this
setting. A formal statement and proof are provided in the Appendix.
21generally fails to form a lattice—even when the underlying pure-strategy space Si is
a lattice; recall Example 2.20
Echenique (2003) explicitly identifies this non-lattice
structure in multidimensional settings as the primary reason why the standard com-
plementarity framework has struggled to accommodate mixed strategies.
By dispensing with the lattice requirement and utilizing our fixed-point results
for pseudo lattices, we provide a unified framework for the MCS analysis of mixed
strategies. This section also serves as a crucial intermediate step for our analysis of
perfect equilibria in Section 5. Establishing tools to handle mixed strategies enables us
to conduct MCS on refinements, such as perfect equilibria, which require perturbing
to fully mixed strategies.
We restrict our attention to a pseudo supermodular game Γ “ pI,S,uq, as cardinal
payoff properties such as pseudo supermodularity are preserved under randomization.
We assume each pure-strategy set Si is a compact, partially ordered Polish space
containing the largest and smallest elements. Let G “ pI,Σ,uq be the mixed extension
of Γ, with Σ :“ ˆiPIΣi and ū :“ pūiqiPI, where Σi “ ∆pSiq is the set of player i’s
mixed strategies and ui : Σ Ñ R is the expected payoff defined by:
uipσq :“
ż
uipsqσpdsq,σ P Σ. (4)
Each Σi is partially ordered by the first-order stochastic dominance relation ěsd
.
Further, since each Σi is compact and contains extremal elements, it forms a complete
pseudo lattice by Corollary 1.
A mixed strategy profile σ “ pσiqiPI is a mixed-strategy Nash equilibrium if
ūipσq ě ūipσ1
i,σ´iq for every i P I and σ1
i P Σi. For a parametrized game Γptq “
pI,S,up¨,tqq and its mixed extension Gptq “ pI,Σ,ūp¨,tqq, we let Nptq denote the set
of all Nash equilibria of Gptq—that is, the set of all pure and mixed Nash equilibria
of Γptq.
Theorem 7. For a family of pseudo supermodular games Γptq and their mixed ex-
tensions Gptq,
(i) Nptq possesses the largest and smallest elements, which are both pure;
(ii) if each ui satisfies increasing differences in psi,tq, then Npt1
q ěws Nptq for all
20
In this example, one can take X “ ∆pt0,1u2
q to represent player i’s mixed-strategy space over
the pure strategy set t0,1u2
.
22t1
ą t.
The proof leverages the complete pseudo lattice structure of the mixed-strategy
space. A primary difficulty, as discussed in Section 3.3 and Example 4, is that the
player’s best-response correspondence
Bipσ´iq :“ argmax
σiPΣi
uipσi,σ´iq (5)
need not be pSS monotonic in rivals’ mixed strategies. However, by Proposition 2,
each Bipσ´iq possesses largest and smallest elements that are pure strategies. These
extremal best responses are nondecreasing in σ´i and therefore pSS monotonic. We
can thus “sandwich” the full best-response correspondence between these monotonic
extremal selections. Applying Theorem 5 and Theorem 6 then establishes the exis-
tence and comparative statics of the largest and smallest equilibria, both of which
are pure.21
## 5 Perfect Equilibria
The existing monotone comparative statics analyses of games have been largely con-
fined to Nash equilibria.22
Extending the analysis to refinements such as (trembling-
hand) perfect equilibria is important. For example, classical games motivating per-
fection are supermodular.23
However, such an extension presents a fundamental challenge: it requires dealing
with perturbations in fully mixed strategies. As discussed earlier, however, the space
21
This “sandwiching” of mixed equilibria between extremal pure equilibria was identified by Mil-
grom and Roberts (1990, Theorem 5) for lattice-based supermodular games. However, their approach
relies on a serial undomination argument that requires full continuity of payoffs. In contrast, our
approach utilizes monotone shifts in best-response correspondences on a pseudo lattice, establishing
existence and MCS under weaker continuity assumptions and on more general domains.
22
See, for instance, Echenique (2004), which develops a notion of supermodularity for dynamic
games and applies it to subgame-perfect equilibrium.
23
For instance, the two games below are supermodular.
Coordination Trap
L R
T 0,0 1,1
B 0,0 0,0
Entry Deterrence
Fight Accom.
Enter ´1,´1 1,1
Not 0,2 0,2
The profiles pB,Lq and pNot, Fightq of the respective games are Nash but not perfect.
23of mixed strategies does not form a lattice—let alone a complete lattice—making the
standard lattice-based machinery inapplicable. Our approach, which accommodates
a more general domain structure, overcomes this limitation and establishes both the
existence of perfect equilibria in pure strategies and their monotone comparative
statics properties.
Let us adopt the same framework as Section 4.3 and consider a pseudo supermod-
ular game Γ “ pI,S,uq. Let G “ pI,Σ,ūq denote the mixed extension of Γ, where
each Σi “ ∆pSiq is partially ordered by the first-order stochastic dominance relation
ěsd
and ū “ pūiqiPI with ūi defined in (4).
Following Selten (1975), we consider perturbed games in which players are con-
strained to play fully mixed strategies. To formalize this idea in general (not neces-
sarily finite) games, for each player i, let Si be the Borel σ-algebra on Si, and let
Mi denote the set of all nonnegative measures µi on Si satisfying µipSiq ď 1. For
two measures µi,µ1
i P Mi, let us write µ1
i Ě µi if µ1
ipS1
iq ě µipS1
iq for all S1
i P Si.
Let M0
i Ă Mi denote the set of full-support measures, i.e., the set of all measures
µi P Mi such that µipS1
iq ą 0 for every nonempty open set S1
i P Si. Let M :“ ˆiMi
and M0
:“ ˆiM0
i .
For µ “ pµiqiPI P M, define
Σµ
i :“ tσi P Σi : σi Ě µiu,
the set of player i’s mixed strategies that place at least the measure µi on every Borel
subset of Si. As shown in the Online Appendix, Σµ
i inherits the complete pseudo
lattice structure of Si.24
When µ P M0
, the strategy space Σµ
captures the idea that
players are constrained to play fully mixed strategies—that is, each player i must
assign positive probability to every open subset of Si. Let Gµ
:“ pI,Σµ
,ūq denote the
µ-constrained game of G, where Σµ
“ ˆiΣµ
i .
To quantify the size of perturbations, define for each µi P Mi the total variation
norm
}µi} “ sup
S1
iPSi
|µipS1
iq| “ µipSiq,
and for each profile µ “ pµiqi, set }µ} “ maxi }µi}.
We are now ready to define perfect equilibrium: A strategy profile σ of the game
24
See Lemma S5 in the Online Appendix for the proof.
24G “ pI,Σ,ūq is a perfect equilibrium if there exists a sequence of µn
-constrained
games Gµn
with µn
P M0
and }µn
} Ñ 0 such that each Gµn
admits a Nash equilibrium
σn
converging weakly to σ.
Our formulation of constrained games and perfect equilibrium parallels Selten’s
and coincides with his original definition when strategy spaces are finite. For games
with infinite strategy spaces, our definition corresponds to Simon and Stinchcombe
(1995)’s notion of strong perfect equilibrium.25
In the setting of infinite normal-form games, it refines the notion of Nash equilib-
rium when payoff functions are continuous:26
Lemma 2. If each ui is continuous, then any perfect equilibrium is also a Nash
equilibrium.
The payoff continuity is used only for Lemma 2 in this section; the subsequent results
do not require this assumption.
To analyze the constrained game Gµ
, it is useful to study a particular class of
strategies in this game. We say a (mixed) strategy σi P Σµ
i is constrained-pure at
si P Si if σi puts maximal feasible mass on si: for each S1
i P Si,
σipS1
iq “
$
&
%
1 ´ µipSizS1
iq if si P S1
i
µipS1
iq otherwise.
(6)
It is straightforward to see that this strategy belongs to Σµ
i .27
We call any strategy
that is constrained-pure at some pure strategy a constrained-pure strategy.
25
These authors advocate this notion because it preserves the “hallmark” property of limit ad-
missibility, meaning that a strategy places no mass in the interior of the set of weakly dominated
strategies. In finite games, limit admissibility coincides with admissibility (that requires weakly
dominated strategies to be played with zero probability). Simon and Stinchcombe (1995) also define
a weaker concept, called weak perfect equilibrium, which fails to satisfy limit admissibility.
26
To see that payoff continuity cannot be dispensed with, consider a game in which each player
i “ 1,2 chooses xi P r0,1s simultaneously, and the payoffs are p1,1q for all px1,x2q, except when
x1 “ x2 “ 1, in which case both players get zero payoffs. Every pair px1,x2q ‰ p1,1q is a perfect
equilibrium, so a limit point px1,x2q “ p1,1q is perfect as well. But it is not a Nash equilibrium.
27
To see that σi is a probability measure, observe that for any S1
i Ă Si,
σipS1
iq “ p1 ´ µipSiztsiuqqδsi
pS1
iq ` µipS1
iztsiuq,
where δsi denotes the Dirac measure at si. This expression represents a nonnegative linear combina-
tion of the two nonnegative measures δsi
p¨q and µip¨ztsiuq, and hence defines a nonnegative measure.
Moreover, since σipSiq “ p1 ´ µipSiztsiuqq ` µipSiztsiuq “ 1, it is a probability measure.
25The following result is central to our comparative statics analysis of perfect equi-
libria. It establishes the existence of the largest and smallest Nash equilibria of the
constrained games and their comparative statics. To do so, we consider a family
of pseudo supermodular games Γptq “ pI,S,up¨,tqq and their µ-constrained games
Gµ
ptq “ pI,Σµ
,ūp¨,tqq. The set of all Nash equilibria of Gµ
ptq is denoted by Nµ
ptq.
Proposition 4. For a family of pseudo supermodular games Γptq and for each µ P M,
(i) Nµ
ptq contains the largest and smallest elements, which are constrained-pure;
(ii) if each ui satisfies increasing-differences in psi,tq, then Nµ
pt1
q ěws Nµ
ptq for all
t1
ą t.
The logic for this result parallels that for mixed-strategy Nash equilibria (Theo-
rem 7), except that here we work with the constrained mixed-strategy space Σµ
. In
this setting, the extremal best responses take the form of constrained-pure strategies.
Apart from considering these constrained-pure best responses, the reasoning proceeds
analogously: we “sandwich” the full best-response correspondence between the ex-
tremal constrained-pure best responses and apply our fixed-point results (Corollary 4
and Theorem 6) to establish the existence and monotone comparative statics of the
extremal equilibria.
We now establish our main results of the current section, namely, the existence
and comparative statics of perfect equilibria:
Theorem 8. For a family of pseudo supermodular games Γptq,
(i) Γptq has a perfect equilibrium in pure strategies;
(ii) the set of perfect equilibria of Γptq is compact and contains maximal/minimal
elements, which are all pure;
(iii) if each ui satisfies increasing differences in psi,tq, perfect equilibria of Γpt1
q weak-
set dominate those of Γptq for all t1
ą t.
We briefly sketch the proof; the full argument appears in the Appendix. Existence
follows directly from Proposition 4(i), which guarantees that each constrained game
Gµ
ptq admits a constrained-pure Nash equilibrium. For any sequence of full-support
measures µn
converging to zero, the corresponding constrained-pure equilibria con-
verge (along a subsequence) to a pure strategy profile that forms a perfect equilibrium.
26Part (ii) also builds on Proposition 4(i). Any perfect equilibrium can be obtained
as the limit of Nash equilibria of constrained games for some vanishing sequence µn
.
Each such equilibrium is sandwiched between the smallest and largest constrained-
pure equilibria of Gµn
ptq, and their limits yield pure perfect equilibria that bound
the given equilibrium. We do not, however, claim the existence of globally smallest
or largest perfect equilibria, since different sequences µn
may generate incomparable
limits.
The comparative statics result in part (iii) follows from Proposition 4(ii). The
constrained-pure equilibria of perturbed game Gµn
pt1
q weak-set dominate those of
Gµn
ptq for each n, and this comparison is preserved after taking limits.
The existence of perfect equilibria in general infinite games is also established by
Simon and Stinchcombe (1995) under the full continuity of payoffs. In contrast, our
result ensures the existence of pure perfect equilibria and, more importantly, delivers a
monotone comparative statics of perfect equilibria absent in Simon and Stinchcombe
(1995).
## 6 Concluding Remarks
This paper has revisited the order-theoretic foundations of monotone comparative
statics. The existing theory has long relied on the assumption that the domain of
choice forms a lattice. We have shown that this structural requirement is not essen-
tial in many settings. By introducing the weaker notion of a pseudo lattice—which
requires only the existence of minimal upper bounds and maximal lower bounds—
we have generalized the core machinery of the theory, including the Monotonicity
Theorem for individual choice and Tarski’s fixed-point theorem.
The primary contribution of this generalization is its capacity to handle environ-
ments that fail the lattice property, most notably the space of probability distribu-
tions. This flexibility has allowed us to provide a unified framework for analyzing
mixed-strategy Nash equilibria and, significantly, to conduct the first general mono-
tone comparative statics analysis of (trembling-hand) perfect equilibria. By treating
perfect equilibria as limits of Nash equilibria in constrained games—where strategy
spaces are pseudo lattices but not lattices—we established the existence of pure per-
fect equilibria and their monotonicity with respect to the underlying environment.
Our framework opens several avenues for future research. First, while we have es-
27tablished the existence of maximal and minimal perfect equilibria, our current results
do not guarantee the existence of a unique largest or smallest perfect equilibrium.
Determining the conditions under which the set of perfect equilibria admits these
global extremal elements remains an open question.
Second, the applicability of our framework to probability measures suggests nat-
ural extensions to Bayesian games. Since the space of distributional strategies often
lacks a lattice structure under standard orders, our pseudo-lattice approach could
facilitate monotone comparative statics analysis in games of incomplete information.
Finally, our results may prove useful in the field of information design. As il-
lustrated in our examples, the set of information structures ordered by the mean-
preserving spread (convex order) forms a complete pseudo lattice but generally fails
to be a lattice. Applying our optimization and fixed-point theorems to this domain
could yield new insights into how optimal information structures respond to changes
in the economic environment.
28References
Abian, S., and A. B. Brown (1961): “A theorem on partially ordered sets, with
applications to fixed point theorems,” Canadian Journal of Mathematics, 13, 78–82.
5, 17
Acemoglu, D., and M. K. Jensen (2015): “Robust Comparative Statics in Large
Dynamic Economies,” Journal of Political Economy, 123(3), 587–640. 18
Che, Y.-K., J. Kim, and F. Kojima (2019): “Weak monotone comparative stat-
ics,” arXiv preprint arXiv:1911.06442. 17
Echenique, F. (2003): “Mixed equilibria in games of strategic complementarities,”
Economic Theory, 22, 33–44. 22
(2004): “Extensive-form games and strategic complementarities,” Games
and Economic Behavior, 46(2), 348–364. 23
Elton, J., and T. P. Hill (1992): “Fusions of a probability distribution,” The
Annals of Probability, pp. 421–454. 9
Kamae, T., and U. Krengel (1978): “Stochastic Partial Ordering,” The Annals
of Probability, 6(6), 1044–1049. 8
Kamae, T., U. Krengel, and G. L. O’Brien (1977): “Stochastic Inequalities on
Partially Ordered Spaces,” The Annals of Probability, 5(6), 899–912. 8, 44
Li, J. (2014): “Fixed Point Theorems on Partially Ordered Topological Vector Spaces
and Their Applications to Equilibrium Problems with Incomplete Preferences,”
Fixed Point Theory and Applications, 192, 1–17. 5, 17
Milgrom, P., and J. Roberts (1990): “Rationalizability, Learning, and Equilib-
rium in Games with Strategic Complementarities,” Econometrica, 58, 1255–1277.
2, 3, 5, 14, 23
Milgrom, P., and C. Shannon (1994): “Monotone Comparative Statics,” Econo-
metrica, 62, 157–180. 2, 3, 4, 5, 12, 13, 14, 19, 20
Müller, A., and M. Scarsini (2006): “Stochastic order relations and lattices of
probability measures,” SIAM Journal on Optimization, 16(4), 1024–1043. SA.1
29Quah, J. K.-H. (2007): “The Comparative Statics of Constrained Optimization
Problems,” Econometrica, 75(2), 401–431. 5, 12
Quah, J. K.-H., and B. Strulovici (2009): “Comparative Statics, Informative-
ness, and the Interval Dominance Order,” Econometrica, 77, 1949–1992. 5
Selten, R. (1975): “Reexamination of the Perfectness Concept for Equilibrium
Points in Extensive Games,” International Journal of Game Theory, 4, 25–55. 4,
24
Simon, L. K., and M. B. Stinchcombe (1995): “Equilibrium refinement for infi-
nite normal-form games,” Econometrica, pp. 1421–1443. 25, 27
Smithson, R. (1971): “Fixed Points of Order Preserving Multifunctions,” Proceed-
ings of the American Mathematical Society, 28, 304–310. 5, 17
Tarski, A. (1955): “A Lattice-Theoretical Fixpoint Theorem and Its Applications,”
Pacific Journal of Mathematics, 5, 285–309. 3, 16, 17
Topkis, D. M. (1979): “Equilibrium Points in Nonzero-Sum n-Person Submodular
Games,” SIAM Journal on Control and Optimization, 17, 773–787. 2, 5
(1998): Supermodularity and Complementarity. Princeton University,
Princeton, New Jersey. 2, 5, 6
Vives, X. (1990): “Nash Equilibrium with Strategic Complementarities,” Journal
of Mathematical Economics, 19, 247–257. 5
Zhou, L. (1994): “The Set of Nash Equilibria of a Supermodular Game is a Complete
Lattice,” Games and Economic Behavior, 7, 295–300. 3, 6, 17
A Proofs for Section 2
Proof of Theorem 1. [“ð” direction:] For any nonempty set S Ă X, we will show
that NX S ‰ H (To prove OX S ‰ H is analogous and thus omitted). Let x be the
smallest point of X, which exists by assumption. For S, their common lower bound,
denoted by LS, is nonempty because x P LS. For any chain C Ă LS, there exists a
30supremum z of C in X since X is chain complete, by assumption. Then, x ě c for
any x P S and c P C since C Ă LS. This and the fact that z is the supremum of C
imply that x ě z for each x P S. Therefore, z P LS. Thus, by Zorn’s lemma, the set
LS has a maximal element, that is, NX S ‰ H, as desired.
[“ñ” direction:] Assume X is a complete pseudo lattice. Then, OX X is
nonempty. Let x P OX X. Then, since OXX Ă UX, we have x ě x1
for every
x1
P X, which shows that x is the largest element. To prove the existence of the
smallest element is analogous and thus omitted. □
Proof of Lemma 1 . We prove that every nonempty chain C Ă X admits a supremum
(and analogously an infimum). To this end, fix any nonempty chain C Ă X and let
U :“
Ş
xPC Ux be the set of all upper bounds for C, where we recall Ux “ ty P X :
y ě xu.
Claim 1. U ‰ H.
Proof. Suppose not. Then,
Ş
xPC Ux “ H. Hence,
Ť
xPCpXzUxq “ X. Recall, by the
definition of natural topology, XzUx is open. Since X is compact, there exists a finite
set Cf Ă C such that
ď
xPCf
pXzUxq “ X. (7)
Meanwhile, since Cf is a finite chain, it admits a maximum x̄. Since XzUx̄ Ą XzUx
for all x P Cf, we have
ď
xPCf
pXzUxq “ XzUx̄. (8)
It follows from (7) and (8) that Ux̄ “ H, which, however, contradicts x̄ P Ux̄. □
For each c P C and u P U, let rc,us :“ tx P X : c ď x ď uu. Claim 1 ensures that
this set is well defined.
Claim 2.
Ş
cPC,uPUrc,us ‰ H.
Proof. Suppose not. Then, Xzp
Ş
cPC,uPUrc,usq “ X, so
ď
cPC,uPU
pXzrc,usq “ X.
31Given our topology, rc,us is closed, so Xzrc,us is open for each c P C,u P U. By the
compactness of X, we have pc1
,u1
q,...,pcK
,uK
q in C ˆ U, for some K P N, such that
K ď
k“1
pXzrck
,uk
sq “ X,
so
K č
k“1
rck
,uk
s “ H.
Meanwhile, since C is a chain, there exists c̄ :“ maxtc1
,...,cK
u, so
K č
k“1
rck
,uk
s “
K č
k“1
rc̄,uk
s “ H. (9)
However, since U consists of upper bounds of all c P C, c̄ ď uk
for all k “ 1,...,K, a
contradiction. □
To complete the proof, let a P
Ş
cPC,uPUrc,us, which is possible by Claim 2. Since
c ď a for all c P C and since a ď u for all u P U, we conclude that a “ supC. □
B Proof for Section 3
Proof of Theorem 31
. In the following, we prove the “upper” version of the result: the
“lower” version is analogous and thus omitted.
[“ð” direction:] To show MS1pt1
q ěuwpss MSptq for every t,t1
P T with t1
ě t and
S,S1
Ď X with S1
ěwpss S, consider any x P MSptq and x1
P MS1pt1
q. Consider any
z1
P px O x1
q X S1
and z P px N x1
q X S; such z and z1
exist since S1
ěwpss S. We have
upx,tq ě upz,tq ñ upz1
,tq ě upx1
,tq ñ upz1
,t1
q ě upx1
,t1
q,
where the first implication follows from upper pseudo quasi-supermodularity of u and
the second implication follows because u satisfies upper single-crossing and z1
ě x1
.
Because x1
P MS1pt1
q by assumption, it follows that z1
P MS1pt1
q, as desired.
[“ñ” direction:] To prove that u is upper single-crossing in px,tq, consider any t1
ě t
and x1
ě x such that upx1
,tq ě upx,tq. Choose S “ S1
“ tx,x1
u. Clearly, S1
ěwpss S,
and x1
P MSptq. Fix any x2
P MS1pt1
q Ă tx,x1
u. That MS1pt1
q ěuwpss MSptq and
32x1
O x2
“ tx1
u implies x1
P MS1pt1
q, which in turn implies upx1
,t1
q ě upx,t1
q, as
desired.
Next, to prove u is upper pseudo quasi-supermodular in x, let S “ tx,zu and S1
“
tx1
,z1
u, for arbitrary z P xNx1
and z1
P xOx1
. Suppose that x and x1
are incomparable
(since otherwise the result holds trivially). Assume that upx,tq ě upz,tq. Then,
x P MSptq. Since S1
ěwpss S and S1
X px O x1
q “ tz1
u, MS1ptq ěuwpss MSptq requires
z1
P MS1ptq. It follows that upz1
,tq ě upx1
,tq, proving the upper pseudo quasi-
supermodularity of u in x. □
Proof of Theorem 4. This result follows immediately from a directional version in
Theorem 41
below. □
We say that S Ă X is an upper (resp. lower) pseudo sublattice if, for any x,x1
P S,
x O x1
Ă S (resp. x N x1
Ă S), and that S is a complete upper (resp. lower) pseudo
sublattice if, for every nonempty S1
Ď S, OX S1
(resp. NX S1
) is a nonempty subset
of S.
Theorem 41
. Assume X is a pseudo lattice and u : X Ñ R is upper (resp. lower)
pseudo quasi-supermodular.
(i) argmaxxPX upxq is an upper (resp. lower) pseudo sublattice of X whenever it is
nonempty.
(ii) In addition, if X is a complete pseudo lattice and u is order upper semicontinu-
ous, then argmaxxPX upxq is a nonempty, complete upper (resp. lower) pseudo
sublattice, admitting the largest (resp. smallest) point.
Proof. Throughout the proof, we only establish the upper case since the proof for the
lower case is analogous.
For (i), if s,s1
P argmaxxPX upxq, then upsq ě upzq for any z P sNs1
, which implies
by upper pseudo quasi-supermodularity that upz1
q ě ups1
q for any z1
P sOs1
, meaning
z1
P argmaxxPX upxq, as desired.
For (ii), let us establish a couple of claims (see the Online Appendix for proof):
Claim 3. For any subset X1
Ă X and each x P X1
, there is a maximal chain in X1
containing x.
Claim 4. If X is chain complete, then for any x,y and z with x,y P Uz, pxNyqXUz
is nonempty. Also, for any x,y and z with x,y P Lz, px O yq X Lz is nonempty.
33To first prove argmaxxPX upxq ‰ H, let
M :“ sup
xPX
upxq,
(where M is possibly infinite) and observe that there exists a sequence txnu such that
lim
kÑ8
sup
něk
upxnq “ M.
We construct an increasing sequence (hence a chain) tynu satisfying upynq ě upxnq
for every n. Letting y denote the supremum of tynu, the order upper semicontinuity
of u implies
upyq ě lim
kÑ8
sup
něk
upynq ě lim
kÑ8
sup
něk
upxnq “ M,
which shows that y P argmaxxPX upxq.
To construct tynu, we begin by defining z0
“ tz0
nunPN such that z0
n “ xn. Given
zm´1
“ tzm´1
n unPN, we recursively construct, for each m ě 1, a sequence zm
“ tzm
n unPN
satisfying:
(a) zm
n “ zm´1
n for all n ă m;
(b) zm
1 ď zm
2 ď ¨¨¨ ď zm
m ď zm
n for all n ą m;
(c) upzm
n q ě upxnq for all n ě 1.
Note that z0
satisfies (a)–(c) trivially.
Once such sequences are constructed, it suffices to define yn :“ zn
n. Indeed, for
every n, conditions (a) and (b) imply that zn`1
n`1 ě zn
n, so tynu is increasing, and
condition (c) implies that upzn
nq ě upxnq.
Fix m ě 1 and suppose that zm´1
satisfies (a)–(c). To satisfy (a), define zm
n :“
zm´1
n for all n ă m. It remains to define zm
n for n ě m. Let w0 :“ zm´1
m . For k ě 1,
given the pair pwk´1,zm´1
m`kq, we inductively construct pwk,zm
m`kq as follows, with the
goal of defining zm
m as the limit of twku:
Case I: If there exists x P wk´1 O zm´1
m`k such that upxq ě upzm´1
m`kq, then set
wk :“ wk´1, zm
m`k :“ x.
34Case II: If upxq ă upzm´1
m`kq for all x P wk´1 O zm´1
m`k, then the upper pseudo quasi-
supermodularity of u implies that
upxq ě upwk´1q for all x P wk´1 N zm´1
m`k.
By Claim 4, there exists some
x1
P pwk´1 N zm´1
m`kq X tx : x ě zm´1
m´1 “ zm
m´1u.
Define
wk :“ x1
, zm
m`k :“ zm´1
m`k.
In either case, for each k ě 1, we have
zm
m´1 “ zm´1
m´1 ď wk ď wk´1 and wk ď zm
m`k, (10)
upwkq ě upwk´1q and upzm
m`kq ě upzm´1
m`kq ě upxm`kq. (11)
Since twku is a chain, it admits an infimum; define zm
m to be this infimum. By
(10), we have zm
m ď wk ď zm
m`k for all k ě 1, so condition (b) holds for zm
. Moreover,
by the order upper semicontinuity of u,
upzm
mq ě lim
nÑ8
sup
kěn
upwkq ě upw0q “ upzm´1
m q ě upxmq.
Together with (11), this shows that zm
satisfies condition (c), completing the induc-
tion.
We now prove that MXpuq is a complete upper pseudo sublattice. Consider any
S Ă MXpuq and any s̄ P OX S. We need to show s̄ P MXpuq, which will imply
that s̄ is a supremum of S if S is a chain (since X is chain complete), so MXpuq is
chain complete. (That NX S Ă MXpuq follows from an analogous argument.) Let
M̂ “ MXpuq X Ls̄. Suppose for contradiction that s̄ R M̂. By Claim 3, there is
a collection pCxqxPM̂ such that each Cx is a maximal chain in M̂ that contains x.
Letting zx “ supCx, we have zx P M̂ by the order upper semicontinuity of u, which
implies zx ă s̄. Also, there must exist some x,y P M̂ with zx ‰ zy since otherwise
we would have some x̄ “ supCx,@x P M̂ with x̄ ă s̄, which would imply x̄ P US
(since S Ă M̂) and contradict s̄ P OX S. Also, we cannot have zx ă zy or zx ą zy
35since we could then add zy to Cx or zx to Cy to form a larger chain, contradicting
the maximality of Cx or Cy, respectively. Thus, zx and zy must be incomparable. By
Claim 4, one can then find some x̂ P pzx O zyq X Ls̄ with x̂ ą zx. Since upzxq ě upxq
for any x P zx Nzy, the upper pseudo quasi supermodularity of u implies upx̂q ě upzyq
and thus x̂ P M̂. This contradicts the maximality of Cx since Cx Y tx̂u is a larger
chain in M̂. Thus, s̄ P M̂. □
Proof of Proposition 2. To begin, let us define û : A ˆ ∆pΘq Ñ R by
ûpa,ηq :“
ż
upa,θqηpdθq. (12)
First, ûp¨,ηq is pseudo supermodular, and thus pseudo quasi-supermodular, in a
since the pseudo supermodularity of u is preserved under a convex combination. By
Lemma S1 in the Online Appendix, ûp¨,ηq is order upper semicontinuous. Thus,
by Theorem 4(ii), argmaxaPA ûpa,ηq is a complete pseudo sublattice, admitting the
largest and smallest points, apηq and apηq. Hence, any a is not optimal if a ­ď apηq or
a ­ě apηq. Letting a “ apηq and a “ apηq, we show that δapηq and δapηq are the greatest
and smallest elements in argmaxx̃PX ūpx̃,ηq, respectively. Fix any upward closed set
A1
Ă A and any x P argmaxx̃PX ūpx̃,ηq. Then, δapA1
q “ xpA1
q “ δapA1
q “ 1 if a P A1
;
δapA1
q “ 0 ď xpA1
q ď 1 “ δapA1
q if a R A1
but a P A1
; and δapA1
q “ xpA1
q “ δapA1
q “ 0
if a R A1
. Thus, the desired conclusion follows.
Observe next that for any a1
ě a and η1
ěsd
η,
ûpa1
,η1
q ´ ûpa,η1
q “
ż
pupa1
,θq ´ upa,θqqη1
pdθq
ě
ż
pupa1
,θq ´ upa,θqqηpdθq
“ ûpa1
,ηq ´ ûpa,ηq,
where the inequality follows since η1
ěsd
η and upa1
,¨q ´ upa,¨q is monotonic (due to
the increasing differences property of u). Thus, û satisfies single-crossing in pa,ηq.
By Proposition 1, argmaxaPA ûpa,η1
q ěpss argmaxaPA ûpa,ηq, implying that apηq and
apηq are nondecreasing in η. Combined with the observation that δapηq and δapηq are
the largest and smallest elements of Mpηq, this implies that Mpη1
q ěws Mpηq. □
36C Proofs for Section 4
Proof of Theorem 5. Letting XF denote the set of fixed points of F, we first prove
XF ‰ H. To this end, consider any point x P X` “ tx1
P X : x2
ě x1
for some x2
P
Fpx1
qu.28
By Claim 3, there is a maximal chain C in X` that contains x. Letting
x̄C “ supC, we have ȳC :“ supFpx̄Cq ě supFpx1
q ě x1
for all x1
P C, which implies
ȳC P UC and thus ȳC ě x̄C. Then, FpȳCq ěpss Fpx̄Cq and thus y1
ě ȳC for some
y1
P FpȳCq (since ȳC P Fpx̄Cq). This implies ȳC P X`. If ȳC ą x̄C, then C Y tȳCu
would be a larger chain in X` than C, contradicting the maximality of C. Thus,
ȳC “ x̄C, meaning x̄C P XF .
To show that XF is a complete pseudo lattice, we need to prove: (i) for any
S Ă XF , OXF
S ‰ H and NXF
S ‰ H; (ii) XF is chain complete.
For (i), we only prove OXF
S ‰ H (since proving NXF
S ‰ H is analogous). Let
T “ US X tx1
P X : x1
ě x2
for some x2
P Fpx1
qu
and consider a maximal chain C in T (which is nonempty since it contains supX).
Letting z :“ inf C, we aim to show z P XF , which will imply z P OXF
S since, if there
were any z1
ă z such that z1
P US XXF , then C Ytz1
u would form a larger chain in T
than C, a contradiction. Suppose now, for contradiction, that z R XF . Observe that
y :“ inf Fpzq ď inf Fpxq ď x for all x P C, implying y P LC and thus y ď z. We must
have y ă z since z R XF and y P Fpzq. Given this, we show below that there is some
ỹ P T with ỹ ă z, which will lead to the desired contradiction since C Ytỹu would be
a larger chain in T than C.
By the well-ordering theorem, there exists an ordinal γ such that S “ tsαuαăγ.
We construct a chain C̃ “ txαuαăγ inductively, whose supremum gives the desired ỹ.
Initial step. Choose x1 to be any element of py O s1q X Lz, which is nonempty by
Claim 4 and the fact that y,s1 P Lz. Since z ě s1, y P Fpzq, and s1 P Fps1q, the pSS
monotonicity of F implies x1 P Fpzq, because Fpzq ěpss Fps1q.
Inductive step. Let β ą 1 be any ordinal smaller than γ, and suppose that we have
constructed an increasing chain
pxαqαăβ Ă Lz with xα P Fpzq for all α ă β.
28
Note that X` is nonempty since it contains the smallest point of X, which exists since X is a
complete pseudo lattice.
37Define
x̃ :“ sup
αăβ
xα.
This supremum exists and satisfies x̃ P Fpzq since Fpzq is a complete pseudo sublat-
tice. As before, the set px̃OsβqXLz is nonempty, and we choose any element of this
set to be xβ.
Since z ě sβ, x̃ P Fpzq, and sβ P Fpsβq, the pSS monotonicity of F implies
xβ P Fpzq, because Fpzq ěpss Fpsβq. Adding xβ to pxαqαăβ preserves the chain
property.
By construction, C̃ Ă Fpzq and xα ě sα for all α ă γ. Since C̃ is a chain and X
is chain complete, there exists
ỹ :“ supC̃ “ O X
C̃.
Moreover, ỹ P Fpzq because Fpzq is a complete pseudo sublattice. We also have
ỹ P US, since ỹ ě xα ě sα for all α ă γ.
Finally, since z P UC̃ and ỹ “ supC̃, it follows that ỹ ď z. In fact, ỹ ă z, because
z R Fpzq. By pSS monotonicity, this implies that there exists z̃ P Fpỹq such that
z̃ ď ỹ, since ỹ P Fpzq and Fpỹq ďpss Fpzq. Hence, ỹ P T, as desired.
For (ii), we prove only that any chain C Ă XF has a supremum in XF , as the
argument for the infimum is analogous. Let
xC :“ sup
X
C,
which exists since X is chain complete. Define a self-correspondence G on Y :“ UxC
by
Gpxq :“ Fpxq X Y for each x P Y.
We first show that G is nonempty-valued. It suffices to show that
GpxCq “ FpxCq X UxC
‰ H.
Indeed, once this holds, the pSS monotonicity of F implies that for any x ě xC, there
exist x1
P Fpxq and x2
P FpxCq with x2
ě xC such that, for some x̃ P x1
Ox2
, we have
x̃ P Fpxq. Since x̃ ě xC, this implies x̃ P Fpxq X UxC
, and hence Gpxq ‰ H.
38To show that GpxCq ‰ H, note that for each x P C, we have x P Fpxq and
FpxCq ěpss Fpxq. It follows that supFpxCq ě x for all x P C. Therefore,
supFpxCq P FpxCq X UC Ă FpxCq X UxC
“ GpxCq.
Observe next that for each S Ă Y , NY S “ pNX Sq X Y and OY S “ pOX Sq X
Y . Using this observation, it is straightforward to see that G is complete-pseudo-
sublattice-valued and pSS monotonic. Thus, letting YG denote the set of fixed points
of G [JW: and applying the part (i) to G and YG, it follows that NYG
YG ‰ H, so]
YG contains a smallest point, say xG. Clearly, xG is also a fixed point of F and
corresponds to supXF
C since any fixed point of F weakly greater than xC is also a
fixed point of G and thus weakly greater than xG. □
Proof of Theorem 6. Fix any x P Fptq and let Z “ Ux. Define a self-correspondence
on Z as follows: for each x̃ P Z, Hpx̃q “ Fpx̃,t1
q X Z. Fix any x̃ P Z. Since
x P Fpx,tq and Fpx̃,t1
q ěpss Fpx,t1
q ěuws Fpx,tq, there is y P Fpx̃,t1
q with y ě x,
so H is nonempty-valued. It is straightforward to see that as Fpx̃,t1
q is a complete
pseudo sublattice, so is Hpx̃q “ Fpx̃,t1
qXZ. It is also straightforward that H is pSS
monotonic on Z. Thus, by Theorem 5, the set of fixed points of H, denoted XH, is
nonempty. Since XH Ă Fpt1
q and any x̃ P XH is weakly greater than x, we have just
proved that Fpt1
q ěuws Fptq. The proof for Fpt1
q ělws Fptq is analogous and hence
omitted. □
Proof of Proposition 3. Denote the (pure-strategy) best-response correspondence for
player i in game Γptq by
Bips´i,tq :“ argmax
siPSi
uipsi,s´i,tq, (13)
and let Bps,tq “
ś
iPI Bips´i,tq. Note that a strategy profile s “ psiqiPI is a (pure-
strategy) Nash equilibrium if and only if s P Bps,tq.
To prove part (i), suppose that Γptq is pseudo quasi-supermodular. Note first that
Si is a complete pseudo lattice, and ui is order upper semi-continuous and pseudo
quasi-supermodular in si for each i by assumption. So, by Theorem 4 (ii), Bips´i,tq
is a nonempty, complete pseudo sublattice. Moreover, for each s´i,s1
´i P S´i with
s1
´i ě s´i, because ui satisfies single-crossing in psi,s´iq by assumption, by Proposi-
tion 1, Bips1
´i,tq ěpss Bips´i,tq. Thus, it follows that Bp¨,tq has the property that
39Bps1
,tq ěpss Bps,tq for every s,s1
P S with s1
ě s, that is, Bp¨,tq is pSS monotonic
(with respect to the product order on S). Therefore, it follows that B is pseudo
monotonic. Thus, by Theorem 5, the set of fixed points of B is a nonempty, complete
pseudo lattice, and thus has a largest element. We complete the proof by observing
that the set of fixed points of B is equivalent to the set of pure Nash equilibria of
Γptq, Eptq.
To prove part (ii), observe that since ui satisfies single-crossing in ps,tq for each
i P I by assumption, by Proposition 1, we have Bps,t1
q ěpss Bps,tq for each s P S,
which implies that Bp¨,t1
q weak-set dominates Bp¨,tq. So, by Theorem 6, it follows
that Ept1
q ěws Eptq, as desired. □
Proof of Theorem 7. This result follows immediately from setting µ ” 0 in Proposi-
tion 4 in Section 5. □
D Proofs for Section 5
First, we establish useful properties of the best response in the constrained games:
Lemma 3. Consider a family of pseudo supermodular games pI,S,up¨,tqq. For any
nonnegative measures µ “ pµiqiPI P M, define the best response correspondence as
Bµ
i pσ´i;tq :“ arg max
σiPΣµ
i
ż
uipsi,s´i,tqσipdsiqσ´ipds´iq.
Then,
(i) Bµ
i pσ´i;tq has largest and smallest elements, σµ
i pσ´i;tq and σµ
i pσ´i;tq, which
are both constrained-pure and nondecreasing in σ´i;
(ii) σµ
i pσ´i;t1
q ěsd
σµ
i pσ´i;tq and σµ
i pσ´i;t1
q ěsd
σµ
i pσ´i;tq for any t1
ě t if ui
satisfies increasing differences in psi,tq.
Proof. Observe first that the unconstrained best response Bi, defined in (5), has
the largest and smallest elements in pure strategies—denoted bipσ´i;tq and bipσ´i;tq,
respectively—that are nondecreasing in σ´i. This follows directly from Proposition 2
by mapping the payoff function and best response in (4) and (5) to those in (1) and
(2), respectively, with a “ si and θ “ s´i (so that x “ σi and η “ σ´i).
40Next, let σµ
i denote a strategy constrained-pure at bi :“ bipσ´i;tq: that is, for each
S1
i Ă Si,
σµ
i pS1
iq “
$
&
%
1 ´ µipSizS1
iq if bi P S1
i
µipS1
iq if bi R S1
i.
Let us define for each σ “ pσiqiPI and si P Si,
ūipσ,tq “
ż
sPS
uips,tqσpdsq and ûipsi,σ´i,tq “
ż
s´iPS´i
uipsi,s´i,tqσ´ipds´iq.
Then, for any σi P Σµ
i ,
ūipσµ
i ,σ´i,tq ´ ūipσi,σ´i,tq
“
ż
ûipsi,σ´i,tqσµ
i pdsiq ´
ż
ûipsi,σ´i,tqσipdsiq
“ûipbi,σ´i,tqrσµ
i ptbiuq ´ σiptbiuqs ´
ż
Siztbiu
ûipsi,σ´i,tqrσi ´ σµ
i spdsiq
“
ż
Siztbiu
rûipbi,σ´i,tq ´ ûipsi,σ´i,tqsrσi ´ σµ
i spdsiq
“
ż
Siztbiu
rûipbi,σ´i,tq ´ ûipsi,σ´i,tqsrσi ´ µispdsiq
ě0.
The third equality follows since σµ
i ptbiuq ´ σiptbiuq “
ş
Siztbiu
rσi ´ σµ
i spdsiq and the
fourth equality follows from the construction of σµ
. Finally, the inequality follows
from the fact that bi is a best reponse to σ´i and σi Ě µi for any σi P Σµ
i . Moreover,
the inequality is strict if rσi ´ µispSiztsi : si ď biuq ą 0. This proves that σµ
i P
Bµ
i pσ´i;tq and that any σi P Σµ
i which is not stochastically dominated by σµ
i cannot
be a best response. We thus conclude that σµ
i is the largest element of Bµ
i pσ´i;tq.
Likewise, a strategy constrained-pure at bipσ´i;tq, denoted as σµ
i , is the smallest point
of Bµ
i pσ´i;tq. This completes the proof of part (i).
To prove part (ii), observe first that as ui satisfies increasing differences in psi,tq, so
does ûi (since ûi is a convex combination of ui with respect to σ´i). Thus, bipσ´i;t1
q ě
bipσ´i;tq and bipσ´i;t1
q ě bipσ´i;tq. To prove σµ
i pσ´i;t1
q ěsd
σµ
i pσ´i;tq, we need
to show that σµ
i pσ´i;t1
qpS1
iq ě σµ
i pσ´i;tqpS1
iq for any upward closed set S1
i Ă Si.
There are two cases. Suppose first bipσ´i;tq R S1
i. Then, σµ
i pσ´i;t1
qpS1
iq ě µipS1
iq “
41σµ
i pσ´i;tqpS1
iq. Suppose next bipσ´i;tq P S1
i. Then, bipσ´i;t1
q P S1
i (since S1
i is an
upward closed set) so σµ
i pσ´i;t1
qpS1
iq “ σµ
i pσ´i;tqpS1
iq “ 1 ´ µipSizS1
iq, as desired.
Likewise, we have σµ
i pσ´i;t1
q ěsd
σµ
i pσ´i;tq, completing our proof. □
Proof of Proposition 4. Throughout this proof, for any mapping F, let XF denote its
fixed-point set.
For part (i), consider the following self-maps on Σµ
“ ˆiPIΣµ
i :
Fpσq “ pσµ
i pσ´i;tqqiPI, Fpσq “ pσµ
i pσ´i;tqqiPI, Hpσq “ pBµ
i pσ´i;tqqiPI, (14)
where σµ
i , σµ
i , and Bµ
i are as defined in Lemma 3. Note that any point in XF , XF ,
or XH is a Nash equilibrium of Gµ
. Both F and F are pseudo monotonic, as they
are singleton-valued and σµ
i p¨;tq and σµ
i p¨;tq are weakly increasing by Lemma 3(i).
By Theorem 5, XF and XF each admit extremal points, which must be constrained-
pure by construction. Let σ and σ denote the smallest and largest elements of XF
and XF , respectively. Moreover, by Lemma 3(i), σµ
i pσ´i;tq ěsd
σi ěsd
σµ
i pσ´i;tq for
any σi P Bµ
i pσ´i;tq, implying Fpσq ěws Hpσq ěws Fpσq at each σ P Σµ
. Hence, by
Theorem 61
, σ ě σ ě σ for every σ P XH “ Nµ
ptq, as desired.
For part (ii), define F and F as in (14) and define
Gpσq “ pσµ
i pσ´i;t1
qqiPI, Gpσq “ pσµ
i pσ´i;t1
qqiPI. (15)
By Lemma 3(ii), Gpσq ěws Fpσq and Gpσq ěws Fpσq at each σ P Σµ
. Then, by
Theorem 6, the largest point of XG is weakly greater than that of XF ; the smallest
point of XG is weakly greater than that of XF . Given part (i), this implies Nµ
pt1
q ěws
Nµ
ptq.□
Proof of Theorem 8. For parts (i) and (ii), we focus on the game Gptq. Consider
any sequence of constrained games tGµn
ptqun with each µn
belonging to M0
and
}µn
} Ñ 0. By Proposition 4(i), each constrained game Gµn
ptq has a constrained-pure
Nash equilibrium σn
. Then, part (i) follows from the next claim:
Claim 5. A (sub)sequence of constrained-pure strategy profiles tσn
un must weakly
converge to a pure strategy profile.
Proof. Let sn
i denote a pure strategy on which σn
i puts the maximum weight. By the
compactness of Si, tsn
i un (or its subsequence) converges to some limit s̃i P Si. To
42show that σn
i weakly converges to s̃i (i.e., the mixed strategy putting all the weight
on s̃i), it suffices to show that for any bounded continuous function f defined on Si,
ż
siPSi
pfpsiq ´ fps̃iqqdσn
i psiq Ñ 0. (16)
To show this, for any ϵ ą 0, we can find N such that for any n ą N, |fpsn
i q´fps̃iq| ă ϵ
2
and µn
i pSiq ă ϵ
2pM´mq
, where M “ supsi
fpsiq and m “ infsi
fpsiq.29
Note that the
latter inequality implies σn
i pSiztsn
i uq ă ϵ
2pM´mq
. Observe now that
ˇ
ˇ
ˇ
ˇ
ż
siPSi
pfpsiq ´ fps̃iqqdσn
i psiq
ˇ
ˇ
ˇ
ˇ ď |fpsn
i q ´ fps̃iq|σn
i ptsn
i uq `
ż
siPSiztsn
i u
|fpsiq ´ fps̃iq|dσn
i psiq
ă
ϵ
2
` pM ´ mq
ϵ
2pM ´ mq
“ ϵ,
establishing the desired convergence. □
For part (ii), we first establish compactness. Since Σ is a metrizable space, it suf-
fices to prove sequential compactness. Consider a sequence of perfect equilibria tσn
un.
Because Σ is compact, this sequence admits a convergent subsequence. Denoting its
limit by σ, we show that σ is a perfect equilibrium.
Since each σn
is a perfect equilibrium, there exists a sequence of constrained
games tGµn,m
ptqum and an associated sequence of Nash equilibria tσn,m
um such that
}µn,m
} Ñ 0 and σn,m
Ñ σn
as m Ñ 8. For each n, choose mpnq sufficiently large so
that
max
␣
}µn,mpnq
}, dpσn
,σn,mpnq
q
(
ă
1
n
, (17)
where dp¨,¨q denotes the metric on Σ, which generates the weak topology.
For each n, define µ̃n
:“ µn,mpnq
and σ̃n
:“ σn,mpnq
. Observe first that σ̃n
is a Nash
equilibrium of the constrained game Gµ̃n
ptq. Moreover, by (17), we have }µ̃n
} Ñ 0 as
n Ñ 8, and σ̃n
Ñ σ. Indeed,
dpσ̃n
,σq “ dpσn,mpnq
,σq ď dpσn,mpnq
,σn
q ` dpσn
,σq,
and both terms on the right-hand side converge to zero. This establishes that σ is a
29
We may assume without loss that M ą m since otherwise (16) holds trivially.
43perfect equilibrium.
To prove the existence of a maximal perfect equilibrium, note that by Lemma 1,
the set of perfect equilibria is chain complete since it is compact as shown above. Let σ
be any perfect equilibrium of Γptq, whose existence follows from part (i). By Claim 3,
there exists a maximal chain of perfect equilibria containing σ. Chain completeness
then implies that this maximal chain admits a supremum, which must be a maximal
perfect equilibrium.
To prove that all maximal perfect equilibria are pure, it suffices to show that
for any perfect equilibrium σ of Γptq, there exists a pure perfect equilibrium that
weakly dominates σ under ěsd
. Consider a sequence of games tGµn
ptqun whose Nash
equilibria tσn
un converge weakly to σ. By Proposition 4(i), for each Gµn
ptq, there
exists a constrained-pure strategy Nash equilibrium σ̄n
that dominates σn
under ěsd
.
By Claim 5, tσ̄n
un (or its subsequence) converges to a pure strategy profile. We
denote this limit by σ̄, and it constitutes a perfect equilibrium.
To show that σ̄ ěsd
σ, we use the following result from Kamae, Krengel, and
O’Brien (1977):
Fact 1. Let tPnun and tQnun be sequences of probability measures on a Polish space
that converge weakly to P and Q, respectively. If Qn ěsd
Pn for all n, then Q ěsd
P.
Since σ̄n
ěsd
σn
for all n, and σ̄ and σ are their respective weak limits, it follows
that σ̄ ěsd
σ, as desired.
The proof for minimal perfect equilibria is analogous and is therefore omitted.
For part (iii), we only establish the upper weak-set dominance since the lower
weak-set dominance can be established analogously. Consider any perfect equilibrium
σ for Γptq which is a weak limit of Nash equilibria tσn
un for tGµn
ptqun. By Proposi-
tion 4, there exists a constrained-pure strategy Nash equilibrium σ̃n
for Gµn
pt1
q that
dominates σn
in ěsd
. Letting σ̃ denote a weak limit of tσ̃n
un, σ̃ is a perfect equilibrium
of Γpt1
q such that σ̃ ěsd
σ due to Fact 1. □
44Supplementary Appendix for:
Monotone Comparative Statics without
Lattices
E Omitted Results for Section 2 and Section 3
Example 5 (Failure of Lattice Property under Convex Order). Let Θ “ tθ1,θ2,θ3u,
and let σ “ pσ1,σ2,σ3q P ∆pΘq denote a belief. To simplify notation, we write pσ1,σ2q
for the belief pσ1,σ2,σ3q with σ3 “ 1´σ1 ´σ2 ě 0. Fix the prior belief at µ “ p2
5
, 2
5
q.
The set
Xµ “ tx P X : xµ ďcx
x ďcx
xµ u
then includes, among others, the following measures:
P “ 1
2
δp
3
10
,
3
10
q
` 1
2
δp
1
2
,
1
2
q
,
Q “ 1
2
δp
3
10
,
1
2
q
` 1
2
δp
1
2
,
3
10
q
,
R “ 1
4
`
δp
1
5
,
2
5
q
` δp
2
5
,
1
5
q
` δp
3
5
,
2
5
q
` δp
2
5
,
3
5
q
˘
,
S “ 5
11
δp
11
20
,
11
20
q
` 3
11
δp
11
20
,0q
` 3
11
δp0,
11
20
q
.
It is straightforward to verify that each of these measures is a mean-preserving spread
of δµ. Following Proposition 4.5 of Müller and Scarsini (2006) (from which this
example is adapted), one can check that: (i) both R and S are mean-preserving
spreads of P and Q; (ii) R and S are incomparable with each other; and (iii) there
exists no x P Xµ that is simultaneously a mean-preserving spread of P and Q and a
mean-preserving contraction of R and S. Hence, the least upper bound of P and Q
does not exist under ěcx
(so Xµ is not a lattice).
Proof of Claim 3. Fix any X1
Ă X and each x P X1
. Consider the family C :“ tC Ă
X1
: C is a chain with x P Cu, and order the elements in C by the set inclusion order.
Take any chain of chains D “ tCαuαPA for totally ordered set A, that is, Cα P C, and
Cα Ď Cβ or Cβ Ď Cα for all α,β P A. Set C7
“
Ť
αPACα, and observe that C7
P C
SA.1and that it is an upper bound of D in C. Thus, by Zorn’s lemma, C must contain a
maximal element. □
Proof of Claim 4. To prove the first statement, observe that by Claim 3, there is a
maximal chain Ĉ in S :“ Uz X Ltx,yu that contains z. Letting x̂ “ supĈ by the
chain-completeness, we have x̂ P Uz. To argue that x̂ P x N y, note first that since
both x and y are upper bounds of Ĉ, x̂ ď x and x̂ ď y, implying x̂ P S. If x̂ R x N y,
then there exists x̄ ą x̂ such that x̄ P Ltx,yu so x̄ P S. Then, Ĉ Y tx̄u would be a
larger chain, contradicting the maximality of Ĉ. The proof of the second statement
is analogous and hence omitted. □
Lemma S1. For η P ∆pΘq, ûp¨,ηq is order upper semicontinuous on A.
Proof. Let C “ taαuα Ă A be any chain, and suppose that a1
P pNA Cq Y pOA Cq
exists (so a1
is either inf C or supC).
For each α, define
hαpθq :“ sup
βěα
upaβ,θq.
Then phαqα is pointwise decreasing in α, and
inf
α
hαpθq “ inf
α
sup
βěα
upaβ,θq for all θ.
We obtain
inf
α
sup
βěα
ûpaβ,ηq “ inf
α
sup
βěα
ż
upaβ,θqηpdθq
ď inf
α
ż
sup
βěα
upaβ,θqηpdθq
“ inf
α
ż
hαpθqηpdθq. (18)
Since the family phαqα is bounded, and phαqα is pointwise decreasing, the Mono-
tone Convergence Theorem yields
inf
α
ż
hαpθqηpdθq “
ż
inf
α
hαpθqηpdθq.
SA.2Combining this with (18),
inf
α
sup
βěα
ûpaβ,ηq ď
ż
inf
α
sup
βěα
upaβ,θqηpdθq. (19)
By order upper semicontinuity of up¨,θq and the fact that a1
is inf C or supC,
inf
α
sup
βěα
upaβ,θq ď upa1
,θq for all θ.
Integrating both sides and using (19) yield
inf
α
sup
βěα
ûpaβ,ηq ď
ż
upa1
,θqηpdθq “ ûpa1
,ηq.
Thus ûp¨,ηq is order upper semicontinuous. □
F Omitted Proofs for Section 4
F.1 Proofs for Directional Results
Proof of Theorem 51
. For each x P X, let Hpxq denote the largest element of Fpxq,
which exists since Fpxq is a complete upper pseudo sublattice. The upper pseudo
monotonicity of F implies that Hpxq, as a singleton-valued correspondence, is non-
decreasing. Hence, by Corollary 4, the fixed-point set of H is a nonempty complete
pseudo lattice and therefore contains a largest element, denoted by x̄H.
To see that x̄H is also the largest fixed point of F, let Fp¨,tq “ Fp¨q and Fp¨,t1
q “
Hp¨q. Then Fpx,t1
q ěws Fpx,tq for all x P X, which implies by Theorem 61
that
Fpt1
q ěws Fptq. It follows that x̄H is the largest fixed point of F as well.
The proof for the case in which the correspondence F is lower pseudomonotonic
is analogous and therefore omitted. □
Proof of Theorem 61
. We prove only the first statement, as the proof of the second
statement is analogous.
Fix any x P Fptq and let Z :“ Ux. Define two self-correspondences on Z. The
correspondence H is defined as in the proof of Theorem 51
, while Gpx̃q “ x for all
x̃ P Z. Clearly, both H and G are pSS monotonic, and Hpx̃q ěws Gpx̃q for all x̃ P Z.
SA.3By Theorem 6, the fixed-point set of H weak-set dominates that of G, which
implies that H has a fixed point x1
ě x (since x is the unique fixed point of G).
Observe that x1
P Fpt1
q, which establishes the desired result. □
F.2 Omitted Proofs for Generalized Bertrand Games
First, we define directional versions of pseudo quasi-supermodular games. Specifically,
we say that Γ is an upper (resp. lower) pseudo quasi-supermodular game if,
for all i P I, condition (P1) of pseudo quasi-supermodular games holds and
(P22
) ui is upper (resp. lower) pseudo quasi-supermodular in si and satisfies upper
(resp. lower) single-crossing in psi,s´iq.
The following is a directional variant of Proposition 3.
Proposition 21
. For a family of upper (resp. lower) pseudo quasi-supermodular
games Γptq,
(i) the set of (pure) Nash equilibria Eptq is nonempty and has the largest (resp. small-
est) element;
(ii) if ui satisfies upper (resp. lower) single-crossing in psi,tq for all i P I, then
Ept1
q ěuws Eptq (resp. Ept1
q ělws Eptq) for all t1
ą t.
Proof. First, we present a directional version of Proposition 1:
Corollary 21
. If u is upper (resp. lower) pseudo quasi-supermodular in x and sat-
isfies upper (resp. lower) single-crossing in px,tq, then MS1pt1
q ěupss MSptq (resp.
MS1pt1
q ělpss MSptq) for all t1
ě t and S1
ěpss S.
Proof. For any x P MSptq and x1
P MS1pt1
q, choose any z P x N x1
and z1
P x O x1
.
Since S1
ěpss S, z P S and z1
P S1
. Suppose that x and x1
are incomparable (or else,
the result would be trivial). Letting Z “ tx,zu and Z1
“ tx1
,z1
u, we have Z1
ěwpss Z,
with Z1
X px O x1
q “ tz1
u, and Z X px N x1
q “ tzu. Since MZ1pt1
q ěuwpss MZptq
by Theorem 31
and since x P MZptq and x1
P MZ1pt1
q, we must have z1
P MZ1pt1
q,
which implies z1
P MS1pt1
q. Since z and z1
were chosen arbitrarily, we have shown
MS1pt1
q ěupss MSptq. □
SA.4Next, we proceed to prove the “upper” versions of the statements of Proposition 21
(the proof for the “lower” version is symmetric and thus omitted).
To prove part (i), suppose that Γptq is upper pseudo quasi-supermodular. Note
first that Si is a complete pseudo lattice, and ui is order upper semi-continuous and
upper pseudo quasi-supermodular in si for each i by assumption. So, by Theorem 41
(ii), Bips´i,tq is a nonempty, complete upper pseudo sublattice. Moreover, for each
s´i,s1
´i P S´i with s1
´i ě s´i, because ui satisfies upper single-crossing in psi,s´iq by
assumption, by Corollary 21
, Bips1
´i,tq ěupss Bips´i,tq. Thus, it follows that Bp¨,tq
has the property that Bps1
,tq ěupss Bps,tq for every s,s1
P S with s1
ě s, that is,
Bp¨,tq is upper pSS monotonic (with respect to the product order on S). Therefore,
it follows that B is upper pseudo monotonic. Thus, by Theorem 51
, the set of fixed
points of B is nonempty and admits a largest element. We complete the proof by
observing that the set of fixed points of B is equivalent to the set of pure Nash
equilibria of Γptq, Eptq.
To prove part (ii), observe that since ui satisfies upper single-crossing in psi,tq
for each i P I by assumption, by Corollary 21
, we have Bps,t1
q ěupss Bps,tq for each
s P S, which implies that Bps,t1
q ěuws Bps,tq for all s. So, by Theorem 61
, it follows
that Ept1
q ěuws Eptq, as desired. □
Now we are ready to analyze generalized Bertrand games. We begin by establish-
ing that a generalized Bertrand game is in the class of a directional version of pseudo
quasi-supermodular games.
Lemma S2. A generalized Bertrand game is lower pseudo quasi-supermodular.
Proof. First, because the strategy space for each player is finite and totally ordered,
it is a complete pseudo lattice. Second, each payoff function is order upper semicon-
tinuous in the player’s own strategy because the strategy space is finite. Moreover,
it also trivially follows that the payoff function of each player is lower pseudo quasi-
supermodular because pi _ p̄i “ p̄i and pi ^ p̄i “ pi, for any pi and p̄i with pi ă p̄i.
Recall that the payoff function of firm i is her profit given pi,p´i, as defined by
(3), and fix any p´i ă p1
´i and pick any pi and p̄i with pi ă p̄i. We shall show that
Uippi,p1
´iq ě Uipp̄i,p1
´iq ñ Uippi,p´iq ě Uipp̄i,p´iq, (20)
which is the lower single-crossing condition we are left with to complete the proof.
SA.5Assume first that Dippi,p´iq “ 0. Then, (D1) implies Dipp̄i,p´iq “ 0, so Uippi,p´iq “
0 “ Uipp̄i,p´iq, as desired.
Assume next that Dippi,p´iq ą 0 and thus Dippi,p1
´iq ą 0 by (D1). Assume
Uippi,p1
´iq ě Uipp̄i,p1
´iq. (21)
One can define cpp´iq and Kpp´iq such that
Cipqq “ qcpp´iq ` Kpp´iq for q P tDipp̄i,p´iq,Dippi,p´iqu. (22)
Define similarly cpp1
´iq and Kpp1
´iq by replacing p´i in (22) with p1
´i. By the convexity
of Ci, we have cpp1
´iq ě cpp´iq.30
Observe that (21) can be rewritten as
ppi ´ cpp1
´iqqDippi,p1
´iq ě pp̄i ´ cpp1
´iqqDipp̄i,p1
´iq. (23)
We next argue that pi ´ cpp1
´iq ě 0. This is immediate from (23) if Dipp̄i,p1
´iq “ 0
(recall Dippi,p1
´iq ą 0). Suppose thus that Dipp̄i,p1
´iq ą 0. If pi ´ cpp1
´iq ă 0, then
(23) would imply
p̄i ´ cpp1
´iq ď ppi ´ cpp1
´iqq
Dippi,p1
´iq
Dipp̄i,p1
´iq
ď pi ´ cpp1
´iq
since
Dippi,p1
´iq
Dipp̄i,p1
´iq
ě 1, which contradicts p̄i ą pi. Thus p̄i ´ cpp1
´iq ą pi ´ cpp1
´iq ě 0.
Using this and cpp1
´iq ě cpp´iq, we obtain
pi ´ cpp´iq
p̄i ´ cpp´iq
ě
pi ´ cpp1
´iq
p̄i ´ cpp1
´iq
ě
Dipp̄i,p1
´iq
Dippi,p1
´iq
ě
Dipp̄i,p´iq
Dippi,p´iq
, (24)
where the second inequality follows from (23) while the last inequality from (D2). It
follows from (24) that ppi ´cpp´iqqDippi,p´iq ě pp̄i ´cpp´iqqDipp̄i,p´iq, which implies
30
To see this, let q “ Dippi,p´iq and q̄ “ Dipp̄i,p´iq while letting q1
“ Dippi,p1
´iq and q̄1
“
Dipp̄i,p1
´iq. Note that q ě q̄ and q1
ě q̄1
. If q “ q̄, then cpp´iq can be chosen sufficiency small
to satisfy cpp´iq ď cpp1
´iq. Also if q1
“ q̄1
, then cpp1
´iq can be chosen sufficiency large to satisfy
cpp´iq ď cpp1
´iq. Suppose thus that q ą q̄ and q1
ą q̄1
. Observe now that, by (D1), q ď q1
and q̄ ď q̄1
.
Given this, the convexity of Ci implies
cpp´iq “
Cipqq ´ Cipq̄q
q ´ q̄
ď
Cipq1
q ´ Cipq̄1
q
q1 ´ q̄1
“ cpp1
´iq.
SA.6Uippi,p´iq ě Uipp̄i,p´iq, completing the proof. □
Next, we proceed to study the comparative statics of generalized Bertrand games.
Lemma S3. Suppose that a family of generalized Bertrand games Γptq satisfies (B1)
and (B2). Then, for any i P I, Ui satisfies lower single-crossing in ppi,tq.
Proof. Recall that the shift from Γptq to Γpt1
q with t1
ą t involves the two changes,
(B1) and (B2). It suffices to establish the result under each change separately.
First, consider the case in which (B2) holds, while the demand Dipp,tq is con-
stant in t. Given (B2), we shall show that Ui satisfies lower single-crossing in
ppi,tq: that is, for any p1
i ě pi and p´i, Uipp1
i,p´i,tq ´ Uippi,p´i,tq ą 0 implies
Uipp1
i,p´i,t1
q ´ Uippi,p´i,t1
q ą 0. To show it, note that
Uipp1
i,p´i,tq ´ Uippi,p´i,tq ą 0
ô p1
iDipp1
i,p´i,tq ´ CipDipp1
i,p´i,tq,tq ´ rpiDippi,p´i,tq ´ CipDippi,p´i,tq,tqs ą 0
ô p1
iDipp1
i,p´i,tq ´ piDippi,p´i,tq ą CipDipp1
i,p´i,tq,tq ´ CipDippi,p´i,tq,tq. (25)
Because Cipq1
,tq ´ Cipq,tq ď Cipq1
,t1
q ´ Cipq,t1
q for every q1
ą q by assumption (B2)
and Dipp1
i,p´i,tq ď Dippi,p´i,tq as p1
i ě pi, we have
CipDipp1
i,p´i,tq,tq ´ CipDippi,p´i,tq,tq ě CipDipp1
i,p´iq,t1
q ´ CipDippi,p´iq,t1
q.
Therefore, it follows from (25) that that
p1
iDipp1
i,p´i,tq ´ piDippi,p´i,tq ą CipDipp1
i,p´i,tq,t1
q ´ CipDippi,p´i,tq,t1
q,
which is equivalent to
Uipp1
i,p´i,t1
q ´ Uippi,p´i,t1
q ą 0,
as desired.
Next, consider the case in which (B1) holds while Cipq,tq is constant in t. Showing
the lower single-crossing of Ui in ppi,tq for this case is analogous to the proof of
Lemma S2 and hence omitted. □
Proof of Corollary 5. The existence of Nash equilibrium is a direct consequence of
SA.7Proposition 21
(i) and Lemma S2. The comparative statics result between the sets of
equilibria in Γptq and Γpt1
q follows directly from Proposition 21
(ii) and Lemma S3.
To prove the comparative statics result on the firm profit, suppose that Γptq and
Γpt1
q satisfy (B1) and (B21
) and consider any Nash equilibrium p1
“ pp1
iqiPI in Γpt1
q.
By Lemma S2, Lemma S3 and Proposition 21
(ii), there exists an equilibrium p˚
ď p1
in Γptq. Now, consider any firm i with c1
i “ ci.
First, suppose that p1
i ă ci. Then, it follows that Dipp1
,t1
q “ 0 because otherwise
Uipp1
,t1
q “ pp1
i´ciqDipp1
,t1
q ă 0 ď pmaxPi´ciqDipmaxPi,p1
´i,t1
q “ UipmaxPi,p1
´i,t1
q
because maxPi ě ci by assumption, contradicting the assumption that p1
is a Nash
equilibrium in Γpt1
q.31
This implies that Uipp1
,t1
q “ 0. Now, we will show that
Uipp˚
,tq “ 0. To show this, suppose for contradiction that Uipp˚
,tq ‰ 0. Because
p˚
is an equilibrium and maxPi ě ci, this implies that Dipp˚
,tq ą 0, p˚
i ą ci, and
Uipp˚
,tq ą 0. Hence, it follows that
0 ă Uipp˚
,tq
“ pp˚
i ´ ciqDipp˚
,tq
ď pp˚
i ´ ciqDipp˚
,t1
q
ď pp˚
i ´ ciqDipp˚
i ,p1
´i,t1
q
ď Uipp1
,t1
q,
where the first inequality is as established earlier, the equality is by the definition of
Ui, the second inequality follows from condition (B21
) and p˚
i ą ci, the third inequality
follows from p˚
ď p1
, condition (D1), and p˚
i ą ci, and the last inequality follows from
the assumption that p1
is a Nash equilibrium in Γpt1
q. Thus we obtain Uipp1
,t1
q ą 0,
a contradiction. Thus we have shown that Uipp˚
,tq “ 0 “ Uipp1
,t1
q.
Second, suppose that p1
i ě ci. Then, first note that, for any pi P Pi with pi ě ci,
Uippi,p´i,tq “ ppi ´ ciqDippi,p´i,tq is weakly increasing in p´i. Define Πipp´i,tq :“
maxpiPPi
Uippi,p´i,tq, and define Πipp´i,t1
q similarly. Note that the above mono-
tonicity of Ui for pi ě ci implies Πip¨,tq is weakly increasing and that for any p´i and
pi ě ci, ppi ´ ciqDippi,p´i,t1
q ě ppi ´ ciqDippi,p´i,tq and thus Πipp´i,t1
q ě Πipp´i,tq.
Therefore, it follows that for each i with c1
i “ ci, Πipp˚
´i,tq ď Πipp1
´i,tq ď Πipp1
´i,t1
q,
where the first inequality follows because p˚
ď p1
and Πip¨,tq is weakly increasing as
31
We denote Uipp,t1
q “ ppi ´ ciqDipp,t1
q for each i P I and p P P.
SA.8established earlier, and the second inequality follows because Πipp´i,t1
q ě Πipp´i,tq
for all p´i as established earlier as well.
The preceding two cases complete the proof. □
Finally, we demonstrate that the class of our generalized Bertrand games indeed
subsumes pure Bertrand games as special cases.
Lemma S4. A pure Bertrand game is a generalized Bertrand game.
Proof. It suffices to check (D2) since it is straightforward to check (D1). Fix any
pi ă p1
i,p´i ă p1
´i such that Dippi,p´iq ą 0. It must be that pi ď pm
´i :“ minj‰i pj.
There are two cases.
Consider first pi “ pm
´i. Then, Dipp1
i,p´iq “ 0 and Dippi,p1
´iq ą 0. Hence,
Dipp1
i,p´iq
Dippi,p´iq
“ 0 ď
Dipp1
i,p1
´iq
Dippi,p1
´iq
.
Consider next pi ă pm
´i, so Dippi,p´iq “ 1. By (D1), Dippi,p1
´iq “ 1. Hence,
Dipp1
i,p´iq
Dippi,p´iq
ď
Dipp1
i,p1
´iq
Dippi,p1
´iq
ô Dipp1
i,p´iq ď Dipp1
i,p1
´iq.
The latter inequality is a direct consequence of (D1). □
G Omitted Proof for Section 5
Proof of Lemma 2. We first establish the following claim that shows the Hausdorff
distance between Σi and Σ
µn
i
i goes to zero as n Ñ 8:
Claim 6. Fix any ϵ ą 0. For sufficiently large n, supσ1
iPΣi
inf
σ̃iPΣ
µn
i
i
dpσ̃i,σ1
iq ă ϵ.
Proof. Given any σ1
i P Σi, let σ̃i “ p1 ´ µn
i pSiqqσ1
i ` µn
i . Clearly, σ̃i P Σ
µn
i
i . Also,
dpσ̃i,σ1
iq “ sup
S1
iPSi
| ´ µn
i pSiqσ1
ipS1
iq ` µn
i pS1
iq| ď sup
S1PSi
µn
i pSiqσ1
ipS1
iq ` µn
i pS1
iq ď 2µn
i pSiq.
The proof is complete by choosing n sufficiently large so that µn
i pSiq ă ϵ
2
. □
Consider a perfect equilibrium σ of game G “ pI,Σ,ūq. Thus, there exists a
sequence σn
of Nash equilibrium of Gµn
that weakly converges to σ. Fix any i P I
SA.9and σ1
i P Σi and use Claim 6 to find a sequence σ̃n
i P Σ
µn
i
i such that dpσ̃n
i ,σ1
iq Ñ 0 so σ̃n
i
weakly converges to σ1
i. Since σn
is a Nash equilibrium of Gµn
, we have ūipσn
i ,σn
´iq ě
ūipσ̃n
i ,σn
´iq. Since ui is continuous, ūipσi,σ´iq ě ūipσ1
i,σ´iq by the weak convergence
of σn
and σ̃n
i to σ and σ1
i, respectively.32
Thus, σ is a Nash equilibrium of G as desired.
□
Lemma S5. If Si is a complete pseudo lattice, so is Σµ
i .
Proof. Thanks to Lemma 1 and Corollary 1, it suffices to show that Σµ
i is a compact
set with the largest and smallest elements and that the stochastic dominance order
on Σµ
i is closed under the weak topology on Σµ
i .
To first show the compactness, we prove that Σµ
i is closed. Consider any sequence
pσn
i qn in Σµ
i so that σn
i pS1
q ě µipS1
q,@n,@S1
P Si. Letting ľ1
denote the weak limit
of the sequence (which must exist since Σi is compact under the weak topology), we
must show σ1
ipS1
q ě µipS1
q,@S1
P Si. To show this, observe first that for any closed
set S̃ Ă Si,
σ1
ipS̃q ě limsup
n
σn
i pS̃q ě µipS̃q (26)
(by the weak convergence of pσn
i qn to σ1
i and Portmanteau theorem). Observe next
that every Borel measure σ1
i on Polish space Si is regular so that for any S1
P Si,
σ1
ipS1
q “ suptσ1
ipS̃q : S̃ Ă S1
and S̃ is compactu. (27)
Since every compact set S̃ is closed, we have σ1
ipS̃q ě µipS̃q by (26), which implies by
(27) that for any S1
Ă Si, σ1
ipS1
q ě µipS1
q.
The existence of smallest point σµ
i is proved by construction as follows: letting si
denote the smallest element of Si (which exists since Si is a complete pseudo lattice),
σµ
i pS1
iq :“
$
&
%
1 ´ µipSizS1
iq if si P S1
i
µipS1
iq otherwise.
To show that σi ěsd
σµ
i for any σi P Σµ
i , consider any upward closed set S1
i P Si. If
si P S1
i, then S1
i “ Si and thus σµ
i pS1
iq “ 1 “ σipS1
iq. Otherwise, σµ
i pS1
iq “ µipS1
iq ď
σipS1
iq, as desired. The largest point obtains analoguously.
32
Note that since Σi is endowed with the weak topology, ūip¨q remains continuous.
SA.10Lastly, the closedness of the stochastic dominance order follows immediately from
Fact 1. □
SA.11