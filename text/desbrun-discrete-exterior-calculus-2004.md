---
sha256: 11c0acb3b9194f9906428cd871fec6b24e5a9f8fa5fc1aa590bede36b188e11f
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 132737
---
arXiv:math-ph/0407005v1 4 Jul 2004
Preprint typeset in JHEP style - HYPER VERSION
Discrete Differential Geometry on causal graphs
Eric Forgy∗
Lincoln Laboratory
Massachusetts Institute of Technology
Lexington, MA 02420, U.S.A.
E-mail: Forgy@ll.mit.edu
Urs Schreiber
Universität Duisburg-Essen
Essen, 45117, Germany
E-mail: Urs.Schreiber@uni-essen.de
Abstract: Differential calculus on discrete spaces is studied in the manner of non-
commutative geometry by representing the differential calculus by an operator algebra on
a suitable Krein space. The discrete analogue of a (pseudo-)Riemannian metric is encoded
in a deformation of the inner product on that space, which is the crucial technique of this
paper. We study the general case but find that drastic and possibly vital simplifications
occur when the underlying lattice is topologically hypercubic, in which case we explicitly
construct mimetic analogues of the volume form, the Hodge star operator, and the Hodge
inner product for arbitrary discrete geometries.
It turns out that the formalism singles out a pseudo-Riemannian metric on topologically
hypercubic graphs with respect to which all edges are lightlike. We study such causal
graph complexes in detail and consider some of their possible physical applications, such
as lattice Yang-Mills theory and lattice fermions.
∗
The work by EF was not supported by MIT/LL.Contents
1. Introduction 2
2. Discrete differential calculus 5
## 2.1 Differential calculus 6
## 2.2 Discrete differential calculi 7
## 2.3 The set of edges and the graph operator. 9
## 2.4 Group structures 12
## 2.5 The dual approach: Paths, chains, and boundaries 14
## 2.6 Edges and adjoint edges. 20
## 2.7 Coordinate differentials 21
## 2.8 Component derivation 23
## 2.9 Example: Stochastic calculus. 26
## 2.10 The continuum limit 28
3. Inner product, integration, and metric 30
## 3.1 The vector space V(Ω(A)) and inner products on it. 30
## 3.2 Length, volume, and divergence 33
## 3.3 Volume form and Hodge duality 36
## 3.4 Cubic graphs 37
## 3.5 Metrics on cubic graphs 44
3.6 p-vector fields 47
3.7 p-chains and the boundary operator 48
4. Flat topologically hypercubic complexes 49
## 4.1 Partial derivative operator 50
## 4.2 Diamond complexes 54
## 4.3 Clifford algebra on diamond complexes 57
## 4.4 Non-commutative coordinates on diamond complexes 58
## 4.5 The 1 + 1 dimensional diamond complex. 61
5. Lattice Yang-Mills and fermions 66
## 5.1 Lattice Yang-Mills theory 66
## 5.2 Fermions 70
6. Summary and Outlook 75
A. Fermion doubling 76
– 1 –1. Introduction
Discrete differential geometry is a subject that has been and still is attracting attention
in mathematics [1, 2, 3], mathematical finance [4] and most notably in theoretical physics
[5, 6, 7], where lattice gauge theories [8] and discretized models of gravity, motivate the
search for a discrete analogue of the differential geometric nature of Yang-Mills theory
and General Relativity. While the adaption of differential forms and exterior derivation
to discrete spaces is well studied, a major stumbling block to a broad mimetic translation
of continuum differential geometry to discrete differential geometry has always been the
problem of how to carry over the metric aspects of differential geometry, encoded in notions
such as the Hodge inner product of forms hα|βi =
R
α∧⋆β, the Hodge star operator ⋆ and
the exterior coderivative.
The existence of the Hodge inner product is essential for all physical theories that are
not purely topological, and hence formulations of discrete differential geometry without a
suitable notion of Hodge inner products remain unsatisfactory.
There is, however, a certain ambiguity of what operation exactly one is willing to
address as Hodge duality in discrete geometry. As with most other objects known from
continuum exterior geometry, the transit to the discrete setting breaks some of their well
known properties while preserving others. The perhaps most instructive example of this is
the phenomenon that the existence of a nilpotent and graded-Leibnitz exterior derivative
implies that differential forms on discrete spaces do not in general commute with 0-forms [9].
Therefore, in this case, one has to choose between having a nilpotent and graded-Leinbnitz
exterior derivative and non-commuing differential forms or having differential forms which
commute with functions but no nilpotent and graded-Leibnitz exterior derivative. Of course
these choices will reflect the circumstances encountered in the projected application of the
discrete formalism and no choice may be generally “better” than the other.
On the other hand, the developments in Noncommutative Geometry [10, 11] have shown
that it proofs to be extremely fruitful to regard geometry in general from the point of view
of quantum physics [12], in the sense that all geometric objects are encoded in terms of
operators acting on certain graded inner product spaces. In many cases this perspective
fixes the above mentioned ambiguities to some extent. For instance, from the point of view
of Noncommutative Geometry the exterior derivative (being related to two Dirac operators
[12]) is supposed to be odd-graded and hence in particular must enjoy the graded Leibniz
property - which implies non-commuting differential forms. (This is reviewed in detail in
§2 (p.5).)
In the same sense, choices will have to be made about which properties of the Hodge
star are to be preserved in discrete differential geometry and which are allowed to break.
In particular, in this paper it is demonstrated that the familiar property
d†
= ± ⋆ d⋆−1
(1.1)
(by which ⋆ relates the exterior derivative d to the exterior coderivative d†) is (for general
discrete metric “tensors”, to be defined below) incompatible for instance with the relation
⋆−1 = ±⋆ known from the continuum.
– 2 –In this paper, discrete differential geometry is investigated from the point of view of
Noncommutative Geometry by equipping the vector space of discrete differential forms
with an inner product and representing d as an operator on the resulting inner product
space. This way a spectral triple for the discrete space with N = 2 Dirac operators is
obtained.
One of the main results of this paper is the general definition and explicit construction
of an operator ⋆ which does satisfy (1.1). (The abstract construction is in fact valid for all
types of generalized geometries seizable by the means of Noncommutative Geometry, but
only for discrete spaces is the explicit form of this ⋆ derived and spelled out here.) This
goes hand in hand with the construction of metric geometry on discrete spaces (cf. [2])
in terms of deformed inner products on the vector spaces which the geometric objects are
represented on as operators.
The main idea of the approach to discrete metric geometry and Hodge duality taken
here is briefly the following:
Let A be an associative algebra of functions. In the present case this will be the
(complex or group-valued) algebra of functions on a denumerable set of points
of a discrete space.
Over A one can consider differential calculi Ω(A,d) whose elements are gen-
erated by elements a ∈ A (taken to be of grade 0) and elements da (of grade
1), where d is a formal exterior derivative which satisfies d2 = 0 as well as the
graded Leibnitz rule. Elements of grade p in this algebra are the analogues of
differential p-forms.
As a substitute for the Hodge inner product hα|βi =
R
α ∧ ⋆β known from
the continuum, define on Ω(A,d)(regarded as a vector space) a non-degenerate
(sesquilinear) inner product h·|·i : Ω × Ω → I C.
The elements a ∈ A of the original algebra as well as d are represented on the
resulting inner product space H(Ω,h·|·i) as (multiplication and differentiation)
operators in the obvious way. Taking adjoints (·)† of these operators with
respect to h·|·i in particular yields d†, the analogue of the exterior coderivative.
The information about the metric geometry of the discrete space is encoded
in h·|·i and hence inherited by d†. The connection to the familiar formulation
of Noncommutative Geometry is obtained by noting that d ± d† are two odd-
graded Dirac operators on H, so that (A,H,d ± d†) is a spectral triple.
Assume for the moment that h·|·i is chosen in such a way that it describes a flat
discrete space in some sense (see §3 (p.30) for details). Then this space may
be equipped with discrete analogues of curved metrics by deforming the inner
product by means of any invertible, self-adjoint operator ĝ as
h·|·iĝ := h·|ĝ−1
|·i . (1.2)
In the special case of topologically hypercubic graphs we show in detail how the
operator ĝ encodes the metric tensor that would be obtained in the continuum
– 3 –limit. Not all possible deformation operators ĝ encode purely metric informa-
tion, though. Some choices correspond to switching on not gravitational but
dilaton and Kalb-Ramond fields (see below).
The approach outlined here a priori knows only about discrete analogues of
differential forms, not about vector fields. With a notion of metric in hand,
however, differential forms can be mapped to analoga of vector fields, even in
the discrete setup (see §3.6 (p.47)).
The formalism then allows to straightforwardly adapt many continuum notions
to the discrete setting, as for instance Lie derivatives: Let v♯ ∈ Ω1 be a discrete
1-form that is dual to a discrete vector v in the sense indicated above. The
usual formula (e.g. A.4 of [13])
Lv =
n
d,(v♯
)†
o
(1.3)
for the Lie derivative Lv along v is directly applicable to discrete spaces in the
framework presented here.
Now denote by ⋆ an operator on H satisfying (1.1) and define a volume-like form
to be an element |voli of Ω(A,d) that is of maximal grade and annihilated by
d†: d† |voli = 0.
With these definitions the following fact holds: Given the inner product space
H(Ω,h·|·i) we have
⋆ exists ⇔ |voli exists (1.4)
and they are related by
|voli = ⋆|1i (1.5)
and
⋆ |a0 da1 ···dapi = (a0 da1 ···dap)†
|voli . (1.6)
It follows in particular that ⋆ exists iff there is a solution |voli to the equation
hdα|voli = 0, ∀α ∈ Ω(A,d). In the case of discrete geometry on topologically
hypercubic graphs this condition can be solved explicitly for |voli. Equation
(1.6) then defines the Hodge star operator on these spaces.
This way a discrete Hodge star operator in the sense of (1.1) can be constructed for
general A, if it exists at all. In the special case where A is the algebra of functions on
topologically hypercubic graphs it is easy to show that it has the expected continuum limit.
The main virtue of formula (1.6) is that it tells us precisely how lattice shifts have to be
included in the naive discretization of the Hodge star in order that (1.1) remains true. The
details of this construction are given in §3 (p.30).
– 4 –It is easy to treat group-valued functions on the discrete space in the same spirit,
which allows to formulate lattice Yang-Mills field theory on arbitrary background geome-
tries. This is examined in §5 (p.66).
Besides this construction of the Hodge star operator, the approach to discrete differ-
ential geometry presented here has several interesting implications:
For instance one finds that a natural requirement on the anticommutator of elementary
edges with their adjoints that elements of A cannot be represented as self-adjoint operators
on H(A,d) unless the metric is flat and of Riemannian signature. Remarkably, the self-
adjoint part of the original function algebra with respect to a non-flat, non-Riemannian
inner product h·|·i turns out to be a noncommutative algebra even if A itself is commutative.
With respect to this fact it is interesting that on topologically hypercubic graphs there
is a preferred inner product h·|·i which renders all edges lightlike and induces a pseudo-
Riemannian metric on the discrete space. A notion of time hence appears naturally in this
framework.
This and other facts show that topologically hypercubic spaces with pseuo-Riemannian
signature (induced by h·|·i) with time flowing along the main diagonal of the hypercubes
are special. These spaces are called n-diamonds here (where n is the dimension) and receive
special attention. In particular using diamond complexes the preference of our formalism
for topologically hypercubic graphs is turned into a virtue, since these appear as the time
evolution of the simplicial complexes obtained by taking spatial sections of an n-diamond.
There are also close relations of the approach described here to the way of obtaining
target space background fields by means of deformations of superconformal field theories,
as described in [14, 15]. There the inner product on loop space is deformed in precisely the
same general manner as in the present paper and background fields such as gravity, dilaton
fields, Kalb-Ramond and gauge fields are encoded in the deformation operator.
It follows in particular that, on the discrete space, some backgrounds encoded by h·|·i
have no interpretation in terms of metrics (gravitation) on the discrete space but have to
be interpreted as representing the effect of dilaton and Kalb-Ramond fields.
The structure of this paper is as follows:
In §2 (p.5) we mainly review some elements of discrete differential geometry follwing
the work by Dimakis and Müller-Hoissen. §3 (p.30) adds the notion of inner product to this
formalism and discusses how deformations of a default inner product encodes the geometry
of the discrete space. Discrete flat Lorentzian geometries are found to play a special role
and are analyzed in detail in §4 (p.49). Finally §5 (p.66) discusses aspects of the application
of this formalism to lattice Yang-Mills theory and lattice fermions.
2. Discrete differential calculus
This section reviews mostly well known notions of discrete differential geometry.
– 5 –2.1 Differential calculus
If A is any associative (but not necessarily commutative) algebra (over I C) with unit 1,
then a differential calculus over A is a Z Z-graded associative algebra Ω(A) (over I C)
Ω(A) =
M
r≥0
Ωr
(A) , (2.1)
where Ωr(A) are A-bimodules (can be multiplied from the left and the right by elements
of A) and Ω0(A) = A, together with a I C-linear map
d : Ωr
(A) −→ Ωr+1
(A) , (2.2)
which is nilpotent and obeys the graded Leibniz rule:
d2
= 0
d(αβ) = (dα)β + (−1)r
(dβ) , α ∈ Ωr
(A),β ∈ Ω(A) . (2.3)
(We will furthermore exclusively consider differential algebras Ω(A) that are generated by
the elements of Ω0(A) and dΩ0(A).)
From these definitions it follows (using 1 · 1 = 1 and the Leibiz rule) that
d1 = 0, (2.4)
and that every element of Ωr(A) can be written as a linear combination of monomials
a0da1 da2 ···dar, on which d acts as
d(a0da1 da2 ···dar) = da0 da1 da2 ···dar . (2.5)
In general many of these terms will be equal to zero.
Elements of Ωr(A) are called r-forms and we will refer to d as the exterior deriva-
tive1. A differential calculus for which there is a natural number D such that Ωr(A) = (
0 r > D
6= 0 r ≤ D
will be said to have dimension D.
We will be thinking of Ω(A) as being represented on some vector space and write
Ω̂

Â

=
X
r≥0
Ω̂r

Â

(2.6)
for the respective graded operator algebra whose elements are of the form
X
r
a0,r [d,a1,r][d,a2,r]···[d,ar,r] for ai,j ∈ Â. (2.7)
In particular the algebra can be represented on itself, i.e. on the vector space
V(Ω(A,d)) = span({|ωi|ω ∈ Ω(A,d)}) (2.8)
1
Since for arbitrary A the elements of Ω1
(A) do not generate an exterior algebra, as will be discussed
below, this is slight abuse of language, which is however justified by the fact that we will mostly be interested
in cases where the 1-forms do anticommute.
– 6 –obtained by regarding Ω(A,d) as a vector space, by
d̂|ωi = |dωi
â|ωi = |aωi a ∈ A (2.9)
(this is discussed in more detail in §3 (p.30)). We will usually omit the “hats” ˆ · on the left
hand side.
The choice of any inner product h·|·i on this vector space defines an adjoint operation
(·)† : Ω̂ → Ω̂. In particular the adjoint d† of the original differential d is itself a nilpotent
differential operator. The total algebra of operators defined this way will be denoted as
Ω̂(2) A,d,d†

. It is Z Z-graded with
grad

Â

= 0
grad(d) = +1
grad

A†

= −grad(A) . (2.10)
The two operators
D± := d ± d†
(2.11)
are technically Dirac operators on V(Ω(A,d)). Since there are two of them and because
they square to the same Laplace operator
∆ := ±D2
± (2.12)
this defines an N = 2 differential calculus in the sense of [12, 16].
## 2.2 Discrete differential calculi
So consider a denumerable set
G = {gi|i ∈ I ⊂ IN} (2.13)
and let A be the (commutative) algebra of I C-valued functions over G:
A ∋ f : G → I C
gi 7→ f(gi) . (2.14)
This algebra is generated by the set of discrete delta-functions
δ{i} : δ{i}(gj) = δij , i,j ∈ IN, (2.15)
where δij is the usual Kronecker symbol. From the properties δ{i}δ{j} = δij δ{i} and
P
i∈I
δ{i} = 1 the trivial but important identities
δ{i} dδ{j} = −(dδ{i})δ{j} + δij dδ{i} (2.16)
X
i∈I
dδ{i} = 0 (2.17)
– 7 –follow by using (2.3) and (2.4).2 In terms of these discrete delta-functions Ωr(A) may be
spanned by the elements3
δ{i1i2···ir} :=
(
δ{i1}dδ{i2}dδ{i3} ···dδ{ir} for i1 6= i2 ,i2 6= i3 ···ir−1 6= ir
0 otherwise
)
. (2.19)
Note that by (2.16)
δ{i1i2···ir} = δ{i1}δ{i1i2···ir}δ{i2}
= δ{i1}dδ{i2}dδ{i3} ···dδ{ir}δ{ir} . (2.20)
Therefore all these objects can be obtained by concatenation of δ{ij}:
δ{i1i2···ir} = δ{i1i2} δ{i2i3} ···δ{ir−1ir} . (2.21)
This makes it easy to check that4
dδ{i1i2···ir} =
X
j∈I
δ{j i1i2···ir} − δ{i1 j i2···ir} + ··· + (−1)r
δ{i1i2···ir j}

. (2.24)
All this shows that the δ{i1···ir} are related to the connectivity of the discrete space. In
particular the non-vanishing δ{ij} correspond to edges connection vertices gi and g2 and
therefore induce the structure of an oriented graph on the set G. This is further elaborated
on below.
Different differential calculi on the set G are obtained from the “universal” one, for
which all the δ{ij} ,i 6= j are non-vanishing, by eliminiting some of the corresponding edges.
2
Note that the order of the factors is important, since Ω(A) need not be commutative, even if A is.
3
These do not in general constitute a basis. That they really span the entire algebra can be seen by
noting that δ{i}dδ{i} is linearly dependent,
X
j∈I
δ{ij} = δ{i}
X
j∈I ,j6=i
dδ{j}
(2.17)
= −δ{i}dδ{i} , (2.18)
and by taking into account (2.21) and (??) below.
4
One checks for r = 1 that
X
j6=i
δ{j}dδ{i} − δ{i}dδ{j}
 (2.17)
= (1 − δ{i})dδ{i} − δ{i}(−dδ{i}) = dδ{i} . (2.22)
The result for all r follows by induction:
dδ{i1···ir} = dδ{i1} ···dδ{ir−1}dδ{ir}
hypothesis
=
X
j∈I

δ{j i1i2···ir−1} − δ{i1 j i2···ir−1} + ··· + (−1)r−1
δ{i1i2···ir−n j}
 X
k6=ir
δ{kir} − δ{irk}

| {z }
(2.23)
= dδ{ir}
(??)
=
X
j∈I

δ{j i1i2···ir} − δ{i1 j i2···ir} + ··· + (−1)r−1
δ{i1i2···ir−n j,ir} + (−1)r
δ{i1i2···ir−nir j}

. (2.23)
– 8 –2.3 The set of edges and the graph operator.
The interconnection structure of the graph is completely encoded in the operator d. This
can be made manifest by noting that the sum of all edges of the graph
G :=
X
i,j∈G
δ{i,j} (2.25)
acts like d when commuted with 0-forms:

G,δ{i}

=
X
j∈G
δ{j,i} − δ{i,j}

(2.24)
= dδ{i} . (2.26)
It follows that (cf. (2.5))
d(a0da1 da2 ···dar) = [G,a0] da1 da2 ···dar , (2.27)
which shows that the set of edges of the graph completely determines the set of p-forms
with p > 1.
It should be noted, however, that Gp (which is the sum of all “microscopic” p-forms
of the differential calculus: Gp =
P
i0,i1,···,ip∈I
δ{i0,i1,···,ip}) does not in general vanish. But for
a large class of “nice” graphs it does:
Definition. We say that a graph has no intermediate edges iff
δ{i,j} 6= 0 ⇒ δ{i,k,j} = 0 ∀ i,j,k ∈ I (2.28)
and that it has no opposite edges iff
δ{i,j,i} = 0 ∀ i,j ∈ I , (2.29)
or equivalently iff
δ{i,j} 6= 0 ⇒ δ{j,i} = 0 ∀ i,j ∈ I . (2.30)
Theorem: On graphs without intermediate edges5
dω = [G,ω]ι ∀ ω ∈ Ω(A) . (2.31)
Proof: This immediately follows from the general formula (2.24).6 ✷
This gives rise to some useful corollaries:
5
The bracket [·,·]ι is the supercommutator with respect to the grading ι.
6
Alternatively we can argue as follows:
First note that in the absence of intermediate edges we have
δ{i,j} 6= 0 ⇒ δ{i} G dδ{~ j} = −δ{i}dδ{~ j} G = −
X
k∈I
δ{ijk} , (2.32)
– 9 –Corollary I: On graphs without intermediate edges

G2
,ω

ι
= 0 ∀ ω ∈ Ω(A) . (2.36)
Proof: This follows from
0 = ddω
(2.31)
= [G,[G,ω]ι]ι
= [[G,G]ι,ω]ι − [G,[G,ω]ι]ι . (2.37)
✷
Corollary II: On graphs without intermediate edges
X
k∈I
δ{i,k,j} = 0 ∀ i 6= j ∈ I (2.38)
and
G2
=
X
i,j∈I
δ{i,j,i} . (2.39)
Proof: Let i 6= j ∈ I. Then
0
(2.36)
= δ{i}

G2
,δ{j}

=
X
k∈I
δ{i,k,j} . (2.40)
because the left hand side can be rewritten as
δ{i} G dδ{~ j}
(2.25)(2.24)
=
X
l6=i
k6=j
δ{i,l} δ{k,j} − δ{j,k}

= −
X
k∈I
δ{ijk} , (2.33)
where in the last step it has been used that the absence of intermediate edges implies δ{i,k,j} = 0.
Now we use induction on the grade grad(ω) of ω. For grad(ω) = 0 (2.31) is the same as (2.27). For
grad(ω) = 1 we have
d δ{i}dδ{j}
 (2.27)
=

G,δ{i}

dδ{j}
= G δ{i} dδ{j} − δ{i} G dδ{j}
(2.32)
= G δ{i} dδ{j} + δ{i} dδ{j} G
=

G,δ{i,j}

ι
. (2.34)
The graded Leibniz rule now allows to extend this to higher grades: Let λ be any 1-form, then
d(λω) = (dλ)ω − λ(dω)
= [G,λ]ι ω − λ[G,ω]ι
= [G,λω]ι . (2.35)
– 10 –P
= 0
δ{i,j,k} = 0
= 0
δ{i} δ{j} δ{k}
δ{i,j} δ{j,k}
Figure 1: Graph and complex.
✷
In words this means that on graphs without intermediate edges the sum of all “paths
of edges” δ{i,k,j} that connect the same two points has to vanish. So in particular if there
is only one such path from i to j then the corresponding 2-form δ{i,k,j} is not an element
of the calculus. If there are precisely two paths of two edges connecting two nodes i and j
then one is −1 times the other.
Figure 1 shows a discrete space consisting of nine nodes. Its edges are indicated by
thin arrows. In this particular example there are no intermediate edges and no opposite
edges in the sense of (2.28) and (2.29). Four selected 2-forms are indicated by bold arrows.
Two of them vanish, because they are the unique connection between their endpoints. The
two 2-forms in the upper right quadrant are each non-vanishing and sum to zero.
Figure 2: Similar graphs with different dimension
Figure 2 demonstrates the effect of G on the dimension of the discrete space: Again
according to (2.38) the complex on the left contains two non-vanishing 2-forms, but no
– 11 –3-form, and is therefore 2-dimensional, while the complex on the right contains 1-forms,
but not a single 2-form. It is therefore 1-dimensional.
Corollary III: On graphs without intermediate edges for which
X
j∈I
δ{i,j,i} = 0 ∀ i ∈ I (2.41)
we have
G2
= 0. (2.42)
This implies in particular that on graphs without intermediate edges and without opposite
edges
G2
= 0. (2.43)
This corollary requires a remark: When G2 = 0 and Ω(A) is regarded as an operator
algebra Ω̂

Â

, as discussed in §2.1 (p.6), then
[d,ω]ι = [G,ω]ι
d2
= 0 = G2
(2.44)
might seem to indicate that d and G are in fact the same object. This however, is not
true, as becomes apparent when the vector space on which these operators act is explicitly
constructed in §3.1 (p.30): d annihilates the “vacuum” |1i while G creates a 1-form. Also
d has a continuum limit, while G does not (cf. the discussion concerning (2.106)).
Corollary IV: On graphs without intermediate edges
X
k∈I
δ{i,k,i}δ{i,j} = 0
δ{i,j}
X
k∈I
δ{j,k,j} = 0 ∀ i,j ∈ I . (2.45)
## 2.4 Group structures
In order to get a handle on the interconnectedness of the points gi ∈ G of the discrete
space it is helpful to consider some additional structure: In the standard application one is
studying fields on a lattice structure, thus having a notion of translation along the lattice
vectors. Since this amounts to making use of the additive group structure of the lattice it is
sufficient to assume more generally that the set G is equipped with a group multiplication
gigj = gk ,i,j,k ∈ I, which allows to “go from gi in the direction gj and arrive at gk” on
the discrete space.
A brief introduction to differential calculus on discrete groups can be found in §4.1 of
[9]. A detailed discussion is given in the series of papers [17, 1].
– 12 –The left and the right action of the group on functions of its elements will be denoted
by
(Rgf) g′

:= f g′
g

(Lgf) g′

:= f gg′

. (2.46)
Every group element gives rise to the two 1-forms
θg
L :=
X
g′∈G
δ{g′}dδ{g′g}
θg
R :=
X
g′∈G
δ{g′}dδ{gg′} , (2.47)
which are obviously left (right) invariant:
Rg′θg
R = 0
Lg′θg
L = 0. (2.48)
They are related to the “simplex-forms” (2.19) by7
δ{g1,g2,···gr} = δ{g1}θ
g−1
1 g2
L θ
g−1
2 g3
L ···θ
g−1
r−1gr
L
= δ{g1}θ
g2g−1
1
R θ
g3g−1
2
R ···θ
grg−1
r−1
R . (2.49)
The θg are useful, because in terms of them the exterior derivative has the suggestive
action8
df =
X
g6=e
((Rg − 1)f)θg
L =
X
g6=e
((Lg − 1)f)θg′
R (2.54)
7
This is readily seen to be true for r = 2. For general r it follows using (2.21).
8
We have
df =
X
h
f(h)dδ{h}
(2.17)
=
X
h∈G,g6=e
f(h)

δ{hg−1
}dδ{h} − δ{h}dδ{hg}

=
X
h∈G,g6=e
f(h)

δ{g−1h}dδ{h} − δ{h}dδ{gh}

=
X
g6=e
((Rg − 1)f)θg
L =
X
g6=e
((Lg − 1)f)θg
R . (2.50)
Alternatively we can use the identities
dδ{g} =
X
g′∈G
δ{gg′−1}θg′
L
=
X
g′∈G
δ{g′−1g}θg′
R (2.51)
and
X
g6=e
θg
L =
X
g′∈G
δ{g′}
X
g6=e
dδ{g′g}
(2.17)
= −
X
g′∈G
δ{g′}dδ{g′}
= −θe
L (2.52)
– 13 –on functions f ∈ Ω0(A).
dθg
L =
X
g′
θg′
L θgg′−1
L (2.55)
A further interesting property of the forms θg (and indeed of the discrete calculus as a
whole) is that they do not commute with functions, but instead induce translations on
them:
fθg
L = θg
L(Rgf)
fθg
R = θg
R(Lgf), g 6= e. (2.56)
Different differential calculi on the set G are obtained from the “universal” one, for
which all the δ{ij} ,i 6= j are non-vanishing, by eliminiting some of the corresponding edges.
In the case where G has a group structure this leads to the concept of a Cayley graph
or group lattice (G,T), which is defined by the condition that between any two elements
g, g′ of G there is an oriented edge g → g′ (equivalently: a non-vanishing 1-form δ{g,g′})
precisely if g−1g′ ∈ T, where T ⊂ G is a subset not containing the identity, e 6∈ T. Thus T
is a discrete analogue of the tangent space at a point of the discrete space.
## 2.5 The dual approach: Paths, chains, and boundaries
The previous sections concerned the discretization of the calculus of differential forms.
Integrals of differential forms are cochains, the dual elements to chains. In §3 (p.30) it is
shown how cochains, chains, and their pairing is recovered from within the the differential
operator calculus. Alternatively chains may be introduces axiomatically and the differential
calculus on their dual space be obatined as a derived entity. This is sketched in the
following:
The starting point is of course again the denumerable set (2.13) G = {gi|i ∈ I ⊂ IN}
of discrete nodes (points) of the discrete space.
This is given the structure of a graph by defining the vector space P1 over the set of
edges, or 1-paths, which contains an element |i,ji if there is supposed to be a directed edge
from node gi to node gj.
and write
df =
X
g
f(g)dδ{g}
(2.51)
=
X
g,g′
f(g)δ{gg′−1
}θg′
L =
X
g,g′
f(g)δ{g′−1g}θg′
R
=
X
g,g′
f gg′
δ{g}θg′
L =
X
g,g′
f g′
g

δ{g}θg′
R
=
X
g′
(Rg′f)θg′
L =
X
g
(Lg′ f)θg′
R
=
X
g6=e
((Rg − 1)f)θg
L =
X
g6=e
((Lg − 1)f)θg′
R . (2.53)
– 14 –Now let a p-path be the concatenation of p edges,
Pp := span({|i1,i2,···,ipi||in,in+1i ∈ P1}) for p > 1, (2.57)
and let P0 be the vector space over the set of 0-paths:
P0 := span({|ii|gi ∈ G}) . (2.58)
For convenience we set
|···,in,in+1,···i = 0 ⇔ |in,in+1i 6∈ P1 . (2.59)
On the space
P :=
∞ M
p=0
Pp (2.60)
of all paths there is an associative, non-commutative and IR-linear product operation
⌣: P × P → P (2.61)
which concatenates paths that fit together:
|i1,···,ipi ⌣ |j1,···,jqi :=
(
|i1,···,ip,j2 ···,jqi if ip = j1
0 otherwise
(2.62)
(and linearly extended to all of P), called the cup product.
We want to identify such paths that can be associated with p-dimensional cells of the
graph, thus turning the graph into a cell complex. A chain (of cells) shall be something
which has a boundary (being another chain), such that a boundary does not have any
non-vanishing boundary itself.
In order to model something of this sort on the space of paths first consider the
universal case where all possible 1-paths |i,ji ,i,j ∈ I are non- vanishing. In this case the
boundary operator
∂ : P → P (2.63)
defined by extending the relation
∂ |i1,i2,···,ipi := |i2,i3,···,ipi − |i1,i3,···,ipi··· − (−1)p
|i1,i3,···,ip−1i (2.64)
linearly to all of P is obviously nilpotent:
∂2
= 0. (2.65)
The tuple
Ω∗
(P0,∂) (2.66)
– 15 –could be called a “dual differential calculus” over P0 and the case where all possible paths
are non-vanishing would be the universal dual differential calculus.
But recall from (2.59) that not all elements in the sum (2.64) need to be non-vanishing.
(The only ones that are guaranteed to be non-vanishing are the first and the last term in
the sum.) In such cases ∂ won’t be a nilpotent operator on P. In order for ∂ still to act as
a boundary operator one therefore needs to restrict it to the subspace C of P on which it
happens to be nilpotent: This C is the space of chains:
C :=
M
p
Cp
Cp := ker (∂2
)|Pp

. (2.67)
The cup product (2.62) obviously does not respect C. It can be turned into a proper
product on C simply by projection onto C:
· : C → C
Sp · Tq 7→
p!q!
pq
PC(S ⌣ T) . (2.68)
(Here PC : P → P is the projector onto C.)
The space C∗ dual to the space of (p-)chains is that of (p-)cochains:
C∗
=
M
p
C∗p
:= {hω| : C → IR,| hω|(|Si) = hω|Si , S ∈ C} . (2.69)
Any operator A : C → C defines an operator At : C∗ → C∗, called the transpose of A by
At
ω|S := hω|ASi . (2.70)
The transpose of the boundary operator
d := ∂t
(2.71)
is called the cobaundary operator. It is obviously nilpotent
d2
= 0. (2.72)
We will now show that it indeed induces a differential calculus on C∗:
For the elements dual to 0-paths write
δ{i}|j := hi|ji
:= δij (2.73)
and for those dual to 1-paths similarly
δ{ii′}|j′
j := ii′
|j′
j
:= δi,jδi′,j′ . (2.74)
– 16 –From
X
i∈I
dδ{i}|ij =
X
i∈I
hδ{i}|∂ |jki
= 0 (2.75)
it follows that
X
i∈I
dδ{i} = 0. (2.76)
Furthermore
dδ{k}|ij = hδ{k}|∂ |iji
= δ{k}|i − δ{k}|j
= δki − δkj (2.77)
implies that
dδ{k} =
X
j∈I
j6=k
δ{jk} − δ{jk} . (2.78)
Now for hα| any element of C∗ we define the products α · δ{i} and δ{i} · α by
α · δ{i}|S := hα|i · Si
δ{i} · α|S := hα|S · ii . (2.79)
In particular this implies
δ{i} · δ{j} = δi,jδ{i} . (2.80)
Furthermore it follows from (2.78) that
δ{ij} = −(dδ{i}) · δ{j}
= δ{i} · (dδ{j}) (2.81)
and that
(dδ{i}) · δ{i} =
X
j6=i
δ{ji}
δ{i} · (dδ{i}) = −
X
j6=i
δ{ij} (2.82)
which together gives the Leibniz rule on 0-cochains:
d(δ{i} · δ{j}) = (dδ{i}) · δ{j} + δ{i} · (dδ{j}). (2.83)
– 17 –Dual paths. The objects
δ{i1,i2,···ip} := δ{i1} · d δ{i2} · d δ{i2} · d ···δ{ip}

, i1 6= i2 ,i2 6= i3,··· (2.84)
constitute, up to a sign, the dual basis to the path basis, because
δ{i1,···ip}|i′
p ···i′
1 = −(−1)p(p+1)/2
δi1,i′
1
···δip,i′
p
. (2.85)
Proof: We use induction over p. For p = 1
δ{i}|i′
= δi,i′ (2.86)
by definition (2.73). Then
δ{i1} · dδ{i2,···,ip}

|(i′
p ···i′
2i′
1)
(2.79)
= δi1,i′
1
dδ{i2,···,ip}|(i′
p ···i′
2i′
1)
(2.64)
= δi1,i′
1
δ{i2,···,ip}|(i′
p−1 ···i′
2i1) − (i′
p,i′
p−2 ···i′
2i1) − (−1)p
(i′
p ···i′
2)
i16=i2
= −(−1)p
δi1,i′
1
δ{i2,···,ip}|ip,···,i2
hypothesis
= −(−1)p
δi1,i′
1
(−1)p−1
δi2,i′
2
δ{i3,···,ip}|ip,···,i3
= ···
= −(−1)p(p+1)/2
δi1,i′
1
···δip,i′
p
. (2.87)
✷
Coboundary of dual paths. It follows that
dδ{i1,i2,···,ip} =
X
j∈I
δ{j,i1,···,ip} − δ{i1,j,i2,···,ip} + ··· + (−1)p
δ{i1,i2,···,ip,j}

. (2.88)
Proof: By shifting d over to the other side
dδ{i1,···ip}|jp+1,···,j1 = δ{i1,···ip} ∂ |jp+1,···,j1i
= δ{i1,···ip}|jp,···,j1 − δ{i1,···ip}|jp+1,jp−1 ···,j1 ··· − (−1)p
δ{i1,···ip}|jp+1,···,j2
= ··· − (−1)(p+1+1)(p+1)/2
δip,jp+1 ···δi1,j2 (2.89)
one obtains the same result as from (2.88). ✷
Next we again define the product of two dual paths by
δ{i1,···,ip} · δ{j1,···,jq} := δip,j2δ{i1,···,ip,j2,···,jq} . (2.90)
It follows from (2.88) that d is graded-Leibniz on the resulting algebra:
d( δ{i1,···,ip}δ{j1,···,jq}

) = dδ{i1,···,ip}

δ{j1,···,jq} + (−1)p
δ{i1,···,ip}(dδ{j1,···,jq}). (2.91)
Identifying C∗0 with A and the “·”-product with the implicit algebra product in §2.2
(p.7) one thus finds that indeed
C∗
≃ Ω(A,d) (2.92)
is a differential calculus over A.
– 18 –Simplices. Ordinarily the study of discrete geometry is concerned with simplices. The
space P of paths that has been introduced above, together with the boundary map ∂,
actually provides a generalization which contains simplicial geometry as a subcase.
Definition: Any 0-path |i1i is a 0-simplex. A p-simplex is a (p+1)-path |i1,···,ip+1i
such that every sub-path |i1,···,in−1,in+1,···,ip+1i is non-vanishing and a simplex itself.
In other words a simplex is a path all whose nodes are pairwise connected by 1-paths.
Let
S =
M
p=0,1,2,···
Sp (2.93)
be the vector space of simplices, then obviously the boundary operator ∂ is nilpotent on S
∂2
S = 0. (2.94)
While simplices feature prominently in the literature on discrete spaces, it is somewhat
remarkable that the discrete differential calculus over them lacks many of the nice features
that we will find for discrete differential calculus on cubic complexes.
Most notably, at any given node of a simplicial complex there will be more than D
independent 1-forms. As discussed in §2.10 (p.28) this brings with it certain problems with
the continuum limit of this differential calculus.9
A way out of this problem was suggested in [18]. In the approach suggested there
one essentially defines discrete differential calculi on D-dimensional spaces consisting of
single D-simplices. Since a p-simplex has p edges originating at every node this removes
the problem of the surplus edges, but of course at the cost that now the different simplices
have to be “glued together” again by methods that essentially lie outside those of differential
calculus, e.g. by averaging functions over those nodes which should be idenified.
As an example consider a 1-dimensional simplicial complex consisting of two 1-simplices
as in figure 3. Let
f := f(A)δ{A} + f(B) δ{B′} + δ{B′′}

+ f(C)δ{C} (2.95)
be a function on this space, regarded as the disjoint union of two 1-simplices. The “gluing”
A B′ B′′ C
Figure 3: A “glued” 1-complex
of these two 1-simplices is achieved by restricting attention to such functions which take
the same value at the two different nodes B′ and B′′.
9
See [7] for an example of how the presence of more than D independent 1-forms leads to problems.
– 19 –Now compute the action of the lattice Laplace operator on this function
d†
df = d†
(f(A) − f(B)) δ{B′A} − δ{AB′}

+ (f(B) − f(C)) δ{CB′′} − δ{B′′C}

(2.96)
But even differential calculus on a single D-simplex has undesireable features. For
instance volume forms in the sense of §3.3 (p.36) don’t exist (except for D = 1) .
## 2.6 Edges and adjoint edges.
Ordinary continuous manifolds are handled by mapping them locally, by introduction of
coordinate functions, to IRD
and then working on this convenient space. Similarly a discrete
space can be mapped locally to a rectangular lattice Z ZD
. Here the abelian group structure
can be used to induce a notion of translation along coordinate lines on the former discrete
space.
On Z ZD
we naturally label the points of the discrete space by vectors ~ x = [x0,x1,···,xD−1]T ∈
Z ZD
. The coordinate functions then read
Xµ
= ǫ
X
~ x
xµ
δ{~ x} . (2.97)
The real number ǫ is something like the lattice spacing as measured in these coordinates.
Even though it is more or less arbitrary and could in principle be set to unity, we’ll keep
it around as a convenient label for those terms that will vanish in the continuum limit,
as for instance in formula (2.112) below. In the expression (2.97) it serves the purpose of
accounting for the fact that ∆xµ ≥ 1, so that without letting ǫ → 0 as the number of nodes
is increased in the continuum limit the coordinate difference Xµ(i) − Xµ(j) between any
two nodes would grow without bounds.
We consider the special case where from each point ~ x of the discrete space there
originate precisely D edges ea which as vectors in Z ZD
have components
~ ea(~ x) := [ea
0
(~ x),ea
1
(~ x),···,ea
D−1
(~ x)]T
a ∈ {0,···,D − 1} . (2.98)
In other words we set
G =
X
~ x,a
δ{~ x,~ x+~ ea(~ x)} (2.99)
and equivalently
G†
=
X
~ x,a
δ†
{~ x+~ ea(~ x),~ x} , (2.100)
where
δ†
{~ x+~ ea(~ x),~ x} := δ{~ x,~ x+~ ea(~ x)}
†
(2.101)
are the adjoint edges. Because of
δ{~ x,~ x+~ ea(~ x)} = δ{~ x}

d,δ{~ x+~ ea(~ x)}

= δ{~ x} ◦ d ◦ δ{~ x+~ ea(~ x)} , (2.102)
– 20 –where “◦” is the implicit operator product which we write here for clarity, we have10
δ†
{~ x+~ ea(~ x)} = δ{~ x+~ ea(~ x)} ◦ d†
◦ δ{~ x}
= δ{~ x+~ ea(~ x)}
h
d†
,δ{~ x}
i
. (2.103)
The resulting graph typically looks as shown in figure 4: The little circles represent the
X1
X0
0
ǫ
2ǫ
0 ǫ 2ǫ 3ǫ
δ~ x1
δ~ x2
δ{~ x2,~ x2+~ e1(~ x2)} δ†
{~ x2+~ e1(~ x2),~ x2,}
δ{~ x2,~ x2+~ e0(~ x2)} δ†
{~ x2+~ e0(~ x2),~ x2}
δ{~ x2+~ e1(~ x2)}
δ{~ x2+~ e0(~ x2)}
Figure 4: Edges and adjoint edges on a coordinate patch
nodes of the graph and are labelled by the discrete δ-functions which are supported at a
given node. For clarity only the edges originating at node ~ x1 = ǫ
1
1

and those originating
at ~ x2 = ǫ
1
3

have been drawn, together with the corresponding adjoint edges, which are
characterized by their open arrow heads. The ~ ea at these two points have been chosen
arbitrarily.
We will frequently need the “macroscopic” 1-forms
e†a
:= ǫ
X
~ x
δ{~ x,~ x+~ ea(~ x)}
ea
:= (e†a
)†
= ǫ
X
~ x
δ†
{~ x+~ ea(~ x),~ x} . (2.104)
(Note that these differ from the objects (2.47) in that here the ~ ea are functions of ~ x.)
## 2.7 Coordinate differentials
In terms of the “microscopic” edges the coordinate differentials can be written as
dXµ
=
X
~ x
ǫxµ
dδ{~ x}
10
Note that δ†
{~ x} = δ{~ x}. Later we will consider modified adjoint relations whch do not enjoy this property.
– 21 –(2.50)
=
X
~ x,a
ǫxµ
δ{~ x−~ ea(~ x)}dδ{~ x} − δ{~ x}dδ{~ x+~ ea(~ x)}

=
X
~ x,a
ǫea
µ
(~ x)δ{~ x}dδ{~ x+~ ea}
= ea
µ
e†a
. (2.105)
(Unless indicated otherwise we are using implicit summation on repeated indices.)
(This formula is the reason why a factor ǫ has been included in the definition (2.104).
Since dXµ is an object with a well behave continuum limit the objects e†a
must have a
continuum limit, too. Incidentally we have
G =
1
ǫ
X
a
e†a
. (2.106)
This implies that G itself is not well defined for ǫ → 0, which makes sense, since of course
in the continuum theory there is no 1-form with the same anticommutators as d.)
By taking adjoints we similarly obtain
d†
Xµ
= −
X
~ x,a
ǫea
µ
(~ x)δ{~ x+~ ea(~ x)}d†
δ{~ x}
= ea
ea
µ
(2.107)
with
ea
:=
X
~ x
ǫδ{~ x+~ ea}d†
δ{~ x} . (2.108)
It follows that at a given point the coordinate forms are related to the “microscopic forms”
by
δ{~ x}dXµ
=
X
a
ǫea
µ
(~ x)δ{~ x}dδ{~ x+~ ea} . (2.109)
Assuming that the matrix ea
µ(~ x) is invertible with inverse eµ
a(~ x), i.e. ea
µ(~ x)eµ
b(~ x) = δb
a,
this relation may be inverted:
δ{~ x}dδ{~ x+~ ea} =
1
ǫ
eµ
a
(~ x)δ{~ x}dXµ
. (2.110)
Using this and the local commutation relation

Xµ
,δ{~ x,~ x+~ ea}

= −ǫea
µ
(~ x)δ{~ x,~ x+~ ea}
h
Xµ
,δ†
{~ x+~ ea,~ x}
i
= +ǫea
µ
(~ x)δ†
{~ x+~ ea,~ x} (2.111)
we find for the commutator of a coordinate form with a coordinate function the expression
[Xµ
,dXν
] =

Xµ
,
X
~ x,a
ǫea
ν
(~ x)δ{~ x}dδ{~ x+~ ea}


– 22 –= −
X
~ x,a
ǫ2
ea
µ
(~ x)ea
ν
(~ x)δ{~ x}dδ{~ x+~ ea}
(2.110)
= −
X
~ x,a
ǫea
µ
(~ x)ea
ν
(~ x)eλ
a
(~ x)δ{~ x}dXλ
:= ǫCµν
λdXλ
. (2.112)
In the last line we have identified the “structure functions” as
Cµν
λ := −
X
a
ea
µ
ea
ν
eλ
a
. (2.113)
By acting with d on both sides of the above equation one obtains
{dXµ
,dXν
} = ǫdCµν
λ dXλ
. (2.114)
Taking the adjoint of everything yields analogously
h
Xµ
,d†
Xν
i
= −ǫ

d†
Xλ

Cµν
λ (2.115)
and
{dXµ
,dXν
} = ǫd†
Xλ
d†
Cµν
λ . (2.116)
To conform with the conventions in the continuum case we introduce for the coordinate
differentials the notation
ĉ†µ
= [d,Xµ
]
ĉµ
= −
h
d†
,Xµ
i
. (2.117)
## 2.8 Component derivation
The 1-form df (for f any element of Ω0) can be written as
df := (
←
∂µf)dXµ
= (dXµ
)(
→
∂µf). (2.118)
One finds (see [4]) that, while the objects
←
∂ and
→
∂ satisfy
←
∂µXν
= δν
µ
→
∂µXν
= δν
µ (2.119)
they don’t quite act like true partial derivatives because their product rule receives a lattice
correction:11
←
∂λ(fg) = (
←
∂λf)g + f(
←
∂g) − ǫ(
←
∂f)(
←
∂g)Cµν
λ . (2.121)
11
As shown in [4] one has
d(fg)
(2.3)
= (df)g + f(dg)
(2.118)
= (
←
∂λf)dXλ
g + f(
←
∂λg)dXλ
– 23 –Component derivative in preferred coordinates. With respect to the preferred co-
ordinates that satisfy dXµ = e†(a=µ)
(these exist globally on the cubic graphs discussed in
§3.4 (p.37)) the
←
∂µ and
→
∂µ objects have a simple expression in terms of finite differences
(assume ~ ea = const for notational convenience):
df = d
X
~ x
f(~ x)δ{~ x}
=
X
~ x
f(~ x)dδ{~ x}
=
X
a
X
~ x
f(~ x) δ{~ x−~ ea,~ x} − δ{~ x,~ x+~ ea}

=
X
a
T−~ ea[f] − f
ǫ
dXa
=
X
a
dXa f − T~ ea
[f]
ǫ
, (2.122)
where T is the translation operator acting as
T~ y[f](~ x) := f(~ x − ~ y) . (2.123)
Therefore
(
←
∂af)(~ x) =
f(~ x +~ ea) − f(~ x)
ǫ
(2.124)
is the forward finite difference quotient and
(
→
∂af)(~ x) =
f(~ x) − f(~ x −~ ea)
ǫ
(2.125)
the backward finite difference quotient of the function f with respect to ~ ea.
Note that all forward and backward differences mutually commute:12
←
∂a
←
∂bf =
←
∂b
←
∂af
→
∂a
→
∂bf =
→
∂b
→
∂af
←
∂a
→
∂bf =
→
∂b
←
∂af . (2.130)
= (
←
∂λf)







g dXλ
+
h
dXλ
,g
i
| {z }
=[dg,Xλ]=(
←
∂νg)[dXν,Xλ]







+ f(
←
∂λg)dXλ
=

(
←
∂λf)g + f(
←
∂λg)

dXλ
− ǫ(
←
∂λf)(
←
∂νg)Cνλ
µdXµ
=

(
←
∂λf)g + f(
←
∂λg) − ǫ(
←
∂µf)(
←
∂νg)Cµν
λ

dXλ
=
←
∂λ(fg)dXλ
. (2.120)
12
←
∂a
←
∂bf(~ x) =
←
∂a (f(~ x +~ eb) − f(~ x))
= f(~ x +~ ea +~ eb) − f(~ x +~ ea) − f(~ x +~ eb) + f(~ x) (2.126)
– 24 –Furthermore they are interrelated by translations
T−~ ea
[
→
∂af] =
←
∂af
T+~ eea
[
←
∂af] =
→
∂af , (2.131)
with which they commute:
T~ y ◦
→
∂a =
→
∂a ◦ T~ y
T~ y ◦
←
∂a =
←
∂a ◦ T~ y . (2.132)
The arithmetic mean of left and right discrete derivative gives the symmetric difference
quotient
↔
∂af(~ x) :=
1
2
(
←
∂a +
→
∂a)f(~ x)
=
1
2ǫ
(f(~ x +~ ea) − f(~ x −~ ea)) (2.133)
while their difference (which is sometimes called the osmotic derivative in the theory of
stochastic processes) is ǫ times a second order discrete derivative:
∆a := (
←
∂a −
→
∂a)f(~ x)
=
1
ǫ
(f(~ x +~ ea) − 2f(~ x) + f(~ x −~ ea))
= ǫ
←
∂a
→
∂af(~ x) . (2.134)
The resulting formulas
←
∂a =
↔
∂a +
1
2
∆a
→
∂a =
↔
∂a −
1
2
∆a (2.135)
for the forward and backward derivative are reminiscent of those used in stochastic calculus,
cf. §2.9 (p.26).
The symmetric difference quotient is obviously sensitive only to “wavelengths” λ ≥ 2ǫ.
→
∂a
→
∂bf(~ x) =
←
∂a (f(~ x) − f(~ x −~ eb))
= f(~ x) − f(~ x −~ eb) − f(~ x −~ ea) + f(~ x −~ ea −~ eb) (2.127)
←
∂a
→
∂bf(~ x) =
←
∂a (f(~ x) − f(~ x −~ eb))
= f(~ x +~ ea) − f(~ x +~ ea −~ eb) − f(~ x) + f(~ x −~ eb) (2.128)
→
∂b
←
∂af(~ x) =
→
∂b (f(~ x +~ ea) − f(~ x))
= f(~ x +~ ea) − f(~ x) − f(~ x +~ ea −~ eb) + f(~ x −~ eb) (2.129)
– 25 –Anticommutator of 1-forms. In the case of trivial structure functions (4.1) the anti-
commutator of any two 1-forms is
{αµdXµ
,βνdXν
} = αµ [dXµ
,βν]dXν
− βν [dXν
,αµ]dXµ
= αµ [dβν,Xµ
]dXν
− βν [dαµ,Xν
]dXµ
= αµ(
←
∂λβν)
h
dXλ
,Xµ
i
dXν
− βν(
←
∂λαµ)
h
dXλ
,Xν
i
dXµ
= ǫ
X
λ

αλ
(
←
∂λβµ) − βλ
(
←
∂λαµ)

dXλ
dXµ
. (2.136)
Hence the anticommutator vanishes precisely if
{αµdXµ
,βνdXν
} = 0
⇔ αλ
(
←
∂λβµ) − βλ
(
←
∂λαµ) = 0 (no sum over λ and for all λ 6= µ). (2.137)
## 2.9 Example: Stochastic calculus.
Consider the “2-dimensional” graph with edges
e± :=
"
1
±σ/
√
ǫ
#
, (2.138)
i.e. the graph given by the vielbein
ea
µ
=
"
1 σ/
√
ǫ
1 −σ/
√
ǫ
#
a = +,−; µ = 0,1 (2.139)
with inverse
eµ
a
=
1
2
"
1 1
√
ǫ/σ −
√
ǫ/σ
#
a = +,−; µ = 0,1. (2.140)
Here σ is a real constant and obviously we need to assume that σ/
√
ǫ is an integer.
We want to model a simple physical system on this graph and for this purpose we
think of X0 as a time-coordinate and X1 as a space coordinate.
For σ = 2
√
ǫ the resulting graph is indicated in figure 5:
For σ =
√
ǫ we get (2 copies of) the 2-dimensional “hyper diamond”, which (as soon
as the structure is equipped with some notion of metric, as will be done below) can be
interpeted as having two future directed lightlike edges at every node. A “particle” con-
strained to move along edges of this graph will perform a locally lightlike zig-zag walk as
known from Feynman’s checkerboard model.
The non-relativistic limit of this motion is obviously modeled by taking σ/
√
ǫ ≫ 1:
There is no longer a limiting velocity and the “particle” performs numerous “jumps” of
spatial distance ∆X1 = σ
√
ǫ = σ
√
∆X0. Intuitively, this should be related to a random
– 26 –X1
X0
~ e+ ~ e−
Figure 5: A graph that induces stochastic calculus.
walk. Interestingly, this stochastic process is automatically reproduced by the discrete
differential calculus related to the above graph, to which we now turn:
Plugging (2.139) and (2.140) into the formula (2.113) for the “structure functions”
yields
Cµν
λ = −
1
2
"
1
σ/
√
ǫ
#µ "
1
σ/
√
ǫ
#ν "
1
√
ǫ/σ
#
λ
+
"
1
−σ/
√
ǫ
#µ "
1
−σ/
√
ǫ
#ν "
1
−
√
ǫ/σ
#
λ
!
(2.141)
or equivalently
−ǫC(µ=1)(ν=1)
λ =
"
σ2
0
#
λ
−ǫC(µ=1)(ν=0)
λ = ǫ
"
0
1
#
λ
−ǫC(µ=0)(ν=0)
λ = ǫ
"
1
0
#
λ
. (2.142)
According to (2.112) this translates into the following commutation relations between co-
ordinate differentials and coordinates:

dX0
,X0

= ǫdX0

dX0
,X1

= ǫdX1

dX1
,X1

= σ2
dX0
. (2.143)
Non-relativistic case. In the continuum limit ǫ → 0 the structure functions become
lim
ǫ→0
−ǫCµν
λ =
(
σ2 for µ = ν = 1 and λ = 0
0 otherwise
. (2.144)
– 27 –Precisely these values of the structure functions had been noticed in [4] to induce a differ-
ential calculus that mimics properties of Ito’s stochastic calculus:
Using (2.121) we obtain in the limit ǫ → 0 the left and right derivatives
←
∂1(fg) = (
←
∂1f)g + f(
←
∂1g)
←
∂0(fg) = (
←
∂0f)g + f(
←
∂g) + σ2
(
←
∂1f)(
←
∂1g). (2.145)
It is readily checked that the proper partial derivatives ∂ are related to
←
∂ by
∂1 =
←
∂1
∂0 =
←
∂0 −
σ2
2
∂1∂1 . (2.146)
In other words we have
df =

∂0f +
σ2
2
∂1∂1f

dX0
+ (∂1f)dX1
= dX0

∂0f −
σ2
2
∂1∂1f

+ dX1
(∂1f). (2.147)
(In the last line the analogous derivation for
→
∂ instead of
←
∂ has been used, see [4]). This
shows that
←
∂0 is the forward and
→
∂0 the backward temporal derivative of drift-free a Wiener
process.
## 2.10 The continuum limit
Opposite edges and continuum limit. On a D-dimensional manifold there are
preciely D linearly independent 1-forms at every point. Since this is not true for discrete
complexes with opposite edges (cf. (2.29)), these cannot approximate ordinary differential
geometry on manifolds in the continuum limit.
As an example consider the “1-dimensional” complex with a unit edge and opposite
edge at every node:
G =
X
x∈Z Z
δ{x,x+1} + δ{x,x−1}

. (2.148)
The coordinate differential, which is the only independent differential in the continuum
theory, is
dX = ǫ
X
x
δ{x,x+1} − ǫ
X
x
δ{x,x−1} . (2.149)
But
[dX,X] = ǫS , (2.150)
where
S := ǫ
X
x
δ{x,x+1} + ǫ
X
x
δ{x,x−1} (2.151)
– 28 –is a 1-form that has no counterpart in the differential geometry of the real line and does
not approximate any continuum object.
In this sense the continuum limit of complexes with opposite edges does not exist.
This is the motivation for concentrating in §2.6 (p.20) on D-dimensional graphs that have
precisely D outgoing edges at every node. Another indication that complexes without
opposite edges (and without intermediate edges) are “nice”, is that for them the graph
operator is nilpotent (cf. §2.3 (p.9)).
Dimensionality. One would expect from a well-behaved discrete space that its di-
mension does not vary from node to node. In particular, a well behaved D-dimensional
differential complex (i.e. D-forms are top forms), should have a non-vanishing D form
supported at each seperate node.
But this condition is rather stringent: Consider for example a 2-dimensional complex
with intermediate edges as in figure 6. At node B it supports a 2-form (cf. figure 1), but
at node A, where the “intermediate” edges δ{A,C} originates, it does not, because
0 = ddδ{A}

δ{C}
= d(−δ{A,B} − δ{A,C})

δ{C}
= δ{A,B,C} (2.152)
and similarly for all other 2-forms originating at A.
... ...
...
...
δ{A}
δ{B} δ{C}
Figure 6: A graph with intermediate edges.
If one therefore restricts oneself to graphs with neither opposite nor intermediate edges
and with precisely D-edges originating at every node, then one is left with examples such
as depicted in figure 7. But the graph on the right of this figure does not have D = 2-forms
at each node, as was discussed in the text to figure 2.
Therefore only cubic graphs as on the left of figure 7 seem to have a well-behaved
dimensionality as well as a manifold continuum limit.
– 29 –...
...
...
...
...
...
...
...
...
...
...
...
...
...
...
...
...
Figure 7: Two typical graphs with neither opposite nor intermediate edges and with D edges
originating at every node
3. Inner product, integration, and metric
So far we have an abstract adjoint operation (·)†. We want to construct a vector space
with inner product on which the elements in Ω̂(2)

Â

act as operators and with respect to
which the formal (·)†-operation is the true adjoint operation:
## 3.1 The vector space V(Ω(A)) and inner products on it.
Definition: Statelike and null operators. An operator A is called statelike if it lies in
Ω̂

Â

(cf. (2.6)) It is called null if it “annihilates the constant 0-form”, i.e.
A is null ⇔ A =
X
i
AiQi Qi ∈
n
d,d†
,
h
d†
,Xµ
io
. (3.1)
Obviously every operator A can uniquely be written as the sum of a statelike operator
AS with a null operator AN by appropriately commuting d and d† to the right:
A = AS + AN . (3.2)
Definition: On the space Ω̂(2)

Â

define the symmetric bilinear map
(·,·) : Ω̂(2) × Ω̂(2) → Â
(A,B) 7→
(
A†B + B†A

S
if grad(A) = grad(B)
0 otherwise
(3.3)
Note that the term in parentheses on the right hand side is indeed in Ω̂0

Â

= Â.
By construction A† is the adjoint of A with respect to (·,·):
(A·,·) = (·,A†
·). (3.4)
– 30 –But we want a global inner product on the space H of statelike operators. With the
equivalence relation
A ∼ B ⇔ (A − B)S = 0 (3.5)
the space H can be characterized as
H := Ω̂(2)

Â

/ ∼ . (3.6)
As an element of H any operator A (or rather the equivalence class it represents) will be
alternatively written as
[A]∼ := |(A)Si . (3.7)
For instance
h
[d,Xµ
] + Ad + Bd†
+ C
h
d†
,Xν
i i
∼
= |[d,Xµ
]i (3.8)
corresponds to the 1-form dXµ. For convenience we will often use the Ω(A)-notation
instead of the Ω̂

Â

-notation inside kets:
|a0 [d,a1][d,a2]···[d,ap]i := |a0da1da2 ···dapi . (3.9)
A special state is the constant 0-form or vacuum state, which is associated with the
identity operator,
[1]∼ = |1i , (3.10)
and which can be used to characterize null operators:
A|1i = 0 ⇔ A = (A)N . (3.11)
Definition: Integration. For some yet to be specified dV ∈ A let
Z
A dV :=
X
~ x
A(~ x)dV (~ x) for A ∈ A. (3.12)
Definition: Pre-Inner product. A bilinear form on the space of all operators is
given by
hA|Bi :=
Z
(A,B) dV . (3.13)
This gives an inner product on H only if it vanishes on null operators. It is readily
checked that
D
A|Bd†
E
= 0
D
A|B
h
d†
,a
iE
= 0 ∀ a ∈ Â. (3.14)
– 31 –The only possibly problematic case is therefore
hA|Bdi =
(
1
2
R
d†B†A

S
dV for grad(A) = grad(B) + 1
0 otherwise
. (3.15)
Because A and B are arbitrary the bilinear form h·|·i gives an inner product on H iff
Z
(d†
A)S dV = 0 ∀ A ∈ Ω̂1

Â

, (3.16)
which, given the N = 2 differential calculus with all its supercommutation relations, is a
condition on dV (~ x), i.e. on the value of discrete volume associated with the node ~ x.
Note that in the continuum theory this is the well known relation
0 =
Z
d ∗ Aµdxµ
=
Z p
|detg|∇µAµ
dD
x. (3.17)
If this condition is satisfied, then the (·)† defined in the Ω̂(2) differential calculus is
truly the adjoint operation with respect to (3.13).
Generality of the inner product. Consider any graded inner product on Ω(A) and
assume the adjoints of all operators with respect to this inner product are known. Then
obviously the inner product is completely specified by its action on Ω0: Namely let A,B
be any two operators of the same grade on Ω and recall |Ai := A|1i and |Bi := B |1i. It
follows that
hA|Bi = h1|A†
B |1i
= h1|fi , (3.18)
where f = A†B |1i ∈ A. Therefore the inner product is known completely when the linear
form
h1|·i : A → I C (3.19)
is known. Any such map must necessarily be of the form
h1|fi =
X
~ x
f(~ x) dV (~ x) (3.20)
for some dV ∈ A. Plugging this into the symmetrized (3.18) yields (3.13):
hA|Bi =
Z
1
2

A†
B + B†
A

S
(~ x) dV . (3.21)
This shows that the class of inner products (3.13) is in fact the most general class of inner
products on Ω(A) with respect to which elements in Ω0 are self-adjoint. The consistency
condition
0 = h1|d†
A|1i (3.22)
– 32 –gives a constraint on the otherwise arbitrary function dV in terms of the supercommutator
structure of the N = 2 calculus of operators acting on Ω(A).
Because this condition can be expressed in terms of elementary edges as
Z
(d†
δ{~ x,~ x+~ ea(~ x)})S dV = 0 ∀ ~ x,a (3.23)
we turn to an analysis of the diveregence of an elementary edge in §3.2 (p.33).
## 3.2 Length, volume, and divergence
Theorem: When the result of acting with an elementary adjoint edge on a given
elementary edge is taken to be in Ω̂0

Â

= Â then the algebra demands that

δ†
{~ y+~ eb(~ y),~ y}δ{~ x,~ x+~ ea(~ x)}

S
= δ{~ x}(~ y)δa,b
ℓ2(a,~ x +~ ea(~ x))
ǫ2
δ{~ x+~ ea(~ x)} (3.24)
for some function ℓ2(a,~ x,~ ea(~ x)) that vanishes when δ{~ x,~ x+~ ea(~ x)} = 0.
Proof: First of all, the left hand side obviously vanishes when ~ x 6= ~ y, therefore the
factor δ{~ x}(~ y) on the right. Next, the left hand side must be an element of Ω̂0

Â

= Â.
This implies that it must commute with all other elements in Â, which again implies that
~ y +~ eb(~ y) = ~ x +~ ea(~ x), which, since ~ x = ~ y and ea
µ is invertible, can only be true for a = b.
This is enforced by the second factor on the right. So the left hand side is δ{~ x+~ ea(~ x)} times
a real number, which we encode in the function ℓ2. ✷
.
Theorem: The divergence of an elementary edge is

d†
δ{~ x,~ x+~ ea(~ x)}

S
= −

div(ea)(~ x)
ǫ
+
ℓ2(a,~ x)
ǫ2

δ{~ x} +
ℓ2(a,~ x +~ ea(~ x))
ǫ2
δ{~ x+~ ea(~ x)} , (3.25)
where
div(ea
) := −

d†
e†a

S
(3.26)
is the divergence of the “macroscopic” 1-form (2.104).
Proof: First we will show that
d†
δ{~ x,~ x+~ ea(~ x)} |1i = f(a,~ x)δ{~ x} |1i + g(a,~ x +~ ea(~ x))δ{~ x+~ ea(~ x)} |1i (3.27)
for some f and g. It then follows that
f = −

div(ea)
ǫ
+
ℓ2(a)
ǫ2

g =
ℓ2(a)
ǫ2
. (3.28)
The first assertion is proven by multiplying with δ{~ y}:
δ{~ y}d†
δ{~ x,~ x+~ ea(~ x)} |1i =
h
δ{~ y},d†
i
δ{~ x,~ x+~ ea(~ x)} |1i + d†
δ{~ y}δ{~ x,~ x+~ ea(~ x)} |1i . (3.29)
– 33 –The first term on the right can only give a contribution if one of the adjoint edges that
is produced by

δ{~ y},d†

has a non-vanishing statelike product with the original edge.
According to (3.24) this implies that the first term on the right gives a contribution only
for ~ y = ~ x or ~ y = ~ x + ~ ea(~ x). Furthermore the second term on the right is obviously
non-vanishing only for ~ y = ~ x. This proofs (3.27).
Next we write
d†
δ{~ x,~ x+~ ea(~ x)} |1i = d†
δ{~ x}

d,δ{~ x+~ ea(x)}

|1i
=
h
d†
,δ{~ x}
i
d,δ{~ x+~ ea(x)}

|1i + δ{~ x}d†

d,δ{~ x+~ ea(~ x)}

|1i . (3.30)
The first term on the right gives
h
d†
,δ{~ x}
i
d,δ{~ x+~ ea(x)}

|1i = δ†
{~ x+~ ea(~ x),~ x}δ{~ x,~ x+~ ea(~ x)} |1i
(3.24)
=
ℓ2(a,~ x +~ ea(~ x))
ǫ2
δ{~ x+~ ea(~ x)} |1i , (3.31)
because according to (3.24) all other products of adjoint edges with edges that might appear
annihilate the vacuum state and hence give no contribution.
Due to (3.27) the second term on the right of (3.30) is equal to δ{~ x} times the left hand
side of (3.30):
δ{~ x}d†

d,δ{~ x+~ ea(~ x)}

|1i = δ{~ x}d†
δ{~ x}

d,δ{~ x+~ ea(~ x)}

|1i (3.32)
so that (3.30) becomes
d†
δ{~ x,~ x+~ ea(~ x)} |1i =
ℓ2(a,~ x +~ ea(~ x))
ǫ2
δ{~ x+~ ea(~ x)} |1i + δ{~ x}d†
δ{~ x,~ x+~ ea(~ x)} |1i . (3.33)
In other words there is a function f(a,~ x) such that
d†
δ{~ x,~ x+~ ea(~ x)} |1i =
ℓ2(a,~ x +~ ea(~ x))
ǫ2
δ{~ x+~ ea(~ x)} |1i + f(a,~ x)δ{~ x} |1i . (3.34)
It follows that
(d†
e†a
)S =
ℓ2(a)
ǫ
+ ǫf
⇒ f = −

div(ea)
ǫ
+
ℓ2(a)
ǫ2

. (3.35)
Plugging this into (3.34) completes the proof. ✷
Integral over total divergence. Equation (3.23) used the integral over the diver-
gence of a fundamental edge. This can now be evaluated more explicitly:
Z
(d†
δ{~ x,~ x+~ ea(~ x)})S dV
(3.25)
= −

div(ea)(~ x)
ǫ
+
ℓ2(a,~ x)
ǫ2

dV (~ x) +
ℓ2(a,~ x +~ ea(x))
ǫ2
dV (~ x +~ ea(~ x)) .
(3.36)
– 34 –The vanishing of this expression is equivalent to
div(ea)(~ x) dV (~ x) =
1
ǫ
ℓ2
(a,~ x +~ ea(x))dV (~ x +~ ea(~ x)) − ℓ2
(a,~ x)dV (~ x)

. (3.37)
Given the functions dV and ℓ2 this can be used to solve for div(ea) such that (3.13)
does indeed define an inner product on the space H of states with respect to which (·)† is
the adjoint operation.
Note that in the continuum theory the equation13
div(ea)vol = Leavol (3.39)
holds, where vol is the volume form and Lea the Lie derivative on forms along ea.
Inserting the consistency condition (3.37) into (3.25) fixes the divergence of a funda-
mental edge in terms of ℓ2 and dV :

d†
δ{~ x,~ x+~ ea(~ x)}

S
=
ℓ2(a,~ x +~ ea(x))
ǫ2

δ{~ x+~ ea(~ x)} −
dV (~ x +~ ea(~ x))
dV (~ x)
δ{~ x}

. (3.40)
Non-orthogonal and lightlike edges. The restriction, found above, for the edges ea
at a given node to be mutually orthogonal with respect to a metric encoded in the adjoint
operator (·)† has its merits and its disadvantages: On the one hand side every restriction
of possible arbitrariness by formal restrictions is a relief, on the other hand objects like for
instance lightlike edges, which are desireable from the physical point of view, are also also
ruled out by this requirement.
The obvious way out is to use adjointness relations which violate the assumption that
0-forms are strictly self-adjoint with respect to them. It is perfectly sensible that 0-forms
should be self-adjoint only up to a lattice correction proportional to ǫ.
A large class of useful relations of this form are found by introducing any (·)†-self-
adjoint invertible operator ĝ and the modified inner product
h·|·iĝ := h·|ĝ−1
|·i (3.41)
induced by it. This gives us a new adjointness relation
A†ĝ = ĝA†
ĝ−1
. (3.42)
The 0-forms will in general not be self-adjoint with respect to this new inner product.
Probably the most important of such operators ĝ are those that are Krein space oper-
ators which turn the discrete Riemannian metric into a semi-Riemannian one (see [19] for
a discussion of semi-Riemannian non-commutative geometry with Krein space operators).
An example for such a case is discussed in §2.9 (p.26).
13
This follows from
div(ea
) vol = ∗ ∗ d ∗ ea
µdxµ
= d(ea
⇀ vol)
= {d,ea
⇀}vol
= Lea vol. (3.38)
– 35 –3.3 Volume form and Hodge duality
Volume-like forms. On a D dimensional N = 2 complex with inner product
h·|ĝ−1 |·i and adjoint (·)†ĝ a volume-like form is a D-form |volĝi = volĝ |1i that is an-
nihilated by d†ĝ :
d†ĝ |volĝi = 0. (3.43)
Volume form. A volume form is a volume-like form that furthermore satisfies
volĝ
†ĝvolĝ |1i = |1i . (3.44)
(This condition, familiar from the continuum, will fix the as yet undetermined “volume
element” dV that enters the definition of any inner product, cf. §3.1 (p.30).
At least for sufficiently non-pathologic D-dimensional complexes the volume form
should exist and be unique. This is certainly the case for the concrete examples that
we will study (e.g. cubic graphs), as well as for the continuum theory.)
Because of d†ĝ = ĝd†ĝ−1 a volume-like form |volĝi is related to the respective volume-
like form |voli by
|volĝi = ĝ |voli . (3.45)
Because ĝ is grade preserving it must simply multiply |voli by a function. Motivated by
the construction in §3.5 (p.44) this function (multiplied from the right) will formally be
called det(g), i.e.
|volĝi := voldet(g) |1i . (3.46)
We note again, that this equation defines det(g) ∈ A.
Next, using the volume form the familiar notion of “integrating a D-form over a D-
dimensional space” can be formalized by means of the following definition:
Integrating a D form over a D-dimensional complex.
Z
f volĝ :=
Z
f dV f ∈ A. (3.47)
Hodge duality. The volume form serves as a “vacuum” with respect to d†ĝ, just as |1i
is the vacuum with respect to d.
The operator ⋆ĝ : Ω → Ω with ⋆ĝ Ωp = ΩD−p which intertwines the sequences
0
d
−→ Ω0 d
−→ Ω1 d
−→ ···
d
−→ ΩD d
−→ 0
0
d
† ĝ
←− Ω0 d
† ĝ
←− Ω1 d
† ĝ
←− ···
d
† ĝ
←− ΩD d
† ĝ
←− 0 (3.48)
so that
⋆ĝ d = d†ĝ ⋆ĝ (−1)N̂+1
(3.49)
– 36 –is called the Hodge star operator. (Here N̂ is the number operator defined by N̂ |Ai =
p|ai ⇔ A ∈ Ωp.)
When ⋆ĝ is invertible this may be rewritten as
d†ĝ = ⋆ĝ d ⋆−1
ĝ (−1)D−N̂+1
. (3.50)
The action of the Hodge star operator can be expressed explicitly in terms of the volume
form and the adjoint operation:
Theorem: The action of the Hodge star operator is given by
⋆ĝ |Ai = (AS)†ĝ |volĝi . (3.51)
Proof: Let A := a0 [d,a1][d,a2]···[d,ap] be an element in Ω̂

Â

, then
d†ĝ ⋆ĝ |Ai
(3.51)
= d†ĝ
h
a
†ĝ
p ,d†ĝ
ih
a
†ĝ
p−1,d†ĝ
i
···
h
a
†ĝ
1 ,d†ĝ
i
a
†ĝ
0 |volĝi
= (−1)p+1
h
a
†ĝ
p ,d†ĝ
ih
a
†ĝ
p−1,d†ĝ
i
···
h
a
†ĝ
1 ,d†ĝ
ih
a
†ĝ
0 ,d†ĝ
i
|volĝi
(3.51)
= (−1)p+1
⋆ĝ [d,a0][d,a1]···[d,ap]|1i
= (−1)p+1
⋆ĝ d a0 [d,a1]···[d,ap]|1i
= (−1)p+1
⋆ĝ d|Ai . (3.52)
## 3.4 Cubic graphs
So far from (3.24) we only know the statelike part of the product of an adjoint edge with an
edge. Further information of the form of this operator is obtained by using the structure
of the Ω(A,d) calculus. For instance if δ{~ x,~ x+~ ea(~ x)}A = 0 then
0 = δ†
~ x+~ eb(~ x),~ xδ{~ x,~ x+~ ea(~ x)}A
=

δ†
~ x+~ eb(~ x),~ xδ{~ x,~ x+~ ea(~ x)}

S
+

δ†
~ x+~ eb(~ x),~ xδ{~ x,~ x+~ ea(~ x)}

N

A (3.53)
gives a condition on the possible values of

δ†
~ x+~ eb(~ x),~ xδ{~ x,~ x+~ ea(~ x)}

N
. These conditions must
be solved for each possible graph, i.e. for each possbible G in (2.99), seperately.
Definition: A cubic graph is a graph of the form (2.99) for which
δ{~ x,~ x+~ ea}δ{~ x+~ ea,~ x+~ ea+~ ea} = 0
δ{~ x,~ x+~ ea}δ{~ x+~ ea,~ x+~ ea+~ eb} = −δ{~ x,~ x+~ eb}δ{~ x+~ eb,~ x+~ eb+~ ea} . (3.54)
On cubic graphs the objects (2.104) obviously satisfy
e†a
e†b
+ e†b
e†a
= 0
ea
eb
+ eb
ea
= 0 ∀ a,b ∈ {1,···,D} . (3.55)
But mixed anticommutators are generally more complex:
– 37 –Theorem: On a cubic graph it is possible to have the following anticommutation
relations
δ†
{~ x+~ ea,~ x}δ{~ x,~ x+~ ea} =
ℓ2(a,~ x +~ ea)
ǫ2
δ{~ x+~ ea} −
ℓ2(a,~ x +~ ea)
ℓ2(a,~ x +~ ea +~ ea)
δ{~ x+~ ea,~ x+~ ea+~ ea}δ†
{~ x+~ ea+~ ea,~ x+~ ea}
δ†
{~ x+~ ea,~ x}δ{~ x,~ x+~ eb} = −
ℓ2(a,~ x +~ ea)
ℓ2(a,~ x +~ ea +~ eb)
δ{~ x+~ ea,~ x+~ ea+~ eb}δ†
{~ x+~ ea+~ eb,~ x+~ eb} for a 6= b.(3.56)
(We conjecture that thes relations for cubic graphs are in fact unique, i.e. no consistent
modification is possible.)
Proof: As mentioned above, we essentially need to check associativity of the product
of an adjoint edge with the product of two edges. For instance the expression
δ†
{~ x+~ ea,~ x}δ{~ x,~ x+~ ea}δ{~ x+~ ea,~ x+~ ea+~ ea} (3.57)
needs to vanish, because the product of the last two factors does so by assumption of a
cubic graph structure. We now check if, when evaluating the product of the first two factors
first (using (3.56)) and then multiplying with the last factor, the result still vanishes. And
indeed:
δ†
{~ x+~ ea,~ x}δ{~ x,~ x+~ ea}δ{~ x+~ ea,~ x+~ ea+~ ea}
(3.56)
=
ℓ2(a,~ x +~ ea)
ǫ2
δ{~ x+~ ea,~ x+~ ea+~ ea}
−
ℓ2(a,~ x +~ ea)
ℓ2(a,~ x +~ ea +~ ea)
δ{~ x+~ ea,~ x+~ ea+~ ea}δ†
{~ x+~ ea+~ ea,~ x+~ ea}δ{~ x+~ ea,~ x+~ ea+~ ea}
(3.56)
= 0 +
ℓ2(a,~ x +~ ea)
ℓ2(a,~ x +~ ea +~ ea)
δ{~ x+~ ea,~ x+2~ ea}δ{~ x+2~ ea,~ x+3~ ea}δ†
{~ x+3~ ea,~ x+2~ ea}
(3.54)
= 0. (3.58)
Similarly, to check the second relation we write
δ†
{~ x+~ ea,~ x} δ{~ x,~ x+~ eb}δ{~ x+~ eb,~ x+~ eb+~ ea}
 (3.56)
= −
ℓ2(a,~ x +~ ea)
ℓ2(a,~ x +~ ea +~ eb)
δ{~ x+~ ea,~ x+~ ea+~ eb}δ†
{~ x+~ ea+~ eb,~ x+~ eb}δ{~ x+~ eb,~ x+~ eb+~ ea}
(3.56)
= −
ℓ2(~ x +~ ea)
ǫ2
δ{~ x+~ ea,~ x+~ ea+~ eb}
+
ℓ2(a,~ x +~ ea)
ℓ2(a,~ x + 2~ ea +~ eb)
δ{~ x+~ ea,~ x+~ ea+~ eb}δ{~ x+~ ea+~ eb,~ x+2~ ea+~ eb}δ†
{~ x+2~ ea+~ eb,~ x+~ ea+~ eb
(3.59
and
δ†
{~ x+~ ea,~ x} δ{~ x,~ x+~ ea}δ{~ x+~ ea,~ x+~ eb+~ ea}
 (3.56)
=
ℓ2(a,~ x +~ ea)
ǫ2
δ{~ x+~ ea,~ x+~ eb+~ ea}
−
ℓ2(a,~ x +~ ea)
ℓ2(a,~ x +~ ea +~ ea)
δ{~ x+~ ea,~ x+~ ea+~ ea}δ†
{~ x+~ ea+~ ea,~ x+~ ea}
δ{~ x+~ ea,~ x+~ eb+~ ea}
(3.56)
=
ℓ2(a,~ x +~ ea)
ǫ2
δ{~ x+~ ea,~ x+~ eb+~ ea}
+
ℓ2(a,~ x +~ ea)
ℓ2(~ x + 2~ ea +~ eb)
δ{~ x+~ ea,~ x+~ ea+~ ea}δ{~ x+~ ea+~ ea,~ x+2~ ea+~ eb}δ†
{~ x+2~ ea+~ eb,~ x+~ ea+~ eb}
(3.60)
– 38 –Here (3.59) and (3.60) are indeed equal up to a sign, the way it should be. ✷
Corollary: For the vielbein forms and adjoint forms (2.104) it follows that on cubic
graphs
ea
e†a (3.56)
= ℓ2
(a) −
ℓ2(a,·)
ℓ2(a,· +~ ea)
e†a
ea
ea
e†b (3.56)
= −
ℓ2(a,·)
ℓ2(a,· +~ eb)
e†b
ea
. (3.61)
Therefore on cubic graphs these satisfy the canonical anticommutation relations without
lattice corrections precisely if the “lengths” ℓ of all elementary edges are identical:
n
e†a
,eb
o
= δa,b
ℓ2
⇔ ℓ2
(a,~ x) = ℓ2
= const. (3.62)
For the rest of this section we consider cubic graphs with
ℓ2
= 1. (3.63)
– 39 –Divergence on cubic graphs. The divergence of an arbitrary p-form on a cubic
graph with ℓ = 1 is determined by
d†
e†a1
e†a2
···e†ap+1
δ~ y |1i
=
(−1)p
ǫp!
X
π
σ(π) e†aπ(1)
e†aπ(2)
···e†aπ(p)

δ{~ y} − δn
~ y−~ eaπ(p+1)
o dV (~ y)
dV

~ y −~ eaπ(p+1)


|1i .
(3.64)
(Here π is a permutation of {1,2,···,p} and σ(π) is its signature, which ensures that the
right hand side has the same behaviour under index permutation as the left hand side.)
Note that for p = 1 this does indeed reproduce (3.24), which was derived for general
graphs.
Proof: The “matrix elements” of d† with respect to elementary p-forms (which consti-
tute a basis of Ω(A)) are (note that we can always bring the e†a
in both factors into the
given order)
D
e†a1
e†a2
···e†ap
δ{~ x}|d†
e†a1
e†a2
···e†ap
e†ap+1
δ{~ y}
E
=
D
de†a1
e†a2
···e†ap
δ{~ x}|e†a1
e†a2
···e†ap
e†ap+1
δ{~ y}
E
(2.31)
= (−1)p
D
e†a1
e†a2
···e†ap

δ{~ x−~ eap+1,~ x} − δ{~ x,~ x+~ eap+1}

|e†a1
e†a2
···e†ap
e†ap+1
δ{~ y}
E
= (−1)p 1
ǫ
D
e†a1
e†a2
···e†ap
e†ap+1

δ{~ x} − δ{~ x+~ eap+1}

|e†a1
e†a2
···e†ap
e†ap+1
δ{~ y}
E
(3.62)
= (−1)p 1
ǫ
D
δ{~ x} − δ{~ x+~ eap+1}|δ{~ y}
E
= (−1)p 1
ǫ
δ{~ y}(~ x) − δ{~ y} ~ x +~ eap+1

dV (~ y) . (3.65)
This is indeed reproduced by (3.64):
D
e†a1
e†a2
···e†ap
δ{~ x}|d†
e†a1
e†a2
···e†ap
e†ap+1
δ{~ y}
E
(3.64)
=
(−1)p
ǫ
*
e†a1
e†a2
···e†ap
δ{~ x}|e†a1
e†a2
···e†ap
δ{~ y} − δn
~ y−~ aaπ(p+1)
o dV (~ y)
dV ~ y −~ eap+1

!+
=
(−1)p
ǫ
δ{~ y}(~ x) − δ{~ y} ~ x +~ eap+1

dV (~ y) (3.66)
✷
Corollary: For dV = const
d†
e†a1
···e†dp
f
E
= −
X
r
e†a1
···e†ar−1
e†ar+1
···e†aD
(
←
∂ar f)
E
, (3.67)
which involves the forward discrete derivative (2.124). Compare this with
d e†a1
···e†dp
f
E
= (−1)p
e†a1
···e†aD
e†b
(
→
∂bf)
E
, (3.68)
which involves the backward discrete derivative (2.125). This phenomenon is further stud-
ied in §4.1 (p.50).
– 40 –Example: Divergence in terms of elementary edges. Equation (3.64) owes its
relative concise form to the fact that the equivalence (2.38) of “paths of two edges” with
the same source and target nodes is encoded in the anticommutativity of the e†a
. When
this is reexpressed in terms of elementary edges, using
e†a
δ{~ x+~ ea} = δ{~ x,~ x+~ ea}
e†a
e†b
δ{~ x+~ ea+~ eb} = δ{~ x,~ x+~ ea,~ x+~ ea+~ eb} (3.69)
one obtains formulas such as the following (for dV = const):
d†
δ{~ x,~ x+~ ea} |1i =
1
ǫ

δ{~ x+~ ea} − δ{~ x}

|1i
d†
δ{~ x,~ x+~ ea,~ x+~ ea+~ eb} |1i =
1
ǫ

e†b

δ{~ x+~ ea+~ eb} − δ{~ x+~ eb}

− e†a

δ{~ x+~ ea+~ eb} − δ{~ x+~ ea}

|1i
=
1
ǫ

δ{~ x+~ ea,~ x+~ ea+~ eb} + δ{~ x,~ x+~ ea} − δ{~ x+~ eb,~ x+~ ea+~ eb} − δ{~ x,~ x+~ eb}

.
(3.70)
In words: The divergence of a “path” of fundamental edges is the (weighted) sum of paths
obtained by removing an edge from the beginning or from the end of the original path as
well as of all paths that the original one is equal to up to a sign.
In terms of chains this translates to the usual boundary map, cf. (3.124) and figure 8
on page 49.
Volume form on cubic graphs. Volume-like forms (cf. (3.43)) on cubic graphs
are precisely of the form
|volĝi = ce†1
e†2
···e†D det(g)
dV
|1i for c ∈ I C (3.71)
(where det(g) was defined in (3.46)). These become proper volume forms (cf. (3.44)) iff
dV = c
p
det(g), (3.72)
which then read
|volĝi = e†1
e†2
···e†Dp
det(g)|1i . (3.73)
Proof: First we check the defining condition (3.43) for volume-like forms for the case
ĝ = id (which is sufficient, due to (3.45)):
d†
|voli = cd†
e†1
e†2
···e†D 1
dV
|1i
= c
X
~ y
d†
e†1
e†2
···e†D
δ{~ y}
1
dV (~ y)
|1i
(3.64)
=
1
ǫ
1
p!
X
π
σ(π) e†aπ(1)
e†aπ(2)
···e†aπ(p)
X
~ y

δ{~ y} − δn
~ y−~ aaπ(p+1)
o dV (~ y)
dV

~ y −~ eaπ(p+1)


 1
dV (~ y)
| {z }
= 1
dV
− 1
dV
=0
|1i
= 0. (3.74)
– 41 –Uniqueness of (3.71) is immediate: Any other volume-like form must differ from (3.71) by
a non-constant factor. Commuting d† past this factor gives an operator of the form faea,
which does not annihilate |voli.
Assertion (3.72) is proved by evaluating (3.44):
|1i
!
= vol
†ĝ
ĝ volĝ |1i
= c2
ĝ(ĝvol)†
ĝ−1
ĝvol|1i
= c2
ĝvol†
ĝvol|1i
= c2
ĝvol†
vol det(g)|1i
= c2
ĝ
det(g)
dV 2
|1i
ĝ|A=id
= c2 det(g)
dV 2
|1i . (3.75)
✷
Hodge star on cubic graphs with self-adjoint 0-forms According to (3.71) the
volume-like form is
|voli = e†1
e†2
···e†D 1
dV
|1i
=
1
D!
ǫa1ab···ape†a1
e†a2
···e†aD 1
dV
|1i (3.76)
for some v ∈ A.
Let
A = αa1a2···ape†a1
e†a2
···e†ap
|1i
B = βb1b2···bpe†b1
e†b2
···e†bp
|1i (3.77)
and
A′
= e†a1
e†a2
···e†ap
αa1a2···ap |1i
B′
= e†b1
e†b2
···e†bp
βb1b2···bp |1i . (3.78)
The action of the Hodge star (with respect to ĝ = id) is explicitly
⋆ e†a1
e†a2
···e†ap
αa1a2···ap |1i =
1
(D − p)!
αa1a2···apǫa1a2···ap
ap+1···aD
e†ap+1
e†ap+2
···e†aD 1
dV
|1i ,
(3.79)
and that of its inverse is
⋆−1
αa1a2···ape†a1
e†a2
···e†ap
|1i =
(−1)p(D−p)
(D − p)!
ǫa1a2···ap
ap+1···aD
e†ap+1
e†ap+2
···e†aD
αa1a2···apT~ ea1+···~ eap
[dV ]|1i .
(3.80)
Here ǫ is the totally antisymmetric unit symbol with ǫ123···D = 1, indices have been shifted
with δab and summation over index pairs is implied.
This is clearly a discrete approximation to the Hodge star in flat Euclidean space. The
Hodge star for general signature and geometry is derived in (3.105).
– 42 –Expressing the inner product by means of the Hodge star. One finds
A ⋆ B |1i = B ⋆ A|1i
= p! αa1a2···apβa1a2···ap
|voli (3.81)
and hence
hA|Bi =
Z
(A′
⋆ B′
)S . (3.82)
(The integral over a D-form was defined in (3.47).)
Proof: The implication
(ai) is not a permutation of (bi) ⇒ e†a1
e†a2
···e†ap
eb1
eb2
···ebp
f |voli = 0 (3.83)
(for f ∈ A) is crucial. It implies that
e†a1
e†a2
···e†ap
eb1
eb2
···ebp
f v e†1
···e†D
|1i = f ve†a1
e†a2
···e†ap
eb1
eb2
···ebp
e†1
···e†D
|1i
= fδ
a1a2···ap
b1b2···bp
|voli (3.84)
because f ∈ A commutes with e†a
ea (no sum). Therefore
A ⋆ B |1i = αa1a2···ape†a1
e†a2
···e†ap
ebp
ebp−1
···eb1
βb1b2···bp |voli
= p! αa1a2···apβa1a2···ap
|voli . (3.85)
✷
Hodge star on cubic graphs for ĝ-inner products. The Hodge star ⋆ĝ which
is associated with the ĝ-inner product h·|ĝ−1 |·i has a simple relation to the Hodge star ⋆
associated with the unmodified inner product h·|·i:
Assume that ⋆ĝ and ⋆ are both invertible. Then, according to (3.50),
d†ĝ = ⋆ĝ d ⋆−1
ĝ (−1)D−N̂+1
(3.86)
and
d†
= ⋆d ⋆−1
(−1)D−N̂+1
. (3.87)
Using the identity A†ĝ = ĝA†ĝ−1 the left hand side of the former equation can be rewritten
as
d†ĝ = ĝd†
ĝ−1
(3.87)
= ĝ ⋆d⋆−1

ĝ−1
(−1)D−N̂+1
= (ĝ ⋆)d(ĝ ⋆)−1
(−1)D−N̂+1
. (3.88)
Comparison with (3.86) yields the result.
⋆ĝ = ĝ ◦ ⋆ . (3.89)
– 43 –Corollary. For diagonal operators ĝ, i.e. those that satisfy ĝe†a1
···e†ap
|1i ∝
e†a1
···e†ap
|1i, equation (3.81) generalizes to
hA|ĝ−1
|Bi =
Z
(A′
⋆ĝ B′
)S . (3.90)
## 3.5 Metrics on cubic graphs
We have seen that with respect to the ordinary adjoint operation (·)† on Ω̂(2) (which is
defined as leaving elements in Ω̂0
(2) invariant) the elementary edges have to be orthogonal in
the sense of (3.24) and that the anticommutation relations (3.56) become quite unnatural
when ℓ2 is not a constant. Even though a priori one might have expected that a metric on
the complex could be encoded in relations such as (3.24), this is now seen to be unrealistic.
To handle non-flat spaces we therefore need to drop the assumption that 0-forms are
self-adjoint. Instead of developing the corresponding formalism completely from scratch
again, the existing inner product h·|·i (3.13) on a flat space can simply be modified by
deforming it with a metric operator ĝ which is of 0 grade, self adjoint with respect to (·)†
and invertible:
h·|·iĝ := h·|ĝ−1
|·i . (3.91)
Note that
A†ĝ = ĝA†
ĝ−1
. (3.92)
For the purpose of presenting the following considerations it is convenient to let Xµ
be the preferred coordinate system defined by14
[d,Xµ
] = e†(a=µ)
. (3.93)
Now let g = (gµν) be a D × D matrix that is supposed to play the role of the metric
tensor with respect to these preferred coordinates.
We are looking for an operator ĝ such that
[d,Xν
]†ĝ [d,Xµ
]|1i = (g−1
)µν
|1i (3.94)
and more generally
[d,Xν
]†ĝ
[d,Xµ1
][d,Xµ2
]···[d,Xµp
] f |1i
= −
p X
j=1
(−1)j
[d,Xµ1
]···[d,Xµj−1
][d,Xµj+1
]···[d,Xµp
](g−1
)νµj
f |1i .
(3.95)
Note that for constant gµν this is equivalent to
n
[d,Xµ
],[d,Xν
]†ĝ
o
= (g−1
)µν
(for constant gµν). (3.96)
14
For instance X3
increases by ǫ when one moves from ~ x to ~ x + ~ e3. It remains constant when moving
into the direction of any other ~ ea, a 6= 3.
– 44 –Action of the metric operator. This operator ĝ must act as
ĝ e†a1
···e†ap
f |1i =
X
b1,···bp
e†b1
···e†bp
gb1a1 ···gbpap f |1i , (3.97)
and equivalently its inverse has the action
ĝ−1
e†a1
···e†ap
f |1i =
X
b1,···bp
e†b1
···e†bp
(g−1
)b1a1
···(g−1
)bpap
f |1i . (3.98)
Proof:
[d,Xν
]†ĝ
[d,Xµ1
][d,Xµ2
]···[d,Xµp
] f |1i
(3.93)
= (e†ν
)†ĝ e†µ1
···e†µ2
f |1i
(3.92)
= ĝeν
ĝ−1
e†µ1
···e†µ2
f |1i
(3.97)
= ĝeν
X
λ1,···,λp
e†λ1
···e†λ2
(g−1
)λ1µ1
···(g−1
)λpµp
f |1i
(3.62)
= −ĝ−1
X
λ1,···,λp
p X
j=1
(−1)j
e†λ1
···e†λj−1
e†λj+1
···e†λp
δν,λj
(g−1
)λ1µ1
···(g−1
)λpµp
f |1i
(3.98)
= −
p X
j=1
(−1)j
[d,Xµ1
]···[d,Xµj−1
][d,Xµj+1
]···[d,Xµp
](g−1
)νµj
f |1i,. (3.99)
✷
Explicit form of the metric operator. The metric operator ĝ may be written in
terms of the e† and e as
ĝ =
X
p
1
p!
X
a1,···,ap
b1,···,bp
e†a1
e†a2
···e†ap
ga1b1ga2b2 ···gapbp eb1
eb2
···ebp
Pp , (3.100)
where Pp is the projector on Ωp.
Obviously this ĝ is indeed of 0 grade, is self-adjoint when gµν is symmetric and is
invertible if gµν is.
Proof: Just apply this operator on any p-form. ✷
In the continuum, or for constant metric tensors, there is a more concise way to write
the metric operator, namely
ĝ = exp

e†a
(lng)ab eb

, (3.101)
where (lng) is the logarithm of the matrix g in the sense that
gab = exp(lng)ab = δab + (lng)ab +
1
2
X
c
(lng)ac(lng)cb + ··· . (3.102)
– 45 –Proof: Since by assumption the scalar coefficient of the metric operator commutes with all
form creation and annihilation operators we have
ĝ e†c
ĝ−1
= exp

e†a
(lng)abeb

e†c
exp

−e†a
(lng)abeb

= e†c
+
h
e†a
(lng)abeb
,e†c
i
+
1
2
h
e†a
(lng)abeb
,
h
e†a
(lng)abeb
,e†c
ii
+ ···
=

δca + (lng)ca +
1
2
(lng)2
ca + ···

e†a
= gcae†a
. (3.103)
Using ĝ−1f |1i = f |1i it follows that
ĝe†a1
e†a2
···e†ap
f |1i = ĝe†a1
ĝ−1
ĝe†a2
ĝ−1
···ĝe†ap
ĝ−1
f |1i
= e†b1
···e†bp
gb1a1 ···gbpapf |1i . (3.104)
✷
Using the metric operator (3.98) we can finally write down the explicit action of the
discrete Hodge star operator on cubic graphs with arbitrary discrete metrics:
Hodge star on cubic graphs for general metrics. Combination of (3.89) and
(3.79) yields
⋆ĝ e†a1
e†a2
···e†ap
αa1a2···ap |1i
=
1
(D − p)!
ǫa1···aD
e†bp+1
···e†bD
gap+1bp+1 ···gaDbD
T~ ep+1+···~ eD
[αa1a2···ap]
1
dV
|1i .
(3.105)
For dV =
p
det(g) (cf. (3.72)) this is seen to be formally the same equation as in the
continuum theory, the only difference being the shift T~ ep+1+···~ eD
of the coefficient function.
This lattice effect vanishes in the continuum.
Component form of the modified inner product Two p forms α = [d,Xµ1]···[d,Xµp
]αµ1···µp |1i
and β = [d,Xν1]···[d,Xνp
]αν1···νp |1i have ordinary inner product
hα|βi =
Z
δµ1ν1
···δµpνp
αµ1···µpβν1···νp dV (3.106)
and ĝ-modified inner product
hα|ĝ−1
|βi =
Z
(g−1
)µ1ν1
···(g−1
)µpνp
αµ1···µpβν1···νp dV (3.107)
(summation over upper and lower indices is implicit).
When dV is chosen such that a proper volume form exists, so that dV =
p
det(g) (3.72)
then equation (3.107) is of the same form as the Hodge inner product of the continuum
theory. Note that this requires that the components of the p forms entering the product
are written on the right and with respect to the preferred coordinates (3.93).
– 46 –3.6 p-vector fields
The space Ω(A,d) is dual to the space
Ω∗
(A) =
M
p
Ω∗
p(A)
(3.108)
of p-vector fields. If we suggestively write ∂ ∂ ∂ ∂µ for the element dual to dXµ (where Xµ are
the preferred coordinates (3.93)) then
Ω∗
p(A) := span
n
vµ1µ2···µp
∂ ∂ ∂ ∂µ1∂ ∂ ∂ ∂µ2 ···∂ ∂ ∂ ∂µp|vµ1···µp
= v[µ1···µp]
∈ A
o
. (3.109)
Given any p-form α and a p-vector v with components
α := dXµ1
dXµ2
···dXµp
αµ1µ2···µp
v := vµ1µ2···µp
∂ ∂ ∂ ∂µ1∂ ∂ ∂ ∂µ2 ···∂ ∂ ∂ ∂µp (3.110)
the evaluation of α ∈ Ω on v ∈ Ω∗ can be defined by
Ωp
× Ω∗
p −→ A
α(v) := αµ1···µpvµ1···µp
(3.111)
and
Ωp
× Ω∗
p −→ I C
Z
α(v) =
Z
αµ1···µpvµ1···µp
, (3.112)
using the integral (3.12).
In the presence of a metric as in §3.5 (p.44) both spaces can be identified using the
invertible map
∗ĝ : Ω → Ω∗
(3.113)
defined by
∗ĝ dXµ1
dXµ2
···dXµp
αµ1µ2···µp

:= dV αµ1µ2···µp(g−1
)µ1ν1
(g−1
)µ2ν2
···(g−1
)µpνp
∂ ∂ ∂ ∂ν1∂ ∂ ∂ ∂ν2 ···∂ ∂ ∂ ∂νp
∗ĝ
−1
vµ1µ2···µp
∂ ∂ ∂ ∂µ1∂ ∂ ∂ ∂µ2 ···∂ ∂ ∂ ∂µp

:= dXν1
dXν2
···dXνp
vµ1µ2···µp
gµ1ν1gµ2ν2 ···gµpνp
1
dV
. (3.114)
Due to (3.106) the evaluation map of forms on vectors is then related to the inner
product h·|·i (3.13) on forms by
Z
α(v) = hα | ∗ĝ
−1
viĝ
hα|βiĝ =
Z
α(∗ĝβ) . (3.115)
Using ∗ĝ the difference between p-forms and p-vectors becomes immaterial and for
α ∈ Ωp and v ∈ Ωp we define for notational convenience:
hα|vi :=
1
p!
α|∗ĝ
−1
v ĝ
. (3.116)
(Both sides are of course independent of the metric.)
– 47 –3.7 p-chains and the boundary operator
We can identify discrete p-vector fields with p-chains of the discrete complex. For instance
δ{~ x}∂ ∂ ∂ ∂a describes the 1-chain [~ x,~ x +~ ea], and so on.
To emphasize this fact we introduce the familiar notation
Z
S
α :=
1
p!
Z
α(S) = hα|Si (3.117)
for the integral of the p-form (p-cochain) α over the p-vector (p-chain) S = Sµ1···µp
∂ ∂ ∂ ∂µ1 ···∂ ∂ ∂ ∂µp.
Operators on chains and transposition. Every operator A : Ω → Ω corresponds
to an operator At : Ω∗ → Ω∗, called the transpose of A, which is defined by
hAα|Si := α|At
S . (3.118)
(Obviously the operation (·)t is independent of the metric.) By writing
Z
S
Aα =
1
p!
Z
(Aα)(S)
=
1
p!
hAα|∗ĝ
−1
Siĝ
=
1
p!
hα|A†ĝ∗ĝ
−1
Siĝ
=
1
p!
Z
α

∗ĝA†ĝ∗ĝ
−1
S

dV (3.119)
one finds
A†ĝ = ∗ĝ
−1
◦ At
◦ ∗ĝ . (3.120)
The boundary operator. In particular
∂ := dt
(3.121)
is the boundary operator that maps any chain to its boundary. In our formulation its
nilpotency is inherited from that of d:
∂2
= 0. (3.122)
As a special case of (3.119) Stoke’s theorem is obtained:
Z
S
dα =
Z
∂S
α. (3.123)
The explicit action of ∂ is found by applying the various definitions:
∂ δ{~ x}∂ ∂ ∂ ∂a1 ···∂ ∂ ∂ ∂ap+1

(3.120)
= ∗ĝd†ĝ∗ĝ
−1
δ{~ x}∂ ∂ ∂ ∂a1 ···∂ ∂ ∂ ∂ap+1

– 48 –∂ = −
∂ = + − −
Figure 8: Boundaries.
The action (3.124), (3.70) of the boundary operator ∂ (3.121) is illustrated. The square
at the top depicts some part of a cubic complex as in figure 1. The second and third line
indicate the boundary of an elementary edge and of an elementary plaquette, respectively.
(3.114)(3.98)
= ∗ĝ ĝ d†
e†a1
···e†ap+1
δ{~ x}
1
dV (~ x)
|1i
(3.64)
= ∗ĝ ĝ
(−1)p
ǫp!
X
π
σ(π)e†aπ(1)
···e†aπ(p)

δ{~ x} − δn
~ x−~ eaπ(p+1)
o
dV (~ x)
dV

~ x −~ eaπ(p+1)


 1
dV (~ x)
|1i
(3.114)
=
(−1)p
ǫp!
X
π
σ(π)

δ{~ x} − δn
~ x−~ eaπ(p+1)
o

∂ ∂ ∂ ∂aπ(1)
···∂ ∂ ∂ ∂aπ(p)
. (3.124)
This in particular demonstrates how the various occurences of ĝ and dV in the expres-
sion ∗ĝd†ĝ∗ĝ
−1 mutually cancel. Examples of how (3.124) looks like in terms of elementary
edges were given (in dual form) in equation (3.70), cf. figure 8.
4. Flat topologically hypercubic complexes
The above considerations show that a thorough understanding of N = 2 differential calculus
on flat cubic graphs with self-adjoint functions is the basis for the study of the more general
case.
So consider the situation where the structure functions (2.113) are of the trivial form
Cij
k
!
= δij
δi
k (4.1)
corresponding to a cubic graph with ea
i = δj
a (and hence e†i
= ĉ†i
). In this case we have
in particular
h
Xi
,ĉ†j
i
= −ǫδij
ĉ†i
– 49 –
Xi
,ĉj

= +ǫδij
ĉi
(4.2)
and
n
e†i
,e†j
o
= 0 (4.3)
n
e†a
,eb
o
!
= ηab
. (4.4)
## 4.1 Partial derivative operator
Define the discrete version of the partial derivative operator ∂µ in analogy with (??) by
∂i := −
n
d,
h
d†
,Xi
io
= {d,ĉi} . (4.5)
We need to find the commutation relations of ∂i with the ĉ†i
and ĉi
. First of all we have
h
∂i,ĉ†j
i
=
h
{d,ĉi},ĉ†j
i
=
h
d,
n
ĉi,ĉ†j
oi
−
hn
d,ĉ†j
o
,ĉi
i
(4.4)
= 0. (4.6)
However the commutator with ĉi is ambiguous. All we know is that
[∂i,ĉj] = [{d,ĉi},ĉj]
= −[{d,ĉj},ĉi]
= −[∂j,ĉi] . (4.7)
But this implies that the above expression can only be non-vanishing if one singles out
certain planes, i.e. pairs of coordinate indices, in the discrete graph. In the case of trivial
flat geometry we instead expect “discrete isotropy” in the sense that
[∂i,ĉj]
!
∝ δij . (4.8)
This implies
⇒ [∂i,ĉj] = 0. (4.9)
It follows that
[∂i,∂j] = 0. (4.10)
But the commutator of ∂i with the coordinate functions has a lattice correction:15

∂i,Xj

=

d,

ei,Xj

+

d,Xj

,ei
=
n
d,−ǫδj
i ei
o
+
n
e†j
,ei
o
= δj
i (1 − ǫ∂i) . (4.13)
15
The canonical commutation relation is instead satisfied by the modified coordinate
X̃i
:= Xi
∞ X
n=0
(ǫ∂i)n
– 50 –Using this it is possible to show that d may be represented in analogy to the continuum
case by
d = ĉ†i
∂i . (4.14)
To prove this it suffices to check that the operator on the right has the correct grading and
is nilpotent (which is, due to (4.3), (4.6) and (4.10), clearly the case) and that it has the
correct commutator with the coordinates:16
h
ĉ†i
∂i,Xj
i
= ĉ†i 
∂i,Xj

+
h
ĉ†i
,Xj
i
∂i
(4.2)(4.13)
= ĉ†j
(1 − ǫ∂j) + ǫĉ†j
∂j (no sum over j)
= ĉ†ν
(2.117)
=

d,Xj

. (4.16)
All these relations have adjoint analogs:
h
∂†
i ,ĉ†j
i
= 0
h
∂†
i ,ĉj
i
= 0
h
∂†
i ,Xj
i
= −δj
i

1 − ǫ∂†
i

d†
= ĉi
∂†
i . (4.17)
An important point is that ∂i and ∂†
i are not proportional:
∂†
i 6= −∂i . (4.18)
This is because

(−∂i),Xj
 (4.13)
= −δj
i (1 + ǫ(−∂i)) , (4.19)
which would be in conflict with (4.17).
= Xi
+ ǫXi
∂i + ǫXi
∂i∂i + ··· (no sum over i). (4.11)
Namely
"
∂i,Xj
∞ X
n=0
(ǫ∂j)n
#
= δj
i
∞ X
n=0
(1 − ǫ∂i)(ǫ∂i)n
= δj
i . (4.12)
This seems to be an example of umbral calculus, as discussed in [20].
16
Alternatively write
h
ĉ†i
{d,ĉi},Xj
i (4.2)
= ĉ†i
nh
d,Xj
i
,ĉi
o
= ĉ†i
n
ĉ†j
,ĉi
o
(4.4)
= ĉ†j
. (4.15)
– 51 –Furthermore we have
∂i ± ∂†
i =
n
d,
h
d†
,Xi
io
∓
n
d†
,[d,Xi]
o
=
n
d,
h
d†
,Xi
io
±
n
d,
h
d†
,Xi
io
∓
hn
d,d†
o
,Xi
i
(4.20)
The antihermitian partial derivative akin to that of the continuum limit is therefore
1
2

∂i − ∂†
i

= −
1
2
hn
d,d†
o
,Xi
i
. (4.21)
The operator
∂i + ∂†
i =
n
d,
h
d†
,Xi
io
+
n
d,
h
d†
,Xi
io
−
hn
d,d†
o
,Xi
i
(4.22)
vanishes in the continuum limit but is non-trivial due to a lattice correction in the discrete
case.
In order to understand this correction consider the commutator
h
∂µ,∂†
ν
i
. According
to the above commutation relations it commutes with ĉ†µ
, ĉµ. If we again assume discrete
isotropy in the sense that
h
∂i,∂†
j
i
∝ δij (4.23)
then this operator also commutes with the coordinate functions, since
hh
∂i,∂†
i
i
,Xi
i
=
h
∂i,ǫ∂†
i
i
+
h
−ǫ∂i,ǫ∂†
i
i
= 0. (4.24)
It should follow that the commutator is δij times some constant p:
h
∂i,∂†
j
i
= pδij . (4.25)
For the Laplace operator this implies
n
d,d†
o
=
n
ĉ†i
∂i,ĉi
∂†
i
o
= ∂†
i ∂i
+ p ĉ†i
ĉi . (4.26)
But of course, if there is a “vacuum” state |1i which is annihilated by both ∂i and ∂†
i
then
h
∂i,∂†
i
i
|1i = 0 implies p = 0.
Finally we note for later use that

1
2

∂i ± ∂†
i

,Xj

= δj
i

1 − ǫ
1
2

∂i ∓ ∂†
i

, (4.27)
and that in analogy to (4.11) “modified coordinates”
Xi
± := Xi
∞ X
n=0
(ǫ
1
2

∂i ∓ ∂†
i

)n
(no sum over i) (4.28)
can be defined, which satisfy

1
2
(∂i ± ∂i),Xj
±

= δj
i
∞ X
n=0

1 − ǫ
1
2

∂i ∓ ∂†
i

(ǫ
1
2

∂i ∓ ∂†
i

)n
= δj
i . (4.29)
– 52 –The derivative operator and finite differences. We want to determine (for flat cubic
complexes) the relation between the derivative operator ∂i defined by (4.5) and the forward
and backward difference quotients defined in (2.124) and (2.124).
Comparison of
[d,f] = (
←
∂if)

d,Xi

=

d,Xi

(
→
∂f) (4.30)
with
[d,f]
(4.14)
=

d,Xi

∂i,f

=

d,Xi

[∂i,f] +

d,Xi

,f

∂i
=
X
i

d,Xi

[∂i,f] + ǫ

d,Xi

(
→
∂if)∂i

(4.31)
and
[d,f] =

∂i

d,Xi

,f

= [∂i,f]

d,Xi

+ ∂i

d,Xi

,f

=
X
i
[∂i,f]

d,Xi

+ ǫ∂i ◦ (
←
∂if)

d,Xi

(4.32)
shows that
[∂i,f] = (
→
∂if)(1 − ǫ∂i)
= (1 − ǫ∂i)(
←
∂if). (4.33)
The adjoint of this is
h
∂†
i ,f
i
= −(
←
∂if)(1 − ǫ∂†
i ). (4.34)
That this makes sense can be checked by noting that
∂i f g |1i = [∂i,f] g |1i + f [∂i,g]|1i
(4.33)
= (
→
∂if)g|1i + f (
→
∂ig)|1i − ǫ(∂if)(
→
∂ig)|1i , (4.35)
and similarly
−∂†
i f g |1i = ((
←
∂if)g + f(
←
∂ig) + (
←
∂if)(
←
∂ig))|1i , (4.36)
which agrees with (2.121).
If
∂
†ĝ
i = ∂†
i (4.37)
– 53 –(which is the case for flat cubic complexes with cartesian preferred coordinates) this allows
to reproduce (3.67) and (3.68) by writing
d

d,Xi1

···

d,Xip

f |1i =

d,Xj

∂j

d,Xi1

···

d,Xip

f |1i
(4.6)
=

d,Xj
 
d,Xi1

···

d,Xip

[∂j,f]|1i
(4.33)
=

d,Xj
 
d,Xi1

···

d,Xip

(
→
∂jf)|1i (4.38)
and
d†ĝ

d,Xi1

···

d,Xip

f |1i = (
h
d†
,Xj
i
)†ĝ ∂†
j

d,Xi1

···

d,Xip

f |1i
= (

d,Xj

)†ĝ

d,Xi1

···

d,Xip
h
∂†
j,f
i
|1i
(4.34)
= −(

d,Xj

)†ĝ

d,Xi1

···

d,Xip

(
←
∂jf)|1i .(4.39)
Furthermore it follows that the Laplace-Beltrami operator
n
d,d†ĝ
o
= gµν
∂µ∂†
ν (4.40)
(on flat cubic complexes) acts componentwise as
n
d,d†
o
dXi1
···dXip
f = − dXi1
···dXip
gµν←
∂µ
→
∂ν f , (4.41)
where −gµν←
∂µ
→
∂ν is a discrete version of the flat wave operator.
This operator can be rewritten as
−gab←
∂a
→
∂b = −
1
2
gab ←
∂a
→
∂b +
←
∂b
→
∂a

(2.131)
= −
1
2
gab

T~ eb−~ ea
→
∂a
←
∂b +
←
∂b
→
∂a

= −
1
2
gab

1 + T~ eb−~ ea
→
∂a
←
∂b
= −
1
2
gcd
X
a,b

1 + T~ eb−~ ea

gca
gdb→
∂a
←
∂b . (4.42)
## 4.2 Diamond complexes
On every cubic complex there is a special metric operator ĝ = ĝG which is induced by the
graph operator (2.25) as follows:
Because of (2.106)
G =
1
ǫ
X
a
e†a
(4.43)
and hence
n
G,G†
o
=
D
ǫ2
(4.44)
– 54 –it follows that
ĝG :=
ǫ2
D

G†
G − GG†

=
ǫ2
D
h
G†
,G
i
=
ǫ2
D

G + G†

G − G†

(4.45)
is a valid metric operator, since it is invertible and satisfies
ĝ†
G = ĝG
grade(ĝG) = 0. (4.46)
This is furthermore the unique metric operator that can be construted from combinations
of G and G† alone.17
17
Due to the fact that the metric operator must be of grade 0 the building blocks need to be GG†
and
G†
G. Products of these produce nothing new, because

GG†

G†
G

= 0

G†
G

GG†

= 0

G†
G

G†
G

=
D
ǫ2
G†
G, (4.47)
and therefore only additive combinations remain. But the sum GG†
+G†
G is equal to a constant, so that
the only non-trivial combination is the one given above:
GG†
− G†
G. (4.48)
– 55 –In this sense the graph operator induces a metric on the cubic complex. Cubic com-
plexes equipped with this metric shall be called diamond complexes, for reasons that become
apparent below.
The graph operator singles out a direction on the discrete space. This can be made
manifest by introducing the coordinate
t :=
1
√
D
X1
+ X2
+ ··· + XD

. (4.49)
The graph operator is just the differential of this coordinate:18
G =
√
D
ǫ
[d,t] . (4.51)
and the metric operator can alternatively be written as
ĝG = [d,t]
h
d†
,t
i
−
h
d†
,t
i
[d,t]
= γ̂t
−γ̂t
+ , (4.52)
where γ̂t
± = [d,t] ±

t,d†

.
When further coordinates ri orthogonal to t are introduced one finds
ĝG dtdri1
···drin
= − dtdri1
···drin
ĝG dri1
···drin
= + dri1
···drin
(4.53)
and comparison with (3.97) reveals that ĝG gives a metric with nonvanishing components
gtt = −1
grirj = δij
, (4.54)
i.e. a flat Lorentzian metric with t being a timelike coordinate. In other words, the direction
singled out by the graph operator is time.
Discrete models of spacetime in the form of cubic lattices with time running along
the main diagonal of the cubes are sometimes addressed as ”diamond lattices” in the
literature. That’s why we refer to cubic complexes with ĝG being the metric operator as
diamond complexes.
Causal sets. The above shows that the graph operator singles out a causal structure
on our discrrete space. We could more generally consider scalar multiples of the preferred
metric operator (4.45):
ĝG(V ) := V (x)ĝG . (4.55)
18
In the set of preferred coordinates of the cubic complex the graph operator can obviously be written as
G =
1
ǫ

d,X1

+

d,X2

+ ··· +
h
d,XD
i
G†
= −
1
ǫ
h
d†
,X1
i
+
h
d†
,X2
i
+ ··· +
h
d†
,XD
i
. (4.50)
– 56 –These describe geometries where each discrete lightcone is identified by ĝG and carries a
spacetime volume given by V (x). This is the data used in causal set theory [24] to describe
spacetime geometry. We here see that the formalism used here, with the preferred role
that the graph operator G plays in it, naturally makes contact with concepts known from
causal set theory.
## 4.3 Clifford algebra on diamond complexes
Let
γ̂a
± = [d,Xa
] ± [d,Xa
]†
= [d,Xa
] ±
h
Xa
,d†
i
= e†a
± ea
(4.56)
be the usual Clifford generators with respect to the Euclidean metric which satisfy
n
γ̂a
±,γ̂b
±
o
= ±2δab
n
γ̂a
±,γ̂b
∓
o
= 0 (4.57)
and let
γ̂a
ĝ± := [d,Xa
] ± [d,Xa
]†ĝ
= e†a
± ĝea
ĝ−1
(4.58)
be the Clifford generators asscoiated with the metric induces by the metric operator ĝ.
We can split these into the timelike generators
γ̂t
± :=
1
√
D
γ̂1
± + ··· + γ̂D
±

γ̂t
ĝG± :=
1
√
D
γ̂1
ĝG± + ··· + γ̂D
ĝG±

(4.59)
and the spacelike ones
γ̂
a−t/
√
D
± := γ̂a
± −
1
√
D
γ̂t
±
γ̂
a−t/
√
D
ĝG± := γ̂a
ĝG± −
1
√
D
γ̂t
ĝG± , (4.60)
so that in particular

γ̂t
±,γ̂t
± = ±2
n
γ̂
a−t/
√
D
± ,γ̂t
±
o
= 0. (4.61)
– 57 –For the Lorentzian Clifford generators one finds19
γ̂t
ĝG± = γ̂t
∓
γ̂
a−t/
√
D
ĝG± = γ̂
a−t/
√
D
± (4.62)
and hence they have Lorentzian signature

γ̂t
ĝG±,γ̂t
ĝG± = ±2(−1)
n
γ̂
a−t/
√
D
ĝG± ,γ̂t
ĝG±
o
= 0 (4.63)
as expected.
## 4.4 Non-commutative coordinates on diamond complexes
Adjoint of the coordinates. With the Clifford algebra at hand it is now easy to
determine the adjoint (Xa)†ĝ of the preferred coordinate functions Xa with respect to h·|·iĝ.
One finds
Xa
− (Xa
)†ĝ = ǫ
2
√
D + 1
D
J
a−t/
√
D,t
ĝG
, (4.64)
where
J
a−t/
√
D,t
ĝG
:=
1
2
p
1 + 1/D

γ̂
a−t/
√
D
ĝG+ γ̂t
ĝG+ − γ̂
a−t/
√
D
ĝG− γ̂t
−

(4.65)
is the Clifford algebra generator of Lorentz boosts along the spatial direction Xa−t/
√
D.
Proof: Using
h
γ̂a
±,Xb
i
= ǫδab
γ̂a
∓ . (4.66)
19
The ĝG-adjoint of e†t
is
ĝ et
ĝ = γ̂t
−γ̂t
+
1
2
γ̂t
+ − γ̂t
−

γ̂t
−γ̂t
+
= −
1
2
γ̂t
+ − γ̂t
−

= −et
and that of e†a
− 1 √
D
e†t
is
ĝ

ea
−
1
√
D
et

ĝ = γ̂t
−γ̂t
+
1
2

γ̂a
+ − γ̂a
− −
1
√
D
γ̂t
+ +
1
√
D
γ̂t
−

γ̂t
−γ̂t
+
=
1
2

−γ̂t
+γ̂a
+γ̂t
+ − γ̂t
−γ̂a
−γ̂t
− +
1
√
D
γ̂t
+ −
1
√
D
γ̂t
−

=
1
2

γ̂a
+ − γ̂a
− −
1
√
D
γ̂t
+ +
1
√
D
γ̂t
−

= ea
−
1
√
D
et
.
– 58 –and
ĝ =
1
D
γ̂1
− + ··· + γ̂D
−

γ̂1
+ + ··· + γ̂D
+

(4.67)
one finds the commutator
1
ǫ
[ĝG,Xa
] =
1
D
γ̂1
− + ··· + γ̂D
−

γ̂a
− + γ̂a
+ γ̂1
+ + ··· + γ̂D
+

=
1
D
X
b6=a

γ̂a
+γ̂b
+ − γ̂a
−γ̂b
−

=
1
2D
X
b
h
γ̂a
+,γ̂b
+
i
−
h
γ̂a
−,γ̂b
−
i
=
1
2
√
D

γ̂a
+,γ̂t
+

−

γ̂a
−,γ̂t
−

=
1
2
√
D

γ̂a
+ −
1
√
D
γ̂t
+,γ̂t
+

−

γ̂a
− −
1
√
D
γ̂t
−,γ̂t
−

=
1
√
D

γ̂a
+ −
1
√
D
γ̂t
+

γ̂t
+ −

γ̂a
− −
1
√
D
γ̂t
−

γ̂t
−

(4.68)
and hence
(Xa
)†ĝ = ĝG Xa
ĝG
= Xa
+ [ĝG,Xa
]ĝG
(4.68)
= Xa
+ ǫ
1
√
D

γ̂a
+ −
1
√
D
γ̂t
+

γ̂t
+ −

γ̂a
− −
1
√
D
γ̂t
−

γ̂t
−

γ̂t
−γ̂t
+
= Xa
− ǫ
1
√
D

γ̂a
+ −
1
√
D
γ̂t
+

γ̂t
− −

γ̂a
− −
1
√
D
γ̂t
−

γ̂t
+

(4.69)
(4.62)
= Xa
− ǫ
1
√
D

γ̂
a−t/
√
D
ĝG+ γ̂t
ĝG+ − γ̂
a−t/
√
D
ĝG− γ̂t
ĝG−

. (4.70)
✷
(Anti)-self adjoint part of the coordinates. The ĝG-hermitian and ĝG-anti-
hermitian part of the coordinates is
sXa
:=

X+
+ (Xa
)†ĝ

/2
aXa
:=

X+
− (Xa
)†ĝ

/2. (4.71)
These have the following commutators:
h
sXa
,sXb
i
= −
ǫ2
2D

γ̂a
+γ̂b
+ − γ̂a
−γ̂b
−

h
aXa
,aXb
i
=
ǫ2
2D

γ̂a
+γ̂b
+ − γ̂a
−γ̂b
−

h
aXa
,sXb
i
= −ǫ2 1
√
D
(δab
−
2
D
)

γ̂a
+ + γ̂b
+

γ̂t
+ −

γ̂a
− + γ̂b
−

γ̂t
−

+ ǫ2 8
D2
. (4.72)
– 59 –Proof: Because of

Xa,Xb

= 0 and

(Xa)†ĝ,(Xb)†ĝ

= 0 the only non-trivial part of
these commutators is
h
ĝGXa
ĝG,Xb
i (4.69)
= −ǫ2 1
√
D

(δab
−
1
D
)γ̂a
−γ̂t
− +
1
√
D
γ̂
a−t/
√
D
+ γ̂b
+

+ǫ2 1
√
D

(δab
−
1
D
)γ̂a
+γ̂t
+ +
1
√
D
γ̂
a−t/
√
D
− γ̂b
−

= −ǫ2 1
√
D

(δab
−
1
D
)γ̂a
−γ̂t
− +
1
√
D
γ̂a
+γ̂b
+ −
1
D
γ̂t
+γ̂b
+

+ǫ2 1
√
D

(δab
−
1
D
)γ̂a
+γ̂t
+ +
1
√
D
γ̂a
−γ̂b
− −
1
D
γ̂t
−γ̂b
−

. (4.73)
Antisymmetrizing yields
h
ĝGXa
ĝG,Xb
i
−
h
ĝGXb
ĝG,Xa
i
= −ǫ2 1
√
D

−
1
D
γ̂a
−γ̂t
− +
1
√
D
γ̂a
+γ̂b
+ −
1
D
γ̂t
+γ̂b
+

+ǫ2 1
√
D

−
1
D
γ̂a
+γ̂t
+ +
1
√
D
γ̂a
−γ̂b
− −
1
D
γ̂t
−γ̂b
−

+ǫ2 1
√
D

−
1
D
γ̂b
−γ̂t
− +
1
√
D
γ̂b
+γ̂a
+ −
1
D
γ̂t
+γ̂a
+

−ǫ2 1
√
D

−
1
D
γ̂b
+γ̂t
+ +
1
√
D
γ̂b
−γ̂a
− −
1
D
γ̂t
−γ̂a
−

= −ǫ2 1
√
D

(−
1
D
)γ̂a
−γ̂t
− +
1
√
D
γ̂a
+γ̂b
+ +
1
D
γ̂b
+γ̂t
+

+ǫ2 1
√
D

(−
1
D
)γ̂a
+γ̂t
+ +
1
√
D
γ̂a
−γ̂b
− +
1
D
γ̂b
−γ̂t
−

+ǫ2 1
√
D

(−
1
D
)γ̂b
−γ̂t
− −
1
√
D
γ̂a
+γ̂b
+ +
1
D
γ̂a
+γ̂t
+

−ǫ2 1
√
D

(−
1
D
)γ̂b
+γ̂t
+ −
1
√
D
γ̂a
−γ̂b
− +
1
D
γ̂a
−γ̂t
−

= −ǫ2 2
D

γ̂a
+γ̂b
+ − γ̂a
−γ̂b
−

and symmetrizing gives
h
ĝGXa
ĝG,Xb
i
+
h
ĝGXa
ĝG,Xb
i
= −ǫ2 1
√
D

(δab
−
1
D
)γ̂a
−γ̂t
− −
1
D
γ̂t
+γ̂b
+

+ǫ2 1
√
D

(δab
−
1
D
)γ̂a
+γ̂t
+ −
1
D
γ̂t
−γ̂b
−

−ǫ2 1
√
D

(δab
−
1
D
)γ̂b
−γ̂t
− −
1
D
γ̂t
+γ̂a
+

+ǫ2 1
√
D

(δab
−
1
D
)γ̂b
+γ̂t
+ −
1
D
γ̂t
−γ̂a
−

= −ǫ2 1
√
D

(δab
−
1
D
)γ̂a
−γ̂t
− +
1
D
γ̂b
+γ̂t
+

– 60 –+ǫ2 1
√
D

(δab
−
1
D
)γ̂a
+γ̂t
+ +
1
D
γ̂b
−γ̂t
−

−ǫ2 1
√
D

(δab
−
1
D
)γ̂b
−γ̂t
− +
1
D
γ̂a
+γ̂t
+

+ǫ2 1
√
D

(δab
−
1
D
)γ̂b
+γ̂t
+ +
1
D
γ̂a
−γ̂t
−

+ǫ2 8
D2
= −ǫ2 1
√
D

(δab
−
2
D
)γ̂a
−γ̂t
−

+ǫ2 1
√
D

(δab
−
2
D
)γ̂a
+γ̂t
+

−ǫ2 1
√
D

(δab
−
2
D
)γ̂b
−γ̂t
−

+ǫ2 1
√
D

(δab
−
2
D
)γ̂b
+γ̂t
+

+ǫ2 8
D2
= −ǫ2 1
√
D
(δab
−
2
D
)

−γ̂a
−γ̂t
− + γ̂a
+γ̂t
+ − γ̂b
−γ̂t
− + γ̂b
+γ̂t
+

+ ǫ2 8
D2
.
This has the following important implication: We started with the differential calculus
of a commutative algebra A of functions on an enumerable set. The introduction of a
Lorentzian metric required us to use an inner product h·|·iĝG
on (the vector space of)
this algebra with respect to which elements of A are not self-adjoint. We may switch to
the self-adjoint component of these coordinates and regard this as a new set of modified
coordinates. As shown by (4.72) the algebra of these modified coordinates is however no
longer commutative.
## 4.5 The 1 + 1 dimensional diamond complex.
The non-relativistic limit of the 1+1 dimensional diamond complex has already been dis-
cussed in §2.9 (p.26).
The volume form on every diamond complex can be set to
|volĝi = dX1
dX2
···dXD
(4.74)
by choosing c = −1 in (3.72).
In the 1+1 dimensional case it is convenient and conventional to use indices in {+,−},
so we identify
X+
:= X1
X−
:= X2
. (4.75)
A general element of Ω is
|αi := α(0)
+ dXµ
α(1)
µ + dX1
dX2
α(2)
E
. (4.76)
– 61 –We now list the action of various operators on such states. First of all the metric
operator acts as
ĝG |αi = |αi
ĝG dX1
α = − dX2
α
ĝG dX2
α = − dX1
α
ĝG dX1
dX2
α = − dX1
dX2
α . (4.77)
The Hodge star operator associated with the unmodified inner product h·|·i gives
⋆ |αi = αdX1
dX2
⋆ dX1
α = αdX2
⋆ dX2
α = − αdX1
⋆ dX1
dX2
α = |αi (4.78)
or equivalently
⋆ |αi = dX1
dX2
T~ e1+~ e2
[α]
⋆ αdX1
= dX2
T~ e1+~ e2
[α]
⋆ αdX2
= − dX1
T~ e1+~ e2
[α]
⋆ αdX1
dX2
= |T~ e1+~ e2
[α]i . (4.79)
Inverting these relations gives the action of ⋆−1 :
⋆−1
|αi = T−~ e1−~ e2
[α]dX1
dX2
⋆−1
dX1
α = − T−~ e1−~ e2
[α]dX2
⋆−1
dX2
α = T−~ e1−~ e2
[α]dX1
⋆−1
dX1
dX2
α = |T−~ e1−~ e2
[α]i . (4.80)
Acting on this with d
d ⋆−1
|αi = 0
d ⋆−1
dX1
α = − T−~ e1−~ e2
[
←
∂1α]dX1
dX2
d ⋆−1
dX2
α = − T−~ e1−~ e2
[
←
∂2α]dX1
dX2
d ⋆−1
dX1
dX2
α = T−~ e1−~ e2
[
←
∂1α]dX1
+ T−~ e1−~ e2
[
←
∂2α]dX2
(4.81)
and then again with ⋆
⋆d ⋆ −1
|αi = 0
⋆d ⋆ −1
dX1
α = −
←
∂1α
⋆d ⋆ −1
dX2
α = −
←
∂2α
⋆d ⋆ −1
dX1
dX2
α = dX2 ←
∂1α − dX1 ←
∂2α (4.82)
– 62 –gives, up to a sign, the “matrix elements” of the Euclidean d†:
d†
|αi = 0
d†
dX1
α = −
←
∂1α
d†
dX2
α = −
←
∂2α
d†
dX1
dX2
α = dX1 ←
∂2α − dX2 ←
∂1α . (4.83)
Those of d are of course
d|αi = dX1
(
→
∂1α) + dX2
(
→
∂2)
d dX1
α = − dX1
dX2 →
∂2α
d dX2
α = dX1
dX2 →
∂1α
d dX1
dX2
α = 0. (4.84)
This implies
d†
d|αi = −(
←
∂1
→
∂1 +
←
∂2
→
∂2)α(0)
+ dX1 ←
∂2(
→
∂1α
(1)
2 −
→
∂2α
(1)
1 ) − dX2 ←
∂1(
→
∂1α
(1)
2 −
→
∂2α
(1)
1 )
E
(4.85)
and
dd†
|αi = −dX1
(
→
∂1
←
∂1α
(1)
1 +
→
∂1
←
∂2α
(1)
2 ) − dX2
(
→
∂2
←
∂1α
(1)
1 +
→
∂2
←
∂2α
(1)
2 ) − dX1
dX2
(
→
∂1
←
∂1 +
→
∂2
←
∂2)α(2)
E
.
(4.86)
Therefore the action of the Euclidean Laplace-Beltrami operator is
n
d,d†
o
|αi
= − (
←
∂1
→
∂1 +
←
∂2
→
∂2)α(0)
+ dX2
(
←
∂1
→
∂1 +
→
∂2
←
∂2)α
(1)
2 + dX1
(
→
∂1
←
∂1 +
←
∂2
→
∂2)α
(1)
1 + dX1
dX2
(
→
∂1
←
∂1α(2)
+
→
∂2
←
∂2α(2)
)
E
+ dX1
(
←
∂2
→
∂1 −
→
∂1
←
∂2)α
(1)
2 + dX2
(
←
∂1
→
∂2 −
→
∂2
←
∂1)α
(1)
2
E
| {z }
(2.130)
= 0
, (4.87)
i.e. every component of α is acted on with the discrete Euclidean wave operator
(
←
∂1
→
∂1 +
←
∂2
→
∂2).
Now turn to the Lorentzian objects:
The action of the true Hodge star operator is determined by ⋆ĝ = ĝG ◦ ⋆ (3.89):
⋆ĝ |αi = − dX1
dX2
T~ e1+~ e2
[α]
⋆ĝ αdX1
= − dX1
T~ e1+~ e2
[α]
⋆ĝ αdX2
= dX2
T~ e1+~ e2
[α]
⋆ĝ αdX1
dX2
= |T~ e1+~ e2
[α]i . (4.88)
– 63 –Its inverse therefore is
⋆−1
ĝ |αi = T−~ e1−~ e2
[α]dX1
dX2
⋆−1
ĝ dX1
α = − T−~ e1−~ e2
[α]dX1
⋆−1
ĝ dX2
α = T−~ e1−~ e2
[α]dX2
⋆−1
ĝ dX1
dX2
α = −|T−~ e1−~ e2
[α]i . (4.89)
Acting again with d
d ⋆−1
ĝ |αi = 0
d ⋆−1
ĝ dX1
α = T−~ e1−~ e2
[
←
∂2α]dX1
dX2
d ⋆−1
ĝ dX2
α = T−~ e1−~ e2
[
←
∂1α]dX1
dX2
d ⋆−1
ĝ dX1
dX1
α = − T−~ e1−~ e2
[
←
∂1α]dX1
− T−~ e1−~ e2
[
←
∂2α]dX2
(4.90)
and then with ⋆ĝ
⋆ĝ d ⋆−1
ĝ |αi = 0
⋆ĝ d ⋆−1
ĝ dX1
α =
←
∂2α
⋆ĝ d ⋆−1
ĝ dX2
α =
←
∂1α
⋆ĝ d ⋆−1
ĝ dX1
dX2
α = dX1 ←
∂1α − dX2←
∂2α (4.91)
yields the Lorentzian d†ĝ:
d†ĝ |αi = 0
d†ĝ dX1
α =
←
∂2α
d†ĝ dX2
α =
←
∂1α
d†ĝ dX1
dX2
α = dX2←
∂2α − dX1 ←
∂1α . (4.92)
This implies
d†ĝ d|αi = (
←
∂2
→
∂1 +
←
∂1
→
∂2)α(0)
+ dX2 ←
∂2(
→
∂1α
(1)
2 −
→
∂2α
(1)
1 ) − dX1 ←
∂1(
→
∂1α
(1)
2 −
→
∂2α
(1)
1 )
E
(4.93)
and
dd†ĝ |αi = dX1 →
∂1(
←
∂2α
(1)
1 +
←
∂1α
(1)
2 ) + dX2 →
∂2(
←
∂2α
(1)
1 +
←
∂1α
(1)
2 ) + dX1
dX2
→
∂1
←
∂2α(2)
+
→
∂2
←
∂1α(2)
E
.
(4.94)
Therefore the Lorentzian Laplace-Beltrami operator atcs as
n
d,d†ĝ
o
|αi
= (
←
∂2
→
∂1 +
←
∂1
→
∂2)α(0)
+ dX1
(
←
∂1
→
∂2 +
→
∂1
←
∂2)α
(1)
1 + dX2
(
←
∂2
→
∂1 +
→
∂2
←
∂1)α
(1)
2 + dX1
dX2 →
∂1
←
∂2 +
→
∂2
←
∂1

α(2)
E
,
(4.95)
– 64 –i.e. by multiplying every component by the Lorentzian wave operator
←
∂2
→
∂1 +
←
∂1
→
∂2. Due
to (2.130) all the
←
∂a and
→
∂b mutually commute and hence the general solution to the
Lorentzian wave equation is just as in the continuum a superposition of “left-moving” and
“right moving” waves:
(
←
∂2
→
∂1 +
←
∂1
→
∂2)f = 0 ⇔ f(~ x) = f+ X+

+ f− X−

. (4.96)
– 65 –5. Lattice Yang-Mills and fermions
## 5.1 Lattice Yang-Mills theory
All the previous results generalize straightforwardly to the case where the underlying func-
tion algebra is the product of that generated by

δ{x} x
with any other (possibly noncom-
mutative) algebra G, where the algebra product is (δ{x}⊗gx)(δ{y}⊗gy) = (δ{x}δ{y} ⊗gxgy),
if we decree that elements of G commute with d: For instance a typical elementary edge
then looks like
(δ{x} ⊗ gx)

d,(δ{y} ⊗ gy)

= (δ{x} ⊗ gxgy)

d,(δ{y} ⊗ 1)

:= (gxgy)δ{x}

d,δ{y}

:= δ{x}

d,δ{y}

(gxgy). (5.1)
Here the first line is a condition on d while the last two lines are just definition of notation.
In order to adapt the integral to this new algebra we need to have some map
tr : G → I C. (5.2)
Using this map the integral (3.12) is generalized to
Z
A dV := trA(~ x) dV (~ x) , (5.3)
where the notation should be self-explanatory.
One needs furthermore to define the adjoint of group-valued 0-forms. With the simple
U(1) example in mind and using hindsight it is clear that we need
g†
= g−1
. (5.4)
As the notation suggest, an important special case is that where G is a group algebra.
In order to see how the discrete version of covariant derivative operators with respect
to some group bundle should look like, consider for a moment G to be the algebra of
N × N matrices for some N. In the continuum the covariant derivative would be d+ A =
d+Aµdxµ, where Aµ is a matrix-valued function. But Aµ should take values in the tangent
space of G, not in G itself, whereas by the above any discrete 1-form is necessarily G-valued.
This is resolved as follows: The covariant derivative of any p-form B is [d + A,B]ι. For
well behaved graphs we may rewrite this using the G-generalized graph operator G which
is simply obtained from that in §2.3 (p.9) by setting all the G coefficients to unity:
[d + A,B]ι
(2.31)
= [G + A,B]ι . (5.5)
But now
G + A
(2.106)
=
X
µ

1
ǫ
e†µ
+ Aµe†µ

=
1
ǫ
X
µ
(1 + ǫAµ)e†µ
(5.6)
– 66 –and we see that G+A is just the infinitesimal holonomy of A along ~ eµ
. But since the holon-
omy is G-valued this suggests that the correct discrete version of the covariant derivative
is
dAB := [H,B] , (5.7)
where H is the discrete G-valued 1-form which assigns the G-holonomy Hµ(~ x) in question
to every edge δ{~ x,~ x+~ eµ
}.
In particular the Yang-Mills field strength F is now just the square of H:
dAA →
1
2
[H,H]ι
= H2
. (5.8)
It should be noted that even though H is a 1-form, its square does in general not vanish,
as it does in the continuum (cf. (2.136)). The non-commutativity precisely produces the
desired field strength, by the above reasoning. With
H =
X
~ x
Hµ(~ x)δ{~ x,~ x+~ eµ
} (5.9)
we find (on cubic graphs) that
H2
= (Hµ(~ x)Hν(~ x +~ eµ
) − Hν(~ x)Hµ(~ x +~ eν
))δ{~ x,~ x+~ eµ
,~ x+~ eµ
+~ eν
} , (5.10)
which is, just as expected, the two form that assigns to every plaquette the difference of
holonomies around that plaquette.
It is now easy to write down the general action SYM for G-Yang-Mills theory on the
discrete space:
SYM = H2
|H2
=
Z
tr

H†2
H2

S
. (5.11)
Note that this action is defined for arbitrary background metrics.
It is maybe remarkable that the non-commutativity of 0-forms and 1-forms on the
lattice drastically simplifies the notion of gauge covariant derivative to a simple algebraic
porduct of the gauge holonomy 1-form with itself. The discrete gauge theory is in this sense
conceptually actually simpler than the continuum theory. In order to illustrate the relevant
mechanism in more detail let us restrict attention to a single plaquette as illustrated in
figure 9 and work out the value of H2 on that plaquette in full detail.
For notational simplicity we assume that the holonomy along any of the 4-edges is
obtained from a gauge connection which is constant along that edge. Then the holonomy
1-form reads
H = H1(~ x)δ{~ x,~ y1} + H1(~ y2)δ{~ y2,~ z} + H2(~ x)δ{~ x,~ y2} + H2(~ y1)δ{~ y1,~ z}
= exp(ǫA1(~ x))δ{~ x,~ y1} + exp(ǫA1(~ y2))δ{~ y2,~ z} + exp(ǫA2(~ x))δ{~ x,~ y2} + exp(ǫA2(~ y1))δ{~ y1,~ z}
= (1 + ǫA1(~ x))δ{~ x,~ y1} + (1 + ǫA1(~ y2))δ{~ y2,~ z} + (1 + ǫA2(~ x))δ{~ x,~ y2} + (1 + ǫA2(~ y1))δ{~ y1,~ z} + O(ǫ) .
(5.12)
– 67 –+H2
−H2
Hδ{~ y1}
δ{~ y2}H
δ{~ y1}H Hδ{~ y2}
δ{~ x} δ{~ y1}
δ{~ y2} δ{~ z}
Figure 9: Discrete gauge field strength on a plaquette.
Its square is
H2
= δ{~ x,~ y1,~ z} ((1 + ǫA1(~ x))(1 + ǫA2(~ y1)) − (1 + ǫA2(~ x))(1 + ǫA1(~ y2))) + O(ǫ)
= ǫ2
δ{~ x,~ y1,~ z}

A2(~ y1) − A2(~ x)
ǫ
−
A1(~ y2) − A1(~ x)
ǫ
+ A1(~ x)A2(~ y1) − A2(~ x)A1(~ y2)

+ O ǫ3

= ǫ2
δ{~ x,~ y1,~ z}
←
∂1A2(~ x) −
←
∂2A1(~ x) + [A1,A2](~ x)

+ O ǫ3

. (5.13)
Therefore this expression does indeed reduce to the correct continuum quantity for ǫ → 0:
F =
1
ǫ2
H2
+ O(ǫ) . (5.14)
Wilson lines. The action (5.11) is indeed equal to the well-known Wilson-line action
[21] for lattice gauge theory (see chapter 1 of [22] for a brief review): If we write R,L ∈ G
for the holonomy along (~ x → ~ y1 → ~ z) and (~ x → ~ y2 → ~ z) respectively we have
H2
=
1
ǫ2
δ{~ x,~ y1,~ z} (R − L) . (5.15)
This gives
H2
|H2
= h1|H2†
H2
|1i
= tr R−1
− L−1

(R − L)
= 2tr

1 −
1
2
(R−1
L + L−1
R)

= 2N

1 −
1
N
ReW

, (5.16)
(cf. eq. (1.5) of [22]) where W is the Wilson line
W = trL−1
R. (5.17)
Equations of motion. The form (5.11) of the lattice YM action makes it easy to derive
the classical equations of motion: Varying the action yields
[H,·]†
ι H2
|1i = 0. (5.18)
The Bianchi identity hold trivially:

H,H2

ι
= 0. (5.19)
– 68 –Gauge-covariant derivative. With the notation
dH := [H,·]ι
d
†ĝ
H := (dA)†
(5.20)
the above equations of motion take the more familiar form
dHH2
= dH(
1
2
dHH) = 0
d
†ĝ
HH2
= d
†ĝ
H(
1
2
dHH) = 0. (5.21)
We purposefully write dH instead of dA. Note that even for G = U(1) where dA = d in
the continuum we have dH 6= d on the lattice.
Of course dH is nilpotent:
dH
2
= 0. (5.22)
– 69 –5.2 Fermions
On cubic graphs with ℓ = 1 the operators e†a
and ea generate the canonical creation/annihilation
algebra (3.55), (3.62):
n
e†a
,e†b
o
= 0
n
ea
,eb
o
= 0
n
e†a
,eb
o
= δa,b
, (5.23)
as familiar from the continuum, which is isomorphic to the two mutually anticommuting
Clifford algebras
n
γ̂a
±,γ̂b
±
o
= ±2δab
n
γ̂a
±,γ̂b
∓
o
= 0 (5.24)
via
γ̂a
± := e†a
± ea
. (5.25)
We now consider the case that, in the presence of a non-trivial metric tensor ĝ, Clifford
generators γ̂a
ĝ± : Ω → Ω may be constructed, which satisfy
n
γ̂a
ĝ±,γ̂b
ĝ±
o
= ±2ηab
n
γ̂a
ĝ±,γ̂b
ĝ∓
o
= 0, (5.26)
where ηab is the Minkowski metric, as well as
(γ̂a
ĝ±)†ĝ = ±γ̂a
ĝ± . (5.27)
The possibility to satisfy this simplifying assumption for non-flat background metrics
needs yet to be studied, as do the possibilities of sensibly modifying it in such a situation.
In the following we concentrate on an analysis of the case of diamond graphs §4.2 (p.54),
where a construction (5.24) is well possible, as discussed in §4.3 (p.57).
With the Clifford algebra (5.26) at hand the treatment of spinors very closely parallels
that of the continuum theory (cf. §?? (p.??)): Spinors live in minimal left (right) ideals
of the Clifford algebra as represented on Ω(A) and are transformed under the Lorentz
group by the action of “rotors”, which in the continuum have the form (??). In order for
spinor bilinears to be Lorentz invariant these operators have to be unitary, which requires
adapting (??) in a particular way by replacing
R± = exp

ρ[ab]γ̂a
ĝ±γ̂b
ĝ±

−→ exp


X
[ab]
√
ρab
′
γ̂a
ĝ±γ̂b
ĝ±
p
ρ[ab]
′

 , (5.28)
– 70 –where the prime indicates projection on the hermitian part of the 0-form:
√
ρab
′
:=
1
2
√
ρab + (
√
ρab)†ĝ

. (5.29)
This construction enforces that ρ is written in terms of the self-adjoint but non-commutative
coordinates of the diamond complex, which were discussed in §4.4 (p.58).
This way the rotors R± are manifestly unitary with respect to h·|·iĝ,
R±(R±)†ĝ = 1, (5.30)
and hence the inner product is invariant under the “discrete Lorentz transformations”
generated by R±:
hR±ψ|R±φiĝ = hψ|φiĝ . (5.31)
(Note that the metric operator ĝ plays the role of the “γ̂0
-matrix” used to construct
Lorentz invariant bilinears of spinors when using their matrix representation.)
It is now a triviality to write down action functionals for lattice spinor fields: Let D
be any Dirac operator on Ω(A) which in particular is ĝ-hermitian
D†ĝ = D (5.32)
then
S[ψ] = hψ|Dψiĝ (5.33)
defines a lattice version of the Dirac action for the spinor field ψ.
In particular, on flat complexes one could consider the “Kähler-Dirac operator” D =
d + d†ĝ , which however, as a lattice effect, mixes the left-ideals in which the spinors live:
According to §4.1 (p.50) we have
d ± d†ĝ = γ̂a
∓
1
2

∂a − ∂†
a

+ γ̂a
±
1
2

∂a + ∂†
a

(5.34)
so that
(d ± d†ĝ ) (γ̂a1
∓ ···γ̂
ap
∓ )α = γ̂a
∓ (γ̂a1
∓ ···γ̂
ap
∓ )
↔
∂aα + (−1)p ǫ
2
(γ̂a1
∓ ···γ̂
ap
∓ ) ∆aαγ̂a
∓ . (5.35)
This can be avoided, if desired, by instead using D = D̃ where
D̃± := d̃ ± ˜ d†
= γ̂µ
∓
1
2

∂µ − ∂†
µ

. (5.36)
All this is closely related to the Wilson-Dirac operator. (See eq (3.3) of [23]).
– 71 –Relation to the approach by Becher and Joos. The issues considered here con-
cerning the Dirac-Kähler operator on flat lattices are of course not new. The formalism
presented here, with its emphasis on methods known from non-commutative geometry,
provides a transparent and systematic instrument to generalize all these constructions to
arbitrary background metrics, but for the flat case we should expect overlap with other
formulations. Indeed, already long ago the Dirac-Kähler operator on flat cubic lattices has
been considered by Becher and Joos in [5]. Comparison with their equations (3.21) and
(3.22) shows that there is an interesting way to rewrite our (5.34):
From (4.33) and (2.131) it follows that
T−~ ea
◦ ∂a = ∂a ◦ T−~ ea
= −∂†
a
T~ ea
◦ −∂†
a = −∂†
a ◦ T~ ea
= ∂a (5.37)
and it is clear that
h
T±~ ea
,e†
i
= 0 =

T±~ ea
,e

. (5.38)
Using this one can rewrite (5.34) as
d ± d†ĝ = e†a
∂a ∓ ea
∂†
a
=

e†a
± T−~ ea
◦ ea

∂a . (5.39)
This suggests to define pseudo-Clifford generators
qa
± := e†a
± T−~ ea
◦ ea
, (5.40)
which satisfy the pseudo-Clifford algebra20
n
qa
±,qb
±
o
= ±2ηab
T−~ ea
n
qa
±,qb
∓
o
= 0. (5.41)
(With respect to (3.15) of [5] note that, using the ordinary operator product, this still
extends to a fully associative Clifford product.)
In terms of this pseudo-Clifford algebra (5.34) is equivalently rewritten as
d ± d†ĝ = qa
±∂a (5.42)
with no second (pseudo-)Clifford algebra appearing.
Projectors on eigenspaces of qiqj are of the form
P =

T−~ ei−~ ej
+ sqi
qj

(5.43)
(with s ∈ {±1,±i}) and can be used to build minimal left ideals of the q±-algebra. But,
these projectors should act on a non-constant function instead of on the “vacuum” |1i.
20
The way fermions anticommute to translations in this algebra is reminiscent of supersymmetry. How-
ever, the translation operators on the right are not generators of translations.
– 72 –This is however of little use, because 0-forms and partial derivative (difference) opera-
tors do not respect these ideals: While for the ordinary γ̂a
± one has (4.66)

γ̂a
±,Xb

= ǫδabγ̂a
∓
the pseudo-Clifford generators satisfy
qa
±Xa
= (Xa
+ ǫ)e†a
± Xa
T−~ ea
ea
(5.44)
so that
h
qa
±,Xb
i
= ǫδab
e†a
= ǫδab 1
2
qa
+ + qa
−

. (5.45)
Chiral symmetry. But we don’t necessarily need ideals to model spinors on the exterior
bundle. Using the Dirac-Hestenes representation we can identify spinors with Clifford
algebra elements (e.g. even graded elements in 3+1 dimensions). By the symbol map these
can be mapped to inhomogeneous forms |ψi and (5.33) defines the Dirac action21 of ψ.
This action has several interesting properties: It has
1. no fermion doubling
2. chiral symmetry
3. a clear geometrical origin and interpretation.
The absence of fermion doubling is discussed in §A (p.76). The presence of chiral symmetry
can be seen as follows:
In even dimensions the pseudoscalar q̄ of the pseudo-Clifford algebra (5.40) satisfies
q̄ := q1
−q2
− ···qp
−
{D,q̄} = 0
q̄2
= (−1)D(D−1)2+s
T−
√
D~ et , (5.46)
where ~ et
= 1 √
D

~ e1
+ ··· +~ eD

is the timelike direction on the diamond defined in (4.49).
Since all translation operators T· commute with D we can form the modified pseudoscalar
q̃ := iD(D−1)/2+s

T−
√
D~ et
−1/2
q̄+ , (5.47)
which is constructed so as to satisfy
q̃2
= 1
{D,q̃} = 0. (5.48)
Therefore this operator indeed serves as a substitute for the usual chirality operator. (This
particular construction however relies on the translation invariance of D. A generalization
to interacting fermions needs further investigation, cf. §5.2 (p.74).)
21
Really the Dirac-Kähler action. But for flat metrices both are equivalent.
– 73 –Dirac operators from holonomy 1-forms We have seen in §5.1 (p.66) that the correct
translation of the gauge covariant derivative (of Lie algebra valued forms) to the lattice is
the supercommutator with the holonomy 1-form H. In order to couple Lie algebra-valued
fermions (gauginos) to the gauge field we therefore need to express the Dirac operator in
terms of this supercommutator. To this end, rewrite the Dirac-Kähler action as follows:
D
ψ|(d + d†
)ψ
E
= hψ|dψi + hdψ|ψi
= |hψ|dψi|2
. (5.49)
On graphs without opposite and intermediate edges this may be expressed in terms of
the supercommutator with the graph operator:
|hψ|dψi|2
= |hψ|[G,ψ]ιi|2
. (5.50)
The graph operator is nothing but the holonomy 1-form for vanishing gauge connection
and the generalization of the above to non-vanishing gauge connection coupling is
S = |hψ|[H,ψ]ιi|2
. (5.51)
This should be a viable lattice version of the continuum expression hψ|(γµ(∂µ + Aµ))ψi.
It is not however expressed in terms of a nice Dirac operator.22
In the same spirit the Dirac action of group-valued fermions on the lattice should be
D
ψ|ǫHψ + (−1)N̂
ψG
E 2
(5.55)
because ǫH = G + ǫA + O ǫ2

so that
ǫHψ + (−1)N̂
ψG = (d + ǫA)ψ + O ǫ2

. (5.56)
22
The following might be a way to remedy this:
Assume for the moment that for a given holonomy 1-form H there exists a (p < D)-form |V i such that
H|V i = 0. (5.52)
(For instance for vanishing gauge connection we can choose V = H = G.) Next consider instead of (5.51).
the action | ψV |[H,ψ]ι V |2
= |hV |ψ†
[H,ψ]ι |V i|2
whose variation with respect to ψ still reproduces the
lattice version of the minimally coupled massless Dirac equation. Due to (5.52) it is equal to
hV |ψ†
[H,ψ]ι |V i = hV |ψ†

H + H†

ψ |V i , (5.53)
and one sees that now
H + H† (5.40)
= Haqa
+ . (5.54)
plays the role of the Dirac operator in the presence of the gauge field.
– 74 –6. Summary and Outlook
It was shown how the abstract differential geometric formalism which has been developed
in great detail by Dimakis and Müller-Hoissen nicely describes abstract metric geometry
when augmented by an inner product which generalizes the Hodge inner product. This
way a hybrid formalism of noncommutative spectral geometry in the sense of Connes, with
its emphasis on inner product spaces and Dirac operators, and D&MH-like formulations of
differential geometry is obtained. There is no restriction to compact and/or Riemannian
spaces and in fact for the discrete hypercubic examples worked out in detail here (which
introduce noncommutativity from 1-forms on upwards) the familiar continuum formalism
largely translates in a mimetic fashion to the noncommutative case, allowing to deal with
issues of Lorentzian signature in the usual way (e.g. by restricting physical inner products
to spatial hyperslices).
Apart from the introduction of the inner product itself, we found that the study of its
deformations is very fruitful. It was shown explicitly how geometry is encoded in metric
operators ĝ which transform the inner product as h·|·i 7→ ·|ĝ−1 · and that this allows for
instance the construction of the Hodge star operator or of lattice field theory actions for
curved generalized (and in particular discrete) spaces.
In fact, the formalism singles out, by means of the graph operator G, which encodes
the connectedness of the “manifold”, a special class of metric operators of the form ĝ =
V (x)(GG† −G†G) which encode pseudo-Riemannian geometry in a way familiar from the
“causal sets”-approach [24], in that (GG† − G†G) determines the lightcone structure and
V (x) the volume element.
The deformation formalism used here seems to be deeper than one might suspect at first
sight. We mentioned that when superstrings are formulated in loop space the background
fields (at least massless fields from the NS and NS-NS sector) as well as background gauge
and duality transformation are associated with deformations of the Hodge inner product
on loop space. From this point of view the formalism studied here may be regarded as the
superparticle limit of loop space formalism in superstring theory [14, 15].
This suggests that the work presented here could and should be extended and deepened
in several directions. In future work we will more clearly work out the relation of the
approach used here to, for instance, the theory of Whitney forms, causal sets, and other
concepts.
– 75 –A. Fermion doubling
An old problem of lattice field theory is known as fermion doubling (see for instance section
4.2 of [8]).
The problem may be stated as follows:
A lattice Laplace operator ∆ constructed from finite difference operators of the form
Dµ ∝ T−a~ eµ
− T(s−a)~ eµ
(A.1)
with 2a,s ∈ IN by
∆ = Dµ
Dµ (A.2)
has eigenvalues whose absolute value is
−4
X
µ
ηµµ
sin2
s
2
ǫkµ

. (A.3)
For small kµ this is close to the kµkµ-behaviour of the continuum theory, but for larger
kµ the difference becomes noticable. In particular when s
2ǫkµ > π/2 new massless states
appear, the so-called “doublers”. Since kmax = π/ǫ is the largest wavenumber supported
on the lattice this happens whenever
s > 1. (A.4)
In order to avoid the doubling one hence has to choose s = 1. But since furthermore the
operator iDµ has real eigenvalues only for a = (s − a) hermiticity of iDµ restricts a to
a = 1/2. This is however acceptable only for bosons, since DµDµ with s = 1, a = 1/2
is well defined on the lattice, while γµDµ is not, because it involves translations by half
a lattice spacing. The choice a = 1, s = 2 would give a well defined hermitian iDµ for
fermions, but it will have doublers due to s > 1.
Therefore, in order to avoid the fermion doubling, the lattice Dirac operator γµDµ
has to be modified in some sense. There exist many different approaches, one of the more
prominent ones being the use of “Wilson fermions” [21]. A theorem called the Nielson-
Ninomiya theorem [25, 26] states that a lattice action with translational invariance, locality
and hermiticity can only avoid fermion doubling by beaking chiral symmetry.
Note that the Dirac-Kähler operator (5.34) corresponds to s = 1 and hence does not
produce any fermion doubling, even though it is manifestly self-adjoint. This is possible
due to the non-locality which comes from the non-commutativity of 0-forms with 1-forms.
– 76 –Acknowledgments
We would like to thank Ricardo Mosna for drawing our attention to the work by Becher
and Joos and Klaus Fredenhagen for making us clarify the assumptions in §3.2.
– 77 –References
[1] A. Dimakis and F. Müller-Hoissen, Riemannian geometry of bicovariant group lattices, .
math-ph/0212054.
[2] A. Dimakis and F. Müller-Hoissen, Discrete Riemannian geometry, . gr-qc/9808023.
[3] D. Sullivan, Combinatorial topology and the continuum model of geometry, 1998. MSRI talk
http://www.msri.org/publications/ln/msri/1998/kirby/sullivan/1/banner/01.html.
[4] E. Forgy, Noncommutative geometry and stochastic calculus: Applications in mathematical
finance, .
[5] P. Becher and H. Joos, The Dirac-Kähler equation and fermions on the lattice, Z. Phys. C 15
(1982) 343–365. http://www-lib.kek.jp/cgi-bin/kiss prepri?KN=198207023&OF=4.
[6] F. Müller-Hoissen, Introduction to noncommutative geometry of commutative algebras and
applications in physics, . http://kaluza.physik.uni-konstanz.de/2MS/mh/mh/mh.ps.
[7] I. Kanamori and N. Kawamoto, Dirac-Kähler fermion from Clifford product with
noncommutative differential form on a lattice, . hep-th/0305094.
[8] K. Langfeld, An introduction to lattice gauge theory, .
eurograd.physik.uni-tuebingen.de/ARCHIV/Vortrag/Langfeld-latt02.pdf.
[9] A. Dimakis and F. Müller-Hoissen, Differential calculus and gauge theory on finite sets, .
hep-th/9401149.
[10] A. Connes, Noncommutative Geometry. Academic Press, 1994.
[11] J. Varilli, An introduction to noncommutative geometry, . physics/9709045.
[12] J. Fröhlich, O. Grandjean, and A. Recknagel, Supersymmetric quantum theory and
(non-commutative) differential geometry, Commun. Math. Phys. 193 (1998) 527-594.
hep-th/9612205.
[13] U. Schreiber, Covariant Hamiltonian evolution in supersymmetric quantum systems, .
hep-th/0311064.
[14] U. Schreiber, On deformations of 2d SCFTs, hep-th/0401175. (to appear in JHEP).
[15] U. Schreiber, Loop space methods in string theory, .
http://www-stud.uni-essen.de/˜sb0264/looptalk.pdf.
[16] J. Fröhlich, O. Grandjean, and A. Recknagel, Supersymmetric quantum theory,
non-commutative geometry, and gravitation, hep-th/9706132 (1997).
[17] A. Dimakis and F. Müller-Hoissen, Differential geometry of group lattices, .
math-ph/0207014.
[18] E. Forgy and W. Chew, A discrete exterior calculus and electromagnetic theory on a lattice, in
Antennas and Propagation Society International Symposium, vol. 2, pp. 880–883, IEEE, 2000.
[19] A. Strohmaier, On noncommutative and semi-Rimannian geometry, . math-ph/0110001.
[20] D. Levi, P. Tempesta, and P. Winternitz, Lorentz and Galilei invariance on lattices, .
hep-th/0310013.
[21] K. Wilson Phys. Rev. D 10 (1974) 2445.
– 78 –[22] S. Necco, The static quark potential and scaling behaviour of SU(3) lattice Yang-Mills theory,
. edoc.hu-berlin.de/dissertationen/necco-silvia-2003-05-15/PDF/Necco.pdf.
[23] M. Lüscher, Exact chiral symmetry on the lattice and the Ginsparg-Wilson relation, .
hep-lat/9802011.
[24] R. Sorkin, Causal sets: Discrete gravity, . hep-th/0309009.
[25] H. Nielson and M. Ninomiya Nucl. Phys. B 185 (1980) 20.
[26] H. Nielson and M. Ninomiya Nucl. Phys. B 193 (1980) 173.
– 79 –