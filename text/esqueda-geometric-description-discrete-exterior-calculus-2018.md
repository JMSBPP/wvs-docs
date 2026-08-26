---
sha256: cb685d19b21bef96097a9e7e30450d668b67ea9f0039c479c10580058e103281
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 37768
---
A GEOMETRIC DESCRIPTION OF DISCRETE EXTERIOR CALCULUS FOR
GENERAL TRIANGULATIONS
HUMBERTO ESQUEDA, RAFAEL HERRERA, SALVADOR BOTELLO, AND MIGUEL ANGEL MORELES
Abstract. We revisit the theory of Discrete Exterior Calculus (DEC) in 2D for general triangula-
tions, relying only on Vector Calculus and Matrix Algebra. We present DEC numerical solutions of
the Poisson equation and compare them against those found using the Finite Element Method with
linear elements (FEML).
Contents
1. Introduction 1
2. 2D Exterior Differential Calculus as Vector Calculus 2
2.1. Wedge product for vectors in R2
2
2.2. Hodge star operator for vectors in R2
4
2.3. The Laplacian 4
2.4. Duality in Green’s theorem 5
3. Discrete Exterior Calculus 6
3.1. Boundary operator 6
3.2. Dual mesh 9
3.3. Boundary operator on the dual mesh 10
3.4. Discrete Hodge star 11
3.5. DEC applied to 2D Poisson’s equation 13
4. DEC for general triangulations 13
4.1. Dual mesh of an arbitrary triangle 13
4.2. Dual mesh of a general triangulation 14
5. Numerical examples 15
5.1. First example 15
5.2. Second example 17
6. Conclusions 19
References 19
1. Introduction
The purpose of this paper is to introduce the theory of Discrete Exterior Calculus (DEC) to the
widest possible audience and, therefore, we will rely mainly on Vector Calculus and Matrix Algebra.
Discrete Exterior Calculus is a relatively new method for solving partial differential equations [8] based
on the idea of discretizing the mathematical theory of Exterior Differential Calculus, a theory that
goes back to E. Cartan [3] and is fundamental in the areas of Differential Geometry and Differential
Topology. Although Exterior Differential Calculus is an abstract mathematical theory, it has been
introduced in various fields such as in digital geometry processing [4], numerical schemes for partial
differential equations [8, 1], etc.
In his PhD thesis [8], Hirani laid down the fundamental concepts of Discrete Exterior Calculus
(DEC), using discrete combinatorial and geometric operations on simplicial complexes (in any di-
mension), proposing discrete equivalents for differential forms, vector fields, differential and geometric
operators, etc. Perhaps the first numerical application of DEC to PDE was given in [9] in order to
1
arXiv:1802.01158v2 [math.DG] 5 Jun 20182 HUMBERTO ESQUEDA, RAFAEL HERRERA, SALVADOR BOTELLO, AND MIGUEL ANGEL MORELES
solve Darcy flow and Poisson’s equation. In [7], the authors develop a modification of DEC and show
that in simple cases (e.g. flat geometry and regular meshes), the equations resulting from DEC are
equivalent to classical numerical schemes such as finite difference or finite volume discretizations. In
[11], the authors used DEC to solve the Navier-Stokes equations and, in [5] DEC was used with a
discrete lattice model to simulate elasticity, plasticity and failure of isotropic materials.
In this expository paper, we review the various operators of Exterior Differential Calculus in 2D
in terms of ordinary vector calculus, and introduce only the geometrical ideas that are essential to
the formulation. Among those ideas is that of duality between the differentiation operator (on vector
fields) and the boundary operator (on the domain) contained in Green’s theorem. This duality is
one of the key ideas of the method, which justifies taking the discretized derivative matrix as the
transpose of the boundary operator matrix on the given mesh. Another important ingredient is the
Hodge star operator, which is hidden in the notation of Vector Calculus. In order to show the necessity
of the Hodge star operator, we carry out some simple calculations. In particular, we will introduce
the notion of wedge product of vectors which, roughly speaking, helps us assign algebraic objects to
parallelograms and carry out algebraic manipulations with them. We present DEC in the simplest
terms possible using easy examples. We also review the formulation of DEC for arbitrary meshes,
which was first considered in [10]. Performance of the method is tested on the Poisson equation and
compared with the Finite Element Method with linear elements (FEML).
The paper is organized as follows. In Section 2, we introduce the wedge product of vectors and
the geometric Hodge star operator, and rewrite Green’s theorem appropriately in order to display the
duality between the differentiation and the boundary operators. In Section 3, we present the operators
of DEC (mesh, dual mesh, discrete derivation, discrete Hodge star operator), showing simple examples
throughout. In Section 4, we present the formulation of DEC on arbitrary triangulations. In Section
5, we present the numerical solution of a Poisson equation with DEC and FEML, in order to compare
their performance. In Section 6, we present our conclusions.
2. 2D Exterior Differential Calculus as Vector Calculus
In this section we introduce two geometric operators (the wedge product and the Hodge star) and
explain how to use them together with the gradient operator in order to obtain the Laplacian.
2.1. Wedge product for vectors in R2
. Let a,b be vectors in R2
. We can assign to these vector the
parallelogram they span, and to such a parallelogram its area. The latter is equal to the determinant of
the transformation matrix sending e1,e2 to a,b respectively. In Exterior Calculus, such a parallelogram
is regarded as an algebraic object a∧b, a bivector, and the set of bivectors is equipped with a vector
space structure to form the one-dimensional vector space
V2
R2
.
Thus, we have the following spaces
R, R2
,
V2
R2
,
of scalars, vectors and bivectors, respectively. For instance, the square formed by e1 and e2 is repre-
sented by the symbol
e1 ∧ e2
which is read as ”e1 wedge e2” (see Figure 1)
e1
e2
x
y
e e 1 2
Figure 1. Wedge product of two vectors.A GEOMETRIC DESCRIPTION OF DISCRETE EXTERIOR CALCULUS FOR GENERAL TRIANGULATIONS 3
In R2
, this represents an “element” of unit area.
Note that if we list the vectors in the opposite order, we have a different orientation and, therefore,
the algebraic objects must satisfy e2 ∧ e1 = −e1 ∧ e2 (see Figure 2)
e1
e2
x
y
e2 e1=−e 2 e 1
Figure 2. Change of orientation of the parallelogram implies anticommutativity in the
wedge product of two vectors.
More generally, given two vectors a,b ∈ R2
, their wedge product a ∧ b looks as follows (see Figure 3)
a
b
a b
Figure 3. The wedge product of the vectors a and b
The properties of the wedge product are
• it is anticommutative: a ∧ b = −b ∧ a (see Figure 4
a
b
a b
a
b
b a
Figure 4. Anticommutativity of the wedge product.
• a ∧ a = 0 since it is a parallelogram with area zero (see Figure 5)
a
a b
b
Figure 5. Parallelogram with very small area, depicting what happens when b tends to a.
• it is distributive
(a + b) ∧ c = a ∧ c + b ∧ c;
• it is associative
(a ∧ b) ∧ c = a ∧ (b ∧ c).
For example, let
a = (a1,a2) = a1e1 + a2e2,
b = (b1,b2) = b1e1 + b2e2.
Then
a ∧ b = (a1e1 + a2e2) ∧ (b1e1 + b2e2)
= a1b1 e1 ∧ e1 + a1b2 e1 ∧ e2 + a2b1 e2 ∧ e1 + a2b2 e2 ∧ e24 HUMBERTO ESQUEDA, RAFAEL HERRERA, SALVADOR BOTELLO, AND MIGUEL ANGEL MORELES
= a1b2 e1 ∧ e2 − a2b1 e1 ∧ e2
= (a1b2 − a2b1)e1 ∧ e2,
i.e. the determinant
det

a1 a2
b1 b2

times the canonical bivector/square e1 ∧ e2.
2.2. Hodge star operator for vectors in R2
. Now consider the following situation: given the
vector e1, find another vector v such that the parallelogram that they form has area 1. It is readily
seen that, for instance, v = e2,−e2,e1 + e2 are all solutions. Requiring orthogonality and standard
orientation, we see that e2 is the unique solution. This process is summarized in the Hodge star
operator, which basically says that the complementary vector for e1 is e2, and the one for e2 is −e1,
?e1 = e2
? e2 = −e1.
In general, the equation that defines the Hodge star operator for any given vector v ∈ R2
is the
following
w ∧ (?v) = (w · v)e1 ∧ e2.
for every w ∈ R2
. In particular, if we take v = w,
v ∧ (?v) = |v|2
e1 ∧ e2,
which means that v and ?v form a square of area |v|2
. Thus, the Hodge star operator on a vector
v ∈ R2
can be thought of as finding the vector that makes with v a positively oriented square of area
|v|2
.
It is somewhat less intuitive to work out the Hodge star of a bivector. First of all, we have to treat
bivectors as vectors of a different space, namely the space of bivectors
V2
R2
. Secondly, the length of
a bivector v ∧ w is its area
length(v ∧ w) := Area(v ∧ w).
Thus, the defining equation of the Hodge star applied to (v ∧ w) and ?(v ∧ w) reads as follows
(v ∧ w) ∧ ?(v ∧ w) = hv ∧ w,v ∧ wie1 ∧ e2
which means
(v ∧ w) ∧ ?(v ∧ w) = Area(v ∧ w)2
e1 ∧ e2.
Since v ∧ w = Area(v ∧ w)e1 ∧ e2 is already a bivector, ?(v ∧ w) must be a scalar, i.e.
?(v ∧ w) = Area(v ∧ w).
When v = e1 and w = e2 we have
?(e1 ∧ e2) = 1.
Finally, the Hodge star of a number λ is a bivector, i.e.
?λ = λe1 ∧ e2.
2.3. The Laplacian. Let f : R2
→ R and consider the gradient
∇f =
∂f
∂x
e1 +
∂f
∂y
e2.
Apply the Hodge star operator to it
?∇f =
∂f
∂x
∗ e1 +
∂f
∂y
∗ e2
=
∂f
∂x
e2 −
∂f
∂y
e1.A GEOMETRIC DESCRIPTION OF DISCRETE EXTERIOR CALCULUS FOR GENERAL TRIANGULATIONS 5
Now take the gradient of each coefficient function together with wedge product
∇ ∧ ?∇f := ∇

∂f
∂x

∧ e2 − ∇

∂f
∂y

∧ e1
=

∂2
f
∂x2
e1 +
∂2
f
∂y∂x
e2

∧ e2 −

∂2
f
∂x∂y
e1 +
∂2
f
∂2y
e2

∧ e1
=
∂2
f
∂x2
e1 ∧ e2 +
∂2
f
∂y∂x
e2 ∧ e2 −
∂2
f
∂x∂y
e1 ∧ e1 −
∂2
f
∂2y
e2 ∧ e1
=

∂2
f
∂x2
+
∂2
f
∂2y

e1 ∧ e2.
By taking the Hodge star of this last expression we get the ordinary Laplacian of f
?∇ ∧ ?∇(f) =
∂2
f
∂x2
+
∂2
f
∂2y
.
Remarks.
(i) This rather convoluted looking way of computing the Laplacian of a function is based on Exterior
Differential Calculus, a theory that generalizes the operators of vector calculus (gradient, curl and
divergence) to arbitrary dimensions, and is the basis for the differential topological theory of deRham
cohomology.
(ii) We would like to emphasize the necessity of using the Hodge star operator ∗ in order to make the
combination of differentiation and wedge product produce the correct answer.
2.4. Duality in Green’s theorem. Green’s theorem states that for a vector field (L,M) defined on
a region D ⊂ R2
,
Z
D

∂M
∂x
−
∂L
∂y

dxdy =
Z
C=∂D
(Ldx + Mdy).
In this section, we will explain how this identity encodes a duality between the operator of differenti-
ation and that of taking the boundary of the domain of integration.
2.4.1. Rewriting Green’s theorem. Note that if F = (L,M) is a vector field, we can write it as
F = Le1 + Me2.
Then, we can apply the gradient operator together with wedge product in the following fashion
∇∧
(Le1 + Me2) := ∇L ∧ e1 + ∇M ∧ e2
=

∂L
∂x
e1 +
∂L
∂y
e2

∧ e1 +

∂M
∂x
e1 +
∂M
∂y
e2

∧ e2
=
∂L
∂x
e1 ∧ e1 +
∂L
∂y
e2 ∧ e1 +
∂M
∂x
e1 ∧ e2 +
∂M
∂y
e2 ∧ e2
=
∂L
∂y
e2 ∧ e1 +
∂M
∂x
e1 ∧ e2
=

∂M
∂x
−
∂L
∂y

e1 ∧ e2.
Note that we have defined a new operator ∇∧
which combines differentiation and wedge product.
Applying the Hodge star operator we obtain
?∇∧
(Le1 + Me2) =

∂M
∂x
−
∂L
∂y

,
i.e. the integrand of the left hand side of the identity of integrals in Green’s theorem. Thus, as a first
step, Green’s theorem can be rewritten as follows:
Z
D
∇∧
(L,M)dxdy =
Z
∂D
(L,M) · (dx,dy)6 HUMBERTO ESQUEDA, RAFAEL HERRERA, SALVADOR BOTELLO, AND MIGUEL ANGEL MORELES
2.4.2. The duality in Green’s theorem. Let us recall the following fact from Linear Algebra. Given a
linear transformation A of Euclidean space Rn
, the transpose AT
satisfies
hA(v),wi = v,AT
(w)
for any two vectors v,w ∈ Rn
, where h·,·i denotes the standard inner/dot product. In fact, such an
identity characterizes the transpose AT
.
Now, let us do the following notational trick: substitute the integration symbols in Green’s theorem
by  ·,·  as follows:
Z
C
(L,M) · (dx,dy) =  (L,M),C ,
Z
D
∇∧
(L,M)dxdy =  ∇∧
(L,M),D ,
where C = ∂D is the boundary of the region. Using this notational change, Green’s theorem reads
as follows
 ∇∧
(L,M),D  =  (L,M),∂D  .
Roughly speaking, this means that the differential operator ∇∧
is the transpose of the boundary
operator ∂ by means of the product  ·,· .
Remark. The previous observation is fundamental in the development of DEC, since the boundary
operator is well understood and easy to calculate on meshes.
3. Discrete Exterior Calculus
Now we will discretize the differentiation operator ∇∧
presented above. We will start by describing
the discrete version of the boundary operator on simplices/triangles. Afterwards, we will treat the
differentiation operator as the transpose of the boundary operator.
We are interested in using certain geometric subsets of a given triangular mesh of a 2D region.
Such subsets include vertices/nodes, edges/sides and faces/triangles. We will describe each one of
them by means of the ordered list of vertices whose convex closure constitutes the subset of interest.
For instance, consider the triangular mesh of the planar hexagonal region in Figure 6,
v
v v
v v
v v
0 1
2
3
6
5
4
Figure 6. Triangular mesh of a planar hexagonal region.
where the shaded triangle will be denoted by [v0,v1,v6], and its edge joining the vertices v0 and v1
will be denoted by [v0,v1]. For the sake of notational consistency, we will denote the vertices also
enclosed in brackets, e.g. [v0].
3.1. Boundary operator. There is a well known boundary operator ∂ for oriented triangles, edges
and points:
• For points/vertices:
v0
v0
[ ]
Figure 7. Boundary of a vertex: ∂[v0] = 0.
• For sides/edges:A GEOMETRIC DESCRIPTION OF DISCRETE EXTERIOR CALCULUS FOR GENERAL TRIANGULATIONS 7
[ , ] v v 0 1
0 v v1
Figure 8. Boundary of an edge: ∂[v0,v1] = [v1] − [v0].
• For faces/triangles:
v
v v1
2
v v [ , , ] v
0
0 1 2
Figure 9. Boundary of a face: ∂[v0,v1,v2] = [v1,v2] − [v0,v2] + [v0,v1].
Example. Let us consider again the mesh of the planar hexagonal (with oriented triangles) in
Figure 10
v
v v
v v
v v
0 1
2
3
6
5
4
K
Figure 10. Oriented triangular mesh of a planar hexagonal region.
We will denote a triangle by the list of its vertices listed in order according to the orientation of the
tringle. Thus, we have the following ordered lists:
• list of faces
{[v0,v1,v6],[v1,v2,v6],[v2,v3,v6],[v3,v4,v6],[v4,v5,v6],[v5,v0,v6]};
• list of edges
{[v0,v6],[v1,v6],[v2,v6],[v3,v6],[v4,v6],[v5,v6],[v0,v1],[v1,v2],[v2,v3],[v3,v4],[v4,v5],[v5,v0]};
• list of vertices
{[v0],[v1],[v2],[v3],[v4],[v5],[v6]}.
A key idea in DEC is to consider each face as an element of a basis of a vector space. Namely,
coordinate vectors are associated to faces as follows:
[v0,v1,v6] ←→ (1,0,0,0,0,0),
[v1,v2,v6] ←→ (0,1,0,0,0,0),
[v2,v3,v6] ←→ (0,0,1,0,0,0),
[v3,v4,v6] ←→ (0,0,0,1,0,0),
[v4,v5,v6] ←→ (0,0,0,0,1,0),
[v5,v0,v6] ←→ (0,0,0,0,0,1).
Similarly, coordinate vectors are associated to the edges
[v0,v6] ←→ (1,0,0,0,0,0,0,0,0,0,0,0),
[v1,v6] ←→ (0,1,0,0,0,0,0,0,0,0,0,0),
[v2,v6] ←→ (0,0,1,0,0,0,0,0,0,0,0,0),8 HUMBERTO ESQUEDA, RAFAEL HERRERA, SALVADOR BOTELLO, AND MIGUEL ANGEL MORELES
[v3,v6] ←→ (0,0,0,1,0,0,0,0,0,0,0,0),
[v4,v6] ←→ (0,0,0,0,1,0,0,0,0,0,0,0),
[v5,v6] ←→ (0,0,0,0,0,1,0,0,0,0,0,0),
[v0,v1] ←→ (0,0,0,0,0,0,1,0,0,0,0,0),
[v1,v2] ←→ (0,0,0,0,0,0,0,1,0,0,0,0),
[v2,v3] ←→ (0,0,0,0,0,0,0,0,1,0,0,0),
[v3,v4] ←→ (0,0,0,0,0,0,0,0,0,1,0,0),
[v4,v5] ←→ (0,0,0,0,0,0,0,0,0,0,1,0),
[v5,v0] ←→ (0,0,0,0,0,0,0,0,0,0,0,1).
Finally, we do the same with the vertices
[v0] ←→ (1,0,0,0,0,0,0),
[v1] ←→ (0,1,0,0,0,0,0),
[v2] ←→ (0,0,1,0,0,0,0),
[v3] ←→ (0,0,0,1,0,0,0),
[v4] ←→ (0,0,0,0,1,0,0),
[v5] ←→ (0,0,0,0,0,1,0),
[v6] ←→ (0,0,0,0,0,0,1).
Now, if we take the boundary of each face, we have
∂[v0,v1,v6] = [v1,v6] − [v0,v6] + [v0,v1],
∂[v1,v2,v6] = [v2,v6] − [v1,v6] + [v1,v2],
∂[v2,v3,v6] = [v3,v6] − [v2,v6] + [v2,v3],
∂[v3,v4,v6] = [v4,v6] − [v3,v6] + [v3,v4],
∂[v4,v5,v6] = [v5,v6] − [v4,v6] + [v4,v5],
∂[v5,v0,v6] = [v0,v6] − [v5,v6] + [v5,v0],
which, under the previous assignments of coordinate vectors, corresponds to the linear transformation
given by the following matrix
∂2,1 =




















−1 0 0 0 0 1
1 −1 0 0 0 0
0 1 −1 0 0 0
0 0 1 −1 0 0
0 0 0 1 −1 0
0 0 0 0 1 −1
1 0 0 0 0 0
0 1 0 0 0 0
0 0 1 0 0 0
0 0 0 1 0 0
0 0 0 0 1 0
0 0 0 0 0 1




















,
where the subindices in ∂2,1 indicate that we are taking the boundary of 2-dimensional elements and
obtaining 1-dimensional ones. Similarly, taking the boundaries of all the edges gives
∂[v0,v6] = [v6] − [v0],
∂[v1,v6] = [v6] − [v1],
∂[v2,v6] = [v6] − [v2],
∂[v3,v6] = [v6] − [v3],
∂[v4,v6] = [v6] − [v4],A GEOMETRIC DESCRIPTION OF DISCRETE EXTERIOR CALCULUS FOR GENERAL TRIANGULATIONS 9
∂[v5,v6] = [v6] − [v5],
∂[v0,v1] = [v1] − [v0],
∂[v1,v2] = [v2] − [v1],
∂[v2,v3] = [v3] − [v2],
∂[v3,v4] = [v4] − [v3],
∂[v4,v5] = [v5] − [v4],
∂[v5,v0] = [v0] − [v5],
which, under the previous assignments of coordinate vectors, corresponds to the linear transformation
given by the following matrix
∂1,0 =










−1 0 0 0 0 0 −1 0 0 0 0 1
0 −1 0 0 0 0 1 −1 0 0 0 0
0 0 −1 0 0 0 0 1 −1 0 0 0
0 0 0 −1 0 0 0 0 1 −1 0 0
0 0 0 0 −1 0 0 0 0 1 −1 0
0 0 0 0 0 −1 0 0 0 0 1 −1
1 1 1 1 1 1 0 0 0 0 0 0










.
Remark. Note how these matrices encode different levels of connectivity with orientations, such
as who are the edges of which oriented triangle, or which are the end points of a given oriented edge.
Due to the duality between ∂ and ∇∧
, we can define the discretiztion of ∇∧
by
∇∧
:= (∂)T
For instance, we see that the operator ∇∧
0,1 reads as follows
∇∧
0,1 =




















−1 0 0 0 0 0 1
0 −1 0 0 0 0 1
0 0 −1 0 0 0 1
0 0 0 −1 0 0 1
0 0 0 0 −1 0 1
0 0 0 0 0 −1 1
−1 1 0 0 0 0 0
0 −1 1 0 0 0 0
0 0 −1 1 0 0 0
0 0 0 −1 1 0 0
0 0 0 0 −1 1 0
1 0 0 0 0 −1 0




















.
3.2. Dual mesh. In order to discretize the Hodge star operator, we must first introduce the notion
of the dual mesh of a triangular mesh.
Consider the triangular mesh K in Figure 11(a). The construction of the dual mesh K∗
is carried
out as follows:
• The vertices of the dual mesh K∗
are the circumcenters of the faces/triangles of the original
mesh (the blue dots in Figures 11(b) and 11(c)). For instance, the dual of the face [v0,v1,v2]
will be denoted by [v0,v1,v2]∗
.
• The edges of K∗
are the straight line segments joining the circumcenters of two adjacent
triangles (those which share an edge). Note that the resulting line segments are orthogonal
to one of the original edges (the blue straight line segments in in Figures 11(b) and 11(c)).
For instance, the dual of the edge [v0,v6] will be denoted by [v0,v6]∗
.
• The faces or cells of K∗
are the areas enclosed by the new polygons determined by the new
edges. For instance, the dual of the edge [v6] is the inner blue hexagon in in Figures 11(b)
and 11(c) and will be denoted by [v6]∗
.10 HUMBERTO ESQUEDA, RAFAEL HERRERA, SALVADOR BOTELLO, AND MIGUEL ANGEL MORELES
(a)
v
v v
v v
v v
0 1
2
3
6
5
4
K
(b)
v
v v
v v
v v
0 1
2
3
6
5
4
K K *
(c)
K*
Figure 11. Dual mesh construction: (a) triangular mesh K; (b) dual mesh K∗
superim-
posed on the mesh K; (c) dual mesh K∗
.
The orientation of the dual edges is given by the following recipe. If we have two adjacent triangles
oriented as in Figure 12(a), the dual edge crossing the edge of adjacency is oriented as in Figure 12(b)
(a) (b)
Figure 12. (a) Two adjacent oriented triangles. (b) Compatibly oriented dual edge.
3.3. Boundary operator on the dual mesh. Consider the dual mesh in Figure 13 with the given
labels and orientations
F F
F F
F F
1 2
3
4 5
6 F7
E7
E
E
E10
E
E E
E
E
E
8
9
E12
E11
1 2
3
4 5
6
Figure 13. Oriented dual mesh.
The boundary operator is applied in a similar fashion as it was applied to triangles. In this case we
have
∂dual
2,1 F1 = E1 + E7 − E12,
∂dual
2,1 F2 = E2 − E7 + E8,
∂dual
2,1 F3 = E3 − E8 + E9,
∂dual
2,1 F4 = E4 − E9 + E10,
∂dual
2,1 F5 = E5 − E10 + E11,
∂dual
2,1 F6 = E6 − E11 + E12,
∂dual
2,1 F7 = −E1 − E2 − E3 − E4 − E5 − E6.
If we assign coordinate vectors to the dual faces and the dual edges as before
F1 ←→ (1,0,0,0,0,0,0),
F2 ←→ (0,1,0,0,0,0,0),
F3 ←→ (0,0,1,0,0,0,0),
F4 ←→ (0,0,0,1,0,0,0),A GEOMETRIC DESCRIPTION OF DISCRETE EXTERIOR CALCULUS FOR GENERAL TRIANGULATIONS 11
F5 ←→ (0,0,0,0,1,0,0),
F6 ←→ (0,0,0,0,0,1,0),
F7 ←→ (0,0,0,0,0,0,1),
and
E1 ←→ (1,0,0,0,0,0,0,0,0,0,0,0),
E2 ←→ (0,1,0,0,0,0,0,0,0,0,0,0),
E3 ←→ (0,0,1,0,0,0,0,0,0,0,0,0),
E4 ←→ (0,0,0,1,0,0,0,0,0,0,0,0),
E5 ←→ (0,0,0,0,1,0,0,0,0,0,0,0),
E6 ←→ (0,0,0,0,0,1,0,0,0,0,0,0),
E7 ←→ (0,0,0,0,0,0,1,0,0,0,0,0),
E8 ←→ (0,0,0,0,0,0,0,1,0,0,0,0),
E9 ←→ (0,0,0,0,0,0,0,0,1,0,0,0),
E10 ←→ (0,0,0,0,0,0,0,0,0,1,0,0),
E11 ←→ (0,0,0,0,0,0,0,0,0,0,1,0),
E12 ←→ (0,0,0,0,0,0,0,0,0,0,0,1),
we have the associated matrix
∂dual
2,1 =




















1 0 0 0 0 0 −1
0 1 0 0 0 0 −1
0 0 1 0 0 0 −1
0 0 0 1 0 0 −1
0 0 0 0 1 0 −1
0 0 0 0 0 1 −1
1 −1 0 0 0 0 0
0 1 −1 0 0 0 0
0 0 1 −1 0 0 0
0 0 0 1 −1 0 0
0 0 0 0 1 −1 0
−1 0 0 0 0 1 0




















.
Notice that
∂dual
2,1 = −(∂1,0)
T
,
which arises from the duality between the two meshes [6, Section 4.5]. In general, the discrete
differential to be applied is
∇∧,dual
1,2 = ∂dual
2,1
T
= −∂1,0 = − ∇∧
0,1
T
.
3.4. Discrete Hodge star. The discretization of the Hodge star ? uses the geometrical ideas de-
scribed in Section 2.2 and the dual mesh. More precisely, the 2D Hodge star operator rotates a vector
90◦
counterclockwise. For the sake of clarity, let us focus on the edge [v0,v6], its mesh dual [v0,v6]∗
and its Hodge star image ?[v0,v6]. They are represented in Figure 14.12 HUMBERTO ESQUEDA, RAFAEL HERRERA, SALVADOR BOTELLO, AND MIGUEL ANGEL MORELES
v
v v
v v
v v
0 1
2
3
6
5
4
v ,v [ ] 0 6 *
v
v v
v v
v v
0 1
2
3
6
5
4
[ ] v ,v 0 6 ★
Figure 14
Since
length(?[v0,v6]) = length([v0,v6]),
we see that the relationship between the dual edge [v0,v6]∗
and the geometric ?[v0,v6] is the following
1
length([v0,v6]∗)
[v0,v6]∗
=
1
length([v0,v6])
? [v0,v6].
As can be seen, when applying the geometric Hodge star to the edges of the mesh, we do not end up
in the dual mesh but in multiples of the elements of the dual mesh. Thus, ?[v0,v6] must be scaled to
match [v0,v6]∗
. If we do this to all the Hodge star images, we get the discrete Hodge star matrix
M1,1 =









length([v0,v6]∗
)
length([v0,v6]) 0 0 ... 0
0 length([v1,v6]∗
)
length([v1,v6]) 0 ... 0
0 0 length([v2,v6]∗
)
length([v2,v6]) ... 0
. . .
. . .
. . .
...
. . .
0 0 0 ... length([v5,v0]∗
)
length([v5,v0])









,
where the subindices in M1,1 indicate that we are sending 1-dimensional elements of the original mesh
to 1-dimensional elements of the dual mesh.
Somewhat less intuitive is the meaning of the geometric Hodge star operator on nodes of the original
mesh. As we saw in Subsection 2.2,
?1 = e1 ∧ e2,
which geometrically means that the Hodge star ?[v6] must be a polygon with area equal to 1 (classically,
it is a parallelogram, but can also be a hexahedron of area 1 as in this example).
v6 [ ] ★
However, in the dual mesh we have the polygon [v6]∗
6 v * [ ]A GEOMETRIC DESCRIPTION OF DISCRETE EXTERIOR CALCULUS FOR GENERAL TRIANGULATIONS 13
so that we need to resize ?[v6] as follows
[v6]∗
= Area([v6]∗
) ? [v6].
If we do that for all the vertices, we obtain the discrete Hodge star matrix
M0,2 =





Area([v0]∗
) 0 ... 0
0 Area([v1]∗
) ... 0
. . .
. . .
...
. . .
0 0 ... Area([v6]∗
)





.
The inverse matrix will deal with the case when we take the Hodge star of the 2D polygons in the
dual mesh to obtain points (with weight 1) in the original mesh.
In summary, the various matrices M representing the discrete Hodge star operator send elements
of the original mesh to elements of the dual mesh.
3.5. DEC applied to 2D Poisson’s equation. Consider the 2D Poisson’s equation
κ∆f = q.
As we have seen, this can be rewritten as
κ ? ∇∧
? ∇(f) = q.
Suppose that we wish to solve the equation on the meshed domain K. The equation can them be
discretized as the matrix equation
κ M2,0 ∇∧,dual
1,2 M1,1 ∇∧
0,1 [f] = [q]
where M0,2,∇∧,dual
1,2 = −∇T
0,1,M1,1 and ∇∧
0,1 denote the matrices corresponding to the relevant mesh,
such as the ones described in the previous subsections, and [f] and [q] denote the discretizations of the
functions f and q at the nodes/vertices. Later on, it will be convenient to work with the equivalent
system
κ (∇∧
0,1)T
M1,1 ∇∧
0,1[f] = M0,2[q]
4. DEC for general triangulations
Since the boundary operator is really concerned with the connectivity of the mesh and does not
change under deformation of the mesh, the change in the setup of DEC for a deformed mesh must be
contained in the discrete Hodge star matrices. Since such matrices are computed in terms of lengths
and areas of oriented elements of the mesh, we will now examine how those ingredients transform
under deformation, a problem that was first considered in [10].
4.1. Dual mesh of an arbitrary triangle. In order to explain how to implement DEC for general
triangulations, let us consider first a mesh consisting of a single well-centered triangle, as well as its
dual mesh (see Figure 15).
Figure 15. Well-centered triangle and its dual mesh.14 HUMBERTO ESQUEDA, RAFAEL HERRERA, SALVADOR BOTELLO, AND MIGUEL ANGEL MORELES
The dual cells are given as follows:
[v1,v2,v3]∗
= [c],
[v1,v2]∗
= [p1,c],
[v2,v3]∗
= [p2,c],
[v3,v1]∗
= [p3,c],
[v1]∗
= [v1,p1,c,p3],
[v2]∗
= [v2,p2,c,p1],
[v3]∗
= [v3,p3,c,p2].
Now consider the cell [v3]∗
= [v3,p3,c,p2] subdivided as in Figure 16.
Figure 16. The subdivision of a 2-dimensional dual cell of a well-centered triangle.
If we deform continuously the triangle [v1,v2,v3] to become an obtuse triangle as in Figure 17,
(a) (b) (c)
Figure 17. Dual cells of a well-centered triangle.
we see in Figures 17(a) and 17(b) that the area of the blue subtriangle [v3,c,p3] decreases to 0
and in Figure 17(c) that it is completely outside of the triangle and, therefore, must be assigned a
negative sign. The same can be said about the 1-dimensional cell [p3,c], which originally is completely
contained in the triangle [v1,v2,v3], its size reduces to zero as the triangle is deformed (Figures 17(a)
and 17(b)), and eventually it is completely outside the triangle [v1,v2,v3] (Figure 17(c)) and a negative
sign must be assigned to it. On the other hand, part of the red subtriangle [v3,c,p2] still intersects
the interior of the triangle [v1,v2,v3] and, therefore, no assignment of sign is needed. Similarly for
the segment [p2,c]. In terms of numerical simulations, an implementation in terms of determinants
contains intrinscally the aforementioned change of signs.
4.2. Dual mesh of a general triangulation. Now consider the well-centered mesh and its dual in
Figure 18.A GEOMETRIC DESCRIPTION OF DISCRETE EXTERIOR CALCULUS FOR GENERAL TRIANGULATIONS 15
(a) (b)
Figure 18. (a) Well-centered triangular mesh of hexagon. (b) Dual mesh.
Observe the deformation of the blue-colored dual cell [v6]∗
in Figure 19(a) as the vertex v0 is moved
to make the triangle [v0,v6,v5] non-well-centered in Figure 19(b) and the vertex v4 is moved to make
the triangle [v4,v5,v6] non-well-centered in Figure 19(c).
(a) (b) (c)
Figure 19. Deformation of a 2-dimensional dual cell as the hexagonal region is deformed.
We have colored in red the part of the dual cell [v6]∗
in Figure 19(c) that must have the opposite
orientation of the blue-colored part. Similar considerations apply to the edges.
5. Numerical examples
5.1. First example. Let us solve the Poisson equation in a circle of radius one under the following
conditions (see Figure 20):
• heat difussion constant k = 1;
• source term q = −1;
• Dirichlet boundary condition u = 10.
The exact solution is
u(x,y) =
1
4
(1 − x2
− y2
) + 10.16 HUMBERTO ESQUEDA, RAFAEL HERRERA, SALVADOR BOTELLO, AND MIGUEL ANGEL MORELES
Figure 20. Disk of radius one with difussion constant k = 1, subject to a heat source q = −1.
The meshes used in this example are shown in Figure 21 and vary from very coarse to very fine.
(a) (b) (c)
(d) (e)
Figure 21. Meshes for unit disk.
The numerical results for the maximum temperature value (u(0,0) = 10.25) are exemplified in
Table 1 where a comparison with the Finite Element Method with linear interpolation functions
(FEML) is also shown. The FEML methodology that we used in the comparison can be consulted
[13, 12, 2]. For the sake of completeness in our comparison, here we compute the flux vectors in the
same way as in FEML.
Mesh #nodes #elements Max. Temp. Value Max. Flux Magnitude
DEC FEML DEC FEML
Figure 21(a) 9 8 10.250 10.285 0.270 0.307
Figure 21(b) 17 20 10.250 10.237 0.388 0.405
Figure 21(c) 41 56 10.250 10.246 0.449 0.453
Figure 21(d) 713 1304 10.250 10.250 0.491 0.492
Figure 21(e) 42298 83346 10.250 10.250 0.496 0.496
Table 1. Maximum temperature and Flux magnitude values in the numerical simulation.
The temperature distribution and Flux magnitude fields for the finest mesh are shown in Figure 22.
Figure 22. Temperature distribution and Flux magnitude fields for the finest mesh.
Figures 23(a), 23(b) and 23(c) show the graphs of the temperature and flux magnitude values along
a diameter of the circle for the different meshes of Figures 21(b), 21(c) and 21(d) respectively.A GEOMETRIC DESCRIPTION OF DISCRETE EXTERIOR CALCULUS FOR GENERAL TRIANGULATIONS 17
(a)
10
10.05
10.1
10.15
10.2
10.25
10.3
-1 0 1
FEML
DEC
Solution
0
0.1
0.2
0.3
0.4
0.5
0 0.2 0.4 0.6 0.8 1 1.2 1.4 1.6 1.8 2
FEML
DEC
Solution
(b)
10
10.05
10.1
10.15
10.2
10.25
10.3
-1 0 1
FEML
DEC
Solution
0
0.1
0.2
0.3
0.4
0.5
0 0.2 0.4 0.6 0.8 1 1.2 1.4 1.6 1.8 2
FEML
DEC
Solution
(c)
10
10.05
10.1
10.15
10.2
10.25
10.3
-1 0 1
FEML
DEC
Solution
0
0.1
0.2
0.3
0.4
0.5
0 0.2 0.4 0.6 0.8 1 1.2 1.4 1.6 1.8 2
FEML
DEC
Solution
Figure 23. Temperature and Flux magnitude graphs along a diameter of the circle for
different meshes: (a) Graphs for the Mesh in Figure 21(b); (b) Graphs for the Mesh in
Figure 21(c); (c) Graphs for the Mesh in Figure 21(d);
As can be seen from Table 1 and Figure 23, DEC behaves very well on coarse meshes. Note that
the maximum temperature values calculated with DEC matches the exact theoretical value even on
coarse meshes. As expected, the results of DEC and FEML are similar for fine meshes. We would
also like to point out the the computational costs of DEC and FEML are very similar.
5.2. Second example. In this example, we consider a region in the plane whose boundary consists
of segments of a straight line, a circle, a parabola, a cubic and an ellipse (see Figure 24).
Figure 24. Region with linear, quadratic and cubic boundary segments, together with
boundary conditions.
The meshes used in this example are shown in Figure 25 and vary from coarse to very fine.18 HUMBERTO ESQUEDA, RAFAEL HERRERA, SALVADOR BOTELLO, AND MIGUEL ANGEL MORELES
(a) (b) (c)
Figure 25. Three of the meshes used in the first example.
We set
• the source term q = 20.2;
• the heat diffusion constant k = 80.2;
• Newmann boundary condition h = 100 along the inner elliptical boundary;
• Dirichlet boundary condition u = 10 along the external boundary.
The numerical results for the maximum temperature and flux magnitude values are exemplified in
Table 2.
Max. Temp. Value Max. Flux Magnitude
Mesh #nodes #elements DEC FEML DEC FEML
Figure 25(a) 162 268 129.07 128.92 467.22 467.25
Figure 25(b) 678 1223 129.71 129.70 547.87 548.42
Figure 25(c) 9489 18284 130.00 130.00 591.58 591.63
27453 53532 130.01 130.01 597.37 597.38
651406 1295960 130.02 130.02 602.19 602.19
Table 2. Numerical simulation results.
The temperature and flux-magnitude distribution fields are shown in Figure 26.
(a) (b)
Figure 26. Temperature and Flux magnitude distribution fields.
Figure 27 shows the graphs of the temperature and the flux magnitude along a horizontal line crossing
the elliptical boundary for the first two meshes.A GEOMETRIC DESCRIPTION OF DISCRETE EXTERIOR CALCULUS FOR GENERAL TRIANGULATIONS 19
(a)
10
30
50
70
90
110
0 20 40 60 80 100
FEML
DEC
Solution
120
170
220
270
320
370
0 20 40 60 80 100
FEML
DEC
Solution
(b)
10
30
50
70
90
110
0 20 40 60 80 100
FEML
DEC
Solution
120
170
220
270
320
370
0 20 40 60 80 100
FEML
DEC
Solution
Figure 27. Temperature and Flux magnitude graphs along a horizontal line crossing the
elliptical boundary for the first two meshes.
As can be seen from Table 2 and Figure 27, the performance of DEC is very similar to that of FEML
in this example. As expected, when the mesh is refined, the two methods converge to the same values.
6. Conclusions
DEC is a relatively recent discretization scheme for PDE which takes into account the geometric
and analytic features of the operators and the domains involved. The main contributions of this paper
are the following:
(1) We have presented 2D DEC in a simplified manner, avoiding references to the theory of
differential forms and motivating geometrically the new operators.
(2) We have carried out a numerical comparison between DEC and FEML by solving the 2D
Poisson equation on two cirved domains. The numerical experiments show the solutions
obtained with DEC on coarse meshes are as good or better as those of FEML. On the other
hand, the experiements also show numerical convergence.
(3) The computational cost of DEC is similar to that of FEML.
Acknowledgements. The second named author was partially supported by a grant of CONACYT,
and would like to thank the International Centre for Numerical Methods in Engineering (CIMNE) and
the University of Swansea for their hospitality. We gratefully acknowledge the support of NVIDIA
Corporation with the donation of the Titan X Pascal GPU used for this research.
References
[1] D. Arnold, R. Falk, and R. Winther: “Finite element exterior calculus: From Hodge theory to numerical stability”,
Bulletin of the American Mathematical Society 47 (2010), no. 2, 281?354.
[2] S. Botello, M.A. Moreles, E. Oñate: “Modulo de Aplicaciones del Mtodo de los Elementos Finitos para resolver la
ecuacin de Poisson: MEFIPOISS.” Aula CIMNE-CIMAT, Septiembre 2010, ISBN 978-84-96736-95-5.
[3] E. Cartan: “Sur certaines expressions différentielles et le problème de Pfaff”. Annales Scientifiques de l’École
Normale Supérieure. Série 3. Paris: Gauthier-Villars. 16: 239?332 (1899)
[4] K. Crane, F. de Goes, M. Desbrun, P. Schröder: “Digital geometry processing with discrete exterior calculus.”
ACM SIGGRAPH 2013 Courses. ACM, 2013.
[5] I. Dassios, A. P. Jivkov, A. Abu-Muharib, P. James: “A mathematical model for plasticity and damage: A discrete
calculus formulation.” Journal of Computational and Applied Mathematics 312 (2017): 27-38.
[6] M. Desbrun, E. Kanso, Y. Tong: “Discrete differential forms for computational modeling.” In SIGGRAPH 06:
ACM SIGGRAPH 2006 Courses, pages 39–54, New York, NY, USA, 2006. ACM.20 HUMBERTO ESQUEDA, RAFAEL HERRERA, SALVADOR BOTELLO, AND MIGUEL ANGEL MORELES
[7] M. Griebel, C. Rieger, A. Schier: “Upwind Schemes for Scalar Advection-Dominated Problems in the Discrete
Exterior Calculus.” Transport Processes at Fluidic Interfaces. Birkhuser, Cham, 2017. 145-175.
[8] A. N. Hirani: “Discrete exterior calculus”. Diss. California Institute of Technology, 2003.
[9] A. N. Hirani, K. B. Nakshatrala, J. H. Chaudhry: “Numerical method for Darcy flow derived using Discrete
Exterior Calculus.” International Journal for Computational Methods in Engineering Science and Mechanics 16.3
(2015): 151-169.
[10] A. N. Hirani, K. Kalyanaraman, E. B. VanderZee: “Delaunay Hodge star”, Comput. Aided Des. 45 (2013) 540-544]
[11] M. S. Mohamed, A. N. Hirani, R. Samtaney: “Discrete exterior calculus discretization of incompressible Navier-
Stokes equations over surface simplicial meshes.” Journal of Computational Physics 312 (2016): 175-191.
[12] E. Oñate: “4 - 2D Solids. Linear Triangular and Rectangular Elements,” in Structural Analysis with the Finite
Element Method. Linear Statics, Volume 1: Basis and Solids, CIMNE-Springer, Barcelona, 2009. Pages 117-157,
ISBN 978-1-4020-8733-2
[13] O. C. Zienkiewicz, R. L. Taylor and J. Z. Zhu: “3 - Generalization of the finite element concepts. Galerkin-weighted
residual and variational approaches,” In The Finite Element Method Set (Sixth Edition), Butterworth-Heinemann,
Oxford, 2005, Pages 54-102, ISBN 9780750664318,
Centro de Investigación en Matemáticas
Jalisco s/n, Valenciana
Guanajuato, GTO 36240,Mexico
email: esqueda,rherrera,botello,moreles@cimat.mx