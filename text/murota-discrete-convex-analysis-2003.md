---
sha256: 045c6d8b00c3b667e614fb0b536461a1f4d053f49be54a62b75d0c8ca9a2e15d
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 895343
---
Discrete Convex Analysis
DT10_MurotaFM_12-19-12.indd 1 1/15/2013 9:36:51 AMEditorial Board
M. Aigner, Freie Universität Berlin, Germany
N. Alon, Tel Aviv University, Israel
E. Balas, Carnegie Mellon University, USA
J.- C. Bermond, Université de Nice–Sophia Antipolis, France
J. Berstel, Université Marne-la-Vallée, France
N. L. Biggs, The London School of Economics, United Kingdom
B. Bollobás, University of Memphis, USA
R. E. Burkard, Technische Universität Graz, Austria
D. G. Corneil, University of Toronto, Canada
I. Gessel, Brandeis University, USA
F. Glover, University of Colorado, USA
M. C. Golumbic, Bar-Ilan University, Israel
R. L. Graham, AT&T Research, USA
A. J. Hoffman, IBM T. J. Watson Research Center, USA
T. Ibaraki, Kyoto University, Japan
H. Imai, University of Tokyo, Japan
M. Karoński, Adam Mickiewicz University, Poland, and Emory
University, USA
R. M. Karp, University of Washington, USA
V. Klee, University of Washington, USA
K. M. Koh, National University of Singapore, Republic of 		
Singapore
B. Korte, Universität Bonn, Germany
A. V. Kostochka, Siberian Branch of the Russian Academy of
Sciences, Russia
F. T. Leighton, Massachusetts Institute of Technology, USA
T. Lengauer, Gesellschaft für Mathematik und
Datenverarbeitung mbH, Germany
S. Martello, DEIS University of Bologna, Italy
M. Minoux, Université Pierre et Marie Curie, France
R. Möhring, Technische Universität Berlin, Germany
C. L. Monma, Bellcore, USA
J. Nešetril, Charles University, Czech Republic
W. R. Pulleyblank, IBM T. J. Watson Research Center, USA
A. Recski, Technical University of Budapest, Hungary
C. C. Ribeiro, Catholic University of Rio de Janeiro, Brazil
H. Sachs, Technische Universität Ilmenau, Germany
A. Schrijver, CWI, The Netherlands
R. Shamir, Tel Aviv University, Israel
N. J. A. Sloane, AT&T Research, USA
W. T. Trotter, Arizona State University, USA
D. J. A. Welsh, University of Oxford, United Kingdom
D. de Werra, École Polytechnique Fédérale de Lausanne, 		
Switzerland
P. M. Winkler, Bell Labs, Lucent Technologies, USA
Yue Minyi, Academia Sinica, People’s Republic of China
Series Volumes
Dömösi, P. and Nehaniv, C. L., Algebraic Theory of Automata Networks
Murota, K., Discrete Convex Analysis
Toth, P. and Vigo, D., The Vehicle Routing Problem
Anthony, M., Discrete Mathematics of Neural Networks: Selected Topics
Creignou, N., Khanna, S., and Sudan, M., Complexity Classifications of Boolean Constraint Satisfaction Problems
Hubert, L., Arabie, P., and Meulman, J., Combinatorial Data Analysis: Optimization by Dynamic Programming
Peleg, D., Distributed Computing: A Locality-Sensitive Approach
Wegener, I., Branching Programs and Binary Decision Diagrams: Theory and Applications
Brandstädt, A., Le, V. B., and Spinrad, J. P., Graph Classes: A Survey
McKee, T. A. and McMorris, F. R., Topics in Intersection Graph Theory
Grilli di Cortona, P., Manzi, C., Pennisi, A., Ricca, F., and Simeone, B., Evaluation and Optimization of Electoral Systems
Siam Monographs on
Discrete Mathematics and Applications
The series includes advanced monographs reporting on the most recent theoretical, computational, or
applied developments in the field; introductory volumes aimed at mathematicians and other mathematically
motivated readers interested in understanding certain areas of pure or applied combinatorics; and graduate
textbooks. The volumes are devoted to various areas of discrete mathematics and its applications.
Mathematicians, computer scientists, operations researchers, computationally oriented natural and social
scientists, engineers, medical researchers, and other practitioners will find the volumes of interest.
Editor-in-Chief
Peter L. Hammer, RUTCOR, Rutgers, The State University of New Jersey
ˇ
DT10_MurotaFM_12-19-12.indd 2 1/15/2013 9:36:51 AMKazuo Murota
University of Tokyo
Tokyo, Japan
Society for Industrial and Applied Mathematics
Philadelphia
Discrete Convex Analysis
DT10_MurotaFM_12-19-12.indd 3 1/15/2013 9:36:51 AMCopyright © 2003 by the Society for Industrial and Applied Mathematics.
10 9 8 7 6 5 4 3 2
All rights reserved. Printed in the United States of America. No part of this book may
be reproduced, stored, or transmitted in any manner without the written permission of the
publisher. For information, write to the Society for Industrial and Applied Mathematics,
## 3600 Market Street, 6th Floor, Philadelphia, PA 19104-2688 USA.
Library of Congress Cataloging-in-Publication Data
Murota, Kazuo, 1955-
Discrete convex analysis / Kazuo Murota.
p. cm. — (SIAM monographs on discrete mathematics and applications)
Includes bibliographical references and index.
ISBN 978-1-611972-55-9
1. Convex functions. 2. Convex sets. 3. Mathematical analysis. I. Title. II. Series.
QA331.5.M87 2003
515’.8—dc21
									2003042468
is a registered trademark.
DT10_MurotaFM_12-19-12.indd 4 1/15/2013 9:36:51 AMsidca00si
2013/2/12
page v
Contents
List of Figures xi
Notation xiii
Preface xxi
## 1 Introduction to the Central Concepts 1
## 1.1 Aim and History of Discrete Convex Analysis . . . . . . . . . . 1
## 1.1.1 Aim . . . . . . . . . . . . . . . . . . . . . . . . . . . 1
## 1.1.2 History . . . . . . . . . . . . . . . . . . . . . . . . . 5
## 1.2 Useful Properties of Convex Functions . . . . . . . . . . . . . . 9
## 1.3 Submodular Functions and Base Polyhedra . . . . . . . . . . . . 15
## 1.3.1 Submodular Functions . . . . . . . . . . . . . . . . . 16
## 1.3.2 Base Polyhedra . . . . . . . . . . . . . . . . . . . . . 18
## 1.4 Discrete Convex Functions . . . . . . . . . . . . . . . . . . . . . 21
1.4.1 L-Convex Functions . . . . . . . . . . . . . . . . . . 21
1.4.2 M-Convex Functions . . . . . . . . . . . . . . . . . . 25
## 1.4.3 Conjugacy . . . . . . . . . . . . . . . . . . . . . . . 29
## 1.4.4 Duality . . . . . . . . . . . . . . . . . . . . . . . . . 32
## 1.4.5 Classes of Discrete Convex Functions . . . . . . . . 36
Bibliographical Notes . . . . . . . . . . . . . . . . . . . . . . . . . . . . 36
## 2 Convex Functions with Combinatorial Structures 39
## 2.1 Quadratic Functions . . . . . . . . . . . . . . . . . . . . . . . . . 39
## 2.1.1 Convex Quadratic Functions . . . . . . . . . . . . . 39
## 2.1.2 Symmetric M-Matrices . . . . . . . . . . . . . . . . 41
## 2.1.3 Combinatorial Property of Conjugate Functions . . 47
## 2.1.4 General Quadratic L-/M-Convex Functions . . . . . 51
## 2.2 Nonlinear Networks . . . . . . . . . . . . . . . . . . . . . . . . . 52
## 2.2.1 Real-Valued Flows . . . . . . . . . . . . . . . . . . . 52
## 2.2.2 Integer-Valued Flows . . . . . . . . . . . . . . . . . 56
## 2.2.3 Technical Supplements . . . . . . . . . . . . . . . . . 58
## 2.3 Substitutes and Complements in Network Flows . . . . . . . . . 61
## 2.3.1 Convexity and Submodularity . . . . . . . . . . . . 61
vsidca00si
2013/2/12
page vi
vi Contents
## 2.3.2 Technical Supplements . . . . . . . . . . . . . . . . . 63
## 2.4 Matroids . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 68
## 2.4.1 From Matrices to Matroids . . . . . . . . . . . . . . 68
## 2.4.2 From Polynomial Matrices to Valuated Matroids . . 71
Bibliographical Notes . . . . . . . . . . . . . . . . . . . . . . . . . . . . 74
## 3 Convex Analysis, Linear Programming, and Integrality 77
## 3.1 Convex Analysis . . . . . . . . . . . . . . . . . . . . . . . . . . . 77
## 3.2 Linear Programming . . . . . . . . . . . . . . . . . . . . . . . . 86
## 3.3 Integrality for a Pair of Integral Polyhedra . . . . . . . . . . . . 90
## 3.4 Integrally Convex Functions . . . . . . . . . . . . . . . . . . . . 92
Bibliographical Notes . . . . . . . . . . . . . . . . . . . . . . . . . . . . 99
4 M-Convex Sets and Submodular Set Functions 101
## 4.1 Deﬁnition . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 101
## 4.2 Exchange Axioms . . . . . . . . . . . . . . . . . . . . . . . . . . 102
## 4.3 Submodular Functions and Base Polyhedra . . . . . . . . . . . . 103
## 4.4 Polyhedral Description of M-Convex Sets . . . . . . . . . . . . . 108
## 4.5 Submodular Functions as Discrete Convex Functions . . . . . . 111
4.6 M-Convex Sets as Discrete Convex Sets . . . . . . . . . . . . . . 114
4.7 M
-Convex Sets . . . . . . . . . . . . . . . . . . . . . . . . . . . 116
4.8 M-Convex Polyhedra . . . . . . . . . . . . . . . . . . . . . . . . 118
Bibliographical Notes . . . . . . . . . . . . . . . . . . . . . . . . . . . . 119
5 L-Convex Sets and Distance Functions 121
## 5.1 Deﬁnition . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 121
## 5.2 Distance Functions and Associated Polyhedra . . . . . . . . . . 122
## 5.3 Polyhedral Description of L-Convex Sets . . . . . . . . . . . . . 123
5.4 L-Convex Sets as Discrete Convex Sets . . . . . . . . . . . . . . 125
5.5 L
-Convex Sets . . . . . . . . . . . . . . . . . . . . . . . . . . . 128
5.6 L-Convex Polyhedra . . . . . . . . . . . . . . . . . . . . . . . . . 131
Bibliographical Notes . . . . . . . . . . . . . . . . . . . . . . . . . . . . 131
6 M-Convex Functions 133
6.1 M-Convex Functions and M
-Convex Functions . . . . . . . . . 133
## 6.2 Local Exchange Axiom . . . . . . . . . . . . . . . . . . . . . . . 135
## 6.3 Examples . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 138
## 6.4 Basic Operations . . . . . . . . . . . . . . . . . . . . . . . . . . 142
## 6.5 Supermodularity . . . . . . . . . . . . . . . . . . . . . . . . . . . 145
## 6.6 Descent Directions . . . . . . . . . . . . . . . . . . . . . . . . . . 146
## 6.7 Minimizers . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 148
## 6.8 Gross Substitutes Property . . . . . . . . . . . . . . . . . . . . . 152
## 6.9 Proximity Theorem . . . . . . . . . . . . . . . . . . . . . . . . . 156
## 6.10 Convex Extension . . . . . . . . . . . . . . . . . . . . . . . . . . 158
## 6.11 Polyhedral M-Convex Functions . . . . . . . . . . . . . . . . . . 160
6.12 Positively Homogeneous M-Convex Functions . . . . . . . . . . 164sidca00si
2013/2/12
page vii
Contents vii
## 6.13 Directional Derivatives and Subgradients . . . . . . . . . . . . . 166
## 6.14 Quasi M-Convex Functions . . . . . . . . . . . . . . . . . . . . . 168
Bibliographical Notes . . . . . . . . . . . . . . . . . . . . . . . . . . . . 175
7 L-Convex Functions 177
7.1 L-Convex Functions and L
-Convex Functions . . . . . . . . . . 177
## 7.2 Discrete Midpoint Convexity . . . . . . . . . . . . . . . . . . . . 180
## 7.3 Examples . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 181
## 7.4 Basic Operations . . . . . . . . . . . . . . . . . . . . . . . . . . 183
## 7.5 Minimizers . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 185
## 7.6 Proximity Theorem . . . . . . . . . . . . . . . . . . . . . . . . . 186
## 7.7 Convex Extension . . . . . . . . . . . . . . . . . . . . . . . . . . 187
## 7.8 Polyhedral L-Convex Functions . . . . . . . . . . . . . . . . . . 189
## 7.9 Positively Homogeneous L-Convex Functions . . . . . . . . . . . 193
## 7.10 Directional Derivatives and Subgradients . . . . . . . . . . . . . 196
## 7.11 Quasi L-Convex Functions . . . . . . . . . . . . . . . . . . . . . 198
Bibliographical Notes . . . . . . . . . . . . . . . . . . . . . . . . . . . . 202
## 8 Conjugacy and Duality 205
## 8.1 Conjugacy . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 205
## 8.1.1 Submodularity under Conjugacy . . . . . . . . . . . 206
## 8.1.2 Polyhedral M-/L-Convex Functions . . . . . . . . . 208
## 8.1.3 Integral M-/L-Convex Functions . . . . . . . . . . . 212
## 8.2 Duality . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 216
## 8.2.1 Separation Theorems . . . . . . . . . . . . . . . . . 216
## 8.2.2 Fenchel-Type Duality Theorem . . . . . . . . . . . . 221
## 8.2.3 Implications . . . . . . . . . . . . . . . . . . . . . . 224
8.3 M2-Convex Functions and L2-Convex Functions . . . . . . . . . 226
8.3.1 M2-Convex Functions . . . . . . . . . . . . . . . . . 226
8.3.2 L2-Convex Functions . . . . . . . . . . . . . . . . . . 229
## 8.3.3 Relationship . . . . . . . . . . . . . . . . . . . . . . 234
## 8.4 Lagrange Duality for Optimization . . . . . . . . . . . . . . . . 234
## 8.4.1 Outline . . . . . . . . . . . . . . . . . . . . . . . . . 234
## 8.4.2 General Duality Framework . . . . . . . . . . . . . . 235
## 8.4.3 Lagrangian Function Based on M-Convexity . . . . 238
## 8.4.4 Symmetry in Duality . . . . . . . . . . . . . . . . . 241
Bibliographical Notes . . . . . . . . . . . . . . . . . . . . . . . . . . . . 244
## 9 Network Flows 245
## 9.1 Minimum Cost Flow and Fenchel Duality . . . . . . . . . . . . . 245
## 9.1.1 Minimum Cost Flow Problem . . . . . . . . . . . . . 245
## 9.1.2 Feasibility . . . . . . . . . . . . . . . . . . . . . . . . 247
## 9.1.3 Optimality Criteria . . . . . . . . . . . . . . . . . . 248
## 9.1.4 Relationship to Fenchel Duality . . . . . . . . . . . . 253
9.2 M-Convex Submodular Flow Problem . . . . . . . . . . . . . . . 255
9.3 Feasibility of Submodular Flow Problem . . . . . . . . . . . . . 258sidca00si
2013/2/12
page viii
viii Contents
## 9.4 Optimality Criterion by Potentials . . . . . . . . . . . . . . . . . 260
## 9.5 Optimality Criterion by Negative Cycles . . . . . . . . . . . . . 263
## 9.5.1 Negative-Cycle Criterion . . . . . . . . . . . . . . . 263
## 9.5.2 Cycle Cancellation . . . . . . . . . . . . . . . . . . . 265
## 9.6 Network Duality . . . . . . . . . . . . . . . . . . . . . . . . . . . 268
## 9.6.1 Transformation by Networks . . . . . . . . . . . . . 269
## 9.6.2 Technical Supplements . . . . . . . . . . . . . . . . . 273
Bibliographical Notes . . . . . . . . . . . . . . . . . . . . . . . . . . . . 278
## 10 Algorithms 281
## 10.1 Minimization of M-Convex Functions . . . . . . . . . . . . . . . 281
## 10.1.1 Steepest Descent Algorithm . . . . . . . . . . . . . . 281
## 10.1.2 Steepest Descent Scaling Algorithm . . . . . . . . . 283
## 10.1.3 Domain Reduction Algorithm . . . . . . . . . . . . . 284
## 10.1.4 Domain Reduction Scaling Algorithm . . . . . . . . 286
## 10.2 Minimization of Submodular Set Functions . . . . . . . . . . . . 288
## 10.2.1 Basic Framework . . . . . . . . . . . . . . . . . . . . 288
## 10.2.2 Schrijver’s Algorithm . . . . . . . . . . . . . . . . . 293
## 10.2.3 Iwata–Fleischer–Fujishige’s Algorithm . . . . . . . . 296
## 10.3 Minimization of L-Convex Functions . . . . . . . . . . . . . . . 305
## 10.3.1 Steepest Descent Algorithm . . . . . . . . . . . . . . 305
## 10.3.2 Steepest Descent Scaling Algorithm . . . . . . . . . 308
## 10.3.3 Reduction to Submodular Function Minimization . . 308
## 10.4 Algorithms for M-Convex Submodular Flows . . . . . . . . . . . 308
## 10.4.1 Two-Stage Algorithm . . . . . . . . . . . . . . . . . 309
## 10.4.2 Successive Shortest Path Algorithm . . . . . . . . . 311
## 10.4.3 Cycle-Canceling Algorithm . . . . . . . . . . . . . . 312
## 10.4.4 Primal-Dual Algorithm . . . . . . . . . . . . . . . . 313
## 10.4.5 Conjugate Scaling Algorithm . . . . . . . . . . . . . 318
Bibliographical Notes . . . . . . . . . . . . . . . . . . . . . . . . . . . . 321
## 11 Application to Mathematical Economics 323
## 11.1 Economic Model with Indivisible Commodities . . . . . . . . . . 323
## 11.2 Diﬃculty with Indivisibility . . . . . . . . . . . . . . . . . . . . 327
11.3 M
-Concave Utility Functions . . . . . . . . . . . . . . . . . . . 330
## 11.4 Existence of Equilibria . . . . . . . . . . . . . . . . . . . . . . . 334
## 11.4.1 General Case . . . . . . . . . . . . . . . . . . . . . . 334
11.4.2 M
-Convex Case . . . . . . . . . . . . . . . . . . . . 337
## 11.5 Computation of Equilibria . . . . . . . . . . . . . . . . . . . . . 340
Bibliographical Notes . . . . . . . . . . . . . . . . . . . . . . . . . . . . 344
## 12 Application to Systems Analysis by Mixed Matrices 347
## 12.1 Two Kinds of Numbers . . . . . . . . . . . . . . . . . . . . . . . 347
## 12.2 Mixed Matrices and Mixed Polynomial Matrices . . . . . . . . . 353
## 12.3 Rank of Mixed Matrices . . . . . . . . . . . . . . . . . . . . . . 356
12.4 Degree of Determinant of Mixed Polynomial Matrices . . . . . . 359sidca00si
2013/2/12
page ix
Contents ix
Bibliographical Notes . . . . . . . . . . . . . . . . . . . . . . . . . . . . 361
Bibliography 363
Index 381sidca00si
2013/2/12
page xi
List of Figures
## 1.1 Convex set and nonconvex set . . . . . . . . . . . . . . . . . . . . 2
## 1.2 Convex function . . . . . . . . . . . . . . . . . . . . . . . . . . . . 2
## 1.3 Conjugate function (Legendre–Fenchel transform) . . . . . . . . . 11
## 1.4 Separation for convex and concave functions . . . . . . . . . . . . 12
## 1.5 Discrete separation . . . . . . . . . . . . . . . . . . . . . . . . . . . 14
## 1.6 Convex and nonconvex discrete functions . . . . . . . . . . . . . . 14
## 1.7 Exchange property (B-EXC[Z]) . . . . . . . . . . . . . . . . . . . . 19
## 1.8 Deﬁnition of L-convexity . . . . . . . . . . . . . . . . . . . . . . . 22
## 1.9 Discrete midpoint convexity . . . . . . . . . . . . . . . . . . . . . . 23
## 1.10 Property of a convex function . . . . . . . . . . . . . . . . . . . . . 26
## 1.11 Exchange property in the deﬁnition of M-convexity . . . . . . . . 27
## 1.12 Conjugacy in discrete convexity . . . . . . . . . . . . . . . . . . . 31
1.13 Duality theorems (f: M
-convex function, h: M
-concave function) 35
## 1.14 Separation for convex sets . . . . . . . . . . . . . . . . . . . . . . . 35
1.15 Classes of discrete convex functions (M
-convex ∩ L
-convex =
M
2-convex ∩ L
2-convex = separable convex) . . . . . . . . . . . . 37
## 2.1 Electrical network . . . . . . . . . . . . . . . . . . . . . . . . . . . 42
## 2.2 Multiterminal network . . . . . . . . . . . . . . . . . . . . . . . . . 53
## 2.3 Characteristic curve . . . . . . . . . . . . . . . . . . . . . . . . . . 54
2.4 Conjugate discrete convex functions fa(ξ) and ga(η) . . . . . . . . 57
## 2.5 Discrete characteristic curve Γa . . . . . . . . . . . . . . . . . . . . 57
## 3.1 Conjugate function (Legendre–Fenchel transform) . . . . . . . . . 81
## 3.2 Separation for convex sets . . . . . . . . . . . . . . . . . . . . . . . 83
## 3.3 Separation for convex and concave functions . . . . . . . . . . . . 84
## 3.4 Nonconvexity in Minkowski sum . . . . . . . . . . . . . . . . . . . 91
3.5 Integral neighborhood N(x) of x (◦: point of N(x)) . . . . . . . . 94
## 3.6 Concept of integrally convex sets . . . . . . . . . . . . . . . . . . . 97
4.1 M
-convex sets . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 117
5.1 L
-convex sets . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 129
## 5.2 Discrete midpoint convexity . . . . . . . . . . . . . . . . . . . . . . 129
xisidca00si
2013/2/12
page xii
xii List of Figures
6.1 Scaling fα
for α = 2 . . . . . . . . . . . . . . . . . . . . . . . . . . 145
## 6.2 Minimum spanning tree problem . . . . . . . . . . . . . . . . . . . 149
## 6.3 Quasi-convex function . . . . . . . . . . . . . . . . . . . . . . . . . 168
## 7.1 Discrete midpoint convexity . . . . . . . . . . . . . . . . . . . . . . 181
## 8.1 Conjugacy in discrete convex functions . . . . . . . . . . . . . . . 215
8.2 Duality theorems (f: M
-convex function, h: M
-concave function) 224
## 9.1 Characteristic curve (kilter diagram) for linear cost . . . . . . . . 251
## 9.2 Minimum cost ﬂow problem for Fenchel duality . . . . . . . . . . . 254
## 9.3 Submodular ﬂow problem for M-convex intersection problem . . . 265
## 9.4 Transformation by a network . . . . . . . . . . . . . . . . . . . . . 269
## 9.5 Bipartite graphs for aggregation and convolution operations . . . . 272
## 9.6 Rooted directed tree for a laminar family . . . . . . . . . . . . . . 273
10.1 Structure of G and Ĝ at v
. . . . . . . . . . . . . . . . . . . . . . 316
10.2 Conjugate scaling fα
and scaling gα
for α = 2 . . . . . . . . . . 320
## 11.1 Consumer’s behavior . . . . . . . . . . . . . . . . . . . . . . . . . . 325
11.2 Exchange economy with no equilibrium for x◦
= (1,1) . . . . . . . 328
11.3 Minkowski sum D1(p) + D2(p) . . . . . . . . . . . . . . . . . . . . 329
## 11.4 Aggregate cost function Ψ and its convex closure Ψ for an exchange
economy with no equilibrium . . . . . . . . . . . . . . . . . . . . . 336
## 11.5 Graph for computing a competitive equilibrium . . . . . . . . . . . 341
## 12.1 Electrical network with mutual couplings . . . . . . . . . . . . . . 348
## 12.2 Hypothetical ethylene dichloride production system . . . . . . . . 350
## 12.3 Jacobian matrix in the chemical process simulation . . . . . . . . 351
## 12.4 Mechanical system . . . . . . . . . . . . . . . . . . . . . . . . . . . 352
12.5 Accurate numbers . . . . . . . . . . . . . . . . . . . . . . . . . . . 353sidca00si
2013/2/12
page xiii
Notation
function set
positively homogeneous
function
combinatorial
function
M-convex f ∈ M B = B(ρ) ∈ M0 γ̂ ∈ 0M γ ∈ T
L-convex g ∈ L D = D(γ) ∈ L0 ρ̂ ∈ 0L ρ ∈ S
0: = (0,0,...,0)
1: = (1,1,...,1)
2V
: set of all subsets of set V (i.e., power set of V )
∀: “for all,” “for any,” or “for each”
∃: “there exists” or “for some”

: transpose of a vector or a matrix
+: sum, Minkowski sum (3.21), (3.52)
2: inﬁmal convolution over Rn
(3.20)
2Z : inﬁmal convolution over Zn
(i.e., integer inﬁmal convolution) (6.43)
∨: componentwise maximum (1.28)
∨: “join” operation in a lattice Note 10.15
∧: componentwise minimum (1.28)
∧: “meet” operation in a lattice Note 10.15
| · |: cardinality (number of elements) of a set
[·,·]: interval (of reals or integers) (3.1), (3.54)
[·,·]R: interval of real numbers (3.1)
[·,·]Z: interval of integers (3.54)
·,· : inner product, pairing (1.7), (3.18)
|| · ||1: 1-norm of a vector (4.2)
|| · ||∞: ∞-norm of a vector (3.60)
· : convex hull of a set, convex closure of a function (3.56)
· : rounding up to the nearest integer section 3.4
· : rounding down to the nearest integer section 3.4
∂Rf(x): subdiﬀerential of (convex) function f at x (3.23), (6.86)
∂Zf(x): integral subdiﬀerential of (convex) function f at x (6.88)
∂
Rh(x): subdiﬀerential of (concave) function h at x (8.19)
∂
Zh(x): integral subdiﬀerential of (concave) function h at x (8.19)
∂+
a: initial vertex of arc a section 2.2
∂−
a: terminal vertex of arc a section 2.2
∂ξ: boundary of ﬂow ξ (2.27)
∂Ξ: set of boundaries of feasible ﬂows section 9.3
xiiisidca00si
2013/2/12
page xiv
xiv Notation
∂Ξ∗
: set of boundaries of optimal ﬂows section 9.4
ξ: ﬂow section 2.2, section 9.1
ξ: current section 2.2
η: tension section 2.2, section 9.1
η: voltage section 2.2
δ+
v: set of arcs leaving vertex v section 2.2
δ−
v: set of arcs entering vertex v section 2.2
δp: coboundary of potential p (2.28), (9.20)
δS: indicator function of set S (3.12), (3.51)
δS
•
: support function of set S (3.31)
Δ: Laplacian section 2.1.2
Δf(x;v,u): directional diﬀerence of f at x in the direction of χv − χu (6.2)
Δ+
X: set of arcs leaving vertex subset X (9.14)
Δ−
X: set of arcs entering vertex subset X (9.15)
γ: distance function section 5.2
γ: shortest path length with respect to distance function γ section 5.2
γ̂: extension of distance function γ (6.82)
γ: cost per unit ﬂow section 9.1.1
γp: reduced cost (9.33)
Γ1: cost function in network ﬂow problem (9.2), (9.38)
Γ2: cost function in network ﬂow problem (9.42)
Γ3: cost function in network ﬂow problem (9.7), (9.46)
Γa: characteristic curve of arc a (2.31)
κ: cut function (9.16)
μ: supermodular set function section 4.3
Π∗
: set of optimal potentials section 9.4
ρ: submodular set function (4.9)
ρ: rank function of a matroid section 2.4
ρ̂: Lovász extension (linear extension) of set function ρ (4.6)
χ0: zero vector section 2.1.3
χi: ith unit vector section 2.1.3
χX: characteristic vector of subset X (1.14)
ω: valuation of a matroid section 2.4.2
aﬀ S: aﬃne hull of set S section 3.1
argmaxf: set of maximizers of function f
argminf: set of minimizers of function f (3.16)
A[J]: submatrix of matrix A with column indices in J section 2.4
B: M-convex set, M-convex polyhedron section 4.1
(B): simultaneous exchange axiom of matroids section 2.4sidca00si
2013/2/12
page xv
Notation xv
B: base family of a matroid section 2.4
B(ρ): base polyhedron deﬁned by submodular set function ρ (4.13)
(B-EXC[R]): exchange axiom of M-convex polyhedra section 4.8
(B-EXC+[R]): exchange axiom of M-convex polyhedra section 4.8
(B-EXC[Z]): exchange axiom of M-convex sets section 4.1
(B-EXCw[Z]): exchange axiom of M-convex sets section 4.2
(B-EXC+[Z]): exchange axiom of M-convex sets section 4.2
(B-EXC−[Z]): exchange axiom of M-convex sets section 4.2
(B
-EXC[Z]): exchange axiom of M
-convex sets section 4.7
c: upper capacity function section 9.2
c: lower capacity function section 9.2
Cl: cost function of producer l section 11.1
C[Z → R]: set of univariate discrete convex functions (3.68)
C[Z → Z]: set of univariate integer-valued discrete convex functions section 3.4
C[R → R]: set of univariate polyhedral convex functions section 3.1
C[Z|R → R]: set of univariate integral polyhedral convex functions section 6.11
C[R → R|Z]: set of univariate dual-integral polyhedral convex functions
section 6.11
D: L-convex set, L-convex polyhedron section 5.1, section 5.6
Dh: demand function of consumer h section 11.1
D(γ): L-convex polyhedron deﬁned by distance function γ (5.4)
D(x): family of tight sets for base x (4.22)
deg: degree of a polynomial section 2.4.2
dep(x,u): smallest tight set for base x that contains element u Note 10.11
det: determinant of a matrix section 2.4.1
domρ: eﬀective domain of set function ρ (4.3)
domf: eﬀective domain of function f on Rn
or Zn
(3.3), (1.25), (1.26)
domRf: eﬀective domain of function f on Rn
(1.26)
domZf: eﬀective domain of function f on Zn
(1.25)
epif: epigraph of function f (3.14)
f: convex function, M-convex function section 3.1, section 1.4.2
f
(x;·): directional derivative of function f at x (3.24)
f: convex closure of function f (3.56)
˜ f: local convex extension of function f (3.61)
ˇ f(x,y): a lower bound for f(y) − f(x) (6.55)
f•
: (convex) conjugate of function f (3.26), (8.11)
f••
: biconjugate (f•
)•
of function f section 3.1
f[a,b]: restriction of function f to interval [a,b] (3.55)sidca00si
2013/2/12
page xvi
xvi Notation
fU: restriction of function f to subset U (6.40)
fU
: projection of function f to subset U (6.41)
fU∗
: aggregation of function f to subset U (6.42)
fα
: scaling of function f (6.47)
fα
: conjugate scaling of function f (10.77)
f[−p](x): = f(x) − p,x (3.22), (3.69)
F: a ﬁeld section 12.2
F(s): ﬁeld of rational functions in variable s over F section 12.2
g: L-convex function section 1.4.1
G = (V,A): directed graph with vertex set V and arc set A
section 2.2, section 9.2
h: concave function, M-concave function section 3.1, section 8.2
h◦
: (concave) conjugate of function h (3.28), (8.12)
H: set of consumers section 11.1
inf: inﬁmum
k: L-concave function section 8.2
K: set of indivisible commodities section 11.1
K: subﬁeld of ﬁeld F section 12.2
K(s): ﬁeld of rational functions in variable s over K section 12.2
L: set of producers section 11.1
L0[Z]: set of L-convex sets section 5.1
L̃0[Z]: set of indicator functions of L-convex sets section 1.4.3
L0[R]: set of L-convex polyhedra section 5.6
L0[Z|R]: set of integral L-convex polyhedra section 5.6
L
0[Z]: set of L
-convex sets section 5.5
L
0[R]: set of L
-convex polyhedra section 5.6
L
0[Z|R]: set of integral L
-convex polyhedra section 5.6
L[Z → R]: set of L-convex functions section 7.1
L[Z → Z]: set of integer-valued L-convex functions section 7.1
L[R → R]: set of polyhedral L-convex functions section 7.8
L[Z|R → R]: set of integral polyhedral L-convex functions section 7.8
L[R → R|Z]: set of dual-integral polyhedral L-convex functions section 7.8
L
[Z → R]: set of L
-convex functions section 7.1
L
[Z → Z]: set of integer-valued L
-convex functions section 7.1
L
[R → R]: set of polyhedral L
-convex functions section 7.8
L
[Z|R → R]: set of integral polyhedral L
-convex functions section 7.8
L
[R → R|Z]: set of dual-integral polyhedral L
-convex functions section 8.1.2sidca00si
2013/2/12
page xvii
Notation xvii
0L[R → R]: set of positively homogeneous polyhedral L-convex functions
section 7.9
0L[Z|R → R]: set of positively homogeneous integral polyhedral L-convex
functions section 7.9
0L[R → R|Z]: set of positively homogeneous dual-integral polyhedral
L-convex functions section 8.1.2
0L[Z → R]: set of positively homogeneous L-convex functions section 7.9
0L[Z → Z]: set of positively homogeneous integer-valued L-convex
functions section 7.9
L2[Z → R]: set of L2-convex functions section 8.3
L2[Z → Z]: set of integer-valued L2-convex functions section 8.3
L
2[Z → R]: set of L
2-convex functions section 8.3
L
2[Z → Z]: set of integer-valued L
2-convex functions section 8.3
(L
-APR[Z]): property of L
-convex functions section 7.2
max: maximum
min: minimum
M0[Z]: set of M-convex sets section 4.1
M̃0[Z]: set of indicator functions of M-convex sets (1.21)
M0[R]: set of M-convex polyhedra section 4.8
M0[Z|R]: set of integral M-convex polyhedra section 4.8
M
0[Z]: set of M
-convex sets section 4.7
M
0[R]: set of M
-convex polyhedra section 4.8
M
0[Z|R]: set of integral M
-convex polyhedra section 4.8
M[Z → R]: set of M-convex functions section 6.1
M[Z → Z]: set of integer-valued M-convex functions section 6.1
M[R → R]: set of polyhedral M-convex functions section 6.11
M[Z|R → R]: set of integral polyhedral M-convex functions section 6.11
M[R → R|Z]: set of dual-integral polyhedral M-convex functions section 6.11
M
[Z → R]: set of M
-convex functions section 6.1
M
[Z → Z]: set of integer-valued M
-convex functions section 6.1
M
[R → R]: set of polyhedral M
-convex functions section 6.11
M
[Z|R → R]: set of integral polyhedral M
-convex functions section 6.11
M
[R → R|Z]: set of dual-integral polyhedral M
-convex functions section 8.1.2
0M[R → R]: set of positively homogeneous polyhedral M-convex functions
section 6.12
0M[Z|R → R]: set of positively homogeneous integral polyhedral M-convex
functions section 6.12
0M[R → R|Z]: set of positively homogeneous dual-integral polyhedral
M-convex functions section 8.1.2
0M[Z → R]: set of positively homogeneous M-convex functions section 6.12sidca00si
2013/2/12
page xviii
xviii Notation
0M[Z → Z]: set of positively homogeneous integer-valued M-convex functions
section 6.12
M2[Z → R]: set of M2-convex functions section 8.3
M2[Z → Z]: set of integer-valued M2-convex functions section 8.3
M
2[Z → R]: set of M
2-convex functions section 8.3
M
2[Z → Z]: set of integer-valued M
2-convex functions section 8.3
(M-EXC[Z]): exchange axiom of M-convex functions section 1.4.2, section 6.1
(M-EXC
[Z]): exchange axiom of M-convex functions section 1.4.2, section 6.1
(M-EXCloc[Z]): local exchange axiom of M-convex functions section 6.2
(M-EXCw[Z]): weak exchange axiom of M-convex functions section 6.2
(M-EXC[R]): exchange axiom of polyhedral M-convex functions
section 1.4.2, section 6.11
(M-EXC
[R]): exchange axiom of polyhedral M-convex functions section 6.11
(M
-EXC[Z]): exchange axiom of M
-convex functions section 1.4.2, section 6.1
(M
-EXC[R]): exchange axiom of polyhedral M
-convex functions
section 1.4.2, section 6.11
(M
-EXC
[R]): exchange axiom of polyhedral M
-convex functions section 6.11
(M
-EXC+
[R]): exchange axiom of polyhedral M
-convex functions section 2.1.3
(M
-EXCd[R]): exchange axiom of polyhedral M
-convex functions section 2.1.3
(M
-EXC+
d [R]): exchange axiom of polyhedral M
-convex functions section 2.1.3
(M-GS[Z]): gross substitutes property of M-convex functions section 6.8
(M
-GS[Z]): gross substitutes property of M
-convex functions section 6.8
(M
-SWGS[Z]): stepwise gross substitutes property of M
-convex functions
section 6.8
(M-SI[Z]): descent property of M-convex functions section 6.6
(M
-SI[Z]): descent property of M
-convex functions section 6.6
(−M
-EXC[Z]): exchange axiom of M
-concave functions section 11.3
(−M
-GS[Z]): gross substitutes property of M
-concave function section 11.3
(−M
-SWGS[Z]): stepwise gross substitutes property of M
-concave
functions section 11.3
(−M
-SI[Z]): ascent property of M
-concave functions section 11.3
MCFP0: minimum cost ﬂow problem (linear arc cost) section 9.1.1
MCFP3: minimum cost ﬂow problem (nonlinear cost) section 9.1.1
MSFP1: submodular ﬂow problem (linear arc cost) section 9.2
MSFP2: M-convex submodular ﬂow problem (linear arc cost) section 9.2
MSFP3: M-convex submodular ﬂow problem (nonlinear arc cost) section 9.2
maxSFP: maximum submodular ﬂow problem section 9.3
N(x): integral neighborhood of point x (3.58)
p: variable of an L-convex function section 1.4.1sidca00si
2013/2/12
page xix
Notation xix
p: potential section 2.2, section 9.4
p ∨ q: vector of componentwise maxima of p and q (1.28)
p ∧ q: vector of componentwise minima of p and q (1.28)
P(ρ): submodular polyhedron deﬁned by submodular set function ρ (4.28)
P(γ,γ̂,γ̌): L
-convex polyhedron deﬁned by (γ,γ̂,γ̌) (5.16)
Q: set of rational numbers
Q(ρ,μ): M
-convex polyhedron (g-polymatroid) deﬁned by (ρ,μ) (4.36)
R: set of real numbers
R+: set of nonnegative real numbers
R++: set of positive real numbers
riS: relative interior of set S section 3.1
sup: supremum
supp+
: positive support (2.21)
supp−
: negative support (2.21)
S: convex hull of set S section 3.1
S[R]: set of real-valued submodular set functions (4.10)
S[Z]: set of integer-valued submodular set functions (4.11)
(SBF[Z]): submodularity of functions on Zn
section 1.4.1, section 7.1
(SBF[R]): submodularity of functions on Rn
section 1.4.1, section 7.8
(SBF
[Z]): translation submodularity of functions on Zn
section 1.4.1, section 7.1
(SBF
[R]): translation submodularity of functions on Rn
section 1.4.1, section 7.8
(SBS[Z]): submodularity of sets in Zn
section 1.4.1, section 5.1
(SBS[R]): submodularity of sets in Rn
section 5.6
(SBS
[Z]): translation submodularity of sets in Zn
section 5.5
(SBS
[R]): translation submodularity of sets in Rn
section 5.6
Sl: supply function of producer l section 11.1
(SI): single improvement property section 11.3
T [R]: set of real-valued distance functions with triangle inequality section 5.2
T [Z]: set of integer-valued distance functions with triangle inequality section 5.2
(TRF[Z]): linearity in direction 1 of functions on Zn
section 1.4.1, section 7.1
(TRF[R]): linearity in direction 1 of functions on Rn
section 1.4.1, section 7.8
(TRS[Z]): translation property in direction 1 of sets in Zn
section 1.4.1, section 5.1
(TRS[R]): translation property in direction 1 of sets in Rn
section 5.6
Uh: utility function of consumer h section 11.1sidca00si
2013/2/12
page xx
xx Notation
(VM): axiom of valuated matroids section 2.4.2
x: variable of an M-convex function section 1.4.2
x◦
: total initial endowment (11.13)
Z: set of integers
Z+: set of nonnegative integers
Z++: set of positive integerssidca00si
2013/2/12
page xxi
Preface
Discrete Convex Analysis is aimed at establishing a novel theoretical frame-
work for solvable discrete optimization problems by means of a combination of the
ideas in continuous optimization and combinatorial optimization. The theoretical
framework of convex analysis is adapted to discrete settings and the mathemati-
cal results in matroid/submodular function theory are generalized. Viewed from
the continuous side, the theory can be classiﬁed as a theory of convex functions
f : Rn
→ R that have additional combinatorial properties. Viewed from the dis-
crete side, it is a theory of discrete functions f : Zn
→ Z that enjoy certain nice
properties comparable to convexity. Symbolically,
Discrete convex analysis = Convex analysis + Matroid theory.
The theory emphasizes duality and conjugacy as well as algorithms. This results in
a novel duality framework for nonlinear integer programming.
Two convexity concepts, called L-convexity and M-convexity, play primary
roles, where “L” stands for “lattice” and “M” for “matroid.” L-convex functions and
M-convex functions are convex functions with additional combinatorial properties
distinguished by “L” and “M,” which are conjugate to each other through a discrete
version of the Legendre–Fenchel transformation. L-convex functions and M-convex
functions generalize, respectively, the concepts of submodular set functions and base
polyhedra of (poly)matroids.
L-convexity and M-convexity prevail in discrete systems.
• In network ﬂow problems, ﬂow and tension are dual objects. Roughly speak-
ing, ﬂow corresponds to M-convexity and tension to L-convexity.
• In matroids, the rank function corresponds to L-convexity and the base family
to M-convexity.
• M-matrices in matrix theory correspond to L-convexity and their inverses to
M-convexity. Hence, in a discretization of the Poisson problem of partial
diﬀerential equations, for example, the diﬀerential operator corresponds to
L-convexity and the Green function to M-convexity.
• Dirichlet forms in probability theory are essentially the same as quadratic
L-convex functions.
This book is intended to be read proﬁtably by graduate students in operations
research, mathematics, and computer science and also by mathematics-oriented
xxisidca00si
2013/2/12
page xxii
xxii Preface
practitioners and application-oriented mathematicians. Self-contained presentation
is envisaged. In particular, no familiarity with matroid theory nor with convex
analysis is assumed. On the contrary, I hope the reader will acquire a uniﬁed view
on matroids and convex functions through a variety of examples of discrete systems
and the axiomatic approach presented in this book.
I would like to express my appreciation for the encouragement, support,
help, and criticism that I have received during my research on the theory of Dis-
crete Convex Analysis. Joint work with Akiyoshi Shioura and Akihisa Tamura
has been most substantial and collaborations with Satoru Fujishige, Satoru Iwata,
Gleb Koshevoy, and Satoko Moriguchi enjoyable. Moral support oﬀered by Bill
Cunningham, András Frank, and Láci Lovász has been encouraging. I have ben-
eﬁted from discussions with and/or comments by Andreas Dress, Atsushi Kajii,
Mamoru Kaneko, Takahiro Kawai, Takashi Kumagai, Tomomi Matsui, Makoto
Matsumoto, Shiro Matuura, Tom McCormick, Yoichi Miyaoka, Kiyohito Nagano,
Maurice Queyranne, András Recski, András Sebő, Maiko Shigeno, Masaaki Sug-
ihara, Zoltan Szigeti, Takashi Takabatake, Yoichiro Takahashi, Tamaki Tanaka,
Fabio Tardella, Levent Tunçel, Jens Vygen, Jun Wako, Walter Wenzel, Yoshitsugu
Yamamoto, and Zaifu Yang. In preparing this book I have been supported by sev-
eral friends. Among others, Akiyoshi Shioura and Akihisa Tamura went through the
text and provided comments and Satoru Iwata agreed that his unpublished results
be included in this book. A signiﬁcant part of this book is based on my previous
book [147] in Japanese published by Kyoritsu Publishing Company. Finally, I ex-
press my deep gratitude to Peter Hammer, the chief editor of this monograph series,
for his support in the realization of this book.
October 2002 Kazuo Murotasidca00si
2013/2/12
page 1
Chapter 1
Introduction to the
Central Concepts
Discrete Convex Analysis aims at establishing a new theoretical framework of dis-
crete optimization through mathematical studies of convex functions with combina-
torial structures or discrete functions with convexity structures. This chapter is a
succinct introduction to the central issues discussed in this book, including the role
of convexity in optimization, several classes of well-behaved discrete functions, and
duality theorems. We start with an account of the aim and the history of discrete
convex analysis.
## 1.1 Aim and History of Discrete Convex Analysis
The motive for Discrete Convex Analysis is explained in general terms of optimiza-
tion. Also included in this section is a brief chronological account of discrete convex
functions in relation to the theory of matroids and submodular functions.
## 1.1.1 Aim
An optimization problem, or a mathematical programming problem, may be ex-
pressed generically as follows:
Minimize f(x) subject to x ∈ S.
This means that we are to ﬁnd an x that minimizes the value of f(x) subject to
the constraint that x should belong to the set S. Both f and S are given as the
problem data, whereas x is a variable to be determined. The function f is called
the objective function and the set S the feasible set.
In continuous optimization, the variable x typically denotes a ﬁnite-dimensional
real vector, say, x ∈ Rn
, and accordingly we have S ⊆ Rn
and f : Rn
→ R (or
f : S → R).1
An optimization problem with S a convex set and f a convex function
1The notation R means the set of all real numbers and Rn the set of n-dimensional real vectors.
1sidca00si
2013/2/12
page 2
## 2 Chapter 1. Introduction to the Central Concepts
Figure 1.1. Convex set and nonconvex set.
-
6
Y Y = f(x)
x y z
λx + (1 − λ)y
Figure 1.2. Convex function.
is referred to as a convex program, where a set S is convex if the line segment join-
ing any two points in S is contained in S (see Fig. 1.1) and a function f : S → R
deﬁned on a convex set S is convex if
λf(x) + (1 − λ)f(y) ≥ f(λx + (1 − λ)y) (1.1)
whenever x,y ∈ S and 0 ≤ λ ≤ 1 (see Fig. 1.2). Convex programs constitute a class
of optimization problems that are tractable both theoretically and practically, with
a ﬁrm theoretical basis provided by “convex analysis.” The tractability of convex
programs is largely based on the following properties of convex functions:
1. Local optimality (or minimality) guarantees global optimality. This implies,
in particular, that a global optimum can be found by descent algorithms.
2. Duality, such as the min-max relation or the separation theorem, holds good.
This leads, for instance, to primal-dual algorithms using dual variables and
also to sensitivity analysis in terms of dual variables.sidca00si
2013/2/12
page 3
1.1. Aim and History of Discrete Convex Analysis 3
Some more details on these issues will be discussed in section 1.2.
In discrete optimization (or combinatorial optimization), on the other hand,
the variable x takes discrete values; most typically, x is an integer vector or a {0,1}-
vector. Whereas almost all discrete optimization problems arising from practical
applications are diﬃcult to solve eﬃciently, network ﬂow problems are recognized as
tractable discrete optimization problems. In the minimum cost ﬂow problem with
linear arc costs, for instance, we have the following fundamental facts that render
the problem tractable:
1. A ﬂow is optimal if and only if it cannot be improved by augmentation along
a cycle. This statement means that the global optimality of a solution can
be characterized by the local optimality with respect to augmentation along
a cycle.
2. A ﬂow is optimal if and only if there exists a potential on the vertex set
such that the reduced arc cost with respect to the potential is nonnegative
on every arc. This is a duality statement characterizing the optimality of
a ﬂow in terms of the dual variable (potential). This provides the basis for
primal-dual algorithms.
In more abstract terms, it is accepted that the tractability of the network ﬂow
problems stems from the matroidal structure (or submodularity) inherent therein.
Whereas the meaning of this statement will be substantiated later, it is mentioned
at this point that a matroid is an abstract combinatorial object deﬁned as a pair
of a ﬁnite set, say, V , and a family B of subsets of V that satisﬁes certain abstract
axioms. We refer to V as the ground set, a member of B as a base, and a subset
of a base as an independent set. The matroid is considered to be fundamental in
combinatorial optimization, which is evidenced by the following facts:2
1. A base is optimal with respect to a given weight vector if and only if it
cannot be improved by an elementary exchange, which means a modiﬁcation
of a base B to another base (B \ {u}) ∪ {v} with u in B and v not in B.
Thus, the local optimality with respect to elementary exchanges guarantees
the global optimality. Moreover, an optimal base can be found by the so-called
greedy algorithm, which may be compared to the steepest descent algorithm
in nonlinear optimization.
2. Given a pair of matroids on a common ground set, the intersection prob-
lem is to ﬁnd a common independent set of maximum cardinality. Edmonds’s
intersection theorem is a min-max duality theorem that characterizes the max-
imum cardinality as the minimum of a submodular function deﬁned by the
rank functions of the matroids.
With the above facts it is natural to think of matroidal structure as a discrete
or combinatorial analogue of convexity. The connection of matroidal structure to
convexity was formulated in the early 1980s as a relationship between submodular
2A more speciﬁc account of these facts will be given in section 1.3.sidca00si
2013/2/12
page 4
## 4 Chapter 1. Introduction to the Central Concepts
functions and convex functions. It was shown by Frank that Edmonds’s inter-
section theorem can be rewritten as a separation theorem for a pair of submod-
ular/supermodular functions, with an integrality (discreteness) assertion for the
separating hyperplane in the case of integer-valued functions. Another reformula-
tion of Edmonds’s intersection theorem is Fujishige’s Fenchel-type min-max duality
theorem for a pair of submodular/supermodular functions, again with an integrality
assertion in the case of integer-valued functions. A precise statement, beyond anal-
ogy, about the relationship between submodular functions and convex functions was
made by Lovász: A set function is submodular if and only if the so-called Lovász
extension of that set function is convex. These results led to the recognition that
the essence of the duality for submodular/supermodular functions consists of the
discreteness (integrality) assertion in addition to the duality for convex/concave
functions. Namely,
Duality for submodular functions = Convexity + Discreteness.
Such developments notwithstanding, our understanding of convexity in dis-
crete optimization seems to be only partial. In convex programming, a convex ob-
jective function is minimized over a convex feasible region, which may be described
by a system of inequalities in (other) convex functions. In matroid optimization,
explained above, the objective function is restricted to be linear and the feasible
region is described by a system of inequalities using submodular functions. This
means that the convexity argument for submodular functions applies to the con-
vexity of feasible regions and not to the convexity of objective functions. In the
literature, however, we can ﬁnd a number of nice structural results on discrete op-
timization of nonlinear objective functions. For example, the minimum cost ﬂow
problem with a separable convex cost function admits optimality criteria similar
to those for linear arc costs (Minoux [131] and others), which can be carried over
to the submodular ﬂow problem with a separable convex cost function (Fujishige
[65]). The minimization of a separable convex function over a base polyhedron also
admits a local optimality criterion with respect to elementary exchanges (Fujishige
[60], Girlich–Kowaljow [78], Groenevelt [81]). This fact is used in the literature of
resource allocation problems (Ibaraki–Katoh [93], Hochbaum [90], Hochbaum–Hong
[91], Girlich–Kovalev–Zaporozhets [77]). The convexity argument concerning sub-
modular functions, however, does not help us understand these results in relation
to convex analysis. We are thus waiting for a more general theoretical framework
for discrete optimization that can be compared to convex analysis for continuous
optimization.
Discrete Convex Analysis is aimed at establishing a general theoretical frame-
work for solvable discrete optimization problems by means of a combination of the
ideas in continuous optimization and combinatorial optimization. The theoretical
framework of convex analysis is adapted to discrete settings and the mathemati-
cal results in matroid/submodular function theory are generalized. Viewed from
the continuous side, the theory can be classiﬁed as a theory of convex functions
f : Rn
→ R that have additional combinatorial properties. Viewed from the dis-
crete side, it is a theory of discrete functions f : Zn
→ Z that enjoy certain nicesidca00si
2013/2/12
page 5
1.1. Aim and History of Discrete Convex Analysis 5
properties comparable to convexity.3
Symbolically,
Discrete convex analysis = Convex analysis + Matroid theory.
The theory emphasizes duality and conjugacy with a view to providing a novel
duality framework for nonlinear integer programming. It may be in order to mention
that the present theory extends the direction set forth by J. Edmonds, A. Frank,
S. Fujishige, and L. Lovász (see section 1.1.2), but it is, rather, independent of the
convexity arguments in the theories of greedoids, antimatroids, convex geometries,
and oriented matroids (Björner–Las Vergnas–Sturmfels–White–Ziegler [16], Korte–
Lovász–Schrader [114]).
Two convexity concepts, called L-convexity and M-convexity, play primary
roles in the present theory. L-convex functions and M-convex functions are both
(extensible to) convex functions and they are conjugate to each other through a
discrete version of the Legendre–Fenchel transformation. L-convex functions and M-
convex functions generalize, respectively, the concepts of submodular set functions
and base polyhedra. It is noted that the “L” in “L-convexity” stands for “lattice”
and the “M” in “M-convexity” for “matroid.”
## 1.1.2 History
This section is devoted to an account of the history of discrete convex functions
in matroid theory that led to L-convex and M-convex functions (see Table 1.1).
There are, however, many other previous and recent studies on discrete convex-
ity outside the literature of the matroid (Hochbaum–Shamir–Shanthikumar [92],
Ibaraki–Katoh [93], Kindler [112], Miller [130], and so on).
The concept of matroids was introduced by H. Whitney [218] in 1935, together
with the equivalence between the submodularity of rank functions and the exchange
property of independent sets. This equivalence is the germ of the conjugacy between
L-convex and M-convex functions in the present theory of discrete convex analysis.
In the late 1960s, J. Edmonds found a fundamental duality theorem on the
intersection problem for a pair of (poly)matroids. This theorem, Edmonds’s inter-
section theorem, shows a min-max relation between the maximum of a common
independent set and the minimum of a submodular function derived from the rank
functions. The famous article of Edmonds [44] convinced us of the fundamental
role of submodularity in discrete optimization. Analogies of submodular functions
to convex functions and to concave functions were discussed at the same time. The
min-max relation supported the analogy to convex functions, whereas some other
facts pointed to concave functions. No unanimous conclusion was reached at this
point.
The relationship between submodular functions and convex functions, which
was made clear in the early 1980s through the work of A. Frank, S. Fujishige,
and L. Lovász, was described in section 1.1.1 but is mentioned again in view of
its importance. The fundamental relationship between submodular functions and
convex functions, due to Lovász [123], says that a set function is submodular if
3The notation Z means the set of all integers and Zn the set of n-dimensional integer vectors.sidca00si
2013/2/12
page 6
## 6 Chapter 1. Introduction to the Central Concepts
Table 1.1. History (matroid and convexity).
Year (ca.) Author(s) Result
## 1935 Whitney [218] axioms of matroid
exchange property
⇔ submodularity
## 1965 Edmonds [44] polymatroid
polyhedral method
intersection theorem
1975 weighted matroid intersection
Edmonds [45]
Lawler [118]
Tomizawa–Iri [201] potential
Iri–Tomizawa [96] potential
Frank [54] weight splitting
1982 relationship to convexity
Frank [55] discrete separation theorem
Fujishige [62] Fenchel-type duality
Lovász [123] Lovász (linear) extension
## 1990 Dress–Wenzel [41], [42] valuated matroid
axiom, greedy algorithm
Favati–Tardella [49] integrally convex function
## 1995 Murota [135], [139] valuated matroid intersection
Murota [137], [140] L-/M-convex function
Fenchel-type duality
separation theorem
Murota–Shioura [151] M
-convex function
2000 Fujishige–Murota [68] L
-convex function
Murota–Shioura [152] polyhedral L-/M-convex function
Murota–Shioura [156], [157] continuous L-/M-convex function
and only if the Lovász extension of that function is convex. Reformulations of
Edmonds’s intersection theorem into a separation theorem for a pair of submod-
ular/supermodular functions by Frank [55] and a Fenchel-type min-max duality
theorem by Fujishige [62] indicate its similarity to convex analysis. The discrete
mathematical content of these theorems, which cannot be captured by the rela-
tionship of submodularity to convexity, lies in the integrality assertion for integer-
valued submodular/supermodular functions. Further analogy to convex analysis,
such as subgradients, was conceived by Fujishige [63]. These developments in the
1980s led us to the understanding that (i) submodularity should be compared to
convexity, not to concavity, and (ii) the essence of the duality for a pair of sub-
modular/supermodular functions lies in the discreteness (integrality) assertion insidca00si
2013/2/12
page 7
1.1. Aim and History of Discrete Convex Analysis 7
addition to the duality for convex/concave functions:
(i) submodular functions ≃ convex functions,
(ii) duality for submodular functions ≃ convexity + discreteness.
A remark is in order here, although it involves technical terminology from convex
analysis. The Lovász extension of a submodular set function is a convex function,
but it is bound to be positively homogeneous (f(λx) = λf(x) for λ ≥ 0). As a matter
of fact, it coincides with the support function of the base polyhedra associated
with the submodular function. This suggests that the convexity arguments on
submodularity deal with a restricted class of convex functions, namely, the class of
support functions of convex sets. The relationship of submodular set functions to
convex functions summarized in (i) and (ii) above is generalized to the full extent
by the concept of L-convex functions in the present theory.
Addressing the issue of local vs. global optimality for functions deﬁned on
integer lattice points, P. Favati and F. Tardella [49] came up with the concept
of integrally convex functions in 1990. This concept successfully captures a fairly
general class of functions on integer lattice points, for which a local optimality
implies the global optimality. Moreover, the class of submodular integrally convex
functions (i.e., integrally convex functions that are submodular on integer lattice
points) was considered as a subclass of integrally convex functions. It turns out
that this concept is equivalent to a variant of L-convex functions, called L
-convex
functions, in the present theory.
We have so far seen major milestones on the road toward L-convex functions
and now turn to M-convex functions.
A weighted version of the matroid intersection problem was introduced by
Edmonds [44]. The problem is to ﬁnd a maximum-weight common independent set
(or a common base) with respect to a given weight vector. Eﬃcient algorithms for
this problem were developed in the 1970s by Edmonds [45], Lawler [118], Tomizawa–
Iri [201], and Iri–Tomizawa [96] on the basis of a nice optimality criterion in terms
of dual variables. The optimality criterion of Frank [54] in terms of weight splitting
can be thought of as a version of such an optimality criterion using dual variables.
The weighted matroid intersection problem was generalized to the polymatroid
intersection problem as well as to the submodular ﬂow problem. It should be
noted, however, that in all of these generalizations the weighting remained linear or
separable convex.
The concept of valuated matroids, introduced by Dress and Wenzel [41], [42]
in 1990, provides a nice framework for nonlinear optimization on matroids. A val-
uation of a matroid is a nonlinear and nonseparable function of bases satisfying a
certain exchange axiom. It was shown by Dress and Wenzel that a version of the
greedy algorithm works to maximize a matroid valuation and this property in turn
characterizes a matroid valuation. Not only the greedy algorithm but also the inter-
section problem extends to valuated matroids. The valuated matroid intersection
problem, introduced by Murota [135], is to maximize the sum of two valuations.
This generalizes the weighted matroid intersection problem, since linear weighting
is a special case of matroid valuation. Optimality criteria, such as weight splitting,sidca00si
2013/2/12
page 8
## 8 Chapter 1. Introduction to the Central Concepts
as well as algorithms for the weighted matroid intersection, are generalized to the
valuated matroid intersection (Murota [136]). An analogy of matroid valuations to
concave functions resulted in a Fenchel-type min-max duality theorem for matroid
valuations (Murota [139]). This Fenchel-type duality is neither a generalization nor
a special case of Fujishige’s Fenchel-type duality for submodular functions, but these
two can be generalized into a single min-max equation, which is the Fenchel-type
duality theorem in the present theory.
A further analogy of valuated matroids to concave functions led to the concept
of M-convex/concave functions in Murota [137], 1996. M-convexity is a concept of
“convexity” for functions deﬁned on integer lattice points in terms of an exchange
axiom and aﬀords a common generalization of valuated matroids and (integral)
polymatroids. A valuated matroid can be identiﬁed with an M-concave function
deﬁned on {0,1}-vectors. The base polyhedron of an integral polymatroid is a syn-
onym for a {0,+∞}-valued M-convex function. The valuated matroid intersection
problem and the polymatroid intersection problem are uniﬁed into the M-convex
intersection problem. The Fenchel-type duality theorem for matroid valuations is
generalized for M-convex functions and the submodular ﬂow problem is general-
ized to the M-convex submodular ﬂow problem (Murota [142]), which involves an
M-convex function as a nonlinear cost. The nice optimality criterion using dual
variables survives in this generalization. Thus, M-convex functions yield fruitful
generalizations of many important optimization problems on matroids.
The two independent lines of development, namely, the convexity argument
for submodular functions in the early 1980s and that for valuated matroids and
M-convex functions in the early 1990s, were merged into a uniﬁed framework of
discrete convex analysis advocated by Murota [140] in 1998. The concept of L-
convex functions was introduced as a generalization of submodular set functions.
L-convex functions form a conjugate class of M-convex functions with respect to
the Legendre–Fenchel transformation. This completes the picture of conjugacy
advanced by Whitney [218] in 1935 as the equivalence between the submodularity
of the rank function of a matroid and the exchange property of independent sets of
a matroid. The duality theorems carry over to L-convex and M-convex functions.
In particular, the separation theorem for L-convex functions is a generalization of
Frank’s separation theorem for submodular functions.
Ramiﬁcations of the concepts of L- and M-convexity followed. M
-convex func-
tions,4
introduced by Murota–Shioura [151], are essentially equivalent to M-convex
functions, but are sometimes more convenient. For example, a convex function in
one variable, when considered only for integer values of the variable, is an M
-convex
function that is not M-convex. L
-convex functions, due to Fujishige–Murota [68],
are an equivalent variant of L-convex functions. It turns out that L
-convex func-
tions are exactly the same as the submodular integrally convex functions that had
been introduced by Favati–Tardella [49] in their study of local vs. global optimality.
The success of polyhedral methods in combinatorial optimization naturally sug-
gests the possibility of polyhedral versions of L- and M-convex functions. This idea
was worked out by Murota–Shioura [152] with the introduction of the concepts of
4“M-convex” should be read “M-natural-convex” and similarly for “L-convex.”sidca00si
2013/2/12
page 9
1.2. Useful Properties of Convex Functions 9
L- and M-convexity for polyhedral functions (piecewise linear functions in real vari-
ables). These convexity concepts were deﬁned also for quadratic functions (Murota–
Shioura [155]) and for closed convex functions (Murota–Shioura [156], [157]).
We conclude this section with a remark on a subtle point in the relationship
between submodularity and convexity. From the discussion in the early 1980s we
have agreed that submodularity should be compared to convexity. This statement
is certainly true for set functions. When it comes to functions on integer points,
however, we need to be careful. As a matter of fact, an M
-concave function is
submodular and concave extensible (Theorems 6.19 and 6.42), whereas an L
-convex
function is submodular and convex extensible (Theorem 7.20). This shows that
submodularity and convexity are mutually independent properties for functions on
integer points. It is undoubtedly true, however, that submodularity is essentially
related to discrete convexity.
## 1.2 Useful Properties of Convex Functions
We have already mentioned that convex functions are tractable in optimization (or
minimization) problems, which is mainly because of the following properties:
1. Local optimality (or minimality) guarantees global optimality.
2. Duality, e.g., the min-max relation or the separation theorem, holds good.
The purpose of this section is to give more speciﬁc descriptions of these properties
and to discuss their possible versions for discrete functions.
Let us ﬁrst recall the deﬁnition of a convex function. A function f : Rn
→
R ∪ {+∞} is said to be convex if
λf(x) + (1 − λ)f(y) ≥ f(λx + (1 − λ)y) (1.2)
for all x,y ∈ Rn
and for all λ with 0 ≤ λ ≤ 1, where it is understood that the
inequality is satisﬁed if f(x) or f(y) is equal to +∞. The inequality (1.2) implies
that the set
S = {x ∈ Rn
| f(x) < +∞},
called the eﬀective domain of f, is a convex set. Hence, the present deﬁnition of
a convex function coincides with the one in (1.1) that makes explicit reference to
the eﬀective domain S. A special case of inequality (1.2) for λ = 1/2 yields the
midpoint convexity
f(x) + f(y)
2
≥ f

x + y
2

(x,y ∈ Rn
) (1.3)
and, conversely, this implies convexity provided f is continuous. We often assume
(explicitly or implicitly) that f(x) < +∞ for some x ∈ Rn
whenever we talk about
a convex function f. A function h : Rn
→ R∪{−∞} is said to be concave if −h is
convex.
A point (or vector) x is said to be a global optimum of f if the inequality
f(x) ≤ f(y) (1.4)sidca00si
2013/2/12
page 10
## 10 Chapter 1. Introduction to the Central Concepts
holds for every y and a local optimum if this inequality holds for every y in some
neighborhood of x. Obviously, global optimality implies local optimality. The
converse is not true in general, but it is true for convex functions.
Theorem 1.1. For a convex function, global optimality (or minimality) is guaran-
teed by local optimality.
Proof. Let x be a local optimum of a convex function f. Then we have f(z) ≥ f(x)
for any z in some neighborhood U of x. For any y, z = λx +(1 −λ)y belongs to U
for λ < 1 suﬃciently close to 1 and it follows from (1.2) that
λf(x) + (1 − λ)f(y) ≥ f(λx + (1 − λ)y) = f(z) ≥ f(x).
This implies f(y) ≥ f(x).
The above theorem is signiﬁcant and useful in that it reduces the global prop-
erty to a local one. Still it refers to an inﬁnite number of points or directions around
x for the local optimality. In considering discrete structures on top of convexity we
may hope that a ﬁxed and ﬁnite set of directions suﬃces to guarantee the local
optimality. For example, in the simplest case of a separable convex function
f(x) =
n 
i=1
fi(x(i)), (1.5)
which is the sum of univariate convex functions5
fi(x(i)) in each component of
x = (x(i) | i = 1,...,n), it suﬃces to check for local optimality in 2n directions:
the positive and negative directions of the coordinate axes. Such a phenomenon of
discreteness in direction, so to speak, is a reﬂection of the combinatorial structure
of separable convex functions. Although the combinatorial structure of separable
convex functions is too simple for further serious consideration, similar phenom-
ena of discreteness in direction occur in nontrivial ways for L-convex or M-convex
functions, as we will see in section 1.4.
We now go on to the second issue of duality and conjugacy. For a function f
(not necessarily convex), the convex conjugate f•
: Rn
→ R ∪ {+∞} is deﬁned by
f•
(p) = sup{ p,x − f(x) | x ∈ Rn
} (p ∈ Rn
), (1.6)
where
p,x =
n 
i=1
p(i)x(i) (1.7)
for p = (p(i) | i = 1,...,n) and x = (x(i) | i = 1,...,n). The function f•
is
also referred to as the (convex) Legendre–Fenchel transform of f and the mapping
f → f•
as the (convex) Legendre–Fenchel transformation.
5A univariate function means a function in a single variable.sidca00si
2013/2/12
page 11
1.2. Useful Properties of Convex Functions 11
-
x
6 Y
Y = f(x)
Y = p,x − f•
(p)
−f•
(p)
Figure 1.3. Conjugate function (Legendre–Fenchel transform).
For example, for f(x) = exp(x), where n = 1, we see
f•
(p) =
⎧
⎨
⎩
plogp − p (p > 0),
0 (p = 0),
+∞ (p < 0)
by a simple calculation. See Fig. 1.3 for the geometric meaning in the case of n = 1.
The Legendre–Fenchel transformation gives a one-to-one correspondence in
the class of well-behaved convex functions, called closed proper convex functions,
where the precise meaning of this technical terminology (not important here) will
be explained later in section 3.1. The notation f••
means (f•
)•
, the conjugate of
the conjugate function of f.
Theorem 1.2 (Conjugacy). The Legendre–Fenchel transformation f → f•
gives a
symmetric one-to-one correspondence in the class of all closed proper convex func-
tions. That is, for a closed proper convex function f, f•
is a closed proper convex
function and f••
= f.
Similarly, for a function h, the concave conjugate h◦
: Rn
→ R ∪ {−∞} is
deﬁned by
h◦
(p) = inf{ p,x − h(x) | x ∈ Rn
} (p ∈ Rn
). (1.8)
The duality principle in convex analysis can be expressed in a number of dif-
ferent forms. One of the most appealing statements is in the form of the separation
theorem, which asserts the existence of a separating aﬃne function Y = α∗
+ p∗
,x
for a pair of convex and concave functions (see Fig. 1.4).
Theorem 1.3 (Separation theorem). Let f : Rn
→ R ∪ {+∞} and h : Rn
→
R∪{−∞} be convex and concave functions, respectively (satisfying certain regularitysidca00si
2013/2/12
page 12
## 12 Chapter 1. Introduction to the Central Concepts
-
x
6 Y
Y = f(x)
Y = h(x)
Y = α∗
+ p∗
,x
Figure 1.4. Separation for convex and concave functions.
conditions). If 6
f(x) ≥ h(x) (∀x ∈ Rn
),
there exist α∗
∈ R and p∗
∈ Rn
such that
f(x) ≥ α∗
+ p∗
,x ≥ h(x) (∀x ∈ Rn
).
It is admitted that the statement above is mathematically incomplete, refer-
ring to certain regularity conditions, which will be speciﬁed later in section 3.1.
Another expression of the duality principle is in the form of the Fenchel duality.
This is a min-max relation between a pair of convex and concave functions and their
conjugate functions. The certain regularity conditions in the statement below will
be speciﬁed later.
Theorem 1.4 (Fenchel duality). Let f : Rn
→ R ∪ {+∞} and h : Rn
→ R ∪
{−∞} be convex and concave functions, respectively (satisfying certain regularity
conditions). Then
min{f(x) − h(x) | x ∈ Rn
} = max{h◦
(p) − f•
(p) | p ∈ Rn
}.
Such a min-max theorem is computationally useful in that it aﬀords a cer-
tiﬁcate of optimality. Suppose that we want to minimize f(x) − h(x) and have
x = x̂ as a candidate for the minimizer. How can we verify or prove that x̂ is
indeed an optimal solution? One possible way is to ﬁnd a vector p̂ such that
f(x̂) − h(x̂) = h◦
(p̂) − f•
(p̂). This implies the optimality of x̂ by virtue of the
min-max theorem. The vector p̂, often called a dual optimal solution, serves as
6The notation ∀ means “for all,” “for any,” or “for each.”sidca00si
2013/2/12
page 13
1.2. Useful Properties of Convex Functions 13
a certiﬁcate for the optimality of x̂. It is emphasized that the min-max theorem
guarantees the existence of such a certiﬁcate p̂ for any optimal solution x̂. It is also
mentioned that the min-max theorem does not tell us how to ﬁnd optimal solutions
x̂ and p̂.
It is one of the recurrent themes in discrete convexity how the conjugacy
and the duality above should be adapted in discrete settings. To be speciﬁc, let
us consider integer-valued functions on integer lattice points and discuss possible
notions of conjugacy and duality for f : Zn
→ Z ∪ {+∞} and h : Zn
→ Z ∪
{−∞}. Some ingredients of discreteness (integrality) are naturally expected in the
formulation of conjugacy and duality. This amounts to discussing another kind
of discreteness, discreteness in value, in contrast with discreteness in direction,
mentioned above.
Discrete versions of the Legendre–Fenchel transformations can be deﬁned by
f•
(p) = sup{ p,x − f(x) | x ∈ Zn
} (p ∈ Zn
), (1.9)
h◦
(p) = inf{ p,x − h(x) | x ∈ Zn
} (p ∈ Zn
). (1.10)
They are meaningful as transformations of discrete functions in that the resulting
functions f•
and h◦
are also integer valued on integer points. We call (1.9) and
(1.10), respectively, convex and concave discrete Legendre–Fenchel transformations.
With these deﬁnitions, a discrete version of the Fenchel duality would read as
follows.
[Discrete Fenchel-type duality theorem] Let f : Zn
→ Z ∪ {+∞} and
h : Zn
→ Z ∪ {−∞} be convex and concave functions, respectively (in
an appropriate sense). Then
min{f(x) − h(x) | x ∈ Zn
} = max{h◦
(p) − f•
(p) | p ∈ Zn
}.
Such a theorem, if any, claims a min-max duality relation for integer-valued non-
linear functions, which is not likely to be true for an arbitrary class of discrete
functions. It is emphasized that the deﬁnition of convexity itself is left open in the
above generic statement, although h should be called concave when −h is convex.
As for the separation theorem, a possible discrete version would read as fol-
lows, imposing integrality (α∗
∈ Z, p∗
∈ Zn
) on the separating aﬃne function (see
Fig. 1.5).
[Discrete separation theorem] Let f : Zn
→ Z∪{+∞} and h : Zn
→ Z∪
{−∞} be convex and concave functions, respectively (in an appropriate
sense). If
f(x) ≥ h(x) (∀x ∈ Zn
),
there exist α∗
∈ Z and p∗
∈ Zn
such that
f(x) ≥ α∗
+ p∗
,x ≥ h(x) (∀x ∈ Zn
).
Again the precise deﬁnition of convexity remains unspeciﬁed here.sidca00si
2013/2/12
page 14
## 14 Chapter 1. Introduction to the Central Concepts
Y = f(x)
Y = h(x)
Y = α∗
+ p∗
,x
Figure 1.5. Discrete separation.
6
f
-
x
6
f
-
x
Figure 1.6. Convex and nonconvex discrete functions.
To motivate the framework we will introduce in the subsequent sections, let
us try a naive and natural candidate for the convexity concept, which turns out to
be insuﬃcient.
Let us (temporarily) deﬁne f : Zn
→ Z ∪ {+∞} to be convex if it can be
extended to a convex function on Rn
, i.e., if there exists a convex function f :
Rn
→ R ∪ {+∞} such that
f(x) = f(x) (x ∈ Zn
). (1.11)
This is illustrated in Fig. 1.6.
In the one-dimensional case (with n = 1), this is equivalent to deﬁning f :
Z → Z ∪ {+∞} to be convex if
f(x − 1) + f(x + 1) ≥ 2f(x) (∀x ∈ Z). (1.12)
As is easily veriﬁed, the discrete separation theorem, as well as the discrete Fenchel
duality, holds with this deﬁnition in the case of n = 1.
When it comes to higher dimensions, the situation is not that simple. The
following examples demonstrate that the discrete separation fails with this naive
deﬁnition of convexity.sidca00si
2013/2/12
page 15
1.3. Submodular Functions and Base Polyhedra 15
Example 1.5 (Failure of discrete separation). Consider two discrete functions
deﬁned by
f(x) = max(0,x(1) + x(2)), h(x) = min(x(1),x(2)),
where x = (x(1),x(2)) ∈ Z2
. They are integer valued on the integer lattice Z2
,
with f(0) = h(0) = 0, and can be extended, respectively, to a convex function
f : R2
→ R and a concave function h : R2
→ R given by
f(x) = max(0,x(1) + x(2)), h(x) = min(x(1),x(2)),
where x = (x(1),x(2)) ∈ R2
. Since f(x) ≥ h(x) (∀x ∈ R2
), the separation theorem
in convex analysis (Theorem 1.3) applies to the pair (f,h) to yield a (unique)
separating aﬃne function p∗
,x , with p∗
= (1/2,1/2). We have f(x) ≥ p∗
,x ≥
h(x) for all x ∈ R2
and, a fortiori, f(x) ≥ p∗
,x ≥ h(x) for all x ∈ Z2
. However,
there exists no integral vector p∗
∈ Z2
such that f(x) ≥ p∗
,x ≥ h(x) for all
x ∈ Z2
. This demonstrates the failure of the desired discreteness in the separating
aﬃne function.
Example 1.6 (Failure of real-valued separation). This example shows that even
the existence of a separating aﬃne function can be denied. For the discrete functions
f(x) = |x(1) + x(2) − 1|, h(x) = 1 − |x(1) − x(2)|,
where x = (x(1),x(2)) ∈ Z2
, we have f(x) ≥ h(x) (∀x ∈ Z2
). There exists,
however, no pair of real number α∗
∈ R and real vector p∗
∈ R2
for which f(x) ≥
α∗
+ p∗
,x ≥ h(x) for all x ∈ Z2
. Note that the separation theorem in convex
analysis (Theorem 1.3) does not apply to the pair of their convex/concaveextensions
(f,h), which are given by
f(x) = |x(1) + x(2) − 1|, h(x) = 1 − |x(1) − x(2)|
for x = (x(1),x(2)) ∈ R2
, since f(1/2,1/2) < h(1/2,1/2). This example also shows
that f ≥ h on Rn
does not follow from f ≥ h on Zn
.
Similarly, the discrete Fenchel duality fails under the naive deﬁnition of con-
vexity. The above two examples serve to demonstrate this.
Thus, the naive approach to discrete convexity does not work, and some deep
combinatorial or discrete-mathematical considerations are needed. We are now
motivated to look at some results in the area of matroids and submodular functions,
which we hope will provide a clue for fruitful deﬁnitions of discrete convexity.
## 1.3 Submodular Functions and Base Polyhedra
We describe here a few results on submodular functions and base polyhedra that
are relevant to our discussion in this introductory chapter, whereas a more com-
prehensive treatment is given in section 4.3. Emphasis is placed on the conjugacy
relationship between these two objects and the analogy to convex functions recog-
nized in the early 1980s.sidca00si
2013/2/12
page 16
## 16 Chapter 1. Introduction to the Central Concepts
## 1.3.1 Submodular Functions
A set function7
ρ : 2V
→ R∪ {+∞}, which assigns a real number (or +∞) to each
subset of a given ﬁnite set V , is said to be submodular if
ρ(X) + ρ(Y ) ≥ ρ(X ∪ Y ) + ρ(X ∩ Y ) (∀X,Y ⊆ V ), (1.13)
where it is understood that the inequality is satisﬁed if ρ(X) or ρ(Y ) is equal to
+∞. This is called the submodularity inequality. We assume, for a set function ρ
in general, that ρ(∅) = 0 and ρ(V ) is ﬁnite. A function μ : 2V
→ R ∪ {−∞} is
supermodular if −μ is submodular.
The relationship between submodularity and convexity can be formulated in
terms of the Lovász extension (also called the Choquet integral or the linear exten-
sion). For any set function ρ : 2V
→ R ∪ {±∞} the Lovász extension of ρ is a
function ρ̂ : RV
→ R ∪ {±∞}, a real-valued function in real variables, deﬁned as
follows.8
For each p ∈ RV
, we index the elements of V in nonincreasing order in the
components of p; i.e., V = {v1,v2,...,vn} and
p(v1) ≥ p(v2) ≥ ··· ≥ p(vn),
where9
n = |V |. Using the notation pj = p(vj), Vj = {v1,v2,...,vj} for j =
1,...,n, and χX for the characteristic vector of a subset X ⊆ V deﬁned by
χX(v) =

1 (v ∈ X),
0 (v ∈ V \ X),
(1.14)
we have
p =
n−1 
j=1
(pj − pj+1)χVj + pnχVn . (1.15)
This is an expression of p as a linear combination of the characteristic vectors of
the subsets Vj. The linear interpolation of ρ according to this expression yields
ρ̂(p) =
n−1 
j=1
(pj − pj+1)ρ(Vj) + pnρ(Vn), (1.16)
which is the deﬁnition of the Lovász extension ρ̂ of ρ. Note that 0 × (±∞) = 0 in
(1.16) by convention. The Lovász extension ρ̂ is indeed an extension of ρ in that
ρ̂(χX) = ρ(X) for X ⊆ V .
The relationship between submodularity and convexity reads as follows.10
7The notation 2V means the set of all subsets of V or the power set of V . Hence, X ∈ 2V is
equivalent to saying that X is a subset of V .
8The notation RV means the real vector space with coordinates indexed by the elements of V .
If V consists of n elements, then RV may be identiﬁed with Rn. In the original deﬁnition, ρ̂(p) is
deﬁned only for nonnegative vectors p.
9The notation |V | means the number of elements of V .
10The proofs of Theorems 1.7 and 1.8 are given in Chapter 4, when we come to their rigorous
treatments in Theorems 4.16 and 4.17.sidca00si
2013/2/12
page 17
1.3. Submodular Functions and Base Polyhedra 17
Theorem 1.7 (Lovász). A set function ρ is submodular if and only if its Lovász
extension ρ̂ is convex.
Duality for a pair of submodular/supermodular functions is formulated in the
following discrete separation theorem. We use the notation
x(X) =

v∈X
x(v)
for a vector x = (x(v) | v ∈ V ) ∈ RV
and a subset X ⊆ V .
Theorem 1.8 (Frank’s discrete separation theorem). Let ρ : 2V
→ R∪{+∞} and
μ : 2V
→ R ∪ {−∞} be submodular and supermodular functions, respectively, with
ρ(∅) = μ(∅) = 0, ρ(V ) < +∞, and μ(V ) > −∞. If
ρ(X) ≥ μ(X) (∀X ⊆ V ),
there exists x∗
∈ RV
such that
ρ(X) ≥ x∗
(X) ≥ μ(X) (∀X ⊆ V ). (1.17)
Moreover, if ρ and μ are integer valued, the vector x∗
can be chosen to be integer
valued.
Let us elaborate on this theorem in reference to the separation theorem in
convex analysis. Let ρ̂ and μ̂ be the Lovász extensions of ρ and μ, respectively. We
have ρ̂ ≥ μ̂ on the nonnegative orthant RV
+ by the assumption ρ ≥ μ as well as the
deﬁnition (1.16) of the Lovász extension. Deﬁne functions g and k by g = ρ̂ and
k = μ̂ on RV
+ and g = +∞ and k = −∞ elsewhere. Then g is convex and k is
concave, by Theorem 1.7, and the separation theorem in convex analysis (Theorem
1.3) applies to the pair of g and k, yielding β∗
∈ R and x∗
∈ RV
such that
g(p) ≥ β∗
+ p,x∗
≥ k(p) (∀p ∈ RV
).
This inequality for p = χX yields the inequality (1.17) above, where β∗
= 0 follows
from g(0) = ρ(∅) = 0 and k(0) = μ(∅) = 0. Thus, the ﬁrst half of the discrete sepa-
ration theorem, the existence of a real vector x∗
, can be proved on the basis of the
separation theorem in convex analysis and the relationship between submodularity
and convexity. The combinatorial essence of the above theorem, therefore, consists
of the second half, claiming the existence of an integer vector for integer-valued
functions. Hence, we have the accepted understanding
Duality for submodular functions = Convexity + Discreteness,
mentioned in section 1.1.1.
We denote by S = S[Z] the class of integer-valued submodular set functions
and by 0L = 0L[Z → Z] that of discrete functions obtained as the restriction to ZV
of the Lovász extensions of some member of S. That is, 0L consists of functions
g : ZV
→ Z ∪ {+∞} such that g(p) = ρ̂(p) (∀p ∈ ZV
) for some ρ ∈ S. In view of
the above theorems, 0L is a promising class of discrete convex functions. This is
indeed true, as we will see in section 1.4.1.sidca00si
2013/2/12
page 18
## 18 Chapter 1. Introduction to the Central Concepts
## 1.3.2 Base Polyhedra
A submodular function ρ : 2V
→ R ∪ {+∞} is associated with a polyhedron B(ρ),
called the base polyhedron, deﬁned by
B(ρ) = {x ∈ RV
| x(X) ≤ ρ(X) (∀X ⊂ V ),x(V ) = ρ(V )}. (1.18)
We are particularly interested in the case of integer-valued ρ, for which the base
polyhedron is integral in the sense of
B(ρ) = B(ρ) ∩ ZV ,
where the overline designates the convex hull11
in RV
. This integrality means,
in particular, that all the vertices of the polyhedron B(ρ) are integer points. In this
integral case, we refer to B(ρ) as the integral base polyhedron associated with ρ.
Assuming the integrality of ρ, we consider a discrete set
B = B(ρ) ∩ ZV
,
the set of integer points contained in integral base polyhedron B(ρ). If integer-
valued submodular functions can be viewed as well-behaved discrete convex func-
tions, there is a fair chance of such discrete sets B being well-behaved discrete
convex sets. This is indeed the case in many senses, as we will see in Chapter 4.
Here we focus on an axiomatic characterization of such a B that makes no
explicit reference to the deﬁning submodular function ρ. Denoting the positive
support and the negative support of a vector x = (x(v) | v ∈ V ) ∈ ZV
by
supp+
(x) = {v ∈ V | x(v) > 0}, supp−
(x) = {v ∈ V | x(v) < 0}, (1.19)
we consider a simultaneous exchange property for a nonempty set B ⊆ ZV
:
(B-EXC[Z]) For x,y ∈ B and u ∈ supp+
(x − y), there exists v ∈
supp−
(x − y) such that x − χu + χv ∈ B and y + χu − χv ∈ B,
where χu is the characteristic vector of u ∈ V ; i.e., χu = χ{u} in the notation of
(1.14). See Fig. 1.7 for an illustration of this exchange property.
The following is a fundamental theorem connecting submodularity and ex-
changeability.12
Theorem 1.9. The class of integer-valued submodular functions ρ : 2V
→ Z ∪
{+∞} with ρ(∅) = 0 and ρ(V ) < +∞ and the class of nonempty subsets B ⊆ ZV
satisfying (B-EXC[Z]) are in one-to-one correspondence through mutually inverse
mappings:
ρ → B : B = B(ρ) ∩ ZV
,
B → ρ : ρ(X) = sup{x(X) | x ∈ B} (X ⊆ V ).
11The convex hull of a set means the smallest convex set containing the set.
12The proofs of Theorems 1.9, 1.10, 1.11, and 1.12 are given later when we come to their rigorous
or more general treatments in Theorems 4.15, 8.12, 6.26, and 4.18.sidca00si
2013/2/12
page 19
1.3. Submodular Functions and Base Polyhedra 19
- u
6
v
y
x
y + χu − χv = y
x
= x − χu + χv
-
?

6
Figure 1.7. Exchange property (B-EXC[Z]).
The relationship between submodularity and exchangeability, stated in The-
orem 1.9 above, can be reformulated as a conjugacy with respect to the discrete
Legendre–Fenchel transformation (1.9). This reformulation establishes a connection
to convex analysis.
Let M0[Z] denote the class of nonempty sets B satisfying the exchange axiom
(B-EXC[Z]) and M̃0[Z] be the class of the indicator functions δB of B ∈ M0[Z]; i.e.,
M0[Z] = {B | ∅ = B ⊆ ZV
,B satisﬁes (B-EXC[Z])}, (1.20)
M̃0[Z] = {δB | ∅ = B ⊆ ZV
,B satisﬁes (B-EXC[Z])}, (1.21)
where δB : ZV
→ {0,+∞} is deﬁned by
δB(x) =

0 (x ∈ B),
+∞ (x / ∈ B).
(1.22)
Recall also the notation 0L[Z → Z] for the class of the restrictions to ZV
of the
Lovász extensions of integer-valued submodular set functions. Then Theorem 1.9
can be rewritten as follows.
Theorem 1.10. Two classes of discrete functions, 0L = 0L[Z → Z] and M0 =
M̃0[Z], are in one-to-one correspondence under the discrete Legendre–Fenchel trans-
formation (1.9). That is, for g ∈ 0L and f ∈ M0, we have g•
∈ M0, f•
∈ 0L,
g••
= g, and f••
= f.
The conjugacy relationship between submodularity and exchangeability set
forth in the above theorem will be fully generalized to the conjugacy between L-
convexity and M-convexity in the present theory, as will be described soon in sec-
tion 1.4.3.
Fundamental optimization problems on base polyhedra are tractable even un-
der integrality constraints. We consider two representative problems here:
1. the optimal base problem to discuss the issue of local vs. global optimality
andsidca00si
2013/2/12
page 20
## 20 Chapter 1. Introduction to the Central Concepts
2. the (unweighted) intersection problem to show a min-max duality theorem
with discreteness assertion.
The two optimization problems on matroids mentioned in section 1.1.1 are
special cases of the above problems. This is because the base family of a matroid
can be identiﬁed, through characteristic vectors of bases, with a nonempty set B of
{0,1}-vectors having the exchange property (B-EXC[Z]).
Let B ⊆ ZV
be a nonempty set satisfying the exchange axiom (B-EXC[Z])
and c ∈ RV
be a given cost (weight) vector. The optimal base problem is to ﬁnd
x ∈ B that minimizes the cost f(x) = c,x = v∈V c(v)x(v). This problem admits
the following local optimality criterion for global optimality.13
Theorem 1.11. Assume B ⊆ ZV
satisﬁes (B-EXC[Z]). A point x ∈ B minimizes
f(x) = c,x over B if and only if f(x) ≤ f(x−χu +χv) for all u,v ∈ V such that
x − χu + χv ∈ B.
To describe the intersection problem we need to introduce another polyhedron
P(ρ) = {x ∈ RV
| x(X) ≤ ρ(X) (∀X ⊆ V )}, (1.23)
called the submodular polyhedron, associated with a submodular function ρ : 2V
→
R ∪ {+∞}. Given a pair of submodular functions ρ1 and ρ2 deﬁned on a common
ground set V , the intersection problem is to ﬁnd a vector x in P(ρ1) ∩ P(ρ2) that
maximizes the sum of the components x(V ). Edmonds’s intersection theorem below
shows a min-max duality relation in this problem.
Theorem 1.12 (Edmonds’s intersection theorem). Let ρ1,ρ2 : 2V
→ R ∪ {+∞}
be submodular functions with ρ1(∅) = ρ2(∅) = 0, ρ1(V ) < +∞, and ρ2(V ) < +∞.
Then
max{x(V ) | x ∈ P(ρ1) ∩ P(ρ2)} = min{ρ1(X) + ρ2(V \ X) | X ⊆ V }. (1.24)
Moreover, if ρ1 and ρ2 are integer valued, the polyhedron P(ρ1) ∩ P(ρ2) is integral
in the sense of
P(ρ1) ∩ P(ρ2) = P(ρ1) ∩ P(ρ2) ∩ ZV
and there exists an integer-valued vector x∗
that attains the maximum on the left-
hand side of (1.24).
Discreteness is twofold in Edmonds’s intersection theorem. First, the min-
imum on the right-hand side of (1.24) is taken over combinatorial objects, i.e.,
subsets of V , independently of whether the submodular functions are integer val-
ued or not. Second, the maximum can be taken over discrete (integer) points in the
case of integer-valued submodular functions. The former is sometimes referred to
as the dual integrality and the latter as the primal integrality.
13This is a generalization of a well-known optimality criterion for the minimum spanning tree
problem that a spanning tree is optimal if and only if no improvement is possible by exchanging
arcs in and out of the tree. Details are given in Example 6.27.sidca00si
2013/2/12
page 21
1.4. Discrete Convex Functions 21
In sections 1.4.2 and 1.4.4, exchange property (B-EXC[Z]) is generalized to
deﬁne the concept of M-convex functions and, accordingly, Edmonds’s intersection
theorem is generalized to the Fenchel-type duality theorem for M-convex functions.
## 1.4 Discrete Convex Functions
The backbone of the theory of discrete convex analysis is outlined in this section as a
quick preview of the main structural results to be presented in subsequent chapters.
The deﬁnitions of L-convex and M-convex functions are given, together with concise
descriptions of their major properties, including local optimality criteria for global
optimality, conjugacy between L-convexity and M-convexity, and various forms of
duality theorems.
We use the notation
domf = domZf = {x ∈ ZV
| −∞ < f(x) < +∞}, (1.25)
domg = domRg = {x ∈ RV
| −∞ < g(x) < +∞} (1.26)
for the eﬀective domains of f : ZV
→ R ∪ {±∞} and g : RV
→ R ∪ {±∞}.
1.4.1 L-Convex Functions
The ﬁrst kind of discrete convex functions, L-convex functions, is obtained from a
generalization of the Lovász extension of submodular set functions.
Let ρ : 2V
→ R ∪ {+∞} be a submodular set function and ρ̂ be its Lovász
extension, which is indeed an extension of ρ in the sense that ρ̂(χX) = ρ(X) for
X ⊆ V . The submodularity of ρ on 2V
, or that of ρ̂ on {0,1}V
, extends to the
entire space. In fact, it can be shown14
that g = ρ̂ satisﬁes
g(p) + g(q) ≥ g(p ∨ q) + g(p ∧ q) (∀p,q ∈ RV
), (1.27)
where p ∨ q and p ∧ q are, respectively, the vectors of componentwise maxima and
minima of p and q; i.e.,
(p ∨ q)(v) = max(p(v),q(v)), (p ∧ q)(v) = min(p(v),q(v)) (v ∈ V ). (1.28)
Note that the submodularity inequality (1.13) for ρ is a special case of (1.27) with
p = χX and q = χY because of the identities
χX∪Y = χX ∨ χY , χX∩Y = χX ∧ χY . (1.29)
It also follows immediately from the deﬁnition (1.16) that
g(p + α1) = g(p) + αr (∀p ∈ RV
,∀α ∈ R) (1.30)
for r = ρ(V ), where 1 = (1,1,...,1) ∈ RV
. This shows the linearity of g with
respect to the translation of p in the direction of 1. The properties (1.27) and
14Proofs of the claims in this subsection are given in Chapter 7.sidca00si
2013/2/12
page 22
## 22 Chapter 1. Introduction to the Central Concepts
q
p p ∧ q
p ∨ q
p̂
q̂

Figure 1.8. Deﬁnition of L-convexity.
(1.30) of the Lovász extension of a submodular set function are discretized to the
following deﬁnition of L-convex functions.
We say that a function g : ZV
→ R∪{+∞} with domZg = ∅ is L-convex if it
satisﬁes15,16
(SBF[Z]) g(p) + g(q) ≥ g(p ∨ q) + g(p ∧ q) (∀p,q ∈ ZV
),
(TRF[Z]) ∃r ∈ R such that g(p + 1) = g(p) + r (∀p ∈ ZV
).
Naturally, a function k is said to be L-concave if −k is L-convex.
Figure 1.8 illustrates, in the case of n = 2, how properties (SBF[Z]) and
(TRF[Z]) together can serve as a discrete analogue of convexity. By (SBF[Z]) and
(TRF[Z]) we obtain
g(p) + g(q) ≥ g(p ∨ q) + g(p ∧ q) = g(p̂) + g(q̂)
for the points p̂ and q̂, which are discrete approximations to the midpoint (p+q)/2.
This inequality may be thought of as a discrete approximation to the midpoint
convexity (1.3). We return to midpoint convexity in (1.33) below.
It follows from (SBF[Z]) and (TRF[Z]) that the eﬀective domain, say, D, of
an L-convex function satisﬁes17
(SBS[Z]) p,q ∈ D =⇒ p ∨ q,p ∧ q ∈ D,
(TRS[Z]) p ∈ D =⇒ p ± 1 ∈ D.
A nonempty set D ⊆ ZV
is called L-convex if it satisﬁes (SBS[Z]) and (TRS[Z])
above. Obviously, a set D is L-convex if and only if its indicator function δD is an
L-convex function.
Since an L-convex function g is linear in the direction of 1, we may dispense
with this direction as far as we are interested in its nonlinear behavior. Namely,
instead of the function g in n = |V | variables, we may consider a function g
in n−1
variables deﬁned by
g
(p
) = g(0,p
), (1.31)
15SBF stands for submodularity for functions and TRF for translation for functions.
16The notation ∃ means “there exists” or “for some” in contrast to ∀ meaning “for all” or “for
any.”
17SBS stands for submodularity for sets and TRS for translation for sets.sidca00si
2013/2/12
page 23
1.4. Discrete Convex Functions 23
p
q
p+q
2
p+q
2
q
p
p+q
2
p+q
2
p
q
p+q
2
p+q
2
Figure 1.9. Discrete midpoint convexity.
where, for an arbitrarily ﬁxed element v0 ∈ V , a vector p ∈ ZV
is represented as
p = (p0,p
), with p0 = p(v0) ∈ Z and p
∈ ZV 
for V 
= V \ {v0}. Note that the
eﬀective domain domZg
of g
is the restriction of domZg to the coordinate plane
deﬁned by p0 = 0. A function g
derived from an L-convex function by such a
restriction is called an L
-convex18
function.
More formally, an L
-convex function is deﬁned as follows. Let 0 denote a new
element not in V and put Ṽ = {0} ∪ V . A function g : ZV
→ R ∪ {+∞} is called
L
-convex if the function g̃ : ZṼ
→ R ∪ {+∞} deﬁned by
g̃(p0,p) = g(p − p01) (p0 ∈ Z,p ∈ ZV
) (1.32)
is L-convex. It turns out that L
-convexity can be characterized by a kind of gen-
eralized submodularity:
(SBF
[Z]) g(p) + g(q) ≥ g((p − α1) ∨ q) + g(p ∧ (q + α1))
(∀p,q ∈ ZV
,∀α ∈ Z+),
which we name translation submodularity. Note that this inequality for α = 0
coincides with the original submodularity (SBF[Z]).
An alternative characterization of L
-convexity is by discrete midpoint con-
vexity (see Fig. 1.9):
g(p) + g(q) ≥ g

p + q
2

+ g

p + q
2

(p,q ∈ ZV
), (1.33)
where p+q
2 and p+q
2 denote, respectively, the integer vectors obtained from p+q
2
by componentwise round-up and round-down to the nearest integers. The discrete
midpoint convexity is a natural approximation to the midpoint convexity (1.3) of
ordinary convex functions.
Whereas L
-convex functions are conceptually equivalent to L-convex func-
tions, the class of L
-convex functions is strictly larger than that of L-convex func-
tions. In fact, it is easy to derive the translation submodularity (SBF
[Z]) from
(SBF[Z]) and (TRF[Z]) or, more intuitively, a comparison of Figs. 1.9 and 1.8 in-
dicates this. The simplest example of an L
-convex function that is not L-convex is
the one-dimensional discrete convex function depicted in Fig. 1.6 (left).
18“L-convex” should be read “L-natural-convex.”sidca00si
2013/2/12
page 24
## 24 Chapter 1. Introduction to the Central Concepts
L-convex functions enjoy the following nice properties that are expected of
discrete convex functions.
• An L-convex function can be extended to a convex function.
• Local optimality (or minimality) guarantees global optimality. Speciﬁcally,
we have the following:
– For an L-convex function g and a point p ∈ domZg,
g(p) ≤ g(q) (∀q ∈ ZV
) ⇐⇒

g(p) ≤ g(p + χX) (∀X ⊆ V ),
g(p) = g(p + 1).
– For an L
-convex function g and a point p ∈ domZg,
g(p) ≤ g(q) (∀q ∈ ZV
) ⇐⇒ g(p) ≤ g(p ± χX) (∀X ⊆ V ).
Thus L-convex functions are endowed with the property of discreteness in
direction.
• Discrete duality, e.g., the Fenchel-type min-max duality or discrete separa-
tion, holds good. Thus, L-convex functions are endowed with the property of
discreteness in value. (This will be explained in section 1.4.4.)
• Eﬃcient algorithms can be designed for the minimization of an L-convex func-
tion and for the Fenchel-type min-max duality.
L-convexity is closely related to network ﬂow problems such as the minimum
cost ﬂow problem and the shortest path problem. As an indication of this connection
we mention that, given an integer-valued distance function19
γ on V , the set of
admissible integer-valued potentials
D = {p ∈ ZV
| p(v) − p(u) ≤ γ(u,v) (∀u,v ∈ V,u = v)} (1.34)
is an L-convex set. The converse is also true; i.e., any L-convex set has such a
polyhedral description for some γ satisfying the triangle inequality
γ(u,v) + γ(v,w) ≥ γ(u,w) (u,v,w ∈ V ). (1.35)
The concepts of L-/L
-convexity can also be deﬁned for functions in real vari-
ables through an appropriate adaptation of the conditions (SBF[Z]) and (TRF[Z]).
Namely, we can deﬁne a function g : RV
→ R ∪ {+∞} with domRg = ∅ to be
L-convex if
(SBF[R]) g(p) + g(q) ≥ g(p ∨ q) + g(p ∧ q) (∀p,q ∈ RV
),
(TRF[R]) ∃r ∈ R such that g(p + α1) = g(p) + αr
(∀p ∈ RV
,∀α ∈ R).
19An integer-valued distance function on V means a function γ : V ×V → Z ∪{+∞} such that
γ(v,v) = 0 for all v ∈ V .sidca00si
2013/2/12
page 25
1.4. Discrete Convex Functions 25
L
-convex functions are deﬁned as the restriction of L-convex functions, as in (1.31),
and are characterized by
(SBF
[R]) g(p) + g(q) ≥ g((p − α1) ∨ q) + g(p ∧ (q + α1))
(∀p,q ∈ RV
,∀α ∈ R+).
More precisely, L-convexity can be deﬁned for closed proper convex functions.20
Instead of dealing with this most general class of functions, this monograph focuses
on polyhedral convex functions21
and quadratic functions. The Lovász extension
of a submodular set function is a polyhedral L-convex function that has the ad-
ditional property of being positively homogeneous. Quadratic L
-convex functions
are characterized in section 2.1.2 as quadratic forms deﬁned by diagonally dominant
symmetric M-matrices22
and hence they are equivalent to the (ﬁnite-dimensional)
Dirichlet forms known in probability theory.
We conclude this section by identifying the four types of L-convex functions
that we are concerned with: real-valued L-convex functions on integers, integer-
valued L-convex functions on integers, real-valued polyhedral L-convex functions
on reals, and quadratic L-convex functions on reals. For the ﬁrst three classes we
introduce the following notation:
L[Z → R] = {g : ZV
→ R ∪ {+∞} | g is L-convex}, (1.36)
L[Z → Z] = {g : ZV
→ Z ∪ {+∞} | g is L-convex}, (1.37)
L[R → R] = {g : RV
→ R ∪ {+∞} | g is polyhedral L-convex}. (1.38)
Note the inclusion
0L[Z → Z] ⊆ L[Z → Z] ⊆ L[Z → R],
where 0L[Z → Z] is the notation from section 1.3.1 for the class of the restrictions
to ZV
of the Lovász extensions of integer-valued submodular set functions.
1.4.2 M-Convex Functions
The second kind of discrete convex functions, M-convex functions, is obtained from a
generalization of the simultaneous exchange property (B-EXC[Z]) of base polyhedra.
As a motivation for the axiom of M-convex functions, let us ﬁrst observe that
a convex function f : Rn
→ R ∪ {+∞} satisﬁes the inequality
f(x) + f(y) ≥ f(x − α(x − y)) + f(y + α(x − y)) (1.39)
for every α with 0 ≤ α ≤ 1. The validity of this inequality can be veriﬁed easily
from the deﬁnition of a convex function by adding the inequality (1.2) for λ = α
and (1.2) for λ = 1 − α.
20The deﬁnition of closed proper convex function can be found in section 3.1.
21A polyhedral convex function is a function that can be represented as the maximum of a ﬁnite
number of aﬃne functions on a polyhedral eﬀective domain.
22Here is an unfortunate conﬂict of our notation with the standard terminology in matrix theory.
M-matrices do not correspond to M-convex functions but to L-convex functions.sidca00si
2013/2/12
page 26
## 26 Chapter 1. Introduction to the Central Concepts
y
x
y
y + α(x − y)
x
x − α(x − y)
~
}
-
6 f(x)
y y
y + α(x − y)
x x
x − α(x − y)
- 
Figure 1.10. Property of a convex function.
The inequality (1.39) above shows that the sum of the function values evalu-
ated at two points, x and y, does not increase if the two points approach each other
by the same distance on the line segment connecting them (see Fig. 1.10). For a
function deﬁned on discrete points Zn
, we simulate this property by moving two
points along the coordinate axes rather than on the connecting line segment.
We say that a function f : ZV
→ R ∪ {+∞} with domZf = ∅ is M-convex if
it satisﬁes the following exchange axiom:
(M-EXC[Z]) For x,y ∈ domZf and u ∈ supp+
(x − y), there exists
v ∈ supp−
(x − y) such that
f(x) + f(y) ≥ f(x − χu + χv) + f(y + χu − χv). (1.40)
See Fig. 1.11 for an illustration of this exchange property. The inequality (1.40)
implicitly imposes the condition that x−χu+χv ∈ domZf and y+χu−χv ∈ domZf
for the ﬁniteness of the right-hand side. With the use of the notation
Δf(z;v,u) = f(z + χv − χu) − f(z) (1.41)
for z ∈ domZf and u,v ∈ V , the exchange axiom (M-EXC[Z]) can be expressed
alternatively as follows:
(M-EXC
[Z]) For x,y ∈ domZf,
max
u∈supp+(x−y)
min
v∈supp−(x−y)
[Δf(x;v,u) + Δf(y;u,v)] ≤ 0, (1.42)
where the maximum and the minimum over an empty set are −∞ and +∞, respec-
tively. Naturally, a function h is said to be M-concave if −h is M-convex.
It follows from (M-EXC[Z]) that the eﬀective domain of an M-convex function
satisﬁes the exchange axiom (B-EXC[Z]) that characterizes the set of integer points
in an integral base polyhedron, since x−χu +χv ∈ domZf and y+χu−χv ∈ domZfsidca00si
2013/2/12
page 27
1.4. Discrete Convex Functions 27
- u
6
v
y
x
y + χu − χv = y
x
= x − χu + χv
-
?

6
Figure 1.11. Exchange property in the deﬁnition of M-convexity.
for x,y ∈ domZf in (1.40). In particular, the indicator function δB : ZV
→ {0,+∞}
of a set B ⊆ ZV
is M-convex if and only if B is the set of integer points in an
integral base polyhedron. Accordingly, we refer to a set of integer points satisfying
(B-EXC[Z]) as an M-convex set.
The eﬀective domain of an M-convex function f, being an M-convex set, lies
on a hyperplane {x ∈ RV
| x(V ) = r} for some integer r and, accordingly, we may
consider the projection of f along a coordinate axis. This means that, instead of
the function f in n = |V | variables, we consider a function f
in n − 1 variables
deﬁned by
f
(x
) = f(x0,x
) with x0 = r − x
(V 
), (1.43)
where V 
= V \ {v0} for an arbitrarily ﬁxed element v0 ∈ V and a vector x ∈ ZV
is represented as x = (x0,x
) with x0 = x(v0) ∈ Z and x
∈ ZV 
. Note that
the eﬀective domain domZf
of f
is the projection of domZf along the chosen
coordinate axis v0. A function f
derived from an M-convex function by such a
projection is called an M
-convex23
function.
More formally, an M
-convex function is deﬁned as follows. Let 0 denote a
new element not in V and put Ṽ = {0} ∪ V . A function f : ZV
→ R ∪ {+∞} is
called M
-convex if the function ˜ f : ZṼ
→ R ∪ {+∞} deﬁned by
˜ f(x0,x) =

f(x) if x0 = −x(V ),
+∞ otherwise
(x0 ∈ Z,x ∈ ZV
) (1.44)
is an M-convex function. It turns out24
that an M
-convex function f can be
characterized by a similar exchange property:
(M
-EXC[Z]) For x,y ∈ domZf and u ∈ supp+
(x − y),
f(x) + f(y) ≥ min

f(x − χu) + f(y + χu),
min
v∈supp−(x−y)
{f(x − χu + χv) + f(y + χu − χv)}

. (1.45)
23“M-convex” should be read “M-natural-convex.”
24Proofs of the claims in this subsection are given in Chapter 6.sidca00si
2013/2/12
page 28
## 28 Chapter 1. Introduction to the Central Concepts
Whereas M
-convex functions are conceptually equivalent to M-convex func-
tions, the class of M
-convex functions is strictly larger than that of M-convex func-
tions. This follows from the implication (M-EXC[Z]) ⇒ (M
-EXC[Z]). The simplest
example of an M
-convex function that is not M-convex is the one-dimensional dis-
crete convex function depicted in Fig. 1.6 (left).
M-convex functions enjoy the following nice properties that are expected of
discrete convex functions.
• An M-convex function can be extended to a convex function.
• Local optimality (or minimality) guarantees global optimality. Speciﬁcally,
we have the following:
– For an M-convex function f and a point x ∈ domZf,
f(x) ≤ f(y) (∀y ∈ ZV
) ⇐⇒ f(x) ≤ f(x − χu + χv) (∀u,v ∈ V ).
(This is a generalization of Theorem 1.11.)
– For an M
-convex function f and a point x ∈ domZf,
f(x) ≤ f(y) (∀y ∈ ZV
) ⇐⇒

f(x) ≤ f(x − χu + χv) (∀u,v ∈ V ),
f(x) ≤ f(x ± χv) (∀v ∈ V ).
Thus, M-convex functions are endowed with the property of discreteness in
direction.
• Discrete duality, e.g., the Fenchel-type min-max duality or discrete separation,
holds good. Thus, M-convex functions are endowed with the property of
discreteness in value. (This will be explained in section 1.4.4.)
• Eﬃcient algorithms can be designed for the minimization of an M-convex
function and for the Fenchel-type min-max duality.
M-convex functions are closely related to network ﬂow problems, such as the
minimum cost ﬂow problem and the shortest path problem. As an indication of this
connection we mention that the distance γ on V deﬁned by γ(u,v) = Δf(x;v,u)
for u,v ∈ V with a ﬁxed x ∈ domZf satisﬁes the triangle inequality (1.35). This
is because the exchange property (M-EXC[Z]) applied to x̃ = x − χv + χw and
ỹ = x − χu + χv, for which supp+
(x̃ − ỹ) = {u,w} and supp−
(x̃ − ỹ) = {v},
yields f(x̃) + f(ỹ) ≥ f(x̃ − χu + χv) + f(ỹ + χu − χv), which is equivalent to
Δf(x;w,v) + Δf(x;v,u) ≥ Δf(x;w,u).
The concepts of M-/M
-convexity can also be deﬁned for functions in real
variables through an appropriate adaptation of the exchange axiom. Namely, we
can deﬁne a function f : RV
→ R ∪ {+∞} with domRf = ∅ to be M-convex if it
satisﬁes the following exchange property:sidca00si
2013/2/12
page 29
1.4. Discrete Convex Functions 29
(M-EXC[R]) For x,y ∈ domRf and u ∈ supp+
(x − y), there exist
v ∈ supp−
(x − y) and a positive number α0 ∈ R++ such that
f(x) + f(y) ≥ f(x − α(χu − χv)) + f(y + α(χu − χv))
for all α ∈ R with 0 ≤ α ≤ α0.
M
-convex functions are deﬁned as the projection of M-convex functions, as in
(1.43), and are characterized by the following:
(M
-EXC[R]) For x,y ∈ domRf and u ∈ supp+
(x − y), there exist
v ∈ supp−
(x − y) ∪ {0} and a positive number α0 ∈ R++ such that
f(x) + f(y) ≥ f(x − α(χu − χv)) + f(y + α(χu − χv))
for all α ∈ R with 0 ≤ α ≤ α0,
where χ0 = 0 by convention. More precisely, M-convexity can be deﬁned for closed
proper convex functions. Instead of dealing with this most general class of func-
tions, this monograph focuses on polyhedral convex functions and quadratic func-
tions. Polyhedral M-convex functions are a quantitative generalization of the base
polyhedra explained in section 1.3.2, whereas quadratic M-convex functions are
characterized in section 2.1.3 as quadratic forms deﬁned by the inverse of diago-
nally dominant symmetric M-matrices.
We conclude this section by identifying the four types of M-convex functions
that we are concerned with: real-valued M-convex functions on integers, integer-
valued M-convex functions on integers, real-valued polyhedral M-convex functions
on reals, and quadratic M-convex functions on reals. For the ﬁrst three classes we
introduce the following notation:
M[Z → R] = {f : ZV
→ R ∪ {+∞} | f is M-convex}, (1.46)
M[Z → Z] = {f : ZV
→ Z ∪ {+∞} | f is M-convex}, (1.47)
M[R → R] = {f : RV
→ R ∪ {+∞} | f is polyhedral M-convex}. (1.48)
Note the inclusion
M̃0[Z] ⊆ M[Z → Z] ⊆ M[Z → R],
where M̃0[Z] is the notation from section 1.3.2 for the class of indicator functions
of sets of integer points contained in integral base polyhedra.
## 1.4.3 Conjugacy
The conjugacy relationship between L-convexity and M-convexity is a distinguish-
ing feature of the present theory. Whereas conjugacy in ordinary convex analysis
gives a symmetric one-to-one correspondence within a single class of closed proper
convex functions (Theorem 1.2), conjugacy described in this section establishes a
one-to-one correspondence between two diﬀerent classes of discrete functions hav-
ing diﬀerent combinatorial properties denoted by “L” and “M.” We describe thesidca00si
2013/2/12
page 30
## 30 Chapter 1. Introduction to the Central Concepts
conjugacy for integer-valued L-convex and M-convex functions on integer points,
namely, for L = L[Z → Z] and M = M[Z → Z], although a similar conjugacy
relationship exists between L
-convex and M
-convex functions and also between
their polyhedral versions.
In Theorem 1.10 we saw the conjugacy between 0L = 0L[Z → Z] and M0 =
M̃0[Z] as a reformulation of the equivalence between submodularity for set functions
and exchangeability for discrete sets stated in Theorem 1.9. Since 0L and M0 are
subclasses of L and M, respectively, we can summarize our present knowledge as
L ⊇ 0L ←→ M0 ⊆ M,
where ←→ above denotes the conjugacy with respect to the discrete Legendre–
Fenchel transformation (1.9). The following theorem25
shows that the conjugacy
extends to a relation between L and M.
Theorem 1.13 (Discrete conjugacy theorem). The classes of integer-valued L-
convex functions and M-convex functions, L = L[Z → Z] and M = M[Z → Z], are
in one-to-one correspondence under the discrete Legendre–Fenchel transformation
(1.9). That is, for g ∈ L and f ∈ M, we have g•
∈ M, f•
∈ L, g••
= g, and
f••
= f.
The essence of the relationship between M0 and 0L is the conjugacy between
M-convex sets and their support functions, the latter being positively homogeneous
L-convex functions. Symmetrically, we can formulate the conjugacy between L-
convex sets and their support functions in the following theorem, where we denote
by L̃0[Z] the class of the indicator functions of L-convex sets and by 0M[Z → Z]
that of positively homogeneous M-convex functions.
Theorem 1.14. Two classes of discrete functions, L0 = L̃0[Z] and 0M = 0M[Z →
Z], are in one-to-one correspondence under the discrete Legendre–Fenchel transfor-
mation (1.9). That is, for g ∈ L0 and f ∈ 0M, we have g•
∈ 0M, f•
∈ L0, g••
= g,
and f••
= f.
Just as a positively homogeneous L-convex function can be identiﬁed with a
submodular set function, so can a positively homogeneous M-convex function f be
identiﬁed with a distance function γ on V satisfying the triangle inequality (1.35).
The correspondence is given by
γ(u,v) = f(χv − χu) (u,v ∈ V ),
which establishes a one-to-one mapping between 0M and T , where T = T [Z]
denotes the class of distance functions on V satisfying the triangle inequality (1.35).
Figure 1.12 demonstrates the conjugacy relations as well as the one-to-one
correspondences explained in the above. This diagram clariﬁes the relationship
among various classes of combinatorial objects, including submodular functions
25The proofs of Theorems 1.13 and 1.14 are given in Theorem 8.12 and (8.17), respectively.sidca00si
2013/2/12
page 31
1.4. Discrete Convex Functions 31
M-convex functions
positively homogeneous (base polyhedra)
M-convex functions 0M ⊂ M ⊃ M0 M-convex sets
(Theorem 6.59)

⏐ (Theorem 4.15)
distance functions T

 S submodular set functions
(Theorem 5.5)
⏐
 (Theorem 7.40)
L-convex sets L0 ⊂ L ⊃ 0L positively homogeneous
L-convex functions
L-convex functions
Figure 1.12. Conjugacy in discrete convexity.
(S), distance functions (T ), and base polyhedra (M0). It is recalled again that the
conjugacy is deﬁned by the (discrete) Legendre–Fenchel transformation (1.9).
The pair of L- and M-convexity prevails in discrete systems.
• In network ﬂow problems, ﬂow and tension are dual objects. Roughly speak-
ing, ﬂow corresponds to M-convexity and tension to L-convexity. Namely,
tension : L ←→ M : ﬂow.
In multiterminal electrical networks consisting of nonlinear resistors, the equi-
librium state can be characterized as a stationary point of a convex function
representing the energy (or power). The function is M-convex when expressed
in terms of the terminal current supplied by current sources. It is L-convex
when expressed in terms of the terminal voltage (or potential) speciﬁed by
voltage sources. Network ﬂow problems are discussed in section 2.2 and Chap-
ter 9.
• In a matroid, the rank function corresponds to L-convexity and the base family
to M-convexity:
rank function : L ←→ M : base family.
In a valuated matroid, the valuation of bases is an M-concave function deﬁned
on the unit cube {0,1}V
. Matroids and valuated matroids are explained in
section 2.4.
• The concept of M-matrices correspondsto L-convexity. Speciﬁcally, a quadratic
function is L
-convex if and only if it is deﬁned by a diagonally dominant sym-
metric M-matrix. The inverse of such a matrix corresponds to M-convexity.
A diagonally dominant symmetric M-matrix arises, for instance, from a dis-
cretization of the Poisson problem of partial diﬀerential equations, where the
matrix is an approximation to the diﬀerential operator (Laplacian) and its
inverse corresponds to the Green function. Hence
diﬀerential operator : L ←→ M : Green function.sidca00si
2013/2/12
page 32
## 32 Chapter 1. Introduction to the Central Concepts
Dirichlet forms in probability theory are exactly the same as L
-convex quadratic
functions. These quadratic forms are discussed in section 2.1.
## 1.4.4 Duality
Duality theorems for L- and M-convex functions are stated here in the case of
integer-valued functions deﬁned on integer points.26
We explain their signiﬁcance in
relation to previous results, such as Frank’s discrete separation theorem for submod-
ular/supermodular functions, Edmonds’s intersection theorem, and Frank’s weight-
splitting theorem for the weighted matroid intersection problem.
Recall from section 1.2 the generic form of a Fenchel-type min-max duality
theorem:
[Discrete Fenchel-type duality theorem] Let f : ZV
→ Z ∪ {+∞} and
h : ZV
→ Z ∪ {−∞} be convex and concave functions, respectively (in
an appropriate sense). Then
min{f(x) − h(x) | x ∈ ZV
} = max{h◦
(p) − f•
(p) | p ∈ ZV
}.
We can now specify the meaning of convexity left open in this generic statement by
L-convexity or M-convexity. Then the following theorems result.
Theorem 1.15 (Fenchel-type duality for L-convex functions). Let g : ZV
→
Z ∪ {+∞} be an L
-convex function and k : ZV
→ Z ∪ {−∞} be an L
-concave
function such that domZg ∩ domZk = ∅ or domZg•
∩ domZk◦
= ∅. Then we have
inf{g(p) − k(p) | p ∈ ZV
} = sup{k◦
(x) − g•
(x) | x ∈ ZV
}. (1.49)
If this common value is ﬁnite, the inﬁmum is attained by some p ∈ domZg∩domZk
and the supremum is attained by some x ∈ domZg•
∩ domZk◦
.
Theorem 1.16 (Fenchel-type duality for M-convex functions). Let f : ZV
→
Z ∪ {+∞} be an M
-convex function and h : ZV
→ Z ∪ {−∞} be an M
-concave
function such that domZf ∩ domZh = ∅ or domZf•
∩ domZh◦
= ∅. Then we have
inf{f(x) − h(x) | x ∈ ZV
} = sup{h◦
(p) − f•
(p) | p ∈ ZV
}. (1.50)
If this common value is ﬁnite, the inﬁmum is attained by some x ∈ domZf ∩domZh
and the supremum is attained by some p ∈ domZf•
∩ domZh◦
.
Although the above theorems look diﬀerent, they are actually the same theo-
rem if we assume the conjugacy between L
-convex functions and M
-convex func-
tions (a variant of Theorem 1.13). In fact, substitution of g = f•
and k = h◦
in
(1.49) yields
inf{f•
(p) − h◦
(p) | p ∈ ZV
} = sup{(h◦
)◦
(x) − (f•
)•
(x) | x ∈ ZV
},
26The proofs of Theorems 1.15, 1.16, 1.17, 1.18, 1.23, and 1.24 are given in Theorems 8.21, 8.21,
8.16, 8.15, 5.9, and 4.21, respectively.sidca00si
2013/2/12
page 33
1.4. Discrete Convex Functions 33
which is equivalent to (1.50) by (f•
)•
= f and (h◦
)◦
= h. Thus, the Fenchel-type
min-max theorem is self-conjugate.
Next we turn to discrete separation theorems. Recall, again from section 1.2,
the generic form of a discrete separation theorem:
[Discrete separation theorem] Let f : ZV
→ Z∪{+∞} and h : ZV
→ Z∪
{−∞} be convex and concave functions, respectively (in an appropriate
sense). If
f(x) ≥ h(x) (∀x ∈ ZV
),
there exist α∗
∈ Z and p∗
∈ ZV
such that
f(x) ≥ α∗
+ p∗
,x ≥ h(x) (∀x ∈ ZV
).
We can substitute L-convexityor M-convexity for convexity in this generic statement
to obtain a conjugate pair of discrete separation theorems.
Theorem 1.17 (L-separation theorem). Let g : ZV
→ Z ∪ {+∞} be an L
-
convex function and k : ZV
→ Z ∪ {−∞} be an L
-concave function such that
domZg ∩ domZk = ∅ or domZg•
∩ domZk◦
= ∅. If g(p) ≥ k(p) (∀p ∈ ZV
), there
exist β∗
∈ Z and x∗
∈ ZV
such that
g(p) ≥ β∗
+ p,x∗
≥ k(p) (∀p ∈ ZV
). (1.51)
Theorem 1.18 (M-separation theorem). Let f : ZV
→ Z ∪ {+∞} be an M
-
convex function and h : ZV
→ Z ∪ {−∞} be an M
-concave function such that
domZf ∩ domZh = ∅ or domZf•
∩ domZh◦
= ∅. If f(x) ≥ h(x) (∀x ∈ ZV
), there
exist α∗
∈ Z and p∗
∈ ZV
such that
f(x) ≥ α∗
+ p∗
,x ≥ h(x) (∀x ∈ ZV
). (1.52)
These duality theorems include a number of previous important results as
special cases. We demonstrate this for Frank’s discrete separation theorem for
submodular/supermodular functions, Edmonds’s intersection theorem, and Frank’s
weight-splitting theorem for the weighted matroid intersection problem.
Example 1.19. Frank’s discrete separation theorem (Theorem 1.8) in the in-
tegral case can be derived from the L-separation theorem (Theorem 1.17). The
submodular and supermodular functions ρ and μ can be identiﬁed, respectively,
with an L
-convex function g : ZV
→ Z ∪ {+∞} and an L
-concave function
k : ZV
→ Z ∪ {−∞} by ρ(X) = g(χX) and μ(X) = k(χX) for X ⊆ V , where
domZg ⊆ {0,1}V
and domZk ⊆ {0,1}V
. The L-separation theorem applies, since
the ﬁrst assumption, domZg∩domZk = ∅, is met by g(0) = k(0) = 0, which follows
from ρ(∅) = μ(∅) = 0. We see β∗
= 0 from the inequality (1.51) for p = 0, and then
the desired inequality (1.17) is obtained from (1.51) with p = χX for X ⊆ V .sidca00si
2013/2/12
page 34
## 34 Chapter 1. Introduction to the Central Concepts
Example 1.20. Edmonds’s intersection theorem (Theorem 1.12) in the integral
case,
max{x(V ) | x ∈ P(ρ1)∩P(ρ2)∩ZV
} = min{ρ1(X)+ρ2(V \X) | X ⊆ V }, (1.53)
can be derived from the Fenchel-type duality theorem for M-convex functions (The-
orem 1.16). Deﬁne f(x) = δ1(x) and h(x) = 1,x − δ2(x) by using the indicator
functions δi(x) of P(ρi) ∩ ZV
(i = 1,2). Then f is M
-convex and h is M
-concave
with domZf ∩ domZh = ∅. An easy calculation yields
f•
(p) = sup
x∈P(ρ1)
p,x , h◦
(p) = − sup
x∈P(ρ2)
1 − p,x ,
which implies domZf•
∩ domZh◦
⊆ {0,1}V
and
f•
(p) = ρ1(X), h◦
(p) = −ρ2(V \ X) (p = χX,X ⊆ V ).
Substituting these expressions into the Fenchel-type min-max relation (1.50) yields
inf{δ1(x) − 1,x + δ2(x) | x ∈ ZV
} = sup{−ρ2(V \ X) − ρ1(X) | X ⊆ V },
which is equivalent to the desired equation (1.53).
Example 1.21. Frank’s weight-splitting theorem for the matroid intersection prob-
lem with integer weights is a special case of the M-separation theorem (Theorem
1.18). Given two matroids (V,B1) and (V,B2) on a common ground set V with
base families B1 and B2, as well as an integer-valued weight vector w : V → Z, the
optimal common base problem is to ﬁnd B ∈ B1 ∩ B2 that minimizes the weight
w(B) = v∈B w(v). Frank’s weight-splitting theorem says that a common base
B∗
∈ B1 ∩ B2 is optimal if and only if there exist integer vectors w∗
1 and w∗
2 such
that
(i) w = w∗
1 + w∗
2,
(ii) B∗
is a minimum-weight base of (V,B1) with respect to w∗
1, and
(iii) B∗
is a minimum-weight base of (V,B2) with respect to w∗
2.
The “if” part is easy and the content of this theorem lies in the assertion about the
existence of such a weight splitting.
For an optimal common base B∗
, deﬁne
f(x) =

w(B) (x = χB,B ∈ B1),
+∞ (otherwise),
h(x) =

w(B∗
) (x = χB,B ∈ B2),
−∞ (otherwise),
which are M-convex and M-concave, respectively (h is constant on B2). Noting that
f(x) ≥ h(x) (x ∈ ZV
), as well as domZf ∩ domZh = ∅, we apply the M-separation
theorem to obtain α∗
∈ Z and p∗
∈ ZV
for which the inequality (1.52) is true. A
weight splitting constructed by
w∗
1 = w − p∗
, w∗
2 = p∗
has the desired properties (i) to (iii). In fact, (1.52) with x = χB∗ reads w(B∗
) ≥
α∗
+ p∗
(B∗
) ≥ w(B∗
), which shows α∗
= w(B∗
) − p∗
(B∗
) = w∗
1(B∗
). It followssidca00si
2013/2/12
page 35
1.4. Discrete Convex Functions 35
M-separation theorem
f(x) ≥ α∗
+ p∗
,x ≥ h(x) Fenchel-type duality (Fujishige [62])
! Intersection theorem (Edmonds [44])
Fenchel-type duality
inf{f − h}
= sup{h◦
− f•
}
⎧
⎪ ⎪ ⎪ ⎪ ⎨
⎪ ⎪ ⎪ ⎪ ⎩
!
⇒ Discrete separation for submodular functions
(Frank [55])
⇒ Valuated matroid intersection
(Murota [135])
! ⇓
L-separation theorem Weighted matroid intersection
f•
(p) ≥ β∗
+ p,x∗
≥ h◦
(p) (Edmonds [45], Frank [54], Iri–Tomizawa [96])
Figure 1.13. Duality theorems (f: M
-convex function, h: M
-concave function).
S1
S2
k
p∗
Figure 1.14. Separation for convex sets.
also from (1.52) that w(B) ≥ α∗
+ p∗
(B) for every B ∈ B1 (namely, (ii)) and
α∗
+ p∗
(B) ≥ w(B∗
) for every B ∈ B2 (namely, (iii)).
Moreover, the valuated matroid intersection theorem, a generalization of the
weight-splitting theorem, can be regarded as a special case of the M-separation
theorem (to be explained in Example 8.28).
The relationship among duality theorems is summarized in Fig. 1.13. A deriva-
tion of Fujishige’s Fenchel-type duality theorem from the Fenchel-type duality the-
orem for L-convex functions will be explained in Example 8.26.
We conclude this section with discrete separation theorems for a pair of L-
convex sets and for a pair of M-convex sets. First we recall the separation theorem
for a pair of convex sets (see Fig. 1.14).
Theorem 1.22 (Separation for convex sets). If S1 and S2 are disjoint convex setssidca00si
2013/2/12
page 36
## 36 Chapter 1. Introduction to the Central Concepts
in RV
, there exists a nonzero vector p∗
∈ RV
such that
inf{ p∗
,x | x ∈ S1} − sup{ p∗
,x | x ∈ S2} ≥ 0.
The discrete versions of this theorem read as follows.
Theorem 1.23 (Discrete separation for L-convex sets). If D1 and D2 are disjoint
L-convex sets, there exists x∗
∈ {−1,0,1}V
such that
inf{ p,x∗
| p ∈ D1} − sup{ p,x∗
| p ∈ D2} ≥ 1. (1.54)
Theorem 1.24 (Discrete separation for M-convex sets). If B1 and B2 are disjoint
M-convex sets, there exists p∗
∈ {0,1}V
∪ {0,−1}V
such that
inf{ p∗
,x | x ∈ B1} − sup{ p∗
,x | x ∈ B2} ≥ 1. (1.55)
Let us dwell on the content of these theorems, referring to the latter. The ﬁrst
implication, explicit in the statement of Theorem 1.24, is that the separating vector
p∗
is so special that p∗
or −p∗
is a {0,1}-vector. The second, less conspicuous and
more subtle, is that B1 ∩ B2 = ∅ follows from B1 ∩ B2 = ∅, since (1.55) implies
B1 ∩ B2 = ∅. The implication
B1 ∩ B2 = ∅ =⇒ B1 ∩ B2 = ∅
for a pair of discrete sets comprises an essential ingredient in a successful theory of
discrete convexity, as will be discussed in section 3.3.
## 1.4.5 Classes of Discrete Convex Functions
Besides L-, M-, L
-, and M
-convex functions, we will consider in this book some
other classes of discrete convex functions, including integrally convex functions,
L
2-convex functions, and M
2-convex functions, whose deﬁnitions are given later.
The inclusion relationships among these classes of discrete convex functions are
depicted in Fig. 1.15 for ease of reference. The properties of these discrete convex
functions with respect to various fundamental operations are summarized in Table
1.2; counterexamples for the failure of the properties can be found in Murota–
Shioura [153].
Bibliographical Notes
References for optimization abound in the literature. See, e.g., Nemhauser–Rinnooy
Kan–Todd [166] as a general handbook; Bazaraa–Sherali–Shetty [8], Bertsekas [10],
Fletcher [52], Mangasarian [126], and Nocedal–Wright [169] for nonlinear optimiza-
tion; and Cook–Cunningham–Pulleyblank–Schrijver [26], Du–Pardalos [43], Korte–
Vygen [115], Lawler [119], and Nemhauser–Wolsey [167] for combinatorial optimiza-
tion. References for convex analysis are included in the bibliographical notes at thesidca00si
2013/2/12
page 37
1.4. Discrete Convex Functions 37
f : ZV
→ R ∪ {+∞}
Miller’s discrete convex
convex-extensible
integrally convex
M
2-convex
M
-convex
L
2-convex
L
-convex
separable convex
Figure 1.15. Classes of discrete convex functions (M
-convex ∩ L
-convex
= M
2-convex ∩ L
2-convex = separable convex).
end of Chapter 3, and those for network ﬂow theory and matroid theory are in
Chapter 2.
Fujishige [65] is a standard reference for submodular functions, and Narayanan
[165] and Topkis [203] cover some other topics related to electrical networks and
economics, respectively. Theorem 1.7, connecting submodularity and convexity, is
due to Lovász [123], and the name “Lovász extension” was coined by Fujishige [63],
[65]. The discrete separation for submodular functions, Theorem 1.8, is due to Frank
[55]. Theorem 1.9, the equivalence between submodularity and exchangeability, is
folklore from the 1980s. Seeing that no explicit and rigorous proof can be found in
the literature, we will provide a proof in Theorem 4.15 in this book. The recasting
into Theorem 1.10 is by Murota [140]. The local optimality criterion for the linearly
weighted base problem in a matroid (Theorem 1.11) is a standard result (see, e.g.,
Corollary 8.7 of [26]). The intersection theorem, Theorem 1.12, is due to Edmonds
[44]. The weight-splitting theorem described in Example 1.21 is due to Frank [54].
M-convex functions are introduced in Murota [137], followed by L-convex func-
tions in Murota [140]. Their fundamental properties are established in Murota
[137], [140], [141], [142]; the discrete conjugacy theorem (Theorem 1.13) and the
L-separation theorem (Theorem 1.17) in [140]; the M-separation theorem (Theo-
rem 1.18) in [137], [140], [142]; and the Fenchel-type duality theorem for M-convex
functions (Theorem 1.16) in [137], [140]. The separation theorems for L-convex
sets and M-convex sets (Theorems 1.23 and 1.24) are due to [140]. M-convexitysidca00si
2013/2/12
page 38
## 38 Chapter 1. Introduction to the Central Concepts
Table 1.2. Operations for discrete convex sets and functions (f: function,
S: set; #: Yes [cf. Theorem, Prop.], ×: No).
Miller’s convex integrally separable
discrete convex extensible convex convex
f1 + f2 × # × #
S1 ∩ S2 × # × #
f+ sep-conv × # # [3.24] #
S ∩ [a,b] # # # #
f+ aﬃne × # # [3.25] #
f12Z f2 × × × #
S1 + S2 × × × #
f•
× # × #
domf # # # [3.28] #
argminf # # # [3.28] #
M
2-convex L
2-convex M
-convex L
-convex
f1 + f2 × × × (M
2-conv) # [7.11]
S1 ∩ S2 × × × (M
2-conv) # [5.7]
f+ sep-conv # × # [6.15] # [7.11]
S ∩ [a,b] # × # #
f+ aﬃne # # # [6.15] # [7.11]
f12Z f2 × × # [6.15] × (L
2-conv)
S1 + S2 × × # [4.23] × (L
2-conv)
f•
× (L
2-conv) × (M
2-conv) × (L
-conv) × (M
-conv)
domf # [8.29] # [8.39] # [6.7] # [7.8]
argminf # [8.30] # [8.40] # [6.29] # [7.16]
sep-conv: separable convex function, aﬃne: aﬃne function,
dom: eﬀective domain (1.25), argmin: set of minimizers (3.16),
2Z : integer inﬁmal convolution (6.43),
f•
: conjugate (1.9) of integer-valued function f
and L-convexity are investigated also for functions in real variables for polyhedral,
quadratic, and closed convex functions in Murota–Shioura [152], [155], [156], [157].
M
-convex functions are introduced by Murota–Shioura [151] and L
-convex
functions by Fujishige–Murota [68]. The concept of submodular integrally convex
functions, together with a characterization by discrete midpoint convexity, is due
to Favati–Tardella [49]. The equivalence of this concept to L
-convexity is shown in
[68]. Table 1.2 is taken from Murota–Shioura [153].sidca00si
2013/2/12
page 39
Chapter 2
Convex Functions with
Combinatorial Structures
The objective of this chapter is to demonstrate how convex functions with combi-
natorial structures arise naturally from a variety of discrete systems, such as (i)
discretizations of the Poisson equation, (ii) electrical networks consisting of linear
(ohmic) and nonlinear resistors, and (iii) matrices (matroids) and polynomial matri-
ces (valuated matroids). It is emphasized that such functions are always equipped
with a pair of combinatorial properties, namely, submodularity (L-convexity) and
exchangeability (M-convexity).
## 2.1 Quadratic Functions
In this section we see how quadratic convex functions with combinatorial structures
arise naturally from linear discrete systems such as discretizations of the Poisson
partial diﬀerential equations and electrical networks consisting of linear (ohmic) re-
sistors. In so doing we intend to illustrate the rather vague idea of discreteness in
direction introduced in the previous chapter. In accordance with the correspondence
between quadratic functions and symmetric matrices, submodularity (L-convexity)
and exchangeability (M-convexity) for quadratic functions and their conjugate func-
tions are translated into combinatorial properties of symmetric matrices and their
inverses.
## 2.1.1 Convex Quadratic Functions
A quadratic form is associated with a symmetric matrix A as27
f(x) =
1
2
x
Ax. (2.1)
Recall that a symmetric matrix A is said to be positive semideﬁnite if x
Ax ≥ 0
for any vector x and positive deﬁnite if x
Ax > 0 for any nonzero vector x. As is
27The notation  means the transpose of a vector or a matrix. In section 2.1 we denote the ith
component of a vector x by xi instead of x(i).
39sidca00si
2013/2/12
page 40
## 40 Chapter 2. Convex Functions with Combinatorial Structures
well known, the convexity (resp., strict convexity) of f is equivalent to the positive
semideﬁniteness (resp., positive deﬁniteness) of A:
f is convex ⇔ A is positive semideﬁnite, (2.2)
f is strictly convex ⇔ A is positive deﬁnite. (2.3)
Positive (semi)deﬁniteness admits a number of characterizations. The ﬁrst is
in terms of eigenvalues:
A is positive semideﬁnite ⇔ every eigenvalue of A is nonnegative, (2.4)
A is positive deﬁnite ⇔ every eigenvalue of A is positive. (2.5)
Note that the eigenvalues of a symmetric matrix are all real.
The second characterization is in terms of minors (subdeterminants). Let
N = {1,...,n} be the index set of rows and columns of A. For I ⊆ N and J ⊆ N
we denote by A[I,J] the submatrix of A with row indices in I and column indices in
J. A submatrix of the form A[I,I] for some I ⊆ N is called a principal submatrix
and its determinant a principal minor. A principal submatrix of the form A[I,I]
with I = {1,...,k} for some k (≤ n) is called a leading principal submatrix and its
determinant a leading principal minor. Then we have
A is positive semideﬁnite ⇔ every principal minor of A is nonnegative, (2.6)
A is positive deﬁnite ⇔ every principal minor of A is positive, (2.7)
and
A is positive deﬁnite ⇔ every leading principal minor of A is positive. (2.8)
The criterion (2.8) compares favorably with (2.7) in that there are only n leading
principal minors as opposed to 2n
principal minors. Positive (semi)deﬁniteness can
be checked with O(n3
) arithmetic operations by an algorithm similar to Gaussian
elimination.
A change of the variable in (2.1), x = Sy with a nonsingular matrix S, re-
sults in another quadratic form fS(y) = f(Sy), which is associated with another
symmetric matrix S
AS. The convexity of a quadratic form is preserved under
such linear transformations of the variable, and the positive semideﬁniteness of a
symmetric matrix also remains invariant.
The change of the variable x = Sy with a general nonsingular S, rotating the
coordinate axes, does not respect any special coordinate directions. It would be
reasonable to expect that such a general transformation should not be compatible
with any combinatorial properties relevant to discreteness in direction. Conversely,
we may regard properties of a quadratic form or of a symmetric matrix as being
combinatorial with discreteness in direction if they are not invariant with respect to
the entire class of transformations but are invariant with respect to some restricted
subclass thereof (the class of diagonal scalings, for example). A typical combinato-
rial property of this kind is the sign pattern of the entries of a matrix. This is what
we will study in the following subsection.sidca00si
2013/2/12
page 41
2.1. Quadratic Functions 41
## 2.1.2 Symmetric M-Matrices
As a typical combinatorial property we consider a particular sign pattern of a sym-
metric matrix that arises naturally in applications. The main theme here is the
translation of this sign pattern of a symmetric matrix into a combinatorial property
of the quadratic form associated with it.
We consider symmetric matrices L = (ij | i,j = 1,...,n) that satisfy the
following two conditions:
[oﬀ-diagonal nonpositivity] ij ≤ 0 (i = j;1 ≤ i,j ≤ n), (2.9)
[diagonal dominance]
n 
j=1
ij ≥ 0 (1 ≤ i ≤ n). (2.10)
Note that the second condition (2.10) can also be expressed, under (2.9), as
ii ≥

j=i
|ij|.
Such matrices often appear in applications, as demonstrated below.
Example 2.1. Consider the Poisson equation −Δu = σ, where Δ is the Laplacian
d
i=1 d2
/dx2
i , σ denotes the source term, and d is the dimension of the space.28
A
standard discretization scheme for this diﬀerential equation, where we assume d = 1
for illustration purposes, gives rise to a system of linear equations described by a
matrix like
L =
⎡
⎢
⎢
⎣
2 −1
−1 2 −1
−1 2 −1
−1 2
⎤
⎥
⎥
⎦. (2.11)
This matrix satisﬁes the two conditions (2.9) and (2.10) above.
Example 2.2. Consider the simple electrical network depicted in Fig. 2.1. It
consists of ﬁve branches (linear resistors) connected at four nodes. We denote the
conductance (the reciprocal of resistance) of branch j by gj > 0 (j = 1,...,5),
the potential at node i by pi (i = 1,...,4), the voltage across branch j by ηj
(j = 1,...,5), and the current in branch j by ξj (j = 1,...,5). The underlying
graph can be represented by the incidence matrix
A =
⎡
⎢
⎢
⎣
−1 1 0 0 −1
1 0 0 −1 0
0 −1 1 0 0
0 0 −1 1 1
⎤
⎥
⎥
⎦, (2.12)
whose rows and columns correspond, respectively, to the nodes and branches; the
jth column has entry 1 at its initial node and −1 at its terminal node. The voltage
28We assume the Dirichlet boundary condition.sidca00si
2013/2/12
page 42
## 42 Chapter 2. Convex Functions with Combinatorial Structures
p1
p4
p2 p3
R 
I
6
g1
g2
g3 g4
g5 ξ1 ξ2
ξ3 ξ4 ξ5
I

R
?
η1 η2
η3 η4
η5
Figure 2.1. Electrical network.
vector η = (ηj | j = 1,...,5) is expressed in terms of the potential vector p = (pi |
i = 1,...,4) as η = A
p. The constitutive equation (Ohm’s law) is represented as
ξ = Y η, where ξ = (ξj | j = 1,...,5) is the current vector and Y = diag(gj | j =
1,...,5) is the conductance matrix. When a current source represented by a vector
c = (ci | i = 1,...,4) is applied, Kirchhoﬀ’s current law is described by Aξ = c.
Combining these equations yields AY A
p = c for an admissible potential p. The
coeﬃcient matrix L = AY A
here is given by
L =
⎡
⎢
⎢
⎣
g1 + g2 + g5 −g1 −g2 −g5
−g1 g1 + g4 0 −g4
−g2 0 g2 + g3 −g3
−g5 −g4 −g3 g3 + g4 + g5
⎤
⎥
⎥
⎦, (2.13)
which satisﬁes the two conditions (2.9) and (2.10) above. The matrix L is called
the node admittance matrix.
Note 2.3. A matrix L is called an M-matrix if it can be represented as L = sI −B
with a matrix B consisting of nonnegative entries and a real number s ≥ ρ(B),
where ρ(B) denotes the spectral radius (the largest modulus of an eigenvalue) of B.
A nonsingular M-matrix is characterized as a matrix whose oﬀ-diagonal entries are
all nonpositive and the entries of whose inverse matrix are all nonnegative. With
this terminology we can say that symmetric matrices with oﬀ-diagonal nonposi-
tivity and diagonal dominance considered in this section are exactly the same as
diagonally dominant symmetric M-matrices. In passing we mention the fact that
any symmetric M-matrix can be transformed into a diagonally dominant symmetric
M-matrix by a symmetric diagonal scaling. M-matrices are fundamental concepts in
control system theory (Kodama–Suda [113], Šiljak [193]), numerical linear algebra
(Axelsson [6], Varga [207]), and economics. The reader is referred to Berman–
Plemmons [9] for mathematical properties of M-matrices. It is also mentioned thatsidca00si
2013/2/12
page 43
2.1. Quadratic Functions 43
a symmetric compartmental matrix (Anderson [3]) is the same as the negative of a
diagonally dominant symmetric M-matrix.
Proposition 2.4. A symmetric matrix L with properties (2.9) and (2.10) is positive
semideﬁnite.
Proof. By (2.6) it suﬃces to show that any principal minor is nonnegative. We
prove this by induction on the size n of the matrix L. Any principal submatrix of
order ≤ n−1 satisﬁes (2.9) and (2.10) and therefore its determinant is nonnegative
by the induction hypothesis. It remains to show detL ≥ 0. Partition L as
L =

L11 L12
L21 L22

,
where L11 is of order n − 1 and L22 = nn. If nn = 0, then ni = in = 0
(i = 1,...,n − 1) and therefore detL = 0. Suppose nn > 0 and put L̂11 =
L11 − L12L22
−1
L21. An oﬀ-diagonal entry ij − innn
−1
nj of L̂11, where 1 ≤ i =
j ≤ n − 1, is nonpositive by ij,in,nj ≤ 0 and nn > 0. For the ith row sum of
L̂11 we have
n−1 
j=1
ij −
in
nn
n−1 
j=1
nj ≥
−in
nn
n 
j=1
nj ≥ 0.
Thus, L̂11 satisﬁes (2.9) and (2.10), and, by the induction hypothesis, its determi-
nant is nonnegative. Hence, detL = nn · detL̂11 ≥ 0.
We now look at the associated quadratic form
g(p) =
1
2
p
Lp (p ∈ Rn
), (2.14)
which is convex by Proposition 2.4 and (2.2). Our goal here is to reveal a key
combinatorial property of g(p) that reﬂects the combinatorial properties (2.9) and
(2.10) of the matrix L.
Note 2.5. It is quite natural to consider a quadratic form in association with a
linear system of equations. For a positive-deﬁnite symmetric matrix L, the solu-
tion p to a system of linear equations Lp = c can be characterized as the unique
minimizer of the quadratic function 1
2 p
Lp − p
c (variational formulation). Such
a quadratic function often has a physical meaning. For instance, in the electrical
network of Example 2.2, the function
1
2
p
Lp − p
c =
1
2
η
ξ − p
c (2.15)
represents the power (energy) consumed in the network. The Poisson equation
−Δu = σ (with d = 1) in Example 2.1 can be translated into a variational problem
of minimizing a functional
I[u] =
 b
a

1
2
(u
(x))2
− σ(x)u(x)

dx.sidca00si
2013/2/12
page 44
## 44 Chapter 2. Convex Functions with Combinatorial Structures
In this case, the quadratic function represents a discretization of I[u].
For vectors p,q ∈ Rn
, we denote the vectors of componentwise maxima and
minima by p ∨ q and p ∧ q, respectively:
(p ∨ q)i = max(pi,qi), (p ∧ q)i = min(pi,qi). (2.16)
A function g : Rn
→ R∪{+∞} is said to be submodular if it satisﬁes the inequality
g(p) + g(q) ≥ g(p ∨ q) + g(p ∧ q) (p,q ∈ Rn
). (2.17)
This inequality is referred to as the submodularity inequality. It is understood that
the inequality (2.17) is satisﬁed if g(p) = +∞ or g(q) = +∞.
Submodularity corresponds to oﬀ-diagonal nonpositivity.
Proposition 2.6. For a symmetric matrix L, the oﬀ-diagonal nonpositivity (2.9)
of L is equivalent to the submodularity (2.17) of the associated quadratic form g(p).
Proof. The inequality (2.17) for p = χi (ith unit vector) and q = χj (jth unit
vector) yields (2.9). For the converse, put a = p∧q, p = a+p̂, and q = a+q̂. Then
p ∨ q = a + p̂ + q̂. Substitution of these into (2.14) shows that the right-hand side
of (2.17) minus the left-hand side of (2.17) is represented as
g(a + p̂ + q̂) + g(a) − g(a + p̂) − g(a + q̂) = p̂
Lq̂ =

i∈I

j∈J
p̂iijq̂j ≤ 0,
where I = {i | p̂i > 0} and J = {j | q̂j > 0}. Note that ij ≤ 0 (i ∈ I,j ∈ J) by
I ∩ J = ∅.
Oﬀ-diagonal nonpositivity can thus be translated into submodularity. Then
how does the combination of the oﬀ-diagonal nonpositivity and the diagonal domi-
nance of L translate to g(p)? To this end, we strengthen submodularity to
(SBF
[R]) g(p) + g(q) ≥ g((p − α1) ∨ q) + g(p ∧ (q + α1))
(∀p,q ∈ Rn
,∀α ∈ R+),
which we call translation submodularity. Submodularity (2.17) is a special case of
this with α = 0.
Theorem 2.7. For a symmetric matrix L, conditions (a) and (b) are equivalent.
(a) L has oﬀ-diagonal nonpositivity (2.9) and diagonal dominance (2.10).
(b) g(p) has translation submodularity (SBF
[R]).
Proof. (b) ⇒ (a): Proposition 2.6 shows (2.9). (SBF
[R]) with p = χi, q = −1,
and α = 1 yields (2.10), since
2[g(p) + g(q)] = χ
i Lχi + 1
L1,
2[g((p − α1) ∨ q) + g(p ∧ (q + α1))] = χ
i Lχi + 1
L1 − 2χ
i L1.sidca00si
2013/2/12
page 45
2.1. Quadratic Functions 45
(a) ⇒ (b): Put I = {i | α ≤ pi − qi}, and let J be the complement of I.
We have
((p − α1) ∨ q)i =

pi − α (i ∈ I),
qi (i ∈ J),
(p ∧ (q + α1))i =

qi + α (i ∈ I),
pi (i ∈ J).
With the use of k∈I ik ≥ − j∈J ij, which is a consequence of (2.10), as well as
(2.9), we obtain
[g(p) + g(q)] − [g((p − α1) ∨ q) + g(p ∧ (q + α1))]
=

i∈I
α(pi − qi − α)

k∈I
ik +

i∈I

j∈J
(pi − qi − α)(pj − qj)ij
≥ −

i∈I
α(pi − qi − α)

j∈J
ij +

i∈I

j∈J
(pi − qi − α)(pj − qj)ij
=

i∈I

j∈J
(pi − qi − α)(pj − qj − α)ij ≥ 0.
Hence follows (SBF
[R]).
Theorem 2.7 and Proposition 2.4 show that
translation submodularity =⇒ convexity
for a quadratic function. The converse, however, is not true. It is emphasized that
translation submodularity is a combinatorial property in that it is not invariant
under coordinate rotations but respects the ﬁxed coordinate axes and the particular
direction 1.
Note 2.8. The quadratic form considered in this section coincides with what
is known as the Dirichlet form (in ﬁnite dimension) in the theory of the Markov
process and potential theory; see Fukushima–Oshima–Takeda[71]. We mention here
the equivalence among the ﬁve conditions (a), (b), (c), (d), and (e) below.29
The
ﬁve conditions are equivalent, by Theorem 2.7, to the translation submodularity
(SBF
[R]) of g(p).
(a) L has oﬀ-diagonal nonpositivity (2.9) and diagonal dominance (2.10).
(b) The normal contraction operates on g(p) = 1
2 p
Lp; i.e., for p,q ∈ Rn
,
|pi| ≥ |qi|,|pi − pj| ≥ |qi − qj| (1 ≤ i,j ≤ n) =⇒ g(p) ≥ g(q).
(c) Every unit contraction operates on g(p) = 1
2 p
Lp; i.e.,
g(p) ≥ g((0 ∨ p) ∧ 1) (p ∈ Rn
).
(d) For any α > 0, Sα =

I + 1
αL
−1
exists and is Markovian; i.e.,
0 ≤ x ≤ 1 =⇒ 0 ≤ Sαx ≤ 1.
29In the terminology of the theory of Dirichlet forms, −L corresponds to the generator, α−1Sα
to the resolvent, and Tt to the semigroup.sidca00si
2013/2/12
page 46
## 46 Chapter 2. Convex Functions with Combinatorial Structures
(e) For any t > 0, Tt = exp(−tL) is Markovian.
The proof of the equivalence of the above ﬁve conditions follows.
[(a) ⇒ (b)]: Denote the distinct values in {pi | 1 ≤ i ≤ n} ∪ {0} by π1 >
π2 > ··· > πm, and put X = {i | pi = π1} and Y = {i | pi = πm}. It suﬃces to
prove g(p) ≥ g(q) for q = p − αχX with 0 ≤ α ≤ 2(π1 − π2) or q = p + βχY with
0 ≤ β ≤ 2(πm−1 −πm), since any normal contraction q can be obtained from p by a
series of transformations of such forms. We consider the former case (the latter can
be dealt with similarly). We may assume X = ∅, α > 0, and π1 > π2 ≥ 0. Then we
have
1
α
(g(p) − g(q))
=

i∈X
n 
j=1
ijpj −
α
2

i∈X

j∈X
ij =
!
π1 −
α
2
" 
i∈X

j∈X
ij +

i∈X

j/ ∈X
ijpj
≥ π2

i∈X

j∈X
ij +

i∈X

j/ ∈X
ijπ2 = π2

i∈X
n 
j=1
ij ≥ 0.
[(b) ⇒ (c)]: Note that q = (0 ∨ p) ∧ 1 is a normal contraction of p.
[(c) ⇒ (a)]: Let α be a suﬃciently small positive number. Then (2.9) follows
from (c) for p = χi − αχj and (2.10) from (c) for p = 1 + αχi.
[(c) ⇒ (d)]: Since (c) ⇒ (a), L is positive semideﬁnite by Proposition 2.4, and
therefore, Sα exists. For a ﬁxed x with 0 ≤ x ≤ 1 and α > 0, the function
ψ(p) = g(p) +
α
2
(p − x)
(p − x)
takes the unique minimum at p = p0, where p0 = Sαx. For q0 = (0∨p0)∧1 we have
g(p0) ≥ g(q0) by (c) and (p0 −x)
(p0 −x) ≥ (q0 −x)
(q0 −x) by 0 ≤ x ≤ 1. Hence
ψ(p0) ≥ ψ(q0), which implies p0 = q0 = (0∨p0)∧1. This shows 0 ≤ p0 = Sαx ≤ 1.
[(d) ⇒ (c)]: Since Sα = (sij) is Markovian, we have sij ≥ 0 (1 ≤ i,j ≤ n) and
n
j=1 sij ≤ 1 (1 ≤ i ≤ n). Deﬁne
g(α)
(p) =
1
2
p

I +
1
α
L
−1
Lp
for α > 0. Then g(α)
(p) tends to g(p) as α → +∞. On the other hand, the
expression
2g(α)
(p) = α(p
p − p
Sαp) =
α
2
n 
i=1
n 
j=1
sij(pi − pj)2
+ α
n 
i=1
⎛
⎝1 −
n 
j=1
sij
⎞
⎠p2
i
shows that every normal contraction operates on g(α)
(p). The limit of α → +∞
establishes (c).
[(d) ⇒ (e)]: This is due to the formula
Ttx = lim
α→+∞
e−αt

n≥0
(αt)n
n!
(Sα)n
x.sidca00si
2013/2/12
page 47
2.1. Quadratic Functions 47
[(e) ⇒ (d)]: This is due to the formula Sαx = α
' ∞
0
e−αt
Ttxdt.
## 2.1.3 Combinatorial Property of Conjugate Functions
As a continuation of our study of quadratic convex functions with translation sub-
modularity, we now consider the conjugate of such functions. The conjugate of
a quadratic form is another quadratic form, which is associated with the matrix
inverse of the original coeﬃcient matrix.
Proposition 2.9. Let M and L be positive-deﬁnite symmetric matrices. The
quadratic forms f(x) = 1
2 x
Mx and g(p) = 1
2 p
Lp are conjugate to each other
with respect to the Legendre–Fenchel transformation (1.6) if and only if M and L
are inverse to each other.
Proof. This follows from a straightforward calculation based on (1.6).
Hence, part of our study consists of investigating the combinatorial structure of
the inverse of symmetric matrices with oﬀ-diagonal nonpositivity (2.9) and diagonal
dominance (2.10). We introduce the following notation:
L = {L | L is positive deﬁnite and satisﬁes (2.9) and (2.10)}, (2.18)
L−1
= {L−1
| L ∈ L}. (2.19)
Example 2.10. Recall the Poisson equation −Δu = σ in Example 2.1. The inverse
of the matrix L in (2.11) is given by
M =
1
5
⎡
⎢
⎢
⎣
4 3 2 1
3 6 4 2
2 4 6 3
1 2 3 4
⎤
⎥
⎥
⎦. (2.20)
Whereas the matrix L represents a diﬀerential operator, M = L−1
corresponds to
the Green function. The function g(p) is an approximation to the functional I[u]
for the variational formulation (Note 2.5), and the conjugate of g(p) is that for the
inverse problem of ﬁnding σ for a given u.
Let us consider the quadratic form
f(x) =
1
2
x
Mx
associated with M ∈ L−1
. We are to show that f(x) possesses an exchange property:
(M
-EXC[R]) For x,y ∈ domRf and i ∈ supp+
(x − y), there exist
j ∈ supp−
(x − y) ∪ {0} and a positive number α0 ∈ R++ such that
f(x) + f(y) ≥ f(x − α(χi − χj)) + f(y + α(χi − χj))
for all α ∈ R with 0 ≤ α ≤ α0.sidca00si
2013/2/12
page 48
## 48 Chapter 2. Convex Functions with Combinatorial Structures
It should be clear that χi designates the ith unit vector for 1 ≤ i ≤ n while χ0 is
the zero vector and
supp+
(x) = {i | xi > 0}, supp−
(x) = {i | xi < 0} (2.21)
for x = (xi | i = 1,...,n) ∈ Rn
. Recall that such an exchange property can be
viewed as a combinatorial analogue of the basic inequality (1.39) valid for a general
convex function.
The following is the main theorem of this section, stating the conjugacy rela-
tionship between L
-convexity and M
-convexity for strictly convex quadratic func-
tions.
Theorem 2.11. Suppose that strictly convex quadratic forms g and f are conjugate
to each other. Then g satisﬁes translation submodularity (SBF
[R]) if and only if
f has exchange property (M
-EXC[R]).
The conjugacy relationship between (SBF
[R]) and (M
-EXC[R]) stated above
for strictly convex quadratic forms is in fact valid for a more general class of func-
tions, as is fully developed in Chapter 8. This particular case, however, deserves
separate consideration, in that it admits a matrix-algebraic proof using the Farkas
lemma and thereby provides a new insight into (SBF
[R]) vs. (M
-EXC[R]) conju-
gacy.
In what follows we prove Theorem 2.11 by establishing Theorem 2.12 below.30
As variants of (M
-EXC[R]) we consider the following:
(M
-EXC+
[R]) For x,y ∈ domRf and i ∈ supp+
(x − y), there exist
j ∈ supp−
(x − y) ∪ {0} and a positive number α0 ∈ R++ such that
f(x) + f(y) > f(x − α(χi − χj)) + f(y + α(χi − χj))
for all α ∈ R with 0 < α < α0.
(M
-EXCd[R]) For x,y ∈ domRf and i ∈ supp+
(x − y),
min
j∈supp−(x−y)∪{0}
[f
(x;−χi + χj) + f
(y;χi − χj)] ≤ 0.
The latter is motivated by the identity
f(x + αd) = f(x) + αf
(x;d) + O(α2
) (2.22)
valid for the directional derivative f
(x;d) and suﬃciently small α > 0. We also
denote by (M
-EXC+
d [R]) the property (M
-EXCd[R]) with ≤ replaced by strict
inequality <.
30The reader may go on to section 2.2, skipping the technical matters given in the rest of
section 2.1.sidca00si
2013/2/12
page 49
2.1. Quadratic Functions 49
Theorem 2.12. For an n×n nonsingular symmetric matrix M = [m1,m2,...,mn],
with mj ∈ Rn
denoting the jth column vector of M, the following nine conditions
(a), (b), (b+
),..., (e), (e+
) are equivalent.
(a) M ∈ L−1
.
(b) For any x ∈ Rn
and i ∈ supp+
(x),
x
mi ≥ min

0,min
j=i
x
mj

.
(b+
) For any x ∈ Rn
and i ∈ supp+
(x),
x
mi > min

0,min
j=i
x
mj

.
(c) For any x ∈ Rn
and i ∈ supp+
(x),
x
mi ≥ min

0, min
j∈supp−(x)
x
mj

.
(c+
) For any x ∈ Rn
and i ∈ supp+
(x),
x
mi > min

0, min
j∈supp−(x)
x
mj

.
(d) f(x) = 1
2 x
Mx satisﬁes (M
-EXCd[R]).
(d+
) f(x) = 1
2 x
Mx satisﬁes (M
-EXC+
d [R]).
(e) f(x) = 1
2 x
Mx satisﬁes (M
-EXC[R]).
(e+
) f(x) = 1
2 x
Mx satisﬁes (M
-EXC+
[R]).
Proof. We prove the equivalence by showing the following implications:
(a)
! =⇒
(b+
) ← (c+
) ⇔ (d+
) ⇒ (e+
)
↓⇑ ↓ ↓ ↓
(b) ← (c) ⇔ (d) ← (e)
The implications indicated by ← or ↓ are easy to see and those by ⇔ or ⇑ are
proved below.
(a) ⇔ (b+
): Denoting M−1
by L = (ij), we have ML = I; i.e.,
n
j=1 jimj =
χi, which can be rewritten as
⎛
⎝
n 
j=1
ji
⎞
⎠mi +

j=i
(−ji)(mi − mj) = χi.sidca00si
2013/2/12
page 50
## 50 Chapter 2. Convex Functions with Combinatorial Structures
The condition (a), L ∈ L, is equivalent to all the coeﬃcients in this expression being
nonnegative, whereas the latter is equivalent, by the Farkas lemma (Proposition 2.13
below), to
x
χi > 0 ⇒ max

x
mi,max
j=i
x
(mi − mj)

> 0. (2.23)
This is nothing but (b+
), since x
χi > 0 is the same as i ∈ supp+
(x).
(b) ⇒ (b+
): This follows from the above argument and the latter half of
Proposition 2.13 below.
(a) ⇒ (c+
): Fix x ∈ Rn
. It suﬃces to show
min
i∈supp+(x)
x
mi > min

0, min
j∈supp−(x)
x
mj

.
Let i ∈ supp+
(x) attain the minimum on the left-hand side. Put S = supp+
(x) ∪
supp−
(x) and let x ∈ RS
denote the restriction of x to S. The submatrix of M
with row and column indices in S is denoted by M = (mj | j ∈ S), where mj ∈ RS
.
Then we have supp+
(x) = supp+
(x), supp−
(x) = supp−
(x), i ∈ supp+
(x), xj = 0
(∀j ∈ S), and x
mj = x
mj (∀j ∈ S). Since M ∈ L−1
by Proposition 2.14 below,
M satisﬁes (b+
). Hence
x
mi > min

0,min
j=i
x
mj

= min

0, min
j∈supp+(x)\{i}
x
mj, min
j∈supp−(x)
x
mj

,
in which
x
mi ≤ min
j∈supp+(x)\{i}
x
mj
by the choice of i. Hence, we obtain
x
mi > min

0, min
j∈supp−(x)
x
mj

.
(c+
) ⇔ (d+
), (c) ⇔ (d): Using f
(x;d) = x
Md we obtain
f
(x;−χi) + f
(y;χi) = −x
Mχi + y
Mχi = −(x − y)
mi
as well as a similar expression for f
(x;−χi +χj)+f
(y;χi −χj). We then replace
x − y with x.
(d+
) ⇒ (e+
): This follows easily from (2.22).
Proposition 2.13. For a matrix A and a vector b, the conditions (a) and (b) below
are equivalent (Farkas lemma):31
(a) Ax = b for some nonnegative x ≥ 0.
31Inequality between vectors means componentwise inequality; e.g., x ≥ 0 for x = (xi)n
i=1 means
xi ≥ 0 for i = 1,...,n.sidca00si
2013/2/12
page 51
2.1. Quadratic Functions 51
(b) y
b ≥ 0 for any y such that y
A ≥ 0
.
If A is nonsingular, condition (b) is equivalent to
(c) y
b ≥ 0 for any y such that y
A > 0
.
Proof. (a) ⇒ (b) ⇒ (c) is obvious. (b) ⇒ (a) is proved later in Theorem 3.9. For
(c) ⇒ (b), there exists z such that z
A = 1
by the assumed nonsingularity of A.
Then (y + εz)
A > 0
for any ε > 0, and (c) yields (y + εz)
b ≥ 0, which implies
y
b ≥ 0, since ε > 0 is arbitrary.
Proposition 2.14. Any principal submatrix of M ∈ L−1
belongs to L−1
.
Proof. Partition M and L = M−1
compatibly as
M =

M11 M12
M21 M22

, L =

L11 L12
L21 L22

.
To prove M11 ∈ L−1
by induction on the size of M11, we may assume M22 and L22
are 1 × 1. Since L22 = nn > 0, we have M11
−1
= L11 − L12L22
−1
L21 (= L̂11),
which shows the nonsingularity of M11. Then the proof of Proposition 2.4 shows
M11 ∈ L−1
.
Note 2.15. It is worth noting that conditions (c) and (c+
) in Theorem 2.12
immediately imply positive semideﬁniteness and positive deﬁniteness, respectively.
The proof for the former reads as follows, while a similar proof works for the latter.
Let μ be an eigenvalue of the matrix M and x be the corresponding eigenvector
with supp+
(x) = ∅. Then (c) shows
μxi ≥ min

0, min
j∈supp−(x)
μxj

for i ∈ supp+
(x). This implies μ ≥ 0, since, otherwise, the left-hand side is negative
and the right-hand side is zero. Hence M is positive semideﬁnite by (2.4). It is
also noted that mii ≥ 0 follows from (c) with x = χi and mij ≥ 0 from (c) with
x = χi + αχj with α > 0 large.
## 2.1.4 General Quadratic L-/M-Convex Functions
We have so far considered strictly convex quadratic forms deﬁned by positive-
deﬁnite matrices. The conjugacy relationship carries over to convex quadratic forms
deﬁned by positive-semideﬁnite matrices, as follows.
Suppose that g is a quadratic convex function given by
g(p) =
( 1
2
p
Lp (p ∈ K),
+∞ (p / ∈ K)
(2.24)sidca00si
2013/2/12
page 52
## 52 Chapter 2. Convex Functions with Combinatorial Structures
with a positive-semideﬁnite symmetric matrix L and a linear subspace K ⊆ Rn
.
Then the conjugate of g is also a quadratic convex function given by
f(x) =
( 1
2
x
Mx (x ∈ H),
+∞ (x / ∈ H)
(2.25)
with a positive-semideﬁnite symmetric matrix M and a linear subspace H ⊆ Rn
such that
K = (H ∩ kerM)⊥
, H = (K ∩ kerL)⊥
, (2.26)
where
kerM = {x ∈ Rn
| Mx = 0},
X⊥
= {p ∈ Rn
| p,x = 0 (∀x ∈ X)}.
Note that (2.26) can be rewritten as
domRg = (argminf)⊥
, domRf = (argming)⊥
.
The conjugacy stated in Theorem 2.11 for strictly convex quadratic forms
is generalized as follows. See Murota–Shioura [155] for the proof as well as the
structure of the coeﬃcient matrices L and M.
Theorem 2.16. Suppose that g : Rn
→ R ∪ {+∞} in (2.24) and f : Rn
→
R ∪ {+∞} in (2.25) are conjugate to each other. Then g satisﬁes translation sub-
modularity (SBF
[R]) if and only if f has exchange property (M
-EXC[R]).
## 2.2 Nonlinear Networks
In the previous section we have seen that an electrical network gives rise to a con-
vex function with combinatorial properties (Example 2.2). The node admittance
matrix L is a diagonally dominant symmetric M-matrix (with oﬀ-diagonal non-
positivity and diagonal dominance), and the associated quadratic function (2.15)
representing the power (energy) consumed in the network has translation submod-
ularity (SBF
[R]). In this section we shall see a similar phenomenon in an electrical
network of nonlinear resistors or, equivalently, in a nonlinear minimum cost ﬂow
problem. General convex functions, not necessarily quadratic, arise as a result of
nonlinearity. Two aspects of discreteness, discreteness in direction and discrete-
ness in value, both appear naturally in the network ﬂow problem. Accordingly, we
consider functions of type Rn
→ R in section 2.2.1 and those of type Zn
→ Z in
section 2.2.2.
## 2.2.1 Real-Valued Flows
Let G = (V,A) be a directed graph with the set of vertices (nodes) V and the set
of arcs (branches) A and T be a set of distinguished vertices called terminals; see
Fig. 2.2. For each vertex v ∈ V , δ+
v and δ−
v denote the sets of arcs leaving v andsidca00si
2013/2/12
page 53
2.2. Nonlinear Networks 53
T
f(x)
g(p)
-
j
-
*
s
q
j
N

1
)
O
W
(fa,ga)
(ξ(a),η(a))
Figure 2.2. Multiterminal network.
entering v, respectively. For each arc a ∈ A, ∂+
a designates the initial vertex of a
and ∂−
a the terminal vertex of a. We consider here a minimum cost ﬂow problem,
in which each arc is associated with a nonlinear convex cost function and the supply
(or demand) of ﬂow is speciﬁed at terminal vertices.
The physical model we have in mind is a multiterminal electrical network
that consists of nonlinear resistors and is driven by a (current or voltage) source
applied to the terminal vertices. To reinforce physical intuition, we sometimes
use terminology such as current and voltage instead of ﬂow and tension, but no
physics is really involved in our arguments. A reader who is more comfortable with
combinatorial optimization terminology may replace the terminology as follows:
electrical network ⇒ network
current ⇒ ﬂow
voltage ⇒ tension
current source ⇒ supply of ﬂow
potential ⇒ potential (dual variable)
current potential ⇒ cost function in ﬂow
voltage potential ⇒ cost function in tension
characteristic curve ⇒ kilter diagram
Each arc a ∈ A is associated with a ﬂow (or current) ξ(a) and a tension (or
voltage) η(a) and each vertex v ∈ V with a potential p̃(v). The boundary of ﬂow ξ
is deﬁned to be32
∂ξ(v) =

{ξ(a) | a ∈ δ+
v} −

{ξ(a) | a ∈ δ−
v} (v ∈ V ), (2.27)
which represents the net ﬂow leaving vertex v. The coboundary of potential p̃ is
δp̃(a) = p̃(∂+
a) − p̃(∂−
a) (a ∈ A), (2.28)
which expresses the diﬀerence in the potentials at the end vertices of an arc a.
32Rockafellar’s notations div and Δ in [178] are related to ours by div = ∂ and Δ = −δ.sidca00si
2013/2/12
page 54
## 54 Chapter 2. Convex Functions with Combinatorial Structures
-
ξ
6
η (ξ,η)
fa(ξ)
ga(η)
Γa
Figure 2.3. Characteristic curve.
For each terminal vertex v ∈ T, let x(v) denote the amount of ﬂow going out
of the network at v and p(v) be the potential at v. We have structural equations
∂ξ(v) =

−x(v) (v ∈ T),
0 (v ∈ V \ T),
η(a) = −δp̃(a) (a ∈ A), (2.29)
expressing the conservation laws as well as an obvious relation
p(v) = p̃(v) (v ∈ T). (2.30)
The vectors x = (x(v) | v ∈ T) ∈ RT
and p = (p(v) | v ∈ T) ∈ RT
play primal roles
in our discussion below.
Each arc a ∈ A is associated with a characteristic curve Γa ⊆ R2
, which
describes the admissible pairs of ﬂow ξ(a) and tension η(a):
(ξ(a),η(a)) ∈ Γa (a ∈ A). (2.31)
In physical terms a characteristic curve shows the constitutive equation for a non-
linear resistor, describing the possible pairs of current and voltage. In the linear
case (as in Example 2.2) we have
Γa = {(ξ,η) ∈ R2
| η = Raξ}
for some Ra > 0, which represents the resistance of an ohmic resistor. We consider
here a nonlinear case, where monotonicity
(ξ1,η1),(ξ2,η2) ∈ Γa =⇒ (ξ1 − ξ2) · (η1 − η2) ≥ 0 (2.32)
is assumed (see Fig. 2.3).
A conjugate pair of convex functions are induced from the characteristic curve
Γa. Deﬁne
fa(ξ) =
 (ξ,η)
Γa
ηdξ, ga(η) =
 (ξ,η)
Γa
ξdη, (2.33)
which means that fa(ξ) is the area below Γa in Fig. 2.3 and ga(η) is the area above
Γa. The functions fa(ξ) and ga(η) are both convex as a consequence of the assumedsidca00si
2013/2/12
page 55
2.2. Nonlinear Networks 55
monotonicity (2.32). Moreover, with suitable choices of integral constants, we have
fa(ξ) + ga(η) ≥ ξη (∀(ξ,η) ∈ R2
), (2.34)
fa(ξ) + ga(η) = ξη ⇐⇒ (ξ,η) ∈ Γa. (2.35)
Hence follows
fa(ξ) = sup{ξη − ga(η) | η ∈ R}, ga(η) = sup{ξη − fa(ξ) | ξ ∈ R}. (2.36)
That is, fa and ga are conjugate to each other with respect to the Legendre–Fenchel
transformation (1.6).
In the theory of electrical networks, the function fa(ξ) is sometimes called the
current potential (or content) and ga(η) the voltage potential (or cocontent). In the
case of a linear resistor, the functions fa and ga are quadratic, i.e.,
fa(ξ) =
Ra
2
ξ2
, ga(η) =
1
2Ra
η2
,
and they are both equal to half the power consumed in the resistor.
When a current source described by x ∈ RT
with v∈T x(v) = 0 is applied
to the terminal vertices of the network, the equilibrium state of (ξ(a) | a ∈ A)
and (η(a) | a ∈ A) is determined as a solution to the structural equations (2.29)
and the constitutive equations (2.31). A variational formulation of this problem is
to minimize the total current potential a∈A fa(ξ(a)) among all possible current
distributions ξ subject to the conservation law (2.29), with the current vector at
the equilibrium state being characterized as a minimizer of this problem (see Note
2.18 in section 2.2.3). We deﬁne f(x) to be the minimum value of the total current
potential in this variational problem; i.e.,
f(x) = inf
ξ
(

a∈A
fa(ξ(a))
)
)
)
)
)
∂ξ(v) = −x(v) (v ∈ T),∂ξ(v) = 0 (v ∈ V \ T)
*
. (2.37)
When a voltage source described by p ∈ RT
(with respect to some reference
point) is applied to the terminal vertices of the network, the equilibrium state of
(ξ(a) | a ∈ A) and (η(a) | a ∈ A) is determined as a solution to the structural
equations (2.29) and (2.30) and the constitutive equations (2.31). A variational
formulation of this problem is to minimize the total voltage potential a∈A ga(η(a))
among all possible voltage distributions η subject to the conservation law (2.29)
and (2.30), with the voltage vector at the equilibrium state being characterized as
a minimizer of this problem (see Note 2.18). We deﬁne g(p) to be the minimum
value of the total voltage potential in this variational problem; i.e.,
g(p) = inf
η,p̃
(

a∈A
ga(η(a))
)
)
)
)
)
η(a) = −δp̃(a) (a ∈ A), p̃(v) = p(v) (v ∈ T)
*
. (2.38)
The functions f and g introduced above are both convex (see Note 2.17 in
section 2.2.3) and they are conjugate to each other (see Note 2.18). In this sensesidca00si
2013/2/12
page 56
## 56 Chapter 2. Convex Functions with Combinatorial Structures
they stand on equal footing and there seems to be no concept in convex analysis
that distinguishes between f and g.
When it comes to combinatorial properties, however, these functions have
distinctive features. As is shown in Notes 2.19 and 2.20 in section 2.2.3, the function
f : RT
→ R ∪ {+∞} is endowed with an exchange property:
(M-EXC[R]) For x,y ∈ domRf and u ∈ supp+
(x − y), there exist
v ∈ supp−
(x − y) and a positive number α0 ∈ R++ such that
f(x) + f(y) ≥ f(x − α(χu − χv)) + f(y + α(χu − χv))
for all α ∈ R with 0 ≤ α ≤ α0,
and the function g : RT
→ R ∪ {+∞} satisﬁes
(SBF[R]) g(p) + g(q) ≥ g(p ∨ q) + g(p ∧ q) (∀p,q ∈ RT
),
(TRF[R]) ∃r ∈ R such that g(p + α1) = g(p) + αr
(∀p ∈ RT
,∀α ∈ R)
with r = 0. (SBF[R]) is the submodularity and (TRF[R]) with r = 0 is the
invariance in the direction of 1 = (1,1,...,1), which corresponds to the fact that
the reference point of a potential can be chosen arbitrarily. Recall that we have
already seen (M-EXC[R]) in the deﬁnition of M-convex functions in section 1.4.2
and (SBF[R]) and (TRF[R]) in the deﬁnition of L-convex functions in section 1.4.1.
The following points are emphasized here for the conjugate pair of convex
functions, f and g, appearing in the network ﬂow problem:
• The functions f and g cannot be categorized with respect to convexity alone.
• The functions f and g can be classiﬁed into diﬀerent categories (M-convexity
and L-convexity) with respect to combinatorial properties.
• Exchangeability (M-convexity) and submodularity (L-convexity) appear as
conjugate properties.
The combinatorial properties (M-EXC[R]), (SBF[R]), and (TRF[R]) above
capture the kind of discreteness we call discreteness in direction. In the next sub-
section we turn to the other kind of discreteness, discreteness in value, inherent in
the network ﬂow problem, by considering integer-valued ﬂows.
## 2.2.2 Integer-Valued Flows
By replacing R in the previous argument with Z systematically, we consider integer-
valued ﬂows in a network speciﬁed by integral data. In particular, we assume all the
vectors representing ﬂow, tension, potential, etc., are integer valued; i.e., ξ ∈ ZA
,
η ∈ ZA
, p̃ ∈ ZV
, x ∈ ZT
, p ∈ ZT
, etc.
As for the cost functions, we assume that each arc a ∈ A is associated with a
pair of integer-valued functions fa,ga : Z → Z ∪ {+∞} such that
fa(ξ − 1) + fa(ξ + 1) ≥ 2fa(ξ) (∀ξ ∈ Z), (2.39)
ga(η − 1) + ga(η + 1) ≥ 2ga(η) (∀η ∈ Z), (2.40)sidca00si
2013/2/12
page 57
2.2. Nonlinear Networks 57
-
ξ
6
fa
−3−2−1 0 1 2 3
8
7
6
5
4
3
2
1
K
6
-
η
6
ga
−2−1 0 1 2 3 4 5
8
7
6
5
4
3
2
1
6 
Figure 2.4. Conjugate discrete convex functions fa(ξ) and ga(η).
-
ξ
6
η
−4−3−2 0 1 2 3
6
5
4
3
2
1
−2 
6
Figure 2.5. Discrete characteristic curve Γa.
and
fa(ξ) = sup{ξη − ga(η) | η ∈ Z}, ga(η) = sup{ξη − fa(ξ) | ξ ∈ Z}. (2.41)
It should be clear that (2.41) is a discrete analogue of the conjugacy (2.36), the dis-
crete Legendre–Fenchel transformation (1.9) for univariate functions. An example
of such a conjugate pair of cost functions is demonstrated in Fig. 2.4.
The characteristic curve Γa in this discrete setting is deﬁned to be a subset
of Z2
induced from (fa,ga) by (2.35). It can be characterized as a subset of Z2
with the monotonicity property (2.32). Figure 2.5 shows the characteristic curve
Γa induced from (fa,ga) in Fig. 2.4.
In parallel with (2.37) and (2.38) we deﬁne functions f : ZT
→ Z∪{+∞} andsidca00si
2013/2/12
page 58
## 58 Chapter 2. Convex Functions with Combinatorial Structures
g : ZT
→ Z ∪ {+∞} by
f(x) = inf
ξ
(

a∈A
fa(ξ(a))
)
)
)
)
)
∂ξ(v) = −x(v)(v ∈ T),∂ξ(v) = 0(v ∈ V \ T)
*
, (2.42)
g(p) = inf
η,p̃
(

a∈A
ga(η(a))
)
)
)
)
)
η(a) = −δp̃(a) (a ∈ A),p̃(v) = p(v)(v ∈ T)
*
. (2.43)
Note that these expressions are identical to (2.37) and (2.38) except that the vectors
are now integer valued and, in particular, the inﬁma are taken over integer vectors.
Fortunately, such a discretization in the deﬁnitions of f and g does not destroy
the combinatorial properties discussed above. On the contrary, the discretization
turns out to be compatible with natural discretizations of the combinatorial prop-
erties. Namely, it can be shown (see Note 2.19) that the function f has a discrete
version of the exchange property:
(M-EXC[Z]) For x,y ∈ domZf and u ∈ supp+
(x − y), there exists
v ∈ supp−
(x − y) such that
f(x) + f(y) ≥ f(x − χu + χv) + f(y + χu − χv).
This is essentially the same as (M-EXC[R]) with α0 = α = 1. On the other hand,
the function g satisﬁes
(SBF[Z]) g(p) + g(q) ≥ g(p ∨ q) + g(p ∧ q) (∀p,q ∈ ZT
),
(TRF[Z]) ∃r ∈ Z such that g(p + 1) = g(p) + r (∀p ∈ ZT
)
with r = 0 (see Note 2.20). Furthermore, these functions f and g are conjugate to
each other with respect to the discrete Legendre–Fenchel transformation (1.9), as
is proved later in section 9.6.
We have thus seen that the transition from R to Z is quite smooth in the
network ﬂow problem. The combinatorial properties are discretized compatibly in
the discretization of the problem data. We emphasize that this is by no means
a general phenomenon but is an outstanding characteristic of the network ﬂow
problem.
## 2.2.3 Technical Supplements
This section provides a series of proofs for the major properties of the functions
f(x) = inf
ξ
(

a∈A
fa(ξ(a))
)
)
)
)
)
∂ξ(v) = −x(v) (v ∈ T),∂ξ(v) = 0 (v ∈ V \ T)
*
, (2.44)
g(p) = inf
η,p̃
(

a∈A
ga(η(a))
)
)
)
)
)
η(a) = −δp̃(a) (a ∈ A), p̃(v) = p(v) (v ∈ T)
*
(2.45)
deﬁned in (2.37) and (2.38).sidca00si
2013/2/12
page 59
2.2. Nonlinear Networks 59
Note 2.17. We prove that f in (2.44) and g in (2.45) are convex functions under
the assumption that f > −∞ and g > −∞.
To show the convexity of f, ﬁx x,y ∈ domRf. For any ε > 0 there exist ξx
and ξy such that
f(x) + ε ≥

a∈A
fa(ξx(a)), f(y) + ε ≥

a∈A
fa(ξy(a)), (2.46)
(∂ξx)|T = −x, (∂ξy)|T = −y, (∂ξx)|V \T = (∂ξy)|V \T = 0, (2.47)
where ·|T denotes the restriction of a vector to T. For λ ∈ [0,1]R we have ∂(λξx +
(1 − λ)ξy) = λ∂ξx + (1 − λ)∂ξy and, therefore,
λf(x) + (1 − λ)f(y) + ε ≥

a∈A
[λfa(ξx(a)) + (1 − λ)fa(ξy(a))]
≥

a∈A
fa(λξx(a) + (1 − λ)ξy(a)) ≥ f(λx + (1 − λ)y).
This implies λf(x) + (1 − λ)f(y) ≥ f(λx + (1 − λ)y), since ε > 0 is arbitrary.
To show the convexity of g, ﬁx p,q ∈ domRg. For any ε > 0 there exist ηp,
ηq, p̃, and q̃ such that
g(p) + ε ≥

a∈A
ga(ηp(a)), g(q) + ε ≥

a∈A
ga(ηq(a)), (2.48)
ηp = −δp̃, ηq = −δq̃, p̃|T = p, q̃|T = q. (2.49)
For λ ∈ [0,1]R we have δ(λp̃ + (1 − λ)q̃) = λδp̃ + (1 − λ)δq̃ = −[ληp + (1 − λ)ηq]
and, therefore,
λg(p) + (1 − λ)g(q) + ε ≥

a∈A
[λga(ηp(a)) + (1 − λ)ga(ηq(a))]
≥

a∈A
ga(ληp(a) + (1 − λ)ηq(a)) ≥ g(λp + (1 − λ)q).
This implies λg(p) + (1 − λ)g(q) ≥ g(λp + (1 − λ)q), since ε > 0 is arbitrary.
Note 2.18. The variational formulations of the network equilibrium are derived
here under the assumption of the existence of an equilibrium. Also shown is the
conjugacy between f in (2.44) and g in (2.45). It follows from (2.34) that

a∈A
[fa(ξ(a)) + ga(η(a))] ≥ η,ξ = − δp̃,ξ = − p̃,∂ξ = p,x (2.50)
for any ξ, η, p̃, x, and p satisfying the conservation laws expressed by (2.29) and
(2.30). By (2.35), the inequality above is an equality if and only if (ξ(a),η(a)) ∈ Γa
for each a ∈ A. Suppose that an equilibrium state exists when a current source
x = x∗
is applied to the network and let ξ∗
, η∗
, p̃∗
, p∗
be the vectors at the
equilibrium. The inequality (2.50) with η = η∗
, p̃ = p̃∗
, p = p∗
, and x = x∗
yields

a∈A
fa(ξ(a)) ≥ p∗
,x∗
−

a∈A
ga(η∗
(a)) for all ξ satisfying (2.29),sidca00si
2013/2/12
page 60
## 60 Chapter 2. Convex Functions with Combinatorial Structures
which shows that the minimum of the current potential a∈A fa(ξ(a)) is attained
by ξ = ξ∗
. A similar result occurs for the variational formulation using the voltage
potential a∈A ga(η(a)) when a voltage source described by p = p∗
is applied. For
the conjugacy of f and g, note that
f(x) + g(p) = inf
ξ
(

a∈A
fa(ξ(a))
*
+ inf
η
(

a∈A
ga(η(a))
*
≥ p,x
follows from (2.50) and the deﬁnitions of f and g in (2.44) and (2.45). This in-
equality for x = x∗
turns into an equality for p = p∗
, which shows that f(x∗
) =
supp{ p,x∗
−g(p)} = g•
(x∗
). A similar argument works for g = f•
. The argument
here is admittedly lacking in mathematical rigor, for which the reader is referred to
Rockafellar [178].
Note 2.19. We prove that f in (2.44) satisﬁes (M-EXC[R]) under the assumption
that f > −∞. Fix x,y ∈ domRf. For any ε > 0 there exist ξx and ξy satisfying
(2.46) and (2.47). Consider the diﬀerence in the ﬂows, ξy − ξx ∈ RA
, for which we
have
∂(ξy − ξx)(v) =

x(v) − y(v) (v ∈ T),
0 (v ∈ V \ T).
Since u ∈ supp+
(x−y), there exists a path compatible with ξy −ξx that connects u
to some vertex in supp−
(x−y) (i.e., an augmenting path with respect to the pair of
ﬂows ξx and ξy). More formally, there exist π : A → {0,±1} and v ∈ supp−
(x − y)
such that
supp+
(π) ⊆ supp+
(ξy − ξx), supp−
(π) ⊆ supp−
(ξy − ξx), ∂π = χ̃u − χ̃v,
where χ̃u,χ̃v ∈ RV
are the characteristic vectors of u and v. For two ﬂows ξx +απ
and ξy − απ with 0 ≤ α ≤ α0, where α0 = min
a:|π(a)|=1
|ξy(a) − ξx(a)| (> 0), we have
ξx(a) > ξy(a) ⇒ fa(ξx(a) − α) + fa(ξy(a) + α) ≤ fa(ξx(a)) + fa(ξy(a)),
ξx(a) < ξy(a) ⇒ fa(ξx(a) + α) + fa(ξy(a) − α) ≤ fa(ξx(a)) + fa(ξy(a)).
It then follows that
f(x − α(χu − χv)) + f(y + α(χu − χv))
≤

a∈A
[fa(ξx(a) + απ(a)) + fa(ξy(a) − απ(a))]
≤

a∈A
[fa(ξx(a)) + fa(ξy(a))] ≤ f(x) + f(y) + 2ε.
This implies (M-EXC[R]) if α0 = α0(ε) does not tend to zero as ε → 0 and v = v(ε)
remains the same as ε → 0. For the former property, we can take an augmenting
path π such that α0 ≥ (x(u) − y(u))/|A|, and for the latter we may take a subse-
quence of ε that corresponds to a single v. In the discrete case of (2.39), α0 is a
positive integer and α = 1 is a valid choice. Hence follows (M-EXC[Z]).sidca00si
2013/2/12
page 61
2.3. Substitutes and Complements in Network Flows 61
Note 2.20. We prove that g in (2.45) satisﬁes (SBF[R]) and (TRF[R]) under the
assumption that g > −∞. First, (TRF[R]) is obvious from δ(p̃ + α1) = δp̃. Fix
p,q ∈ domRg. For any ε > 0 there exist ηp, ηq, p̃, and q̃ satisfying (2.48) and (2.49).
For η∨ = −δ(p̃ ∨ q̃) and η∧ = −δ(p̃ ∧ q̃), we have
η∨(a) = max(p̃(v),q̃(v)) − max(p̃(u),q̃(u)) (a = (u,v) ∈ A),
η∧(a) = min(p̃(v),q̃(v)) − min(p̃(u),q̃(u)) (a = (u,v) ∈ A).
Hence, for each a ∈ A, there exists λa (0 ≤ λa ≤ 1) such that
η∨(a) = λaηp(a) + (1 − λa)ηq(a), η∧(a) = (1 − λa)ηp(a) + λaηq(a),
which, together with the convexity of ga, implies that
ga(ηp(a)) + ga(ηq(a)) ≥ ga(η∨(a)) + ga(η∧(a)).
Therefore, we obtain
g(p) + g(q) + 2ε ≥

a∈A
[ga(η∨(a)) + ga(η∧(a))] ≥ g(p ∨ q) + g(p ∧ q),
which implies (SBF[R]), since ε > 0 is arbitrary. The discrete case (2.43) with ga
in (2.40) can be treated similarly.
## 2.3 Substitutes and Complements in Network Flows
In section 1.3 we explained that submodularity should be compared to convexity.
This statement is certainly true for set functions, but, when it comes to functions
in real or integer vectors, it is more appropriate to regard convexity and submod-
ularity as mutually independent properties. In this section we address this issue
with reference to substitutes and complements in network ﬂows discussed in the lit-
erature and show that the concepts of L-convexity and M-convexity help us better
understand the relationship between convexity and submodularity.
## 2.3.1 Convexity and Submodularity
We consider a network ﬂow problem. Let G = (V,A) be a directed graph with vertex
set V and arc set A. For each arc a ∈ A, we are given a nonnegative capacity c(a)
for ﬂow and a weight w(a) per unit ﬂow. The maximum weight circulation problem
is to ﬁnd a ﬂow ξ = (ξ(a) | a ∈ A) that maximizes the total weight a∈A w(a)ξ(a)
subject to the capacity (feasibility) constraint
0 ≤ ξ(a) ≤ c(a) (a ∈ A) (2.51)
and the conservation constraint

{ξ(a) | a ∈ δ+
v} −

{ξ(a) | a ∈ δ−
v} = 0 (v ∈ V ). (2.52)sidca00si
2013/2/12
page 62
## 62 Chapter 2. Convex Functions with Combinatorial Structures
We denote by F the maximum weight of a feasible circulation.
Our concern here is how the weight F depends on the problem parameters
(w,c). Namely, we are interested in the function F = F(w,c) in w ∈ RA
and
c ∈ RA
+. We ﬁrst look at convexity and concavity.
Proposition 2.21. F is convex in w and concave in c.
Proof. F = max{w
ξ | Nξ = 0, 0 ≤ ξ ≤ c} is the maximum of linear functions
in w and hence convex in w, where Nξ = 0 represents the conservation constraint
(2.52). By linear programming duality (see Theorem 3.10 (2)), we obtain an alter-
native expression F = min{c
η | N
p+η ≥ w, η ≥ 0}, which shows the concavity
of F in c.
We next consider submodularity and supermodularity. A function f : Rn
→
R ∪ {+∞} is said to be submodular if
f(x) + f(y) ≥ f(x ∨ y) + f(x ∧ y) (x,y ∈ Rn
) (2.53)
and supermodular if
f(x) + f(y) ≤ f(x ∨ y) + f(x ∧ y) (x,y ∈ Rn
), (2.54)
where x ∨ y and x ∧ y are, respectively, the vectors of componentwise maxima and
minima of x and y as deﬁned in (2.16). With the economic terms substitutes and
complements we have the following correspondences:
f is submodular ⇐⇒ goods are substitutes,
f is supermodular ⇐⇒ goods are complements,
where f is interpreted as representing a utility function.
Two arcs are said to be parallel if every simple cycle33
containing both of them
orients them in the opposite direction, and series if every simple cycle containing
both of them orients them in the same direction. A set of arcs is said to be parallel
if it consists of pairwise parallel arcs, and series if it consists of pairwise series arcs.
With the notation wP = (w(a) | a ∈ P), cP = (c(a) | a ∈ P), wS = (w(a) | a ∈ S),
and cS = (c(a) | a ∈ S), the following statements hold true, where the proof is given
later.
Theorem 2.22. Let P be a parallel arc set and S a series arc set.
(1) F is submodular in wP and in cP .
(2) F is supermodular in wS and in cS.
33Formally, a simple cycle is an alternating sequence (v0,a1,v1,a2,...,vk−1,ak,vk) of vertices
vi (i = 0,1,...,k) and arcs ai (i = 1,...,k) such that {∂+ai,∂−ai} = {vi−1,vi} (i = 1,...,k),
v0 = vk, and vi = vj (1 ≤ i < j ≤ k).sidca00si
2013/2/12
page 63
2.3. Substitutes and Complements in Network Flows 63
Combining Proposition 2.21 and Theorem 2.22 yields that
F is convex and submodular in wP ,
F is concave and submodular in cP ,
F is convex and supermodular in wS,
F is concave and supermodular in cS.
(2.55)
Thus, all combinations of convexity/concavity and submodularity/supermodularity
arise in our network ﬂow problem. This demonstrates that convexity and submod-
ularity are mutually independent properties.
Although convexity and submodularity are mutually independent, the com-
binations of convexity/concavity and submodularity/supermodularity in (2.55) are
not accidental phenomena but logical consequences that can be explained in terms
of L
-convexity and M
-convexity. The function F is endowed with L
-convexity
and M
-convexity, as follows, where the proof is given in section 2.3.2.
Theorem 2.23. Let P be a parallel arc set and S a series arc set.
(1) F is L
-convex in wP and M
-concave in cP .
(2) F is M
-convex in wS and L
-concave in cS.
In general, L
-convexity implies submodularity by (SBF
[R]) in the deﬁnition,
whereas M
-convexity implies supermodularity, as will be shown in Theorem 6.51.
Accordingly, L
-concavity implies supermodularity and M
-concavity submodular-
ity. With the aid of these general results on L
-convex and M
-convex functions,
Theorem 2.23 provides us with a somewhat deeper understanding of (2.55). Namely,
it is understood that
F is L
-convex, hence convex and submodular, in wP ,
F is M
-concave, hence concave and submodular, in cP ,
F is M
-convex, hence convex and supermodular, in wS,
F is L
-concave, hence concave and supermodular, in cS.
(2.56)
## 2.3.2 Technical Supplements
This section gives the proof of Theorem 2.23. We start with basic properties of
parallel and series arc sets that we use in the proof. Let us call π : A → {0,±1} a
circuit if ∂π = 0 and supp+
(π) ∪ supp−
(π) forms a simple cycle.
Proposition 2.24. Let π be a circuit.
(1) |supp+
(π) ∩ P| ≤ 1 and |supp−
(π) ∩ P| ≤ 1 for a parallel arc set P.
(2) |supp+
(π) ∩ S| = 0 or |supp−
(π) ∩ S| = 0 for a series arc set S.
Proposition 2.25. Let S be a series arc set and π1 and π2 be circuits. If
supp+
(π1) ∩ supp+
(π2) ∩ S = ∅, there exists a circuit π such that supp+
(π) ⊆
supp+
(π1) ∪ supp+
(π2), supp−
(π) ⊆ supp−
(π1) ∪ supp−
(π2), and supp+
(π) ∩ S =
(supp+
(π1) ∪ supp+
(π2)) ∩ S.sidca00si
2013/2/12
page 64
## 64 Chapter 2. Convex Functions with Combinatorial Structures
Proof. Suppose a ∈ (supp+
(π2)\supp+
(π1))∩S. By an elementary graph argument
we can ﬁnd a circuit π
such that supp+
(π
) ⊆ supp+
(π1)∪supp+
(π2), supp−
(π
) ⊆
supp−
(π1)∪supp−
(π2), and supp+
(π
)∩S ⊇ (supp+
(π1)∩S)∪{a}. Repeating this
we can ﬁnd π.
The main technical tool in the proof is the conformal decomposition34
of a
circulation ξ, which is a representation of ξ as a positive sum of circuits conformal
to ξ; i.e.,
ξ =
m 
i=1
βiπi, (2.57)
where βi > 0 and πi : A → {0,±1} is a circuit with supp+
(πi) ⊆ supp+
(ξ) and
supp−
(πi) ⊆ supp−
(ξ) for i = 1,...,m.
Proof of L
-Convexity in wP
The L
-convexity of F in wP is equivalent to the submodularity of F(w − w0χP ,c)
in (wP ,w0), which in turn is equivalent to
F(w + λχa,c) + F(w + μχb,c) ≥ F(w,c) + F(w + λχa + μχb,c), (2.58)
F(w + λχa,c) + F(w − μχP ,c) ≥ F(w,c) + F(w + λχa − μχP ,c) (2.59)
for a,b ∈ P with a = b and λ,μ ∈ R+.
To show (2.58) let ξ and ξ be optimal circulations for w and w + λχa + μχb.
We can establish (2.58) by constructing feasible circulations ξa and ξb such that
ξa + ξb = ξ + ξ, λ[ξa(a) − ξ(a)] + μ[ξb(b) − ξ(b)] ≥ 0, (2.60)
since this implies
w + λχa,ξa + w + μχb,ξb ≥ w,ξ + w + λχa + μχb,ξ ,
where the left-hand side is bounded by F(w + λχa,c) + F(w + μχb,c) and the
right-hand side is equal to F(w,c) + F(w + λχa + μχb,c). If ξ(a) ≤ ξ(a), we
can take ξa = ξ and ξb = ξ to meet (2.60). If ξ(b) ≤ ξ(b), we can take ξa = ξ
and ξb = ξ to meet (2.60). Otherwise, we make use of the conformal decomposition
ξ−ξ =
m
i=1 βiπi. Since a ∈ supp+
(ξ−ξ), we may assume πi(a) = 1 for i = 1,...,
and πi(a) = 0 for i = +1,...,m. We have πi(b) = 0 for i = 1,..., by Proposition
2.24 (1), since P is parallel and {a,b} ⊆ supp+
(ξ − ξ). Then ξa = ξ + i=1 βiπi
and ξb = ξ + m
i= +1 βiπi are feasible circulations that satisfy (2.60).
To show (2.59) let ξ and ξ be optimal circulations for w and w + λχa − μχP .
We can establish (2.59) by constructing feasible circulations ξa and ξP such that
ξa + ξP = ξ + ξ, λ[ξa(a) − ξ(a)] + μ[ξ(P) − ξP (P)] ≥ 0, (2.61)
34More generally, the conformal decomposition is deﬁned for a vector in a subspace in terms of
elementary vectors of the subspace; see Iri [94] and Rockafellar [178].sidca00si
2013/2/12
page 65
2.3. Substitutes and Complements in Network Flows 65
since this implies
w + λχa,ξa + w − μχP ,ξP ≥ w,ξ + w + λχa − μχP ,ξ .
If ξ(a) ≤ ξ(a), we can take ξa = ξ and ξP = ξ to meet (2.61). Otherwise, we use
the conformal decomposition ξ − ξ =
m
i=1 βiπi, in which we assume πi(a) = 1
for i = 1,..., and πi(a) = 0 for i =  + 1,...,m. Since P is parallel, we have
|supp−
(πi) ∩ P| ≤ 1 by Proposition 2.24 (1) and hence πi(P) ≥ 0 for i = 1,...,.
Therefore, ξa = ξ + i=1 βiπi and ξP = ξ +
m
i= +1 βiπi are feasible circulations
with the properties in (2.61).
Proof of M
-Concavity in cP
We prove the M
-concavity of F in cP by establishing (M
-EXC[R]) for −F as a
function in cP . In our notation this reads as follows:
Let c1,c2 ∈ RA
+ be capacities with c1(a
) = c2(a
) for all a
∈ A \ P.
For each a ∈ supp+
(c1 −c2), there exist b ∈ supp−
(c1 − c2)∪ {0} and a
positive number α0 such that
F(w,c1) + F(w,c2) ≤ F(w,c1 − α(χa − χb)) + F(w,c2 + α(χa − χb))
for all α ∈ [0,α0]R, where χ0 = 0.
Let ξ1 and ξ2 be optimal circulations for c1 and c2, respectively. We shall ﬁnd
α0 > 0 and b ∈ supp−
(c1 − c2) ∪ {0} such that, for any α ∈ [0,α0]R, there exist
circulations ξ
1 and ξ
2 such that
ξ
1 + ξ
2 = ξ1 + ξ2, 0 ≤ ξ
1 ≤ c1 − α(χa − χb), 0 ≤ ξ
2 ≤ c2 + α(χa − χb). (2.62)
If ξ1(a) < c1(a), we can take α0 = c1(a) − ξ1(a), b = 0, ξ
1 = ξ1, and ξ
2 = ξ2
to meet (2.62). Suppose ξ1(a) = c1(a). We have ξ1(a) = c1(a) > c2(a) ≥ ξ2(a).
Let π be a circuit such that a ∈ supp+
(π) ⊆ supp+
(ξ1 − ξ2) and supp−
(π) ⊆
supp−
(ξ1 −ξ2). Since P is parallel and a ∈ supp+
(π), we have supp+
(π)∩P = {a}
and |supp−
(π) ∩ P| ≤ 1 by Proposition 2.24 (1). If |supp−
(π) ∩ P| = 1, deﬁne
b by {b} = supp−
(π) ∩ P; otherwise put b = 0. We can take α0 > 0 such that
α0 ≤ |ξ1(a
) − ξ2(a
)| for all a
∈ supp+
(π) ∪ supp−
(π). Then ξ
1 = ξ1 − απ and
ξ
2 = ξ2 + απ satisfy (2.62) if 0 ≤ α ≤ α0.
Proof of M
-Convexity in wS
We prove the M
-convexity of F in wS by establishing (M
-EXC[R]). In our notation
this reads as follows:
Let w1,w2 ∈ RA
be weight vectors with w1(a
) = w2(a
) for all a
∈
A\S. For each a ∈ supp+
(w1−w2), there exist b ∈ supp−
(w1−w2)∪{0}
and a positive number α0 such that
F(w1,c) + F(w2,c) ≥ F(w1 − α(χa − χb),c) + F(w2 + α(χa − χb),c)
for all α ∈ [0,α0]R, where χ0 = 0.sidca00si
2013/2/12
page 66
## 66 Chapter 2. Convex Functions with Combinatorial Structures
Let ξ1 and ξ2 be optimal circulations for w1 and w2, respectively, with ξ1(a) mini-
mum and ξ2(a) maximum.
Proposition 2.26. There exists α0 > 0 such that ξ1 is optimal for w1 − αχa and
ξ2 is optimal for w2 + αχa for all α ∈ [0,α0]R.
Proof. For any circuit π such that π(a) = −1 and 0 ≤ ξ1 + βπ ≤ c for some
β > 0, we have w1,ξ1 + βπ < w1,ξ1 by the choice of ξ1. Let α1 > 0 be the
minimum of − w1,π over all such circuits π. Then ξ1 is optimal for w1 − αχa for
all α ∈ [0,α1]R, since w1 −αχa,ξ1 +βπ ≤ w1 −αχa,ξ1 for any β > 0 and circuit
π such that 0 ≤ ξ1 + βπ ≤ c. Similarly, let α2 > 0 be the minimum of − w2,π
over all circuits π such that π(a) = 1 and 0 ≤ ξ2 +βπ ≤ c for some β > 0. Then ξ2
is optimal for w2 + αχa for all α ∈ [0,α2]R. Put α0 = min(α1,α2).
If ξ1(a) ≥ ξ2(a), we can take b = 0 in (M
-EXC[R]), since
F(w1,c) + F(w2,c) = w1,ξ1 + w2,ξ2
≥ w1 − αχa,ξ1 + w2 + αχa,ξ2 = F(w1 − αχa,c) + F(w2 + αχa,c),
where the last equality is by Proposition 2.26. In what follows we assume ξ1(a) <
ξ2(a).
By Proposition 2.24 (2), we can impose further conditions on ξ1 and ξ2 that,
for each b ∈ S \ {a}, ξ1(b) is maximum among all optimal ξ1 for w1 with ξ1(a)
minimum, and ξ2(b) is minimum among all optimal ξ2 for w2 with ξ2(a) maximum.
Proposition 2.27. There exists α0 > 0 such that ξ1 is optimal for w1 −α(χa −χb)
and ξ2 is optimal for w2 + α(χa − χb) for all b ∈ S \ {a} and for all α ∈ [0,α0]R.
Proof. For any circuit π such that π(a) − π(b) = −1 for some b ∈ S \ {a} and
0 ≤ ξ1 +βπ ≤ c for some β > 0, we have w1,ξ1 +βπ < w1,ξ1 by the choice of ξ1.
Let α1 > 0 be the minimum of − w1,π over all such circuits π. Then ξ1 is optimal
for w1 − α(χa − χb) for all α ∈ [0,α1]R. Similarly, let α2 > 0 be the minimum of
− w2,π over all circuits π such that π(a) − π(b) = 1 for some b ∈ S \ {a} and
0 ≤ ξ2 + βπ ≤ c for some β > 0. Then ξ2 is optimal for w2 + α(χa − χb) for all
α ∈ [0,α2]R. Put α0 = min(α1,α2).
Proposition 2.27 implies
F(w1,c) + F(w2,c) − F(w1 − α(χa − χb),c) − F(w2 + α(χa − χb),c)
= w1,ξ1 + w2,ξ2 − w1 − α(χa − χb),ξ1 − w2 + α(χa − χb),ξ2
= α[(ξ2(b) − ξ1(b)) − (ξ2(a) − ξ1(a))]. (2.63)
We want to ﬁnd b ∈ supp−
(w1 − w2) for which (2.63) is nonnegative.
We make use of the conformal decomposition ξ2 −ξ1 = m
i=1 βiπi. Since S is
series, we may assume, by Proposition 2.25, that
a ∈ supp+
(π1) ∩ S ⊆ supp+
(π2) ∩ S ⊆ ··· ⊆ supp+
(π ) ∩ Ssidca00si
2013/2/12
page 67
2.3. Substitutes and Complements in Network Flows 67
and πi(a) = 0 for i =  + 1,...,m. Then supp−
(πi) ∩ S = ∅ for i = 1,...,.
Proposition 2.28. There exists b ∈ (supp+
(π1) ∩ S) ∩ supp−
(w1 − w2).
Proof. We have w1,π1 ≤ 0, since ξ1 is optimal for w1 and 0 ≤ ξ1 + β1π1 ≤ c.
Similarly, we have w2,−π1 ≤ 0. Hence,
0 ≥ w1 − w2,π1 =

b∈S
(w1(b) − w2(b))π1(b) =

b∈supp+(π1)∩S
(w1(b) − w2(b)).
Since w1(a) − w2(a) > 0 in this summation, we must have w1(b) − w2(b) < 0 for
some b ∈ supp+
(π1) ∩ S.
For b ∈ (supp+
(π1) ∩ S) ∩ supp−
(w1 − w2) in Proposition 2.28, we have
ξ2(b) − ξ1(b) =

i=1
βi +
m 
i= +1
βiπi(b) ≥

i=1
βi = ξ2(a) − ξ1(a),
which shows the nonnegativity of (2.63).
Proof of L
-Concavity in cS
The L
-concavity of F in cS is equivalent to the supermodularity of F(w,c−c0χS)
in (cS,c0), which in turn is equivalent to
F(w,c + λχa) + F(w,c + μχb) ≤ F(w,c) + F(w,c + λχa + μχb), (2.64)
F(w,c + λχa) + F(w,c − μχS) ≤ F(w,c) + F(w,c + λχa − μχS) (2.65)
for a,b ∈ S with a = b and λ,μ ∈ R+.
To show (2.64), let ξa and ξb be optimal circulations for c+λχa and c+μχb.
We can establish (2.64) by constructing circulations ξ and ξ such that
ξ + ξ = ξa + ξb, 0 ≤ ξ ≤ c, 0 ≤ ξ ≤ c + λχa + μχb. (2.66)
If ξa(a) ≤ c(a), we can take ξ = ξa and ξ = ξb to meet (2.66). If ξb(b) ≤ c(b), we
can take ξ = ξb and ξ = ξa to meet (2.66). Otherwise, we have ξa(a) > c(a) ≥ ξb(a)
and ξa(b) ≤ c(b) < ξb(b), and therefore a ∈ supp+
(ξa − ξb) and b ∈ supp−
(ξa − ξb).
We make use of the conformal decomposition ξa −ξb =
m
i=1 βiπi, where we assume
πi(a) = 1 for i = 1,..., and πi(a) = 0 for i =  + 1,...,m. We have πi(b) = 0 for
i = 1,..., by Proposition 2.24 (2), since S is series and a ∈ supp+
(ξa − ξb) and
b ∈ supp−
(ξa −ξb). Then ξ = ξa − i=1 βiπi and ξ = ξb + i=1 βiπi satisfy (2.66).
To show (2.65), let ξa and ξS be optimal circulations for c+λχa and c−μχS.
We can establish (2.65) by constructing circulations ξ and ξ such that
ξ + ξ = ξa + ξS, 0 ≤ ξ ≤ c, 0 ≤ ξ ≤ c + λχa − μχS. (2.67)
If ξa(a) ≤ c(a), we can take ξ = ξa and ξ = ξS to meet (2.67). Otherwise, we
have ξa(a) > c(a) ≥ ξS(a), and therefore a ∈ supp+
(ξa −ξS). We use the conformalsidca00si
2013/2/12
page 68
## 68 Chapter 2. Convex Functions with Combinatorial Structures
decomposition ξa−ξS = m
i=1 βiπi. Since S is series, we may assume by Proposition
2.25 that
a ∈ supp+
(π1) ∩ S ⊆ supp+
(π2) ∩ S ⊆ ··· ⊆ supp+
(π ) ∩ S
and πi(a) = 0 for i = +1,...,m. Then supp−
(πi)∩S = ∅ for i = 1,...,. Noting
i=1 βi = ξa(a)−ξS(a) ≥ ξa(a)−c(a), let k be the smallest integer with
k
i=1 βi ≥
ξa(a)−c(a) and deﬁne β
= [ξa(a)−c(a)]−
k−1
i=1 βi. Then ξ = ξa−
k−1
i=1 βiπi−β
πk
and ξ = ξS +
k−1
i=1 βiπi + β
πk satisfy (2.67), since ξ(a) = ξa(a) −
k−1
i=1 βi − β
=
c(a), ξ(a) = ξS(a) +
k−1
i=1 βi + β
= ξS(a) + ξa(a) − c(a) ≤ c(a) + λ − μ, and, for
any b ∈ supp+
(πk) ∩ S, we have
ξ(b) = ξS(b) +
k−1 
i=1
βiπi(b) + β
= ξS(b) +
k−1 
i=1
βiπi(b) +
+

i=k
βi + ξS(a) − c(a)
,
=
+
ξS(b) +

i=1
βiπi(b)
,
+ ξS(a) − c(a) ≤ ξa(b) + ξS(a) − c(a) ≤ c(b) − μ.
This completes the proof of Theorem 2.23.
## 2.4 Matroids
In section 1.3.2 we introduced the concept of base polyhedra in terms of an abstract
exchange axiom and mentioned that a matroid can be identiﬁed with a base polyhe-
dron having vertices of {0,1}-vectors. To compensate for such an abstract deﬁnition
of matroids, we explain here some linear-algebraic facts behind the abstract axioms.
The key is the Grassmann–Plücker relation for determinants, qualitative analyses
of which lead to the concepts of matroids and valuated matroids.
## 2.4.1 From Matrices to Matroids
Suppose we are given a matrix, say,
A =
1 2 3 4 5
1 0 0 1 0
0 1 0 1 1
0 0 1 0 1
= [a1,...,a5], (2.68)
where a1,...,a5 ∈ R3
denote the column vectors. Let V denote the set of its
column indices; we have V = {1,...,5} in our example.
The concept of matroids is derived from a combinatorial consideration of linear
dependence among column vectors. We say that a subset J of V is independent if
the corresponding column vectors {aj | j ∈ J} are linearly independent. Since a
subset of an independent set is obviously independent, we may focus on maximal
independent sets (maximal with respect to set inclusion). A maximal independentsidca00si
2013/2/12
page 69
2.4. Matroids 69
set is called a base and the family of bases (or base family) is denoted by B. In our
example we have
B = {{1,2,3},{1,2,5},{1,3,4},{1,3,5},{1,4,5},{2,3,4},{2,4,5},{3,4,5}}.
The base family B has a remarkable combinatorial property:
(B) For any J,J
∈ B and any i ∈ J \ J
, there exists j ∈ J
\ J such
that J − i + j ∈ B and J
+ i − j ∈ B,
where J \ J
= {k | k ∈ J,k / ∈ J
} and J − i + j and J
+ i − j are shorthand
notations for (J \ {i}) ∪ {j} and (J
∪ {i}) \ {j}, respectively. For instance, take
J = {1,2,3} and J
= {3,4,5} in our example. For i = 1 we can take j = 4 to
obtain J − i + j = {4,2,3} ∈ B and J
+ i − j = {3,1,5} ∈ B. The choice of j = 5
is not valid, since J − i + j = {5,2,3} / ∈ B. The property (B) above is called the
(simultaneous) exchange property.
For the proof of the exchange property (B) we need to introduce the Grassmann–
Plücker relation, a fundamental fact in linear algebra. For J ⊆ V we denote35
the
determinant of the submatrix A[J] = (aj | j ∈ J) by detA[J]. The Grassmann–
Plücker relation is an identity
detA[J]·detA[J
] =

j∈J\J
detA[J − i + j]·detA[J
+ i − j] (2.69)
valid for any J,J
⊆ V and any i ∈ J \J
(the proof is sketched in Note 2.30). The
notation detA[J −i+j] here means the determinant of A[J] with column i replaced
with column j.
To prove (B), suppose that J,J
∈ B. Then the left-hand side of (2.69) is
distinct from zero, and therefore, there exists a nonzero term, say, indexed by
j ∈ J
\ J, in the summation on the right-hand side of (2.69). Then we have
detA[J −i+j] = 0 and detA[J
+i−j] = 0; i.e., J −i+j ∈ B and J
+i−j ∈ B.
This proves (B). We emphasize that the exchange property (B) is derived from
the Grassmann–Plücker relation by a qualitative consideration that distinguishes
between zero and nonzero, while disregarding the numerical information.
An alternative representation of linear independence among column vectors is
given by the rank function ρ : 2V
→ Z deﬁned by
ρ(X) = rank{aj | j ∈ X} (X ⊆ V ). (2.70)
The rank function has the following properties (proved in Note 2.31):
(R1) 0 ≤ ρ(X) ≤ |X|,
(R2) X ⊆ Y =⇒ ρ(X) ≤ ρ(Y ),
(R3) ρ(X) + ρ(Y ) ≥ ρ(X ∪ Y ) + ρ(X ∩ Y ).
35We consider J such that A[J] is square and implicitly assume an ordering of the elements of
J, which aﬀects the sign of the determinant.sidca00si
2013/2/12
page 70
## 70 Chapter 2. Convex Functions with Combinatorial Structures
The third property (R3) shows that ρ is a submodular function. The rank function
and the base family determine each other by
ρ(X) = max{|X ∩ J| | J ∈ B} (X ⊆ V ), (2.71)
B = {J ⊆ V | ρ(J) = |J| = ρ(V )}. (2.72)
From a given matrix we have thus derived a set family B ⊆ 2V
with property
(B) and a set function ρ : 2V
→ Z with property (R) (i.e., (R1) to (R3)), where
V is the set of columns of the given matrix. It is all-important to realize that the
properties (B) and (R) are stated without reference to the given matrix and, as such,
they make sense as properties of a set family and a set function in general. Matroid
theory adopts these properties as abstract axioms and studies the combinatorial
structure implied by these axioms (and nothing else).
It turns out that a set family B satisfying axiom (B) and a set function ρ
satisfying axiom (R) are equivalent to each other. More precisely, we have the
following statement.
Theorem 2.29. The class of set functions ρ : 2V
→ Z satisfying (R1), (R2), and
(R3) and the class of nonempty families B ⊆ 2V
satisfying (B) are in one-to-one
correspondence through the mutually inverse mappings (2.71) and (2.72).
In this sense, the two objects B and ρ represent one and the same combinatorial
structure, which is called a matroid. That is, a matroid is a pair (V,B) of a ﬁnite
set V and a family B of subsets of V that satisﬁes (B), or, alternatively, a matroid
is a pair (V,ρ) of a ﬁnite set V and a set function ρ on V that satisﬁes (R). We
may also denote a matroid by a triple (V,B,ρ). The set V is called the ground set,
B is the base family, and ρ is the rank function of the matroid. A member of B is
a base and a subset of a base is an independent set.
Though deﬁned by such simple axioms, the concept of matroids is fundamental
and fruitful in studying combinatorial structures. The exchange property (B) above
is the germ of (B-EXC[Z]) treated in section 1.3.2 and (R3) is the submodularity
featured in section 1.3.1. The one-to-one correspondence between B and ρ stated
in Theorem 2.29 above is the germ of Theorem 1.9 that establishes the equivalence
between exchangeability and submodularity.
Note 2.30. The idea of the proof of the Grassmann–Plücker relation (2.69) is
indicated here for a 3 × 5 matrix
A =
-
a1 a2 a3 a4 a5
.
(a1,...,a5 ∈ R3
) and for J = {1,2,3}, J
= {3,4,5}, and i = 1. Consider a 6 × 6
matrix
Ã =

a1 a2 a3 a3 a4 a5
a
1 0 0 a
3 a
4 a
5

,sidca00si
2013/2/12
page 71
2.4. Matroids 71
where a
j = aj (j = 1,3,4,5). The generalized Laplace expansion applied to detÃ
yields
detÃ = det[a1,a2,a3] · det[a
3,a
4,a
5] − det[a4,a2,a3] · det[a
3,a
1,a
5]
−det[a5,a2,a3] · det[a
3,a
4,a
1].
On the other hand, subtracting the lower half (three rows) from the upper half
(three rows) of Ã yields

0 a2 a3 0 0 0
a
1 0 0 a
3 a
4 a
5

,
which is obviously singular. Hence, detÃ = 0, and
det[a1,a2,a3] · det[a
3,a
4,a
5]
= det[a4,a2,a3] · det[a
3,a
1,a
5] + det[a5,a2,a3] · det[a
3,a
4,a
1],
establishing (2.69) for J = {1,2,3}, J
= {3,4,5}, and i = 1.
Note 2.31. We prove (R1), (R2), and (R3) for the rank function (2.70) associated
with a matrix. (R1) and (R2) are obvious. To prove (R3), let {aj | j ∈ JXY } (where
JXY ⊆ X∩Y ) be a base of {aj | j ∈ X∩Y }. There exists some JX ⊆ X\Y such that
{aj | j ∈ JXY ∪ JX} is a base of {aj | j ∈ X}, since any set of independent vectors
can be augmented to a base. For the same reason, there exists some JY ⊆ Y \ X
such that {aj | j ∈ JXY ∪ JX ∪ JY } is a base of {aj | j ∈ X ∪ Y }. Then we have
|JXY | = ρ(X ∩ Y ), |JXY | + |JX| = ρ(X), |JXY | + |JX| + |JY | = ρ(X ∪ Y ), and
|JXY | + |JY | ≤ ρ(Y ), where the last inequality is due to the independence of the
vectors indexed by JXY ∪ JY . Hence follows (R3).
## 2.4.2 From Polynomial Matrices to Valuated Matroids
In section 2.4.1 we abstracted the axiom of a matroid from the Grassmann–Plücker
relation for matrices. A similar argument for polynomial matrices leads us to the
concept of valuated matroids, which may be thought of as discrete concave functions.
Suppose we are given a polynomial matrix in variable s, say,
A(s) =
1 2 3 4
s + 1 s 1 0
1 1 1 1
, (2.73)
with the column set V = {1,2,3,4}.
Since the determinant detA[J] is a polynomial in s, we can talk of its degree,
which we denote by ω(J):
ω(J) = degdetA[J] (J ⊆ V ), (2.74)
where we put ω(J) = −∞ if detA[J] = 0 or A[J] is nonsquare (when detA[J] is
not deﬁned). Using the notation B for the family of bases we have
ω(J) = −∞ ⇐⇒ J ∈ B.sidca00si
2013/2/12
page 72
## 72 Chapter 2. Convex Functions with Combinatorial Structures
We now look at the Grassmann–Plücker relation (2.69) with respect to the
degree in s. For J,J
∈ B, the degree of the left-hand side of (2.69) is equal to
ω(J)+ω(J
). This implies that at least one term on the right-hand side must have
degree not lower than this. Hence, the function ω has the following property:
(VM) For any J,J
∈ B and any i ∈ J \J
, there exists j ∈ J
\J such
that J − i + j ∈ B, J
+ i − j ∈ B, and
ω(J) + ω(J
) ≤ ω(J − i + j) + ω(J
+ i − j).
The inequality can be strict due to possible cancellations of the highest degree terms
on the right-hand side of (2.69).
In our example (2.73) we have detA[{1,2}] = detA[{3,4}] = 1, and hence
ω(J) = ω(J
) = 0 for J = {1,2} and J
= {3,4}. For i = 1 ∈ J \ J
we can choose
j = 3 ∈ J
\ J, for which ω(J − i + j) + ω(J
+ i − j) = 2.
The concept of valuated matroids is obtained by adopting (VM) as an axiom.
Namely, a valuated matroid is a pair (V,ω) of a ﬁnite set V and a set function
ω : 2V
→ R ∪ {−∞} that satisﬁes (VM), where it is assumed that
B = {J ⊆ V | ω(J) = −∞} (2.75)
is nonempty.
Not surprisingly, valuated matroids are closely related to matroids. First,
(VM) for ω implies (B) for B. This means that (V,B) is a matroid if (V,ω) is a
valuated matroid. Accordingly, B is called the base family of the valuated matroid
(V,ω). It is also said that ω is a valuation of the matroid (V,B).
Next, the maximizers of ω form the base family of a matroid. This is because,
for two maximizers J and J
with ω(J) = ω(J
) = maxω, we have ω(J − i + j) =
ω(J
+i−j) = maxω in (VM), which means (B) for the family of maximizers of ω.
Furthermore, for any p = (p(i) | i ∈ V ) ∈ RV
, the function ω[−p] : 2V
→ R∪{−∞}
deﬁned by
ω[−p](J) = ω(J) −

j∈J
p(j) (2.76)
is a valuated matroid, and therefore, the maximizers of ω[−p] form the base family
of a matroid for each p ∈ RV
. This property, in turn, characterizes a valuated
matroid as follows.
Theorem 2.32. Let (V,B) be a matroid with ground set V and base family B. A
function ω : B → R is a valuation if and only if for any p : V → R the maximizers
of ω[−p] form the base family of a matroid.
Proof. This is a special case of Theorem 6.30 to be shown later.
This theorem seems to suggest that we should compare valuated matroids to
concave functions and matroids to convex sets. Here is a connection of valuatedsidca00si
2013/2/12
page 73
2.4. Matroids 73
matroids to M-convexity. A set function ω : 2V
→ R∪{−∞} can be identiﬁed with
a function f : ZV
→ R ∪ {+∞} with domZf ⊆ {0,1}V
by
f(x) =

−ω(J) (x = χJ,J ∈ B),
+∞ (otherwise),
(2.77)
where domZf = {χJ | J ∈ B} with B in (2.75). It is easy to observe that (VM) for
ω is equivalent to (M-EXC[Z]) for f. That is, ω is a valuated matroid if and only
if f is an M-convex function. For instance, the valuated matroid (V,ω) associated
with the polynomial matrix in (2.73) can be identiﬁed with an M-convex function
f(x) =
⎧
⎨
⎩
0 (x ∈ B0),
−1 (x ∈ B \ B0),
+∞ (x ∈ ZV
\ B),
where B = {(1,1,0,0),(0,0,1,1),(1,0,1,0),(1,0,0,1),(0,1,1,0),(0,1,0,1)}and B0 =
{(1,1,0,0),(0,0,1,1)}.
In parallel with the generalization of the base family to a valuation ω, the
rank function of a matroid can be generalized as follows. Assuming that ω is an
integer-valued valuation, we deﬁne a function g : ZV
→ Z ∪ {+∞} by
g(p) = max
⎧
⎨
⎩
ω(J) +

j∈J
p(j)
)
)
)
)
)
)
J ∈ B
⎫
⎬
⎭
(p ∈ ZV
). (2.78)
In our example of (2.73) we have
g(p) = max(p(1) + p(2),p(3) + p(4),p(1) + p(3) + 1,
p(1) + p(4) + 1,p(2) + p(3) + 1,p(2) + p(4) + 1).
As is shown in Note 2.34, the function g is submodular over the integer lattice:
g(p) + g(q) ≥ g(p ∨ q) + g(p ∧ q) (p,q ∈ ZV
), (2.79)
which is a generalization of the submodularity (R3) of the rank function of a ma-
troid. The connection to a matroid rank function is conspicuous in the special case
where ω(J) = 0 for all J ∈ B. Then we have
g(χX) = max{|X ∩ J| | J ∈ B} = ρ(X) (X ⊆ V )
by (2.78) and (2.71), where ρ is the rank function of the underlying matroid (V,B).
Note 2.33. We have started with a polynomial matrix to deﬁne a function ω with
property (VM). As is evident from the proof, the same construction works for a
matrix over a non-Archimedian valuated ﬁeld (van der Waerden [205]). The name
“valuated matroid” comes from this fact.sidca00si
2013/2/12
page 74
## 74 Chapter 2. Convex Functions with Combinatorial Structures
Note 2.34. The submodularity (2.79) of the function g in (2.78) can be proved as
follows. First we show
g(χi) + g(χj) ≥ g(0) + g(χi + χj) (i = j), (2.80)
which is a special case of (2.79) for p = χi and q = χj. Take I,J ∈ B with
g(0) = ω(I) and g(χi + χj) = ω(J) + |J ∩ {i,j}|. If |J ∩ {i,j}| ≤ 1, we have
g(χi + χj) = max(g(χi),g(χj)), which implies (2.80). The case of |J ∩ {i,j}| =
|I ∩ {i,j}| = 2 is also easy. Suppose that |J ∩ {i,j}| = 2 and |I ∩ {i,j}| ≤ 1, and
assume j ∈ J\I without loss of generality. By (VM), there exists k ∈ I\J for which
ω(I)+ω(J) ≤ ω(I+j−k)+ω(J−j+k). This establishes (2.80), since ω(I) = g(0),
ω(J) = g(χi + χj) − 2, ω(I + j − k) ≤ g(χj) − 1, and ω(J − j + k) ≤ g(χi) − 1.
For p = (p ∧ q) + χi and q = (p ∧ q) + χj (i = j), the same argument applies to
ω
(J) = ω(J)+ j∈J(p∧q)(j) to prove (2.79). The general case can be treated by
induction on ||p − q||1; we may assume supp+
(p − q) = ∅ and add the inequalities
(2.79) for (p − χi,q) and for (p,(p ∨ q) − χi) with i ∈ supp+
(p − q).
Bibliographical Notes
M-matrices are well-studied objects in applied mathematics and a comprehensive
treatment of their mathematical properties can be found in Berman–Plemmons
[9]. The connection of symmetric M-matrices to L-/M-convex quadratic functions
presented in section 2.1 is mostly based on Murota [147], whereas the general case
described in section 2.1.4 is due to Murota–Shioura [155]. See Fukushima–Oshima–
Takeda [71] and Doyle–Snell [39] for connections to probability theory.
For network ﬂow problems in combinatorial optimization, Ford–Fulkerson [53]
is the classic, whereas Ahuja–Magnanti–Orlin [1] describes recent algorithmic devel-
opments. Thorough treatments of the network ﬂow problem on the basis of convex
analysis can be found in Iri [94] and Rockafellar [178], the former putting more
emphasis on physical issues and the latter more mathematical. In particular, the
functions f and g in (2.37) and (2.38) are considered in the case of |T| = 2 in
[94] and [178]. The variational formulations are also discussed in Brayton–Moser
[19] and Clay [25]. The terminologies of current potential and voltage potential are
taken from [19], though they seem to be more often called content and cocontent.
M-convexity and L-convexity in the network ﬂow problem are pointed out in Murota
[140], [141], [142].
Substitutes and complements in network ﬂows are discussed in Gale–Politof
[73], Granot–Veinott [79], and Shapley [184], [185]. In particular, Theorem 2.22 is
due to Gale–Politof [73]. The connection to M-convexity and L-convexity (Theorem
2.23) is due to Murota–Shioura [158].
A number of books on matroids are available: Oxley [170], Welsh [211], and
White [212], [213], [214] are standard mathematical textbooks; Recski [175] realizes
a successful balance between theory and application; and Murota [146] empha-
sizes linear-algebraic motivations. For optimization on matroids, see, e.g., Cook–
Cunningham–Pulleyblank–Schrijver [26], Faigle [48], Korte–Vygen [115], Lawler
[119], and Schrijver [183]. Key papers in the development of matroid theory, in-
cluding Whitney [218], are collected in Kung [116]. Nakasawa [164] gives simplesidca00si
2013/2/12
page 75
2.4. Matroids 75
exchange axioms for matroids. The simultaneous exchange property for matroids
is due to Brualdi [20]. The concept of valuated matroids is due to Dress–Wenzel
[41], [42]. Chapter 5 of [146] is a systematic presentation of the theory of valuated
matroids including duality. Circuit axioms are investigated in Murota–Tamura
[159] and constrained optimizations in Althöfer–Wenzel [2]. Oriented matroids are
another ramiﬁcation of matroids, for which a comprehensive monograph of Björner–
Las Vergnas–Sturmfels–White–Ziegler [16] is available.sidca00si
2013/2/12
page 77
Chapter 3
Convex Analysis,
Linear Programming,
and Integrality
This chapter provides technical elements that are needed in subsequent chapters.
Some basic facts in convex analysis and linear programming are given in the ﬁrst
two sections. The following two sections address integrality issues, i.e., integrality
for a pair of integral polyhedra and the concept of integrally convex functions.
## 3.1 Convex Analysis
A minimal set of prerequisites from convex analysis is given in this section, while
the reader is referred to the textbooks listed in the bibliographical notes at the end
of this chapter for comprehensive accounts.
For two vectors a = (a(i))n
i=1 and b = (b(i))n
i=1 ∈ (R ∪ {±∞})n
we deﬁne
[a,b] = [a,b]R = {x ∈ Rn
| a(i) ≤ x(i) ≤ b(i) (i = 1,...,n)}, (3.1)
(a,b) = (a,b)R = {x ∈ Rn
| a(i) < x(i) < b(i) (i = 1,...,n)}, (3.2)
where, if a(i) = −∞, for example, a(i) ≤ x(i) is to be understood as −∞ < x(i).
Sets such as [a,b] and (a,b) are referred to as closed intervals and open intervals,
respectively.
For a function f : Rn
→ R ∪ {±∞} we deﬁne
domf = domRf = {x ∈ Rn
| −∞ < f(x) < +∞}, (3.3)
which is the eﬀective domain of f.
A function f : Rn
→ R ∪ {+∞} is said to be convex if it satisﬁes
λf(x) + (1 − λ)f(y) ≥ f(λx + (1 − λ)y) (x,y ∈ Rn
,0 ≤ λ ≤ 1). (3.4)
Note that −∞ is excluded from the possible function values of a convex function
and that the inequality (3.4) is satisﬁed, by convention, if it is in the form of
+∞ ≤ +∞. A convex function with a nonempty eﬀective domain is called a
proper convex function. A function is strictly convex if it satisﬁes (3.4) with strict
77sidca00si
2013/2/12
page 78
## 78 Chapter 3. Convex Analysis, Linear Programming, and Integrality
inequalities, i.e., if
λf(x) + (1 − λ)f(y) > f(λx + (1 − λ)y) (x,y ∈ domf, 0 < λ < 1). (3.5)
A function h : Rn
→ R ∪ {−∞} is concave if −h is convex, i.e., if
λh(x) + (1 − λ)h(y) ≤ h(λx + (1 − λ)y) (x,y ∈ Rn
, 0 ≤ λ ≤ 1). (3.6)
A set S ⊆ Rn
is called convex if it satisﬁes the condition
x,y ∈ S, 0 ≤ λ ≤ 1 =⇒ λx + (1 − λ)y ∈ S, (3.7)
where an empty set is a convex set. A set S is a cone if it satisﬁes
x ∈ S, λ > 0 =⇒ λx ∈ S. (3.8)
A convex cone is a cone that is convex and a set S is a convex cone if and only if
it satisﬁes the condition
x,y ∈ S, λ,μ > 0 =⇒ λx + μy ∈ S. (3.9)
A convex polyhedron is a typical convex set S described by a ﬁnite number of linear
inequalities as
S =
⎧
⎨
⎩
x ∈ Rn
)
)
)
)
)
)
n 
j=1
aijx(j) ≤ bi (i = 1,...,m)
⎫
⎬
⎭
, (3.10)
where aij ∈ R and bi ∈ R (i = 1,...,m,j = 1,...,n). If bi = 0 for all i, then S is
a convex cone.
For a ﬁnite number of points x1,...,xm in a set S, a point represented as
λ1x1 + ··· + λmxm (3.11)
with nonnegative coeﬃcients λi (1 ≤ i ≤ m) with unit sum ( m
i=1 λi = 1) is called
a convex combination of those points. The convex closure of S, denoted as S, is
deﬁned to be the set of all possible convex combinations of a ﬁnite number of points
of S. If S is convex, any convex combination of any ﬁnite set of points of S belongs
to S, and vice versa, and therefore S is convex if and only if S = S.
For a set S, the intersection of all the convex sets containing S is the smallest
convex set containing S, which is called the convex hull of S. The convex hull of S
coincides with the convex closure of S. The convex hull of a set S is not necessarily
closed (in the topological sense). The smallest closed convex set containing S is
called the closed convex hull of S. For a ﬁnite set S, the convex hull is always
closed.
The aﬃne hull of a set S is deﬁned to be the smallest aﬃne set (a translation
of a linear space) containing S and is denoted by aﬀ S. The relative interior of S,
denoted as riS, is the set of points x ∈ S such that {y ∈ Rn
| ||y − x|| < ε} ∩ aﬀ Ssidca00si
2013/2/12
page 79
3.1. Convex Analysis 79
is contained in S for some ε > 0. In other words, the relative interior of S is the
set of the interior points of S with respect to the topology induced from aﬀ S.
We have so far deﬁned convex functions and convex sets independently, but
they are actually closely related to each other. The indicator function of a set
S ⊆ Rn
is a function δS : Rn
→ {0,+∞} deﬁned by
δS(x) =

0 (x ∈ S),
+∞ (x / ∈ S).
(3.12)
Then, as is easily seen,
S is a convex set ⇐⇒ δS is a convex function. (3.13)
This shows how the concept of convex sets can be deﬁned in terms of that of convex
functions. Conversely, convex functions can be deﬁned in terms of convex sets. The
epigraph of a function f : Rn
→ R ∪ {+∞}, denoted as epif, is the set of points
in Rn
× R lying above the graph of Y = f(x). Namely,
epif = {(x,Y ) ∈ Rn+1
| Y ≥ f(x)}. (3.14)
Then we have
f is a convex function ⇐⇒ epif is a convex set, (3.15)
which shows that the convexity concept for functions can be induced from that for
sets. In passing, we mention that a function f is said to be closed convex if epif is
a closed convex set in Rn+1
.
A (global) minimizer of f is a point x such that f(x) ≤ f(y) for all y. The
set of the minimizers of f, denoted by
argminf = {x ∈ Rn
| f(x) ≤ f(y) (∀y ∈ Rn
)}, (3.16)
is a convex set for a convex function f. A global minimizer of a convex function
can be characterized by local minimality (Theorem 1.1).
For a family of convex functions {fk | k ∈ K}, indexed by K, the pointwise
maximum, f(x) = sup{fk(x) | k ∈ K}, is again a convex function, where the index
set K here may possibly be inﬁnite. In particular, the maximum of a ﬁnite or
inﬁnite number of aﬃne functions
f(x) = sup{αk + pk,x | k ∈ K} (3.17)
is a convex function, where αk ∈ R and pk ∈ Rn
for k ∈ K and
p,x =
n 
i=1
p(i)x(i) (3.18)
designates the inner product 36
of p = (p(i))n
i=1 and x = (x(i))n
i=1.
36More precisely, p,x is not so much an inner product as a pairing, since p and x belong to
diﬀerent (mutually dual) spaces.sidca00si
2013/2/12
page 80
## 80 Chapter 3. Convex Analysis, Linear Programming, and Integrality
A function deﬁned on Rn
is said to be polyhedral convex if its epigraph is a
convex polyhedron in Rn+1
. A polyhedral convex function is exactly such a function
that can be represented as the maximum of a ﬁnite number of aﬃne functions (i.e.,
(3.17) with ﬁnite K) on an eﬀective domain represented as (3.10). In the case
of n = 1 (univariate case), a polyhedral convex function is nothing but a convex
piecewise linear function consisting of a ﬁnite number of linear pieces. We denote
by C[R → R] the family of univariate polyhedral convex functions.
The sum of two functions fk : Rn
→ R ∪ {+∞} (k = 1,2) is a function
f1 + f2 : Rn
→ R ∪ {+∞} deﬁned naturally by
(f1 + f2)(x) = f1(x) + f2(x) (x ∈ Rn
) (3.19)
and their inﬁmal convolution is a function f12f2 : Rn
→ R ∪ {±∞} deﬁned by
(f12f2)(x) = inf{f1(x1) + f2(x2) | x = x1 + x2,x1,x2 ∈ Rn
} (x ∈ Rn
). (3.20)
The sum of two convex functions is convex, and the inﬁmal convolution of two
convex functions is convex if it does not take the value of −∞. If f1 and f2 are
the indicator functions of sets S1 and S2, then f1 +f2 and f12f2 are the indicator
functions of the intersection S1 ∩ S2 and the Minkowski sum S1 + S2, respectively,
where
S1 + S2 = {x1 + x2 | x1 ∈ S1,x2 ∈ S2}. (3.21)
Modifying a function by a linear function is a fundamental operation. For a
function f and a vector p, we denote by f[−p] the function deﬁned by
f[−p](x) = f(x) − p,x (x ∈ Rn
). (3.22)
This is a convex function for f convex.
The subdiﬀerential of a function f at a point x ∈ domf is deﬁned to be the
set
∂Rf(x) = {p ∈ Rn
| f(y) − f(x) ≥ p,y − x (∀y ∈ Rn
)}. (3.23)
Note that p ∈ ∂Rf(x) if and only if x ∈ argminf[−p]. Being the intersection of
(inﬁnitely many) half-spaces indexed by y, ∂Rf(x) is convex (possibly empty) for
any f and any x. The set ∂Rf(x) is nonempty for f convex and x in the relative
interior of domf. An element of ∂Rf(x) is called a subgradient of f at x. If f
is convex and diﬀerentiable at x, the subdiﬀerential ∂Rf(x) consists of a single
element, which is the gradient ∇f = (∂f/∂x(i))n
i=1 of f at x.
The directional derivative of a function f at a point x ∈ domf in a direction
d ∈ Rn
is deﬁned by
f
(x;d) = lim
α↓0
f(x + αd) − f(x)
α
(3.24)
when this limit (ﬁnite or inﬁnite) exists, where α ↓ 0 means that α tends to 0 from
the positive side (α > 0). For convex f, the limit exists for all d, and f
(x;d) is a
convex function in d. For polyhedral convex f, there exists ε > 0, independent of
x ∈ domf, such that
f
(x;d) = f(x + d) − f(x) (||d||1 ≤ ε). (3.25)sidca00si
2013/2/12
page 81
3.1. Convex Analysis 81
-
x
6 Y
Y = f(x)
Y = p,x − f•
(p)
−f•
(p)
Figure 3.1. Conjugate function (Legendre–Fenchel transform).
The conjugate (or convex conjugate) of a function f : Rn
→ R∪{+∞}, where
domf = ∅ is assumed, is a function f•
: Rn
→ R ∪ {+∞} deﬁned by
f•
(p) = sup{ p,x − f(x) | x ∈ Rn
} (p ∈ Rn
). (3.26)
This is a convex function in p, being the maximum of (inﬁnitely many) aﬃne func-
tions in p indexed by x. The function f•
is also called the (convex) Legendre–Fenchel
transform of f, and the mapping f → f•
is referred to as the (convex) Legendre–
Fenchel transformation.
In the favorable situation where f is a smooth convex function and the supre-
mum in (3.26) is attained by a unique x = x(p) for each p, we have
f•
(p) = p,x(p) − f(x(p)), (3.27)
where x = x(p) is determined as the solution to the equation ∇f(x) = p. This
hints at a geometrical interpretation of the conjugate function. In the case of n = 1
(see Fig. 3.1), for simplicity, the tangent line to the graph Y = f(x) with slope p
intersects the Y -axis at a point with the Y -coordinate equal to −f•
(p).
Similarly, the concave conjugate of a function h : Rn
→ R ∪ {−∞}, where
domh = ∅, is a function h◦
: Rn
→ R ∪ {−∞} deﬁned by
h◦
(p) = inf{ p,x − h(x) | x ∈ Rn
} (p ∈ Rn
). (3.28)
Note that h◦
(p) = −(−h)•
(−p).
Example 3.1. For a convex function
f(x) =
⎧
⎨
⎩
xlogx (x > 0),
0 (x = 0),
+∞ (x < 0),
(3.29)
the conjugate is given by f•
(p) = exp(p − 1). This can be veriﬁed by a simple
calculation based on (3.27).sidca00si
2013/2/12
page 82
## 82 Chapter 3. Convex Analysis, Linear Programming, and Integrality
For a function f, we may think of (f•
)•
, the conjugate of the conjugate of f,
which is called the biconjugate of f and denoted as f••
. The biconjugate of f is the
largest closed convex function that is dominated pointwise by f. In particular, the
biconjugate δS
••
of the indicator function δS of a set S is the indicator function of
the closed convex hull of S.
Theorem 3.2. The Legendre–Fenchel transform f•
is a closed proper convex func-
tion for any f with domf = ∅, and f••
= f for a closed proper convex function f.
Hence, the Legendre–Fenchel transformation f → f•
gives a symmetric one-to-one
correspondence in the class of all closed proper convex functions.
As a consequence of Theorem 3.2 and the deﬁnition (3.23), we obtain the
relationships
p ∈ ∂Rf(x) ⇐⇒ x ∈ argminf[−p]
!
f(x) + f•
(p) = p,x
!
x ∈ ∂Rf•
(p) ⇐⇒ p ∈ argminf•
[−x]
(3.30)
for a closed proper convex function f and vectors x,p ∈ Rn
.
The conjugate δS
•
of the indicator function δS of a set S ⊆ Rn
is expressed
as
δS
•
(p) = sup{ p,x | x ∈ S} (p ∈ Rn
), (3.31)
which is the support function of S. The support function of a nonempty set is
a positively homogeneous closed proper convex function, where a function g, in
general, is said to be positively homogeneous if
g(λp) = λg(p) (3.32)
holds for any λ > 0 and p ∈ Rn
(this condition yields g(0) = 0 if domg = ∅).
Theorem 3.2 implies a one-to-one correspondence between closed convex sets and
positively homogeneous closed proper convex functions. In this sense, positively
homogeneous convex functions are convex sets in disguise. For a closed convex
function f and a point x in the relative interior of domf, for example, the directional
derivative f
(x;d) is a positively homogeneous closed proper convex function in d
and it coincides with the support function of the subdiﬀerential ∂Rf(x):
f
(x;d) = (δ∂Rf(x))•
(d). (3.33)
The support function of a convex cone S ⊆ Rn
agrees with the indicator function
of another convex cone,
S∗
= {p ∈ Rn
| p,x ≤ 0 (∀x ∈ S)}, (3.34)
called the polar cone of S. By Theorem 3.2, (S∗
)∗
= S for a closed convex cone S.
When S is represented as
S = {x ∈ Rn
| ak,x ≤ 0 (k = 1,...,m)}, (3.35)sidca00si
2013/2/12
page 83
3.1. Convex Analysis 83
S1
S2
k
p∗
Figure 3.2. Separation for convex sets.
with ak ∈ Rn
(k = 1,...,m), we have
S∗
=
(
p ∈ Rn
)
)
)
)
)
p =
m 
k=1
λkak, λk ∈ R+ (k = 1,...,m)
*
. (3.36)
Note 3.3. A bounded polyhedron can be represented in two diﬀerent ways: as
the convex hull of the vertices (vertex-oriented representation) and as the inter-
section of ﬁnitely many half-spaces described by linear inequalities (face-oriented
representation). Let S be a bounded polyhedron, S0
be the set of its vertices, and
S =
2
k
{x | pk,x ≤ bk}
be a nonredundant representation of S. Then we have bk = δS0
•
(pk). This shows
that the translation between the two representations, S0
←→ {(bk,pk)}, can be
regarded as a special case of the Legendre–Fenchel transformation. In fact we have
already seen this phenomenon in Theorem 1.9, which gives two equivalent character-
izations of base polyhedra, one by exchangeability and the other by submodularity.
The exchangeability (B-EXC[Z]) is for vertices and the submodularity for faces;
ρ(X) in Theorem 1.9 corresponds to bk in the present notation (and χX = pk). Re-
call that we formulated this as the Legendre–Fenchel conjugacy in Theorem 1.10.
The duality principle constitutes the core of convex analysis. It can be stated
in many diﬀerent forms, but we focus here on separation theorems (for sets and for
functions) and the Fenchel duality theorem.
The following is the separation theorem for convex sets (see Fig. 3.2).
Theorem 3.4 (Separation for convex sets). Let S1,S2 ⊆ Rn
be nonempty convex
sets.sidca00si
2013/2/12
page 84
## 84 Chapter 3. Convex Analysis, Linear Programming, and Integrality
-
x
6 Y
Y = f(x)
Y = h(x)
Y = α∗
+ p∗
,x
Figure 3.3. Separation for convex and concave functions.
(1) If S1 ∩ S2 = ∅, there exists a nonzero vector p∗
∈ Rn
such that
inf{ p∗
,x | x ∈ S1} ≥ sup{ p∗
,x | x ∈ S2}. (3.37)
If, in addition, S1 and S2 are closed and at least one of them is bounded, then the
inequality ≥ above can be replaced with strict inequality >.
(2) riS1 ∩ riS2 = ∅ if and only if there exists a vector p∗
∈ Rn
such that (3.37)
holds and
sup{ p∗
,x | x ∈ S1} > inf{ p∗
,x | x ∈ S2}. (3.38)
(3) If S1 is polyhedral, S1 ∩ riS2 = ∅ if and only if there exists p∗
∈ Rn
such that
(3.37) holds and
inf{ p∗
,x | x ∈ S1} > inf{ p∗
,x | x ∈ S2}. (3.39)
Proof. See Theorems 11.3 and 20.2 and Corollary 11.4.2 of Rockafellar [176].
The separation theorem for convex functions, illustrated in Fig. 3.3, asserts
the existence of an aﬃne function that lies between a convex function and a concave
function.
Theorem 3.5 (Separation for convex functions). Let f : Rn
→ R ∪ {+∞} be a
proper convex function and h : Rn
→ R ∪ {−∞} a proper concave function, and
assume that (a1) or (a2) below is satisﬁed:
(a1) ri(domf) ∩ ri(domh) = ∅,
(a2) f and h are polyhedral and domf ∩ domh = ∅.
If f(x) ≥ h(x) (∀x ∈ Rn
), there exist α∗
∈ R and p∗
∈ Rn
such that
f(x) ≥ α∗
+ p∗
,x ≥ h(x) (∀x ∈ Rn
). (3.40)sidca00si
2013/2/12
page 85
3.1. Convex Analysis 85
Proof. The proof is based on Theorem 3.4 applied to epigraphs. See Corollary 5.1.6
in Stoer–Witzgall [194] and the proof of Theorem 31.1 in Rockafellar [176].
Another expression of the duality principle is in the form of the Fenchel duality.
This is a min-max relation between a pair of convex function f and concave function
h and their conjugate functions f•
and h◦
. We include a proof to demonstrate the
equivalence of the Fenchel duality and the separation for functions.
Theorem 3.6 (Fenchel duality). Let f : Rn
→ R ∪ {+∞} be a proper convex
function and h : Rn
→ R ∪ {−∞} a proper concave function, and assume that at
least one of the following four conditions (a1)–(b2) is satisﬁed:
(a1) ri(domf) ∩ ri(domh) = ∅,
(a2) f and h are polyhedral, and domf ∩ domh = ∅,
(b1) f and h are closed37
, and ri(domf•
) ∩ ri(domh◦
) = ∅,
(b2) f and h are polyhedral, and domf•
∩ domh◦
= ∅.
Then it holds that
inf{f(x) − h(x) | x ∈ Rn
} = sup{h◦
(p) − f•
(p) | p ∈ Rn
}. (3.41)
Moreover, if this common value is ﬁnite, the supremum is attained by some p ∈
domf•
∩domh◦
under the assumption of (a1) or (a2), and the inﬁmum is attained
by some x ∈ domf ∩ domh under the assumption of (b1) or (b2).
Proof. By the deﬁnitions (3.26) and (3.28) of the conjugate functions, we have
f•
(p) ≥ p,x − f(x), h◦
(p) ≤ p,x − h(x)
for any x and p. This shows inf ≥ sup in (3.41). Hence (3.41) holds if inf = −∞ or
sup = +∞. In what follows we assume inf > −∞ and sup < +∞.
Suppose that (a1) or (a2) is satisﬁed. Then inf in (3.41) is of ﬁnite value, say,
Δ, and Theorem 3.5 applies to (f − Δ,h) and yields some α∗
∈ R and p∗
∈ Rn
such that
f(x) − Δ ≥ α∗
+ p∗
,x ≥ h(x) (∀x ∈ Rn
).
This means that f•
(p∗
) ≤ −α∗
−Δ and h◦
(p∗
) ≥ −α∗
, implying inf = Δ ≤ h◦
(p∗
)−
f•
(p∗
) ≤ sup and hence (3.41). This also shows that p∗
attains the supremum.
In the remaining case where (b1) or (b2) is satisﬁed, we can use a similar
argument for (f•
,h◦
) on the basis of the identities (f•
)•
= f and (h◦
)◦
= h shown
in Theorem 3.2. In the case (b2) note that the conjugate function of a polyhedral
convex function is again polyhedral.
We note that, if the supremum in (3.41) is attained by p = p∗
, then
argmin(f − h) = argminf[−p∗
] ∩ argmaxh[−p∗
]. (3.42)
37By this we mean that f and −h are closed convex functions.sidca00si
2013/2/12
page 86
## 86 Chapter 3. Convex Analysis, Linear Programming, and Integrality
Example 3.7. The separation theorem and the Fenchel duality theorem are illus-
trated for the convex function
f(x) =
⎧
⎨
⎩
xlogx (x > 0),
0 (x = 0),
+∞ (x < 0)
and the concavefunction h(x) = −f(−x). The graphs of Y = f(x) and Y = h(x) are
tangent to the Y -axis at the origin (0,0), and therefore there exists no separating
aﬃne function, although f(x) ≥ h(x) (∀x). This does not contradict Theorem
3.5, since neither (a1) nor (a2) is satisﬁed. This shows the importance of the
conditions (a1) and (a2) in Theorem 3.5. The conjugate functions are given by
f•
(p) = exp(p − 1) and h◦
(p) = −exp(p − 1), and hence
f(x) − h(x) =

0 (x = 0),
+∞ (x = 0),
h◦
(p) − f•
(p) = −2exp(p − 1).
Therefore, the inﬁmum and the supremum in the Fenchel duality (3.41) are both
equal to 0; the inﬁmum is attained by x = 0, whereas the supremum is not attained.
Note that the condition (b1) in Theorem 3.6 is met.
Example 3.8. The inﬁmum and the supremum in the Fenchel duality (3.41) can
be distinct if none of the conditions (a1)–(b2) in Theorem 3.6 is satisﬁed. For the
convex function f and the concave function h in x = (x(1),x(2)) deﬁned by
f(x) =

0 (x(1) = 0,x(2) ≥ 0),
+∞ (otherwise),
h(x) =
⎧
⎨
⎩
1 (x(1)x(2) ≥ 1,x(1) > 0,x(2) > 0), 3
x(1)x(2) (x(1)x(2) ≤ 1,x(1) ≥ 0,x(2) ≥ 0),
−∞ (otherwise),
we have inf = 0 and sup = −1 in (3.41). Note that domf•
= {p | p(2) ≤ 0} and
domh◦
= {p | p(1) ≥ 0,p(2) ≥ 0}, which shows that ri(domf•
) ∩ ri(domh◦
) = ∅,
the failure of condition (b1) in Theorem 3.6.
The addition (3.19) and the inﬁmal convolution (3.20) are conjugate oper-
ations with respect to the Legendre–Fenchel transformation. For proper convex
functions f1 and f2 we have
(f12f2)•
= f1
•
+ f2
•
, (3.43)
(f1 + f2)•
= f1
•
2f2
•
, (3.44)
where the latter is true under the assumption that ri(domf1) ∩ ri(domf2) = ∅.
## 3.2 Linear Programming
Linear programming is, undoubtedly, the most important subclass of convex opti-
mization problems. Some fundamental facts about duality and integrality in linear
programming are described here.sidca00si
2013/2/12
page 87
3.2. Linear Programming 87
We start with a fundamental fact about linear inequality systems, known as
the Farkas lemma, with a proof based on the separation theorem for convex sets.
Theorem 3.9 (Farkas lemma). For a matrix A and a vector b, the conditions (a)
and (b) below are equivalent:38
(a) Ax = b for some nonnegative x ≥ 0.
(b) y
b ≥ 0 for any y such that y
A ≥ 0
.
Proof. [(a) ⇒ (b)]: It follows from Ax = b, x ≥ 0, and y
A ≥ 0
that y
b =
y
Ax ≥ 0.
[(b) ⇒ (a)]: Let S be the convex cone generated by the column vectors aj
(j = 1,...,n) of A; i.e., S = {
n
j=1 x(j)aj | x(j) ≥ 0}. If (a) fails, then b / ∈ S, which
implies, by the separation theorem for convex sets (Theorem 3.4), that y
aj ≥ 0
(j = 1,...,n) and y
b < 0 for some y.
A linear programming problem is an optimization problem to minimize or max-
imize a linear objective function subject to linear equality/inequality constraints.
Such a problem is also termed a linear program, often abbreviated to LP. Given an
m × n matrix A, an m-dimensional vector b, and an n-dimensional vector c, it is
convenient to consider a pair of LPs:
[Primal problem] [Dual problem]
Minimize c
x Maximize b
y
subject to Ax = b, subject to A
y ≤ c.
x ≥ 0.
(3.45)
The LPs in such a pair are said to be dual to each other. For convenience of
reference, we call the problem on the left the primal problem and the one on the
right the dual problem. We denote the feasible regions of the above problems by
P = {x ∈ Rn
| Ax = b,x ≥ 0}, D = {y ∈ Rm
| A
y ≤ c}.
The linear programming duality is stated in the following theorem.
Theorem 3.10 (LP duality).
(1) [Weak duality] c
x ≥ b
y for any x ∈ P and y ∈ D.
(2) [Strong duality] If P = ∅ or D = ∅, then39
inf{c
x | x ∈ P} = sup{b
y | y ∈ D}. (3.46)
This common value is ﬁnite if and only if both P and D are nonempty, and in
that case, the inﬁmum and the supremum are attained by some x ∈ P and y ∈ D,
respectively.
38Inequality between vectors means componentwise inequality; e.g., x ≥ 0 for x = (x(j))n
j=1
means x(j) ≥ 0 for j = 1,...,n.
39By convention, infx∈P = +∞ if P = ∅ and supy∈D = −∞ if D = ∅.sidca00si
2013/2/12
page 88
## 88 Chapter 3. Convex Analysis, Linear Programming, and Integrality
(3) [Complementarity] Assume x ∈ P and y ∈ D. Then x is optimal in the primal
problem and y is optimal in the dual problem if and only if
x(j) = 0 or (A
y − c)(j) = 0 for each j = 1,...,n, (3.47)
where (A
y − c)(j) denotes the jth component of A
y − c.
Proof. (1) is easy to see. The essence of this theorem lies in (2), which can be
derived from the Farkas lemma. Then (3) follows. See, e.g., Chvátal [24], Dantzig
[36], Schrijver [181], and Vanderbei [206].
Linear programming acquires combinatorial ﬂavor through integrality consid-
erations. An LP described by integer data (an integer matrix A and integer vectors
b and c) may or may not have an integer optimal solution. The major interest in
this context is under which condition an integer optimal solution is guaranteed.
An integer matrix is totally unimodular if every minor is equal to ±1 or 0.
Each entry of a totally unimodular matrix is either ±1 or 0.
Example 3.11. The incidence matrix of a graph is a typical example of a totally
unimodular matrix. Let G = (V,E) be a directed graph with vertex set V and arc
set E, where we assume no self-loops exist. The incidence matrix of G, say, A, is
a matrix such that the row set is indexed by V and the column set by E, and the
(v,a)-entry is given by
(v,a)-entry of A =
⎧
⎨
⎩
+1 (v is the initial vertex of arc a),
−1 (v is the terminal vertex of arc a),
0 (otherwise).
An example of an incidence matrix is (2.12).
Example 3.12. Let V be a ﬁnite set. For a chain C : X1
⊂
= X2
⊂
= ··· ⊂
= Xm of
subsets of V , the incidence matrix of C is an m × |V | matrix C deﬁned by
Cij =

1 (j ∈ Xi)
0 (j / ∈ Xi)
(1 ≤ i ≤ m,j ∈ V ).
Note that the ith row of C is the characteristic vector of Xi. For two chains C1
and
C2
, with incidence matrices C1
and C2
, the matrix A = [C1
C2 ] is totally unimodular.
To prove this, it suﬃces to assume that A is square and to show detA ∈
{0,±1}. Let Ck
: Xk
1
⊂
= Xk
2
⊂
= ··· ⊂
= Xk
mk
(k = 1,2) be the chains and, for k = 1,2,
deﬁne Dk
to be the matrix with the ith row of Ck
replaced with the characteristic
vector of Xk
i \ Xk
i−1 for i = 1,...,mk, where Xk
0 = ∅. Put Ã = [ D1
−D2 ]. Then
detA = ±detÃ by the construction. We also have detÃ ∈ {0,±1}, since Ã, having
at most one entry of 1 and at most one entry of −1 in each column, can be regarded
as a submatrix of the incidence matrix of a graph (see Example 3.11).
The following theorem relates the total unimodularity of the coeﬃcient matrix
to the integrality of optimal solutions of LPs.sidca00si
2013/2/12
page 89
3.2. Linear Programming 89
Theorem 3.13. Let A be a totally unimodular matrix.
(1) If b is integral, the primal LP in (3.45) has an integral optimal solution x ∈ Zn
as long as it has an optimal solution.
(2) If c is integral, the dual LP in (3.45) has an integral optimal solution y ∈ Zm
as long as it has an optimal solution.
Proof. See, e.g., Chvátal [24], Cook–Cunningham–Pulleyblank–Schrijver[26], Korte–
Vygen [115], Lawler [119], and Schrijver [181].
Such a theorem enables us to treat combinatorial problems via linear pro-
gramming. Let us demonstrate this for the weighted bipartite matching problem.
Let G = (V +
,V −
;E) be a bipartite graph with vertex bipartition (V +
,V −
) and arc
set E. A set M of arcs of G is called a matching if each vertex of G is incident to at
most one arc of M and a perfect matching if each vertex of G is incident to exactly
one arc of M. We have |M| = |V +
| = |V −
| for a perfect matching M.
Proposition 3.14. Let G = (V +
,V −
;E) be a bipartite graph with a perfect match-
ing, and let c : V +
× V −
→ R ∪ {+∞} be a (weight or cost) vector such that
c(u,v) < +∞ ⇔ (u,v) ∈ E. Then there exist a vector40
p̂ : V +
∪ V −
→ R and
orderings of vertices V +
= {u1,...,um} and V −
= {v1,...,vm} such that
c(ui,vj) + p̂(ui) − p̂(vj)

= 0 (1 ≤ i = j ≤ m),
≥ 0 (1 ≤ i,j ≤ m).
(3.48)
The set of arcs {(ui,vi) | i = 1,...,m} is a perfect matching of minimum weight,
and, therefore,
Minimum weight of a perfect matching =
m 
i=1
(p̂(vi) − p̂(ui)). (3.49)
Proof. Consider the primal LP in (3.45) in which A is the incidence matrix of G
with arcs directed from V +
to V −
, b is an integer vector deﬁned by
b(v) =

1 (v ∈ V +
),
−1 (v ∈ V −
),
and c is the vector of weights (c(u,v) | (u,v) ∈ E). Since A is totally unimodular
by Example 3.11, the optimal solution x may be chosen, by Theorem 3.13, to
be an integer vector, which, being a {0,1}-vector because of the constraints, can
be interpreted as the incidence vector of an optimal matching. The dual optimal
solution can be identiﬁed with a vector p̂ : V +
∪V −
→ R, and the condition (3.48)
follows from the dual feasibility and the complementarity.
40This p̂ is called a potential or an optimal potential.sidca00si
2013/2/12
page 90
## 90 Chapter 3. Convex Analysis, Linear Programming, and Integrality
## 3.3 Integrality for a Pair of Integral Polyhedra
Discrete duality often boils down to integrality for a pair of integral polyhedra.
In this section we observe some fundamental facts about the intersection and the
Minkowski sum of a pair of integral polyhedra. In so doing we intend to gain a
better understanding of the subtlety in the relationship between the integrality of
polyhedra and the convexity of discrete sets.
A polyhedron is said to be rational if it is described by a ﬁnite system of linear
inequalities with rational coeﬃcients, i.e., if all the coeﬃcients aij and bi in (3.10)
can be chosen to be rational numbers. A rational polyhedron P ⊆ Rn
is an integral
polyhedron if P = P ∩ Zn, i.e., if it coincides with the convex hull (convex closure)
of the integer points contained in it.
Let us say that a discrete set S ⊆ Zn
is hole free if
S = S ∩ Zn
, (3.50)
which means that all the integer points contained in the convex hull of S belong to
S itself. A ﬁnite set of integer points is hole free if and only if it is the set of integer
points in some integral polytope.41
The hole-free property (3.50) seems to be a natural requirement for a discrete
set to be qualiﬁed as being convex. This is indeed compatible with our previous
naive idea of convexity for discrete functions in terms of the extensibility to convex
functions formulated in (1.11). We deﬁne the indicator function δS : Zn
→ {0,+∞}
of a discrete set S by
δS(x) =

0 (x ∈ S),
+∞ (x / ∈ S).
(3.51)
Then a discrete set is hole free if and only if its indicator function is extensible to
a convex function.
We are now interested in the compatibility of the hole-free property with the
Minkowski addition (3.21), which is one of the fundamental operations in convex
analysis. We deﬁne the Minkowski sum S1 +S2 of two discrete sets S1, S2 ⊆ Zn
by
S1 + S2 = {x1 + x2 | x1 ∈ S1,x2 ∈ S2}, (3.52)
which we also call the discrete Minkowski sum or the integral Minkowski sum to
emphasize the discreteness. If the hole-free property can be qualiﬁed as a discrete
version of convexity, this property should be preserved in Minkowski addition. Con-
trary to this optimistic expectation, the Minkowski sum of hole-free sets can have
a hole, as is demonstrated in Example 3.15 below.
Example 3.15. Two sets
S1 = {(0,0),(1,1)}, S2 = {(1,0),(0,1)}
are hole free with S1 = S1 ∩ Z2
and S2 = S2 ∩ Z2
(see Fig. 3.4). Nevertheless, the
discrete Minkowski sum
S1 + S2 = {(1,0),(0,1),(2,1),(1,2)}
41A polytope is a bounded polyhedron.sidca00si
2013/2/12
page 91
3.3. Integrality for a Pair of Integral Polyhedra 91
-
6
0 1 2
2
1
0
S1
-
6
0 1 2
2
1
0
S2
-
6
0 1 2
2
1
0
S1 + S2
Figure 3.4. Nonconvexity in Minkowski sum.
has a hole at (1,1) and, therefore, S1 +S2 = S1 + S2 ∩ Z2
. We observe, in passing,
that
S1 ∩ S2 = {(1/2,1/2)}, S1 ∩ S2 = ∅,
which shows S1 ∩ S2 = S1 ∩ S2.
The above example issues the following warnings to us about the integrality
for a pair of hole-free discrete sets S1 and S2 with Sk = Sk ∩ Zn
(k = 1,2).
1. [S1 + S2 = S1 + S2 ∩ Zn
] is not always true.
2. [S1 ∩ S2 = ∅ ⇒ S1 ∩ S2 = ∅] is not always true.
3. [S1 ∩ S2 = S1 ∩ S2] is not always true.
4. The intersection P1 ∩ P2 of integral polyhedra Pk ⊆ Rn
(k = 1,2) is not
always an integral polyhedron.
The above facts suggest that the hole-free property (3.50) alone is not appro-
priate as the condition of discrete convexity for sets. Some deeper combinatorial
properties are needed.
The ﬁrst two properties above will turn out to be critical in many situations,
and, in fact, they are essentially equivalent to each other.
Proposition 3.16. Suppose that a family F of sets of integer points has the
property
S ∈ F, x ∈ Zn
=⇒ S = S ∩ Zn
, x − S ∈ F, (3.53)
where x − S = {x − y | y ∈ S}. Then conditions (a) and (b) below are equivalent
for F.
(a) ∀S1,S2 ∈ F: S1 ∩ S2 = ∅ =⇒ S1 ∩ S2 = ∅.
(b) ∀S1,S2 ∈ F: S1 + S2 = S1 + S2 ∩ Zn
.
Proof. (a) ⇒ (b): For x ∈ S1 + S2 ∩Zn
we have x ∈ (S1 +S2)∩Zn
by Proposition
3.17 (4) below. Hence S
1 ∩S
2 = ∅ for S
1 = S1 and S
2 = x−S2. By (a), there exists
y ∈ S
1 ∩ S
2. Then y ∈ S1 and ∃z ∈ S2 : y = x − z. Therefore, x ∈ S1 + S2.sidca00si
2013/2/12
page 92
## 92 Chapter 3. Convex Analysis, Linear Programming, and Integrality
(b) ⇒ (a): Suppose S1 ∩ S2 = ∅ and put S
1 = S1 and S
2 = −S2. Then 0 ∈
S
1 + S
2 = S
1 + S
2 (see Proposition 3.17 (4) below). By (b) we obtain 0 ∈ S
1 +S
2,
which is equivalent to S1 ∩ S2 = ∅.
We say that a family F of sets of integer points has convexity in intersection
if (a) above is true and convexity in Minkowski sum if (b) is true. It will be
shown in sections 4.6 and 5.4 that the families of M-convex sets and L-convex sets,
respectively, have these properties.
Finally, we mention basic relations that are always true.
Proposition 3.17. Assume Sk = Sk ∩ Zn
for k = 1,2.
(1) S1 ∩ S2 ⊇ S1 ∩ S2.
(2) S1 ∩ S2 = S1 ∩ S2 ∩ Zn
.
(3) S1 + S2 ⊆ S1 + S2 ∩ Zn
.
(4) S1 + S2 = S1 + S2.
Proof. (1), (2), and (3) are obvious. We prove (4). First, note that S1 + S2 ⊇
S1 + S2, which follows from S1 + S2 ⊇ S1 + S2 and the convexity of S1 + S2. To
show the reverse inclusion, take
x =

i
λiyi +

j
μjzj ∈ S1 + S2,
where λi ≥ 0, i λi = 1, yi ∈ S1, μj ≥ 0, j μj = 1, and zj ∈ S2 (the summations
being ﬁnite sums). With νij = λiμj we obtain
x =

i,j
νij(yi + zj), νij ≥ 0,

i,j
νij = 1,
which shows x ∈ S1 + S2.
## 3.4 Integrally Convex Functions
Integrally convex functions form a fairly general class of discrete convex functions,
for which global optimality is guaranteed by local optimality (in an appropriate
sense). Almost all discrete convex functions treated in this book, including L-convex
and M-convex functions, fall into this category.
For two integer vectors, a,b ∈ (Z∪{±∞})n
, the integer interval [a,b] = [a,b]Z
is deﬁned by
[a,b] = [a,b]Z = {x ∈ Zn
| a(i) ≤ x(i) ≤ b(i) (i = 1,...,n)}, (3.54)
where, if a(i) = −∞, for example, a(i) ≤ x(i) is to be understood as −∞ < x(i).
The restriction of a function f : Zn
→ R ∪ {+∞} to an interval [a,b] is deﬁned as
the function f[a,b] : Zn
→ R ∪ {+∞} given by
f[a,b](x) =

f(x) (x ∈ [a,b]),
+∞ (x / ∈ [a,b]).
(3.55)sidca00si
2013/2/12
page 93
3.4. Integrally Convex Functions 93
Let f : Zn
→ R ∪ {+∞} be a function deﬁned on the integer lattice, where
it is a tacit agreement that the eﬀective domain domZf is nonempty. The convex
closure of f is deﬁned to be a function f : Rn
→ R ∪ {±∞} given by
f(x) = sup
p∈Rn,α∈R
{ p,x + α | p,y + α ≤ f(y) (∀y ∈ Zn
)} (x ∈ Rn
). (3.56)
If this function f coincides with f on integer points, i.e., if
f(x) = f(x) (x ∈ Zn
), (3.57)
we say that f is convex extensible and call f the convex extension of f.42
The
following fact is easy to see.
Proposition 3.18. If a function f : Zn
→ R ∪ {+∞} is convex extensible, then
argminf[−p] is hole free for each p ∈ Rn
. The converse is also true if domZf is
bounded.
A local version of the convex extension of a function f can be deﬁned by
relaxing the requirement in the deﬁnition (3.56) of the convex closure. Instead of
imposing the inequality p,y + α ≤ f(y) for all y ∈ Zn
, we ask for this condition
only for points y ∈ Zn
lying in a neighborhood of x ∈ Rn
.
To be speciﬁc, we deﬁne the integral neighborhood of x ∈ Rn
(see Fig. 3.5) by
N(x) = {y ∈ Zn
| x(i) ≤ y(i) ≤ x(i) (1 ≤ i ≤ n)} (x ∈ Rn
), (3.58)
where, for z ∈ R in general, z denotes the smallest integer not smaller than z
(rounding up to the nearest integer) and z the largest integer not larger than z
(rounding down to the nearest integer). Note an alternative expression
N(x) = {y ∈ Zn
| ||x − y||∞ < 1} (x ∈ Rn
) (3.59)
using the ∞-norm
||z||∞ = max
1≤i≤n
|z(i)| (z ∈ Rn
). (3.60)
With this neighborhood we deﬁne the local convex extension of f by
˜ f(x) = sup
p∈Rn,α∈R
{ p,x + α | p,y + α ≤ f(y) (∀y ∈ N(x))} (x ∈ Rn
). (3.61)
Note the obvious relations
˜ f(x) ≥ f(x) (x ∈ Rn
), ˜ f(x) = f(x) (x ∈ Zn
). (3.62)
We have an alternative expression
˜ f(x) = inf
⎧
⎨
⎩

y∈N(x)
λyf(y)
)
)
)
)
)
)

y∈N(x)
λyy = x,(λy)y∈N(x) ∈ Λ
⎫
⎬
⎭
(x ∈ Rn
), (3.63)
42We say that f is concave extensible if −f is convex extensible and then −(−f) is the concave
extension of f.sidca00si
2013/2/12
page 94
## 94 Chapter 3. Convex Analysis, Linear Programming, and Integrality
x x
Figure 3.5. Integral neighborhood N(x) of x (◦: point of N(x)).
with
Λ =
⎧
⎨
⎩
(λy)y∈N(x)
)
)
)
)
)
)

y∈N(x)
λy = 1,λy ≥ 0 (∀y ∈ N(x))
⎫
⎬
⎭
,
as a consequence of LP duality (Theorem 3.10). In the univariate case (n = 1), the
graph of ˜ f consists of line segments connecting the points {(z,f(z)) | z ∈ Z} in the
natural order.
The local convex extension ˜ f is convex on every unit interval
[z,z + 1]R = {x ∈ Rn
| z(i) ≤ x(i) ≤ z(i) + 1 (1 ≤ i ≤ n)}
with an integral point z ∈ Zn
, but is not necessarily convex in the entire space Rn
.
If ˜ f is convex on Rn
, the function f is said to be integrally convex. Alternatively,
we can deﬁne
f is integrally convex ⇐⇒ ˜ f(x) = f(x) (x ∈ Rn
). (3.64)
In particular, an integrally convex function is convex extensible. A function h is
called integrally concave if −h is integrally convex. Note the following fact.
Proposition 3.19. For a function f : Zn
→ R ∪ {+∞},
f is integrally convex ⇐⇒ f[a,b] is integrally convex for any a,b ∈ Zn
.
Example 3.20. Here is an example of a convex-extensible function that is not
integrally convex. Let f : Z2
→ R be deﬁned by f(x) = |x(1) − 2x(2)| for x =
(x(1),x(2)) ∈ Z2
. Obviously, this function is extensible to a convex function f(x) =
|x(1) − 2x(2)| deﬁned for x = (x(1),x(2)) ∈ R2
. In particular, we have f(1,1/2) =
0. On the other hand, we have ˜ f(1,1/2) = 1 since N(x) = {(1,0),(1,1)} for
x = (1,1/2) and f(1,0) = f(1,1) = 1. Hence f(1,1/2) = ˜ f(1,1/2), which shows
that f is not integrally convex.
The global minimum of an integrally convex function can be characterized
by a local optimality. This is the key property of integrally convex functions that
justiﬁes this notion is as follows.
Theorem 3.21. For an integrally convex function f : Zn
→ R ∪ {+∞} and
x ∈ domZf, we have
f(x) ≤ f(y) (∀y ∈ Zn
) ⇐⇒ f(x) ≤ f(x+χY −χZ) (∀Y,Z ⊆ {1,...,n}). (3.65)sidca00si
2013/2/12
page 95
3.4. Integrally Convex Functions 95
Proof. It suﬃces to show ⇐. Put N1(x) = {y ∈ Rn
| ||y − x||∞ ≤ 1} for
x ∈ domZf. By (3.63) and (3.65) we have f(x) ≤ ˜ f(y) for all y ∈ N1(x). Combining
this with integral convexity (3.64) shows f(x) ≤ f(y) (∀y ∈ N1(x)), the local
minimality of f at x. Since f is convex, x is a global minimizer of f by Theorem
1.1 and, a fortiori, a global minimizer of f.
The following variant of the above theorem will be used later.
Proposition 3.22. Let f : Zn
→ R∪ {+∞} be an integrally convex function such
that f(z + 1) = f(z) for all z ∈ Zn
. For x ∈ domZf we have
f(x) ≤ f(y) (∀y ∈ Zn
) ⇐⇒ f(x) ≤ f(x + χY ) (∀Y ⊆ {1,...,n}). (3.66)
Proof. It suﬃces to show that the latter condition in (3.66) implies f(x) ≤ f(x +
χY − χZ) for any disjoint Y and Z. On putting U = {1,...,n} \ (Y ∪ Z) and
x◦
= x − 1 we have f(x) = f(x◦
) and
f(x + χY − χZ) = f(x◦
+ χU + 2χY ) ≥ 2f

x◦
+
1
2
χU + χY

− f(x◦
).
Here we have f(x◦
+1
2χU +χY ) ≥ f(x◦
), since f(x◦
+1
2χU +χY ) can be represented,
by integral convexity, as a convex combination of f(x◦
+ χW + χY ) with W ⊆ U
and f(x◦
+ χW + χY ) ≥ f(x◦
) for any W ⊆ U by the assumption.
Note 3.23. The optimality criterion in Theorem 3.21 is certainly local, but not
satisfactory from the computational complexity viewpoint. We need O(3n
) function
evaluations to verify the local optimality condition in (3.65).
A function f : Zn
→ R ∪ {+∞} is called a separable convex function if it can
be represented as
f(x) =
n 
i=1
fi(x(i)) (x = (x(i))n
i=1 ∈ Zn
), (3.67)
with univariate discrete convex functions fi ∈ C[Z → R] (i = 1,...,n), where
C[Z → R] = {ϕ : Z → R ∪ {+∞} | domZϕ = ∅,
ϕ(t − 1) + ϕ(t + 1) ≥ 2ϕ(t) (t ∈ Z)} (3.68)
is the set of univariate discrete convex functions. Similarly, we denote by C[Z → Z]
the set of integer-valued univariate discrete convex functions.
Proposition 3.24. The sum of an integrally convex function and a separable
convex function is an integrally convex function.sidca00si
2013/2/12
page 96
## 96 Chapter 3. Convex Analysis, Linear Programming, and Integrality
Proof. Put f(x) = f0(x) + n
i=1 fi(x(i)), where f0 is integrally convex and fi ∈
C[Z → R] for i = 1,...,n. For any (λy) ∈ Λ with y∈N(x) λyy = x, we have

y∈N(x)
λy
n 
i=1
fi(y(i)) =
n 
i=1

y∈N(x)
λyfi(y(i)) =
n 
i=1
˜ fi(x(i)).
It follows from this and (3.63) that
˜ f(x) = ˜ f0(x) +
n 
i=1
˜ fi(x(i)) = f0(x) +
n 
i=1
fi(x(i)),
which shows the convexity of ˜ f.
The following proposition is an immediate corollaryof Proposition 3.24, where,
for p ∈ Rn
, we deﬁne
f[−p](x) = f(x) − p,x (x ∈ Zn
), (3.69)
argminf[−p] = {x ∈ Zn
| f[−p](x) ≤ f[−p](y) (∀y ∈ Zn
)}. (3.70)
Proposition 3.25.
(1) A separable convex function is integrally convex.
(2) f[−p] is integrally convex for integrally convex f and vector p ∈ Rn
.
A set of integer points S ⊆ Zn
is said to be integrally convex if its indicator
function δS is an integrally convex function. This means that a set S is integrally
convex if and only if
x ∈ S =⇒ x ∈ S ∩ N(x) (3.71)
for any x ∈ Rn
. We also have
S is an integrally convex set ⇐⇒ S ∩ N(x) = S ∩ N(x) (∀x ∈ Rn
) (3.72)
(see Fig. 3.6).
An integrally convex set is hole free.
Proposition 3.26. S = S ∩ Zn
for an integrally convex set S.
Proof. This follows from (3.72), since N(x) = {x} for an integer point x.
Note 3.27. The family of integrally convex sets has neither convexity in intersec-
tion nor convexity in Minkowski sum. Example 3.15 shows this.
The integral convexity of a function can be characterized by the integral con-
vexity of the minimizers (Theorem 3.29 below).sidca00si
2013/2/12
page 97
3.4. Integrally Convex Functions 97
Integrally convex Not integrally convex Not integrally convex
Figure 3.6. Concept of integrally convex sets.
Proposition 3.28. Let f : Zn
→ R ∪ {+∞} be an integrally convex function.
(1) domZf is an integrally convex set.
(2) For each p ∈ Rn
, argminf[−p] is an integrally convex set.
Proof. (1) By f = ˜ f and the deﬁnition of ˜ f we have
domf ∩ N(x) = domf ∩ N(x) = dom ˜ f ∩ N(x) = domf ∩ N(x).
Then (3.72) shows the integral convexity of domf.
(2) We assume p = 0 by Proposition 3.25 (2) and use (3.71) for S = argminf.
For x ∈ S we have minf = f(x) = ˜ f(x) and therefore x ∈ S ∩ N(x).
Theorem 3.29. Suppose a function f : Zn
→ R∪{+∞} has a nonempty bounded
eﬀective domain. Then
f is an integrally convex function
⇐⇒ argminf[−p] is an integrally convex set for each p ∈ Rn
.
Proof. The implication ⇒ was shown in Proposition 3.28. For the converse we are
to show ˜ f(x) = f(x) for x ∈ Rn
. If x / ∈ domf, we have ˜ f(x) = f(x) = +∞ by
domf = domf and (3.62). Assume x ∈ domf, and consider a pair of (mutually
dual) LPs:
(P) Maximize p,x + α
subject to p,y + α ≤ f(y) (y ∈ domf), p ∈ Rn
, α ∈ R.
(D) Minimize

y∈domf
λyf(y)
subject to

y∈domf
λyy = x,

y∈domf
λy = 1, λy ≥ 0 (y ∈ domf).
Here (p,α) and (λy | y ∈ domf) are the variables of (P) and (D), respectively.
Problem (P) is obviously feasible, and so is (D) by x ∈ domf. Let (p∗
,α∗
) and
λ∗
= (λ∗
y | y ∈ domf) be optimal solutions of (P) and (D), respectively. Thensidca00si
2013/2/12
page 98
## 98 Chapter 3. Convex Analysis, Linear Programming, and Integrality
(3.56), (3.62), (3.63), and LP duality (Theorem 3.10 (2)) imply
f(x) = p∗
,x + α∗
=

y∈domf
λ∗
yf(y) ≤ ˜ f(x). (3.73)
It remains to show that the inequality here is in fact an equality.
To denote the set of tight constraints at (p∗
,α∗
), we put
S = {y ∈ domf | p∗
,y + α∗
= f(y)} = arg min
y∈domf
f[−p∗
](y).
We have {y ∈ domf | λ∗
y > 0} ⊆ S by the complementarity (Theorem 3.10 (3)).
Hence x ∈ S, and furthermore, x ∈ S ∩ N(x) by the integral convexity of S and
(3.71). Therefore, there exists another optimal solution λ̃ = (λ̃y | y ∈ domf) to
(D) satisfying {y | λ̃y > 0} ⊆ S ∩ N(x). Then, by (3.63), we obtain

y∈domf
λ∗
yf(y) =

y∈domf
λ̃yf(y) =

y∈N(x)
λ̃yf(y) ≥ ˜ f(x),
which shows that the inequality in (3.73) is an equality.
We mention a technical fact to be used in section 8.1.
Proposition 3.30. For an integer-valued integrally convex function f : Zn
→
Z ∪ {+∞} and p ∈ Rn
, we have argminf[−p] = ∅ if inf f[−p] > −∞.
Proof. The proof is not diﬃcult; see Lemma 6.13 in Murota–Shioura [152].
Note 3.31. The intersection of integrally convex sets is not necessarily integrally
convex; e.g., S1 = {(0,0,0),(0,1,1),(1,1,0),(1,2,1)} and S2 = {(0,0,0),(0,1,0),
(1,1,1),(1,2,1)} are integrally convex, but their intersection S1 ∩ S2 = {(0,0,0),
(1,2,1)} is not, since (S1 ∩ S2) ∩ N(x) = ∅ for x = (1/2,1,1/2) ∈ S1 ∩ S2. This
implies also that the sum of integrally convex functions is not necessarily integrally
convex. The discrete separationtheorem (see section 1.2) does not hold for integrally
convex functions; Example 1.5 shows this.
Note 3.32. A function f : Zn
→ R∪{+∞} is said to be a Miller’s discrete convex
function if
min{f(z) | z ∈ N(αx + (1 − α)y)} ≤ αf(x) + (1 − α)f(y) (3.74)
holds for any x,y ∈ domZf and any α ∈ [0,1]R. An integrally convex function
satisﬁes this condition. The optimality criterion (3.65) stated for integrally convex
functions in Theorem 3.21 is in fact valid for Miller’s discrete convex functions.sidca00si
2013/2/12
page 99
3.4. Integrally Convex Functions 99
Bibliographical Notes
The introduction to convex analysis in section 3.1 is kept to the minimum needed
for later developments in this book. For a systematic and comprehensive account,
see Borwein–Lewis [17], Hiriart-Urruty–Lemaréchal [89], Rockafellar [176], Rock-
afellar [177], Rockafellar–Wets [179], and Stoer–Witzgall [194]. In particular, see
Theorems 11.3 and 20.2 and Corollary 11.4.2 of [176] for separation for convex sets
(Theorem 3.4); Corollary 5.1.6 in [194] and the proof of Theorem 31.1 in [176]
for separation for convex functions (Theorem 3.5); and Theorem 31.1 in [176] and
Corollary 5.1.4 in [194] for Fenchel duality (Theorem 3.6). Example 3.8 is taken
from [194].
References on linear programming abound in the literature; see, e.g., Chvátal
[24], Dantzig [36], Schrijver [181], and Vanderbei [206]. Matching is one of the
central topics in graph theory, the standard reference being Lovász–Plummer [125].
Matching is also fundamental in combinatorial optimization; see Cook–Cunningham–
Pulleyblank–Schrijver [26], Du–Pardalos [43], Korte–Vygen [115], Lawler [119], and
Nemhauser–Wolsey [167].
Section 3.3 is a collection of basic facts, as presented in Murota [147]. The
terms convexity in intersection and convexity in Minkowski sum are coined here.
Proposition 3.16 is explicit in Danilov–Koshevoy [32], where a general framework
for convexity in intersection and convexity in Minkowski sum is provided.
The concept of integrally convex functions was introduced by Favati–Tardella
[49], where the eﬀective domains are assumed to be integer intervals. The optimality
criterion (Theorem 3.21) is in [49]. Propositions 3.24 and 3.28 are due to Murota–
Shioura [153], and Theorem 3.29 (implicit in [153]) is taken from Murota [147].
Miller’s discrete convex functions are introduced by Miller [130] along with the
optimality criterion (3.65).sidca00si
2013/2/12
page 101
Chapter 4
M-Convex Sets and
Submodular Set Functions
M-convex sets form a class of well-behaved discrete convex sets. They are deﬁned
in terms of an exchange axiom and correspond one-to-one to integer-valued sub-
modular set functions. An M-convex set is exactly the same as the integer points
contained in the base polyhedron associated with some integral submodular func-
tion. This chapter, accordingly, is a systematic presentation of known results in the
theory of matroids and submodular functions from the viewpoint of discrete convex
analysis.
## 4.1 Deﬁnition
Let V be a ﬁnite set, say, V = {1,...,n}. A nonempty set of integer points B ⊆ ZV
is deﬁned to be an M-convex set if it satisﬁes the following exchange axiom:
(B-EXC[Z]) For x,y ∈ B and u ∈ supp+
(x − y), there exists v ∈
supp−
(x − y) such that x − χu + χv ∈ B and y + χu − χv ∈ B.
Here supp+
(x − y) and supp−
(x − y) are the positive support and the negative
support of x − y deﬁned in (1.19) and χu is the characteristic vector of u ∈ V . We
denote by M0[Z] the set of M-convex sets.
M-convexity thus deﬁned for a set B ⊆ ZV
is equivalent to the M-convexity
of the indicator function δB : ZV
→ {0,+∞} (deﬁned in (3.51)). Namely, B is
an M-convex set satisfying (B-EXC[Z]) if and only if δB is an M-convex function
satisfying (M-EXC[Z]) introduced in section 1.4.2.
Recall that we encountered (B-EXC[Z]) in section 1.3.2 as the exchange prop-
erty that characterizes the sets of integer points associated with a submodular
function (see Theorem 1.9). Hence, an M-convex set is exactly the same as the
set of integer points contained in the base polyhedron deﬁned by an integer-valued
submodular set function.
An immediate consequence of the exchange axiom (B-EXC[Z]) is that an M-
convex set lies on a hyperplane {x ∈ RV
| x(V ) = r} for some r ∈ Z, where we use
101sidca00si
2013/2/12
page 102
## 102 Chapter 4. M-Convex Sets and Submodular Set Functions
the notation
x(X) =

v∈X
x(v) (x ∈ RV
,X ⊆ V ), (4.1)
||x||1 =

v∈V
|x(v)| (x ∈ RV
). (4.2)
Proposition 4.1. For an M-convex set B we have x(V ) = y(V ) for any x,y ∈ B.
Proof. The proof is by induction on ||x − y||1. If ||x − y||1 = 0, we obviously
have x(V ) = y(V ). The case of ||x − y||1 = 1 is excluded by (B-EXC[Z]). If
||x − y||1 ≥ 2, (B-EXC[Z]) implies y
≡ y + χu − χv ∈ B, for which we have
y
(V ) = y(V ), ||x − y
||1 = ||x − y||1 − 2, and also x(V ) = y
(V ) by the induction
hypothesis.
Since an M-convex set lies on a hyperplane {x ∈ RV
| x(V ) = r}, we may
equivalently consider the projection of an M-convex set along an arbitrarily cho-
sen coordinate axis. We call the projection of an M-convex set an M
-convex set.
Whereas M
-convex sets are conceptually equivalent to M-convex sets, the class of
M
-convex sets is strictly larger than that of M-convex sets. The simplest example
of an M
-convex set that is not M-convex is an integer interval [a,b]Z.
We focus on M-convex sets in the development of the theory and deal with
M
-convex sets in section 4.7.
## 4.2 Exchange Axioms
There are a number of equivalent variants of the exchange axiom (B-EXC[Z]).
Whereas (B-EXC[Z]) requires that both x−χu +χv and y +χu −χv belong to B,
(B-EXC+[Z]) below imposes this only on y + χu − χv.
Proposition 4.2. For a set B ⊆ ZV
, (B-EXC[Z]) is equivalent to the following:
(B-EXC+[Z]) For x,y ∈ B and u ∈ supp+
(x − y), there exists v ∈
supp−
(x − y) such that y + χu − χv ∈ B.
Proof. It suﬃces to show (B-EXC+[Z]) ⇒ (B-EXC[Z]). First, it is easy to see that
(B-EXC+[Z]) implies the following:
(B-EXC−loc[Z]) For x,y ∈ B with ||x−y||1 = 4 and v ∈ supp−
(x−y),
there exists u ∈ supp+
(x − y) such that y + χu − χv ∈ B.
To prove the claim by contradiction, we assume that there exists a pair (x,y) for
which (B-EXC[Z]) fails. That is, we assume that the set of such pairs
D = {(x,y) | x,y ∈ B, ∃u∗ ∈ supp+
(x − y),∀v ∈ supp−
(x − y) :
x − χu∗ + χv / ∈ B or y + χu∗ − χv / ∈ B}sidca00si
2013/2/12
page 103
4.3. Submodular Functions and Base Polyhedra 103
is nonempty. Take a pair (x,y) ∈ D with minimum ||x−y||1; we have ||x−y||1 ≥ 4.
Fix u∗ ∈ supp+
(x − y) as above, take any u0 ∈ supp+
(x − y − χu∗ ), and put
X = {v ∈ supp−
(x − y) | x − χu∗ + χv ∈ B},
Y = {v ∈ supp−
(x − y) | y + χu0 − χv ∈ B},
where Y = ∅ by (B-EXC+[Z]). Take any v0 ∈ Y , where we assume v0 ∈ X ∩ Y if
X ∩Y = ∅. Then y
= y +χu0 −χv0 satisﬁes y
∈ B and ||x−y
||1 = ||x−y||1 −2.
We also have (x,y
) ∈ D, as shown below, a contradiction to the choice of (x,y).
It remains to show (x,y
) ∈ D. We have u∗ ∈ supp+
(x−y
) and want to show
v ∈ supp−
(x − y
), x − χu∗ + χv ∈ B =⇒ y
+ χu∗ − χv / ∈ B.
Put y
= y
+ χu∗ − χv = y + χu0 + χu∗ − χv0 − χv. Note that y + χu∗ − χv / ∈ B,
since (x,y) ∈ D and x−χu∗ +χv ∈ B. If X ∩Y = ∅, we have y+χu∗ −χv / ∈ B and
y + χu∗ − χv0 / ∈ B, and therefore, y
/ ∈ B by (B-EXC+[Z]). If X ∩ Y = ∅, we have
y +χu∗ −χv / ∈ B and y +χu0 −χv / ∈ B, and therefore, y
/ ∈ B by (B-EXC−loc[Z]).
In either case we have (x,y
) ∈ D.
We introduce two other variants:
(B-EXCw[Z]) For distinct x,y ∈ B, there exist u ∈ supp+
(x − y) and
v ∈ supp−
(x − y) such that x − χu + χv ∈ B and y + χu − χv ∈ B.
(B-EXC−[Z]) For x,y ∈ B and u ∈ supp+
(x − y), there exists v ∈
supp−
(x − y) such that x − χu + χv ∈ B.
Theorem 4.3. Conditions (B-EXC[Z]), (B-EXCw[Z]), (B-EXC+[Z]), and (B-
EXC−[Z]) are equivalent for a set B ⊆ ZV
.
Proof. The implication (B-EXC[Z]) ⇒ (B-EXCw[Z]) is obvious, and Proposition
4.2 shows (B-EXC[Z]) ⇔ (B-EXC+[Z]). We also have (B-EXC[Z]) ⇔ (B-EXC−[Z]),
since (B-EXC−[Z]) for B is equivalent to (B-EXC+[Z]) for −B, and (B-EXC[Z]) for
B is equivalent to (B-EXC[Z]) for −B. We show (B-EXCw[Z]) ⇒ (B-EXC−[Z]) by
induction on ||x − y||1. Suppose x,y ∈ B and u ∈ supp+
(x − y). By (B-EXCw[Z])
there exist u1 ∈ supp+
(x − y) and v1 ∈ supp−
(x − y) such that x − χu1 + χv1 ∈ B
and y
= y + χu1 − χv1 ∈ B. If u1 = u, we are done. Otherwise (u1 = u), we
have ||x − y
||1 = ||x − y||1 − 2 and, by the induction hypothesis, (B-EXC−[Z])
applies to (x,y
) and u ∈ supp+
(x − y
). Hence, x − χu + χv ∈ B for some
v ∈ supp−
(x − y
) ⊆ supp−
(x − y).
## 4.3 Submodular Functions and Base Polyhedra
We introduce here some fundamental facts about submodular set functions, which
turn out to describe the convex hull of M-convex sets.
Let ρ : 2V
→ R ∪ {±∞} be a set function. Its eﬀective domain, denoted as
domρ, is deﬁned to be the family of subsets at which ρ is ﬁnite; i.e.,
domρ = {X ⊆ V | −∞ < ρ(X) < +∞}. (4.3)sidca00si
2013/2/12
page 104
## 104 Chapter 4. M-Convex Sets and Submodular Set Functions
Throughout this book we assume, for a set function ρ in general, that ρ(∅) = 0,
ρ(V ) is ﬁnite, and either ρ : 2V
→ R ∪ {+∞} or ρ : 2V
→ R ∪ {−∞}.
The Lovász extension43
of a set function ρ is a function ρ̂ : RV
→ R ∪ {±∞}
deﬁned as follows. Given a vector p ∈ RV
, we denote by p̂1 > p̂2 > ··· > p̂m the
distinct values of its components and put
Ui = {v ∈ V | p(v) ≥ p̂i} (i = 1,...,m). (4.4)
Then we have an identity
p =
m−1 
i=1
(p̂i − p̂i+1)χUi + p̂mχUm , (4.5)
which is a representation of p as a linear combination of χUi (i = 1,...,m). The
Lovász extension ρ̂ is the linear interpolation on the basis of this representation.
Namely, ρ̂ is deﬁned by
ρ̂(p) =
m−1 
i=1
(p̂i − p̂i+1)ρ(Ui) + p̂mρ(Um) (p ∈ RV
), (4.6)
with reference to the representation (4.5). The Lovász extension ρ̂ is a positively
homogeneous function that coincides with ρ on {0,1}V
in the sense of
ρ̂(χX) = ρ(X) (X ⊆ V ). (4.7)
Since p̂i − p̂i+1 > 0 (1 ≤ i ≤ m − 1) and ρ(Um) = ρ(V ) is ﬁnite on the right-hand
side of (4.6), we have
p ∈ domρ̂ ⇐⇒ U1,U2,...,Um−1 ∈ domρ. (4.8)
A set function ρ : 2V
→ R ∪ {+∞} is said to be submodular if it satisﬁes
ρ(X) + ρ(Y ) ≥ ρ(X ∪ Y ) + ρ(X ∩ Y ) (X,Y ⊆ V ). (4.9)
We denote by S[R] the set of submodular set functions ρ with ρ(∅) = 0 and ρ(V ) <
+∞ and by S[Z] the set of integer valued such submodular set functions; i.e.,
S[R] = {ρ : 2V
→ R ∪ {+∞} | ρ is submodular,ρ(∅) = 0,ρ(V ) < +∞}, (4.10)
S[Z] = {ρ : 2V
→ Z ∪ {+∞} | ρ is submodular,ρ(∅) = 0,ρ(V ) < +∞}. (4.11)
For ρ ∈ S[R], the eﬀective domain D = domρ forms a ring family (sublattice of the
Boolean lattice 2V
), which means, by deﬁnition, that
X,Y ∈ D =⇒ X ∪ Y,X ∩ Y ∈ D. (4.12)
43The Lovász extension is also called the Choquet integral or the linear extension. Often ρ̂(p)
is deﬁned only for nonnegative p, although it is more convenient for us to deﬁne it over the entire
space RV .sidca00si
2013/2/12
page 105
4.3. Submodular Functions and Base Polyhedra 105
We call a set function μ : 2V
→ R∪{−∞} supermodular if −μ is submodular.
The conditions μ(∅) = 0 and μ(V ) > −∞ are always assumed for a supermodular
function μ (i.e., −μ ∈ S[R]).
For a submodular function ρ ∈ S[R] we consider a polyhedron
B(ρ) = {x ∈ RV
| x(X) ≤ ρ(X) (∀X ⊂ V ),x(V ) = ρ(V )}, (4.13)
the base polyhedron associated with ρ. A point (element) of B(ρ) is called a base
and an extreme point of B(ρ) is an extreme base.
Proposition 4.4. B(ρ) is nonempty for ρ ∈ S[R].
Proof. For simplicity of description we assume that domρ has a maximal chain
of length n = |V |. On suitably indexing the elements of V , V = {v1,v2,...,vn},
we have Vj ≡ {v1,v2,...,vj} ∈ domρ for j = 1,...,n. Deﬁne a vector x ∈ RV
by
x(vj) = ρ(Vj) − ρ(Vj−1) for j = 1,...,n with V0 = ∅. We show x(X) ≤ ρ(X) by
induction on |X|. When |X| = 0, this is obviously true by ρ(∅) = 0. When |X| ≥ 1,
let j be the maximum index such that vj ∈ X. Then we have
ρ(X) ≥ ρ(X ∩ Vj−1) + ρ(X ∪ Vj−1) − ρ(Vj−1)
= ρ(X − vj) + ρ(Vj) − ρ(Vj−1) ≥ x(X − vj) + x(vj) = x(X).
Hence follows B(ρ) = ∅.
The support function of B(ρ) coincides with the Lovász extension of ρ.
Proposition 4.5. For a submodular set function ρ ∈ S[R], we have
sup{ p,x | x ∈ B(ρ)} = ρ̂(p) (p ∈ RV
), (4.14)
where ρ̂ is the Lovász extension (4.6) of ρ.
Proof. For simplicity we assume that domρ has a maximal chain of length n = |V |.
Consider a pair of linear programs (LPs):
(A) Maximize p,x
subject to χX,x ≤ ρ(X) (X ∈ domρ \ {V }),
χV ,x = ρ(V ).
(B) Minimize {yXρ(X) | X ∈ domρ}
subject to {yX | v ∈ X ∈ domρ} = p(v) (v ∈ V ),
yX ≥ 0 (X ∈ domρ \ {V }).
Here x ∈ RV
and y = (yX | X ∈ domρ) are the variables of (A) and (B), respec-
tively, and p ∈ RV
is regarded as a parameter. Note that the equality constraints
in (B) can be written as 
X∈domρ
yXχX = p. (4.15)sidca00si
2013/2/12
page 106
## 106 Chapter 4. M-Convex Sets and Submodular Set Functions
Problem (A) is feasible by B(ρ) = ∅ in Proposition 4.4. By LP duality (The-
orem 3.10 (2)), the optimal value of (A), max(A), is equal to the optimal value of
(B), min(B). Obviously, max(A) is equal to the left-hand side of (4.14). Thus,
LHS of (4.14) = max(A) = min(B). (4.16)
For the feasibility of (B) we have the following statement, where Ui (i =
1,...,m) are the subsets determined from p by (4.4).
Claim 1: (B) is feasible ⇐⇒ Ui ∈ domρ (i = 1,...,m).
(Proof of Claim 1) For the proof of ⇐, take a maximal chain {Vj} of domρ such
that {Ui | i = 1,...,m} ⊆ {Vj | j = 1,...,n}, where we put Vj = {v1,v2,...,vj}
(j = 1,...,n). Then the vector y∗
deﬁned by
y∗
X =
⎧
⎨
⎩
p(vn) (X = V ),
p(vj) − p(vj+1) (X = Vj, 1 ≤ j ≤ n − 1),
0 (otherwise)
(4.17)
is a feasible solution for (B). For the proof of ⇒, take a feasible y that maximizes
Γ = {yX|X|2
| X ∈ domρ}.
Claim 2: C = {X ∈ domρ \ {V } | yX > 0} ∪ {V } forms a chain.
(Proof of Claim 2) For Y,Z ∈ C \{V } with yY ≥ yZ > 0, we have the identity
yY χY + yZχZ = yZχY ∩Z + (yY − yZ)χY + yZχY ∪Z,
where Y ∩ Z,Y ∪ Z ∈ domρ. The maximality of Γ implies that |Y \ Z| = 0 or
|Z \ Y | = 0, since otherwise Γ would be increased by 2yZ|Y \ Z||Z \ Y | when the
feasible solution is modiﬁed according to the above identity. Therefore Y ⊆ Z or
Z ⊆ Y . Thus Claim 2 is proven.
Since C is a chain with X∈C yXχX = p and yX > 0 for X ∈ C \ {V }, the
family C must coincide with {Ui | i = 1,...,m} (cf. (4.5)), and therefore, Ui ∈ domρ
(i = 1,...,m). This completes the proof of Claim 1.
Suppose that (B) is feasible, and let y∗
be deﬁned by (4.17) with reference to
a maximal chain {Vj} of domρ containing {Ui}. Deﬁne another vector x∗
∈ RV
by
x∗
(vj) = ρ(Vj) − ρ(Vj−1) (1 ≤ j ≤ n), (4.18)
with V0 = ∅. The solutions x = x∗
and y = y∗
are feasible in (A) and (B),
respectively, and have the same objective value:
p,x∗
=
n 
j=1
p(vj)[ρ(Vj) − ρ(Vj−1)]
=
n−1 
j=1
[p(vj) − p(vj+1)]ρ(Vj) + p(vn)ρ(V ) =

X
y∗
Xρ(X).
By LP duality (Theorem 3.10 (1)), this shows the optimality of y∗
for (B); hence
X y∗
Xρ(X) = min(B). On the other hand, X y∗
Xρ(X) = ρ̂(p) by (4.6) and
(4.17). Combining these with (4.16) shows (4.14).sidca00si
2013/2/12
page 107
4.3. Submodular Functions and Base Polyhedra 107
In the case of infeasible (B), we have min(B) = +∞ in (4.16), whereas ρ̂(p) =
+∞ by Claim 1 and (4.8). Hence (4.14) follows.
Proposition 4.6. B(ρ) is an integral polyhedron for ρ ∈ S[Z].
Proof. For each p, the optimal base (4.18) is an integer vector for ρ ∈ S[Z].
Note 4.7. A ring family (4.12) typically arises from a graph, and conversely, any
ring family can be represented by a graph. For a directed graph G = (V,A) with
vertex set V and arc set A, we call a subset X of V an ideal if (u,v) ∈ A and u ∈ X
imply v ∈ X. That is, X is an ideal if and only if no arc leaves X. The set of ideals
D = D(G) = {X ⊆ V | (u,v) ∈ A,u ∈ X ⇒ v ∈ X} (4.19)
is a ring family with {∅,V } ⊆ D. Conversely, for a ring family D on a set V , we
consider a directed graph G = (V,A) with
A = A(D) = {(u,v) | u ∈ X ∈ D ⇒ v ∈ X}. (4.20)
Denote by minD the minimum element of D and by maxD the maximum element.
Then D coincides with the family of ideals of G that contain minD and are contained
in maxD. In particular, D = D(G) if {∅,V } ⊆ D. The graph G given by (4.20) is
transitive; i.e., (u,v) ∈ A, (v,w) ∈ A ⇒ (u,w) ∈ A. The constructions (4.19) and
(4.20) establish a one-to-one correspondence between the set of ring families on V
including {∅,V } and the set of transitive directed graphs with vertex set V .
An acyclic graph44
G = (V,A) represents a partial order ( on V deﬁned by
[v ( u ⇔ v is reachable from u by a directed path], and the corresponding ring
family D has the property that a maximal chain of D is of length |V |. In this
particular case, (4.19) reads
D = {X ⊆ V | v ( u,u ∈ X ⇒ v ∈ X}. (4.21)
Thus, we have a one-to-one correspondence between the set of partial orders on V
and the set of ring families on V including {∅,V } and having a maximal chain of
length |V |.
Note 4.8. The minimizers of a submodular set function ρ form a ring family. Let
α denote the minimum of ρ. If ρ(X) = ρ(Y ) = α, we have
2α = ρ(X) + ρ(Y ) ≥ ρ(X ∪ Y ) + ρ(X ∩ Y ) ≥ 2α
by submodularity (4.9). This implies ρ(X ∪ Y ) = ρ(X ∩ Y ) = α. Hence,
X,Y ∈ argminρ =⇒ X ∪ Y,X ∩ Y ∈ argminρ.
44A directed graph is called acyclic if it does not contain directed cycles.sidca00si
2013/2/12
page 108
## 108 Chapter 4. M-Convex Sets and Submodular Set Functions
Note 4.9. For a base x ∈ B(ρ), a subset X ⊆ V is said to be a tight set at x if
x(X) = ρ(X). The family of tight sets at x, denoted by
D(x) = {X ⊆ V | x(X) = ρ(X)}, (4.22)
is a ring family satisfying
X,Y ∈ D(x) =⇒ X ∪ Y,X ∩ Y ∈ D(x). (4.23)
This follows from Note 4.8 applied to ρ(X) − x(X). Note that {∅,V} ⊆ D(x).
Note 4.10. LP (A) in the proof of Proposition 4.5 is the problem of maximizing
the weight of a base x ∈ B(ρ) with respect to a given weight vector p. An optimum
solution is given by (4.18) for an ordering of the elements of V satisfying p(v1) ≥
··· ≥ p(vn), where domρ is assumed to have a maximal chain of length n = |V |.
Often we refer to this fact by saying that the greedy algorithm works for ﬁnding an
optimal base.
Note 4.11. A partial order on V is associated with each extreme base. Assume
that D = domρ has a maximal chain of length n = |V | and denote by ( the partial
order on V associated with D, as in (4.21). A linear order ≤ on V , or an ordering
of elements of V , is said to be an extension of ( if [v ( u ⇒ v ≤ u]. A linear
extension of ( generates an extreme base in (4.18). Conversely, any extreme base
x is generated in this way, but there can be several linear orders that generate x.
We deﬁne a partial order (x on V associated with x by
v (x u ⇐⇒ v ≤ u for every linear order ≤ that generates x.
The partially ordered set P(x) = (V,(x) thus deﬁned corresponds to the family of
tight sets D(x) in the sense of Note 4.7. In particular,
[x(X) = ρ(X)] ⇐⇒ [v (x u,u ∈ X ⇒ v ∈ X].
## 4.4 Polyhedral Description of M-Convex Sets
An M-convex set is hole free (Theorem 4.12 below), which allows us to identify an
M-convex set with its convex hull. The convex hull of an M-convex set is called
an M-convex polyhedron, which is indeed a polyhedron described by a submodular
function (Proposition 4.13 below).
Let us start with the hole-free property of an M-convex set.
Theorem 4.12. B = B ∩ ZV
for an M-convex set B ⊆ ZV
.
Proof. Obviously, B ⊆ B ∩ ZV
. To show the reverse inclusion, take an arbitrary
x ∈ B ∩ ZV
, which can be represented as
x =
m 
i=1
λixi, xi ∈ B, λi > 0 (1 ≤ i ≤ m),
m 
i=1
λi = 1 (4.24)sidca00si
2013/2/12
page 109
4.4. Polyhedral Description of M-Convex Sets 109
with distinct xi (1 ≤ i ≤ m). We may assume that there is a positive integer N
such that Nλi ∈ Z+ (1 ≤ i ≤ m). For a representation of the form (4.24), we deﬁne
Φ =
m 
i=1
λi||xi − x||1 =
m 
i=1
λi

v∈V
|xi(v) − x(v)|,
which is intended to measure the complexity of the representation. The representa-
tion (4.24) with m = 1 means x ∈ B (we are done). If m ≥ 2, there are two distinct
indices j, k and u ∈ V such that xj(u) < x(u) < xk(u). (B-EXC[Z]) shows the exis-
tence of v ∈ supp−
(xk −xj) with x
k = xk −χu +χv ∈ B and x
j = xj +χu −χv ∈ B.
A modiﬁcation of the representation (4.24), according to the following:
if λk ≥ λj : λjxj + λkxk ⇒ λj(x
j + x
k) + (λk − λj)xk,
if λj ≥ λk : λjxj + λkxk ⇒ λk(x
j + x
k) + (λj − λk)xj,
gives another representation of the form (4.24), for which Φ is smaller at least by
2min(λj,λk) (≥ 2/N). The condition Nλi ∈ Z+ is preserved in this modiﬁcation.
The process of modiﬁcation ends with m = 1, showing x ∈ B.
The convex hull of an M-convex set is a polyhedron—the base polyhedron
deﬁned by some submodular set function.
Proposition 4.13. For an M-convex set B, deﬁne ρ : 2V
→ Z ∪ {+∞} by
ρ(X) = sup{x(X) | x ∈ B} (X ⊆ V ). (4.25)
(1) ρ ∈ S[Z].
(2) B = B(ρ).
Proof. (1) First we show the submodularity inequality (4.9) for X and Y with
ρ(X ∪ Y ) and ρ(X ∩ Y ) both ﬁnite. Take y,z ∈ B with ρ(X ∪ Y ) = y(X ∪ Y ) and
ρ(X ∩Y ) = z(X ∩Y ); we choose such (y,z) with ||y−z||1 minimum. Then we have
y(v) = z(v) (v ∈ X ∩ Y ), since, otherwise, ∃u ∈ (X ∩ Y ) ∩ supp+
(z − y) and, by
(B-EXC+[Z]), ∃v ∈ supp−
(z − y) such that y
= y + χu − χv ∈ B, for which we
have y
(X ∪ Y ) ≥ y(X ∪ Y ) and ||y
− z||1 ≤ ||y − z||1 − 2, a contradiction to our
choice of (y,z). Therefore,
ρ(X ∪ Y ) + ρ(X ∩ Y ) = y(X ∪ Y ) + z(X ∩ Y )
= y(X ∪ Y ) + y(X ∩ Y ) = y(X) + y(Y ) ≤ ρ(X) + ρ(Y ),
which shows (4.9).
In the case of ρ(X∪Y )+ρ(X∩Y ) = +∞, we consider a sequence of M-convex
sets Bk = {x ∈ B | −k ≤ x(v) ≤ k (v ∈ V )} and the corresponding ρk ∈ S[Z] for
k = 1,2,.... The submodularity inequality (4.9) follows from
ρ(X) + ρ(Y ) ≥ ρk(X) + ρk(Y ) ≥ ρk(X ∪ Y ) + ρk(X ∩ Y )
by letting k → +∞.sidca00si
2013/2/12
page 110
## 110 Chapter 4. M-Convex Sets and Submodular Set Functions
(2) The inclusion B ⊆ B(ρ) is obvious. For the converse we may assume that
ρ(X) is ﬁnite for all X ⊆ V (by the same argument as in the latter half of the proof
of (1)). Let z ∈ RV
be an extreme point of B(ρ). As we have seen in (4.18), there
is an ordering of the elements of V , say, V = {v1,...,vn}, such that z(Vj) = ρ(Vj)
with Vj = {v1,...,vj} for j = 1,...,n, where n = |V |. For each j = 1,...,n, there
exists xj ∈ B with ρ(Vj) = xj(Vj). By repeated applications of (B-EXC+[Z]), as in
the proof of (1) above, we can show the existence of x̂ ∈ B such that x̂(Vj) = xj(Vj)
for j = 1,...,n. We then have z(Vj) = ρ(Vj) = xj(Vj) = x̂(Vj) for j = 1,...,n,
which means z = x̂ ∈ B. Since any extreme point of B(ρ) is contained in B, we
must have B(ρ) ⊆ B.
The converse of the above proposition is also true.
Proposition 4.14. Let ρ ∈ S[Z] be an integer-valued submodular set function.
(1) B = B(ρ) ∩ ZV
is an M-convex set.
(2) ρ(X) = sup{x(X) | x ∈ B(ρ)} (X ⊆ V ).
Proof. (1) First, B is nonempty by Propositions 4.4 and 4.6. By Proposition 4.2
it suﬃces to show (B-EXC+[Z]). Suppose, to the contrary, that (B-EXC+[Z]) fails
for some x,y ∈ B and some u ∈ supp+
(x−y). For each v ∈ supp−
(x−y), we have
y+χu −χv / ∈ B, which, together with the integrality of ρ, implies the existence of a
tight set Xv ∈ D(y) with u ∈ Xv and v / ∈ Xv. For Z =
4
v∈supp−(x−y) Xv, we have
y(Z) = ρ(Z) by (4.23), whereas x(Z) > y(Z) by u ∈ Z and Z ∩ supp−
(x − y) = ∅.
It then follows that x(Z) > ρ(Z), a contradiction to x ∈ B(ρ).
(2) This follows from (4.14) with p = χX and (4.7). An alternative proof is as
follows. Since ρ(X) ≥ sup{x(X) | x ∈ B(ρ)} is obvious, it suﬃces to establish an
equality here in the case of sup < +∞. Let x̂ ∈ B(ρ) attain the supremum. Then
for each u ∈ X and v ∈ V \ X there exists Xuv ∈ D(x̂) with u ∈ Xuv and v / ∈ Xuv.
Since D(x̂) is a ring family (see (4.23)), we have X =
5
u∈X
4
v∈V \X Xuv ∈ D(x̂),
which means x̂(X) = ρ(X).
Propositions 4.13 and 4.14 together imply a one-to-one correspondence be-
tween the family M0[Z] of M-convex sets and the family S[Z] of integer-valued
submodular set functions. In this sense, the exchange property (B-EXC[Z]) and
the submodularity (4.9) are equivalent.
Theorem 4.15. A set B ⊆ ZV
is M-convex if and only if B = B(ρ) ∩ ZV
for an
integer-valued submodular set function ρ ∈ S[Z]. More speciﬁcally, the mappings
Φ : M0[Z] → S[Z] and Ψ : S[Z] → M0[Z] deﬁned by
Φ : B → ρ in (4.25), Ψ : ρ → B = B(ρ) ∩ ZV
are inverse to each other, establishing a one-to-one correspondence between M0[Z]
and S[Z].
Proof. For B ∈ M0[Z], we have Φ(B) ∈ S[Z] and Ψ ◦ Φ(B) = B ∩ ZV
= B bysidca00si
2013/2/12
page 111
4.5. Submodular Functions as Discrete Convex Functions 111
Proposition 4.13 and Theorem 4.12, respectively. For ρ ∈ S[Z], we have Ψ(ρ) ∈
M0[Z] and Φ ◦ Ψ(ρ) = ρ by Propositions 4.6 and 4.14.
## 4.5 Submodular Functions as Discrete Convex
Functions
We provetwo fundamental theorems connecting submodularity and convexity, which
we have already seen in section 1.3.1.
The Lovász extension ρ̂ of a submodular set function ρ is a convex function,
since, from the expression (4.14), ρ̂ is the support function of the base polyhedron.
The converse is also true.
Theorem 4.16 (Lovász). A set function ρ : 2V
→ R ∪ {+∞} with ρ(∅) = 0 and
ρ(V ) < +∞ is submodular if and only if its Lovász extension, ρ̂ : RV
→ R∪{+∞},
deﬁned in (4.6) is convex; i.e.,
ρ is submodular ⇐⇒ ρ̂ is convex.
Proof. It suﬃces to prove ⇐ only. Since ρ̂ is positively homogeneous, the convexity
of ρ̂ implies
ρ̂(χX) + ρ̂(χY ) ≥ ρ̂(χX + χY ).
This shows the submodularity of ρ, since ρ̂(χX) = ρ(X), ρ̂(χY ) = ρ(Y ), and ρ̂(χX +
χY ) = ρ(X ∪ Y ) + ρ(X ∩ Y ) by (4.7) and (4.6).
The connection of submodularity to convexity is reinforced by the following
discrete separation theorem for a pair of submodular/supermodular set functions.
Theorem 4.17 (Frank’s discrete separation theorem). Let ρ : 2V
→ R ∪ {+∞}
and μ : 2V
→ R ∪ {−∞} be submodular and supermodular functions, respectively,
with ρ(∅) = μ(∅) = 0, ρ(V ) < +∞, and μ(V ) > −∞ (namely, ρ,−μ ∈ S[R]).
If
ρ(X) ≥ μ(X) (∀X ⊆ V ), (4.26)
there exists x∗
∈ RV
such that
ρ(X) ≥ x∗
(X) ≥ μ(X) (∀X ⊆ V ). (4.27)
Moreover, if ρ and μ are integer valued (namely, ρ,−μ ∈ S[Z]), the vector x∗
can
be chosen to be integer valued (namely, x∗
∈ ZV
).
The combinatorial essence of the above theorem lies in the second half, claim-
ing the existence of an integer vector for integer-valued functions, whereas the exis-
tence of a real vector x∗
alone can be proved on the basis of the separation theoremsidca00si
2013/2/12
page 112
## 112 Chapter 4. M-Convex Sets and Submodular Set Functions
in convex analysis and the relationship between submodularity and convexity stated
in Theorem 4.16 (see Note 4.20).
The proof of Theorem 4.17 is based on Edmonds’s intersection theorem below,
which is the most important duality theorem in the theory of submodular functions.
For a submodular set function ρ ∈ S[R], we deﬁne a polyhedron
P(ρ) = {x ∈ RV
| x(X) ≤ ρ(X) (∀X ⊆ V )}, (4.28)
called the submodular polyhedron associated with ρ. Note the relationship
P(ρ) ∩ {x ∈ RV
| x(V ) = ρ(V )} = B(ρ)
to the base polyhedron B(ρ).
Theorem 4.18 (Edmonds’s intersection theorem). Let ρ1,ρ2 : 2V
→ R∪{+∞} be
submodular set functions with ρ1(∅) = ρ2(∅) = 0, ρ1(V ) < +∞, and ρ2(V ) < +∞
(namely, ρ1,ρ2 ∈ S[R]). Then
max{x(V ) | x ∈ P(ρ1) ∩ P(ρ2)} = min{ρ1(X) + ρ2(V \ X) | X ⊆ V }. (4.29)
Moreover, if ρ1 and ρ2 are integer valued (namely, ρ1,ρ2 ∈ S[Z]), the polyhedron
P(ρ1) ∩ P(ρ2) is integral in the sense of
P(ρ1) ∩ P(ρ2) = P(ρ1) ∩ P(ρ2) ∩ ZV (4.30)
and there exists an integer-valued vector x∗
that attains the maximum on the left-
hand side of (4.29).
Proof. Denoting Di = (domρi) \ {∅} (i = 1,2), we consider a pair of LPs:
(A) Maximize p,x
subject to χX,x ≤ ρ1(X) (X ∈ D1),
χX,x ≤ ρ2(X) (X ∈ D2).
(B) Minimize {y1Xρ1(X) | X ∈ D1} + {y2Xρ2(X) | X ∈ D2}
subject to {y1X | v ∈ X ∈ D1} + {y2X | v ∈ X ∈ D2} = p(v) (v ∈ V ),
y1X ≥ 0 (X ∈ D1),
y2X ≥ 0 (X ∈ D2).
Here x ∈ RV
and (yiX | X ∈ Di,i = 1,2) are the variables of (A) and (B),
respectively, and p ∈ RV
is a parameter. Note that the equality constraints in (B)
can be written as 
X∈D1
y1XχX +

X∈D2
y2XχX = p. (4.31)
Problem (A) is feasible. Let p be such that (A) has an optimal solution. Then
Problem (B) also has an optimal solution by LP duality (Theorem 3.10).sidca00si
2013/2/12
page 113
4.5. Submodular Functions as Discrete Convex Functions 113
There exists an optimal solution to (B) such that Ci = {X ∈ Di | yiX > 0}
forms a chain for i = 1,2. To prove this, take an optimal solution that maximizes
Γ =

X∈D1
y1X|X|2
+

X∈D2
y2X|X|2
.
If yiY ≥ yiZ > 0 for some i ∈ {1,2} and Y,Z ∈ Di, we have
yiY χY + yiZχZ = yiZχY ∩Z + (yiY − yiZ)χY + yiZχY ∪Z,
yiY ρi(Y ) + yiZρi(Z) ≥ yiZρi(Y ∩ Z) + (yiY − yiZ)ρi(Y ) + yiZρi(Y ∪ Z),
where the latter is due to the submodularity of ρi. This means that the modiﬁcation
of (yiX) to (y
iX) deﬁned by
y
iX =
⎧
⎪ ⎪ ⎨
⎪ ⎪ ⎩
0 (X = Z),
yiY − yiZ (X = Y ),
yiX + yiZ (X = Y ∪ Z,Y ∩ Z),
yiX (otherwise)
would increase Γ by 2yiZ|Y \ Z||Z \ Y | while maintaining the optimality. By the
maximality of Γ we must have |Y \ Z| = 0 or |Z \ Y | = 0; i.e., Y ⊆ Z or Z ⊆ Y .
Let Ai be the incidence matrix of Ci for i = 1,2. Namely, Ai is a |Ci| × |V |
matrix with rows indexed by Ci and columns by V ; for X ∈ Ci and v ∈ V , the
(X,v)-entry is equal to 1 if v ∈ X and to 0 otherwise. Deﬁne A = [A1
A2
], which
is a totally unimodular matrix, as shown in Example 3.12. The vector ỹ = (yiX |
X ∈ Ci,i = 1,2) of nonzero entries of the optimal solution to (B) is determined as a
solution to ỹ
A = p; see (4.31). By the total unimodularity of A, ỹ can be chosen
to be integral for an integral p.
For p = 1, ỹ is a {0,1}-vector, which implies C1 = {X} and C2 = {V \ X} for
some X ⊆ V . Hence, the optimal value of Problem (B) for p = 1 is equal to the
right-hand side of (4.29). On the other hand, the optimal value of Problem (A) for
p = 1 is obviously equal to the left-hand side of (4.29). Then the identity (4.29)
follows from LP duality (Theorem 3.10 (2)).
It remains to show the integrality (4.30) for ρ1,ρ2 ∈ S[Z]. Deﬁne a vector
ρ̃ = (ρi(X) | X ∈ Ci,i = 1,2). By the complementarity (Theorem 3.10 (3)), a
feasible solution x to (A) is optimal if and only if it satisﬁes Ax = ρ̃. Such an x
can be chosen to be integral by the integrality of ρ̃ and the total unimodularity of
A. The above argument shows that Problem (A) has an integral optimal solution
for any p ∈ ZV
for which (A) has an optimal solution. This implies (4.30).
As an immediate corollary of (4.30) we obtain
B(ρ1) ∩ B(ρ2) = B(ρ1) ∩ B(ρ2) ∩ ZV (4.32)
for ρ1,ρ2 ∈ S[Z], the integrality of the intersection of integral base polyhedra.
We are now in the position to prove Frank’s discrete separation theorem (The-
orem 4.17). Consider Edmonds’s intersection theorem (Theorem 4.18) for
ρ1(X) = ρ(X), ρ2(X) = μ(V ) − μ(V \ X).sidca00si
2013/2/12
page 114
## 114 Chapter 4. M-Convex Sets and Submodular Set Functions
It follows from (4.26) that the minimum on the right-hand side of (4.29) is equal
to μ(V ). Hence, there exists x∗
∈ P(ρ1) ∩ P(ρ2) such that x∗
(V ) = μ(V ). The
condition x∗
∈ P(ρ1) is equivalent to x∗
(X) ≤ ρ(X) (∀X ⊆ V ), and x∗
∈ P(ρ2)
is equivalent to x∗
(V \ X) ≤ ρ2(V \ X) (∀X ⊆ V ), which is equivalent further to
x∗
(X) ≥ μ(X) (∀X ⊆ V ) by x∗
(V ) = μ(V ). Hence, ρ(X) ≥ x∗
(X) ≥ μ(X) for all
X ⊆ V . For integer-valued ρ and μ, we can take an integral x∗
by the integrality
assertion in Theorem 4.18. This completes the proof of Theorem 4.17.
Note 4.19. Discreteness is twofold in Edmonds’s intersection theorem. First,
the minimum on the right-hand side of (4.29) is taken over combinatorial objects,
i.e., subsets of V , independently of whether the submodular functions are integer
valued or not. Second, the maximum can be taken over discrete points in the case
of integer-valued submodular functions. The former is sometimes referred to as the
dual integrality and the latter as the primal integrality.
Note 4.20. The ﬁrst half of the discrete separation theorem (Theorem 4.17) is
derived here from the separation theorem in convex analysis and the relationship
between submodularity and convexity given in Theorem 4.16. Let ρ̂ and μ̂ be the
Lovász extensions of ρ and μ, respectively. We have ρ̂(p) ≥ μ̂(p) (∀p ∈ RV
+) by the
assumption ρ ≥ μ as well as the deﬁnition (4.6) of the Lovász extension. Deﬁne
functions g : RV
→ R ∪ {+∞} and k : RV
→ R ∪ {−∞} by
g(p) =

ρ̂(p) (p ∈ RV
+),
+∞ (otherwise),
k(p) =

μ̂(p) (p ∈ RV
+),
−∞ (otherwise).
Then g is convex and k is concave by Theorem 4.16; these functions are polyhedral,
and domg ∩ domk = ∅ by g(0) = k(0) = 0. The separation theorem in convex
analysis (Theorem 3.5) applies to the pair of g and k, yielding β∗
∈ R and x∗
∈ RV
such that
g(p) ≥ β∗
+ p,x∗
≥ k(p) (∀p ∈ RV
).
This inequality for p = χX (X ⊆ V ) yields the inequality (4.27), where β∗
= 0
follows from g(0) = ρ(∅) = 0 and k(0) = μ(∅) = 0.
4.6 M-Convex Sets as Discrete Convex Sets
We show a number of nice properties of M-convex sets that qualify them as well-
behaved discrete convex sets.
We start with a discrete separation theorem for two M-convex sets.
Theorem 4.21 (Discrete separation for M-convex sets). Let B1 and B2 (⊆ ZV
) be
M-convex sets. If they are disjoint (B1∩B2 = ∅), there exists p∗
∈ {0,1}V
∪{0,−1}V
such that
inf{ p∗
,x | x ∈ B1} − sup{ p∗
,x | x ∈ B2} ≥ 1. (4.33)sidca00si
2013/2/12
page 115
4.6. M-Convex Sets as Discrete Convex Sets 115
Proof. By Theorem 4.15, we have Bi = B(ρi)∩ZV
for some submodular functions
ρi ∈ S[Z] (i = 1,2). If ρ1(V ) = ρ2(V ), we can take p∗
= χV or −χV . Suppose
ρ1(V ) = ρ2(V ). Theorem 4.17 applied to ρ(X) = ρ1(X) and μ(X) = ρ2(V )−ρ2(V \
X) yields
ρ1(V ) = ρ2(V ),B(ρ1) ∩ B(ρ2) ∩ ZV
= ∅ ⇒ ∃X ⊆ V : μ(X) − ρ(X) ≥ 1.
Since B1 ∩ B2 = ∅ by assumption, there exists such an X. Noting
ρ(X) = sup{ χX,x | x ∈ B1}, μ(X) = inf{ χX,x | x ∈ B2},
we see that p∗
= −χX (or p∗
= 1 − χX ∈ {0,1}V
) is a valid choice for (4.33).
The content of Theorem 4.21 consists of two claims. The ﬁrst, explicit in the
statement, is that the separating vector p∗
is so special that p∗
or −p∗
is a {0,1}-
vector. The second, less conspicuous and more subtle, is that B1 ∩B2 = ∅ is implied
by B1 ∩B2 = ∅, since otherwise the inequality (4.33) is impossible. The implication
B1 ∩ B2 = ∅ =⇒ B1 ∩ B2 = ∅ (4.34)
was named convexity in intersection in section 3.3.
The following theorem shows another integralityproperty, strongerthan (4.34),
of the intersection of two M-convex polyhedra.
Theorem 4.22. For M-convex sets B1,B2 ⊆ ZV
we have B1 ∩ B2 = B1 ∩ B2.
Proof. For the representation Bi = B(ρi) ∩ ZV
with ρi ∈ S[Z] (i = 1,2), we have
Bi = B(ρi) (i = 1,2). Then the claim follows from (4.32).
We now turn to the Minkowski sum of M-convex sets. The claim (3) in the
theorem below says that the Minkowski sum of M-convex sets is again an M-convex
set. An important consequence of this is that the family of M-convex sets has the
property of convexity in Minkowski sum considered in section 3.3.
Theorem 4.23.
(1) For submodular set functions ρ1,ρ2 ∈ S[R], we have
B(ρ1) + B(ρ2) = B(ρ1 + ρ2).
(2) For integer-valued submodular set functions ρ1,ρ2 ∈ S[Z], we have
(B(ρ1) ∩ ZV
) + (B(ρ2) ∩ ZV
) = B(ρ1 + ρ2) ∩ ZV
.
(3) For M-convex sets B1,B2 ⊆ ZV
, B1 + B2 is an M-convex set and
B1 + B2 = B1 + B2 ∩ ZV
.sidca00si
2013/2/12
page 116
## 116 Chapter 4. M-Convex Sets and Submodular Set Functions
Proof. (1) The proof of B(ρ1) + B(ρ2) ⊆ B(ρ1 + ρ2) is easy: A vector x ∈
B(ρ1)+B(ρ2) can be decomposed as x = x1 +x2 with xi ∈ B(ρi) (i = 1,2), which
implies x(X) = x1(X)+x2(X) ≤ ρ1(X)+ρ2(X) (equality for X = V ). Conversely,
for x ∈ B(ρ1 +ρ2), we have x(X)−ρ2(X) ≤ ρ1(X), and by the discrete separation
theorem (Theorem 4.17), there exists y ∈ RV
such that x(X) − ρ2(X) ≤ y(X) ≤
ρ1(X), with equality for X = V . For z = x − y, we have y ∈ B(ρ1) and z ∈ B(ρ2).
Hence x = y + z ∈ B(ρ1) + B(ρ2).
(2) This is because the vectors x,y,z above can be taken to be integral.
(3) We can represent Bi = B(ρi) ∩ ZV
with ρi ∈ S[Z] (i = 1,2). Then the
left-hand side of (2) is B1 + B2, whereas for the right-hand side of (2) we have
B(ρ1 + ρ2) = B(ρ1) + B(ρ2) = B1 + B2 = B1 + B2
by (1) and Proposition 3.17 (4). Since ρ1 + ρ2 ∈ S[Z], B1 + B2 = B(ρ1 + ρ2) ∩ ZV
is an M-convex set.
Finally, we show the integral convexity of an M-convex set.
Theorem 4.24. An M-convex set is integrally convex.
Proof. Let B be an M-convex set and H = {x ∈ RV
| x(V ) = r} be the hyperplane
containing it. Theorem 4.22 applied to B1 = B and B2 = N(x) ∩ H with N(x)
deﬁned in (3.58) yields B ∩ N(x) ∩ H = B ∩ N(x) ∩ H. This implies B ∩ N(x) =
B ∩ N(x) since B ∩ H = B, N(x) ∩ H = N(x) ∩ H, and B ∩ H = B. Then the
integral convexity of B follows from (3.72).
Note 4.25. The intersection of two M-convex sets is not necessarily M-convex,
though it is integrally convex (see Theorem 8.31). Such a set is referred to as an
M2-convex set. An example of an M2-convex set that is not M-convex is given by
S = {(0,0,0,0),(1,0,0,−1),(0,1,0,−1),(0,0,1,−1),(1,0,1,−2)},
which is the intersection of two M-convex sets B1 = S ∪ {(0,1,1,−2)} and B2 =
S ∪ {(1,1,0,−2)}. Note that (B-EXC[Z]) fails for S with x = (1,0,1,−2), y =
(0,1,0,−1), and u = 1.
4.7 M
-Convex Sets
In section 4.1 we introduced the concept of M
-convex sets as the projection of M-
convex sets along an arbitrarily chosen coordinate axis. The concepts of M
-convex
sets and M-convex sets are essentially equivalent, since an M-convex set lies on a
hyperplane {x ∈ RV
| x(V ) = r} for some r ∈ Z (Proposition 4.1). All the results
for M-convex sets can be translated for M
-convex sets. Here we state some of these
(nontrivial) translations.
The deﬁnition of an M
-convex set by projection may be stated more formally
as follows. Let 0 denote a new element not in V and put Ṽ = {0} ∪ V . A setsidca00si
2013/2/12
page 117
4.7. M
-Convex Sets 117
Figure 4.1. M
-convex sets.
Q ⊆ ZV
is an M
-convex set if it can be represented as
Q = {x ∈ ZV
| (x0,x) ∈ B} (4.35)
for some M-convex set B ⊆ Z{0}∪V
. It turns out that an M
-convex set Q can be
characterized by an exchange axiom:
(B
-EXC[Z]) For x,y ∈ Q and u ∈ supp+
(x − y),
(i) x − χu ∈ Q and y + χu ∈ Q, or
(ii) there exists v ∈ supp−
(x − y) such that x − χu + χv ∈ Q and
y + χu − χv ∈ Q.
It is required in (B
-EXC[Z]) that at least one of (i) and (ii) be satisﬁed, depending
on a given triple (x,y,u). Examples of M
-convex sets are given in Fig. 4.1.
Whereas M
-convex sets are conceptually equivalent to M-convex sets, the
class of M
-convex sets is strictly larger than that of M-convex sets. This follows
from the implication (B-EXC[Z]) ⇒ (B
-EXC[Z]), as well as from the example of an
integer interval [a,b]Z that is not M-convex but M
-convex. We denote by M
0[Z]
the set of M
-convex sets.
The projection of a base polyhedron is known to coincide with what is called a
generalized polymatroid (or g-polymatroid for short); see Theorem 3.58 of Fujishige
[65]. Hence, an M
-convex set is precisely the set of integer points of an integral
g-polymatroid and the convex hull of an M
-convex set (M
-convex polyhedron) is
represented as
Q(ρ,μ) = {x ∈ RV
| μ(X) ≤ x(X) ≤ ρ(X) (∀X ⊆ V )} (4.36)
for the pair (ρ,μ) of integer-valued submodular function ρ ∈ S[Z] and supermodular
function μ (i.e., −μ ∈ S[Z]) such that
ρ(X) − ρ(X \ Y ) ≥ μ(Y ) − μ(Y \ X) (X,Y ⊆ V ). (4.37)
A set Q ⊆ ZV
satisﬁes (B
-EXC[Z]) if and only if it can be represented as Q =
Q(ρ,μ) ∩ ZV
in this way.
The intersection of two M
-convex sets is called an M
2-convex set. An M
2-
convex set is a projection of an M2-convex set, and the class of M
2-convex sets is
strictly larger than that of M2-convex sets.sidca00si
2013/2/12
page 118
## 118 Chapter 4. M-Convex Sets and Submodular Set Functions
4.8 M-Convex Polyhedra
M-convex polyhedra are deﬁned in section 4.4 as the convex hull of M-convex sets,
and as such, they are necessarily integral polyhedra. The concept of M-convexity,
however, can also be deﬁned for general (nonintegral) polyhedra.
A nonempty polyhedron B ⊆ RV
is deﬁned to be an M-convex polyhedron if
it satisﬁes the following:
(B-EXC[R]) For x,y ∈ B and u ∈ supp+
(x − y), there exist v ∈
supp−
(x−y) and a positive number α0 ∈ R++ such that x−α(χu−χv) ∈
B and y + α(χu − χv) ∈ B for all α ∈ [0,α0]R.
The following weaker exchange axiom:
(B-EXC+[R]) For x,y ∈ B and u ∈ supp+
(x − y), there exist v ∈
supp−
(x−y) and a positive number α0 ∈ R++ such that y+α(χu−χv) ∈
B for all α ∈ [0,α0]R,
is in fact equivalent to (B-EXC[R]). That is,
(B-EXC[R]) ⇐⇒ (B-EXC+[R]) (4.38)
for a nonempty polyhedron B ⊆ RV
(cf. Proposition 4.2).
The one-to-one correspondence of M-convex sets with submodular set func-
tions (Theorem 4.15) is generalized as follows:
B is an M-convex polyhedron ⇐⇒ B = B(ρ) for ρ ∈ S[R], (4.39)
B is an integral M-convex polyhedron ⇐⇒ B = B(ρ) for ρ ∈ S[Z], (4.40)
where an integral M-convex polyhedron means an M-convex polyhedron B such
that B = B ∩ ZV . For an integral M-convex polyhedron B and integer points
x,y ∈ B∩ZV
, we can take α0 = 1 in (B-EXC[R]) by (4.40). An integral polyhedron
B is M-convex if and only if B ∩ ZV
is an M-convex set. We denote by M0[R] the
set of M-convex polyhedra and by M0[Z|R] the set of integral M-convex polyhedra.
The projection of an M-convex polyhedron along a coordinate axis is called
an M
-convex polyhedron, for which we have
Q ⊆ RV
is an M
-convex polyhedron
⇐⇒ Q satisﬁes (B
-EXC[R])
⇐⇒ Q = Q(ρ,μ) for (ρ,μ) with ρ,−μ ∈ S[R] and (4.37), (4.41)
where Q(ρ,μ) is deﬁned in (4.36), and the following exchange axiom:
(B
-EXC[R]) For x,y ∈ Q and u ∈ supp+
(x − y), there exist v ∈
supp−
(x − y) ∪ {0} and a positive number α0 ∈ R++ such that x −
α(χu − χv) ∈ Q and y + α(χu − χv) ∈ Q for all α ∈ [0,α0]R.
We denote by M
0[R] and M
0[Z|R] the sets of M
-convex polyhedra and integral
M
-convex polyhedra, respectively.sidca00si
2013/2/12
page 119
4.8. M-Convex Polyhedra 119
An M-convex cone means a cone that is an M-convex polyhedron. It is char-
acterized as a convex cone spanned by vectors of the form χu − χv (u,v ∈ V ), to
be proved in Note 8.9. That is,
B is an M-convex cone ⇐⇒ B =
⎧
⎨
⎩

(u,v)∈A
cuv(χu − χv)
)
)
)
)
)
)
cuv ≥ 0 ((u,v) ∈ A)
⎫
⎬
⎭
for some A ⊆ V × V , (4.42)
where we may assume that A is transitive; i.e., (u,v) ∈ A, (v,w) ∈ A ⇒ (u,w) ∈ A.
See Theorem 3.26 of Fujishige [65] for the extreme rays of an M-convex cone.
An M-convex polyhedron is characterized as a polyhedron such that the tan-
gent cone at each point is an M-convex cone (by (a) ⇔ (b) in Theorem 6.63).
Combining this with (4.42) yields a characterization of an M-convex polyhedron in
terms of the direction of edges:
B is an M-convex polyhedron
⇐⇒ each edge of B is parallel to χu − χv for some u,v ∈ V . (4.43)
Similarly,
Q is an M
-convex polyhedron
⇐⇒ each edge of Q is parallel to χu − χv for some u,v ∈ V ∪ {0}, (4.44)
where χ0 = 0.
It is noted again that M-convex polyhedra and M
-convex polyhedra are syn-
onyms of base polyhedra and g-polymatroids.
Bibliographical Notes
As remarked already, this chapter is a reorganization of known results in the the-
ory of submodular functions; see Fujishige [65] and Schrijver [183]. The proof of
Theorem 4.12 (hole-free property) is taken from Murota [141]. The equivalence
of exchangeability and submodularity (Theorem 4.15) is well known, but neither
precise statement nor proof can be found in the literature; Theorem 4.15 and the
proof are taken from [141]. The name “Lovász extension” was introduced by Fu-
jishige [63], [65]. Theorem 4.16 (submodularity vs. convexity) is by Lovász [123]
and Theorem 4.17 (discrete separation theorem) by Frank [55]. The intersection
theorem (Theorem 4.18) and the related statements (Theorem 4.22 (convexity in
intersection) and Theorem 4.23 (convexity in Minkowski sum)) are due to Edmonds
[44]. Theorem 4.21 (separation of M-convex sets) is observed in Murota [140]. In-
tegral convexity of M-convex sets (Theorem 4.24) is due to Murota–Shioura [153].
The example in Note 4.25 is an adaptation of Example 3.7 of [153]. The ter-
minology of M
-convex sets as well as that of the exchange axiom (B
-EXC[Z])
is introduced by Murota–Shioura [151]. The concept of g-polymatroids is due to
Frank [57] (see also Frank–Tardos [58]), whereas the characterization as the pro-
jection of base polyhedra is by Fujishige [64]. Proofs of (4.38) and (4.39) can besidca00si
2013/2/12
page 120
## 120 Chapter 4. M-Convex Sets and Submodular Set Functions
found in Murota–Shioura [152]. The characterization (4.43) of base polyhedra by
edges seems to have appeared ﬁrst in Tomizawa [200] (without proof); a proof
can be found in Fujishige–Yang [69] and an alternative proof is given in Note 8.9.
Variants of (4.43) yield other classes of polyhedra with combinatorial structures;
see Danilov–Koshevoy [32], Fujishige–Makino–Takabatake–Kashiwabara [67], and
Kashiwabara–Takabatake [109]. A relaxation (weakening) of the exchange axiom
gives rise to the concept of the jump systems of Bouchet–Cunningham [18]; see also
Lovász [124].sidca00si
2013/2/12
page 121
Chapter 5
L-Convex Sets and
Distance Functions
L-convex sets form another class of well-behaved discrete convex sets. They are
deﬁned in terms of an abstract axiom and correspond one-to-one to integer-valued
distance functions satisfying the triangle inequality. L-convex sets (or their convex
hull) are, in fact, a familiar object in the theory of network ﬂows, though the ter-
minology of L-convexity is not used there. Emphasis here is placed on a systematic
presentation of various properties of L-convex sets from the viewpoint of discrete
convex analysis.
## 5.1 Deﬁnition
A nonempty set of integer points D ⊆ ZV
is deﬁned to be an L-convex set if it
satisﬁes the following two conditions:
(SBS[Z]) p,q ∈ D =⇒ p ∨ q,p ∧ q ∈ D,
(TRS[Z]) p ∈ D =⇒ p ± 1 ∈ D.
We denote by L0[Z] the set of L-convex sets.
L-convexity thus deﬁned for a set D ⊆ ZV
is equivalent to the L-convexity of
the indicator function δD : ZV
→ {0,+∞} of D, deﬁned in (3.51). Namely, D is
an L-convex set, satisfying (SBS[Z]) and (TRS[Z]), if and only if δD is an L-convex
function, satisfying (SBF[Z]) and (TRF[Z]) introduced in section 1.4.1.
Since an L-convex set is homogeneous in the direction of 1 by (TRS[Z]), we
may consider the restriction of an L-convex set to the coordinate plane deﬁned
by p(v0) = 0 for an arbitrary v0 ∈ V . A set derived from an L-convex set by
such a restriction (intersection with a coordinate plane) is called an L
-convex set.
Whereas L
-convex sets are conceptually equivalent to L-convex sets, the class of
L
-convex sets is strictly larger than that of L-convex sets. The simplest example
of an L
-convex set that is not L-convex is an integer interval [a,b]Z.
We focus on L-convex sets in the development of the theory and deal with
L
-convex sets in section 5.5.
121sidca00si
2013/2/12
page 122
## 122 Chapter 5. L-Convex Sets and Distance Functions
## 5.2 Distance Functions and Associated Polyhedra
We introduce here some fundamental facts about distance functions and the asso-
ciated polyhedra, which turn out to be the convex hull of L-convex sets.
By a distance function we mean a function γ : V × V → R ∪ {+∞} such
that γ(v,v) = 0 (∀v ∈ V ), where γ may take negative values and is not necessarily
symmetric (i.e., γ(u,v) = γ(v,u) in general). With a distance function γ we can
associate a directed graph Gγ = (V,Aγ) with vertex set V and arc set
Aγ = {(u,v) | γ(u,v) < +∞}, (5.1)
where γ(u,v) represents the length of arc (u,v). We denote by γ(u,v) the shortest
length of a path from u to v in Gγ. The function γ is well deﬁned if there exists
no negative cycle in Gγ, where a negative cycle means a directed cycle of negative
length.
The triangle inequality
γ(v1,v2) + γ(v2,v3) ≥ γ(v1,v3) (∀v1,v2,v3 ∈ V ) (5.2)
is a natural property for a distance function γ. We denote by T [R] the set of
distance functions satisfying the triangle inequality and by T [Z] the set of integer-
valued such functions. We have γ ∈ T [R] for any distance function γ such that Gγ
contains no negative cycle and γ = γ for γ ∈ T [R].
For a distance function γ, a vector p ∈ RV
is said to be an admissible potential
or a feasible potential if it satisﬁes the system of inequalities
p(v) − p(u) ≤ γ(u,v) (∀u,v ∈ V, u = v). (5.3)
The set of admissible potentials is denoted by
D(γ) = {p ∈ RV
| p(v) − p(u) ≤ γ(u,v) (∀u,v ∈ V, u = v)}. (5.4)
Note that the triangle inequality (5.2) is not assumed here.
The following are fundamental facts well known in network ﬂow theory.
Proposition 5.1. Let γ be a distance function.
(1) D(γ) = ∅ ⇐⇒ no negative cycle exists in graph Gγ.
(2) If D(γ) = ∅, we have
γ(u,v) = sup{p(v) − p(u) | p ∈ D(γ)} (u,v ∈ V ) (5.5)
and D(γ) = D(γ).
(3) For γ ∈ T [R], D(γ) is nonempty and
γ(u,v) = sup{p(v) − p(u) | p ∈ D(γ)} (u,v ∈ V ). (5.6)
(4) D(γ) is an integral polyhedron for an integer-valued γ.sidca00si
2013/2/12
page 123
5.3. Polyhedral Description of L-Convex Sets 123
Proof. For x ∈ RV
we consider a pair of linear programs (LPs):
(P) Minimize

(u,v)∈Aγ
λuvγ(u,v)
subject to

(u,v)∈Aγ
λuv(χv − χu) = x,
λuv ≥ 0 ((u,v) ∈ Aγ).
(D) Maximize p,x
subject to p(v) − p(u) ≤ γ(u,v) ((u,v) ∈ Aγ).
Here λ = (λuv | (u,v) ∈ Aγ) and p are the variables of (P) and (D), respectively. The
coeﬃcient matrix is totally unimodular, being the negative of the incidence matrix
of graph Gγ (see Example 3.11). The set of feasible solutions to (D) coincides with
D(γ).
(1) If (D) is feasible, the sum of the inequalities (5.3) for arcs in a directed
cycle shows the nonnegativity of the cycle. Conversely, if no negative cycle exists,
we can deﬁne p(v) to be the shortest path length from a ﬁxed starting vertex to v
to obtain a feasible solution p to (D) (with an obvious modiﬁcation for vertices v
not reachable from the starting vertex).
(2) In the particular case of x = χv0 −χu0 for distinct u0,v0 ∈ V , the objective
function of (D) is equal to p,x = p(v0) − p(u0), and hence the optimal value of
(D) equals the right-hand side of (5.5) for (u,v) = (u0,v0). By Theorem 3.13, the
optimal solution λ to (P) can be chosen to be an integer vector, which is in fact a
{0,1}-vector. Such an optimal solution to (P) represents a shortest path from u0 to
v0, and therefore, the optimal value of (P) is equal to γ(u0,v0). By the feasibility
of (D), LP duality (Theorem 3.10 (2)) applies to show (5.5). By γ ≥ γ we have
D(γ) ⊇ D(γ). For p ∈ D(γ), adding the inequalities (5.3) for arcs in the shortest
path from u0 to v0 yields p(v0) − p(u0) ≤ γ(u0,v0), which shows D(γ) ⊆ D(γ).
(3) The condition γ ∈ T [R] implies the nonexistence of negative cycles and
γ = γ in (5.5).
(4) By Theorem 3.13, the integrality of D(γ) follows from the total unimod-
ularity of the coeﬃcient matrix.
## 5.3 Polyhedral Description of L-Convex Sets
An L-convex set is hole free (Theorem 5.2 below), which allows us to identify an
L-convex set with its convex hull. The convex hull of an L-convex set is called an
L-convex polyhedron, which is indeed a polyhedron described by a distance function
(Proposition 5.3 below).
Let us start with the hole-free property of an L-convex set.
Theorem 5.2. D = D ∩ ZV
for an L-convex set D ⊆ ZV
.sidca00si
2013/2/12
page 124
## 124 Chapter 5. L-Convex Sets and Distance Functions
Proof. Obviously, D ⊆ D ∩ ZV
. To show the reverse inclusion, take an arbitrary
p ∈ D ∩ ZV
, which can be represented as
p =
m 
i=1
λipi, pi ∈ D, λi > 0 (1 ≤ i ≤ m),
m 
i=1
λi = 1, (5.7)
with distinct pi (1 ≤ i ≤ m). The representation (5.7) with m = 1 means p ∈ D
(we are done). When m ≥ 2, repeated modiﬁcations of (5.7) as
if λk ≥ λj : λjpj + λkpk ⇒ λj[(pj ∨ pk) + (pj ∧ pk)] + (λk − λj)pk
result in another representation of the form (5.7), with p1 ≤ p2 ≤ ··· ≤ pm. Then
we have p1 ≤ p ≤ pm, in particular, and another kind of modiﬁcation is applicable
to (5.7):
if λm ≥ λ1 : λ1p1 + λmpm ⇒ λ1(p
1 + p
m) + (λm − λ1)pm,
if λ1 ≥ λm : λ1p1 + λmpm ⇒ λm(p
1 + p
m) + (λ1 − λm)p1,
where p
1 = p1 +1 and p
m = pm −1. Using these modiﬁcations we eventually arrive
at (5.7) such that p−1 ≤ p1 ≤ p ≤ pm ≤ p+1. Then p1 = p−χX and pm = p+χX
for some X ⊆ V , and hence p = (p1 +1)∧pm ∈ D by (SBS[Z]) and (TRS[Z]).
The convex hull of an L-convex set is a polyhedron described by some distance
function.
Proposition 5.3. For nonempty D ⊆ ZV
, deﬁne γ : V × V → Z ∪ {+∞} by
γ(u,v) = sup{p(v) − p(u) | p ∈ D} (u,v ∈ V ). (5.8)
(1) γ satisﬁes the triangle inequality (5.2); i.e., γ ∈ T [Z].
(2) D = D(γ) if D is an L-convex set.
Proof. (1) γ(v1,v2)+γ(v2,v3) = supp∈D(p(v2)−p(v1))+supp∈D(p(v3)−p(v2)) ≥
supp∈D(p(v3) − p(v1)) = γ(v1,v3).
(2) Obviously, D ⊆ D(γ). By the integrality of D(γ) shown in Proposition 5.1
(4), the converse (⊇) is also true if any q ∈ D(γ)∩ZV
belongs to D. For distinct u
and v, we have γ(u,v) ≥ q(v)−q(u), and, by the deﬁnition of γ and (TRS[Z]), there
exists puv ∈ D such that puv(u) = q(u) and puv(v) ≥ q(v). For pu =
6
v=u puv,
we have pu(u) = q(u) and pu(v) ≥ q(v) (∀v ∈ V ), and also pu ∈ D by (SBS[Z]).
Hence, for p̂ =
7
u∈V pu, we have p̂ = q and also p̂ ∈ D by (SBS[Z]).
A sort of converse of the above proposition is true. Note that the triangle
inequality (5.2) is not assumed in the proposition below.
Proposition 5.4. For an integer-valued distance function γ, D = D(γ)∩ ZV
is an
L-convex set provided that D(γ) is nonempty.sidca00si
2013/2/12
page 125
5.4. L-Convex Sets as Discrete Convex Sets 125
Proof. (TRS[Z]) is obvious. For (SBS[Z]) we can easily show that p(v) − p(u) ≤
γ(u,v) and q(v) − q(u) ≤ γ(u,v) imply (p ∨ q)(v) − (p ∨ q)(u) ≤ γ(u,v) and (p ∧
q)(v) − (p ∧ q)(u) ≤ γ(u,v).
Propositions 5.3 and 5.4 together imply a one-to-one correspondence between
the family L0[Z] of L-convex sets and the family T [Z] of integer-valued distance
functions with the triangle inequality.
Theorem 5.5. A set D ⊆ ZV
is L-convex if and only if D = D(γ) ∩ ZV
for an
integer-valued distance function γ ∈ T [Z] satisfying the triangle inequality. More
speciﬁcally, the mappings Φ : L0[Z] → T [Z] and Ψ : T [Z] → L0[Z] deﬁned by
Φ : D → γ in (5.8), Ψ : γ → D = D(γ) ∩ ZV
are inverse to each other, establishing a one-to-one correspondence between L0[Z]
and T [Z].
Proof. For D ∈ L0[Z] we have Φ(D) ∈ T [Z] and Ψ ◦ Φ(D) = D ∩ ZV
= D
by Proposition 5.3 and Theorem 5.2. For γ ∈ T [Z] we have Ψ(γ) ∈ L0[Z] and
Φ ◦ Ψ(γ) = γ by Propositions 5.4 and 5.1.
Note 5.6. An M-convex polyhedron is described by a submodular set function
(Theorem 4.15), and the correspondence is one-to-one:
M-convex polyhedra ←→ submodular set functions.
An L-convex polyhedron is described by a distance function with the triangle in-
equality (Theorem 5.5), which gives another one-to-one correspondence:
L-convex polyhedra ←→ distance functions with the triangle inequality.
These two one-to-one correspondences will be uniﬁed into a single conjugacy rela-
tionship between M-convex functions and L-convex functions in Chapter 8.
5.4 L-Convex Sets as Discrete Convex Sets
We show a number of nice properties of L-convex sets that qualify them as well-
behaved discrete convex sets.
First we consider the intersection of two L-convex sets. Recall from (5.1) and
(5.4) the deﬁnitions of a graph Gγ and a polyhedron D(γ) associated with a distance
function γ.
Theorem 5.7. Let D1,D2 ⊆ ZV
be L-convex sets.
(1) D1 ∩ D2 = D1 ∩ D2.
On representing Di = D(γi)∩ZV
with γi ∈ T [Z] (i = 1,2) and deﬁning γ12(u,v) =
min(γ1(u,v),γ2(u,v)), we have the following.
(2) D1 ∩ D2 = D(γ12) ∩ ZV
.sidca00si
2013/2/12
page 126
## 126 Chapter 5. L-Convex Sets and Distance Functions
(3) D1 ∩ D2 = ∅ ⇐⇒ no negative cycle exists in graph Gγ12 .
(4) D1 ∩ D2 is an L-convex set if it is nonempty.
Proof. (1), (2) It follows from D(γ1) ∩ D(γ2) = D(γ12) that D1 ∩ D2 = (D(γ1) ∩
ZV
) ∩ (D(γ2) ∩ ZV
) = (D(γ1) ∩ D(γ2)) ∩ ZV
= D(γ12) ∩ ZV
. Since D(γ12) is an
integral polyhedron, we obtain D1 ∩ D2 = D(γ12) = D(γ1) ∩ D(γ2) = D1 ∩ D2.
(3) This is by (2) and Proposition 5.1 (1).
(4) This follows from (2) and Proposition 5.4.
The ﬁrst claim (1) in the above theorem shows
D1 ∩ D2 = ∅ =⇒ D1 ∩ D2 = ∅, (5.9)
the property called convexity in intersection in section 3.3.
Convexity in Minkowski sum is also shared by L-convex sets.
Theorem 5.8. For L-convex sets D1,D2 ⊆ ZV
, we have D1+D2 = D1 + D2 ∩ZV
.
Proof. F = L0[Z] meets the condition (3.53) in Proposition 3.16 and has the
property (a) there by (5.9).
The following discrete separation theorem holds for two L-convex sets.
Theorem 5.9 (Discrete separation for L-convex sets). Let D1 and D2 (⊆ ZV
) be
L-convex sets. If they are disjoint (D1 ∩D2 = ∅), there exists x∗
∈ {−1,0,1}V
such
that
inf{ p,x∗
| p ∈ D1} − sup{ p,x∗
| p ∈ D2} ≥ 1. (5.10)
Proof. We use the notation in Theorem 5.7; in particular, Di = D(γi) ∩ ZV
with
γi ∈ T [Z] (i = 1,2). By Theorem 5.7 (3), there exists in the graph Gγ12 a negative
cycle with respect to arc length γ12 = min(γ1,γ2). Let v0,v1,v2,...,vk−1 be the
sequence of vertices in a negative cycle with the minimum number of vertices,
where k ≥ 2. Since γ1 and γ2 satisfy the triangle inequality, k is even, and we
may assume γ1(v2i,v2i+1) ≤ γ2(v2i,v2i+1) and γ1(v2i+1,v2i+2) ≥ γ2(v2i+1,v2i+2)
for 0 ≤ i ≤ k/2 − 1, where vk = v0. Deﬁne x∗
∈ {−1,0,1}V
by x∗
(v2i) = 1,
x∗
(v2i+1) = −1 (0 ≤ i ≤ k/2 − 1), and x∗
(v) = 0 for other v. It follows from LP
duality (Theorem 3.10 (2)) and the minimality of k that
inf
p∈D1
p,x∗
= −
k/2−1

i=0
γ1(v2i,v2i+1), sup
p∈D2
p,x∗
=
k/2−1

i=0
γ2(v2i+1,v2i+2),
and, therefore,
sup
p∈D2
p,x∗
− inf
p∈D1
p,x∗
=
k/2−1

i=0
γ1(v2i,v2i+1) +
k/2−1

i=0
γ2(v2i+1,v2i+2)sidca00si
2013/2/12
page 127
5.4. L-Convex Sets as Discrete Convex Sets 127
=
k−1 
i=0
γ12(vi,vi+1) ≤ −1.
This shows (5.10).
The content of Theorem 5.9 consists of two claims. The ﬁrst, explicit in the
statement, is that the separating vector x∗
is so special that it is a {0,±1}-vector.
The second, less conspicuous and more subtle, is the implication (5.9), convexity in
intersection, since otherwise the inequality (5.10) is impossible.
Finally, we show the integral convexity of an L-convex set by deriving an
expression of the convex hull of an L-convex set.
For a vector p ∈ RV
, let α1 > α2 > ··· > αm be the distinct values of the
nonzero components of vector a = p − p, and deﬁne
Ui = Ui(p) = {v ∈ V | a(v) ≥ αi} (i = 1,...,m),
where m ≥ 0. Then we have
p =
m−1 
i=0
(αi − αi+1)( p + χUi) + αm( p + χUm) (5.11)
with α0 = 1 and U0 = ∅. This is a representation of p as a convex combination
of p + χUi (i = 0,1,...,m), since αi − αi+1 > 0 (i = 0,1,...,m − 1), αm > 0,
and m−1
i=0 (αi −αi+1)+αm = 1. Note that these points p+χUi (i = 0,1,...,m)
belong to the integral neighborhood N(p) of p deﬁned by (3.58).
The convex hull of an L-convex set can be characterized with reference to the
expression (5.11).
Theorem 5.10. For an L-convex set D ⊆ ZV
, we have
D = {p ∈ RV
| p + χUi(p) ∈ D (i = 0,1,...,m)}. (5.12)
Hence, an L-convex set is integrally convex.
Proof. The expression (5.11) shows the inclusion ⊇ in (5.12). To show the converse,
take p ∈ D and put p0 = p, a = p − p, and qi = p + χUi(p) (i = 0,1,...,m).
In the representation D = D(γ) with an integer-valued distance function γ (by
Theorem 5.5), we have
p(v) − p(u) = [p0(v) − p0(u)] + [a(v) − a(u)] ≤ γ(u,v) (∀u,v ∈ V ).
Since |a(v)−a(u)| < 1, p0(v)−p0(u) ∈ Z, and γ(u,v) ∈ Z, we have p0(v)−p0(u) ≤
γ(u,v) for any u,v, and furthermore p0(v) − p0(u) + 1 ≤ γ(u,v) if a(v) > a(u).
Hence follows
qi(v) − qi(u) = [p0(v) − p0(u)] + [χUi(v) − χUi(u)] ≤ γ(u,v) (∀u,v ∈ V ),sidca00si
2013/2/12
page 128
## 128 Chapter 5. L-Convex Sets and Distance Functions
which shows qi ∈ D(γ), and therefore, qi ∈ D(γ) ∩ ZV
= D. Hence, we have ⊆ in
(5.12). Since qi ∈ N(p) for i = 0,1,...,m, we have p ∈ D ∩ N(p); see (3.71). Thus
D is integrally convex.
Note 5.11. The Minkowski sum of two L-convex sets, to be called an L2-convex
set, is not necessarily L-convex, though it is integrally convex (see Theorem 8.42).
An example of an L2-convex set that is not L-convex is given by
S = {(0,0,0,0),(0,1,1,0),(1,1,0,0),(1,2,1,0)}+ {α1 | α ∈ Z},
which is the Minkowski sum of two L-convex sets D1 = {(0,0,0,0),(1,1,0,0)} +
{α1 | α ∈ Z} and D2 = {(0,0,0,0),(0,1,1,0)}+ {α1 | α ∈ Z}; note that (SBS[Z])
fails for (0,1,1,0) and (1,1,0,0).
5.5 L
-Convex Sets
In section 5.1 we introduced the concept of L
-convex sets as the restriction of L-
convex sets to an arbitrarily chosen coordinate plane. The concepts of L
-convex sets
and L-convex sets are essentially equivalent, since an L-convex set is homogeneous
in the direction of 1 by (TRS[Z]). All the results for L-convex sets can be translated
for L
-convex sets. Here we state some additional results.
The deﬁnition of an L
-convex set by restriction may be stated more formally
as follows. Let 0 denote a new element not in V and put Ṽ = {0} ∪ V . A set
P ⊆ ZV
is an L
-convex set if it can be represented as
P = {p ∈ ZV
| (0,p) ∈ D} (5.13)
for some L-convex set D ⊆ ZṼ
. It turns out that an L
-convex set P can be
characterized by the property
(SBS
[Z]) p,q ∈ P =⇒ (p−α1)∨ q, p∧(q +α1) ∈ P (∀α ∈ Z+)
(see Note 5.12 for the proof). This condition for α = 0 agrees with (SBS[Z]).
Examples of L
-convex sets are given in Fig. 5.1.
Whereas L
-convex sets are conceptually equivalent to L-convex sets, the class
of L
-convex sets is strictly larger than that of L-convex sets. This follows from the
implication [(SBS[Z]) and (TRS[Z])] ⇒ (SBS
[Z]), as well as from the example of
an integer interval [a,b]Z that is not L-convex but L
-convex. We denote by L
0[Z]
the set of L
-convex sets.
For a set P ⊆ ZV
, (SBS
[Z]) above is equivalent to either of the following
conditions:
p,q ∈ P, supp+
(p − q) = ∅ =⇒ p − χX,q + χX ∈ P
with X = argmax
v∈V
{p(v) − q(v)}, (5.14)
p,q ∈ P =⇒

p + q
2

,

p + q
2

∈ P (5.15)sidca00si
2013/2/12
page 129
5.5. L
-Convex Sets 129
Figure 5.1. L
-convex sets.
p
q
p+q
2
p+q
2
q
p
p+q
2
p+q
2
p
q
p+q
2
p+q
2
Figure 5.2. Discrete midpoint convexity.
(see Note 5.12 for the proof). The property (5.15) is called discrete midpoint con-
vexity (see Fig. 5.2), where z and z denote, respectively, the integer vectors
obtained from z ∈ RV
by componentwise round-up and round-down to the nearest
integer. Thus, L
-convex sets can be characterized by one of the three equivalent
conditions (SBS
[Z]), (5.14), and (5.15).
The convex hull of an L
-convex set (called an L
-convex polyhedron) can be
represented as
P(γ,γ̂,γ̌) = {p ∈ RV
| γ̌(v) ≤ p(v) ≤ γ̂(v) (∀v ∈ V ),
p(v) − p(u) ≤ γ(u,v) (∀u,v ∈ V,u = v)}, (5.16)
with an integer-valued distance function γ : V ×V → Z∪{+∞} and integer-valued
functions γ̂ : V → Z∪{+∞} and γ̌ : V → Z∪{−∞}. We may impose an additional
condition on (γ,γ̂,γ̌): the distance function γ̃ on Ṽ = V ∪ {0} deﬁned by
γ̃(u,v) =
⎧
⎨
⎩
γ(u,v) (u,v ∈ V ),
γ̂(v) (u = 0,v ∈ V ),
−γ̌(u) (v = 0,u ∈ V )
(5.17)
(as well as by γ̃(v,v) = 0 (∀v ∈ Ṽ )) satisﬁes the triangle inequality. A set P ⊆ ZV
satisﬁes (SBS
[Z]) if and only if it can be represented as P = P(γ,γ̂,γ̌) ∩ ZV
.
The Minkowski sum of two L
-convex sets is called an L
2-convex set. An L
2-
convex set is a restriction of an L2-convex set, and the class of L
2-convex sets is
strictly larger than that of L2-convex sets.sidca00si
2013/2/12
page 130
## 130 Chapter 5. L-Convex Sets and Distance Functions
Note 5.12. We prove the equivalence among L
-convexity (as induced from L-
convexity by restriction), (SBS
[Z]), (5.14), and (5.15) for P ⊆ ZV
.
[L
-convexity ⇔ (SBS
[Z])]: By (5.13) and (TRS[Z]) we have
(p0,p) ∈ D ⇐⇒ p − p01 ∈ P.
(SBS[Z]) for D is equivalent to the following condition for P:
p − p01,q − q01 ∈ P =⇒ (p ∨ q) − (p0 ∨ q0)1,(p ∧ q) − (p0 ∧ q0)1 ∈ P.
Assuming α = q0 −p0 ≥ 0, put p
= p−p01 and q
= q −q01. Then (p∨ q) −(p0 ∨
q0)1 = (p
− α1) ∨ q
and (p ∧ q) − (p0 ∧ q0)1 = p
∧ (q
+ α1). Hence, the above
condition is equivalent to (SBS
[Z]).
[(SBS
[Z])⇒(5.14)]: For α = maxv∈V {p(v) − q(v)} − 1, we have α ≥ 0, (p −
α1) ∨ q = q + χX, and p ∧ (q + α1) = p − χX. Then (SBS
[Z]) implies (5.14).
[(5.14)⇒(5.15)]: Put p
= p+q
2 and q
= p+q
2 , and deﬁne p
,q
∈ ZV
by
p
(v) =

p
(v) (p(v) ≥ q(v)),
q
(v) (p(v) ≤ q(v)),
q
(v) =

q
(v) (p(v) ≥ q(v)),
p
(v) (p(v) ≤ q(v)).
Note that |p
(v)−q
(v)| ≤ 1 (∀v ∈ V ), supp+
(p
−q
) ⊆ supp+
(p−q), and supp−
(p
−
q
) ⊆ supp−
(p − q). Repeated applications of (5.14) to (p,q) yield p
,q
∈ P, and
an application of (5.14) to (p
,q
) gives p
,q
∈ P.
[(5.15)⇒(SBS
[Z])]: For p,q ∈ P, deﬁne a sequence (q(0)
,q(1)
,...) of integer
points as follows:
q(0)
= q, q(k+1)
=

p + q(k)
2

(k = 0,1,...).
Here, note that q(k)
∈ P (k = 0,1,...). We see that
(i) p(v) − q(k)
(v) ∈ {0,1} =⇒ q(k+1)
(v) = q(k)
(v),
(ii) p(v) − q(k)
(v) ≥ 2
=⇒ p(v) > q(k+1)
(v) = q(k)
(v) + 1
2(p(v) − q(k)
(v)) ≥ q(k)
(v) + 1,
(iii) p(v) − q(k)
(v) ≤ −1
=⇒ p(v) ≤ q(k+1)
(v) = q(k)
(v) − 1
2(q(k)
(v) − p(v)) ≤ q(k)
(v) − 1.
It follows that there exists some positive integer N such that q(k)
= q(N)
for any
integer k ≥ N. Because of (i)–(iii) such a q(N)
is equal to (p−1)∨(p∧q) and hence
we have (p− 1) ∨ (p ∧ q) ∈ P. Replacing p with (p −1) ∨ (p ∧ q) and repeating the
above argument, we also have (p − 2 · 1) ∨ (p ∧ q) ∈ P. Repeating this argument
(or more rigorously by induction), we have (p − α1) ∨ (p ∧ q) ∈ P for α ∈ Z+. In
particular, we have p ∧ q ∈ P. By symmetry we also have (p ∨ q) ∧ (q + α1) ∈ P
for α ∈ Z+ and, in particular, p ∨ q ∈ P. Now, replacing p with p ∨ q in the above
argument from the beginning, we have (p − α1) ∨ q ∈ P for α ∈ Z+. By symmetry
we also have p ∧ (q + α1) ∈ P for α ∈ Z+.sidca00si
2013/2/12
page 131
5.6. L-Convex Polyhedra 131
5.6 L-Convex Polyhedra
L-convex polyhedra are deﬁned in section 5.3 as the convex hull of L-convex sets,
and as such they are necessarily integral polyhedra. The concept of L-convexity,
however, can also be deﬁned for general (nonintegral) polyhedra.
A nonempty polyhedron D ⊆ RV
is deﬁned to be an L-convex polyhedron if
it satisﬁes
(SBS[R]) p,q ∈ D =⇒ p ∨ q,p ∧ q ∈ D,
(TRS[R]) p ∈ D =⇒ p + α1 ∈ D (∀α ∈ R).
By an integral L-convex polyhedron we mean an L-convex polyhedron D such that
D = D ∩ ZV . An integral polyhedron D is L-convex if and only if D ∩ ZV
is an
L-convex set. We denote by L0[R] the set of L-convex polyhedra and by L0[Z|R]
the set of integral L-convex polyhedra.
Let γ be a distance function and assume D(γ) = ∅. Then D(γ) is an L-
convex polyhedron. If, in addition, γ is integer valued, D(γ) is an integral L-convex
polyhedron. The one-to-one correspondence of L-convexsets with distance functions
(Theorem 5.5) is generalized as follows:
D is an L-convex polyhedron ⇐⇒ D = D(γ) for γ ∈ T [R], (5.18)
D is an integral L-convex polyhedron ⇐⇒ D = D(γ) for γ ∈ T [Z]. (5.19)
The restriction of an L-convex polyhedron to a coordinate plane is called an
L
-convex polyhedron. A polyhedron P ⊆ RV
is L
-convex if and only if
(SBS
[R]) p,q ∈ P =⇒ (p−α1)∨q, p∧(q+α1) ∈ P (∀α ∈ R+).
We also have
P ⊆ RV
is an L
-convex polyhedron ⇐⇒ P = P(γ,γ̂,γ̌) (∃γ,γ̂,γ̌), (5.20)
where P(γ,γ̂,γ̌) is deﬁned in (5.16) and γ̃ in (5.17) belongs to T [R]. We denote by
L
0[R] and L
0[Z|R] the sets of L
-convex polyhedra and integral L
-convex polyhe-
dra, respectively.
An L-convex cone means a cone that is an L-convex polyhedron. We have
D is an L-convex cone ⇐⇒ D =
(

X∈D
cXχX
)
)
)
)
)
cX ≥ 0 (X ∈ D \ {V })
*
for some ring family D ⊆ 2V
with V ∈ D, (5.21)
as is proved in Note 8.10. An L-convex polyhedron is characterized as a polyhedron
such that the tangent cone at each point is an L-convex cone (by (a) ⇔ (b) in
Theorem 7.45).
Bibliographical Notes
The concept of L-convex sets was introduced by Murota [140] and that of L
-convex
sets by Fujishige–Murota [68]. The polyhedron D(γ) associated with a distancesidca00si
2013/2/12
page 132
## 132 Chapter 5. L-Convex Sets and Distance Functions
function is a well-studied object, appearing, e.g., in the dual of the trans-shipment
problem. In particular, (5.5) is known as the maximum-separation minimum-route
theorem (Theorem 21.1 of Iri [94]) or as the max tension min path theorem (sec-
tion 6C of Rockafellar [178]). Theorem 5.5 (the description of L-convex sets by
D(γ)) and Theorem 5.9 (separation of L-convex sets) are due to Murota [140].
Theorem 5.2 (hole-free property), Theorem 5.7 (convexity in intersection), and The-
orem 5.8 (convexity in Minkowski sum) are by Murota [141]. Integral convexity of
L-convex sets (Theorem 5.10) is due to Murota–Shioura [153]. The example in Note
5.11 is an adaptation of Example 3.11 of [153]. Nonintegral L-convex polyhedra in
section 5.6 are considered in Murota–Shioura [152].sidca00si
2013/2/12
page 133
Chapter 6
M-Convex Functions
M-convex functions form a class of well-behaved discrete convex functions. They are
deﬁned in terms of an exchange axiom and are characterized as functions obtained
by piecing together M-convex sets in a consistent way or as collections of distance
functions with some consistency. Fundamental properties of M-convex functions
are established in this chapter, including the local optimality criterion for global
optimality, the proximity theorem for minimizers, integral convexity, and extensi-
bility to convex functions. Duality and conjugacy issues are treated in Chapter 8
and algorithms in Chapter 10.
6.1 M-Convex Functions and M
-Convex Functions
We recall the deﬁnitions of M-convex functions and M
-convex functions from sec-
tion 1.4.2.
A function f : ZV
→ R ∪ {+∞} with domf = ∅ is said to be an M-convex
function if it satisﬁes the following exchange axiom:
(M-EXC[Z]) For x,y ∈ domf and u ∈ supp+
(x − y), there exists
v ∈ supp−
(x − y) such that
f(x) + f(y) ≥ f(x − χu + χv) + f(y + χu − χv). (6.1)
Inequality (6.1) implicitly imposes the condition that x − χu + χv ∈ domf and
y + χu − χv ∈ domf. With the use of the notation
Δf(z;v,u) = f(z + χv − χu) − f(z) (z ∈ domf;u,v ∈ V ), (6.2)
the exchange axiom (M-EXC[Z]) can be expressed alternatively as follows:
(M-EXC
[Z]) For x,y ∈ domf,
max
u∈supp+(x−y)
min
v∈supp−(x−y)
[Δf(x;v,u) + Δf(y;u,v)] ≤ 0, (6.3)
133sidca00si
2013/2/12
page 134
## 134 Chapter 6. M-Convex Functions
where the maximum and the minimum over an empty set are −∞ and +∞, respec-
tively. We denote by M[Z → R] the set of M-convex functions and by M[Z → Z]
the set of integer-valued M-convex functions.
Proposition 6.1. The eﬀective domain of an M-convex function is an M-convex
set. Therefore, it lies on a hyperplane {x ∈ RV
| x(V ) = r} for some integer r.
Proof. It follows from (M-EXC[Z]) that B = domf satisﬁes (B-EXC[Z]). Then
the latter half follows from Proposition 4.1.
Since the eﬀective domain of an M-convex function f lies on a hyperplane, we
may consider, instead of the function f in n = |V | variables, the projection f
of
f along an arbitrarily chosen coordinate axis u0 ∈ V , where the projection f
is a
function in n − 1 variables deﬁned by
f
(x
) = f(x0,x
) for x0 = r − x
(V 
)
with the notation V 
= V \ {u0} and (x0,x
) ∈ Z × ZV 
. A function derived from
an M-convex function by such a projection is called an M
-convex function.
More formally, let 0 denote a new element not in V , and put Ṽ = {0}∪ V . A
function f : ZV
→ R∪{+∞} is called M
-convex if the function ˜ f : ZṼ → R∪{+∞}
deﬁned by
˜ f(x0,x) =

f(x) if x0 = −x(V )
+∞ otherwise
(x0 ∈ Z,x ∈ ZV
) (6.4)
is an M-convex function. We denote by M
[Z → R] the set of M
-convex functions
and by M
[Z → Z] the set of integer-valued M
-convex functions.
To characterize M
-convex functions we introduce another exchange axiom:
(M
-EXC[Z]) For x,y ∈ domf and u ∈ supp+
(x − y),
f(x) + f(y) ≥ min

f(x − χu) + f(y + χu),
min
v∈supp−(x−y)
{f(x − χu + χv) + f(y + χu − χv)}

. (6.5)
An alternative form of (M
-EXC[Z]) using the notation (6.2) is as follows:
(M
-EXC
[Z]) For x,y ∈ domf,
max
u∈supp+(x−y)
min
v∈supp−(x−y)∪{0}
[Δf(x;v,u) + Δf(y;u,v)] ≤ 0, (6.6)
where, by convention, χ0 is the zero vector, and
Δf(x;0,u) = f(x − χu) − f(x), Δf(y;u,0) = f(y + χu) − f(y).sidca00si
2013/2/12
page 135
6.2. Local Exchange Axiom 135
Theorem 6.2. For a function f : ZV
→ R ∪ {+∞} with domf = ∅, we have
f is M
-convex ⇐⇒ f satisﬁes (M
-EXC[Z]).
Proof. (M-EXC[Z]) for ˜ f in (6.4) is translated to conditions on f as follows:
x(V ) > y(V ) ⇒ max
u∈S+
min
v∈S−∪{0}
[Δf(x;v,u) + Δf(y;u,v)] ≤ 0, (6.7)
x(V ) = y(V ) ⇒ max
u∈S+
min
v∈S−
[Δf(x;v,u) + Δf(y;u,v)] ≤ 0, (6.8)
x(V ) < y(V ) ⇒ max
u∈S+∪{0}
min
v∈S−
[Δf(x;v,u) + Δf(y;u,v)] ≤ 0, (6.9)
where S+
= supp+
(x−y) and S−
= supp−
(x−y). As is easily seen, these conditions
imply (6.5). The converse is shown in Note 6.6 in section 6.2.
M
-convex functions are conceptually equivalent to M-convex functions, but
the class of M
-convex functions is larger than that of M-convex functions.
Theorem 6.3. An M-convex function is M
-convex. Conversely, an M
-convex
function is M-convex if and only if the eﬀective domain is contained in {x ∈ ZV
|
x(V ) = r} for some r ∈ Z.
Proof. The ﬁrst half follows from the obvious implication (M-EXC[Z])⇒(M
-
EXC[Z]) and Theorem 6.2. The second half is from the equivalence of (M-EXC[Z])
and (M
-EXC[Z]) under the condition on the eﬀective domain.
For ease of reference we summarize the relationship between M and M
as
Mn ⊂ M
n ≃ Mn+1, (6.10)
where Mn and M
n denote, respectively, the sets of M-convex functions and M
-
convex functions in n variables, and the expression M
n ≃ Mn+1 means a correspon-
dence of their elements (functions) up to a translation of the eﬀective domain along
a coordinate axis, where (6.4) gives the correspondence under the normalization of
r = 0.
By the equivalence between M-convex functions and M
-convex functions, all
theorems stated for M-convex functions can be rephrased for M
-convex functions,
and vice versa. In this book we primarily work with M-convex functions, making
explicit statements for M
-convex functions when appropriate.
## 6.2 Local Exchange Axiom
There are a number of axioms equivalent to (M-EXC[Z]). We consider here a local
exchange axiom:
(M-EXCloc[Z]) For x,y ∈ domf with ||x − y||1 = 4, there exist u ∈
supp+
(x − y) and v ∈ supp−
(x − y) such that (6.1) holds true.sidca00si
2013/2/12
page 136
## 136 Chapter 6. M-Convex Functions
On expressing y = x− χu1 −χu2 +χv1 + χv2 with u1,u2,v1,v2 ∈ V and {u1,u2}∩
{v1,v2} = ∅, we see that (M-EXCloc[Z]) is written as
f(x − χu1 − χu2 + χv1 + χv2 ) − f(x)
≥ min[Δf(x;v1,u1) + Δf(x;v2,u2), Δf(x;v2,u1) + Δf(x;v1,u2)]. (6.11)
Theorem 6.4. If domf is an M-convex set, then (M-EXC[Z]) ⇐⇒ (M-EXCloc[Z]).
Proof. It suﬃces to show that (M-EXCloc[Z]) ⇒ (M-EXC[Z]). To prove this by
contradiction, we assume that there exists a pair (x,y) for which (M-EXC[Z]) fails.
That is, we assume the set of such pairs
D = {(x,y) | x,y ∈ B, ∃u∗ ∈ supp+
(x − y),∀v ∈ supp−
(x − y) :
Δf(x;v,u∗) + Δf(y;u∗,v) > 0}
is nonempty, where B = domf. Take a pair (x,y) ∈ D with minimum ||x − y||1,
where ||x−y||1 > 4 by (M-EXCloc[Z]), and ﬁx u∗ ∈ supp+
(x−y) appearing in the
deﬁnition of D. For a ﬁxed ε > 0, deﬁne p : V → R by
p(v) =
⎧
⎪ ⎪ ⎨
⎪ ⎪ ⎩
Δf(x;v,u∗) (v ∈ supp−
(x − y), x − χu∗ + χv ∈ B),
−Δf(y;u∗,v) + ε (v ∈ supp−
(x − y), x − χu∗ + χv / ∈ B,
y + χu∗ − χv ∈ B),
0 (otherwise).
We use the notation
Δfp(z;v,u) = Δf(z;v,u) + p(u) − p(v) (z ∈ B,u,v ∈ V ).
Claim 1:
Δfp(x;v,u∗) = 0 (v ∈ supp−
(x − y),x − χu∗ + χv ∈ B), (6.12)
Δfp(y;u∗,v) > 0 (v ∈ supp−
(x − y)). (6.13)
(Proof of Claim 1) The equality (6.12) is obvious from the deﬁnition of p, and
(6.13) can be seen as follows. If x−χu∗ +χv ∈ B, (6.13) follows from Δfp(x;v,u∗) =
0 (by (6.12)) and
Δfp(x;v,u∗) + Δfp(y;u∗,v) = Δf(x;v,u∗) + Δf(y;u∗,v) > 0
(by the deﬁnition of u∗). If x − χu∗ + χv / ∈ B, (6.13) follows from the fact that
Δfp(y;u∗,v) = ε or +∞ depending on whether y + χu∗ − χv ∈ B or not.
Claim 2: There exist u0 ∈ supp+
(x − y) and v0 ∈ supp−
(x − y) such that
y + χu0 − χv0 ∈ B, u∗ ∈ supp+
(x − (y + χu0 − χv0 )), and
Δfp(y;u0,v0) ≤ Δfp(y;u0,v) (v ∈ supp−
(x − y)). (6.14)sidca00si
2013/2/12
page 137
6.2. Local Exchange Axiom 137
(Proof of Claim 2) Put u0 = u∗ if x(u∗) ≥ y(u∗) + 2; otherwise, take any
u0 ∈ supp+
(x−y)\{u∗}, which is possible by ||x−y||1 > 4. By (B-EXC[Z]) there
exists v ∈ supp−
(x−y) such that y+χu0 −χv ∈ B. Let v0 ∈ supp−
(x−y) be such
a v that minimizes Δfp(y;u0,v). Then we have (6.14).
Claim 3: (x,y
) ∈ D for y
= y + χu0 − χv0.
(Proof of Claim 3) It suﬃces to show
Δfp(x;v,u∗) + Δfp(y
;u∗,v) > 0 (v ∈ supp−
(x − y
)). (6.15)
We may assume x − χu∗ + χv ∈ B, since otherwise Δfp(x;v,u∗) = +∞. Then
Δfp(x;v,u∗) = 0 by (6.12) and
Δfp(y
;u∗,v)
= f[−p](y + χu0 + χu∗ − χv0 − χv) − f[−p](y + χu0 − χv0 )
≥ min[Δfp(y;u0,v0) + Δfp(y;u∗,v),Δfp(y;u0,v) + Δfp(y;u∗,v0)]
−Δfp(y;u0,v0)
> min[Δfp(y;u0,v0),Δfp(y;u0,v)] − Δfp(y;u0,v0) = 0
by (M-EXCloc[Z]), (6.13), and (6.14). This establishes Claim 3.
Since ||x−y
|| = ||x−y||−2, Claim 3 is a contradiction to the choice of (x,y).
Therefore, D must be an empty set.
As a corollary to Theorem 6.4 we see that (M-EXC[Z]) is equivalent to a weak
exchange axiom:
(M-EXCw[Z]) For distinct x,y ∈ domf, there exist u ∈ supp+
(x − y)
and v ∈ supp−
(x − y) such that (6.1) holds true.
Note the diﬀerence in the two axioms: “∀u, ∃v” in (M-EXC[Z]) and “∃u, ∃v” in
(M-EXCw[Z]).
Theorem 6.5. (M-EXC[Z]) ⇐⇒ (M-EXCw[Z]).
Proof. It suﬃces to show ⇐ when domf = ∅. (M-EXCw[Z]) for f implies (B-
EXCw[Z]) for domf, and therefore, domf is an M-convex set by Theorem 4.3.
Then Theorem 6.4 establishes the claim.
Note 6.6. The proof of Theorem 6.2 is completed here. It remains to show that
(M
-EXC[Z]) for f implies (M-EXC[Z]) for ˜ f deﬁned by (6.4). First, dom ˜ f is an
M-convex set, since (M
-EXC[Z]) for f implies (B
-EXC[Z]) for domf and domf
is the projection of dom ˜ f (see section 4.7 and (4.35) in particular). By Theorem
6.4, (M-EXC[Z]) is equivalent to (M-EXCloc[Z]), and therefore, it suﬃces to show
(6.7), (6.8), and (6.9) for x, y such that x − y = χu1 + χu2 − χv1 − χv2 with
{u1,u2,v1,v2} ⊆ V ∪ {0} and {u1,u2} ∩ {v1,v2} = ∅. Since (6.7) is obvious from
(6.5), it remains to show (6.8) for four cases:sidca00si
2013/2/12
page 138
## 138 Chapter 6. M-Convex Functions
(a1) x − y = χu1 + χu2 − χv1 − χv2 , (a2) x − y = 2χu1 − 2χv1,
(a3) x − y = 2χu1 − χv1 − χv2 , (a4) x − y = χu1 + χu2 − 2χv1,
and (6.9) for four cases:
(b1) x − y = χu1 − χv1 − χv2 , (b2) x − y = −2χv1,
(b3) x − y = −χv1 − χv2, (b4) x − y = χu1 − 2χv1,
where u1, u2, v1, v2 are all distinct. We deal with (a1) and (b4) below; the other
cases are left to the reader.
Case (a1): We abbreviate z = (x ∧ y) + α1χu1 + α2χu2 + β1χv1 + β2χv2 to
(α1α2β1β2); for instance, x = (1100) and y = (0011). We are to derive
f(1100) + f(0011) ≥ min[f(0110) + f(1001),f(1010)+ f(0101)]. (6.16)
By (6.5) for u = u1, we have (6.16) or
f(1100) + f(0011) ≥ f(0100) + f(1011). (6.17)
By (6.5) for u = u2, we have (6.16) or
f(1100) + f(0011) ≥ f(1000) + f(0111). (6.18)
Furthermore, by (6.5) we have
f(0100) + f(0111) ≥ f(0110)+ f(0101), (6.19)
f(1000) + f(1011) ≥ f(1010)+ f(1001). (6.20)
Adding (6.17), (6.18), (6.19), and (6.20) yields
2[f(1100)+ f(0011)] ≥ [f(0110) + f(1001)] + [f(1010) + f(0101)],
which implies (6.16).
Case (b4): We abbreviate z = (x∧y)+α1χu1 +β1χv1 to (α1β1); for instance,
x = (10) and y = (02). We are to show
f(10) + f(02) ≥ f(01) + f(11).
This, however, is derived from (6.5) for (02), (10), and u = v1.
## 6.3 Examples
We have already seen M-convexity in network ﬂows and in matroids (section 2.2,
section 2.4). In this section we see some other examples of M-convex functions, such
as linear functions, quadratic functions, and separable convex functions.
We start by recalling the following facts from Proposition 6.1.
Proposition 6.7.
(1) The eﬀective domain of an M-convex function is an M-convex set.
(2) The eﬀective domain of an M
-convex function is an M
-convex set.sidca00si
2013/2/12
page 139
6.3. Examples 139
Linear functions A linear (or aﬃne) function45
f(x) = α + p,x (x ∈ domf), (6.21)
with p ∈ Rn
and α ∈ R, is M-convex or M
-convex according as domf is M-convex
or M
-convex. The inequalities (6.1) in (M-EXC[Z]) and (6.5) in (M
-EXC[Z]) are
satisﬁed with equality.
Quadratic functions A separable quadratic function
f(x) =
n 
i=1
aix(i)2
(x ∈ domf), (6.22)
with ai ∈ R+ (i = 1,...,n), is M-convex if domf is an M-convex set. A quadratic
function of the form
f(x) =
n 
i=1
aix(i)
2
+ b

i<j
x(i)x(j) (x ∈ Zn
), (6.23)
with ai ∈ R (i = 1,...,n) and b ∈ R, is M
-convex if
0 ≤ b ≤ 2 min
1≤i≤n
ai. (6.24)
The proof is given in Note 6.10. Note that cross-terms in (6.23) have a common
coeﬃcient b.
The following proposition shows a necessary and suﬃcient condition for a
quadratic form to have M-convexity.
Proposition 6.8. Let A = (aij)n
i,j=1 be a symmetric matrix and f(x) = 1
2 x
Ax
for x ∈ domf.
(1) Suppose domf = {x ∈ Zn
|
n
i=1 x(i) = r} for some r ∈ Z. Then f is
M-convex if and only if 46
{i,j} ∩ {k,l} = ∅ =⇒ aij + akl ≥ min(aik + ajl,ail + ajk). (6.25)
(2) Suppose domf = Zn
. Then f is M
-convex if and only if
{i,j} ∩ {k,l} = ∅ =⇒ aij + akl ≥ min(aik + ajl,ail + ajk), (6.26)
{i,j} ∩ {k} = ∅ =⇒ aij ≥ min(aik,ajk), (6.27)
aij ≥ 0 for every (i,j). (6.28)
45In this section, V = {1,...,n}, f denotes a real-valued function in integer variables, i.e., f :
Zn → R∪{+∞}, and x(i) is the ith component of an integer vector x = (x(i) | i = 1,...,n) ∈ Zn.
46As a special case of (6.25) and (6.26) with i = j and k = l, we have aii +akk ≥ 2aik. Similarly,
we have aii ≥ aik as a special case of (6.27).sidca00si
2013/2/12
page 140
## 140 Chapter 6. M-Convex Functions
Proof. (1) The local exchange property (M-EXCloc[Z]), which is equivalent to
M-convexity by Theorem 6.4, reduces to (6.25).
(2) A straightforward translation of (6.25) using (6.4) gives this result.
A symmetric matrix A = (aij)n
i,j=1 with
aij = wmax(i,j) (1 ≤ i,j ≤ n) (6.29)
for some w1 ≥ w2 ≥ ··· ≥ wn satisﬁes (6.25), and the associated quadratic form
f(x) = 1
2 x
Ax deﬁned on {x ∈ Zn
| n
i=1 x(i) = r} for some r ∈ Z is M-convex
by Proposition 6.8 (1) above. For n = 4, such a matrix looks like
A =
⎡
⎢
⎢
⎣
w1 w2 w3 w4
w2 w2 w3 w4
w3 w3 w3 w4
w4 w4 w4 w4
⎤
⎥
⎥
⎦. (6.30)
Separable convex functions A separable convex function
f(x) =
n 
i=1
fi(x(i)) (x ∈ domf) (6.31)
with univariate discrete convex functions fi ∈ C[Z → R] (i = 1,...,n) is M-convex
or M
-convex according to whether domf is M-convex or M
-convex; see (3.68) for
the notation C[Z → R]. As special cases we see the following.
Proposition 6.9. Let ψ ∈ C[Z → R] be a univariate discrete convex function.
(1) ψ is M
-convex.
(2) The function f : Z2
→ R ∪ {+∞} deﬁned by
f(x) =

ψ(x(1)) (x(1) + x(2) = 0)
+∞ (otherwise)
(x ∈ Z2
)
is M-convex.
Moreover, a quasi-separable convex function
f(x) = f0
8 n 
i=1
x(i)
9
+
n 
i=1
fi(x(i)) (x ∈ Zn
) (6.32)
with fi ∈ C[Z → R] (i = 0,1,...,n) is M
-convex. Note that the function ˜ f(x0,x)
in (6.4) associated with f(x) of (6.32) is a separable convex function. A special case
of (6.32) with
f0(x0) =
b
2
x0
2
, fi(x(i)) =

ai −
b
2

x(i)
2
(i = 1,...,n)
coincides with the quadratic function in (6.23).sidca00si
2013/2/12
page 141
6.3. Examples 141
Laminar convex functions By a laminar family we mean a nonempty family T
of subsets of {1,...,n} such that
X,Y ∈ T =⇒ X ∩ Y = ∅ or X ⊆ Y or X ⊇ Y. (6.33)
For a laminar family T and a family of univariate discrete convex functions fX ∈
C[Z → R] indexed by X ∈ T , the function deﬁned by
f(x) =

X∈T
fX(x(X)) (x ∈ Zn
) (6.34)
is an M
-convex function (the proof is given in Note 6.11). We refer to such an f as a
laminar convex function. A special case of (6.34) with T = {{1,...,n},{1},...,{n}}
coincides with the quasi-separable convex function in (6.32). Laminarity is indis-
pensable for M
-convexity; e.g., f(x) = (x(1) + x(2))2
+ (x(2) + x(3))2
, with a
nonlaminar family {{1,2},{2,3}}, is not an M
-convex function.
Minimum-value functions Given a vector (ai | i = 1,...,n) ∈ Rn
, we denote
by μ(X) the minimum value of ai with index i belonging to X ⊆ {1,...,n}. More
formally, choosing a∗ ∈ R ∪ {+∞} with a∗ ≥ max{ai | i = 1,...,n}, we deﬁne a
set function μ by
μ(X) =

min{ai | i ∈ X} (X = ∅),
a∗ (X = ∅).
(6.35)
Identifying X with its characteristic vector χX yields a function f : Zn
→ R∪{+∞},
which is given by
f(x) =
⎧
⎨
⎩
min{ai | i ∈ supp+
(x)} (x ∈ {0,1}n
\ {0}),
a∗ (x = 0),
+∞ (otherwise).
(6.36)
This is an M
-convex function.
Note 6.10. The M
-convexity of the quadratic function in (6.23) with (6.24) is
proved here. Let i ∈ supp+
(x − y). If x ≥ y, we have
f(x) + f(y) − f(x − χi) − f(y + χi) = 2ai(x(i) − y(i)) + b

k=i
(x(k) − y(k)) ≥ 0.
Otherwise, there exists j ∈ supp−
(x − y) such that
f(x) + f(y) − f(x − χi + χj) − f(y + χi − χj)
= (2ai − b)(x(i) − y(i)) + (2aj − b)(y(j) − x(j)) ≥ 0.
Hence f satisﬁes (M
-EXC[Z]). It is also easy to verify the conditions (6.26) to
(6.28) in Proposition 6.8 (2).sidca00si
2013/2/12
page 142
## 142 Chapter 6. M-Convex Functions
Note 6.11. An elementary proof of the M
-convexity of a laminar convex function
in (6.34) is given here; an alternative simpler proof using network ﬂow is in Note
9.31. For X ∈ T , denote by T (X) the family of all maximal elements of T properly
contained in X and note that
x(X) =

{x(Y ) | Y ∈ T (X)} +

⎧
⎨
⎩
x(v)
)
)
)
)
)
)
v ∈ X \
:
Y ∈T (X)
Y
⎫
⎬
⎭
. (6.37)
Take x,y ∈ domf and u ∈ supp+
(x−y) in (M
-EXC[Z]). To prove (6.5) it suﬃces
to show the existence of v ∈ supp−
(x − y) ∪ {0} such that
u ∈ X,v / ∈ X,X ∈ T =⇒ x(X) > y(X), (6.38)
u / ∈ X,v ∈ X,X ∈ T =⇒ x(X) < y(X). (6.39)
If x(X) > y(X) for all X ∈ T containing u, we can take v = 0 to meet (6.38) and
(6.39). Otherwise, let X0 be the unique minimal element of T such that u ∈ X0
and x(X0) ≤ y(X0). By the minimality of X0 and (6.37) we have
(i) ∃v ∈ X0 \
5
Y ∈T (X0) Y such that x(v) < y(v) or
(ii) ∃X1 ∈ T (X0) such that x(X1) < y(X1).
In case (i), this v is valid for (6.38) and (6.39). In case (ii), from (6.37) follows
(i) ∃v ∈ X1 \
5
Y ∈T (X1) Y such that x(v) < y(v) or
(ii) ∃X2 ∈ T (X1) such that x(X2) < y(X2).
Repeating this argument we eventually arrive at case (i).
Note 6.12. In section 2.1 we considered M
-convex quadratic functions in real
variables, whereas we have investigated functions in integer variables in this section;
namely, Rn
→ R in section 2.1 and Zn
→ R here. Both are characterized by
exchange properties; the former by (M
-EXC[R]) and the latter by (M
-EXC[Z]).
One of the main results of section 2.1, Theorem 2.12, says that a positive-deﬁnite
symmetric matrix belongs to the class L−1
of (2.19) if and only if the associated
quadratic form satisﬁes (M
-EXC[R]). This statement, however, does not carry
over to the discrete setting. For instance, consider
A =
1
43
⎡
⎣
16 11 13
11 21 17
13 17 24
⎤
⎦, A−1
=
⎡
⎣
5 −1 −2
−1 5 −3
−2 −3 5
⎤
⎦,
where A ∈ L−1
. The associated quadratic form f(x) = 1
2 x
Ax satisﬁes (M
-
EXC[R]) as a function f : R3
→ R in real variables, but does not meet (M
-
EXC[Z]) when viewed as f : Z3
→ R in integer variables. This phenomenon seems
to be indicative of the subtleties inherent in discreteness. See Note 8.13 for the
conjugate of M
-convex quadratic functions.
## 6.4 Basic Operations
Basic operations on M-convex functions are presented here, whereas a most impor-
tant operation, transformation by networks, is treated later in section 9.6.sidca00si
2013/2/12
page 143
6.4. Basic Operations 143
First we introduce some operations on a function f : ZV
→ R ∪ {+∞} in
general. For a subset U ⊆ V , the restriction, the projection, and the aggregation
of f to U are functions fU : ZU
→ R ∪ {+∞}, fU
: ZU
→ R ∪ {±∞}, and
fU∗
: ZU
× Z → R ∪ {±∞} deﬁned respectively by
fU(y) = f(y,0V \U) (y ∈ ZU
), (6.40)
fU
(y) = inf{f(y,z) | z ∈ ZV \U
} (y ∈ ZU
), (6.41)
fU∗
(y,w) = inf{f(y,z) | z(V \ U) = w,z ∈ ZV \U
} (y ∈ ZU
,w ∈ Z), (6.42)
where 0V \U means the zero vector in ZV \U
. For a pair of functions fi : ZV
→
R ∪ {+∞} (i = 1,2), the integer inﬁmal convolution is a function f12Z f2 : ZV
→
R ∪ {±∞} deﬁned by
(f12Z f2)(x) = inf{f1(x1) + f2(x2) | x = x1 + x2, x1,x2 ∈ ZV
} (x ∈ ZV
).
(6.43)
Provided that f12Z f2 is away from the value of −∞, we have
dom(f12Z f2) = domf1 + domf2, (6.44)
where the right-hand side means the discrete Minkowski sum (3.52). The projection
fU
can be represented as
fU
= (f2Z δÛ)U, (6.45)
which says that fU
coincides with the restriction to U of the integer inﬁmal con-
volution of f with the indicator function δÛ of Û = {x ∈ ZV
| x(v) = 0 (v ∈ U)}.
We continue to use the notation f[−p] for p ∈ RV
deﬁned in (3.69) and f[a,b] for
an integer interval [a,b] deﬁned in (3.55).
M-convex functions admit the following operations.
Theorem 6.13. Let f,f1,f2 ∈ M[Z → R] be M-convex functions.
(1) For λ ∈ R++, λf is M-convex.
(2) For a ∈ ZV
, f(a − x) and f(a + x) are M-convex in x.
(3) For p ∈ RV
, f[−p] is M-convex.
(4) For ϕv ∈ C[Z → R] (v ∈ V ),
˜ f(x) = f(x) +

v∈V
ϕv(x(v)) (x ∈ ZV
) (6.46)
is M-convex provided dom ˜ f = ∅.
(5) For a,b ∈ (Z ∪ {±∞})V
, the restriction f[a,b] to the integer interval [a,b]
is M-convex provided domf[a,b] = ∅.
(6) For U ⊆ V , the restriction fU is M-convex provided domfU = ∅.
(7) For U ⊆ V , the aggregation fU∗
is M-convex provided fU∗
> −∞.
(8) The integer inﬁmal convolution ˜ f = f12Z f2 is M-convex provided ˜ f >
−∞.
Proof. (1), (2), (5), and (6) are obvious and (3) is a special case of (4).sidca00si
2013/2/12
page 144
## 144 Chapter 6. M-Convex Functions
(4) For x,y ∈ dom ˜ f ⊆ domf and u ∈ supp+
(x−y), use (M-EXC[Z]) for f to
obtain v ∈ supp−
(x − y) satisfying (6.1) for f. Then
˜ f(x − χu + χv) + ˜ f(y + χu − χv) − ˜ f(x) − ˜ f(y)
= [f(x − χu + χv) + f(y + χu − χv) − f(x) − f(y)]
+ [ϕu(x(u) − 1) + ϕu(y(u) + 1) − ϕu(x(u)) − ϕu(y(u))]
+ [ϕv(x(v) + 1) + ϕv(y(v) − 1) − ϕv(x(v)) − ϕv(y(v))] ≤ 0.
(7) We show this in Note 9.29 using transformation by a network.
(8) We show this in Note 9.30 using transformation by a network.
As is easily seen, the converse of Theorem 6.13 (5) is also true.
Proposition 6.14. For a function f : ZV
→ R ∪ {+∞}, we have
f is M-convex ⇐⇒ f[a,b] is M-convex for any a,b ∈ ZV
with domf[a,b] = ∅.
The operations in Theorem 6.13 are also valid for M
-convex functions. In
addition, the projection is allowed for M
-convex functions.
Theorem 6.15. Let f,f1,f2 ∈ M
[Z → R] be M
-convex functions.
(1) Operations (1)–(8) of Theorem 6.13 are valid for M
-convex functions.
(2) For U ⊆ V , the projection fU
is M
-convex provided fU
> −∞.
Proof. (2) This follows from (6.45) as well as the M
-versions of (6) and (8) of
Theorem 6.13.
Note 6.16. The sum of two M-convex functions is not necessarily M-convex. For
example, recall the M-convex sets B1 and B2 in Note 4.25 such that B1 ∩ B2 is
not M-convex. Their indicator functions are M-convex, but their sum, which is the
indicator function of B1 ∩B2, is not M-convex. The sum of two M-convex functions
is studied under the name M2-convex function in section 8.3. A similar argument
applies to the sum of two M
-convex functions.
Note 6.17. The proviso fU∗
> −∞ in Theorem 6.13 (7) can be weakened to
fU∗
(x0) > −∞ for some x0. A similar weakening holds for ˜ f > −∞ in Theorem
6.13 (8) and fU
> −∞ in Theorem 6.15 (2).
Note 6.18. For a function f : ZV
→ R∪{+∞} and a positive integer α, we deﬁne
a function fα
: ZV
→ R ∪ {+∞} by
fα
(x) =
1
α
f(αx) (x ∈ ZV
). (6.47)sidca00si
2013/2/12
page 145
6.5. Supermodularity 145
f(x)
αfα
(x
α)
-
x
6
−2 −1 0 1 2 3 4
Figure 6.1. Scaling fα
for α = 2.
This is called a scaling in the domain or a domain scaling. If α = 2, for in-
stance, this amounts to considering the function values only on vectors of even
integers (see Fig. 6.1). Scaling is one of the common techniques used in design-
ing eﬃcient algorithms—this is particularly true of network ﬂow algorithms (see
Ahuja–Magnanti–Orlin [1]).
M-convexity (or M
-convexity) is not preserved under scaling. For example,
the indicator function f of an M-convex set
{c1(1,0,−1,0) + c2(1,0,0,−1)+ c3(0,1,−1,0) + c4(0,1,0,−1) | ci ∈ {0,1}}
is M-convex, but fα
for α = 2 is not, because it is the indicator function of
{(0,0,0,0),(1,1,−1,−1)}, which is not M-convex. Nevertheless, scaling an M-
convex function is useful in designing eﬃcient algorithms, as we will see in sec-
tion 10.1 as well as in Theorem 6.37 (a proximity theorem for M-convex functions).
It is worth mentioning that some subclasses of M-convex functions are closed under
the scaling operation; linear, quadratic, separable, and laminar M-convex functions
form such subclasses. See Proposition 10.41 for a type of scaling operation for
M-convex functions.
## 6.5 Supermodularity
M
-convex functions are supermodular on the integer lattice.
Theorem 6.19. An M
-convex function f ∈ M
[Z → R] is supermodular; i.e.,
f(x) + f(y) ≤ f(x ∨ y) + f(x ∧ y) (x,y ∈ ZV
). (6.48)
Proof. For x ∈ ZV
, (M
-EXC[Z]) applied to (x + χu + χv,x) yields
f(x + χu) + f(x + χv) ≤ f(x + χu + χv) + f(x) (u,v ∈ V,u = v). (6.49)
We prove (6.48) by induction on ||x−y||1, where we may assume supp+
(x−y) = ∅
and supp−
(x − y) = ∅. By (6.49), (6.48) is true if ||x − y||1 ≤ 2. For x, y withsidca00si
2013/2/12
page 146
## 146 Chapter 6. M-Convex Functions
||x − y||1 ≥ 3, we may assume x ∨ y,x ∧ y ∈ domf and also {x(u) − y(u) | u ∈
supp+
(x−y)} ≥ 2, by symmetry. Take u ∈ supp+
(x−y) and put x
= (x∧y)+χu
and y
= y + χu. Since domf is an M
-convex set, it includes the integer interval
[x ∧ y,x ∨ y]Z and, in particular, x
,y
∈ domf. By ||x
− y||1 ≤ ||x − y||1 − 1 and
||x − y
||1 = ||x − y||1 − 1, the induction hypothesis yields
f(y) − f(x ∧ y) ≤ f(y + χu) − f((x ∧ y) + χu) ≤ f(x ∨ y) − f(x),
which shows (6.48).
Example 6.20. The converse of Theorem 6.19 is not true. For instance, a function
f : Z3
→ R ∪ {+∞} deﬁned by domf = {0,1}3
and f(1,1,1) = 2, f(1,1,0) =
f(1,0,1) = 1, f(0,0,0) = f(1,0,0) = f(0,1,0) = f(0,0,1) = f(0,1,1) = 0 is
supermodular and not M
-convex; (M
-EXC[Z]) fails for x = (0,1,1), y = (1,0,0),
and u = 2.
Note 6.21. We have repeatedly said that submodularity corresponds to convexity
(in section 4.5, in particular). Theorem 6.19 says, however, that M
-concave func-
tions are submodular. Though somewhat annoying, this is not a contradiction, but
provides a better understanding of the fact that motivated the analogy of submod-
ularity to concavity in the 1970s. The fact is that, for a univariate concave function
h, the set function ρ deﬁned by ρ(X) = h(|X|) for X ⊆ V is submodular (Edmonds
[44], Lovász [123]). A possible understanding based on Theorem 6.19 is as follows:
ρ is an M
-concave function, viewed as a function on {0,1}V
, and, therefore, it is
submodular. Recall also section 2.3.1 for the issue of convexity vs. submodularity.
Note 6.22. The supermodular inequality (6.48) is void for an M-convex function
f because x ∨ y,x ∧ y ∈ domf occurs only when x = y. For an M-convex function
f, the property corresponding to (6.49) is expressed as
f(x + (χu − χw)) + f(x + (χv − χw)) ≤ f(x + (χu − χw) + (χv − χw)) + f(x),
where u,v,w are distinct elements of V and x ∈ ZV
.
## 6.6 Descent Directions
One of the most conspicuous features of an M-convex function f is that it has a
prescribed set of possible descent directions in the sense that
x,y ∈ domf, f(x) > f(y)
=⇒ f(x) > min
u∈supp+(x−y)
min
v∈supp−(x−y)
f(x − χu + χv). (6.50)
This is an exemplar of what we understand as discreteness in direction.sidca00si
2013/2/12
page 147
6.6. Descent Directions 147
Proposition 6.23. An M-convex function f ∈ M[Z → R] satisﬁes (6.50).
Proof. By (M-EXC[Z]) there exist u1 ∈ supp+
(x−y) and v1 ∈ supp−
(x−y) such
that
f(y) ≥ [f(x − χu1 + χv1 ) − f(x)] + f(y2),
where y2 = y + χu1 − χv1. By (M-EXC[Z]) applied to (x,y2), there exist u2 ∈
supp+
(x − y2) and v2 ∈ supp−
(x − y2) such that
f(y2) ≥ [f(x − χu2 + χv2) − f(x)] + f(y3),
where y3 = y2+χu2 −χv2 = y+χu1 +χu2 −χv1 −χv2. Repeating this m = ||x−y||1/2
times, we obtain (ui,vi) (i = 1,...,m) such that y = x −
m
i=1 (χui − χvi ) and
f(x) > f(y) ≥ f(x) +
m 
i=1
[f(x − χui + χvi) − f(x)].
Therefore, f(x − χui + χvi ) − f(x) < 0 for some i.
The property (6.50) is essential for M-convexity. For an M-convex function f
and any p ∈ RV
, f[p] is again M-convex, and, therefore, f satisﬁes the following
property:
(M-SI[Z]) For p ∈ RV
and x,y ∈ domf with f[p](x) > f[p](y),
f[p](x) > min
u∈supp+(x−y)
min
v∈supp−(x−y)
f[p](x − χu + χv). (6.51)
As the M
-version we consider the following:
(M
-SI[Z]) For p ∈ RV
and x,y ∈ domf with f[p](x) > f[p](y),
f[p](x) > min
u∈supp+(x−y)∪{0}
min
v∈supp−(x−y)∪{0}
f[p](x − χu + χv), (6.52)
where χ0 = 0, as usual.
Theorem 6.24. Let f : ZV
→ R ∪ {+∞} be a function with domf = ∅.
(1) f is an M-convex function ⇐⇒ f satisﬁes (M-SI[Z]).
(2) f is an M
-convex function ⇐⇒ f satisﬁes (M
-SI[Z]).
Proof. It suﬃces to prove (1). The implication ⇒ is immediate from Theorem
6.13 (3) and Proposition 6.23. The converse ⇐ follows from Claims 1 and 2 below
by Theorem 6.4.
Claim 1: B = domf is an M-convex set.
(Proof of Claim 1) For x,y ∈ B and u ∈ supp+
(x−y), take a suﬃciently large
M > 0 and deﬁne p : V → R by
p(v) =
⎧
⎨
⎩
M2
(v = u),
M (v ∈ supp−
(x − y)),
0 (otherwise).sidca00si
2013/2/12
page 148
## 148 Chapter 6. M-Convex Functions
Then f[p](x) > f[p](y), and by (M-SI[Z]) there exist w ∈ supp+
(x − y) and v ∈
supp−
(x−y) such that f[p](x)−f[p](x−χw +χv) = f(x)−f(x−χw +χv)+p(w)−
M > 0. This is possible only if w = u, which shows (B-EXC−[Z]) for B. Then B
is an M-convex set by Theorem 4.3.
Claim 2: f satisﬁes the local exchange axiom (M-EXCloc[Z]).
(Proof of Claim 2) Take x,y ∈ B with ||x − y||1 = 4 and put y = x −
χu1 − χu2 + χv1 + χv2 with u1,u2,v1,v2 ∈ V and {u1,u2} ∩ {v1,v2} = ∅. In the
following we assume u1 = u2 and v1 = v2 (the other cases can be treated similarly).
Consider a bipartite graph G = (V +
,V −
;E) with vertex bipartition V +
= {u1,u2},
V −
= {v1,v2} and arc set E = {(ui,vj) | Δf(x;vj,ui) < +∞ (i,j = 1,2)}. The
graph G has a perfect matching as a consequence of (B-EXC[Z]) for B. We think
of Δf(x;vj,ui) as the weight of arc (ui,vj) and apply Proposition 3.14 to obtain
p : V → R such that
Δf(x;vj,ui) ≥ p(ui) − p(vj) (i,j = 1,2), (6.53)
and p(u1) + p(u2) − p(v1) − p(v2) is equal to the right-hand side of (6.11) (and
p(v) = 0 for v ∈ V \ {u1,u2,v1,v2}). Failure of inequality (6.11) would imply
f[p](x) > f[p](y), f[p](x) ≤ f[p](x − χui + χvj ) (i,j = 1,2),
a contradiction to (M-SI[Z]).
The proof of Proposition 6.23 shows the following.
Proposition 6.25. For an M-convex function f ∈ M[Z → R] and x,y ∈ domf,
we have
f(y) ≥ f(x) + ˇ f(x,y), (6.54)
where
ˇ f(x,y) = inf
λ
⎧
⎨
⎩

u,v∈V
λuv[f(x − χu + χv) − f(x)]
)
)
)
)
)
)

u,v∈V
λuv(χv − χu) = y − x, λuv ∈ Z+ (u,v ∈ V )
⎫
⎬
⎭
. (6.55)
## 6.7 Minimizers
Global optimality for an M-convex function is characterized by local optimality.
Theorem 6.26 (M-optimality criterion).
(1) For an M-convex function f ∈ M[Z → R] and x ∈ domf, we have
f(x) ≤ f(y) (∀y ∈ ZV
) ⇐⇒ f(x) ≤ f(x − χu + χv) (∀u,v ∈ V ). (6.56)
(2) For an M
-convex function f ∈ M
[Z → R] and x ∈ domf, we have
f(x) ≤ f(y) (∀y ∈ ZV
) ⇐⇒

f(x) ≤ f(x − χu + χv) (∀u,v ∈ V ),
f(x) ≤ f(x ± χv) (∀v ∈ V ).
(6.57)sidca00si
2013/2/12
page 149
6.7. Minimizers 149
T
e
e
Figure 6.2. Minimum spanning tree problem.
Proof. It suﬃces to prove ⇐ in (1), but this follows from Proposition 6.23.
Example 6.27. The minimum spanning tree problem serves as a canonical exam-
ple to illustrate the M-optimality criterion. Let G = (U,E) be a graph with vertex
set U and arc set E. A set T of arcs is called a spanning tree if it forms a con-
nected subgraph that contains no circuit and covers all the vertices. The minimum
spanning tree problem is to ﬁnd a spanning tree T that has the minimum weight
with respect to a given weight w : E → R, where the weight of T is deﬁned as
e∈T w(e). It is well known that a spanning tree T has the minimum weight if and
only if w(e) ≤ w(e
) for any e ∈ T and e
∈ E \T such that T −e+e
is a spanning
tree (see Fig. 6.2). This well-known optimality criterion is a special case of Theorem
6.26 (1) applied to an M-convex function f : ZE
→ R ∪ {+∞} deﬁned by
f(x) =

e∈T w(e) (x = χT , T is a spanning tree),
+∞ (otherwise).
Note that, for a spanning tree T and arcs e ∈ T and e
∈ E \ T, we have f(χT ) ≤
f(χT − χe + χe ) if and only if (i) w(e) ≤ w(e
) or (ii) T − e + e
is not a spanning
tree. In this connection it is noted that T −e+e
is a spanning tree if and only if e
belongs to the unique circuit contained in T ∪ {e
}, called the fundamental circuit
with respect to (T,e
).
Theorem 6.26 above shows how to verify the optimality of a given point with
O(n2
) function evaluations. The next theorem suggests how to ﬁnd a minimizer.
Stating that a given point can be easily separated from some minimizer, it serves
as a basis of the domain reduction algorithm for M-convex function minimization,
to be explained in section 10.1.3.
Theorem 6.28 (M-minimizer cut). Let f : ZV
→ R ∪ {+∞} be an M-convex
function with argminf = ∅.
(1) For x ∈ domf and v ∈ V , let u ∈ V be such that
f(x − χu + χv) = min
s∈V
f(x − χs + χv).sidca00si
2013/2/12
page 150
## 150 Chapter 6. M-Convex Functions
Then there exists x∗
∈ argminf with
x∗
(u) ≤ x(u) − 1 + χv(u).
(2) For x ∈ domf and u ∈ V , let v ∈ V be such that
f(x − χu + χv) = min
t∈V
f(x − χu + χt).
Then there exists x∗
∈ argminf with
x∗
(v) ≥ x(v) − χu(v) + 1.
(3) For x ∈ domf \ argminf, let u,v ∈ V be such that
f(x − χu + χv) = min
s,t∈V
f(x − χs + χt).
Then there exists x∗
∈ argminf with
x∗
(u) ≤ x(u) − 1, x∗
(v) ≥ x(v) + 1.
Proof. (1) Put x
= x − χu + χv. Assume, to the contrary, that there is no
x∗
∈ argminf with x∗
(u) ≤ x
(u). Let x∗
be an element of argminf with x∗
(u)
being minimum. Then we have x∗
(u) > x
(u). By applying (M-EXC[Z]) to x∗
,
x
, and u we obtain some w ∈ supp−
(x∗
− x
) such that if Δf(x∗
;w,u) > 0 then
Δf(x
;u,w) < 0. Since Δf(x∗
;w,u) > 0 by the choice of x∗
, we have f(x
) >
f(x
+ χu − χw) = f(x − χw + χv), a contradiction to the property of u.
(2) The proof is similar to that for (1).
(3) Put x
= x − χu + χv (= x). By (1) there exists x∗
∈ argminf such
that x∗
(u) ≤ x
(u); we assume that x∗
maximizes x∗
(v) among all such vectors. If
x∗
(v) ≥ x
(v) is not satisﬁed, (M-EXC[Z]) applies to x
, x∗
, and v to yield some
w ∈ supp−
(x
− x∗
) satisfying (a) Δf(x
;w,v) < 0, (b) Δf(x∗
;v,w) < 0, or (c)
Δf(x
;w,v) = Δf(x∗
;v,w) = 0. We have Δf(x
;w,v) ≥ 0 by x
− χv + χw = x −
χu+χw and the choice of u and v. We also have Δf(x∗
;v,w) ≥ 0 by x∗
∈ argminf.
Therefore, we have (c), which implies x∗
+ χv − χw ∈ argminf, a contradiction to
the choice of x∗
.
The minimizers of an M-convex function form an M-convex set, a property
that is essential for a function to be M-convex.
Proposition 6.29. For an M-convex function f ∈ M[Z → R], argminf is an
M-convex set if it is not empty.
Proof. For x,y ∈ argminf, we have x−χu +χv, y +χu −χv ∈ argminf in (6.1).
This shows that argminf satisﬁes (B-EXC[Z]).
The following theorem reveals that M-convex functions are characterized as
functions obtained by piecing together M-convex sets in a consistent way. Thissidca00si
2013/2/12
page 151
6.7. Minimizers 151
shows how the concept of M-convex functions can be deﬁned from that of M-
convex sets.
Theorem 6.30. Let f : ZV
→ R ∪ {+∞} be a function with a bounded nonempty
eﬀective domain.
(1) f is M-convex ⇐⇒ argminf[−p] is an M-convex set for each p ∈ RV
.
(2) f is M
-convex ⇐⇒ argminf[−p] is an M
-convex set for each p ∈ RV
.
Proof. It suﬃces to prove (1). The implication ⇒ is immediate from Theorem 6.13
(3) and Proposition 6.29. For ⇐, it suﬃces, by Theorem 6.4, to show that B =
domf is an M-convex set and f satisﬁes the local exchange axiom (M-EXCloc[Z]).
Claim 1: B is an M-convex set.
(Proof of Claim 1) Put Bp = argminf[−p] for each p. Then we have B = 5
p Bp for the convex hulls of B and Bp. For x,y ∈ B, there exists p such that y ∈ Bp
and z ≡ tx+(1−t)y ∈ Bp for some t > 0. It follows from (B-EXC+[R]) of Bp that,
for u ∈ supp+
(x−y) = supp+
(z−y), there exists v ∈ supp−
(z−y) = supp−
(x−y)
such that y + α(χu − χv) ∈ Bp ⊆ B for all suﬃciently small α > 0. This shows
(B-EXC+[R]) for B. Therefore, B is an M-convex set.
For (M-EXCloc[Z]), take x,y ∈ B with ||x−y||1 = 4. Let f : RV
→ R∪{+∞}
be the convex closure of f, where it is noted that f is not assumed to be convex
extensible. Let p ∈ RV
be a subgradient of f at c = (x + y)/2 ∈ RV
. We have
c ∈ argminf[−p] = Bp, where Bp is an integral M-convex polyhedron. Hence,
the intersection of Bp with the interval I = [x ∧ y,x ∨ y]R is an integral M-convex
polyhedron, in which c is contained. This means that c can be represented as a
convex combination of some integral vectors, say, z1,...,zm ∈ (I∩Bp)∩ZV
= I∩Bp:
c =
m 
k=1
λkzk, zk ∈ I ∩ Bp (k = 1,...,m), (6.58)
where m
k=1 λk = 1 and λk > 0 (k = 1,...,m).
Since ||x−y||1 = 4, we have y = x−χv1 −χv2 +χv3 +χv4 for some v1,v2,v3,v4 ∈
V with {v1,v2} ∩ {v3,v4} = ∅. In the following we assume that v1, v2, v3, and v4
are all distinct (the other cases can be treated similarly). Noting that any element
z of I ∩ Bp can be represented as z = (x ∧ y) + χvi + χvj (i = j), we consider an
undirected graph G = (V0,E0) with vertex set V0 = {v1,v2,v3,v4} and edge set
E0 = {{vi,vj} | zk = (x ∧ y) + χvi + χvj ,k = 1,...,m}.
Claim 2: G has a perfect matching (of size 2).
(Proof of Claim 2) For each i (1 ≤ i ≤ 4), we have c(vi) − (x ∧ y)(vi) = 1/2,
whereas zk(vi)−(x∧y)(vi) ∈ {0,1} for all k in (6.58). Hence, for each i, there exist
k1 and k0 such that
zk1(vi) − (x ∧ y)(vi) = 1, zk0(vi) − (x ∧ y)(vi) = 0.
Translating this into G, we see that for each vertex vi there is an edge that covers
(is incident to) vi and also there is another edge that avoids (is not incident to) vi.
This condition implies the existence of a perfect matching in G.sidca00si
2013/2/12
page 152
## 152 Chapter 6. M-Convex Functions
Finally we derive (M-EXCloc[Z]) from Claim 2. We divide into two cases. (i) If
{{v1,v2},{v3,v4}} ⊆ E0, both x and y appear among the zk’s, and hence x,y ∈ Bp.
By (B-EXC[Z]) for Bp, we have x−χvi +χvj ∈ Bp and y+χvi −χvj ∈ Bp for some
i ∈ {1,2} and j ∈ {3,4}. Hence,
f[−p](x) = f[−p](y) = f[−p](x − χvi + χvj ) = f[−p](y + χvi − χvj ),
which shows (6.11) with equality. (ii) If {{v1,v2},{v3,v4}} ⊆ E0, it follows from
Claim 2 that {{v1,vi},{v2,vj}} ⊆ E0 for some i,j with {i,j} = {3,4}. Then
(x ∧ y) + χv1 + χvi = x − χv2 + χvi, (x ∧ y) + χv2 + χvj = y + χv2 − χvi
both belong to Bp; i.e.,
f[−p](x − χv2 + χvi ) = f[−p](y + χv2 − χvi ) = minf[−p].
Hence,
f[−p](x) + f[−p](y) ≥ f[−p](x − χv2 + χvi) + f[−p](y + χv2 − χvi),
which establishes (6.11).
Note 6.31. The boundedness assumption on domf in Theorem 6.30 is not re-
strictive substantially, since we know from Proposition 6.14 that f is M-convex if
and only if its restriction f[a,b] to every bounded integer interval [a,b] is M-convex
(as long as domf[a,b] = ∅). On the other hand, the boundedness assumption seems
inevitable. The function
f(x) =
⎧
⎨
⎩
0 (x = 0),
1 (x = 0,x(1) + x(2) = 0),
+∞ (otherwise)
in x = (x(1),x(2)) ∈ Z2
is not M-convex, but, for each p ∈ RV
, argminf[−p] is
equal to {0} (an M-convex set) if it is not empty.
## 6.8 Gross Substitutes Property
In the previous section we saw that the minimizers of an M-convex function f form
an M-convex set for a ﬁxed p ∈ RV
. We investigate here how the minimizers
of f[p] change with the variation of p. The term gross substitutes stems from an
economic interpretation, where p represents the price vector; some background in
mathematical economics will be given in section 11.3.
We ﬁrst observe a general phenomenon, independent of M-convexity, in the
variation of minimizers. Let f : ZV
→ R ∪ {+∞} be any function and assume
x ∈ argminf[p] and y ∈ argminf[q] for p,q ∈ RV
. It follows from f[p](y) ≥ f[p](x)
and f[q](x) ≥ f[q](y) that
q − p,x − y = (f[p](y) − f[p](x)) + (f[q](x) − f[q](y)) ≥ 0.sidca00si
2013/2/12
page 153
6.8. Gross Substitutes Property 153
A particular case of this inequality with q = p + αχu for u ∈ V and α > 0 yields
y(u) ≤ x(u). Namely, we have
x ∈ argminf[p], p ∈ RV
, u ∈ V, α > 0, argminf[p + αχu] = ∅
=⇒ ∀y ∈ argminf[p + αχu] : y(u) ≤ x(u). (6.59)
This is a well-known phenomenon valid for any function f, a kind of monotonicity
in the variation of minimizers. Note that nothing is claimed here about the other
components x(v) and y(v) with v = u.
The gross substitutes property that we consider in this section is concerned with
the variation of other components. In contrast to (6.59) we introduce a condition
on f:
x ∈ argminf[p], p ∈ RV
, u ∈ V, α > 0, argminf[p + αχu] = ∅
=⇒ ∃y ∈ argminf[p + αχu] : y(v) ≥ x(v) (∀v ∈ V \ {u}). (6.60)
Obviously, this condition is equivalent to the following:
(M-GS[Z]) If x ∈ argminf[p], p ≤ q, and argminf[q] = ∅, there exists
y ∈ argminf[q] such that y(v) ≥ x(v) for all v ∈ V with p(v) = q(v).
It should be clear that the inequality p ≤ q above means p(v) ≤ q(v) (∀v ∈ V ).
Proposition 6.32. An M-convex function f ∈ M[Z → R] satisﬁes (M-GS[Z]).
Proof. For x ∈ argminf[p] and p ≤ q, let y be an element of argminf[q] with
||y − x||1 minimum. Suppose, on the contrary, that p(u) = q(u) and x(u) > y(u)
for some u ∈ V . By (M-EXC[Z]) there exists v ∈ supp−
(x − y) such that
f(x) + f(y) ≥ f(x − χu + χv) + f(y + χu − χv). (6.61)
By x ∈ argminf[p] and y ∈ argminf[q] we have
f[p](x) ≤ f[p](x − χu + χv), f[q](y) ≤ f[q](y + χu − χv), (6.62)
and hence
f(x−χu +χv) ≥ f(x)+p(u)−p(v), f(y+χu −χv) ≥ f(y)−q(u)+q(v). (6.63)
Adding (6.61) and (6.63) yields
f(x) + f(y) ≥ f(x) + f(y) + [p(u) − q(u)] + [q(v) − p(v)] ≥ f(x) + f(y).
This shows that (6.61), (6.62), and (6.63) are satisﬁed in equalities. In particular,
we have y + χu − χv ∈ argminf[q], a contradiction to our choice of y.
For a function f let ˜ f be the function given by (6.4). It is easy to see that ˜ f
satisﬁes (M-GS[Z]) if and only if f satisﬁes the following:sidca00si
2013/2/12
page 154
## 154 Chapter 6. M-Convex Functions
(M
-GS[Z]) If x ∈ argminf[p−p01], p ≤ q, p0 ≤ q0, and argminf[q−
q01] = ∅, there exists y ∈ argminf[q − q01] such that
(i) y(v) ≥ x(v) for every v ∈ V with p(v) = q(v), and
(ii) y(V ) ≤ x(V ) if p0 = q0,
where p,q ∈ RV
and p0,q0 ∈ R. Note that (M
-GS[Z]) is equivalent to the pair of
(6.64) and (6.65) below:
x ∈ argminf[p], p ∈ RV
, u ∈ V, α > 0, argminf[p + αχu] = ∅
=⇒ ∃y ∈ argminf[p + αχu] : y(v) ≥ x(v)(∀v ∈ V \ {u}),y(V ) ≤ x(V ), (6.64)
x ∈ argminf[p], p ∈ RV
, α > 0, argminf[p − α1] = ∅
=⇒ ∃y ∈ argminf[p − α1] : y(v) ≥ x(v) (∀v ∈ V ). (6.65)
Proposition 6.33. An M
-convex function f ∈ M
[Z → R] satisﬁes (M
-GS[Z]).
Proof. This follows from Proposition 6.32 applied to ˜ f in (6.4).
Note that (M
-GS[Z]) ⇒ (M-GS[Z]) as well as M[Z → R] ⊆ M
[Z → R].
Hence Proposition 6.32 is contained in Proposition 6.33 as a special case.
The properties (M-GS[Z]) and (M
-GS[Z]) characterize M-convex and M
-
convex functions, respectively.
Theorem 6.34. Let f : ZV
→ R∪{+∞} be a function that is convex extensible47
and has a bounded nonempty eﬀective domain.
(1) If domf ⊆ {x ∈ ZV
| x(V ) = r} for some r ∈ Z,
f is M-convex ⇐⇒ f satisﬁes (M-GS[Z]).
(2)
f is M
-convex ⇐⇒ f satisﬁes (M
-GS[Z]).
Proof. The implications ⇒ in (1) and (2) have been shown in Propositions 6.32
and 6.33. We give a proof of ⇐ for (1) by using Theorem 6.30. It suﬃces to
show that B = argminf is an M-convex set, since (M-GS[Z]) for f implies this for
f[−p] for any p ∈ RV
. Since B = B ∩ ZV
by the convex extensibility of f (see
Proposition 3.18), this is further reduced to showing that every edge of polyhedron
B is parallel to χu − χv for some u,v ∈ V (see (4.43)). Let E be an edge of
B. By B = argminf we have E ∩ ZV
= argminf[p] for some p ∈ RV
. For
two distinct integer points x, y on E, neither supp+
(x − y) nor supp−
(x − y) is
empty by B ⊆ {z ∈ ZV
| z(V ) = r}. By (6.60) with u ∈ supp+
(x − y) and
suﬃciently small α > 0 there exists ȳ ∈ argminf[q] such that ȳ(v) ≥ x(v) (∀v = u),
where q = p + αχu. Note that x = ȳ since f[q](x) > f[q](y) ≥ f[q](ȳ). Since α > 0
47It will be shown in Theorem 6.42 that M-convex functions are convex extensible.sidca00si
2013/2/12
page 155
6.8. Gross Substitutes Property 155
is suﬃciently small, we have ȳ ∈ argminf[p] from ȳ ∈ argminf[q]. This means
that ȳ ∈ E and that x−ȳ is a scalar multiple of x−y. In particular, supp+
(x−y) =
supp+
(x−ȳ) = {u}. Similarly, supp−
(x−y) = {v} for some v. Since x(V ) = y(V ),
this means that x − y is a scalar multiple of χu − χv.
A function f : ZV
→ R ∪ {+∞} is said to have the stepwise gross substitutes
property (SWGS) if it satisﬁes the following:
(M
-SWGS[Z]) For x ∈ argminf[p], p ∈ RV
, and u ∈ V , at least one
of (i) or (ii) holds true:
(i) x ∈ argminf[p + αχu] for any α ≥ 0,
(ii) there exist α ≥ 0 and y ∈ argminf[p + αχu] such that
y(u) = x(u) − 1 and y(v) ≥ x(v) for all v ∈ V \ {u}.
This property also characterizes M
-convex functions.
Proposition 6.35. An M
-convex function f ∈ M
[Z → R] satisﬁes (M
-SWGS[Z]).
Proof. We may assume p = 0. Suppose that (i) in (M
-SWGS[Z]) fails, and let
α∗
be the maximum value of α such that x ∈ argminf[αχu]. By the M-optimality
criterion (Theorem 6.26 (2)), x ∈ argminf[αχu] if and only if
f[αχu](x) ≤ f[αχu](x − χs + χt) (∀s,t ∈ V ∪ {0}),
which can be rewritten as
α(χu(s) − χu(t)) ≤ Δf(x;t,s) (∀s,t ∈ V ∪ {0}).
Noting also that Δf(x;t,s) ≥ 0 (∀s,t ∈ V ∪ {0}), we see
α∗
= min
t∈(V ∪{0})\{u}
Δf(x;t,u).
Let w ∈ (V ∪ {0}) \ {u} be such that α∗
= Δf(x;w,u) and put y = x − χu + χw.
Then f[α∗
χu](x) = f[α∗
χu](y) as well as x ∈ argminf[α∗
χu]. Hence follows (ii) in
(M
-SWGS[Z]).
Theorem 6.36. For a convex-extensible function f : ZV
→ R ∪ {+∞} with a
nonempty eﬀective domain,
f is M
-convex ⇐⇒ f satisﬁes (M
-SWGS[Z]).
Proof. The implication ⇒ was shown in Proposition 6.35. We give a proof of
⇐ by using Theorem 6.30 (2). It suﬃces to show that B = argminf is an M
-
convex set, since (M
-SWGS[Z]) for f implies this for f[−p] for any p ∈ RV
. Since
B = B ∩ ZV
by the convex extensibility of f (see Proposition 3.18), this is further
reduced to showing that every edge of polyhedron B is parallel to χu − χv or χusidca00si
2013/2/12
page 156
## 156 Chapter 6. M-Convex Functions
for some u,v ∈ V (see (4.43)). Let E be an edge of B. By B = argminf we have
E ∩ZV
= argminf[p] for some p ∈ RV
. Let x and y be two distinct integer points
on E with supp+
(x − y) = ∅. By (M
-SWGS[Z]) with u ∈ supp+
(x − y), there
exist α ≥ 0 and x̂ ∈ argminf[p+αχu] such that x̂(u) = x(u)−1 and x̂(w) ≥ x(w)
(∀w = u), since (i) of (M
-SWGS[Z]) fails by f[p + χu](y) < f[p + χu](x). Since
f[p](x̂) + α(x(u) − 1) = f[p + αχu](x̂) ≤ f[p + αχu](y) ≤ f[p](y) + α(x(u) − 1),
we have x̂ ∈ argminf[p]. This means that x̂ ∈ E and that x−x̂ is a scalar multiple
of x − y. In particular supp+
(x − y) = supp+
(x − x̂) = {u}. If supp−
(x − y) = ∅,
then x − y is a scalar multiple of χu. Otherwise, a similar argument shows that
supp−
(x−y) = {v} for some v and there exists ŷ ∈ E∩ZV
such that ŷ(v) = y(v)−1
and ŷ(w) ≥ y(w) (∀w = v). Since x − x̂ is a scalar multiple of y − ŷ, we have
x̂(v) = x(v) + β and ŷ(u) = y(u) + 1/β for some β > 0. We must have β = 1 since
x̂(v) and ŷ(u) are integers. Therefore, x − y is a scalar multiple of χu − χv.
## 6.9 Proximity Theorem
Suppose that we have an optimization problem to solve and another optimization
problem approximating the original problem. Proximity theorem is a generic term
for a theorem that guarantees the existence of an optimal solution to the original
problem in some neighborhood of an optimal solution to the approximate problem.
Our optimization problem here is the minimization of an M-convex function
f, and the approximation to it is the problem of (locally) minimizing the scaling
of f with a positive integer α, denoted as fα
in (6.47). Recall from Note 6.18 that
the scaling of an M-convex function is not necessarily M-convex, and hence a local
optimum of fα
may not be a global optimum of fα
.
The following proximity theorem, named the M-proximity theorem, shows that
a global optimum of the original function f exists in a neighborhood of a local
optimum of fα
.
Theorem 6.37 (M-proximity theorem). Assume α ∈ Z++ and n = |V |.
(1) Let f : ZV
→ R∪{+∞} be an M-convex function. If xα
∈ domf satisﬁes
f(xα
) ≤ f(xα
+ α(χv − χu)) (∀u,v ∈ V ), (6.66)
then argminf = ∅ and there exists x∗
∈ argminf with
||xα
− x∗
||∞ ≤ (n − 1)(α − 1). (6.67)
(2) Let f : ZV
→ R∪{+∞} be an M
-convex function. If xα
∈ domf satisﬁes
f(xα
) ≤ f(xα
+ α(χv − χu)) (∀u,v ∈ V ∪ {0}), (6.68)
then argminf = ∅ and there exists x∗
∈ argminf with
||xα
− x∗
||∞ ≤ n(α − 1). (6.69)sidca00si
2013/2/12
page 157
6.9. Proximity Theorem 157
Proof. It suﬃces to prove (1) by showing that, for any γ ∈ R with γ > inf f, there
exists some x∗
∈ domf satisfying f(x∗
) ≤ γ and (6.67). Suppose that x∗
∈ domf
minimizes ||x∗
− xα
||1 among all vectors satisfying f(x∗
) ≤ γ. In the following,
we ﬁx v ∈ V and prove xα
(v) − x∗
(v) ≤ (n − 1)(α − 1). (The inequality x∗
(v) −
xα
(v) ≤ (n − 1)(α − 1) can be shown similarly.) We may assume xα
(v) > x∗
(v);
put k = xα
(v) − x∗
(v).
Claim 1: There exist w1,w2,...,wk ∈ V \{v} and y0(= xα
),y1,...,yk ∈ domf
such that
yi = yi−1 − χv + χwi, f(yi) < f(yi−1) (i = 1,...,k).
(Proof of Claim 1) We prove the claim by induction on i. Suppose yi−1 ∈
domf. By (M-EXC[Z]) for yi−1, x∗
, and v ∈ supp+
(yi−1 − x∗
), there exists wi ∈
supp−
(yi−1 − x∗
) ⊆ supp−
(xα
− x∗
) ⊆ V \ {v} such that
f(x∗
) + f(yi−1) ≥ f(x∗
− χwi + χv) + f(yi−1 + χwi − χv).
By the choice of x∗
we have f(x∗
+χv −χwi) > f(x∗
), and hence f(yi) = f(yi−1 −
χv + χwi) < f(yi−1).
Claim 2: For any w ∈ V \{v} with yk(w) > xα
(w) and μ ∈ [0,yk(w)−xα
(w)−
1]Z, we have
f(xα
− (μ + 1)(χv − χw)) < f(xα
− μ(χv − χw)).
(Proof of Claim 2) We prove this by induction on μ. For μ ∈ [0,yk(w)−xα
(w)−
1]Z, put x
= xα
− μ(χv − χw) and assume x
∈ domf. Let j∗ (1 ≤ j∗ ≤ k) be the
largest index such that wj∗ = w. Then yj∗ (w) = yk(w) > x
(w) and supp−
(yj∗ −
x
) = {v}. (M-EXC[Z]) implies f(x
)+f(yj∗ ) ≥ f(x
−χv +χw)+f(yj∗ +χv −χw).
By Claim 1 we have f(yj∗ + χv − χw) > f(yj∗ ). This establishes Claim 2.
Claim 2 and (6.66) imply
f(xα
− μw(χv − χw)) < ··· < f(xα
− (χv − χw)) < f(xα
) ≤ f(xα
− α(χv − χw))
for any w with μw ≡ yk(w) − xα
(w) > 0. Hence yk(w) − xα
(w) ≤ α − 1 for all
w ∈ V \ {v}. Then we obtain
xα
(v) − x∗
(v) = xα
(v) − yk(v) =

w∈V \{v}
(yk(w) − xα
(w)) ≤ (n − 1)(α − 1),
where the second equality is by xα
(V ) = yk(V ).
Example 6.38. The M-proximity theorem is illustrated for the univariate M
-
convex function in Fig. 6.1 in section 6.4, where α = 2. Obviously, xα
= 0 is
the minimizer of fα
satisfying (6.68) and x∗
= 1 is the minimizer of f. We have
|xα
− x∗
| = 1 = n(α − 1), in agreement with (6.69).
The minimizer cut theorem (Theorem 6.28) can be adapted to scaling. Theo-
rem 6.28, except for (3), is a special case of the following theorem with α = 1.sidca00si
2013/2/12
page 158
## 158 Chapter 6. M-Convex Functions
Theorem 6.39 (M-minimizer cut with scaling). Let f : ZV
→ R ∪ {+∞} be an
M-convex function with argminf = ∅, and assume α ∈ Z++ and n = |V |.
(1) For x ∈ domf and v ∈ V , let u ∈ V be such that
f(x + α(χv − χu)) = min
s∈V
f(x + α(χv − χs)).
Then there exists x∗
∈ argminf with
x∗
(u) ≤ x(u) − α(1 − χv(u)) + (n − 1)(α − 1).
(2) For x ∈ domf and u ∈ V , let v ∈ V be such that
f(x + α(χv − χu)) = min
t∈V
f(x + α(χt − χu)).
Then there exists x∗
∈ argminf with
x∗
(v) ≥ x(v) + α(1 − χu(v)) − (n − 1)(α − 1).
Proof. We prove (2), while (1) can be proved similarly. Put xα
= x+α(χv −χu).
We may assume max{x∗
(v) | x∗
∈ argminf} < xα
(v); otherwise we are done. Let
x∗
be an element of argminf with x∗
(v) maximum and k = xα
(v) − x∗
(v) (≥ 1).
The rest of the proof is the same as the proof of Theorem 6.37 (from Claim 1 until
the end).
The algorithmic use of the above theorems, M-proximity and minimizer cut
with scaling, is shown in sections 10.1.2 and 10.1.4, respectively.
Note 6.40. An 1-norm version of Theorem 6.37 (1), with (6.67) replaced with
||xα
− x∗
||1 ≤
n2
2
(α − 1), (6.70)
can be obtained from a slight modiﬁcation of the proof; see Murota–Tamura [162].
Note 6.41. The M-proximity theorem (Theorem 6.37) is closely related to the
result of Hochbaum [90]. See also Moriguchi–Shioura [134].
## 6.10 Convex Extension
This section establishes one of the major properties of M-convex functions—that
they can be extended to convex functions in real variables. The extensibility to
convex functions is by no means obvious from the deﬁnition of M-convex functions;
note that the exchange axiom (M-EXC[Z]) refers only to function values on integer
points. The convex extension of an M-convex function can be obtained by piecing
together M-convex polyhedra in a consistent way.sidca00si
2013/2/12
page 159
6.10. Convex Extension 159
The ﬁrst theorem shows that the convex extension of an M-convex function
can be constructed locally.
Theorem 6.42. An M
-convex function is integrally convex. In particular, an
M
-convex function is convex extensible.
Proof. It suﬃces to consider an M-convex function f. The restriction of f to any
bounded integer interval [a,b], denoted by f[a,b], is an M-convex function (Proposi-
tion 6.14). For any p ∈ RV
, argmin(f[a,b][−p]) is an M-convex set by Proposition
6.29, and hence it is an integrally convex set by Theorem 4.24. Therefore, f[a,b] is
an integrally convex function by Theorem 3.29. This implies the integral convexity
of f by Proposition 3.19.
The next theorem characterizes the convex extension of an M-convex function
as a collection of M-convex polyhedra.
Theorem 6.43. Let f : ZV
→ R ∪ {+∞} be a function with domf = ∅ and f be
its convex closure.
(1)
f is M-convex ⇐⇒
⎧
⎨
⎩
(i) f is convex extensible (3.57),
(ii) for every p ∈ RV
, argminf[−p] is
an M-convex polyhedron if it is not empty.
(2)
f is M
-convex ⇐⇒
⎧
⎨
⎩
(i) f is convex extensible (3.57),
(ii) for every p ∈ RV
, argminf[−p] is
an M
-convex polyhedron if it is not empty.
Proof. It suﬃces to prove (1). The implication ⇒ is due to Theorem 6.42 and
Proposition 6.29. The converse ⇐ can be established by Theorem 6.30 applied to
the restriction of f to every bounded integer interval.
By integral convexity, the convex extension f(x) of an M-convex function f
can be represented as a convex combination of f(y) with y ∈ N(x), where N(x)
is the integral neighborhood of x ∈ RV
deﬁned in (3.58). The following theorem
states that we can use a single set of convex combination coeﬃcients for a pair
of M
-convex functions. This fact, though technical, is crucial in establishing the
separation theorem for M
-convex functions (Theorem 8.15).
Theorem 6.44. For two M
-convex functions f1,f2 ∈ M
[Z → R] and x ∈ RV
,
there exists λ = (λy | y ∈ N(x)) such that

y∈N(x)
λyy = x,

y∈N(x)
λy = 1, λy ≥ 0 (y ∈ N(x)), (6.71)
fi(x) = ˜ fi(x) =

y∈N(x)
λyfi(y) (i = 1,2). (6.72)sidca00si
2013/2/12
page 160
## 160 Chapter 6. M-Convex Functions
Proof. We may assume f1 and f2 to be M-convex and x ∈ domf1 ∩ domf2. For
i = 1,2, let (pi,αi) ∈ RV
× R be such that
pi,y + αi ≤ fi(y) (y ∈ N(x)), pi,x + αi = ˜ fi(x)
(see (3.61)). Then
Bi = {y ∈ N(x) | pi,y + αi = fi(y)} = N(x) ∩ argminfi[−pi]
is an M-convex set. Since x ∈ B1 ∩B2, where B1 ∩B2 = B1 ∩ B2 by Theorem 4.22,
there exists λ = (λy | y ∈ N(x)) satisfying {y | λy > 0} ⊆ B1 ∩B2 and (6.71). Such
a λ also satisﬁes (6.72) by the complementarity (Theorem 3.10 (3)), as in the proof
of Theorem 3.29.
## 6.11 Polyhedral M-Convex Functions
As we have seen, M-convex functions on the integer lattice can be extended to
convex functions in real variables. The convex extension of an M-convex function is
a polyhedral convex function when restricted to a ﬁnite interval. Motivated by this
we deﬁne here the concept of M-convexity for polyhedral convex functions in general
and show that major properties of M-convex functions survive in this generalization.
A polyhedral convex function f : RV
→ R ∪ {+∞} with domRf = ∅ is said
to be M-convex if it satisﬁes the following exchange property:
(M-EXC[R]) For x,y ∈ domRf and u ∈ supp+
(x − y), there exist
v ∈ supp−
(x − y) and a positive number α0 ∈ R++ such that
f(x) + f(y) ≥ f(x − α(χu − χv)) + f(y + α(χu − χv))
for all α ∈ [0,α0]R.
Note that, if the inequality above holds for α = α0, it holds for all α ∈ [0,α0]R by
convexity of f. With the notation
f
(z;v,u) = f
(z;χv − χu) (z ∈ domf;u,v ∈ V ) (6.73)
for directional derivatives (see (3.24)), (M-EXC[R]) can be rewritten as follows:
(M-EXC
[R]) For x,y ∈ domRf,
max
u∈supp+(x−y)
min
v∈supp−(x−y)
[f
(x;v,u) + f
(y;u,v)] ≤ 0. (6.74)
We denote by M[R → R] the set of polyhedral M-convex functions. Polyhedral
M-concave functions are deﬁned in an obvious way.
An M-convex function on integer points naturally induces a polyhedral M-
convex function via convex extension (which exists by Theorem 6.42).sidca00si
2013/2/12
page 161
6.11. Polyhedral M-Convex Functions 161
Theorem 6.45. The convex extension f of an M-convex function f ∈ M[Z → R]
on the integer lattice is a polyhedral M-convex function, i.e., f ∈ M[R → R],
provided that f is polyhedral.
Proof. The proof is given later in Note 8.8.
Example 6.46. The convex extension f of an M-convex function f ∈ M[Z → R]
may consist of an inﬁnite number of linear pieces, in which case f is not polyhedral
convex. For example, we have f ∈ M[Z → R] and f / ∈ M[R → R] for f : Z2
→
R ∪ {+∞} deﬁned by
f(x) =

x(1)
2
(x(1) + x(2) = 0),
+∞ (otherwise).
It is worth noting that, if domZf is bounded, f is polyhedral and therefore f ∈
M[R → R] by Theorem 6.45.
We now deﬁne integrality for polyhedral convex functions in general. By
an integral polyhedral convex function we mean a polyhedral convex function f
such that
argminf[−p] is an integral polyhedron for every p ∈ RV
. (6.75)
We say that a polyhedral convex function f has dual integrality, or is a dual-integral
polyhedral convex function, if its conjugate function f•
has integrality (6.75). Since
argminf•
[−x] = ∂Rf(x), as in (3.30), f has dual integrality if and only if
∂Rf(x) is an integral polyhedron for every x ∈ domRf. (6.76)
We denote by C[Z|R → R] and C[R → R|Z] the sets of univariate polyhedral
convex functions with integrality (6.75) and dual integrality (6.76), respectively.
Polyhedral M-convex functions with integrality (6.75) are referred to as inte-
gral polyhedral M-convex functions, the set of which is denoted by M[Z|R → R].
Polyhedral M-convex functions with dual integrality (6.76) are referred to as dual-
integral polyhedral M-convex functions, the set of which is denoted by M[R → R|Z].
By Theorems 6.45 and 6.43, an integral polyhedral M-convex function is noth-
ing but a polyhedral M-convex function that can be obtained as the convex extension
of an M-convex function on integer points. Therefore, we have
M[Z|R → R] ⊆ M[R → R], M[Z|R → R] → M[Z → R], (6.77)
where the second expression means that there exists an injection from M[Z|R → R]
to M[Z → R], representing an embedding of M[Z|R → R] into M[Z → R].
The eﬀective domain of a polyhedral M-convex function is an M-convex poly-
hedron lying on a hyperplane {x ∈ RV
| x(V ) = r} for some r ∈ R. Hence,
polyhedral M
-convex functions can be deﬁned as the projection of polyhedral M-
convex functions, just as M
-convex functions on integer points are deﬁned fromsidca00si
2013/2/12
page 162
## 162 Chapter 6. M-Convex Functions
M-convex functions via (6.4). We denote by M
[R → R] the set of polyhedral
M
-convex functions and by M
[Z|R → R] the set of integral polyhedral M
-convex
functions. The relationship between M and M
is described by Mn ⊂ M
n ≃ Mn+1,
where Mn and M
n denote, respectively, the sets of polyhedral M-convex functions
and polyhedral M
-convex functions in n variables.
The following are the R-counterparts of (M
-EXC[Z]) and (M
-EXC
[Z]):
(M
-EXC[R]) For x,y ∈ domRf and u ∈ supp+
(x − y), there exist
v ∈ supp−
(x − y) ∪ {0} and a positive number α0 ∈ R++ such that
f(x) + f(y) ≥ f(x − α(χu − χv)) + f(y + α(χu − χv))
for all α ∈ [0,α0]R,
where χ0 = 0.
(M
-EXC
[R]) For x,y ∈ domRf,
max
u∈supp+(x−y)
min
v∈supp−(x−y)∪{0}
[f
(x;v,u) + f
(y;u,v)] ≤ 0, (6.78)
where
f
(x;0,u) = f
(x;−χu), f
(y;u,0) = f
(y;χu).
Theorem 6.47. For a polyhedral convex function f : RV
→ R ∪ {+∞} with
domRf = ∅, we have
polyhedral M
-convexity ⇐⇒ (M
-EXC[R]) ⇐⇒ (M
-EXC
[R]).
Theorem 6.48. A polyhedral M-convex function is polyhedral M
-convex. Con-
versely, a polyhedral M
-convex function is polyhedral M-convex if and only if the
eﬀective domain is contained in {x ∈ RV
| x(V ) = r} for some r ∈ R.
Almost all properties of M-convex functions on integer points carry over to
polyhedral M-convex functions. To be speciﬁc, Theorems 6.13, 6.15, 6.19, and 6.26
and Proposition 6.29 are adapted as follows. Note, however, that the proofs are not
straightforward adaptations; see Murota–Shioura [152].
For a subset U ⊆ V , the restriction fU : RU
→ R ∪ {+∞}, the projection
fU
: RU
→ R ∪ {±∞}, and the aggregation fU∗
: RU
× R → R ∪ {±∞} are
deﬁned similarly to (6.40), (6.41), and (6.42). Note in Theorem 6.49 (2) below that
a scaling factor β is allowed, unlike in the discrete case (cf. Note 6.18).
Theorem 6.49. Let f,f1,f2 ∈ M[R → R] be polyhedral M-convex functions.
(1) For λ ∈ R++, λf is polyhedral M-convex.
(2) For a ∈ RV
and β ∈ R \ {0}, f(a + βx) is polyhedral M-convex in x.
(3) For p ∈ RV
, f[−p] is polyhedral M-convex.sidca00si
2013/2/12
page 163
6.11. Polyhedral M-Convex Functions 163
(4) For ϕv ∈ C[R → R] (v ∈ V ),
˜ f(x) = f(x) +

v∈V
ϕv(x(v)) (x ∈ RV
) (6.79)
is polyhedral M-convex provided domR
˜ f = ∅.
(5) For a,b ∈ (R ∪ {±∞})V
, the restriction f[a,b] to the real interval [a,b] is
polyhedral M-convex provided domRf[a,b] = ∅.
(6) For U ⊆ V , the restriction fU is polyhedral M-convex provided domRfU
= ∅.
(7) For U ⊆ V , the aggregation fU∗
is polyhedral M-convex provided
fU∗
> −∞.
(8) The inﬁmal convolution ˜ f = f12f2 is polyhedral M-convex provided
˜ f > −∞.
Theorem 6.50. Let f,f1,f2 ∈ M
[R → R] be polyhedral M
-convex functions.
(1) Operations (1)–(8) of Theorem 6.49 are valid for polyhedral M
-convex
functions.
(2) For U ⊆ V , the projection fU
is polyhedral M
-convex provided fU
> −∞.
Theorem 6.51. A polyhedral M
-convex function f ∈ M
[R → R] is supermodu-
lar; i.e.,
f(x) + f(y) ≤ f(x ∨ y) + f(x ∧ y) (x,y ∈ RV
).
Theorem 6.52 (M-optimality criterion).
(1) For a polyhedral M-convex function f ∈ M[R → R] and x ∈ domRf, we
have
f(x) ≤ f(y) (∀y ∈ RV
) ⇐⇒ f
(x;−χu + χv) ≥ 0 (∀u,v ∈ V ).
(2) For a polyhedral M
-convex function f ∈ M
[R → R] and x ∈ domRf,
we have
f(x) ≤ f(y) (∀y ∈ RV
) ⇐⇒

f
(x;−χu + χv) ≥ 0 (∀u,v ∈ V ),
f
(x;±χv) ≥ 0 (∀v ∈ V ).
Proposition 6.53. Let f ∈ M[R → R] be a polyhedral M-convex function. For
any p ∈ RV
, argminf[−p] is an M-convex polyhedron if it is not empty.
The property in Proposition 6.53 characterizes polyhedral M-convexity, to be
shown in Theorem 6.63.
Note 6.54. Here are two remarks on α0 in (M-EXC[R]). First, for an integral
polyhedral M-convex function f ∈ M[Z|R → R], we can take α0 = 1. Second,
if (M-EXC[R]) is true at all, we can take α0 = 1
2(x(u) − y(u))/|supp−
(x − y)|
independently of f; see Murota–Shioura [152] for the proof.sidca00si
2013/2/12
page 164
## 164 Chapter 6. M-Convex Functions
Note 6.55. The proviso fU∗
> −∞ in Theorem 6.49 (7) can be weakened to
fU∗
(x0) > −∞ for some x0. The same can be said for ˜ f > −∞ in Theorem 6.49
(8) and fU
> −∞ in Theorem 6.50 (2).
## 6.12 Positively Homogeneous M-Convex Functions
There exists a one-to-one correspondence between positively homogeneousM-convex
functions and distance functions satisfying the triangle inequality.
We denote by 0M[R → R] the set of polyhedral M-convex functions that
are positively homogeneous in the sense of (3.32) and by 0M[Z|R → R] the set of
integral polyhedral M-convex functions that are positively homogeneous. Also we
denote by 0M[Z → R] the set of M-convex functions f ∈ M[Z → R] on integer
points such that the convex extensions f are positively homogeneous.
These three families of functions can be identiﬁed with each other, i.e.,
0M[Z → R] ≃ 0M[Z|R → R] = 0M[R → R], (6.80)
by the following proposition. We introduce yet another notation, 0M[Z → Z], for
the set of integer-valued functions belonging to 0M[Z → R].
Proposition 6.56.
(1) 0M[Z|R → R] = 0M[R → R].
(2) The convex extension of a function in 0M[Z → R] belongs to 0M[R → R].
Proof. (1) Take f ∈ 0M[R → R]. For any p ∈ RV
, argminf[−p] is a cone that is
an M-convex polyhedron (or empty) by Proposition 6.53. Hence, argminf[−p] =
B(ρ) for a {0,+∞}-valued submodular set function ρ; see section 4.8. This shows
the integrality of argminf[−p], and therefore f ∈ 0M[Z|R → R].
(2) Take f ∈ 0M[Z → R]. Since f is integrally convex and f is positively
homogeneous, f can be represented as the maximum of a ﬁnite number of linear
functions. Hence, f is polyhedral and f ∈ M[R → R] by Theorem 6.45.
A positively homogeneous M-convex function f induces a distance function
γ = γf satisfying the triangle inequality by
γf(u,v) = f(χv − χu) (u,v ∈ V ). (6.81)
More precisely, we have the following, where T [R] and T [Z] denote respectively the
sets of real-valued and integer-valued distance functions with the triangle inequality.
Proposition 6.57.
(1) For f ∈ 0M[R → R], we have γf ∈ T [R].
(2) For f ∈ 0M[Z → Z], we have γf ∈ T [Z].
Proof. For (1) we apply (M-EXC[R]) to x = χv3 −χv2 , y = χv2 −χv1, and u = v1,
where we can take α = 1 by Proposition 6.56 (1) and Note 6.54. This yields the
triangle inequality (5.2). For (2) we use (M-EXC[Z]) in a similar manner.sidca00si
2013/2/12
page 165
6.12. Positively Homogeneous M-Convex Functions 165
Conversely, a distance function satisfying the triangle inequality induces a
positively homogeneous M-convex function. For γ ∈ T [R], we deﬁne γ̂ : RV
→
R ∪ {+∞} by
γ̂(x) = inf
λ
⎧
⎨
⎩

u,v∈V
λuvγ(u,v)
)
)
)
)
)
)

u,v∈V
λuv(χv − χu) = x, λuv ∈ R+ (u,v ∈ V )
⎫
⎬
⎭
,
(6.82)
which is called the extension of γ. Proposition 5.1 as well as its proof shows
γ̂(χv − χu) = γ(u,v) (u,v ∈ V ), (6.83)
γ̂(x) = sup{ p,x | p ∈ D(γ)} (x ∈ RV
), (6.84)
where D(γ) is the L-convex polyhedron (5.4) associated with γ. Denote by γ̂Z :
ZV
→ R ∪ {+∞} the restriction of γ̂ to ZV
, and note that for x ∈ ZV
we may
assume λuv ∈ Z+ in (6.82), as is explained in the proof of Proposition 5.1.
Proposition 6.58.
(1) For γ ∈ T [R], we have γ̂ ∈ 0M[R → R].
(2) For γ ∈ T [Z], we have γ̂Z ∈ 0M[Z → Z].
Proof. Expression (6.82) is a special case of the M-convex function (2.37) appearing
in network ﬂow problems (section 2.2), where T = V , A = {a = (u,v) | u,v ∈ V ;u =
v}, and fuv(ξ) = γ(u,v)ξ (for ξ ≥ 0) and +∞ (for ξ < 0). See also Note 2.19.
The next theorem shows a one-to-one correspondence between positively ho-
mogeneous M-convex functions and distance functions satisfying the triangle in-
equality.
Theorem 6.59. For 0M = 0M[R → R] and T = T [R], the mappings Φ : 0M →
T and Ψ : T → 0M deﬁned by
Φ : f → γf in (6.81), Ψ : γ → γ̂ in (6.82)
are inverse to each other, establishing a one-to-one correspondence between 0M and
T . The same statement is true for 0M = 0M[Z → Z] and T = T [Z].
Proof. For γ ∈ T , we have Ψ(γ) ∈ 0M by Proposition 6.58 and Φ ◦ Ψ(γ) = γ by
(6.83). For f ∈ 0M, we have Φ(f) ∈ T by Proposition 6.57. Since f is a positively
homogeneous convex function, we have
f(x) = f
⎛
⎝

u,v∈V
λuv(χv − χu)
⎞
⎠ ≤

u,v∈V
λuvf(χv − χu)
whenever u,v∈V λuv(χv − χu) = x and λuv ≥ 0 (u,v ∈ V ). This implies f ≤
Ψ ◦ Φ(f). In the case of 0M = 0M[Z → Z] and T = T [Z], the opposite inequalitysidca00si
2013/2/12
page 166
## 166 Chapter 6. M-Convex Functions
f ≥ Ψ◦Φ(f) is given by Proposition 6.25, whereas, in the case of 0M = 0M[R → R]
and T = T [R], the inequality can be established by an argument similar to the proof
of Proposition 6.23.
## 6.13 Directional Derivatives and Subgradients
Directional derivatives and subgradients of M-convex functions are considered in this
section. For a polyhedral M-convex function f, the directional derivative f
(x;d)
is a positively homogeneous M-convex function in d, and the subgradients of f
at a point form an L-convex polyhedron. Furthermore, each of these properties
characterizes M-convexity.
We start with directional derivatives of a polyhedral M-convex function f ∈
M[R → R]. Recall from (3.25) that, for each x ∈ domRf, there exists ε > 0 such
that
f(x + d) − f(x) = f
(x;d) (||d||1 ≤ ε). (6.85)
Proposition 6.60. For f ∈ M[R → R] and x ∈ domRf, we have f
(x;·) ∈
0M[R → R].
Proof. By (6.85), f
(x;·) has the exchange property in the neighborhood of d = 0.
Then the claim follows from the positive homogeneity of f
(x;·).
For a function f : ZV
→ R ∪ {+∞} and a point x ∈ domZf, we deﬁne
∂Rf(x) = {p ∈ RV
| f(y) − f(x) ≥ p,y − x (∀y ∈ ZV
)} (6.86)
and call it the subdiﬀerential of f at x (cf. (3.23)). An element of ∂Rf(x) is called
a subgradient of f at x. If f is convex extensible, we have
∂Rf(x) = ∂Rf(x) (x ∈ domZf), (6.87)
where f is the convex extension of f. The set of integer-valued subgradients
∂Zf(x) = ∂Rf(x) ∩ ZV
(6.88)
is called the integer subdiﬀerential of f at x ∈ domZf.
Directional derivatives and subdiﬀerentials of M-convex functions are given
as follows. It is recalled that L0[R], L0[Z|R], L0[Z], and M[R → R|Z] denote,
respectively, the sets of L-convex polyhedra, integral L-convex polyhedra, L-convex
sets, and dual-integral polyhedral M-convex functions. Also recall the deﬁnition of
γ̂ in (6.82).
Theorem 6.61.
(1) For f ∈ M[R → R] and x ∈ domRf, deﬁne γf,x(u,v) = f
(x;−χu + χv)
(u,v ∈ V ). Then
γf,x ∈ T [R], ∂Rf(x) = D(γf,x) ∈ L0[R], f
(x;·) = γ̂f,x(·),sidca00si
2013/2/12
page 167
6.13. Directional Derivatives and Subgradients 167
and ∂Rf(x) = ∅ in particular. If f ∈ M[R → R|Z], then
γf,x ∈ T [Z], ∂Rf(x) ∈ L0[Z|R].
(2) For f ∈ M[Z → R] and x ∈ domZf, deﬁne γf,x(u,v) = f(x−χu +χv)−
f(x) (u,v ∈ V ). Then
γf,x ∈ T [R], ∂Rf(x) = D(γf,x) ∈ L0[R], f

(x;·) = γ̂f,x(·),
and ∂Rf(x) = ∅ in particular. If f ∈ M[Z → Z], then
γf,x ∈ T [Z], ∂Rf(x) ∈ L0[Z|R], ∂Zf(x) ∈ L0[Z], ∂Rf(x) = ∂Zf(x),
and ∂Zf(x) = ∅ in particular.
Proof. (1) Proposition 6.60 shows f
(x;·) ∈ 0M[R → R], from which follows
γf,x ∈ T [R] by Proposition 6.57. By the deﬁnition of a subdiﬀerential and Theorem
6.52 (M-optimality criterion) we see
p ∈ ∂Rf(x) ⇐⇒ f(x + d) − f(x) ≥ p,d (∀d ∈ RV
)
⇐⇒ f
(x;−χu + χv) ≥ p,−χu + χv (∀u,v ∈ V )
⇐⇒ p(v) − p(u) ≤ γf,x(u,v) (∀u,v ∈ V )
⇐⇒ p ∈ D(γf,x).
We have D(γf,x) ∈ L0[R] by (5.18) and f
(x;·) = γ̂f,x(·) by (3.31), (3.33), and
(6.84). If f ∈ M[R → R|Z], ∂Rf(x) is an integral polyhedron by (6.76) and
γf,x(u,v) = sup{p(v) − p(u) | p ∈ ∂Rf(x)} ∈ Z.
(2) Applying (M-EXC[Z]) to x + χv3 − χv2 , x + χv2 − χv1 , and u = v1 shows
the triangle inequality (5.2), and hence γf,x ∈ T [R]. The rest of the proof is similar
to (1), where we use Theorem 6.26 (1) instead of Theorem 6.52 and Theorem 5.5
instead of (5.18).
The following fact shows the consistency of (1) and (2) in Theorem 6.61.
Proposition 6.62. For f ∈ M[Z|R → R] and x ∈ domRf ∩ ZV
, we have
f
(x;−χu + χv) = f(x − χu + χv) − f(x) for u,v ∈ V .
Proof. This follows from integrality (6.75) and (4.40).
The following theorem aﬀords characterizations of polyhedral M-convex func-
tions in terms of the M-convexity of directional derivatives, the L-convexity of sub-
diﬀerentials, and the M-convexity of minimizers.
Theorem 6.63. For a polyhedral convex function f : RV
→ R ∪ {+∞} with
domRf = ∅, the four conditions (a), (b), (c), and (d) below are equivalent.
(a) f ∈ M[R → R].sidca00si
2013/2/12
page 168
## 168 Chapter 6. M-Convex Functions
-
x
6 Y
Y = f(x)
Figure 6.3. Quasi-convex function.
(b) f
(x;·) ∈ 0M[R → R] for every x ∈ domRf.
(c) ∂Rf(x) ∈ L0[R] for every x ∈ domRf.
(d) argminf[−p] ∈ M0[R] for every p ∈ RV
with inf f[−p] > −∞.
Proof. (a) ⇒ (b) is by Proposition 6.60, (a) ⇒ (c) by Theorem 6.61, and (a) ⇒
(d) by Proposition 6.53. The rest is proved later in Note 8.7.
An integrality consideration in the equivalence of (a) and (d) in the above
theorem yields a characterization of integral polyhedral M-convex functions.
Theorem 6.64. For a polyhedral convex function f : RV
→ R ∪ {+∞} with
domRf = ∅, the two conditions (a) and (d) below are equivalent.
(a) f ∈ M[Z|R → R].
(d) argminf[−p] ∈ M0[Z|R] for every p ∈ RV
with inf f[−p] > −∞.
Note 6.65. By Theorem 6.61 we can identify ˇ f(x,y) in Proposition 6.25 as the
directional derivative of the convex extension f of f ∈ M[Z → R]. That is, we
have ˇ f(x,y) = f

(x;y − x).
## 6.14 Quasi M-Convex Functions
Quasi M-convex functions are introduced as a generalization of M-convex functions.
The optimality criterion and the proximity theorem survive in this generalization.
A function f : Rn
→ R ∪ {+∞} is said to be quasi convex if it satisﬁes
max{f(x),f(y)} ≥ f(λx + (1 − λ)y) (6.89)
whenever x,y ∈ domRf and 0 < λ < 1 and semistrictly quasi convex if
max{f(x),f(y)} > f(λx + (1 − λ)y) (6.90)
whenever x,y ∈ domRf, f(x) = f(y), and 0 < λ < 1. See Fig. 6.3 for an illustration
of a (semistrictly) quasi-convex function.sidca00si
2013/2/12
page 169
6.14. Quasi M-Convex Functions 169
Quasi convexity is ordinal convexity in the sense that the deﬁnition involves no
addition of function values, but relies only on comparisons. In this connection note
that, if f(x) is convex and ϕ is a nondecreasing function representing a nonlinear
scaling, then ϕ(f(x)) is quasi convex.
Quasi-convex functions enjoy the following nice properties:
• A strict local minimum of a quasi-convex function is a strict global minimum.
• A local minimum of a semistrictly quasi-convex function is a global minimum.
• Level sets of quasi-convex functions are convex sets.
Due to these properties, quasi convexity also plays an important role in continuous
optimization (see, e.g., Avriel–Diewert–Schaible–Zang [5]).
The concept of quasi M-convexity is deﬁned for a function f : ZV
→ R∪{+∞}
as follows. Recall the exchange axiom for M-convex functions:
(M-EXC[Z]) For x,y ∈ domf and u ∈ supp+
(x − y), there exists
v ∈ supp−
(x − y) satisfying
Δf(x;v,u) + Δf(y;u,v) ≤ 0. (6.91)
The sign patterns of Δf(x;v,u) and Δf(y;u,v) compatible with (implied by) in-
equality (6.91) are as follows:
Δf(x;v,u) \ Δf(y;u,v) − 0 +
− # # #
0 # # ×
+ # × ×
Here # and × denote possible and impossible cases, respectively. Relaxing con-
dition (6.91) to compatible sign patterns leads to two versions of quasi M-convex
functions. We say that a function f : ZV
→ R ∪ {+∞} with domf = ∅ is quasi
M-convex if it satisﬁes the following:
(QM) For x,y ∈ domf and u ∈ supp+
(x − y), there exists v ∈
supp−
(x − y) satisfying
Δf(x;v,u) ≤ 0 or Δf(y;u,v) ≤ 0.
Similarly, a function f : ZV
→ R ∪ {+∞} with domf = ∅ is semistrictly quasi
M-convex if it satisﬁes the following:
(SSQM) For x,y ∈ domf and u ∈ supp+
(x − y), there exists v ∈
supp−
(x − y) satisfying
Δf(x;v,u) < 0 or Δf(y;u,v) < 0 or Δf(x;v,u) = Δf(y;u,v) = 0.sidca00si
2013/2/12
page 170
## 170 Chapter 6. M-Convex Functions
Example 6.66. A quasi M-convex function arises from a nonlinear scaling of an
M-convex function. For an M-convex function f : ZV
→ R∪{+∞} and a function
ϕ : R → R ∪ {+∞}, deﬁne ˜ f : ZV
→ R ∪ {+∞} by
˜ f(x) =

ϕ(f(x)) (x ∈ domf),
+∞ (x / ∈ domf).
(6.92)
Then ˜ f satisﬁes (QM) if ϕ is nondecreasing and (SSQM) if ϕ is strictly increasing.
The following weaker variants of (QM) and (SSQM) turn out to be useful for
our subsequent discussion:
(QMw) For distinct x,y ∈ domf, there exist u ∈ supp+
(x − y) and
v ∈ supp−
(x − y) satisfying
Δf(x;v,u) ≤ 0 or Δf(y;u,v) ≤ 0.
(SSQMw) For distinct x,y ∈ domf, there exist u ∈ supp+
(x − y) and
v ∈ supp−
(x − y) satisfying
Δf(x;v,u) < 0 or Δf(y;u,v) < 0 or Δf(x;v,u) = Δf(y;u,v) = 0.
The property (QMw) can be expressed in two alternative forms below. The
ﬁrst (6.93) may be regarded as a variant of (6.89) with discreteness in direction,
and the second (6.94) is similar to (6.50) in section 6.6.
Theorem 6.67. For f : ZV
→ R ∪ {+∞}, (QMw) is equivalent to each of the
following conditions:
max{f(x),f(y)} ≥ min
u∈supp+(x−y)
min
v∈supp−(x−y)
{f(x − χu + χv),f(y + χu − χv)}
(∀x,y ∈ domf with x = y), (6.93)
f(x) ≥ min
u∈supp+(x−y)
min
v∈supp−(x−y)
f(x − χu + χv)
(∀x,y ∈ domf with x = y,f(x) ≥ f(y)). (6.94)
Proof. Obviously, (6.94) implies (QMw) and (6.93). We prove (QMw) =⇒ (6.94)
and (6.93) =⇒ (6.94) by induction on ||x − y||1. Suppose x,y ∈ domf and f(x) ≥
f(y); we may assume ||x−y||1 > 2. If (QMw) is true, there exist some u ∈ supp+
(x−
y) and v ∈ supp−
(x − y) such that Δf(x;v,u) ≤ 0 or Δf(y;u,v) ≤ 0; in the latter
case the induction hypothesis for x and y
= y+χu −χv yields Δf(x;v
,u
) ≤ 0 for
some u
∈ supp+
(x − y
) ⊆ supp+
(x − y) and v
∈ supp−
(x − y
) ⊆ supp−
(x − y).
If (6.93) is true, there exist u ∈ supp+
(x − y) and v ∈ supp−
(x − y) such that
Δf(x;v,u) ≤ 0 or f(y + χu − χv) ≤ f(x); in the latter case we have f(x) ≥ f(y
)
for y
= y +χu − χv and the induction hypothesis yields Δf(x;v
,u
) ≤ 0 for some
u
∈ supp+
(x − y
) ⊆ supp+
(x − y) and v
∈ supp−
(x − y
) ⊆ supp−
(x − y).sidca00si
2013/2/12
page 171
6.14. Quasi M-Convex Functions 171
The relationship among various versions of quasi M-convex functions is sum-
marized as follows. The second statement below shows that all the conditions are
equivalent for f if they are imposed on every perturbation of f by a linear function.
Theorem 6.68. For f : ZV
→ R ∪ {+∞} the following implications hold true.
(1)
(M-EXC[Z]) =⇒ (SSQM) =⇒ (QM)
! ⇓ ⇓
(M-EXCw[Z]) =⇒ (SSQMw) =⇒ (QMw)
(2) f satisﬁes (M-EXC[Z]) ⇐⇒ ∀p ∈ RV
: f[p] satisﬁes (QMw).
Proof. (1) The equivalence of (M-EXC[Z]) and (M-EXCw[Z]) is due to Theorem
6.5. The remaining implications are obvious.
(2) Combining Theorems 6.72 and 6.74 below establishes this.
The quasi M-convexity of a set B ⊆ ZV
can be deﬁned as the quasi M-
convexity of the indicator function δB : ZV
→ {0,+∞}. The properties (QM) and
(QMw) for δB correspond respectively to the following properties of B:
(Q-EXC) For x,y ∈ B and u ∈ supp+
(x−y), there exists v ∈ supp−
(x−
y) such that x − χu + χv ∈ B or y + χu − χv ∈ B.
(Q-EXCw) For distinct x,y ∈ B, there exist u ∈ supp+
(x − y) and
v ∈ supp−
(x − y) such that x − χu + χv ∈ B or y + χu − χv ∈ B.
Proposition 6.69. A set B ⊆ ZV
satisﬁes (Q-EXCw) if and only if, for distinct
x,y ∈ B, there exist u ∈ supp+
(x−y) and v ∈ supp−
(x−y) with x−χu +χv ∈ B.
Proof. Theorem 6.67 for f = δB reduces to this statement.
Proposition 6.70. For a set B ⊆ ZV
satisfying (Q-EXCw), we have x(V ) = y(V )
for any x,y ∈ B.
Proof. The proof is easy (similar to that of Proposition 4.1).
Example 6.71. Whereas we have the obvious implications (B-EXC[Z]) ⇒ (Q-
EXC) ⇒ (Q-EXCw), these conditions are not equivalent. For instance,
B1 = {χS | S = {1,2},{2,3},{3,4}}
satisﬁes (Q-EXC) and not (B-EXC[Z]), and
B2 = {χS | S = {1,2,3},{2,3,4},{3,4,5},{4,5,6}}
satisﬁes (Q-EXCw) and not (Q-EXC).sidca00si
2013/2/12
page 172
## 172 Chapter 6. M-Convex Functions
The weaker version (QMw) of quasi M-convexity for functions can be charac-
terized by the corresponding quasi M-convexity (Q-EXCw) of level sets. For any
α ∈ R ∪ {+∞}, the level set is deﬁned as
L(f,α) = {x ∈ ZV
| f(x) ≤ α}. (6.95)
Note that L(f,+∞) = domf and L(f,α0) = argminf for α0 = minf.
Theorem 6.72. A function f : ZV
→ R ∪ {+∞} satisﬁes (QMw) if and only if
the level set L(f,α) satisﬁes (Q-EXCw) for all α ∈ R.
Proof. [“only if”]: Let x and y be distinct elements of L(f,α). By (QMw), we have
Δf(x;v,u) ≤ 0 or Δf(y;u,v) ≤ 0 for some u ∈ supp+
(x−y) and v ∈ supp−
(x−y).
Then, x − χu + χv ∈ L(f,α) or y + χu − χv ∈ L(f,α).
[“if”]: For any distinct x,y ∈ domf with f(x) ≥ f(y), we have x−χu +χv ∈
L(f,f(x)) for some u ∈ supp+
(x − y) and v ∈ supp−
(x − y) by (Q-EXCw) and
Proposition 6.69. Hence f(x − χu + χv) ≤ f(x).
Proposition 6.73. If f satisﬁes (QMw), then domf satisﬁes (Q-EXCw).
Proof. In the proof of “only if” of Theorem 6.72, replace L(f,α) with domf.
An M-convex function can be characterized by quasi M-convexity of level sets
of perturbed functions.
Theorem 6.74. A function f : ZV
→ R∪{+∞} satisﬁes (M-EXC[Z]) if and only
if the level set L(f[p],α) satisﬁes (Q-EXCw) for all p ∈ RV
and α ∈ R.
Proof. The “only if” part follows from Theorem 6.72. To prove the “if” part,
we ﬁrst observe that Theorem 6.4 can be strengthened to a statement that (M-
EXC[Z]) and (M-EXCloc[Z]) are equivalent if domf satisﬁes (Q-EXCw). (This can
be shown by modifying the proof of Claim 2 in the proof of Theorem 6.4.) Note that
(Q-EXCw) holds for domf by Theorem 6.72 and Proposition 6.73. To show (M-
EXCloc[Z]), take x,y ∈ domf with ||x−y||1 = 4 and put y = x−χu1 −χu2 +χv1 +χv2
with u1,u2,v1,v2 ∈ V and {u1,u2} ∩ {v1,v2} = ∅. In the following we assume
u1 = u2 and v1 = v2 (the other cases can be treated similarly). Consider a bipartite
graph G = (V +
,V −
;E) with vertex bipartition V +
= {u1,u2}, V −
= {v1,v2} and
arc set E = {(ui,vj) | Δf(x;vj,ui) < +∞ (i,j = 1,2)}.
Claim 1: G has a perfect matching (of size 2).
(Proof of Claim 1) It suﬃces to show that every vertex has an edge incident
to it. Take p ∈ RV
such that p(u1) + p(u2) − p(v1) − p(v2) = f(y) − f(x) and
p(vj) > p(u1)−Δf(x;vj,u1) for j = 1,2 (and p(v) = 0 for v ∈ V \{u1,u2,v1,v2}).
Then f[p](x) = f[p](y) < f[p](x − χu1 + χvj ) for j = 1,2. By (Q-EXCw) for
L(f[p],f[p](x)) we have f[p](x − χu2 + χvj ) ≤ f[p](x) < +∞ for some j ∈ {1,2}.
Hence there is an edge incident to u2, and similarly for other vertices.
Claim 2: Inequality (6.11) is satisﬁed.sidca00si
2013/2/12
page 173
6.14. Quasi M-Convex Functions 173
(Proof of Claim 2) By Claim 1 we may assume {(u1,v1),(u2,v2)} ⊆ E. We can
take p ∈ RV
such that f[p](x) = f[p](y) and f[p](x−χu1 +χv1) = f[p](x−χu2 +χv2 )
(and p(v) = 0 for v ∈ V \{u1,u2,v1,v2}). If {(u1,v2),(u2,v1)} ⊆ E, we can choose
p satisfying an additional condition f[p](x − χu1 + χv2 ) = f[p](x− χu2 + χv1 ), and
then (Q-EXCw) for L(f[p],f[p](x)) yields (6.11). If (u1,v2) ∈ E and (u2,v1) / ∈ E,
we can choose p satisfying an additional condition f[p](x) < f[p](x − χu1 + χv2 ),
and then (Q-EXCw) for L(f[p],f[p](x)) yields (6.11). The remaining cases are
similar.
Next we turn to the minimization of quasi M-convex functions. The following
properties, respectively weaker than (SSQM) and (SSQMw), turn out to be relevant.
(SSQM=
) For x,y ∈ domf with f(x) = f(y) and u ∈ supp+
(x − y),
there exists v ∈ supp−
(x − y) satisfying
Δf(x;v,u) < 0 or Δf(y;u,v) < 0 or Δf(x;v,u) = Δf(y;u,v) = 0.
(SSQM=
w) For x,y ∈ domf with f(x) = f(y), there exist u ∈ supp+
(x−
y) and v ∈ supp−
(x − y) satisfying
Δf(x;v,u) < 0 or Δf(y;u,v) < 0 or Δf(x;v,u) = Δf(y;u,v) = 0.
The property (SSQM=
w) can be expressed in two alternative forms below. The
ﬁrst (6.96) may be regarded as a variant of (6.90) with discreteness in direction,
and the second (6.97) is identical to (6.50) in section 6.6.
Theorem 6.75. For f : ZV
→ R ∪ {+∞}, (SSQM=
w) is equivalent to each of the
following conditions:
max{f(x),f(y)} > min
u∈supp+(x−y)
min
v∈supp−(x−y)
{f(x − χu + χv),f(y + χu − χv)}
(∀x,y ∈ domf with f(x) = f(y)), (6.96)
f(x) > min
u∈supp+(x−y)
min
v∈supp−(x−y)
f(x − χu + χv)
(∀x,y ∈ domf with f(x) > f(y)). (6.97)
Proof. The proof is much the same as that for Theorem 6.67.
Global optimality (minimality) for a quasi M-convex function is characterized
by local optimality.
Theorem 6.76 (Quasi M-optimality criterion).
(1) For f : ZV
→ R ∪ {+∞} satisfying (QMw) and x ∈ domf, we have
f(x) < f(y) (∀y ∈ ZV
\ {x}) ⇐⇒ Δf(x;v,u) > 0 (∀u,v ∈ V,u = v).
(2) For f : ZV
→ R ∪ {+∞} satisfying (SSQM=
w) and x ∈ domf, we have
f(x) ≤ f(y) (∀y ∈ ZV
) ⇐⇒ Δf(x;v,u) ≥ 0 (∀u,v ∈ V ).sidca00si
2013/2/12
page 174
## 174 Chapter 6. M-Convex Functions
Proof. It suﬃces to show ⇐. (1) is immediate from (6.94) in Theorem 6.67 and
(2) is from (6.97) in Theorem 6.75.
The minimizer cut theorem (Theorem 6.28) for M-convex functions can be
generalized for quasi M-convex functions.
Theorem 6.77 (Quasi M-minimizer cut). Let f : ZV
→ R ∪ {+∞} be a function
with (SSQM=
), and assume argminf = ∅. Then (1), (2), and (3) in Theorem 6.28
hold true.
Proof. The proof of Theorem 6.28 is valid here when (M-EXC[Z]) is replaced with
(SSQM=
).
The proximity theorem for M-convex functions (Theorem 6.37) can be gener-
alized for quasi M-convex functions.
Theorem 6.78 (Quasi M-proximity theorem). Let f : ZV
→ R ∪ {+∞} be a
function with (SSQM=
), n = |V |, and α ∈ Z++. If xα
∈ domf satisﬁes (6.66),
then argminf = ∅ and there exists x∗
∈ argminf with (6.67).
Proof. It suﬃces to show that, for any γ ∈ R with γ > inf f, there exists some
x∗
∈ domf satisfying f(x∗
) ≤ γ and (6.67). Suppose that x∗
∈ domf minimizes
||x∗
−xα
||1 among all vectors satisfying f(x∗
) ≤ γ. In the following, we ﬁx v ∈ V and
prove xα
(v)−x∗
(v) ≤ (n−1)(α−1). (The inequality x∗
(v)−xα
(v) ≤ (n−1)(α−1)
can be shown similarly.) We may assume xα
(v) > x∗
(v). Put
S =
⎧
⎪ ⎪ ⎨
⎪ ⎪ ⎩
y ∈ domf
)
)
)
)
)
)
)
)
xα
(v) ≥ y(v) ≥ x∗
(v)
xα
(w) ≤ y(w) ≤ x∗
(w) (∀w ∈ supp−
(xα
− x∗
))
xα
(u) = y(u) (∀u ∈ V \ ({v} ∪ supp−
(xα
− x∗
))
xα
(V ) = y(V )
⎫
⎪ ⎪ ⎬
⎪ ⎪ ⎭
.
Claim 1: For y ∈ argmin{f(y
) | y
∈ S}, we have y(v) = x∗
(v).
(Proof of Claim 1) Suppose that y(v) > x∗
(v). From the deﬁnition of x∗
we
have f(y) > f(x∗
). By (SSQM=
) for y, x∗
, and v ∈ supp+
(y−x∗
) ⊆ supp+
(xα
−x∗
),
there exists w ∈ supp−
(y − x∗
) ⊆ supp−
(xα
− x∗
) such that if Δf(x∗
;v,w) > 0
then Δf(y;w,v) < 0. By the choice of x∗
, we have Δf(x∗
;v,w) > 0 and hence
f(y − χv + χw) < f(y). Since y − χv + χw ∈ S, this contradicts the minimality of
f(y). Thus Claim 1 is proved.
Take any y from argmin{f(y
) | y
∈ S}, and represent it as
y = xα
− λχv +

w∈supp−(xα−x∗)
μwχw.
We have λ = xα
(v) − x∗
(v) by Claim 1.
Claim 2: For any w ∈ supp−
(xα
− x∗
) with μw > 0 and μ ∈ [0,μw − 1]Z,
f(xα
− (μ + 1)(χv − χw)) < f(xα
− μ(χv − χw)).sidca00si
2013/2/12
page 175
6.14. Quasi M-Convex Functions 175
(Proof of Claim 2) We prove the claim by induction on μ. For μ ∈ [0,μw −1]Z,
put x
= xα
− μ(χv − χw), and assume x
∈ domf. Note that x
∈ S and x
(v) >
x∗
(v), and hence Claim 1 implies f(x
) > f(y). Since supp−
(y−x
) = {v}, (SSQM=
)
for y, x
, and w ∈ supp+
(y−x
) implies that if Δf(y;v,w) > 0 then Δf(x
;w,v) < 0.
By Claim 1 we have Δf(y;v,w) > 0, from which Claim 2 follows.
Claim 2 and (6.66) imply
f(xα
− μw(χv − χw)) < ··· < f(xα
− (χv − χw)) < f(xα
) ≤ f(xα
− α(χv − χw))
for any w with μw > 0. Hence, μw ≤ α − 1 for any w ∈ supp−
(xα
− x∗
), and
xα
(v) − x∗
(v) = xα
(v) − y(v) = λ =

w∈supp−(xα−x∗)
μw ≤ (n − 1)(α − 1),
where the third equality follows from xα
(V ) = y(V ).
Theorem 6.79 (Quasi M-minimizer cut with scaling). Let f : ZV
→ R ∪ {+∞}
be a function satisfying (SSQM=
) with argminf = ∅, and assume α ∈ Z++ and
n = |V |. Then (1) and (2) in Theorem 6.39 hold true.
Proof. We prove (2), while (1) can be proved similarly. Put xα
= x+α(χv −χu).
We may assume max{x∗
(v) | x∗
∈ argminf} < xα
(v); otherwise we are done. Let
x∗
be an element of argminf with x∗
(v) maximum. The rest of the proof is the
same as the proof of Theorem 6.78 (from Claim 1 until the end).
Bibliographical Notes
The concept of M-convex functions was introduced by Murota [137] and that of
M
-convex functions by Murota–Shioura [151]; Theorems 6.2 and 6.3 are due to
[151].
The local exchange axiom (Theorem 6.4) is given in Murota [137], and the
weak exchange axiom (Theorem 6.5) is explicit in Murota [147].
Quadratic functions of the form (6.23) are treated in Camerini–Conforti–
Naddef [22], and their M
-convexity is observed in Murota–Shioura [151]. Propo-
sition 6.8 (characterization of quadratic M-convex functions) is due to Murota–
Shioura [155]. Quadratic functions deﬁned by symmetric matrices of the form
(6.29), or (6.30), are treated in Hochbaum–Shamir–Shanthikumar [92], and their
M-convexity is noted by A. Shioura. Quasi-separable convex functions (6.32) are
considered by [22], and their M
-convexity is pointed out in [151]. The M
-convexity
of laminar convex functions (6.34) and minimum-value functions (6.36) is due to
Danilov–Koshevoy–Murota [34], [35]. The names laminar convex functions and
minimum-value functions are coined in this book.
The basic operations in section 6.4 are listed in Murota [141], [144], [147].
Theorem 6.13 (8) (inﬁmal convolution) is due to Murota [137], whereas Theorem
6.15 (2) (projection of M
-convex functions) is due to [141]. The scaling operation
for M-convex functions is considered by Moriguchi–Murota–Shioura [133].sidca00si
2013/2/12
page 176
## 176 Chapter 6. M-Convex Functions
The supermodularity of M
-convex functions (Theorem 6.19) is observed by
Murota–Shioura [153]. A special case for valuated matroids was noted earlier by
Dress–Terhalle [40] and Murota [138].
Theorem 6.24 (descent direction) is observed by Murota–Tamura [160] as
a generalization of its special (but essential) case with domf ⊆ {0,1}V
due to
Fujishige–Yang [69]. Proposition 6.25 is in Murota [137], [140], [142].
Theorems on minimizers are of fundamental importance. Theorem 6.26 (M-
optimality criterion) and Theorem 6.30 (characterization by minimizers) are by
Murota [137]. Theorem 6.28 (M-minimizer cut) is by Shioura [190].
The connection to the gross substitutes property was studied almost simulta-
neously by Danilov–Koshevoy–Lang [33], Fujishige–Yang [69], and Murota–Tamura
[160]. The concave version of (6.60) is identical to condition GS in [33]. Proposi-
tions 6.32 and 6.33 and Theorem 6.34 are due to [160], and Proposition 6.35 and
Theorem 6.36 are due to [33].
Results about minimizers under scaling are relatively new. Theorem 6.37
(M-proximity theorem) is by Moriguchi–Murota–Shioura [133]. Theorem 6.39 (M-
minimizer cut with scaling) is by Tamura [197].
The convex extension of M-convex functions has been understood step by
step. Convex extensibility (latter half of Theorem 6.42) and the characterization
by minimizers (Theorem 6.43) are in Murota [137]. Integral convexity (Theorem
6.42) and convex extension for a pair of M-convex functions (Theorem 6.44) are by
Murota–Shioura [153].
Polyhedral M-convex functions are investigated by Murota–Shioura [152], to
which all the theorems in section 6.11 (Theorems 6.45, 6.47, 6.48, 6.49, 6.50, 6.51,
6.52) as well as Proposition 6.53 are ascribed. M-convexity for nonpolyhedral convex
functions is considered in Murota–Shioura [156], [157].
The correspondence between positively homogeneous M-convex functions and
distance functions (Theorem 6.59) is established for the case of Z in Murota [141]
and generalized to the case of R in Murota–Shioura [152]. Proposition 6.56 is stated
in Murota [147].
Theorem 6.61 for directional derivatives and subgradients is shown for the case
of Z in Murota [140], [141] and generalized to the case of R in Murota–Shioura [152].
Theorem 6.63 (characterizations in terms of directional derivatives, subdiﬀerentials,
and minimizers) is by [152], whereas its ramiﬁcation with integrality (Theorem 6.64)
is stated in Murota [147].
The concept of quasi M-convex functions was introduced by Murota–Shioura
[154], to which almost all major results in section 6.14 (Theorems 6.67, 6.68, 6.72,
6.75, 6.76, 6.77, 6.78) are ascribed. Exceptions are Theorem 6.74 (characteriza-
tion of M-convex functions by level sets) by Shioura [191] and Theorem 6.79 (quasi
M-minimizer cut with scaling) by Tamura [197]. Zimmermann [221] considers com-
binatorial optimization problems with quasi-convex objective functions in real vari-
ables.
M-convex functions ﬁnd applications in resource allocation problems (Katoh–
Ibaraki [110], Moriguchi–Shioura [134]), mathematical economics (to be treated in
Chapter 11), and analysis of polynomial matrices (to be treated in Chapter 12).sidca00si
2013/2/12
page 177
Chapter 7
L-Convex Functions
L-convex functions form another class of well-behaved discrete convex functions.
They are deﬁned in terms of an abstract axiom involving submodularity and are
characterized as functions obtained by piecing together L-convex sets in a consistent
way or as collections of submodular set functions with some consistency. Funda-
mental properties of L-convex functions are established in this chapter, including
the local optimality criterion for global optimality, the proximity theorem for mini-
mizers, discrete midpoint convexity, integral convexity, and extensibility to convex
functions. Duality and conjugacy issues are treated in Chapter 8 and algorithms in
Chapter 10.
7.1 L-Convex Functions and L
-Convex Functions
We recall the deﬁnitions of L-convex functions and L
-convex functions from sec-
tion 1.4.1.
A function g : ZV
→ R ∪ {+∞} with domg = ∅ is said to be an L-convex
function if it satisﬁes
(SBF[Z]) g(p) + g(q) ≥ g(p ∨ q) + g(p ∧ q) (∀p,q ∈ ZV
),
(TRF[Z]) ∃r ∈ R such that g(p + 1) = g(p) + r (∀p ∈ ZV
).
(SBF[Z]) is submodularity on the integer lattice and (TRF[Z]) linearity in the di-
rection of 1. Note that we have r ∈ Z if g is integer valued. Also recall the
submodularity inequality
g(p) + g(q) ≥ g(p ∨ q) + g(p ∧ q). (7.1)
We denote by L[Z → R] the set of L-convex functions and by L[Z → Z] the set of
integer-valued L-convex functions.
Since an L-convex function g is linear in the direction of 1, we may dispense
with this direction as far as we are concerned with its nonlinear behavior. Namely,
instead of the function g in n = |V | variables, we may consider the restriction g
to
177sidca00si
2013/2/12
page 178
## 178 Chapter 7. L-Convex Functions
an arbitrarily chosen coordinate plane, say, p(u0) = 0 for some u0 ∈ V , where the
restriction g
is a function in n − 1 variables deﬁned by
g
(p
) = g(0,p
),
with the notation V 
= V \ {u0} and (p0,p
) ∈ Z × ZV 
. A function derived from
an L-convex function by such a restriction is called an L
-convex function.
More formally, an L
-convex function is deﬁned as follows. Let 0 denote a new
element not in V , and put Ṽ = {0} ∪ V . A function g : ZV
→ R ∪ {+∞} is called
L
-convex if the function g̃ : ZṼ
→ R ∪ {+∞} deﬁned by
g̃(p0,p) = g(p − p01) (p0 ∈ Z,p ∈ ZV
) (7.2)
is an L-convex function. Note that g̃ satisﬁes (TRF[Z]) with r = 0. We denote by
L
[Z → R] the set of L
-convex functions and by L
[Z → Z] the set of integer-valued
L
-convex functions.
It turns out that L
-convexity can be characterized by a kind of generalized
submodularity:
(SBF
[Z]) g(p) + g(q) ≥ g((p − α1) ∨ q) + g(p ∧ (q + α1))
(∀p,q ∈ ZV
,∀α ∈ Z+),
which we call translation submodularity. Note that α is restricted to be nonnegative
and this inequality for α = 0 agrees with the original submodularity (SBF[Z]).
Theorem 7.1. For a function g : ZV
→ R ∪ {+∞} with domg = ∅, we have
g is L
-convex ⇐⇒ g satisﬁes (SBF
[Z]).
Proof. Let g̃ be deﬁned by (7.2). The submodularity of g̃, i.e.,
g̃(p0,p) + g̃(q0,q) ≥ g̃(p0 ∨ q0,p ∨ q) + g̃(p0 ∧ q0,p ∧ q),
is translated to a condition
g(p − p01) + g(q − q01) ≥ g((p ∨ q) − (p0 ∨ q0)1) + g((p ∧ q) − (p0 ∧ q0)1)
on g. Assuming α = q0 − p0 ≥ 0, put p
= p − p01 and q
= q − q01. Then
(p∨q)−(p0 ∨q0)1 = (p
−α1)∨q
and (p∧q)−(p0 ∧q0)1 = p
∧(q
+α1). Hence
the above inequality is equivalent to (SBF
[Z]).
L
-convex functions are conceptually equivalent to L-convex functions, but the
class of L
-convex functions is larger than that of L-convex functions. The condition
(7.3) below is stronger than (SBF
[Z]) in that it requires the inequality not only for
nonnegative α but also for negative α.
Theorem 7.2. An L-convex function g ∈ L[Z → R] satisﬁes
g(p) + g(q) ≥ g((p − α1) ∨ q) + g(p ∧ (q + α1)) (p,q ∈ ZV
,α ∈ Z). (7.3)sidca00si
2013/2/12
page 179
7.1. L-Convex Functions and L
-Convex Functions 179
Proof. By (SBF[Z]) and (TRF[Z]) we see
g(p) + g(q) = g(p − α1) + g(q) + αr ≥ g((p − α1) ∨ q) + g((p − α1) ∧ q) + αr
= g((p − α1) ∨ q) + g(p ∧ (q + α1)).
Theorem 7.3. An L-convex function is L
-convex. Conversely, an L
-convex
function is L-convex if and only if it satisﬁes (TRF[Z]).
Proof. This follows from Theorem 7.1 and the obvious implications (7.3) ⇒
(SBF
[Z]) ⇒(SBF[Z]).
For ease of reference we summarize the relationship between L and L
as
Ln ⊂ L
n ≃ Ln+1, (7.4)
where Ln and L
n denote, respectively, the sets of L-convex functions and L
-convex
functions in n variables, and the expression L
n ≃ Ln+1 means a correspondence of
their elements (functions) up to the constant r in (TRF[Z]), where (7.2) gives the
correspondence under the normalization of r = 0.
By the equivalence between L-convex functions and L
-convex functions all
theorems stated for L-convex functions can be rephrased for L
-convex functions,
and vice versa. In this book we primarily work with L-convex functions, making
explicit statements for L
-convex functions when appropriate.
A set function ρ : 2V
→ R∪{+∞} can be identiﬁed with a function g : ZV
→
R ∪ {+∞} with domg ⊆ {0,1}V
through
g(p) =

ρ(X) (p = χX,X ⊆ V ),
+∞ (otherwise).
(7.5)
The following states that the submodularity of ρ is the same as the L
-convexity of g.
Proposition 7.4. Let ρ : 2V
→ R ∪ {+∞} be a set function with domρ = ∅ and
g : ZV
→ R ∪ {+∞} be the associated function in (7.5). Then we have
ρ is submodular ⇐⇒ g is L
-convex.
Proof. (SBF
[Z]) for α = 0 is equivalent to the submodularity (4.9) of ρ. (SBF
[Z])
for α ≥ 1 is void for a function g with domg ⊆ {0,1}V
since (p − α1) ∨ q = q and
p ∧ (q + α1) = p for any p,q ∈ {0,1}V
and α ≥ 1.
The proposition above shows that L
-convex functions eﬀectively contain sub-
modular set functions as a subclass; i.e.,
S[R] → L
[Z → R], S[Z] → L
[Z → Z], (7.6)
where → denotes the embedding by (7.5).sidca00si
2013/2/12
page 180
## 180 Chapter 7. L-Convex Functions
We mention here the following fundamental fact, showing that submodularity
(on the integer lattice) is in fact a local property. The proof is easy and omitted.
Proposition 7.5 (Local submodularity). Let g : ZV
→ R ∪ {+∞} be a function
with domg being L
-convex. Then g satisﬁes the submodularity inequality (7.1) for
all p,q ∈ ZV
if and only if it satisﬁes (7.1) for all p,q ∈ ZV
with ||p − q||∞ = 1.
Note 7.6. With an M
-concave function h : ZV
→ R ∪ {−∞} with domh =
{0,1}V
, we may associate a function g : ZV
→ R∪{+∞} such that domg = {0,1}V
and g(p) = h(p) for p ∈ {0,1}V
. Since h is submodular by Theorem 6.19, g
is L
-convex by Proposition 7.4. In this sense we have M
-concave ⇒ L
-convex
for functions on {0,1}-vectors. The converse does not hold, as is demonstrated
by an L
-convex function g : Z3
→ R ∪ {+∞} with domg = {0,1}3
deﬁned by
g(1,1,1) = −2, g(1,1,0) = g(1,0,1) = −1, and g(0,0,0) = g(1,0,0) = g(0,1,0) =
g(0,0,1) = g(0,1,1) = 0. Note that h = −∞ and g = +∞ outside {0,1}V
and
that any function on {0,1}V
can be extended to a convex function and to a concave
function.
## 7.2 Discrete Midpoint Convexity
We show a characterization of L
-convexity in terms of discrete midpoint convexity
g(p) + g(q) ≥ g

p + q
2

+ g

p + q
2

(p,q ∈ ZV
), (7.7)
which is an obvious approximation to the midpoint convexity (1.3) of ordinary
convex functions; see Fig. 7.1. We consider another property for a function g:
(L
-APR[Z]) For any p,q ∈ ZV
with supp+
(p − q) = ∅,
g(p) + g(q) ≥ g(p − χX) + g(q + χX),
where X = argmax
v∈V
{p(v) − q(v)}.
This says that the sum of the function values at a pair of points (p,q) does not
increase when the pair is replaced with another pair (p − χX,q + χX) of closer
points.
Theorem 7.7. For a function g : ZV
→ R ∪ {+∞} with domg = ∅, we have
(SBF
[Z]) ⇐⇒ (L
-APR[Z]) ⇐⇒ discrete midpoint convexity (7.7).
Hence, each of these is a necessary and suﬃcient condition for g to be L
-convex.
Proof. First, Theorem 7.1 shows the equivalence of (SBF
[Z]) to L
-convexity.
[(SBF
[Z])⇒(L
-APR[Z])]: Suppose that supp+
(p − q) = ∅ and put α =
maxv∈V {p(v)−q(v)}−1. We have α ≥ 0, (p−α1)∨q = q+χX, and p∧(q+α1) =
p − χX. Hence (L
-APR[Z]) follows from (SBF
[Z]).sidca00si
2013/2/12
page 181
7.3. Examples 181
p
q
p+q
2
p+q
2
q
p
p+q
2
p+q
2
p
q
p+q
2
p+q
2
Figure 7.1. Discrete midpoint convexity.
[(L
-APR[Z])⇒(7.7)]: Put p
= p+q
2 and q
= p+q
2 and deﬁne p
,q
by
p
(v) =

p
(v) (p(v) ≥ q(v)),
q
(v) (p(v) ≤ q(v)),
q
(v) =

q
(v) (p(v) ≥ q(v)),
p
(v) (p(v) ≤ q(v)).
We have |p
(v)−q
(v)| ≤ 1 (v ∈ V ), supp+
(p
−q
) ⊆ supp+
(p−q), and supp−
(p
−
q
) ⊆ supp−
(p − q). Starting with (p,q) and applying (L
-APR[Z]) repeatedly,
we obtain g(p) + g(q) ≥ g(p
) + g(q
). Applying (L
-APR[Z]) to (p
,q
) yields
g(p
) + g(q
) ≥ g(p
) + g(q
). Hence follows g(p) + g(q) ≥ g(p
) + g(q
).
[(7.7)⇒(SBF
[Z])]: (SBF
[Z]) for g is equivalent to the submodularity of g̃ in
(7.2) (cf. proof of Theorem 7.1). Since domg is an L
-convex set by (7.7) and (5.15),
domg̃ is an L-convex set. By Proposition 7.5, the submodularity of g̃ is equivalent
to the local submodularity of g̃ and the latter holds if and only if
g(p + χX) + g(p + χY ) ≥ g(p) + g(p + χX + χY ),
g(p + χX − 1) + g(p + χY ) ≥ g(p) + g(p + χX + χY − 1)
for all p ∈ ZV
and X,Y ⊆ V with X ∩ Y = ∅. These two conditions follow easily
from discrete midpoint convexity (7.7).
## 7.3 Examples
We have already seen L-convexity in network ﬂows and in matroids (section 2.2,
section 2.4). In this section we see some other examples of L-convex functions, such
as linear functions, quadratic functions, and separable convex functions.
First we note the following facts.
Proposition 7.8.
(1) The eﬀective domain of an L-convex function is an L-convex set.
(2) The eﬀective domain of an L
-convex function is an L
-convex set.
Proof. (1) (SBF[Z]) and (TRF[Z]) for g imply (SBS[Z]) and (TRS[Z]) for D =
domg. (2) Similarly, (SBF
[Z]) for g implies (SBS
[Z]) for D = domg.sidca00si
2013/2/12
page 182
## 182 Chapter 7. L-Convex Functions
Linear functions A linear (or aﬃne) function48
g(p) = α + p,x (p ∈ domg) (7.8)
with x ∈ Rn
and α ∈ R is L-convex or L
-convex according as domg is L-convex
or L
-convex.
Quadratic functions A quadratic function
g(p) =
n 
i=1
n 
j=1
aijp(i)p(j) (p ∈ Zn
) (7.9)
with aij = aji ∈ R (i,j = 1,...,n) is L
-convex if and only if
aij ≤ 0 (i = j),
n 
j=1
aij ≥ 0 (i = 1,...,n), (7.10)
which can be proved as in Theorem 2.7. Accordingly, g is L-convex if and only if
aij ≤ 0 (i = j),
n 
j=1
aij = 0 (i = 1,...,n). (7.11)
In Example 2.1 (Poisson equation) and Example 2.2 (electrical network), we have
seen the matrices
⎡
⎢
⎢
⎣
2 −1
−1 2 −1
−1 2 −1
−1 2
⎤
⎥
⎥
⎦,
⎡
⎢
⎢
⎣
g1 + g2 + g5 −g1 −g2 −g5
−g1 g1 + g4 0 −g4
−g2 0 g2 + g3 −g3
−g5 −g4 −g3 g3 + g4 + g5
⎤
⎥
⎥
⎦,
which satisfy (7.10) and (7.11), respectively.
Separable convex functions A separable convex function
g(p) =
n 
i=1
gi(p(i)) (p ∈ domg) (7.12)
with univariate discrete convex functions gi ∈ C[Z → R] (i = 1,...,n) is L
-convex
if domg is an L
-convex set.49
In particular, a separable convex function with a
chain condition
g(p) =
 n
i=1 gi(p(i)) (p(1) ≤ p(2) ≤ ··· ≤ p(n))
+∞ (otherwise)
(p ∈ Zn
) (7.13)
48In this section, V = {1,...,n}, g denotes a real-valued function in integer variables, i.e., g :
Zn → R∪{+∞}, and p(i) is the ith component of an integer vector p = (p(i) | i = 1,...,n) ∈ Zn.
49It is easy to verify discrete midpoint convexity (7.7) for g.sidca00si
2013/2/12
page 183
7.4. Basic Operations 183
is L
-convex. For gij ∈ C[Z → R] (i = j;i,j = 1,...,n), the function
g(p) =

i=j
gij(p(i) − p(j)) (p ∈ domg) (7.14)
is L-convex if domg is an L-convex set. As special cases of (7.12) and (7.14) we see
the following.
Proposition 7.9. Let ψ ∈ C[Z → R] be a univariate discrete convex function.
(1) ψ is L
-convex.
(2) The function g : Z2
→ R ∪ {+∞} deﬁned by g(p) = ψ(p(1) − p(2)) is
L-convex.
Maximum-component functions The function
g(p) = max{p(1),...,p(n)} (p ∈ Zn
), (7.15)
which gives the maximum value of the components of p, is L-convex.
Multimodular functions A function h : Zn
→ R∪ {+∞} is said to be multimod-
ular if the function g̃ : Zn+1
→ R ∪ {+∞} deﬁned by
g̃(p0,p) = h(p(1)−p0,p(2)−p(1),...,p(n)−p(n−1)) (p0 ∈ Z,p ∈ Zn
) (7.16)
is submodular. This means that a function h : Zn
→ R∪{+∞} is multimodular if
and only if it can be represented as
h(p) = g(p(1),p(1) + p(2),...,p(1) + ··· + p(n)) (p ∈ Zn
) (7.17)
for some L
-convex function g.
Submodular set functions Any submodular set function may be regarded as an
L
-convex function by Proposition 7.4.
## 7.4 Basic Operations
Basic operations on L-convex functions are presented here, whereas the most im-
portant operation, transformation by networks, is treated later in section 9.6.
L-convex functions admit the following operations. See (6.41) for the deﬁnition
of the projection gU
.
Theorem 7.10. Let g,g1,g2 ∈ L[Z → R] be L-convex functions.
(1) For λ ∈ R++, λg is L-convex.
(2) For a ∈ ZV
and β ∈ Z \ {0}, g(a + βp) is L-convex in p.
(3) For x ∈ RV
, g[−x] is L-convex.
(4) For U ⊆ V , the projection gU
is L-convex provided gU
> −∞.
(5) For ψv ∈ C[Z → R] (v ∈ V ),
g̃(p) = inf
q∈ZV
+
g(q) +

v∈V
ψv(p(v) − q(v))
,
(p ∈ ZV
) (7.18)sidca00si
2013/2/12
page 184
## 184 Chapter 7. L-Convex Functions
is L-convex provided g̃ > −∞.
(6) The sum g1 + g2 is L-convex provided dom(g1 + g2) = ∅.
Proof. (1), (2), (3), and (6) are obvious.
(5) (TRF[Z]) is easy to see. For (SBF[Z]) we indicate the idea by assuming
that, for each p1,p2 ∈ domg̃, the inﬁmum in (7.18) is attained by some q1,q2 ∈ ZV
.
Proposition 7.9 (2) and (SBF[Z]) for g respectively show
ψv(p1(v) − q1(v)) + ψv(p2(v) − q2(v))
≥ ψv([p1(v) ∨ p2(v)] − [q1(v) ∨ q2(v)]) + ψv([p1(v) ∧ p2(v)] − [q1(v) ∧ q2(v)]),
g(q1) + g(q2) ≥ g(q1 ∨ q2) + g(q1 ∧ q2).
On the other hand, (7.18) implies
g(q1 ∨ q2) +

v∈V
ψv([p1(v) ∨ p2(v)] − [q1(v) ∨ q2(v)]) ≥ g̃(p1 ∨ p2),
g(q1 ∧ q2) +

v∈V
ψv([p1(v) ∧ p2(v)] − [q1(v) ∧ q2(v)]) ≥ g̃(p1 ∧ p2).
Adding these inequalities yields (SBF[Z]) for g̃.
(4) A special case of (5) with ψv = δ{0} (v ∈ U) and ψv = δZ (v ∈ V \ U)
shows the L-convexity of g̃ = g2Z δÛ, where δÛ is the indicator function of Û =
{p ∈ ZV
| p(v) = 0 (v ∈ U)}. By (6.45), gU
is the restriction of g̃ to U. Then
(SBF[Z]) of gU
is immediate from that of g̃, and (TRF[Z]) of gU
follows from that
of g̃ since g̃(p + χV ) = g̃(p + χU).
Note in Theorem 7.10 (2) that we have a scaling factor β, in contrast to the
similar statement (Theorem 6.13 (2)) for M-convex functions. Also note that g̃ in
Theorem 7.10 (5) is the inﬁmal convolution of g with a separable convex function.
Operations in Theorem 7.10 are also valid for L
-convex functions. In addi-
tion, restrictions are allowed for L
-convex functions. See (3.55) and (6.40) for the
deﬁnitions of the restrictions g[a,b] and gU.
Theorem 7.11. Let g,g1,g2 ∈ L
[Z → R] be L
-convex functions.
(1) Operations (1)–(6) of Theorem 7.10 are valid for L
-convex functions.
(2) For a,b ∈ (Z ∪ {±∞})V
, the restriction g[a,b] to the integer interval [a,b]
is L
-convex provided domg[a,b] = ∅.
(3) For U ⊆ V , the restriction gU is L
-convex provided domgU = ∅.
Proof. (2), (3) It is easy to verify (SBF
[Z]) for g[a,b] and gU.
Note 7.12. The inﬁmal convolution of two L-convex functions is not necessarily
L-convex, and similarly for the inﬁmal convolution of two L
-convex functions. Such
functions are studied in section 8.3 under the names L2-convex functions and L
2-
convex functions, respectively.sidca00si
2013/2/12
page 185
7.5. Minimizers 185
Note 7.13. The proviso gU
> −∞ in Theorem 7.10 (4) can be weakened to
gU
(p0) > −∞ for some p0, and similarly for g̃ > −∞ in Theorem 7.10 (5).
## 7.5 Minimizers
Global optimality for an L-convex function is characterized by local optimality.
Theorem 7.14 (L-optimality criterion).
(1) For an L-convex function g ∈ L[Z → R] and p ∈ domg, we have
g(p) ≤ g(q) (∀q ∈ ZV
) ⇐⇒

g(p) ≤ g(p + χY ) (∀Y ⊆ V ),
g(p) = g(p + 1).
(7.19)
(2) For an L
-convex function g ∈ L
[Z → R] and p ∈ domg, we have
g(p) ≤ g(q) (∀q ∈ ZV
) ⇐⇒ g(p) ≤ g(p ± χY ) (∀Y ⊆ V ). (7.20)
Proof. It suﬃces to prove ⇐ in (1) and (2). We ﬁrst consider (2). For any disjoint
Y,Z ⊆ V , condition (7.20) together with submodularity yields
g(p) + g(p + χY − χZ) ≥ g(p + χY ) + g(p − χZ) ≥ 2g(p),
which implies the optimality criterion (3.65) for integrally convex functions. Since
an L
-convex function is integrally convex (to be shown in Theorem 7.20), Theorem
3.21 establishes ⇐ in (2). Next, (1) follows from (2), since an L-convex function
is L
-convex (Theorem 7.3) and the right-hand side of (7.19) implies g(p − χY ) =
g(p + χV \Y ) ≥ g(p).
The well-known optimality criterion for a submodular set function is an im-
mediate corollary of (2) above.
Theorem 7.15. Let ρ be a submodular set function. A subset X ∈ domρ is a
minimizer of ρ if and only if ρ(X) ≤ ρ(Y ) for any Y that includes X or is included
in X.
Proof. Let g be the L
-convex function associated with ρ (see (7.5) and Proposition
7.4), and apply Theorem 7.14 (2) with p = χX.
Although Theorem 7.14 aﬀords a local criterion for global optimality of a point
p, a straightforward veriﬁcation of (7.19) requires O(2n
) function evaluations. The
veriﬁcation can be done in polynomial time as follows. We consider a submodu-
lar set function ρp deﬁned by ρp(Y ) = g(p + χY ) − g(p) and note that (7.19) is
equivalent to saying that ρp achieves its minimum at Y = ∅. This condition can be
veriﬁed in polynomial time by the submodular function minimization algorithms in
section 10.2.
The minimizers of an L-convex function form an L-convex set, a property that
is essential for a function to be L-convex.sidca00si
2013/2/12
page 186
## 186 Chapter 7. L-Convex Functions
Proposition 7.16. For an L-convex function g ∈ L[Z → R], argming is an
L-convex set if it is not empty.
Proof. Suppose D = argming is nonempty. We have r = 0 in (TRF[Z]) and hence
D satisﬁes (TRS[Z]). For p,q ∈ D, we have p ∨ q,p ∧ q ∈ D by (SBF[Z]). This
shows (SBS[Z]) for D.
The following theorem reveals that L-convex functions are characterized as
functions obtained by piecing together L-convex sets in a consistent way. This
shows how the concept of L-convex functions can be deﬁned from that of L-convex
sets.
Theorem 7.17. Let g : ZV
→ R ∪ {+∞} be a function with a bounded nonempty
eﬀective domain.
(1) g is L-convex ⇐⇒ argming[−x] is an L-convex set for each x ∈ RV
.
(2) g is L
-convex ⇐⇒ argming[−x] is an L
-convex set for each x ∈ RV
.
Proof. It suﬃces to prove (1). The implication ⇒ is immediate from Theorem 7.10
(3) and Proposition 7.16. The converse is shown later in Note 7.47.
## 7.6 Proximity Theorem
We show a proximity theorem for L-convex function minimization, stating that
a global optimum of an L-convex function g exists in a neighborhood of a local
optimum of its scaling gα
deﬁned by gα
(p) = g(αp)/α. Note that gα
is L-convex by
Theorem 7.10 (2), and accordingly, a local minimizer of gα
is a global minimizer of
gα
by the L-optimality criterion (Theorem 7.14).
Theorem 7.18 (L-proximity theorem). Assume α ∈ Z++ and n = |V |.
(1) Let g : ZV
→ R ∪ {+∞} be an L-convex function with g(p) = g(p + 1)
(∀p ∈ ZV
). If pα
∈ domg satisﬁes
g(pα
) ≤ g(pα
+ αχY ) (∀Y ⊆ V ), (7.21)
then argming = ∅ and there exists p∗
∈ argming with
pα
≤ p∗
≤ pα
+ (n − 1)(α − 1)1. (7.22)
(2) Let g : ZV
→ R∪{+∞} be an L
-convex function. If pα
∈ domg satisﬁes
g(pα
) ≤ g(pα
± αχY ) (∀Y ⊆ V ), (7.23)
then argming = ∅ and there exists p∗
∈ argming with
pα
− n(α − 1)1 ≤ p∗
≤ pα
+ n(α − 1)1. (7.24)sidca00si
2013/2/12
page 187
7.7. Convex Extension 187
Proof. (1) It suﬃces to show that, for any β > inf g, there exists p∗
that satisﬁes
g(p∗
) ≤ β and (7.22); note that there exist only a ﬁnite number of p∗
satisfying
(7.22). We may assume pα
= 0. By (TRF[Z]) with r = 0 there exists p∗
such that
g(p∗
) ≤ β and p∗
≥ 0; let p∗
be minimal (with respect to order ≥) among such
vectors. We have p∗
(v) = 0 for some v ∈ V and
g(p∗
− χX) > g(p∗
) (∀X ⊆ supp+
(p∗
)). (7.25)
We can represent p∗
as p∗
=
k
i=1 μiχXi , where μi ∈ Z++ (i = 1,...,k), ∅ =
X1
⊂
= X2
⊂
= ··· ⊂
= Xk = V , and 0 ≤ k ≤ n − 1.
Claim 1:
g
8j−1 
i=1
μiχXi + μχXj
9
> g
8j−1 
i=1
μiχXi + (μ + 1)χXj
9
(1 ≤ j ≤ k,0 ≤ μ ≤ μj −1).
(Proof of Claim 1) Put p =
j−1
i=1 μiχXi +μχXj and suppose p ∈ domg. By Xj
⊆ supp+
(p∗
) and (7.25) we have g(p∗
−χXj ) > g(p∗
). Since Xj = argmaxv∈V {p∗
(v)
− p(v)}, (L
-APR[Z]) shows that g(p∗
− χXj ) > g(p∗
) ⇒ g(p + χXj ) < g(p). Note
that g satisﬁes (L
-APR[Z]) by Theorem 7.7.
Claim 2: g(μχXj ) > g((μ + 1)χXj ) (1 ≤ j ≤ k,0 ≤ μ ≤ μj − 1).
(Proof of Claim 2) Put p =
j
i=1 μiχXi and q = μχXj and suppose q ∈ domg.
Since V \Xj = argmaxv∈V {q(v)−p(v)} and g(p+χV \Xj
) = g(p−χXj ) > g(p) by
Claim 1, (L
-APR[Z]) implies g(q) > g(q − χV \Xj
) = g(q + χXj ).
It follows from Claim 2 and (7.21) that μi < α for i = 1,...,k, and hence
0 ≤ p∗
≤ (α − 1)
k 
i=1
χXi ≤ (n − 1)(α − 1)1.
(2) This follows from (1) applied to g̃ in (7.2).
The algorithmic use of the above theorem is shown in sections 10.3.2 and 10.4.5.
## 7.7 Convex Extension
This section establishes one of the major properties of L-convex functions, which is
that they can be extended to convex functions in real variables. The extensibility to
convex functions is by no means obvious from the deﬁnition of L-convex functions
in terms of axioms referring only to function values on integer points. The convex
extension of an L-convex function can be obtained by piecing together the Lovász
extensions.
With a function g : ZV
→ R ∪ {+∞} and a point p ∈ domg we associate a
set function ρg,p : 2V
→ R ∪ {+∞} deﬁned by
ρg,p(X) = g(p + χX) − g(p) (X ⊆ V ). (7.26)
If g is L-convex, the associated set function ρg,p belongs to S[R] (i.e., ρg,p is sub-
modular, ρg,p(∅) = 0, and ρg,p(V ) < +∞).sidca00si
2013/2/12
page 188
## 188 Chapter 7. L-Convex Functions
The next theorem shows that an L-convex function g can be extended to a
convex function, and that the convex extension can be constructed from the Lovász
extension of ρg,p for varying p ∈ ZV
.
Theorem 7.19. Let g ∈ L[Z → R] be an L-convex function and g be its convex
closure.
(1) For p ∈ domg and q ∈ [0,1]R, we have
g(p + q) = g(p) + ρ̂g,p(q)
= g(p) +
m−1 
i=1
(q̂i − q̂i+1)(g(p + χUi) − g(p)) + q̂m(g(p + χUm ) − g(p)),
(7.27)
where ρ̂g,p denotes the Lovász extension (4.6) of the associated set function ρg,p in
(7.26), q̂1 > q̂2 > ··· > q̂m are the distinct values of the components of q, and
Ui = Ui(q) = {v ∈ V | q(v) ≥ q̂i} (i = 1,...,m). (7.28)
(2) For p ∈ ZV
and q ∈ [0,1]R, we have50
g(p + q) = (1 − q̂1)g(p) +
m−1 
i=1
(q̂i − q̂i+1)g(p + χUi ) + q̂mg(p + χUm). (7.29)
(3) g(p) = g(p) (p ∈ ZV
).
(4) g(q+α1) = g(q)+αr (q ∈ RV
,α ∈ R) with the constant r in (TRF[Z]).
(5) Expression (7.27) is valid for q ∈ N0, where
N0 = {q ∈ RV
| max
v∈V
q(v) − min
v∈V
q(v) ≤ 1}.
Proof. (2) For each p ∈ ZV
, let hp(q) denote the function in q ∈ [0,1]R deﬁned
by the right-hand side of (7.29). If p ∈ domg, ρg,p belongs to S[R], and hence
hp is a polyhedral convex function by Theorem 4.16. With the representation
of a real vector s = p + q with p = s and q = s − s we deﬁne a function
h : RV
→ R ∪ {+∞} by h(s) = hp(q). We have
s ∈ domh ⇐⇒ p + χUi ∈ domg (i = 0,1,...,m),
where U0 = ∅ and Ui = Ui(q) for i = 1,...,m, as in (7.28). By construction, h is
convex in [p,p+1]R for each p ∈ ZV
. Furthermore, it is convex in the entire space
RV
, because h(s − α1) = h(s) − αr for s ∈ RV
and α ∈ R by (TRF[Z]) of g, and
for each s ∈ RV
there exist α ∈ R and p ∈ ZV
such that s − α1 is an interior
point of [p,p + 1]R. Obviously, we have h(p) = g(p) for every p ∈ ZV
, and h is the
maximum among convex functions with this property. Therefore, h = g.
(1) If p ∈ domg, the right-hand side of (7.29) can be rewritten as (7.27).
50Expression (7.29) does not involve ∞ − ∞ even for p / ∈ domg.sidca00si
2013/2/12
page 189
7.8. Polyhedral L-Convex Functions 189
(3) This is a special case of (7.29) with q = 0.
(4) This is immediate from (7.29) and (TRF[Z]).
(5) For q ∈ N0 we put α = minv∈V q(v). By (4), g(p+q) = g(p+(q−α1))+αr.
We can apply (7.27) to g(p + (q − α1)) since q − α1 ∈ [0,1]R.
The above theorem implies the integral convexity of an L-convex function and
hence that of an L
-convex function.
Theorem 7.20. An L
-convex function is integrally convex. In particular, an
L
-convex function is convex extensible.
An integrally convex function with submodularity (SBF[Z]) is called a sub-
modular integrally convex function. This turns out to be a synonym of L
-convex
function.
Theorem 7.21. For a function g : ZV
→ R ∪ {+∞} with domg = ∅,
g is L
-convex ⇐⇒ g is submodular integrally convex.
Proof. The implication ⇒ follows from (SBF[Z]) and Theorem 7.20. The converse
can be shown as follows. By the integral convexity of g, the convex closure g
coincides with the local convex extension, and, by the submodularity of g, the latter
is obtained as the Lovász extension (7.27) of ρg,p in (7.26). Therefore, we have
2g

p + q
2

= g

p + q
2

+ g

p + q
2

for any p,q ∈ ZV
. On the other hand, we have
g(p) + g(q) = g(p) + g(q) ≥ 2g

p + q
2

from convex extensibility and midpoint convexity (1.3). From these follows the
discrete midpoint convexity (7.7) of g, which means L
-convexity by Theorem 7.7.
Note 7.22. Submodularity (SBF[Z]) alone does not guarantee convex extensibility.
For example, any function g : Z2
→ R∪{+∞} with domg = {p ∈ Z2
| p(1) = p(2)}
is submodular.
## 7.8 Polyhedral L-Convex Functions
As we have seen, L-convex functions on the integer lattice can be extended to
convex functions in real variables. The convex extension of an L-convex function is
a polyhedral convex function when restricted to a ﬁnite interval. Motivated by thissidca00si
2013/2/12
page 190
## 190 Chapter 7. L-Convex Functions
we deﬁne here the concept of L-convexity for polyhedral convex functions in general
and show that major properties of L-convex functions survive in this generalization.
A polyhedral convex function g : RV
→ R ∪ {+∞} with domRg = ∅ is said
to be L-convex if it satisﬁes
(SBF[R]) g(p) + g(q) ≥ g(p ∨ q) + g(p ∧ q) (∀p,q ∈ RV
),
(TRF[R]) ∃r ∈ R such that g(p + α1) = g(p) + αr
(∀p ∈ RV
,∀α ∈ R).
(SBF[R]) is submodularity on the real-vector lattice and (TRF[R]) is linearity in the
direction of 1. We denote by L[R → R] the set of polyhedral L-convex functions.
Polyhedral L-concave functions are deﬁned in an obvious way.
Submodularity (SBF[R]) is in fact a local property. Under auxiliary conditions
on the eﬀective domain, it is implied by submodularity for a certain set of local
pairs of p and q. The following two propositions are mentioned here; the proofs are
straightforward and omitted (see Theorems 4.26 and 4.27 of Murota–Shioura [152]).
Proposition 7.23. Let g : RV
→ R ∪ {+∞} be a function with domRg a closed
set. Then g is submodular (SBF[R]) if, for each p0 ∈ domRg, there exists ε =
ε(p0) > 0 such that inequality (7.1) is satisﬁed for all p, q with ||p − p0||∞ ≤ ε and
||q − p0||∞ ≤ ε.
Proposition 7.24. Let g : RV
→ R∪{+∞} be a function with domRg an interval.
(1) g is submodular (SBF[R]) if
g(p + λχu) + g(p + μχv) ≥ g(p) + g(p + λχu + μχv) (7.30)
for all p ∈ domRg; u,v ∈ V with u = v; and λ,μ ∈ R+.
(2) g is submodular (SBF[R]) if (7.30) holds for all p ∈ domRg; u,v ∈ V with
u = v; λ ∈ [0,p̂i−1 − p̂i]R; and μ ∈ [0,p̂j−1 − p̂j]R, where p̂1 > p̂2 > ··· > p̂m
denote the distinct values of the components of p, the indices i and j are such that
p(u) = p̂i and p(v) = p̂j, and [0,p̂0 − p̂1]R means [0,+∞)R by convention.
The Lovász extension ρ̂ of a submodular set function ρ is a polyhedral L-convex
function.
Proposition 7.25. For ρ ∈ S[R] we have ρ̂ ∈ L[R → R].
Proof. (TRF[R]) for g = ρ̂ is obvious, and we show (SBF[R]) below.
First, assume ρ is ﬁnite valued. Then domRρ̂ = RV
. By Proposition 7.24
(2), (SBF[R]) follows from inequality (7.30) for u ∈ Ui \ Ui−1, v ∈ Uj \ Uj−1,
λ ∈ [0,p̂i−1 − p̂i]R, and μ ∈ [0,p̂j−1 − p̂j]R, where Ui (i = 1,...,m) are deﬁned in
(4.4) and U0 = ∅. Expression (4.6) shows
g(p + λχu) = g(p) + λ[ρ(Ui−1 ∪ {u}) − ρ(Ui−1)],
g(p + μχv) = g(p) + μ[ρ(Uj−1 ∪ {v}) − ρ(Uj−1)].sidca00si
2013/2/12
page 191
7.8. Polyhedral L-Convex Functions 191
If i = j, we have
g(p + λχu + μχv) + g(p)
= λ[ρ(Ui−1 ∪ {u}) − ρ(Ui−1)] + μ[ρ(Uj−1 ∪ {v}) − ρ(Uj−1)] + 2g(p)
= g(p + λχu) + g(p + μχv),
and, if i = j, we may assume λ ≥ μ and then we have
g(p + λχu + μχv) + g(p)
= λ[ρ(Ui−1 ∪ {u}) − ρ(Ui−1)] + μ[ρ(Ui−1 ∪ {u,v}) − ρ(Ui−1 ∪ {u})] + 2g(p)
≤ λ[ρ(Ui−1 ∪ {u}) − ρ(Ui−1)] + μ[ρ(Ui−1 ∪ {v}) − ρ(Ui−1)] + 2g(p)
= g(p + λχu) + g(p + μχv)
from the submodularity of ρ. Hence follows (7.30).
The general case where ρ may possibly take the value of +∞ can be reduced
to the ﬁnite-valued case. For each k ∈ Z++, we deﬁne ρk by
ρk(X) = min
Y ⊆X
{ρ(X \ Y ) + k|Y |} (X ⊆ V )
and put gk = ρ̂k. We have ρk < +∞ and ρk ∈ S[R] and therefore (SBF[R]) for
gk. Since ρ(X) = limk→∞ ρk(X) (∀X ⊆ V ), we have g(p) = limk→∞ gk(p) for each
p ∈ RV
. Hence follows (SBF[R]) for g.
An L-convex function on integer points naturally induces a polyhedral L-
convex function via convex extension (which exists by Theorem 7.20).
Theorem 7.26. The convex extension g of an L-convex function g ∈ L[Z → R] on
the integer lattice is a polyhedral L-convex function, i.e., g ∈ L[R → R], provided
that g is polyhedral.
Proof. We use (7.27) in Theorem 7.19. (TRF[R]) is obvious. By Proposition 7.25,
ρ̂g,p is submodular on RV
, and hence g is submodular on [p,p+1]R for each p ∈ ZV
.
The submodularity (SBF[R]) of g on RV
follows from this.
Example 7.27. The convex extension g of an L-convex function g ∈ L[Z → R]
may consist of an inﬁnite number of linear pieces, in which case g is not polyhedral
convex. For example, we have g ∈ L[Z → R] and g / ∈ L[R → R] for g : Z2
→ R
deﬁned by g(p) = (p(1)−p(2))2
. It is worth noting that, if domZg is bounded, g is
polyhedral and therefore g ∈ L[R → R] by Theorem 7.26.
Polyhedral L-convex functions with integrality (6.75) are referred to as integral
polyhedral L-convex functions, the set of which is denoted by L[Z|R → R]. Polyhe-
dral L-convex functions with dual integrality (6.76) are referred to as dual-integral
polyhedral L-convex functions, the set of which is denoted by L[R → R|Z].sidca00si
2013/2/12
page 192
## 192 Chapter 7. L-Convex Functions
By Theorem 7.26 and Proposition 7.16 an integral polyhedral L-convex func-
tion is nothing but a polyhedral L-convex function that can be obtained as the
convex extension of an L-convex function on integer points. Therefore, we have
L[Z|R → R] ⊆ L[R → R], L[Z|R → R] → L[Z → R], (7.31)
where the second expression means that there exists an injection from L[Z|R → R]
to L[Z → R], representing an embedding of L[Z|R → R] into L[Z → R].
The eﬀective domain of a polyhedral L-convex function is an L-convex polyhe-
dron, which is homogeneous in direction 1. Hence, polyhedral L
-convex functions
can be deﬁned as the restriction of polyhedral L-convex functions, just as L
-convex
functions on integer points are deﬁned from L-convex functions via (7.2). We denote
by L
[R → R] the set of polyhedral L
-convex functions and by L
[Z|R → R] the
set of integral polyhedral L
-convex functions. The relationship between L and L
is described by Ln ⊂ L
n ≃ Ln+1, where Ln and L
n denote, respectively, the sets of
polyhedral L-convex functions and polyhedral L
-convex functions in n variables.
The R-counterpart of (SBF
[Z]) is the following:
(SBF
[R]) g(p) + g(q) ≥ g((p − α1) ∨ q) + g(p ∧ (q + α1))
(∀p,q ∈ RV
,∀α ∈ R+).
Theorem 7.28. For a polyhedral convex function g : RV
→ R ∪ {+∞} with
domRg = ∅, (SBF
[R]) is equivalent to polyhedral L
-convexity.
The condition (7.32) below is stronger than (SBF
[R]) in that it requires the
inequality not only for nonnegative α but also for negative α.
Theorem 7.29. A polyhedral L-convex function g ∈ L[R → R] satisﬁes
g(p) + g(q) ≥ g((p − α1) ∨ q) + g(p ∧ (q + α1)) (∀p,q ∈ RV
,∀α ∈ R). (7.32)
Theorem 7.30. A polyhedral L-convex function is polyhedral L
-convex. Con-
versely, a polyhedral L
-convex function is polyhedral L-convex if and only if it
satisﬁes (TRF[R]).
Almost all properties of L-convex functions on integer points carry over to
polyhedral L-convex functions. To be speciﬁc, Theorems 7.10, 7.11, and 7.14 and
Proposition 7.16 are adapted as follows. Note, however, that the proofs are not
straightforward adaptations; see Murota–Shioura [152].
Theorem 7.31. Let g,g1,g2 ∈ L[R → R] be polyhedral L-convex functions.
(1) For λ ∈ R++, λg is polyhedral L-convex.
(2) For a ∈ RV
and β ∈ R \ {0}, g(a + βp) is polyhedral L-convex in p.
(3) For x ∈ RV
, g[−x] is polyhedral L-convex.
(4) For U ⊆ V , the projection gU
is polyhedral L-convex provided gU
> −∞.sidca00si
2013/2/12
page 193
7.9. Positively Homogeneous L-Convex Functions 193
(5) For ψv ∈ C[R → R] (v ∈ V ),
g̃(p) = inf
q∈RV
+
g(q) +

v∈V
ψv(p(v) − q(v))
,
(p ∈ RV
) (7.33)
is polyhedral L-convex provided g̃ > −∞.
(6) The sum g1 + g2 is polyhedral L-convex provided dom(g1 + g2) = ∅.
Theorem 7.32. Let g,g1,g2 ∈ L
[R → R] be polyhedral L
-convex functions.
(1) Operations (1)–(6) of Theorem 7.31 are valid for polyhedral L
-convex func-
tions.
(2) For a,b ∈ (R ∪ {±∞})V
, the restriction g[a,b] to the real interval [a,b] is
polyhedral L
-convex provided domg[a,b] = ∅.
(3) For U ⊆ V , the restriction gU is polyhedral L
-convex provided domgU = ∅.
Theorem 7.33 (L-optimality criterion).
(1) For a polyhedral L-convex function g ∈ L[R → R] and p ∈ domRg, we
have
g(p) ≤ g(q) (∀q ∈ RV
) ⇐⇒

g
(p;χY ) ≥ 0 (∀Y ⊆ V ),
g
(p;1) = 0.
(2) For a polyhedral L
-convex function g ∈ L
[R → R] and p ∈ domRg, we
have
g(p) ≤ g(q) (∀q ∈ RV
) ⇐⇒ g
(p;±χY ) ≥ 0 (∀Y ⊆ V ).
Proposition 7.34. Let g ∈ L[R → R] be a polyhedral L-convex function. For any
x ∈ RV
, argming[−x] is an L-convex polyhedron if it is not empty.
The property in Proposition 7.34 characterizes polyhedral L-convexity, to be
shown in Theorem 7.45.
Note 7.35. The proviso gU
> −∞ in Theorem 7.31 (4) can be weakened to
gU
(p0) > −∞ for some p0, and similarly for g̃ > −∞ in Theorem 7.31 (5).
Note 7.36. For L
-convex functions on integer points we have seen characteriza-
tions in terms of discrete midpoint convexity and submodular integral convexity
(Theorems 7.7 and 7.21). These characterizations, however, do not carry over to
polyhedral L
-convex functions. In contrast, translation submodularity (SBF
[Z])
is generalized to (SBF
[R]), as stated in Theorem 7.28.
## 7.9 Positively Homogeneous L-Convex Functions
Positively homogeneous L-convex functions coincide with the Lovász extensions of
submodular set functions.
We denote by 0L[R → R] the set of polyhedral L-convex functions that are
positively homogeneous in the sense of (3.32) and by 0L[Z|R → R] the set ofsidca00si
2013/2/12
page 194
## 194 Chapter 7. L-Convex Functions
integral polyhedral L-convex functions that are positively homogeneous. Also we
denote by 0L[Z → R] the set of L-convex functions g ∈ L[Z → R] on integer points
such that the convex extensions g are positively homogeneous.
These three families of functions can be identiﬁed with each other, i.e.,
0L[Z → R] ≃ 0L[Z|R → R] = 0L[R → R], (7.34)
by the following proposition. We introduce yet another notation, 0L[Z → Z], for
the set of integer-valued functions belonging to 0L[Z → R].
Proposition 7.37.
(1) 0L[Z|R → R] = 0L[R → R].
(2) The convex extension of a function in 0L[Z → R] belongs to 0L[R → R].
Proof. (1) Take g ∈ 0L[R → R]. For any x ∈ RV
, argming[−x] is a cone that is an
L-convex polyhedron (or empty) by Proposition 7.34. Hence, argming[−x] = D(γ)
for a {0,+∞}-valued distance function γ; see section 5.6. This shows the integrality
of argming[−x], and therefore g ∈ 0L[Z|R → R].
(2) Take g ∈ 0L[Z → R]. Since g is integrally convex and g is positively
homogeneous, g can be represented as the maximum of a ﬁnite number of linear
functions. Hence g is polyhedral, and g ∈ L[R → R] by Theorem 7.26.
A positively homogeneous L-convex function g induces a submodular set func-
tion ρg by
ρg(X) = g(χX) (X ⊆ V ). (7.35)
More precisely, we have the following statements, where S[R] and S[Z] denote
respectively the sets of real-valued and integer-valued submodular set functions
deﬁned in (4.10) and (4.11).
Proposition 7.38.
(1) For g ∈ 0L[R → R], we have ρg ∈ S[R].
(2) For g ∈ 0L[Z → Z], we have ρg ∈ S[Z].
Proof. The submodularity of ρg is immediate from that of g. Note also that
ρg(∅) = g(0) = 0 and ρg(V ) = g(1) < +∞.
Conversely, the Lovász extension ρ̂ of a submodular set function ρ ∈ S[R] is
a positively homogeneous L-convex function. We recall from (4.6) the deﬁnition
ρ̂(p) =
m−1 
i=1
(p̂i − p̂i+1)ρ(Ui) + p̂mρ(Um) (p ∈ RV
), (7.36)
where p̂1 > p̂2 > ··· > p̂m denote the distinct values of the components of p, and
Ui = Ui(p) = {v ∈ V | p(v) ≥ p̂i} for i = 1,...,m. Denote by ρ̂Z the restriction of
ρ̂ to ZV
, and note that we have ρ̂Z : ZV
→ Z ∪ {+∞} for integer-valued ρ.sidca00si
2013/2/12
page 195
7.9. Positively Homogeneous L-Convex Functions 195
Proposition 7.39.
(1) For ρ ∈ S[R], we have ρ̂ ∈ 0L[R → R].
(2) For ρ ∈ S[Z], we have ρ̂Z ∈ 0L[Z → Z].
Proof. (1) We have ρ̂ ∈ L[R → R] by Proposition 7.25, whereas the positive
homogeneity of ρ̂ is obvious. (2) follows easily from (1).
The next theorem shows a one-to-one correspondence between positively ho-
mogeneous L-convex functions and submodular set functions.
Theorem 7.40. For 0L = 0L[R → R] and S = S[R], the mappings Φ : 0L → S
and Ψ : S → 0L deﬁned by
Φ : g → ρg in (7.35), Ψ : ρ → ρ̂ in (7.36)
are inverse to each other, establishing a one-to-one correspondence between 0L and
S. The same statement is true for 0L = 0L[Z → Z] and S = S[Z] with Φ : g → ρg
and Ψ : ρ → ρ̂Z.
Proof. For ρ ∈ S we have Ψ(ρ) ∈ 0L by Proposition 7.39 and Φ ◦ Ψ(ρ) = ρ by
ρ(X) = ρ̂(χX) in (4.7). For g ∈ 0L we have ρ = Φ(g) ∈ S by Proposition 7.38.
Denote by gZ the restriction of g to ZV
. By Theorem 7.19 (5) we have
g(q) = gZ(q) =
m−1 
i=1
(q̂i − q̂i+1)g(χUi) + q̂mg(χUm ) = ρ̂(q)
for q ∈ N0, which remains valid for all q ∈ RV
since g is positively homogeneous
and the origin 0 is an interior point of N0. Hence g = Ψ ◦ Φ(g).
The above argument leads to the following proposition, to be used in sec-
tion 7.10.
Proposition 7.41. For a positively homogeneous polyhedral convex function g :
RV
→ R ∪ {+∞} with domRg = ∅, conditions (a) and (b) below are equivalent.
(a) g ∈ 0L[R → R].
(b) argming[−x] ∈ L0[R] for every x ∈ RV
with inf g[−x] > −∞.
Proof. (a) ⇒ (b) is immediate from Proposition 7.34. For (b) ⇒ (a), deﬁne ρ by
ρ(X) = g(χX) (X ⊆ V ) and denote by ρ̂ its Lovász extension (7.36).
Claim 1: g(p) = ρ̂(p) for all p ∈ RV
.
(Proof of Claim 1) The positively homogeneous convexity of g as well as (7.36)
yields ρ̂(p) ≥ g(p). We may assume p ∈ domRg, since otherwise ρ̂(p) = g(p) = +∞.
Take x such that p ∈ argming[−x], put D = argming[−x], and let δD be its
indicator function. Since D is an L-convex cone, we have δD ∈ 0L[R → R]. A set
function μ deﬁned by μ(X) = δD(χX) (X ⊆ V ) belongs to S[R] and its Lovász
extension coincides with δD by Theorem 7.40. From this and (4.8) we see
p ∈ D ⇐⇒ Ui ∈ domμ (i = 1,...,m) ⇐⇒ χUi ∈ D (i = 1,...,m).sidca00si
2013/2/12
page 196
## 196 Chapter 7. L-Convex Functions
In view of the expression (4.6) and the linearity of g on D we obtain g(p) = ρ̂(p).
By Claim 1 and the convexity of g, ρ is submodular by Theorem 4.16. In
addition we have ρ(∅) = g(0) = 0 and ρ(V ) = ρ̂(1) = g(1) < +∞. Therefore,
ρ ∈ S[R]. This implies ρ̂ ∈ 0L[R → R] by Proposition 7.39 (1).
## 7.10 Directional Derivatives and Subgradients
Directional derivatives and subgradients of L-convex functions are considered in this
section. For a polyhedral L-convex function g, the directional derivative g
(p;d) is a
positively homogeneous L-convex function in d and the subgradients of g at a point
form an M-convex polyhedron. Furthermore, each of these properties characterizes
L-convexity.
We start with directional derivatives of a polyhedral L-convex function g ∈
L[R → R]. Recall from (3.25) that, for p ∈ domRg, there exists ε > 0 such that
g(p + d) − g(p) = g
(p;d) (||d||∞ ≤ ε). (7.37)
Proposition 7.42. If g ∈ L[R → R] and p ∈ domRg, then g
(p;·) ∈ 0L[R → R].
Proof. By (7.37), g
(p;·) satisﬁes (SBF[R]) and (TRF[R]) in the neighborhood of
d = 0. Then the claim follows from the positive homogeneity of g
(p;·).
Directional derivatives and subdiﬀerentials of L-convex functions are given as
follows. It is recalled that M0[R], M0[Z|R], M0[Z], and L[R → R|Z] denote, re-
spectively, the sets of M-convex polyhedra, integral M-convex polyhedra, M-convex
sets, and dual-integral polyhedral L-convex functions. See (3.23), (6.86), and (6.88)
for the notation ∂R and ∂Z, and note that g
(p;·) in Theorem 7.43 (2) denotes the
directional derivative of the convex extension g of g at p.
Theorem 7.43.
(1) For g ∈ L[R → R] and p ∈ domRg, deﬁne ρg,p(X) = g
(p;χX) (X ⊆ V ).
Then
ρg,p ∈ S[R], ∂Rg(p) = B(ρg,p) ∈ M0[R], g
(p;·) = ρ̂g,p(·),
and ∂Rg(p) = ∅ in particular. If g ∈ L[R → R|Z], then
ρg,p ∈ S[Z], ∂Rg(p) ∈ M0[Z|R].
(2) For g ∈ L[Z → R] and p ∈ domZg, deﬁne ρg,p(X) = g(p + χX) − g(p)
(X ⊆ V ). Then
ρg,p ∈ S[R], ∂Rg(p) = B(ρg,p) ∈ M0[R], g
(p;·) = ρ̂g,p(·),
and ∂Rg(p) = ∅ in particular. If g ∈ L[Z → Z], then
ρg,p ∈ S[Z], ∂Rg(p) ∈ M0[Z|R], ∂Zg(p) ∈ M0[Z], ∂Rg(p) = ∂Zg(p),sidca00si
2013/2/12
page 197
7.10. Directional Derivatives and Subgradients 197
and ∂Zg(p) = ∅ in particular.
Proof. (1) Proposition 7.42 shows g
(p;·) ∈ 0L[R → R], from which follows
ρg,p ∈ S[R], by Proposition 7.38. By Theorem 7.33 (1) (L-optimality criterion),
x ∈ ∂Rg(p) ⇐⇒ g(p + q) − g(p) ≥ q,x (∀q ∈ RV
)
⇐⇒ g
(p;χX) ≥ x(X) (X ⊆ V ), g
(p;1) = x(V )
⇐⇒ x ∈ B(ρg,p).
We have B(ρg,p) ∈ M0[R] by (4.39) and g
(p;·) = ρ̂g,p(·) by (3.31), (3.33), and
(4.14). If g ∈ L[R → R|Z], ∂Rg(p) is an integral polyhedron by (6.76) and
ρg,p(X) = sup{x(X) | x ∈ ∂Rg(p)} ∈ Z.
(2) It is easy to see ρg,p ∈ S[R]. The rest of the proof is similar to (1), where
we use Theorem 7.14 (1) instead of Theorem 7.33 (1) and Theorem 4.15 instead of
(4.39).
We have consistency between (1) and (2) in Theorem 7.43.
Proposition 7.44. For g ∈ L[Z|R → R] and p ∈ domRg∩ZV
, we have g
(p;χX) =
g(p + χX) − g(p) for X ⊆ V .
Proof. This follows from integrality (6.75) and (5.19).
The next theorem aﬀords characterizations of polyhedral L-convex functions
in terms of the L-convexity of directional derivatives, the M-convexity of subdiﬀer-
entials, and the L-convexity of minimizers.
Theorem 7.45. For a polyhedral convex function g : RV
→ R ∪ {+∞} with
domRg = ∅, the four conditions (a), (b), (c), and (d) below are equivalent.
(a) g ∈ L[R → R].
(b) g
(p;·) ∈ 0L[R → R] for every p ∈ domRg.
(c) ∂Rg(p) ∈ M0[R] for every p ∈ domRg.
(d) argming[−x] ∈ L0[R] for every x ∈ RV
with inf g[−x] > −∞.
Proof. (a) ⇒ (b) is by Proposition 7.42, (a) ⇒ (c) by Theorem 7.43, and (a) ⇒
(d) by Proposition 7.34.
(b) ⇒ (a): By (7.37), g is submodular and linear in the direction of 1 in a
neighborhood of each p ∈ RV
. This implies (SBF[R]) and (TRF[R]) (see Proposi-
tion 7.23).
(b) ⇔ (c): This follows from the relation (δ∂Rg(p))•
= g
(p;·) in (3.33) and the
one-to-one correspondence between M0[R] and 0L[R → R], which is a consequence
of (4.39) and Theorem 7.40.
(d) ⇒ (b): To use Proposition 7.41 let x ∈ RV
be such that inf g
(p;·)[−x] >
−∞. Then inf g[−x] > −∞ and argming[−x] ∈ L0[R] by (d). By (5.18) we have
argming[−x] = {q ∈ RV
| q(v) − q(u) ≤ γ(u,v) (u,v ∈ V )}sidca00si
2013/2/12
page 198
## 198 Chapter 7. L-Convex Functions
for some γ ∈ T [R]. Since argmin(g
(p;·)[−x]) is a cone, we see
argmin(g
(p;·)[−x]) = {q ∈ RV
| q(v) − q(u) ≤ 0 ((u,v) ∈ Ap)},
with Ap = {(u,v) | p(v) − p(u) = γ(u,v)}. This shows that argmin(g
(p;·)[−x]) is
an L-convex cone. Then (b) follows from Proposition 7.41.
An integrality consideration in the equivalence of (a) and (d) in the above
theorem yields a characterization of integral polyhedral L-convex functions.
Theorem 7.46. For a polyhedral convex function g : RV
→ R ∪ {+∞} with
domRg = ∅, the two conditions (a) and (d) below are equivalent.
(a) g ∈ L[Z|R → R].
(d) argming[−x] ∈ L0[Z|R] for every x ∈ RV
with inf g[−x] > −∞.
Note 7.47. We prove ⇐ of Theorem 7.17 (1). We have argming[−x] ∈ L0[Z]
for every x ∈ RV
by the assumption. Since an L-convex set is integrally con-
vex (Theorem 5.10), g is an integrally convex function by Theorem 3.29. By the
boundedness of domg, the convex closure g of g is a polyhedral convex function
and argming[−x] = argming[−x] ∈ L0[Z|R]. This implies g ∈ L[Z|R → R] by
Theorem 7.46 and therefore g ∈ L[Z → R].
## 7.11 Quasi L-Convex Functions
Quasi L-convex functions are introduced as a generalization of L-convex functions.
The optimality criterion and the proximity theorem survive in this generalization.
To deﬁne quasi L-convexity, we relax the submodularity inequality
[g(p ∧ q) − g(p)] + [g(p ∨ q) − g(q)] ≤ 0
to sign patterns of g(p∧q)−g(p) and g(p∨q)−g(q) compatible with (implied by)
this inequality, which are given as follows:
g(p ∧ q) − g(p) \ g(p ∨ q) − g(q) − 0 +
− # # #
0 # # ×
+ # × ×
Here # and × denote possible and impossible cases, respectively.
We call a function g : ZV
→ R ∪ {+∞} quasi submodular if it satisﬁes the
following:
(QSB) For any p,q ∈ ZV
, g(p ∧ q) ≤ g(p) or g(p ∨ q) ≤ g(q).
Since p and q are symmetric, (QSB) implies also that g(p ∧ q) ≤ g(q) or g(p ∨ q) ≤
g(p). Similarly, we call g semistrictly quasi submodular if it satisﬁes the following
property:51
51The condition (SSQSB) was introduced by Milgrom–Shannon [129], in which g : ZV → R ∪
{−∞} is called quasi supermodular if −g satisﬁes (SSQSB).sidca00si
2013/2/12
page 199
7.11. Quasi L-Convex Functions 199
(SSQSB) For any p,q ∈ ZV
, both (i) and (ii) hold:
(i) g(p ∨ q) ≥ g(q) =⇒ g(p ∧ q) ≤ g(p),
(ii) g(p ∧ q) ≥ g(p) =⇒ g(p ∨ q) ≤ g(q).
Furthermore, a function g : ZV
→ R ∪ {+∞} with domg = ∅ is called quasi
L-convex if it satisﬁes (QSB) and (TRF[Z]) and semistrictly quasi L-convex if it
satisﬁes (SSQSB) and (TRF[Z]).
Example 7.48. A quasi L-convex function arises from a nonlinear scaling of an
L-convex function. For a submodular function g : ZV
→ R∪{+∞} and a function
ϕ : R → R ∪ {+∞}, deﬁne g̃ : ZV
→ R ∪ {+∞} by
g̃(p) =

ϕ(g(p)) (p ∈ domg),
+∞ (p / ∈ domg).
(7.38)
Then g̃ satisﬁes (QSB) if ϕ is nondecreasing and (SSQSB) if ϕ is strictly increasing.
If g satisﬁes (TRF[Z]) with r = 0, this property is inherited by g̃.
Weaker variants of (QSB) and (SSQSB) can be conceived by considering pos-
sible sign patterns of the four values g(p∧q)−g(p), g(p∧q)−g(q), g(p∨q)−g(p),
and g(p ∨ q) − g(q).
(QSBw) For any p,q ∈ domg, max{g(p),g(q)} ≥ min{g(p∧q),g(p∨q)}.
(SSQSBw) For any p,q ∈ domg, either (i) or (ii) holds:
(i) max{g(p),g(q)} > min{g(p ∧ q),g(p ∨ q)},
(ii) g(p) = g(q) = g(p ∧ q) = g(p ∨ q).
The relationship among various versions of quasi submodularity is summarized
as follows. The second statement below shows that all the conditions are equivalent
for g if they are imposed on every perturbation of g by a linear function. Recall the
deﬁnition of g[x]; i.e., g[x](p) = g(p) + p,x .
Theorem 7.49. For g : ZV
→ R ∪ {+∞}, the following implications hold true.
(1) (SBF[Z]) =⇒ (SSQSB) =⇒ (QSB)
⇓ ⇓
(SSQSBw) =⇒ (QSBw).
(2) g satisﬁes (SBF[Z]) ⇐⇒ ∀x ∈ RV
, g[x] satisﬁes (QSBw).
Proof. (1) This is immediate from the deﬁnitions.
(2) Combining Theorems 7.51 and 7.52 below establishes this.
As is easily seen from the deﬁnitions of quasi L-convexity, most of the prop-
erties of quasi-submodular functions can be restated naturally in terms of quasi
L-convex functions, and vice versa. We will work mainly with quasi-submodular
functions.
The following are quasi versions of Theorem 7.2 for L-convex functions.sidca00si
2013/2/12
page 200
## 200 Chapter 7. L-Convex Functions
Proposition 7.50. Assume that g : ZV
→ R∪ {+∞} satisﬁes g(p) = g(p+1) for
all p ∈ ZV
.
(1) For g satisfying (QSBw) and for p,q ∈ ZV
and α ∈ Z, we have
max{g(p),g(q)} ≥ min{g(p ∨ (q − α1)),g((p + α1) ∧ q)}. (7.39)
In particular, for p,q ∈ domg and α ∈ [0,α1 − α2]Z, we have
max{g(p),g(q)} ≥ min{g(p + αχX),g(q − αχX)}, (7.40)
where X ⊆ V , α1 ∈ Z, and α2 ∈ Z ∪ {−∞} are deﬁned by
X = argmax
v∈V
{q(v) − p(v)}, α1 = max
v∈V
{q(v) − p(v)}, α2 = max
v∈V \X
{q(v) − p(v)}.
(2) For g satisfying (SSQSBw) and for p,q ∈ ZV
with g(p) = g(q) and α ∈ Z,
we have inequality (7.39) with strict inequality. In particular, for p,q ∈ domg with
g(p) = g(q) and α ∈ [0,α1 − α2]Z, we have (7.40) with strict inequality.
(3) For g satisfying (SSQSB) and for p,q ∈ ZV
and α ∈ Z, we have
g(p ∨ (q − α1)) ≥ g(p) =⇒ g((p + α1) ∧ q) ≤ g(q), (7.41)
g((p + α1) ∧ q) ≥ g(q) =⇒ g(p ∨ (q − α1)) ≤ g(p). (7.42)
In particular, for p,q ∈ domg and α ∈ [0,α1 − α2]Z, we have
g(p + αχX) ≥ g(p) =⇒ g(q − αχX) ≤ g(q), (7.43)
g(q − αχX) ≥ g(q) =⇒ g(p + αχX) ≤ g(p). (7.44)
Proof. Inequality (7.39) follows from
max{g(p),g(q)} = max{g(p),g(q − α1)} ≥ min{g(p ∨ (q − α1)),g(p ∧ (q − α1))},
in which g(p∧(q−α1)) = g((p∧(q−α1))+α1) = g((p+α1)∧q). Inequality (7.40)
is obvious from (7.39) since p∨{q−(α1 −α)1} = p+αχX and (p+(α1 −α)1)∧q =
q − αχX for α ∈ [0,α1 − α2]Z. The proofs of (2) and (3) are similar.
The quasi submodularity of a set D ⊆ ZV
can be deﬁned as the quasi submod-
ularity of the indicator function δD : ZV
→ {0,+∞}. (QSB) for δD is equivalent to
(QDL) p,q ∈ D =⇒ p ∧ q ∈ D or p ∨ q ∈ D
for D, whereas (SSQSB) for δD is equivalent to (SBS[Z]) for D.
Level sets of quasi-submodular functions have quasi submodularity. Further-
more, the weaker version (QSBw) of quasi submodularity for functions can be char-
acterized by the property (QDL) of level sets; recall the notation L(g,α) from (6.95).
Theorem 7.51. A function g : ZV
→ R ∪ {+∞} satisﬁes (QSBw) if and only if
the level set L(g,α) satisﬁes (QDL) for every α ∈ R.sidca00si
2013/2/12
page 201
7.11. Quasi L-Convex Functions 201
Proof. For the “if” part, take p,q ∈ domg and put α = max{g(p),g(q)}. Since
p,q ∈ L(g,α), we have p ∧ q ∈ L(g,α) or p ∨ q ∈ L(g,α); i.e., max{g(p),g(q)} ≥
min{g(p ∧ q),g(p ∨ q)}. The “only if” part is even easier.
A submodular function over the integer lattice can be characterized by using
level sets of functions perturbed by linear functions.
Theorem 7.52. A function g : ZV
→ R ∪ {+∞} satisﬁes (SBF[Z]) if and only if
the level set L(g[x],α) satisﬁes (QDL) for all x ∈ RV
and α ∈ R.
Proof. The “only if” part follows from Theorem 7.51 and the submodularity of g[x].
For the proof of the “if” part, take p,q ∈ domg. By (QDL) for L(g,max{g(p),g(q)})
we have p ∧ q ∈ domg or p ∨ q ∈ domg. We consider the former case, where we
may assume p ∧ q = p,q. For any ε > 0, we can choose some x ∈ RV
such that
g[x](p) = g[x](q) = g[x](p ∧ q) − ε. (QDL) for L(g[x],α) with α = g[x](p) shows
p∨q ∈ L(g[x],α), which implies g[x](p)+g[x](q) = 2α ≥ g[x](p∧q)+g[x](p∨q)−ε.
Since ε > 0 is arbitrary, this means (SBF[Z]).
Next we turn to the minimization of a quasi L-convex function. We assume
r = 0 in (TRF[Z]) since otherwise no minimizer exists.
Global minimality is characterized by local minimality.
Theorem 7.53 (Quasi L-optimality criterion). Assume that g : ZV
→ R ∪ {+∞}
satisﬁes g(p) = g(p + 1) (∀p ∈ ZV
).
(1) For g satisfying (QSBw) and p ∈ domg, we have: g(p) < g(q) for all
q ∈ ZV
such that q −p is not a multiple of 1 ⇐⇒ g(p) < g(p+χX) for all X ⊆ V
with X / ∈ {∅,V }.
(2) For g satisfying (SSQSBw) and p ∈ domg, we have: g(p) ≤ g(q) (∀q ∈
ZV
) ⇐⇒ g(p) ≤ g(p + χX) (∀X ⊆ V ).
Proof. We prove ⇐ of (1) by contradiction. Suppose that g(q) ≤ g(p) for some
q ∈ domg such that q − p is not a multiple of 1. We may assume that q ≥ p
by (TRF[Z]) with r = 0 and that q minimizes maxv∈V {q(v) − p(v)} among such
vectors. Put X = argmaxv∈V {q(v) − p(v)}, where X = V . By Proposition 7.50
(1), we obtain
g(p) = max{g(p),g(q)} ≥ min{g(p + χX),g(q − χX)},
whereas g(p) < g(q − χX) by the choice of q. Hence follows g(p) ≥ g(p + χX), a
contradiction to the strict local minimality of p. The other direction ⇒ of (1) is
obvious, and (2) can be shown similarly by Proposition 7.50 (2).
The proximity theorem for L-convex functions (Theorem 7.18) can be gener-
alized for quasi L-convex functions.
Theorem 7.54 (Quasi L-proximity theorem). Let g : ZV
→ R ∪ {+∞} be a
function satisfying (SSQSB) and g(p) = g(p + 1) (∀p ∈ ZV
), and assume n = |V |sidca00si
2013/2/12
page 202
## 202 Chapter 7. L-Convex Functions
and α ∈ Z++. If pα
∈ domg satisﬁes (7.21), then argming = ∅ and there exists
p∗
∈ argming with (7.22).
Proof. The proof of Theorem 7.18 works with (7.43) and (7.44) in place of
(L
-APR[Z]).
Bibliographical Notes
The concept of L-convex functions was introduced by Murota [140]. L
-convex
functions are deﬁned by Fujishige–Murota [68] as a variant of L-convex functions,
together with the observation that they coincide with the submodular integrally
convex functions considered earlier by Favati–Tardella [49]. Theorems 7.1 and 7.3
are due to [68], and Theorem 7.2 is stated in Murota [147].
Discrete midpoint convexity is considered by Favati–Tardella [49] with an ob-
servation of its equivalence to submodular integral convexity. The equivalence of
discrete midpoint convexity to translation submodularity (SBF
[Z]) in Theorem 7.7
is by Fujishige–Murota [68], whereas that to (L
-APR[Z]) is noted in Murota [147].
Condition (7.11) for quadratic L-convex functions is given in Murota [141].
Separable convex functions with chain conditions (7.13) are considered in Best–
Chakravarti–Ubhaya [11]. Multimodular functions are treated in Hajek [85].
The basic operations in section 7.4 are listed in Murota [141], [144], [147].
The theorems on minimizers of L-convex functions are of fundamental impor-
tance. Theorem 7.14 (L-optimality criterion) is stated in Murota [145]. Theorem
7.15 (optimality for submodular set functions) can be found as Theorem 7.2 in Fu-
jishige [65]. Theorem 7.17 (characterizationby minimizers) is a corollaryof Theorem
7.45 due to Murota–Shioura [152]. A thorough study of minimizers of submodular
functions is made in Topkis [202].
The L-proximity theorem (Theorem 7.18) is due to Iwata–Shigeno [105]. The
present proof based on (L
-APR[Z]) is by Murota–Shioura [154].
The construction of the convex extension of an L-convex function by means
of the Lovász extensions (Theorem 7.19) is due to Murota [140]. The same idea,
however, was used earlier by Favati–Tardella [49] for submodular integrally con-
vex functions. The equivalence of L
-convexity to submodular integral convexity
(Theorem 7.21) is due to Fujishige–Murota [68].
Polyhedral L-convex functions are investigated by Murota–Shioura [152], to
which all the theorems in section 7.8 (Theorems 7.26, 7.28, 7.29, 7.30, 7.31, 7.32,
and 7.33) as well as Proposition 7.34 are ascribed. L-convexity for nonpolyhedral
convex functions is considered in Murota–Shioura [156], [157].
The correspondence between positively homogeneous L-convex functions and
submodular set functions (Theorem 7.40) is established for the case of Z in Murota
[140] and generalized to the case of R in Murota–Shioura [152]. Proposition 7.37 is
stated in Murota [147].
Theorem 7.43 for directional derivatives and subgradients is shown for the case
of Z in Murota [140], [141], and generalized to the case of R in Murota–Shioura[152].
Theorem 7.45 (characterizations in terms of directional derivatives, subdiﬀerentials,sidca00si
2013/2/12
page 203
7.11. Quasi L-Convex Functions 203
and minimizers) is by [152], whereas its ramiﬁcation with integrality (Theorem 7.46)
is stated in Murota [147].
The concept of quasi L-convex functions was introduced by Murota–Shioura
[154] on the basis of the idea of Milgrom–Shannon [129]. Theorem 7.52 is due to
[129], and the other theorems in section 7.11 (Theorems 7.49, 7.51, 7.53, and 7.54)
are in [154].sidca00si
2013/2/12
page 205
Chapter 8
Conjugacy and Duality
By addressing the issues of conjugacy and duality, this chapter provides the the-
oretical climax of discrete convex analysis. Whereas conjugacy in convex analysis
gives a symmetric one-to-one correspondence within a single class of closed convex
functions, conjugacy in discrete convex analysis establishes a one-to-one correspon-
dence between two diﬀerent classes of discrete functions with diﬀerent combinatorial
properties distinguished by “L” and “M.” The conjugacy between L-convexity and
M-convexity is thus one of the most remarkable features of discrete convex analysis.
Discrete duality is another distinguishing feature. It is expressed in a number of the-
orems, such as the separation theorems for M-convex/M-concave functions and for
L-convex/L-concavefunctions (M- and L-separation theorems) and the Fenchel-type
duality theorem. Besides formal parallelism with convex analysis, these discrete du-
ality theorems carry deep combinatorial facts, implying, for example, Edmonds’s
intersection theorem and Frank’s discrete separation theorem for submodular set
functions as special cases.
## 8.1 Conjugacy
M-convex functions and L-convex functions form two distinct classes of discrete
functions that are conjugate to each other under the Legendre–Fenchel transfor-
mation. This stands in sharp contrast with conjugacy in convex analysis, which
is a symmetric one-to-one correspondence within a single class of closed convex
functions. The conjugacy correspondence between M-convexity and L-convexity is
in fact a translation of two diﬀerent combinatorial properties, exchangeability and
submodularity, on top of convexity. The relationship between submodularity and
supermodularity with respect to conjugacy is discussed ﬁrst in section 8.1.1. Con-
jugacy for polyhedral M-/L-convex functions is established in section 8.1.2 and that
for integer-valued M-/L-convex functions on integer points in section 8.1.3.
205sidca00si
2013/2/12
page 206
## 206 Chapter 8. Conjugacy and Duality
## 8.1.1 Submodularity under Conjugacy
Submodularity and supermodularity are not symmetric under the Legendre–Fenchel
transformation. The conjugate of a submodular function is always supermodular,
whereas the conjugate of a supermodular function is not necessarily submodular.
In this subsection we assume that f is a function in real variables, f : RV
→
R ∪ {+∞}, with a nonempty eﬀective domain. Recall that f is submodular if
f(x) + f(y) ≥ f(x ∨ y) + f(x ∧ y) (x,y ∈ RV
) (8.1)
and supermodular if
f(x) + f(y) ≤ f(x ∨ y) + f(x ∧ y) (x,y ∈ RV
). (8.2)
Also recall from (3.26) that the Legendre–Fenchel transform f•
: RV
→ R∪{+∞}
is deﬁned by
f•
(p) = sup{ p,x − f(x) | x ∈ RV
} (p ∈ RV
). (8.3)
Theorem 8.1. For a submodular function f, the Legendre–Fenchel transform f•
is supermodular.
Proof. For x,y ∈ RV
and p,q ∈ RV
, we have
p,x + q,y ≤ p ∨ q,x ∨ y + p ∧ q,x ∧ y .
From this inequality, submodularity (8.1), and the deﬁnition (8.3), we see that
[ p,x − f(x)] + [ q,y − f(y)]
≤ [ p ∨ q,x ∨ y − f(x ∨ y)] + [ p ∧ q,x ∧ y − f(x ∧ y)]
≤ f•
(p ∨ q) + f•
(p ∧ q).
Taking the supremum over x and y we obtain
f•
(p) + f•
(q) ≤ f•
(p ∨ q) + f•
(p ∧ q),
which shows the supermodularity of f•
.
In contrast to Theorem 8.1, the Legendre–Fenchel transform of a supermodular
function is not necessarily submodular. For example, consider a pair of convex
quadratic functions f(x) = 1
2 x
Ax and g(p) = 1
2 p
A−1
p with
A =
1
8
⎡
⎣
8 4 1
4 8 4
1 4 8
⎤
⎦, A−1
=
1
35
⎡
⎣
48 −28 8
−28 63 −28
8 −28 48
⎤
⎦.
We have g = f•
by Proposition 2.9, whereas f is supermodular and g is not sub-
modular by Proposition 2.6.sidca00si
2013/2/12
page 207
8.1. Conjugacy 207
If n = 2, however, supermodularity does imply submodularity of the Legendre–
Fenchel transform.
Proposition 8.2. For a supermodular function f in two variables, the Legendre–
Fenchel transform f•
is submodular.
Proof. It suﬃces to show that
f•
(p(1),p(2)) + f•
(q(1),q(2)) ≤ f•
(p(1),q(2)) + f•
(q(1),p(2)) (8.4)
for p = (p(1),p(2)) ∈ R2
and q = (q(1),q(2)) ∈ R2
with p(1) ≥ q(1) and p(2) ≥
q(2). We claim that
[ p,x − f(x)] + [ q,y − f(y)] ≤ f•
(p(1),q(2)) + f•
(q(1),p(2)) (8.5)
for any x = (x(1),x(2)) ∈ R2
and y = (y(1),y(2)) ∈ R2
. The inequality (8.4) is an
immediate consequence of (8.5), since the supremum of the left-hand side of (8.5)
over x and y coincides with the left-hand side of (8.4).
Proof of (8.5): If x(1) ≥ y(1) and x(2) ≥ y(2), we have
p,x + q,y = (p(1),q(2)),(x(1),y(2)) + (q(1),p(2)),(y(1),x(2)) ,
f(x) + f(y) ≥ f(x(1),y(2)) + f(y(1),x(2)),
and, therefore,
LHS of (8.5) ≤ [ (p(1),q(2)),(x(1),y(2)) − f(x(1),y(2))]
+ [ (q(1),p(2)),(y(1),x(2)) − f(y(1),x(2))]
≤ f•
(p(1),q(2)) + f•
(q(1),p(2)) = RHS of (8.5).
If x(1) ≤ y(1), we have
p,x + q,y ≤ (p(1),q(2)),y + (q(1),p(2)),x ,
and, therefore,
LHS of (8.5) ≤ [ (p(1),q(2)),y − f(y)] + [ (q(1),p(2)),x − f(x)]
≤ f•
(p(1),q(2)) + f•
(q(1),p(2)) = RHS of (8.5).
A similar argument holds for the case of x(2) ≤ y(2).
By Theorem 8.1, submodularity is preserved under the transformation f →
−f•
. However, this does not establish a symmetric one-to-one correspondence
within the class of submodular functions. It is not true, either, that the map-
ping f → f•
gives a one-to-one correspondence between the class of submodular
functions and the class of supermodular functions.sidca00si
2013/2/12
page 208
## 208 Chapter 8. Conjugacy and Duality
## 8.1.2 Polyhedral M-/L-Convex Functions
Conjugacy for polyhedral M-convex and L-convex functions is considered here. We
start with a technical lemma.
Proposition 8.3. Let g ∈ L[R → R] be a polyhedral L-convex function. For
x,y ∈ RV
with inf g[−x] > −∞ and inf g[−y] > −∞ and for u ∈ supp+
(x − y),
there exists v ∈ supp−
(x − y) such that
p(v) − p(u) ≤ q(v) − q(u) (∀p ∈ argming[−x],∀q ∈ argming[−y]). (8.6)
Proof. We may assume argming[−x] = ∅ and argming[−y] = ∅. By Proposition
7.34, we have argming[−x] ∈ L0[R] and argming[−y] ∈ L0[R]. It suﬃces to
demonstrate the existence of v ∈ supp−
(x−y) such that p(v) ≤ q(v) for all p ∈ Dx
and q ∈ Dy, where
Dx = {p | p ∈ argming[−x], p(u) = 0} ∈ L
0[R],
Dy = {q | q ∈ argming[−y], q(u) = 0} ∈ L
0[R].
To prove this by contradiction, suppose that for every v ∈ supp−
(x−y) there exist
pv ∈ Dx and qv ∈ Dy with pv(v) > qv(v). Then, for
p∗ =
;
{pv | v ∈ supp−
(x − y)}, q∗ =
<
{qv | v ∈ supp−
(x − y)},
we have p∗ ∈ Dx, q∗ ∈ Dy, and p∗(v) > q∗(v) (∀v ∈ supp−
(x − y)). By deﬁning
p
= (p∗ − λ1) ∨ q∗ =

p∗(v) − λ (v ∈ supp+
(p∗ − q∗)),
q∗(v) (v ∈ V \ supp+
(p∗ − q∗)),
q
= p∗ ∧ (q∗ + λ1) =

q∗(v) + λ (v ∈ supp+
(p∗ − q∗)),
p∗(v) (v ∈ V \ supp+
(p∗ − q∗)),
with λ = min{p∗(v) − q∗(v) | v ∈ supp+
(p∗ − q∗)} > 0, we obtain
g(p∗) + g(q∗) ≥ g(p
) + g(q
) (8.7)
from Theorem 7.29. By supp−
(x −y) ⊆ supp+
(p∗ − q∗), on the other hand, we see
p
,x + q
,y − p∗,x − q∗,y
= λ

{y(v) − x(v) | v ∈ supp+
(p∗ − q∗)}
+
=
(q∗(v) − p∗(v))(x(v) − y(v)) | v ∈ V \ supp+
(p∗ − q∗)
>
≥ λ

{y(v) − x(v) | v ∈ V \ {u}} = λ{x(u) − y(u)} > 0, (8.8)
where the last equality is due to x(V ) = y(V ) = r (the constant in (TRF[R])).
Combining (8.7) and (8.8) results in
g[−x](p
) + g[−y](q
) < g[−x](p∗) + g[−y](q∗),sidca00si
2013/2/12
page 209
8.1. Conjugacy 209
which is a contradiction to p∗ ∈ argming[−x] and q∗ ∈ argming[−y].
The conjugacy theorem for polyhedral M-convex and L-convex functions is
now stated.
Theorem 8.4 (Conjugacy theorem).
(1) The classes of polyhedral M-convex functions and polyhedral L-convex func-
tions, M = M[R → R] and L = L[R → R], are in one-to-one correspondence
under the Legendre–Fenchel transformation (8.3). That is, for f ∈ M and g ∈ L,
we have f•
∈ L, g•
∈ M, f••
= f, and g••
= g.
(2) The classes of polyhedral M
-convex functions and polyhedral L
-convex
functions, M
[R → R] and L
[R → R], are in one-to-one correspondence under
(8.3) in a similar manner.
Proof. (1) and (2) are equivalent, so we prove (1). We ﬁrst note that f••
= f for
any polyhedral convex function f.
For f ∈ M we have ∂Rf•
(p) = argminf[−p] ∈ M0[R] (∀p ∈ domf•
) by
Proposition 6.53. Then f•
∈ L by (c)⇒(a) in Theorem 7.45. (An alternative proof
is described in the proof of Theorem 8.6.)
Conversely, take g ∈ L and x,y ∈ domg•
. Since inf g[−x] > −∞ and
inf g[−y] > −∞, Proposition 8.3 shows that for every u ∈ supp+
(x − y) there
exists v ∈ supp−
(x − y) satisfying (8.6). Noting that (δarg ming[−x])•
= (g•
)
(x;·),
which follows from (3.30) and (3.33), we obtain
(g•
)
(x;v,u) + (g•
)
(y;u,v) = sup{p(v) − p(u) | p ∈ argming[−x]}
+ sup{q(u) − q(v) | q ∈ argming[−y]}
≤ 0.
This shows (M-EXC
[R]) for g•
, and hence g•
∈ M.
Theorem 8.4 (2) states that L
-convex functions and M
-convex functions are
transformed to each other, where L
-convex functions are submodular (Theorem
7.28) and M
-convex functions are supermodular (Theorem 6.51). It is noted that
Theorem 8.4 (2) does not imply, nor is it implied by, Theorem 8.1, which shows the
supermodularity of the conjugate of a submodular function.
Recalling the basic fact that the conjugate of the indicator function of a con-
vex set is a positively homogeneous convex function, and vice versa, we see from
Theorem 8.4 above that M-convex polyhedra M0[R] and positively homogeneous
L-convex functions 0L[R → R] are conjugate to each other and also that L-convex
polyhedra L0[R] and positively homogeneous M-convex functions 0M[R → R] are
conjugate to each other. On the other hand, we can identify positively homogeneous
L-convex functions 0L[R → R] with submodular set functions S[R] (Theorem 7.40)
and positively homogeneous M-convex functions 0M[R → R] with distance func-
tions with the triangle inequality T [R] (Theorem 6.59). We can summarize thesesidca00si
2013/2/12
page 210
## 210 Chapter 8. Conjugacy and Duality
one-to-one correspondences in the following diagram:
M0[R] ←→ 0L[R → R] ←→ S[R]
M[R → R] ←→ L[R → R]
T [R] ←→ 0M[R → R] ←→ L0[R]
(8.9)
In addition, the polarity between M-convex cones and L-convex cones follows
from (8.9). This is because two convex cones are polar to each other if and only if
their indicator functions are conjugate to each other. Thus we obtain the following
theorem.
Theorem 8.5. A polyhedral cone is M-convex if and only if its polar cone is L-
convex. Hence, the classes of M-convex cones and L-convex cones are in one-to-one
correspondence under polarity (3.34).
Taking integrality into account in diagram (8.9), we obtain
M0[Z|R] ←→ 0L[R → R|Z] ←→ S[Z]
M[Z|R → R] ←→ L[R → R|Z]
M[R → R|Z] ←→ L[Z|R → R]
T [Z] ←→ 0M[R → R|Z] ←→ L0[Z|R]
(8.10)
where M[Z|R → R] and L[Z|R → R] denote the sets of integral polyhedral M-
convex and L-convex functions, respectively; M[R → R|Z] and L[R → R|Z] denote
the sets of dual-integral polyhedral M-convex and L-convex functions, respectively;
and 0M[R → R|Z] and 0L[R → R|Z] are their subclasses with positive homogene-
ity.52
It is known that the conjugacy relationship between M-convexity and L-
convexity holds more generally for closed proper convex functions. Recall that
the Legendre–Fenchel transformation gives a symmetric one-to-one correspondence
in the class of all closed proper convex functions (Theorem 3.2).
Theorem 8.6. A closed proper convex function f satisﬁes (M-EXC[R]) if and
only if f = g•
for a closed proper convex function g that satisﬁes (SBF[R]) and
(TRF[R]).
Proof. The proof of the “if” part is essentially the same as the latter half of
the proof of Theorem 8.4. The “only if” part needs a new approach, since the
implication (c)⇒(a) in Theorem 7.45 does not carry over to nonpolyhedral convex
functions. Suppose that f satisﬁes (M-EXC[R]) and put g = f•
. It is easy to show
(TRF[R]) for g. The proof of the submodularity (SBF[R]) for g consists of the
following steps.
52The notation for dual integrality extends naturally to other classes of functions. For example,
M[R → R|Z] and L[R → R|Z] denote the sets of dual-integral polyhedral M-convex and
L-convex functions, respectively.sidca00si
2013/2/12
page 211
8.1. Conjugacy 211
1. We may assume that domf is bounded, so that domg = RV
.
2. For p0 ∈ RV
and U ⊆ V with |U| = 2, denote by ˆ f : RU
→ R ∪ {+∞} the
projection of f[−p0] to U and by ĝ : RU
→ R the restriction of g(p0 + p) to
U. Then we have ĝ = ( ˆ f)•
.
3. (M-EXC[R]) of f implies the supermodularity of ˆ f.
4. The supermodularity of ˆ f implies the submodularity of ( ˆ f)•
by Proposi-
tion 8.2.
5. The submodularity of ĝ for any p0 and any U implies the submodularity of g.
The details are given in Murota–Shioura [156], [157].
Note 8.7. With Theorem 8.4 we complete the proof of Theorem 6.63 (characteriza-
tions of polyhedral M-convex functions). (b) ⇔ (c) follows from δ∂Rf(x)
•
= f
(x;·)
in (3.33) and the correspondence between L0[R] and 0M[R → R], which is a
special case of Theorem 8.4. To show (a) ⇔ (c) ⇔ (d), put g = f•
and note
that ∂Rf(x) = argming[−x] and argminf[−p] = ∂Rg(p). By Theorem 8.4 and
Theorem 7.45 (characterizations of polyhedral L-convex functions), we see that
f ∈ M[R → R] ⇔ g ∈ L[R → R] ⇔ argming[−x] ∈ L0[R] ⇔ ∂Rg(p) ∈ M0[R].
Note 8.8. We complete the proof of Theorem 6.45 using Theorem 6.63 ((d) ⇒
(a)) established in Note 8.7. Let f be the convex extension of f ∈ M[Z → R]. For
any p ∈ RV
, argminf[−p] is an M-convex polyhedron if it is not empty (Theorem
6.43). Since f is polyhedral by the assumption, Theorem 6.63 ((d) ⇒ (a)) shows
f ∈ M[R → R].
Note 8.9. Using Theorem 8.5, we complete the proof of (4.42), the representation
of an M-convex cone in terms of vectors χu − χv (u,v ∈ V ). Let B be an M-
convex cone and D be the polar of B. By Theorem 8.5, D is an L-convex cone,
and by (5.18) it can be represented as D = {p ∈ RV
| p,ai ≤ 0 (i = 1,...,m)}
for some ai = χui − χvi (i = 1,...,m). Since B is the polar of D, this implies
B = {x ∈ RV
| x is a nonnegative combination of ai (i = 1,...,m)} by (3.36).
Conversely, a convex cone of this form is M-convex, as can be shown by reversing
the above argument.
Note 8.10. Using Theorem 8.5, we complete the proof of (5.21), the representation
of an L-convex cone in terms of a ring family D ⊆ 2V
. Let D be an L-convex cone
and B be the polar of D. By Theorem 8.5, B is an M-convex cone, and, by (4.39),
it can be represented as B = B(ρ) using ρ ∈ S[R] with ρ : 2V
→ {0,+∞}; i.e.,
B = {x ∈ RV
| χX,x ≤ 0 (∀X ∈ D \ {V }), χV ,x = 0}
with D = domρ, which is a ring family. Since D is the polar of B, this implies
D =
(
p =

X∈D
cXχX
)
)
)
)
)
cX ≥ 0 (X ∈ D \ {V })
*sidca00si
2013/2/12
page 212
## 212 Chapter 8. Conjugacy and Duality
by (3.36). Conversely, a convex cone of this form is L-convex, as can be shown by
reversing the above argument.
## 8.1.3 Integral M-/L-Convex Functions
We turn to functions deﬁned on integer points.
For functions f : ZV
→ R∪{+∞} and h : ZV
→ R∪{−∞}, discrete versions
of the Legendre–Fenchel transformations are deﬁned by
f•
(p) = sup{ p,x − f(x) | x ∈ ZV
} (p ∈ RV
), (8.11)
h◦
(p) = inf{ p,x − h(x) | x ∈ ZV
} (p ∈ RV
). (8.12)
We call (8.11) and (8.12), respectively, convex and concave discrete Legendre–
Fenchel transformations. The functions f•
: RV
→ R ∪ {±∞} and h◦
: RV
→
R ∪ {±∞} are called the convex conjugate of f and the concave conjugate of h,
respectively. Note that h◦
(p) = −(−h)•
(−p).
For an integer-valued function f, f•
(p) is integral for an integer vector p.
Hence, (8.11) with p ∈ ZV
deﬁnes a transformation of f : ZV
→ Z ∪ {+∞} to
f•
: ZV
→ Z ∪ {±∞}; we refer to (8.11) with p ∈ ZV
as (8.11)Z. We call (f•
)•
using (8.11)Z the integer biconjugate of f and denote it by f••
. Similarly, (8.12)
with p ∈ ZV
is designated by (8.12)Z and we deﬁne h◦◦
= (h◦
)◦
.
The following fact is fundamental for the conjugacy of discrete functions.
Proposition 8.11. For a function f : ZV
→ Z ∪ {+∞} and a point x ∈ domZf,
we have f••
(x) = f(x) if ∂Zf(x) = ∅, where f••
means the integer biconjugate with
respect to the discrete Legendre–Fenchel transformation (8.11)Z.
Proof. For p ∈ ∂Zf(x), we have f•
(p) = p,x − f(x) (cf. (3.30)), and therefore
f••
(x) = sup{ q,x − f•
(q) | q ∈ ZV
} ≥ p,x − f•
(p) = f(x). On the other hand,
f••
(x) ≤ f(x) for any f and x.
The conjugacy theorem for discrete M-convex and L-convex functions reads
as follows.
Theorem 8.12 (Discrete conjugacy theorem).
(1) The classes of integer-valued M-convex functions and integer-valued L-
convex functions, M = M[Z → Z] and L = L[Z → Z], are in one-to-one cor-
respondence under the discrete Legendre–Fenchel transformation (8.11)Z. That is,
for f ∈ M and g ∈ L, we have f•
∈ L, g•
∈ M, f••
= f, and g••
= g.
(2) The classes of integer-valued M
-convex functions and integer-valued L
-
convex functions, M
[Z → Z] and L
[Z → Z], are in one-to-one correspondence
under (8.11)Z in a similar manner.
Proof. The basic idea of the proof is to apply Theorem 8.4 to the convex exten-
sions of f and g with additional arguments for discreteness. Since (1) and (2) are
equivalent, we deal with (2).sidca00si
2013/2/12
page 213
8.1. Conjugacy 213
(i) Take f ∈ M
[Z → Z]. Let f be the convex extension of f and f
•
be the
conjugate of f in the sense of (8.3). We have f•
(p) = f
•
(p) for p ∈ ZV
.
If domZf is bounded, f is polyhedral convex, and therefore f ∈ M
[R → R]
by Theorem 6.45. Then Theorem 8.4 shows f
•
∈ L
[R → R]. Since f•
(p) = f
•
(p)
for p ∈ ZV
, (SBF
[R]) for f
•
implies (SBF
[Z]) for f•
. Hence f•
∈ L
[Z → Z].
If domZf is unbounded, we consider the restriction fk of f to integer interval
[−k1,k1]Z for k ∈ Z large enough to ensure domZf ∩ [−k1,k1]Z = ∅. Then we
have fk ∈ M
[Z → Z] and f•
k ∈ L
[Z → Z] by the argument above. For each
p ∈ domZf•
, there exists kp such that f•
(p) = f•
k (p) for all k ≥ kp (cf. Theorem
6.42 and Proposition 3.30). Therefore, (SBF
[Z]) for f•
k implies (SBF
[Z]) for f•
.
Hence f•
∈ L
[Z → Z].
(ii) Take g ∈ L
[Z → Z]. Let g be the convex extension of g and g•
be the
conjugate of g in the sense of (8.3). We have
g•
(x) = sup{ p,x − g(p) | p ∈ ZV
} (x ∈ RV
) (8.13)
and, in particular, g•
(x) = g•
(x) (x ∈ ZV
).
If domZg is bounded, g is polyhedral convex, and therefore g ∈ L
[R → R]
by Theorem 7.26. Then g•
∈ M
[R → R] by Theorem 8.4, and g•
satisﬁes (M
-
EXC[R]) by Theorem 6.47. We claim that α0 = 1 is valid in (M
-EXC[R]) for
x,y ∈ domRg•
∩ ZV
= domZg•
. Then it follows that g•
satisﬁes (M
-EXC[Z])
and g•
∈ M
[Z → Z] by Theorem 6.2. To show α0 = 1, ﬁx x,y ∈ domZg•
,
u ∈ supp+
(x − y), and v ∈ supp−
(x − y) ∪ {0} in (M
-EXC[R]). By the assumed
boundedness of domZg, the supremum in (8.13) is attained by some p. Moreover,
there exist p0 ∈ ZV
and α1 > 0 such that
g•
(x − α(χu − χv)) = p0,x − α(χu − χv) − g(p0) (8.14)
for all α ∈ [0,α1]R. Condition (8.14) can be written as
p0 ∈ argming[−x + α(χu − χv)], (8.15)
which is equivalent, by the L-optimality criterion (Theorem 7.14 (2)), to
α εχY ,χv − χu ≤ g(p0 + εχY ) − g(p0) − εχY ,x (∀Y ⊆ V,ε = ±1).
Note that the right-hand side is an integer and the coeﬃcient of α on the left is
either ±1 or 0. By virtue of this integrality, the above inequality is satisﬁed by all
α ∈ [0,1]R if it is satisﬁed by some α > 0. Therefore, (8.14) holds for all α ∈ [0,1]R.
Similarly, there exists q0 ∈ ZV
such that
g•
(y + α(χu − χv)) = q0,y + α(χu − χv) − g(q0) (8.16)
for all α ∈ [0,1]R. Combining (8.14) and (8.16) shows
g•
(x − α(χu − χv)) + g•
(y + α(χu − χv)) − g•
(x) − g•
(y)
= α[p0(v) − p0(u) + q0(u) − q0(v)]sidca00si
2013/2/12
page 214
## 214 Chapter 8. Conjugacy and Duality
for all α ∈ [0,1]R. Hence α0 = 1 is valid.53
If domZg is unbounded, we consider the restriction gk of g to integer interval
[−k1,k1]Z for k ∈ Z large enough to ensure domZg ∩ [−k1,k1]Z = ∅. Then we
have gk ∈ L
[Z → Z] and g•
k ∈ M
[Z → Z] by the argument above. For each
x ∈ domZg•
, there exists kx such that g•
(x) = g•
k(x) for all k ≥ kx (cf. Theorem
7.20 and Proposition 3.30). Therefore, (M
-EXC[Z]) for g•
k implies (M
-EXC[Z])
for g•
. Hence g•
∈ M
[Z → Z].
(iii) Finally, f••
= f and g••
= g follow from Proposition 8.11, Theorem
6.61 (2), and Theorem 7.43 (2).
As the discrete counterpart of diagram (8.9), we obtain the following:
M0[Z] ←→ 0L[Z → Z] ←→ S[Z]
M[Z → Z] ←→ L[Z → Z]
T [Z] ←→ 0M[Z → Z] ←→ L0[Z]
(8.17)
This follows from the discrete conjugacy theorem (Theorem 8.12) in combination
with Theorems 7.40, 6.59, 4.15, and 5.5. In addition, we can obtain the M
-/L
-
version of (8.17).
The conjugacy relationship among discrete convex functions is schematized in
Fig. 8.1, where M
2-convex and L
2-convex functions are deﬁned in section 8.3. This is
the ultimate picture for the discrete conjugacy relationship, which originated in the
equivalence between the base family and the rank function of a matroid (section 2.4).
In other words, the exchange property and submodularity are conjugate to each
other at various levels.
Examples of mutually conjugate M-convex and L-convex functions are demon-
strated below for integer-valued functions deﬁned on integer points.
• In the network ﬂow problem in section 2.2, if fa ∈ C[Z → Z] and ga ∈ C[Z →
Z] are conjugate for each arc a ∈ A, then
f(x) = inf
ξ
(

a∈A
fa(ξ(a))
)
)
)
)
)
∂ξ(v) = −x(v)(v ∈ T),∂ξ(v) = 0(v ∈ V \ T)
*
,
g(p) = inf
η,p̃
(

a∈A
ga(η(a))
)
)
)
)
)
η(a) = −δp̃(a) (a ∈ A),p̃(v) = p(v)(v ∈ T)
*
in (2.42) and (2.43) are conjugate to each other. We will dwell on the conju-
gacy in network ﬂow in section 9.6.
• In a valuated matroid (V,B,ω), which arises, e.g., from a polynomial matrix
(section 2.4.2),
f(x) =

−ω(J) (x = χJ,J ∈ B),
+∞ (otherwise),
53An alternative proof is possible on the basis of (i)–(iii) below if (iii) is accepted as a known
fact: (i) (8.15) is equivalent to x − α(χu − χv) ∈ ∂Rg(p0), (ii) ∂Rg(p0) is an integral M-convex
polyhedron (Theorem 7.43 (2)), and (iii) for an integral M-convex polyhedron Q and x,y ∈ Q∩ZV ,
α0 = 1 is valid in (B-EXC[R]).sidca00si
2013/2/12
page 215
8.1. Conjugacy 215
M2-FNC
M-SET
= base polyhedron
M-FNC
M-PHF
≃ distance fnc.
L2-FNC
L-PHF
≃ submod. set fnc.
L-FNC
L-SET
- 
- 
conjugate
- 
- 
?
projection
?
restriction
M
2-FNC
M
-SET
= g-polymatroid
M
-FNC
M
-PHF
L
2-FNC
L
-PHF
≃ strong pair
L
-FNC
L
-SET
- 
conjugate
- 
- 
- 
(FNC = function, SET = set, PHF = positively homogeneous function)
Figure 8.1. Conjugacy in discrete convex functions.
g(p) = max
⎧
⎨
⎩
ω(J) +

j∈J
p(j)
)
)
)
)
)
)
J ∈ B
⎫
⎬
⎭
in (2.77) and (2.78) are conjugate to each other.
• If f ∈ M
[Z → Z] and g ∈ L
[Z → Z] are conjugate, then the restriction fU
and the projection gU
to a subset U ⊆ V are conjugate to each other and the
projection fU
and the restriction gU are conjugate to each other.
• If f ∈ M[Z → Z] and g ∈ L[Z → Z] are conjugate and ϕv ∈ C[Z → Z] and
ψv ∈ C[Z → Z] are conjugate for each v ∈ V , then
˜ f(x) = f(x) +

v∈V
ϕv(x(v)),sidca00si
2013/2/12
page 216
## 216 Chapter 8. Conjugacy and Duality
g̃(p) = inf
q∈ZV
+
g(q) +

v∈V
ψv(p(v) − q(v))
,
in (6.46) and (7.18) are conjugate to each other.
• If fi ∈ M
[Z → Z] and gi ∈ L
[Z → Z] are conjugate for i = 1,2, then
f12Z f2 ∈ M
[Z → Z] and g1 + g2 ∈ L
[Z → Z] are conjugate to each other.
Note 8.13. In section 2.1 we saw the conjugacy between M
-convex and L
-convex
quadratic functions in real variables (Theorems 2.11 and 2.16). This conjugacy
relationship does not have a discrete counterpart. Let f : Zn
→ Z be a quadratic
function represented as f(x) = x
Ax, with a positive-deﬁnite symmetric matrix A
with integer entries, and f•
: Zn
→ Z be the discrete Legendre–Fenchel transform
(8.11) of f. If A satisﬁes (6.26) through (6.28), then f is M
-convex and f•
is
L
-convex, but f•
is not necessarily a quadratic function. Likewise, if A satisﬁes
(7.10), then f is L
-convex and f•
is M
-convex, but f•
is not necessarily a quadratic
function. For instance, f(x) = x2
, where x ∈ Z, is an M
-convex function with
f•
(p) = sup
x∈Z
(px − x2
) = sup(0, ±p − 1, ±2p − 4, ±3p − 9,...),
which is not quadratic since f•
(−1) = f•
(0) = f•
(1) = 0.
## 8.2 Duality
Discrete duality theorems lie at the heart of discrete convex analysis. Major theo-
rems presented in this section are the separation theorem for M-convex/M-concave
functions (M-separation theorem), the separation theorem for L-convex/L-concave
functions (L-separation theorem), and the Fenchel-type duality theorem. These
theorems look quite similar to the corresponding theorems in convex analysis, but
they express, in fact, some deep facts of a combinatorial nature. Almost all dual-
ity results in optimization on matroids and submodular functions are corollaries of
these theorems.
## 8.2.1 Separation Theorems
We start by reviewing the preliminary general discussion in section 1.2. A discrete
separation theorem is a statement that, for f : ZV
→ Z ∪ {+∞} and h : ZV
→
Z ∪ {−∞} belonging to certain classes of functions, if f(x) ≥ h(x) for all x ∈ ZV
,
then there exist α∗
∈ Z and p∗
∈ ZV
such that
f(x) ≥ α∗
+ p∗
,x ≥ h(x) (∀x ∈ ZV
). (8.18)
Denoting by f the convex closure of f and by h the concave closure of h (i.e., −h is
the convex closure of −h), we observed the following phenomena in Examples 1.5
and 1.6:
1. f(x) ≥ h(x) (∀x ∈ ZV
)  =⇒ f(x) ≥ h(x) (∀x ∈ RV
),sidca00si
2013/2/12
page 217
8.2. Duality 217
2. f(x) ≥ h(x) (∀x ∈ ZV
)  =⇒ existence of α∗
∈ R and p∗
∈ RV
,
3. existence of α∗
∈ R and p∗
∈ RV
 =⇒ existence of α∗
∈ Z and p∗
∈ ZV
.
We will see below that all three implications hold true for M-convex and L-
convex functions. The following proposition addresses the ﬁrst.
Proposition 8.14.
(1) If f,−h ∈ M
[Z → R], then
f(x) ≥ h(x) (∀x ∈ ZV
) =⇒ f(x) ≥ h(x) (∀x ∈ RV
).
(2) If g,−k ∈ L
[Z → R], then
g(p) ≥ k(p) (∀p ∈ ZV
) =⇒ g(p) ≥ k(p) (∀p ∈ RV
).
Proof. (1) Theorem 6.44 with f1 = f and f2 = −h shows that f1 + f2 ≥ 0 implies
f1 + f2 ≥ 0.
(2) It suﬃces to prove the claim when g,−k ∈ L[Z → R]. Theorem 7.19
applied to g and −k shows this.
The separation theorem for M-convex/M-concave functions reads as follows.
It should be clear that f•
and h◦
are the convex and concave conjugate functions of
f and h deﬁned by (8.11) and (8.12), respectively. In the proof we use the notations
∂
R and ∂
Z for the concave version of subdiﬀerentials deﬁned as
∂
Rh(x) = −∂R(−h)(x), ∂
Zh(x) = −∂Z(−h)(x). (8.19)
Theorem 8.15 (M-separation theorem). Let f : ZV
→ R ∪ {+∞} be an M
-
convex function and h : ZV
→ R ∪ {−∞} be an M
-concave function such that
domZf ∩ domZh = ∅ or domRf•
∩ domRh◦
= ∅. If f(x) ≥ h(x) (∀x ∈ ZV
), there
exist α∗
∈ R and p∗
∈ RV
such that
f(x) ≥ α∗
+ p∗
,x ≥ h(x) (∀x ∈ ZV
). (8.20)
Moreover, if f and h are integer valued, there exist integer-valued α∗
∈ Z and
p∗
∈ ZV
.
Proof. We may assume f,−h ∈ M[Z → R].
(i) Suppose that domZf ∩ domZh = ∅. For the convex closure f of f and the
concave closure h of h, we have f(x) ≥ h(x) (∀x ∈ RV
) by Proposition 8.14 (1).
Since domRf ∩ domRh = ∅, the separation theorem in convex analysis (Theorem
3.5) gives α∗
∈ R and p∗
∈ RV
such that f(x) ≥ α∗
+ p∗
,x ≥ h(x) (∀x ∈ RV
)
(see Note 8.19). This implies (8.20) since f = f and h = h on ZV
by Theorem 6.42.
The integrality assertion is proved from the facts that the integer subdif-
ferential of an integer-valued M-convex function is an L-convex set and that L-
convex sets have the property of convexity in intersection. We may assume that
inf{f(x) − h(x) | x ∈ ZV
} = 0. Then there exists x0 ∈ ZV
with f(x0) − h(x0) = 0sidca00si
2013/2/12
page 218
## 218 Chapter 8. Conjugacy and Duality
(by the integrality of the function value). By (6.87) and Theorem 6.61 (2) we have
∂Rf(x0) ∩ ∂
Rh(x0) = ∂Rf(x0) ∩ ∂
Rh(x0) = ∂Zf(x0) ∩ ∂
Zh(x0),
which is nonempty since p∗
∈ ∂Rf(x0) ∩ ∂
Rh(x0). Since ∂Zf(x0) and ∂
Zh(x0)
above are L-convex, convexity in intersection for L-convex sets (5.9) guarantees
the existence of an integer vector p∗∗
∈ ∂Zf(x0) ∩ ∂
Zh(x0). With this p∗∗
and
α∗∗
= h(x0) − p∗∗
,x0 ∈ Z, the inequality (8.20) is satisﬁed.
(ii) Next suppose that domZf ∩ domZh = ∅ and domRf•
∩ domRh◦
= ∅. For
a ﬁxed p0 ∈ domRf•
∩ domRh◦
and for any p ∈ RV
, we have
f•
(p) = sup
x∈domZf
{ p − p0,x + [ p0,x − f(x)]} ≤ sup
x∈domZf
p − p0,x + f•
(p0),
h◦
(p) = inf
x∈domZh
{ p − p0,x + [ p0,x − h(x)]} ≥ inf
x∈domZh
p − p0,x + h◦
(p0),
from which follows
h◦
(p)−f•
(p) ≥
+
inf
x∈domZh
p − p0,x − sup
x∈domZf
p − p0,x
,
+h◦
(p0)−f•
(p0). (8.21)
Since domZf and domZh are disjoint M-convex sets, the separation theorem for M-
convex sets (Theorem 4.21) gives p∗
∈ RV
such that the right-hand side of (8.21)
with p = p∗
is nonnegative. With this p∗
and α∗
∈ R such that f•
(p∗
) ≤ −α∗
≤
h◦
(p∗
), the inequality (8.20) is satisﬁed.
For integer-valued f and h, we have f•
,−h◦
∈ L[Z|R → R] and, hence,
domRf•
,domRh◦
∈ L0[Z|R]. We may assume p0 ∈ ZV
by (5.9) and p∗
∈ ZV
by
Theorem 4.21. Then f•
(p∗
) and h◦
(p∗
) are integers, and therefore we can take an
integer α∗
∈ Z.
Next we state the separation theorem for L-convex/L-concave functions.
Theorem 8.16 (L-separation theorem). Let g : ZV
→ R ∪ {+∞} be an L
-
convex function and k : ZV
→ R ∪ {−∞} be an L
-concave function such that
domZg ∩ domZk = ∅ or domRg•
∩ domRk◦
= ∅. If g(p) ≥ k(p) (∀p ∈ ZV
), there
exist β∗
∈ R and x∗
∈ RV
such that
g(p) ≥ β∗
+ p,x∗
≥ k(p) (∀p ∈ ZV
). (8.22)
Moreover, if g and k are integer valued, there exist integer-valued β∗
∈ Z and
x∗
∈ ZV
.
Proof. We may assume g,−k ∈ L[Z → R].
(i) Suppose that domZg ∩ domZk = ∅. For the convex closure g of g and the
concave closure k of k, we have g(p) ≥ k(p) (∀p ∈ RV
) by Proposition 8.14 (2).
Since domRg ∩ domRk = ∅, the separation theorem in convex analysis (Theorem
3.5) gives β∗
∈ R and x∗
∈ RV
such that g(p) ≥ β∗
+ p,x∗
≥ k(p) (∀p ∈ RV
)
(see Note 8.19). This implies (8.22) since g = g and k = k on ZV
by Theorem 7.20.sidca00si
2013/2/12
page 219
8.2. Duality 219
The integrality assertion is proved from the facts that the integer subdif-
ferential of an integer-valued L-convex function is an M-convex set and that M-
convex sets have the property of convexity in intersection. We may assume that
inf{g(p) − k(p) | p ∈ ZV
} = 0. Then there exists p0 ∈ ZV
with g(p0) − k(p0) = 0
(by the integrality of the function value). By (6.87) and Theorem 7.43 (2), we have
∂Rg(p0) ∩ ∂
Rk(p0) = ∂Rg(p0) ∩ ∂
Rk(p0) = ∂Zg(p0) ∩ ∂
Zk(p0),
which is nonempty since x∗
∈ ∂Rg(p0) ∩ ∂
Rk(p0). Since ∂Zg(p0) and ∂
Zk(p0)
above are M-convex, convexity in intersection for M-convex sets (4.34) guarantees
the existence of an integer vector x∗∗
∈ ∂Zg(p0) ∩ ∂
Zk(p0). With this x∗∗
and
β∗∗
= k(p0) − p0,x∗∗
∈ Z, the inequality (8.22) is satisﬁed.
(ii) Next suppose that domZg ∩ domZk = ∅ and domRg•
∩ domRk◦
= ∅. For
a ﬁxed x0 ∈ domRg•
∩ domRk◦
and for any x ∈ RV
, we have
g•
(x) = sup
p∈domZg
{ p,x − x0 + [ p,x0 − g(p)]} ≤ sup
p∈domZg
p,x − x0 + g•
(x0),
k◦
(x) = inf
p∈domZk
{ p,x − x0 + [ p,x0 − k(p)]} ≥ inf
p∈domZk
p,x − x0 + k◦
(x0),
from which follows
k◦
(x)−g•
(x) ≥
+
inf
p∈domZk
p,x − x0 − sup
p∈domZg
p,x − x0
,
+k◦
(x0)−g•
(x0). (8.23)
Since domZg and domZk are disjoint L-convex sets, the separation theorem for L-
convex sets (Theorem 5.9) gives x∗
∈ RV
such that the right-hand side of (8.23) with
x = x∗
is nonnegative. With this x∗
and β∗
∈ R such that g•
(x∗
) ≤ −β∗
≤ k◦
(x∗
),
the inequality (8.22) is satisﬁed.
For integer-valued g and k we have g•
,−k◦
∈ M[Z|R → R] and, hence,
domRg•
,domRk◦
∈ M0[Z|R]. We may assume x0 ∈ ZV
by (4.34) and x∗
∈ ZV
by
Theorem 5.9. Then g•
(x∗
) and k◦
(x∗
) are integers, and therefore we can take an
integer β∗
∈ Z.
As an immediate corollary of the M-separation theorem we can obtain an op-
timality criterion for the problem of minimizing the sum of two M-convex functions,
which we call the M-convex intersection problem. Note that the sum of M-convex
functions is no longer M-convex and Theorem 6.26 (M-optimality criterion) does
not apply.
Theorem 8.17 (M-convex intersection theorem). For M
-convex functions f1,f2 ∈
M
[Z → R] and a point x∗
∈ domZf1 ∩ domZf2, we have
f1(x∗
) + f2(x∗
) ≤ f1(x) + f2(x) (∀x ∈ ZV
) (8.24)
if and only if there exists p∗
∈ RV
such that
f1[−p∗
](x∗
) ≤ f1[−p∗
](x) (∀x ∈ ZV
), (8.25)
f2[+p∗
](x∗
) ≤ f2[+p∗
](x) (∀x ∈ ZV
). (8.26)sidca00si
2013/2/12
page 220
## 220 Chapter 8. Conjugacy and Duality
Conditions (8.25) and (8.26) are equivalent, respectively, to
f1[−p∗
](x∗
) ≤ f1[−p∗
](x∗
+ χu − χv) (∀u,v ∈ V ∪ {0}), (8.27)
f2[+p∗
](x∗
) ≤ f2[+p∗
](x∗
+ χu − χv) (∀u,v ∈ V ∪ {0}), (8.28)
with the notation χ0 = 0, and for such a p∗
we have
argmin(f1 + f2) = argminf1[−p∗
] ∩ argminf2[+p∗
]. (8.29)
Moreover, if f1 and f2 are integer valued, i.e., f1,f2 ∈ M
[Z → Z], we can choose
integer-valued p∗
∈ ZV
.
Proof. The suﬃciency of (8.25) and (8.26) is obvious. Conversely, suppose that
(8.24) is true and apply the M-separation theorem (Theorem 8.15) to f(x) = f1(x)
and h(x) = f1(x∗
) + f2(x∗
) − f2(x) to obtain α∗
and p∗
satisfying (8.20). We have
α∗
= f1[−p∗
](x∗
) from (8.20) with x = x∗
and hence
f1(x) ≥ f1[−p∗
](x∗
) + p∗
,x ≥ f1(x∗
) + f2(x∗
) − f2(x).
This implies (8.25) and (8.26), which are equivalent to (8.27) and (8.28), respec-
tively, by the M-optimality criterion (Theorem 6.26 (2)). To prove (8.29) take
x̂ ∈ argmin(f1 + f2). Then
f1[−p∗
](x̂) + f2[+p∗
](x̂) = f1[−p∗
](x∗
) + f2[+p∗
](x∗
),
which, along with (8.25) and (8.26), implies x̂ ∈ argminf1[−p∗
] ∩ argminf2[+p∗
].
Hence follows ⊆ in (8.29), whereas ⊇ is obvious. Finally, the integrality of p∗
is due
to the integrality assertion in Theorem 8.15.
Note 8.18. The assumptions on the eﬀective domains are necessary in the sepa-
ration theorems (Theorems 8.15 and 8.16). For instance, for an M-convex function
f : Z2
→ Z ∪ {+∞} and an M-concave function h : Z2
→ Z ∪ {−∞} deﬁned by
f(x) =

x(1) (x(1) + x(2) = 1),
+∞ (otherwise),
h(x) =

−x(1) (x(1) + x(2) = −1),
−∞ (otherwise),
we have
f•
(p) =

p(2) (p(1) − p(2) = 1),
+∞ (otherwise),
h◦
(p) =

−p(2) (p(1) − p(2) = −1),
−∞ (otherwise),
domZf ∩domZh = ∅, and domZf•
∩domZh◦
= ∅. There exists no separating aﬃne
function for (f,h) or (f•
,h◦
).
Note 8.19. This is a technical supplement to the proof of the M-separation the-
orem (Theorem 8.15). (A similar remark applies to the proof of the L-separation
theorem.) We applied the separation theorem to f and h, the convex and concavesidca00si
2013/2/12
page 221
8.2. Duality 221
extensions of f and h, without verifying the assumption in Theorem 3.5. If f and
h are polyhedral, the assumption (a2) of Theorem 3.5 is met and the theorem is
literally applicable. If inf{f(x) − h(x) | x ∈ ZV
} is attained by some x = x0 ∈ ZV
,
we have
f(x) ≥ f(x0) + f

(x0;x − x0) ≥ h(x0) + h

(x0;x − x0) ≥ h(x),
in which the directional derivatives f

(x0;·) and h

(x0;·) of f and h at x0 are
polyhedral and Theorem 3.5 may be used for the pair of f(x0)+f

(x0;x−x0) and
h(x0) + h

(x0;x − x0). Otherwise we have to resort to a variant of the separation
theorem such as the following: Let f : ZV
→ R ∪ {+∞} and h : ZV
→ R ∪ {−∞}
be integrally convex and concave functions with domZf ∩ domZh = ∅, and denote
their convex and concave extensions by f and h. If f(x) ≥ h(x) (∀x ∈ RV
), then
there exist α∗
∈ R and p∗
∈ RV
such that f(x) ≥ α∗
+ p∗
,x ≥ h(x) (∀x ∈ RV
).
Note 8.20. The original proof of the M-separation theorem is based on an algo-
rithmic argument for a generalization of the submodular ﬂow problem involving an
M-convex cost function (Murota [142]). In particular, the argument is purely dis-
crete, not relying on the separation theorem in convex analysis. See sections 9.1.4
and 9.5.
## 8.2.2 Fenchel-Type Duality Theorem
The Fenchel-type duality theorem is discussed here. Before giving a precise state-
ment of the theorem we explain the essence of the assertion. For any functions
f : ZV
→ R ∪ {+∞} and h : ZV
→ R ∪ {−∞}, we have a chain of inequalities
inf{f(x) − h(x) | x ∈ ZV
} ≥ inf{f(x) − h(x) | x ∈ RV
}
≥ sup{h◦
(p) − f•
(p) | p ∈ RV
} ≥ sup{h◦
(p) − f•
(p) | p ∈ ZV
} (8.30)
from the deﬁnitions (8.11) and (8.12) of conjugate functions, where f and h are the
convex and concave closures of f and h, respectively. We observe the following:
1. The second inequality is in fact an equality (under certain regularity assump-
tions) by the Fenchel duality theorem in convex analysis (Theorem 3.6).
2. The ﬁrst inequality can be strict even when f is convex extensible and h is
concave extensible, as is demonstrated by Example 1.6. A similar statement
applies to the third inequality.
The following theorem asserts that the ﬁrst and third inequalities in (8.30) turn into
equalities for M
-convex/M
-concave functions and L
-convex/L
-concave functions
and that all three inequalities are equalities for such integer-valued functions.sidca00si
2013/2/12
page 222
## 222 Chapter 8. Conjugacy and Duality
Theorem 8.21 (Fenchel-type duality theorem).
(1) Let f : ZV
→ R∪{+∞} be an M
-convex function and h : ZV
→ R∪{−∞}
be an M
-concave function, i.e., f,−h ∈ M
[Z → R], such that domZf∩domZh = ∅
or domRf•
∩ domRh◦
= ∅. Then we have
inf{f(x) − h(x) | x ∈ ZV
} = sup{h◦
(p) − f•
(p) | p ∈ RV
}. (8.31)
If this common value is ﬁnite, the supremum is attained by some p ∈ domRf•
∩
domRh◦
.
(2) Let g : ZV
→ R∪{+∞} be an L
-convex function and k : ZV
→ R∪{−∞}
be an L
-concave function, i.e., g,−k ∈ L
[Z → R], such that domZg ∩ domZk = ∅
or domRg•
∩ domRk◦
= ∅. Then we have
inf{g(p) − k(p) | p ∈ ZV
} = sup{k◦
(x) − g•
(x) | x ∈ RV
}. (8.32)
If this common value is ﬁnite, the supremum is attained by some x ∈ domRg•
∩
domRk◦
.
(3) Let f : ZV
→ Z ∪ {+∞} be an integer-valued M
-convex function and h :
ZV
→ Z ∪ {−∞} be an integer-valued M
-concave function, i.e., f,−h ∈ M
[Z →
Z], such that domZf ∩ domZh = ∅ or domZf•
∩ domZh◦
= ∅. Then we have
inf{f(x) − h(x) | x ∈ ZV
} = sup{h◦
(p) − f•
(p) | p ∈ ZV
}. (8.33)
If this common value is ﬁnite, the inﬁmum is attained by some x ∈ domZf ∩domZh
and the supremum is attained by some p ∈ domZf•
∩ domZh◦
.
(4) Let g : ZV
→ Z ∪ {+∞} be an integer-valued L
-convex function and k :
ZV
→ Z∪{−∞} be an integer-valued L
-concave function, i.e., g,−k ∈ L
[Z → Z],
such that domZg ∩ domZk = ∅ or domZg•
∩ domZk◦
= ∅. Then we have
inf{g(p) − k(p) | p ∈ ZV
} = sup{k◦
(x) − g•
(x) | x ∈ ZV
}. (8.34)
If this common value is ﬁnite, the inﬁmum is attained by some p ∈ domZg∩domZk
and the supremum is attained by some x ∈ domZg•
∩ domZk◦
.
Proof. (1) Suppose that domZf ∩ domZh = ∅. By (8.30) we may assume that
Δ = inf{f(x) − h(x) | x ∈ ZV
} is ﬁnite. By the M-separation theorem (Theorem
8.15) for (f − Δ,h), there exist α∗
∈ R and p∗
∈ RV
such that
f(x) − Δ ≥ α∗
+ p∗
,x ≥ h(x)
for all x ∈ ZV
, which implies h◦
(p∗
) − f•
(p∗
) ≥ Δ. Combining this with (8.30)
shows (8.31) as well as the attainment of the supremum by p∗
. Next suppose that
domZf ∩ domZh = ∅ and domRf•
∩ domRh◦
= ∅. The separation theorem for
M-convex sets (Theorem 4.21) applied to B1 = domZh and B2 = domZf gives
p∗
∈ {0,±1}V
satisfying (4.33). Putting p = p0 + cp∗
in (8.21) (within the proof
of the M-separation theorem) and letting c → +∞, we obtain sup = +∞ in (8.31),
whereas inf = +∞ by domZf ∩ domZh = ∅.sidca00si
2013/2/12
page 223
8.2. Duality 223
(2) (The proof goes in parallel with (1).) Suppose that domZg ∩ domZk = ∅.
By (8.30) we may assume that Δ = inf{g(p) − k(p) | p ∈ ZV
} is ﬁnite. By the L-
separation theorem (Theorem 8.16) for (g−Δ,k), there exist β∗
∈ R and x∗
∈ RV
such that
g(p) − Δ ≥ β∗
+ p,x∗
≥ k(p)
for all p ∈ ZV
, which implies k◦
(x∗
) − g•
(x∗
) ≥ Δ. Combining this with (8.30)
shows (8.32) as well as the attainment of the supremum by x∗
. Next suppose
that domZg ∩ domZk = ∅ and domRg•
∩ domRk◦
= ∅. The separation theorem
for L-convex sets (Theorem 5.9) applied to D1 = domZk and D2 = domZg gives
x∗
∈ {0,±1}V
satisfying (5.10). Putting x = x0 + cx∗
in (8.23) (within the proof
of the L-separation theorem) and letting c → +∞, we obtain sup = +∞ in (8.32),
whereas inf = +∞ by domZg ∩ domZk = ∅.
(3) In the proof of (1) we can take α∗
∈ Z, p∗
∈ ZV
, and c ∈ Z. The supremum
and inﬁmum for ﬁnite (8.33) are attained since the functions are integer valued.
(4) In the proof of (2) we can take β∗
∈ Z, x∗
∈ ZV
, and c ∈ Z. The
supremum and inﬁmum for ﬁnite (8.34) are attained since the functions are integer
valued.
The M-separation and L-separation theorems are parallel or conjugate in their
statements as well as in their proofs. In contrast, the Fenchel-type duality theorem
for integer-valued functions is self-conjugate in that the substitution of f = g•
and
h = k◦
into (8.33) results in (8.34) by virtue of g = g••
and k = k◦◦
. To emphasize
the parallelism we have proved the M-separation theorem and the L-separation
theorem independently and derived the Fenchel-type duality theorem therefrom. It
is noted, however, that, with the knowledge of M-/L-conjugacy, these three duality
theorems are almost equivalent to one another; once one of them is established, the
other two can be derived by relatively easy formal calculations.
Note 8.22. In Theorem 8.21 (1) the inﬁmum is not necessarily attained by any
x ∈ ZV
(and similarly for (2)). For example, consider f : Z → R ∪ {+∞} and
h : Z → R ∪ {−∞} deﬁned by
f(x) =

exp(−x) (x ≥ 0),
+∞ (x < 0),
h(x) =

0 (x ≥ 0),
−∞ (x < 0),
which are M
-convex and M
-concave, respectively. We have domZf = domZh =
Z+, domRf•
= (−∞,0]R, domRh◦
= [0,+∞)R, and inf = sup = 0 in (8.31).
However, no x attains the inﬁmum, whereas the supremum is attained by p = 0.
Note 8.23. The assumptions on the eﬀective domains are necessary in Theorem
8.21. For the M-convex and M-concave functions f and h in Note 8.18, we have
domZf ∩ domZh = ∅ and domZf•
∩ domZh◦
= ∅. The identity (8.33) fails with
inﬁmum = +∞ and supremum = −∞.sidca00si
2013/2/12
page 224
## 224 Chapter 8. Conjugacy and Duality
M-separation theorem
f(x) ≥ α∗
+ p∗
,x ≥ h(x) Fenchel-type duality (Fujishige [62])
! Intersection theorem (Edmonds [44])
Fenchel-type duality
inf{f − h}
= sup{h◦
− f•
}
⎧
⎪ ⎪ ⎪ ⎪ ⎨
⎪ ⎪ ⎪ ⎪ ⎩
!
⇒ Discrete separation for submodular functions
(Frank [55])
⇒ Valuated matroid intersection
(Murota [135])
! ⇓
L-separation theorem Weighted matroid intersection
f•
(p) ≥ β∗
+ p,x∗
≥ h◦
(p) (Edmonds [45], Frank [54], Iri–Tomizawa [96])
Figure 8.2. Duality theorems (f: M
-convex function, h: M
-concave function).
## 8.2.3 Implications
In spite of the apparent similarity to the corresponding theorems in convex analysis,
the discrete duality theorems established above convey deep combinatorial proper-
ties of M-convex and L-convex functions. We now demonstrate this by deriving
major duality results in optimization on matroids and submodular functions as im-
mediate corollaries of these theorems (see also Fig. 8.2). The connection to the
duality in network ﬂow problems is discussed in Chapter 9.
Example 8.24. Frank’s discrete separation theorem (Theorem 4.17) is a special
case of the L-separation theorem (Theorem 8.16). By Proposition 7.4, the sub-
modular and supermodular set functions ρ and μ can be identiﬁed, respectively,
with an L
-convex function g : ZV
→ R ∪ {+∞} with domZg ⊆ {0,1}V
and an
L
-concave function k : ZV
→ R ∪ {−∞} with domZk ⊆ {0,1}V
by ρ(X) = g(χX)
and μ(X) = k(χX) for X ⊆ V . The L-separation theorem applies to (g,k) since
the ﬁrst assumption, domZg∩domZk = ∅, is met by g(0) = k(0) = 0, which follows
from ρ(∅) = μ(∅) = 0. We see β∗
= 0 from the inequality (8.22) for p = 0, and
then the desired inequality (4.27) is obtained from (8.22) with p = χX for X ⊆ V .
When ρ and μ are integer valued, g and k are also integer valued, and the integrality
assertion in the L-separation theorem implies the integrality assertion in Theorem
4.17.
Example 8.25. Edmonds’s intersection theorem (Theorem 4.18) in the integral
case is a special case of the Fenchel-type duality theorem (Theorem 8.21 (3)). This
is explained in Example 1.20.
Example 8.26. The Fenchel-type duality theorem for submodular set functions is a
special case of the Fenchel-type duality theorem for L
-convex functions (Theorem
8.21 (2), (4)). The conjugate functions of a submodular set function ρ : 2V
→
R∪{+∞} and a supermodular set function μ : 2V
→ R∪{−∞} (i.e., ρ,−μ ∈ S[R])sidca00si
2013/2/12
page 225
8.2. Duality 225
are deﬁned by
ρ•
(x) = max{x(X) − ρ(X) | X ⊆ V } (x ∈ RV
),
μ◦
(x) = min{x(X) − μ(X) | X ⊆ V } (x ∈ RV
).
The Fenchel-type duality theorem for submodular set functions is an identity
min{ρ(X) − μ(X) | X ⊆ V } = max{μ◦
(x) − ρ•
(x) | x ∈ RV
} (8.35)
with an additional integrality assertion that, for integer-valued ρ and μ, the maxi-
mum on the right-hand side of (8.35) can be attained by an integer vector x ∈ ZV
.
As in Example 8.24, we consider an L
-convex function g and an L
-concave function
k associated with ρ and μ. We have g•
= ρ•
, k◦
= μ◦
, and domZg ∩ domZk = ∅,
and, therefore, (8.35) is obtained as a special case of (8.32) and (8.34).
Example 8.27. Frank’s weight-splitting theorem for the weighted matroid in-
tersection problem is a special case of the optimality criterion for the M-convex
intersection problem (Theorem 8.17). Given two matroids (V,B1) and (V,B2) on
a common ground set V with base families B1 and B2, as well as a weight vec-
tor w : V → R, the optimal common base problem is to ﬁnd B ∈ B1 ∩ B2 that
minimizes the weight w(B) = v∈B w(v). Frank’s weight-splitting theorem says
that a common base B∗
∈ B1 ∩ B2 is optimal if and only if there exist real vectors
w∗
1,w∗
2 : V → R such that
(i) w = w∗
1 + w∗
2,
(ii) B∗
is a minimum-weight base of (V,B1) with respect to w∗
1, and
(iii) B∗
is a minimum-weight base of (V,B2) with respect to w∗
2.
In addition, the theorem states that, if w is integer valued, the vectors w∗
1 and w∗
2
can be chosen to be integer valued. The combinatorial content of this theorem lies
in the assertion about the existence of an integer weight splitting in the case of
integer-valued weight. Applying Theorem 8.17 to a pair of M-convex functions
f1(x) =

w(B) (x = χB,B ∈ B1),
+∞ (otherwise),
f2(x) =

0 (x = χB,B ∈ B2),
+∞ (otherwise)
yields p∗
satisfying (8.25) and (8.26) with additional integrality in the case of integer-
valued w. A weight splitting constructed by
w∗
1 = w − p∗
, w∗
2 = p∗
has the properties (ii) and (iii) because of (8.25) and (8.26). In Example 1.21 we
derived the weight-splitting theorem (integer-weight case) from the M-separation
theorem (Theorem 8.15).
Example 8.28. Suppose we are given two valuated matroids (V,ω1) and (V,ω2)
as well as a weight vector w : V → R. The valuated matroid intersection problem
is to ﬁnd B ⊆ V that maximizes w(B) + ω1(B) + ω2(B). The weight-splitting
theorem for valuated matroid intersection says that a common base B∗
maximizessidca00si
2013/2/12
page 226
## 226 Chapter 8. Conjugacy and Duality
w(B) + ω1(B) + ω2(B) if and only if there exist real vectors w∗
1,w∗
2 : V → R
such that
(i) w = w∗
1 + w∗
2,
(ii) B∗
maximizes ω1[w∗
1], and
(iii) B∗
maximizes ω2[w∗
2],
where ω1[w∗
1] and ω2[w∗
2] are deﬁned by (2.76). In addition, the theorem states that,
if ω1, ω2, and w are all integer valued, the vectors w∗
1 and w∗
2 can be chosen to be
integer valued. Let f1 and f2 be the M-convex functions associated, respectively,
with ω1 and ω2 by (2.77). Maximizing w(B) + ω1(B) + ω2(B) is equivalent to
minimizing f1(x) + f2[−w](x), and a desired weight splitting can be obtained from
the M-convex intersection theorem (Theorem 8.17) as in Example 8.27.
It is emphasized again that the discrete duality theorems are of combinatorial
nature and cannot be obtained through mere combination of the convex-extensibility
theorem (Theorems 6.42 and 7.20) with the separation theorem (Theorem 3.5) or the
Fenchel duality theorem (Theorem 3.6) for (ordinary) convex functions. Examples
1.5 and 1.6 should be convincing enough to demonstrate this point.
8.3 M2-Convex Functions and L2-Convex Functions
Two additional classes of discrete functions, called M2-convex functions and L2-
convex functions, are considered here. An M2-convex function is a function repre-
sentable as the sum of two M-convex functions, and an L2-convex function is the
integer inﬁmal convolution of two L-convex functions. These functions play crucial
roles in combinatorial optimization. In Edmonds’s intersection theorem (Theorem
4.18), for example, the left-hand side of the min-max relation (4.29) corresponds to
M2-convexity and the right-hand side to L2-convexity.
8.3.1 M2-Convex Functions
A function f : ZV
→ R ∪ {+∞} with domf = ∅ is said to be M2-convex if it can
be represented as the sum of two M-convex functions, i.e., if f = f1 + f2 for some
f1,f2 ∈ M[Z → R]. We denote by M2[Z → R] the set of M2-convex functions
and by M2[Z → Z] the subclass of M2-convex functions f = f1 + f2 with some
f1,f2 ∈ M[Z → Z]. An M
2-convex function is deﬁned similarly as the sum of two
M
-convex functions, which is obtained as the projection of an M2-convex function.
The notations M
2[Z → R] and M
2[Z → Z] are deﬁned in an obvious way. We have
M2[Z → R] ⊂ M
2[Z → R]
⊂
⊂
M[Z → R] ⊂ M
[Z → R]
M2[Z → Z] ⊂ M
2[Z → Z]
⊂
⊂
M[Z → Z] ⊂ M
[Z → Z]
(8.36)
Note that a set is M2-convex (resp., M
2-convex) if and only if its indicator function
is M2-convex (resp., M
2-convex).
The eﬀective domain and the set of minimizers of an M2-convex function are
M2-convex sets; the latter is a consequence of the M-convex intersection theorem
(Theorem 8.17).sidca00si
2013/2/12
page 227
8.3. M2-Convex Functions and L2-Convex Functions 227
Proposition 8.29.
(1) For an M2-convex function f, domf is M2-convex.
(2) For an M
2-convex function f, domf is M
2-convex.
Proof. This follows from the relation dom(f1 +f2) = domf1 ∩domf2 and the M-
or M
-convexity of domfi (i = 1,2) given in Proposition 6.7.
Proposition 8.30.
(1) For an M2-convex function f, argminf is M2-convex if it is not empty.
(2) For an M
2-convex function f, argminf is M
2-convex if it is not empty.
Proof. This follows from argmin(f1 + f2) = argminf1[−p∗
] ∩ argminf2[+p∗
] in
(8.29) and the M- or M
-convexity of argminf1[−p∗
] and argminf2[+p∗
] given in
Proposition 6.29.
M2-convexity implies integral convexity.
Theorem 8.31. An M
2-convex function is integrally convex. In particular, an
M
2-convex set is integrally convex.
Proof. For f = f1 + f2 with f1,f2 ∈ M
[Z → R] and x ∈ RV
, Theorem 6.44
implies
˜ f(x) = ˜ f1(x) + ˜ f2(x) = f1(x) + f2(x),
where ˜ f, ˜ f1, and ˜ f2 are the local convex extensions (3.61) of f, f1, and f2, respec-
tively, and f1 and f2 are the convex closures (3.56) of f1 and f2. Since f1 + f2 is
convex, so is ˜ f.
For the minimality of an M2-convex function we have the following criterion.
Theorem 8.32 (M2-optimality criterion). For an M2-convex function f ∈ M2[Z →
R] and x ∈ domf, we have
f(x) ≤ f(y) (∀y ∈ ZV
) ⇐⇒ f(x) ≤ f(x + χY − χZ) (∀Y,Z ⊆ V,|Y | = |Z|).
Proof. By Theorem 8.31 the optimality criterion for an integrally convex function
(Theorem 3.21) applies. We may impose the condition |Y | = |Z| because x(V ) is
constant for any x ∈ domf.
The optimality criterion above is not suitable for polynomial-time veriﬁcation.
If the summands f1 and f2 in f = f1 +f2 are known, the minimality can be veriﬁed
in polynomial time by the following criterion, as will be explained in Note 9.21. We
mention that the M-convex intersection theorem (Theorem 8.17) also serves as an
optimality criterion for M2-convex functions when the summands are known.sidca00si
2013/2/12
page 228
## 228 Chapter 8. Conjugacy and Duality
Theorem 8.33 (M2-optimality criterion). For M-convex functions f1,f2 ∈ M[Z →
R] and a point x ∈ domf1 ∩ domf2, we have
f1(x) + f2(x) ≤ f1(y) + f2(y) (∀y ∈ ZV
)
if and only if
k 
i=1
[f1(x − χui + χvi ) − f1(x)] +
k 
i=1
[f2(x + χui+1 − χvi ) − f2(x)] ≥ 0
for any u1,...,uk,v1,...,vk ∈ V with {u1,...,uk}∩{v1,...,vk} = ∅, where uk+1 =
u1 by convention.
Proof. The proof is given later in Note 9.21.
A scaling version of the optimality criterion above leads to a proximity theorem
for M2-convex functions.
Theorem 8.34 (M2-proximity theorem). Let f1,f2 ∈ M[Z → R] be M-convex
functions, and assume α ∈ Z++ and n = |V |. If xα
∈ domf1 ∩ domf2 satisﬁes
k 
i=1
[f1(xα
− α(χui − χvi )) − f1(xα
)] +
k 
i=1
[f2(xα
+ α(χui+1 − χvi )) − f2(xα
)] ≥ 0
for any u1,...,uk,v1,...,vk ∈ V with {u1,...,uk}∩{v1,...,vk} = ∅, where uk+1 =
u1, then argmin(f1 + f2) = ∅ and there exists x∗
∈ argmin(f1 + f2) with
||xα
− x∗
||∞ ≤
n2
2
(α − 1). (8.37)
Proof. See Murota–Tamura [162].
Straightforward calculations based on the M-convex intersection theorem yield
the following two theorems.
Theorem 8.35.
(1) For f1,f2 ∈ M
[Z → R] and x ∈ domf1 ∩ domf2, we have
∂R(f1 + f2)(x) = ∂Rf1(x) + ∂Rf2(x) = ∅.
(2) For f1,f2 ∈ M
[Z → Z] and x ∈ domf1 ∩ domf2, we have
∂Z(f1 + f2)(x) = ∂Zf1(x) + ∂Zf2(x) = ∅.
(3) For f ∈ M
2[Z → Z] and x ∈ domf, ∂Zf(x) is an L
2-convex set. For
f ∈ M2[Z → Z] and x ∈ domf, ∂Zf(x) is an L2-convex set.sidca00si
2013/2/12
page 229
8.3. M2-Convex Functions and L2-Convex Functions 229
Proof. Using the M-convex intersection theorem (Theorem 8.17), we see that
p ∈ ∂R(f1 + f2)(x)
⇐⇒ x ∈ argmin(f1 + f2[−p])
⇐⇒ ∃q ∈ RV
: x ∈ argminf1[−q] ∩ argminf2[−p + q]
⇐⇒ ∃q ∈ RV
: q ∈ ∂Rf1(x) and p − q ∈ ∂Rf2(x)
⇐⇒ p ∈ ∂Rf1(x) + ∂Rf2(x).
For (2) and (3), note that ∂Rfi(x) ∈ L
0[Z|R] from Theorem 6.61 (2).
For any f1,f2 : ZV
→ Z ∪ {+∞},
(f12Z f2)•
= f1
•
+ f2
•
, (8.38)
where 2Z denotes the integer inﬁmal convolution (6.43) and •
is the discrete
Legendre–Fenchel transformation (8.11)Z. A relation conjugate to this also holds
for M-convex functions as follows.
Theorem 8.36. For integer-valued M
-convex functions f1,f2 ∈ M
[Z → Z] with
domf1 ∩ domf2 = ∅, we have (f1 + f2)•
= f1
•
2Z f2
•
and (f1 + f2)••
= f1 + f2.
Proof. For p ∈ dom(f1 + f2)•
there exists q ∈ ZV
such that
(f1+f2)•
(p) = −min(f1+f2[−p]) = −minf1[−q]−minf2[−p+q] = f•
1 (q)+f•
2 (p−q)
by the M-convex intersection theorem (Theorem 8.17). This shows that (f1+f2)•
≥
f1
•
2Z f2
•
, whereas ≤ is obvious from p,x − f1(x) − f2(x) ≤ f•
1 (q) + f•
2 (p − q).
The second identity follows from the ﬁrst because of (8.38) and Theorem 8.12.
8.3.2 L2-Convex Functions
A function g : ZV
→ R ∪ {+∞} is said to be L2-convex if it can be represented
as the inﬁmal convolution of two L-convex functions, i.e., if g = g12Z g2 for some
g1,g2 ∈ L[Z → R]. We denote by L2[Z → R] the set of L2-convex functions
and by L2[Z → Z] the subclass of L2-convex functions g = g12Z g2 with some
g1,g2 ∈ L[Z → Z]. An L
2-convex function is deﬁned similarly as the integer inﬁmal
convolution of two L
-convex functions, which is obtained as the restriction of an
L2-convex function. The notations L
2[Z → R] and L
2[Z → Z] are deﬁned in an
obvious way. We have
L2[Z → R] ⊂ L
2[Z → R]
⊂
⊂
L[Z → R] ⊂ L
[Z → R]
L2[Z → Z] ⊂ L
2[Z → Z]
⊂
⊂
L[Z → Z] ⊂ L
[Z → Z]
(8.39)
Note that a set is L2-convex (resp., L
2-convex) if and only if its indicator function
is L2-convex (resp., L
2-convex).sidca00si
2013/2/12
page 230
## 230 Chapter 8. Conjugacy and Duality
Note 8.37. Here is a technical supplement concerning the deﬁnition of an L2-
convex function. By deﬁnition, a function g : ZV
→ R ∪ {+∞} is L2-convex if it
can be represented as
g(p) = inf{ĝ1(p1) + ĝ2(p2) | p = p1 + p2;p1,p2 ∈ ZV
} (8.40)
for some ĝ1,ĝ2 ∈ L[Z → R]. We may assume that the inﬁmum is attained for
each p ∈ domg. Namely, it is known that for an L2-convex function g there exist
L-convex functions g1,g2 ∈ L[Z → R] such that
g(p) = min{g1(p1) + g2(p2) | p = p1 + p2;p1,p2 ∈ ZV
} (p ∈ domg). (8.41)
As an example, consider a pair of L-convex functions in two variables:
ĝ1(p) = exp(p(2) − p(1)), ĝ2(p) = exp(p(1) − p(2)).
The inﬁmal convolution g = ĝ12Z ĝ2 is identically zero, with the inﬁmum in (8.40)
unattained. An obvious valid choice for (8.41) is g1 = g2 = 0 (identically).
Note 8.38. For g1,g2 ∈ L[Z → R], it can be shown that (g12Z g2)(p0) = −∞
(∃p0) =⇒ (g12Z g2)(p) = −∞ (∀p ∈ domg1 + domg2).
The eﬀective domain and the set of minimizers of an L2-convex function are
L2-convex sets.
Proposition 8.39.
(1) For an L2-convex function g, domg is L2-convex.
(2) For an L
2-convex function g, domg is L
2-convex.
Proof. This follows from the relation dom(g12Z g2) = domg1 +domg2 and the L-
or L
-convexity of domgi (i = 1,2) given in Proposition 7.8.
Proposition 8.40.
(1) For an L2-convex function g, argming is L2-convex if it is not empty.
(2) For an L
2-convex function g, argming is L
2-convex if it is not empty.
Proof. By (8.41) this follows from a general fact in Proposition 8.41 below and the
L- or L
-convexity of argmingi (i = 1,2) given in Proposition 7.16.
Proposition 8.41. If g1,g2 : ZV
→ R ∪ {+∞} are such that
for every p ∈ ZV
, inf{g1(p1) + g2(p2) | p = p1 + p2;p1,p2 ∈ ZV
}
is attained whenever it is ﬁnite,
(8.42)
then we have
argmin(g12Z g2)[−x] = argming1[−x] + argming2[−x] (∀x ∈ RV
). (8.43)sidca00si
2013/2/12
page 231
8.3. M2-Convex Functions and L2-Convex Functions 231
Proof. It suﬃces to prove
argmin(g12Z g2)[−x] ⊆ argming1[−x] + argming2[−x],
since the converse inclusion is always true, independently of (8.42). Take p∗
∈
argmin(g12Z g2)[−x]. By (8.42) there exist p∗
1 and p∗
2 such that p∗
= p∗
1 + p∗
2
and (g12Z g2)(p∗
) = g1(p∗
1) + g2(p∗
2). If g1[−x](p∗
1) > g1[−x](p1) for some p1, we
would have
(g12Z g2)[−x](p∗
) = g1[−x](p∗
1) + g2[−x](p∗
2)
> g1[−x](p1) + g2[−x](p∗
2) ≥ (g12Z g2)[−x](p1 + p∗
2),
a contradiction to the choice of p∗
. Hence p∗
1 ∈ argming1[−x]. Similarly, we have
p∗
2 ∈ argming2[−x].
The assumption (8.42) above is necessary for the identity (8.43) to hold. For
the functions ĝ1 and ĝ2 in Note 8.37, for instance, we have argmin(ĝ12Z ĝ2) = Z2
but argminĝ1 = argminĝ2 = ∅. For integer-valued functions, however, (8.42) is
always satisﬁed.
L2-convexity implies integral convexity.
Theorem 8.42. An L
2-convex function is integrally convex. In particular, an
L
2-convex set is integrally convex.
Proof. It suﬃces to consider L2-convex sets and functions. To emphasize the
essence we give a proof for the integral convexity of an L2-convex set. This im-
plies, by Theorem 3.29, the integral convexity of an L2-convex function g with a
bounded eﬀective domain, since argming[−x] is an L2-convex set for any x ∈ RV
by Proposition 8.40. A complete proof can be found in Murota–Shioura [153].
Let S be an L2-convex set represented as S = D1 + D2 with D1,D2 ∈ L0[Z].
We will show that p ∈ S ⇒ p ∈ S ∩ N(p) (see (3.71)). By S = D1 + D2 = D1 +D2
we have p = p1 + p2 for some p1 ∈ D1 and p2 ∈ D2. Put a1 = p1 − p1 and
a2 = p2 − p2, where 0 ≤ ak(v) < 1 for k = 1,2 and v ∈ V . Denoting the distinct
values among {a1(v),a2(v) | v ∈ V } by α1 > α2 > ··· > αm (≥ 0) and deﬁning
Uki = {v ∈ V | ak(v) ≥ αi} for k = 1,2 and i = 1,...,m, we have
ak =
m−1 
i=1
(αi − αi+1)χUki
+ αmχUkm
(k = 1,2),
and, hence,
p = p1 + p2 =
m 
i=0
(αi − αi+1)( p1 + χU1i + p2 − χU2i),
where α0 = 1, αm+1 = 0, and U10 = U20 = ∅. This implies p ∈ S ∩ N(p), since
qi = p1 + χU1i + p2 − χU2i belongs to S ∩ N(p) for i = 0,1,...,m, as shown
below.sidca00si
2013/2/12
page 232
## 232 Chapter 8. Conjugacy and Duality
[Proof of qi ∈ S] We have p1 + χU1i ∈ D1 by Theorem 5.10 for p1 ∈ D1.
Since −p2 ∈ −D2, we similarly see p2 − χU2i ∈ D2. Hence qi ∈ D1 + D2 = S.
[Proof of qi ∈ N(p)] We are to show
p(v) ∈ Z =⇒ qi(v) = p(v), (8.44)
p(v) / ∈ Z =⇒ p(v) ≤ qi(v) ≤ p(v) + 1. (8.45)
By p1 + p2 = p − a1 + a2 ∈ ZV
and −1 < −a1(v) + a2(v) < 1 (v ∈ V ), we have
p(v) ∈ Z =⇒ p1(v) + p2(v) = p(v), a1(v) = a2(v), (8.46)
p(v) / ∈ Z =⇒ p1(v) + p2(v) ∈ { p(v), p(v) + 1}. (8.47)
If p(v) ∈ Z, (8.46) shows χU1i (v) = χU2i (v), which implies (8.44). Suppose p(v) / ∈ Z.
We put
W = {v ∈ V | p1(v) + p2(v) = p(v) + 1}
and divide into two cases: (i) v ∈ W and (ii) v ∈ V \ W. In case (i), let i be such
that v ∈ U1i. Then v ∈ U2i follows from
a2(v) = p1(v) + p2(v) − p(v) + a1(v) = p(v) + 1 − p(v) + a1(v) ≥ a1(v) ≥ αi.
Therefore, −1 ≤ χU1i (v) − χU2i(v) ≤ 0, which implies (8.45). In case (ii), let i be
such that v ∈ U2i. Then v ∈ U1i follows from
a1(v) = − p1(v) − p2(v) + p(v) + a2(v) = − p(v) + p(v) + a2(v) ≥ a2(v) ≥ αi.
Therefore, 0 ≤ χU1i (v) − χU2i (v) ≤ 1, which implies (8.45).
For the minimality of an L2-convex function, we have the following criterion.
Theorem 8.43 (L2-optimality criterion). For an L2-convex function g ∈ L2[Z →
R] and p ∈ domg, we have
g(p) ≤ g(q) (∀q ∈ ZV
) ⇐⇒

g(p) ≤ g(p + χY ) (∀Y ⊆ V ),
g(p) = g(p + 1).
(8.48)
Proof. By Theorem 8.42 this is obtained as a special case of the optimality criterion
for an integrally convex function (Proposition 3.22).
A scaling version of the optimality criterion above leads to a proximity theorem
for L2-convex functions.
Theorem 8.44 (L2-proximity theorem). Let g : ZV
→ R∪{+∞} be an L2-convex
function such that g(p) = g(p + 1) (∀p ∈ ZV
), and assume α ∈ Z++ and n = |V |.
If pα
∈ domg satisﬁes
g(pα
) ≤ g(pα
+ αχY ) (∀Y ⊆ V ), (8.49)sidca00si
2013/2/12
page 233
8.3. M2-Convex Functions and L2-Convex Functions 233
then argming = ∅ and there exists p∗
∈ argming with
pα
≤ p∗
≤ pα
+ 2(n − 1)(α − 1)1. (8.50)
Proof. Let g be represented as (8.41) with L-convex functions g1 and g2, where
gi(p + 1) = gi(p) (∀p) for i = 1,2 as a consequence of g(p) = g(p + 1) (∀p). There
exist pα
1 ,pα
2 ∈ ZV
such that g(pα
) = g1(pα
1 ) + g2(pα
2 ) and pα
= pα
1 + pα
2 . For any
Y ⊆ V we have
g(pα
+ αχY ) ≤ min{g1(pα
1 + αχY ) + g2(pα
2 ), g1(pα
1 ) + g2(pα
2 + αχY )}
by the deﬁnition of inﬁmal convolution, whereas g1(pα
1 ) + g2(pα
2 ) = g(pα
) ≤ g(pα
+
αχY ) by (8.49). Hence
g1(pα
1 ) ≤ g1(pα
1 + αχY ), g2(pα
2 ) ≤ g2(pα
2 + αχY ) (∀Y ⊆ V ).
By the L-proximity theorem (Theorem 7.18) there exist p∗
1 ∈ argming1 and p∗
2 ∈
argming2 such that
pα
1 ≤ p∗
1 ≤ pα
1 + (n − 1)(α − 1)1, pα
2 ≤ p∗
2 ≤ pα
2 + (n − 1)(α − 1)1.
Then p∗
= p∗
1 + p∗
2 satisﬁes (8.50). Moreover, p∗
is a minimizer of g because
p∗
1 ∈ argming1 and p∗
2 ∈ argming2.
The following two theorems are the counterparts of Theorems 8.35 and 8.36.
Theorem 8.45.
(1) For g1,g2 ∈ L
[Z → R] with g12Z g2 > −∞ and (8.42) and p ∈ dom(g12Z g2),
there exist pi ∈ domgi (i = 1,2) such that p = p1 + p2 and
∂R(g12Z g2)(p) = ∂Rg1(p1) ∩ ∂Rg2(p2) = ∅.
(2) For g1,g2 ∈ L
[Z → Z] with g12Z g2 > −∞ and p ∈ dom(g12Z g2), there
exist pi ∈ domgi (i = 1,2) such that p = p1 + p2 and
∂Z(g12Z g2)(p) = ∂Zg1(p1) ∩ ∂Zg2(p2) = ∅.
(3) For g ∈ L
2[Z → Z] and p ∈ domg, ∂Zg(p) is an M
2-convex set. For
g ∈ L2[Z → Z] and p ∈ domg, ∂Zg(p) is an M2-convex set.
Proof. Recall the relation x ∈ ∂R(g12Z g2)(p) ⇔ p ∈ argmin(g12Z g2)[−x] from
(3.30), and use (8.43) and ∂Rgi(pi) ∈ M
0[Z|R], which is a variant of Theorem
7.43 (2).
Theorem 8.46. For integer-valued L
-convex functions g1,g2 ∈ L
[Z → Z]
with g12Z g2 > −∞, we have (g12Z g2)••
= g12Z g2, where •
means the discrete
Legendre–Fenchel transformation (8.11)Z.sidca00si
2013/2/12
page 234
## 234 Chapter 8. Conjugacy and Duality
Proof. Applying Theorem 8.36 to fi = gi
•
∈ M
[Z → Z] shows this.
Note 8.47. An L2-convex function g(p) = min{g1(q) + g2(p − q) | q ∈ ZV
},
represented as in (8.41), can be evaluated eﬃciently, since g1(q) + g2(p − q) is an
L-convex function in q, to which the minimization algorithms in section 10.3 can be
applied.
## 8.3.3 Relationship
The relationship between M2- and L2-convex functions is discussed here. The ﬁrst
theorem shows the conjugacy relationship between M2- and L2-convex functions.
Theorem 8.48. The two classes of functions M2[Z → Z] and L2[Z → Z] are
in one-to-one correspondence under the discrete Legendre–Fenchel transformation
(8.11)Z, and similarly for M
2[Z → Z] and L
2[Z → Z].
Proof. This is due to (8.38) and Theorems 8.36, 8.46, and 8.12.
Separable convex functions are characterized as functions possessing both M
2-
convexity and L
2-convexity.
Theorem 8.49. For a function f : ZV
→ R ∪ {+∞}, we have
f is M
2-convex and L
2-convex ⇐⇒ f is M
-convex and L
-convex
⇐⇒ f is separable convex.
Proof. It suﬃces to show that, if f is both M
2-convex and L
2-convex, then it is
separable convex. We may assume that domf is bounded. Take any p ∈ RV
. By
Propositions 8.30 and 8.40, the set argminf[−p] is both M
2-convex and L
2-convex,
and therefore it is an integer interval. This means that f is a separable convex
function.
## 8.4 Lagrange Duality for Optimization
## 8.4.1 Outline
On the basis of the conjugacy and duality theorems we can develop a Lagrange
duality theory for a (nonlinear) integer program:
P: Minimize c(x) subject to x ∈ B, (8.51)
where c : ZV
→ Z ∪ {+∞} and ∅ = B ⊆ ZV
. The canonical “convex” case consists
of problems in whichsidca00si
2013/2/12
page 235
8.4. Lagrange Duality for Optimization 235
(REG) B is an M-convex set, and
(OBJ) c is an M-convex function.
We refer to a problem with (REG) and (OBJ) as an M-convex program.
We follow Rockafellar’s conjugate duality approach [177] to convex/nonconvex
programs in nonlinear optimization. The whole scenario of the present section is
a straightforward adaptation of it, whereas the technical development leading to
a strong duality assertion for “convex” programs relies heavily on fundamental
theorems of a combinatorial nature. An adaptation of the Lagrangian function
in nonlinear programming aﬀords a duality framework that covers “nonconvex”
programs. We follow the notation of [177] to emphasize the parallelism.
In the canonical “convex” case, the problem dual to P turns out to be a
maximization of an L2-concave function, where the strong duality holds between the
pair of primal/dual problems. This is a consequence of the conjugacy between M2-
and L2-convexity and the Fenchel-type duality theorem for M-/L-convex functions.
In the literature of integer programming we can ﬁnd a number of duality
frameworks, such as the subadditive duality. The present approach is distinguished
from those in the following ways:
1. It is primarily concerned with nonlinear objective functions.
2. The theory parallels the perturbation-based duality formalism in nonlinear
programming.
3. In particular, the dual problem is derived from an embedding of the given
problem in a family of perturbed problems with a certain convexity in the
direction of perturbation.
4. It identiﬁes M-convex programs as the well-behaved core structure to be com-
pared to convex programs in nonlinear programming.
## 8.4.2 General Duality Framework
We describe the general framework, in which neither (REG) nor (OBJ) is assumed.
First we rewrite the problem P as follows:
P: Minimize f(x) subject to x ∈ ZV
(8.52)
with
f(x) = c(x) + δB(x), (8.53)
where δB : ZV
→ {0,+∞} is the indicator function of B. We say that the problem
P is feasible if f(x) < +∞ for some x ∈ ZV
.
Next we embed the optimization problem P in a family of perturbed problems.
As the perturbation of f we consider F : ZV
× ZU
→ Z ∪ {+∞}, with U being a
ﬁnite set, such that
F(x,0) = f(x), (8.54)
F(x,·)••
= F(x,·) for each x ∈ ZV
. (8.55)sidca00si
2013/2/12
page 236
## 236 Chapter 8. Conjugacy and Duality
Here the second condition (8.55) means that the integer biconjugate of F(x,u) as
a function in u for each ﬁxed x coincides with F(x,u) itself.
Note 8.50. By Proposition 8.11, the condition (8.55) is satisﬁed if, for each x,
either F(x,·) ≡ +∞ or the integer subdiﬀerential of F(x,u) with respect to u is
nonempty for each u ∈ domF(x,·). Recall that an integer-valued M
2- or L
2-convex
function has a nonempty integer subdiﬀerential (Theorems 8.35 and 8.45).
The resulting family of optimization problems, parametrized by u ∈ ZU
, reads
as follows:
P(u): Minimize F(x,u) subject to x ∈ ZV
. (8.56)
We deﬁne the optimal value function ϕ : ZU
→ Z ∪ {±∞} by
ϕ(u) = inf{F(x,u) | x ∈ ZV
} (u ∈ ZU
) (8.57)
and the Lagrangian function K : ZV
× ZU
→ Z ∪ {±∞} by
K(x,y) = inf{F(x,u) + u,y | u ∈ ZU
} (x ∈ ZV
,y ∈ ZU
). (8.58)
For each x ∈ ZV
, the function K(x,·) : y → K(x,y) is the concave discrete
Legendre–Fenchel transform of the function −F(x,·) : u → −F(x,u).
Our assumptions (8.54) and (8.55) on F(x,u) guarantee the following.
Proposition 8.51.
(1) F(x,u) = sup{K(x,y) − u,y | y ∈ ZU
} (x ∈ ZV
,u ∈ ZU
).
(2) f(x) = sup{K(x,y) | y ∈ ZU
} (x ∈ ZV
).
Proof. (1) Abbreviate F(x,u) and K(x,y) to F(u) and K(y), respectively. We
have F•
(y) = −K(−y) by (8.58), while F(u) = F••
(u) by (8.55). Therefore,
F(u) = F••
(u) = sup
y
( u,y + K(−y)) = sup
y
(K(y) − u,y ).
(2) This follows from (1) with u = 0 and (8.54).
We deﬁne the dual problem to P as follows:
D: Maximize g(y) subject to y ∈ ZU
, (8.59)
where the objective function g : ZU
→ Z ∪ {±∞} is deﬁned by
g(y) = inf{K(x,y) | x ∈ ZV
} (y ∈ ZU
). (8.60)
We say that the problem D is feasible if g(y) > −∞ for some y ∈ ZU
. If the problem
P is feasible, we have g(y) < +∞ for all y ∈ ZU
, since g(y) ≤ K(x,y) ≤ f(x) for
all x ∈ ZV
and y ∈ ZU
.sidca00si
2013/2/12
page 237
8.4. Lagrange Duality for Optimization 237
We use the following notations:
inf(P) = inf{f(x) | x ∈ ZV
},
sup(D) = sup{g(y) | y ∈ ZU
},
opt(P) = {x ∈ ZV
| f(x) = inf(P)},
opt(D) = {y ∈ ZU
| g(y) = sup(D)}.
We write min(P) instead of inf(P) if the problem P is feasible and the inﬁmum is
ﬁnite, in which case the inﬁmum is attained (i.e., opt(P) = ∅), and similarly for
max(D).
Theorem 8.52 (Weak duality). inf(P) ≥ sup(D).
Proof. We have
g(y) = inf
x
K(x,y) = inf
x
inf
u
(F(x,u) + u,y )
≤ inf
x
(F(x,0) + 0,y ) = inf
x
f(x) = inf(P).
Hence, sup(D) = supy g(y) ≤ inf(P).
Our main interest lies in the strong duality, namely, in the case where the
inequality in the weak duality turns to an equality with a ﬁnite common value.
Theorem 8.53.
(1) g(y) = −ϕ•
(−y).
(2) sup(D) = ϕ••
(0).
(3) inf(P) = ϕ(0).
(4) inf(P) = sup(D) ⇐⇒ ϕ(0) = ϕ••
(0).
(5) Suppose inf(P) is ﬁnite. Then min(P) = max(D) ⇐⇒ ∂Zϕ(0) = ∅.
(6) If min(P) = max(D), then opt(D) = −∂Zϕ(0).
Proof. (1) By the deﬁnitions we have
−ϕ•
(−y) = −sup
u
( u,−y − ϕ(u)) = inf
u
(ϕ(u) + u,y )
= inf
u
(inf
x
F(x,u) + u,y ) = inf
x
inf
u
(F(x,u) + u,y )
= inf
x
K(x,y) = g(y).
(2) By using (1) we have
sup(D) = sup
y
g(y) = sup
y
( 0,−y − ϕ•
(−y)) = sup
y
( 0,y − ϕ•
(y)) = ϕ••
(0).
(3) This is obvious from (8.54) and (8.57).
(4) The equivalence is due to (2) and (3).
(5), (6) We have the following chain of equivalence: y ∈ −∂Zϕ(0) ⇔ ϕ(u) −
ϕ(0) ≥ u,−y (∀u ∈ ZU
) ⇔ infu(ϕ(u) + u,y ) = ϕ(0) ⇔ g(y) = ϕ(0), wheresidca00si
2013/2/12
page 238
## 238 Chapter 8. Conjugacy and Duality
infu(ϕ(u)+ u,y ) = g(y) is shown in the proof of (1). This implies the claims when
combined with the weak duality (Theorem 8.52).
Theorem 8.54 (Saddle-point theorem). Both inf(P) and sup(D) are ﬁnite and
min(P) = max(D) if and only if there exist x ∈ ZV
and y ∈ ZU
such that K(x,y)
is ﬁnite and
K(x,y) ≤ K(x,y) ≤ K(x,y) (x ∈ ZV
,y ∈ ZU
).
If this is the case, we have x ∈ opt(P) and y ∈ opt(D).
Proof. By Proposition 8.51 (2) we have f(x) = supy K(x,y) for any x ∈ ZV
,
whereas g(y) = infx K(x,y) for any y ∈ ZU
by the deﬁnition (8.60). In view of the
weak duality (Theorem 8.52) and the relation
f(x) = sup
y
K(x,y) ≥ K(x,y) ≥ inf
x
K(x,y) = g(y),
we see that
min(P) = max(D) ⇐⇒ ∃x,∃y : f(x) = g(y)
⇐⇒ ∃x,∃y : sup
y
K(x,y) = K(x,y) = inf
x
K(x,y).
## 8.4.3 Lagrangian Function Based on M-Convexity
As the perturbation F, we choose F = Fr : ZV
× ZV
→ Z ∪ {+∞} deﬁned by
Fr(x,u) = c(x) + δB(x + u) + r(u) (x,u ∈ ZV
), (8.61)
where r : ZV
→ Z ∪ {+∞} is an M-convex function with r(0) = 0. (We take V as
the U in the general framework.) The special case with r = 0 is distinguished by
the subscript 0. Namely,
F0(x,u) = c(x) + δB(x + u) (x,u ∈ ZV
). (8.62)
We single out the case of r = 0 because the technical development in this special
case can be made within the framework of M-/L-convex functions, whereas the
general case involves M2-/L2-convex functions. Throughout this section we assume
(REG), i.e., that B is an M-convex set.
We use the subscript r to denote the quantities derived from Fr; namely,
ϕr(u) = inf{Fr(x,u) | x ∈ ZV
} (u ∈ ZV
), (8.63)
Kr(x,y) = inf{Fr(x,u) + u,y | u ∈ ZV
} (x,y ∈ ZV
), (8.64)
gr(y) = inf{Kr(x,y) | x ∈ ZV
} (y ∈ ZV
), (8.65)
sup(Dr) = sup{gr(y) | y ∈ ZV
}.sidca00si
2013/2/12
page 239
8.4. Lagrange Duality for Optimization 239
Our choice of the perturbation (8.61) is legitimate, meeting the requirements
(8.54) and (8.55), as follows.
Proposition 8.55. Assume (REG).
(1) Fr(x,0) = f(x) (x ∈ ZV
).
(2) For each x ∈ ZV
, F0(x,u) is M-convex in u or F0(x,u) = +∞ for all u.
(3) For each x ∈ ZV
, Fr(x,u) is M2-convex in u or Fr(x,u) = +∞ for all u.
(4) Fr(x,·)••
= Fr(x,·) (x ∈ ZV
).
(5) Fr(x,u) = sup{Kr(x,y) − u,y | y ∈ ZV
} (x,u ∈ ZV
).
Assume (REG) and (OBJ).
(6) For each u ∈ ZV
, Fr(x,u) is M2-convex in x or Fr(x,u) = +∞ for all x.
Proof. (1) This follows from r(0) = 0.
(2) We have F0(x,u) = +∞ unless x ∈ domc. For each x, δB(x+u) = δB−x(u)
is the indicator function of B−x (translation of B by x), which is again an M-convex
set. Therefore, δB(x + u) is M-convex in u.
(3) We have Fr(x,u) = +∞ unless x ∈ domc. Besides δB(x + u), r(u) is
M-convex by the assumption. Hence, Fr(x,·) is the sum of two M-convex functions
for each x ∈ domc. By deﬁnition, such a function is either M2-convex or identically
equal to +∞.
(4) This follows from (3) and Theorem 8.36.
(5) This follows from (4) and Proposition 8.51 (1).
(6) The proof is similar to (3) by the symmetry between c(x) and r(u).
The Lagrangian function Kr(x,y) has the following properties. It should be
clear that δB
•
is the support function of B and δ−B2Z r[y] means the integer
inﬁmal convolution of the indicator function of −B = {x | −x ∈ B} and r[y](u) =
r(u) + u,y .
Proposition 8.56.
(1)
K0(x,y) =

c(x) − x,y − δB
•
(−y) (x ∈ domc,y ∈ ZV
),
+∞ (x / ∈ domc,y ∈ ZV
).
(2)
Kr(x,y) =
⎧
⎨
⎩
c(x) + (δ−B2Z r[y])(−x) = c(x) − (δB−x + r)•
(−y)
(x ∈ domc,y ∈ ZV
),
+∞ (x / ∈ domc,y ∈ ZV
).
Proof. It suﬃces to prove (2), since (1) is its special case with r = 0. Assume
x ∈ domc. Substituting (8.61) into (8.64) we obtain
Kr(x,y) = inf{c(x) + δB(x + u) + r(u) + u,y | u ∈ ZV
}
= c(x) + inf{δ−B(−x − u) + r[y](u) | u ∈ ZV
}
= c(x) + (δ−B2Z r[y])(−x).
The alternative expression is easy to see.sidca00si
2013/2/12
page 240
## 240 Chapter 8. Conjugacy and Duality
Theorem 8.57. Assume (REG).
(1) For each x ∈ ZV
, K0(x,y) is L-concave in y or K0(x,y) = +∞ for all y.
(2) For each x ∈ ZV
, Kr(x,y) is L2-concave in y or Kr(x,y) = +∞ for all y.
Assume (REG) and (OBJ).
(3) For each y ∈ ZV
, K0(x,y) is M-convex in x or K0(x,y) ∈ {+∞,−∞} for
all x.
(4) For each y ∈ ZV
, Kr(x,y) is M2-convex in x or Kr(x,y) ∈ {+∞,−∞}
for all x.
Proof. (1), (3) The expression of K0(x,y) in Proposition 8.56 (1) shows these.
(2) In the expression of Kr(x,y) in Proposition 8.56 (2) we have δB−x + r ∈
M2[Z → Z] or ≡ +∞ (see Note 6.17). Then the conjugacy in Theorem 8.48 implies
this.
(4) In the expression of Kr(x,y) in Proposition 8.56 (2) the second term
(δ−B2Z r[y])(−x) is M-convex or ∈ {+∞,−∞} since it is the integer inﬁmal con-
volution of two M-convex functions (Theorem 6.13 (8)).
In the case of M-convex programs the dual objective function gr and the
optimal value function ϕr are well behaved, as follows.
Theorem 8.58. Assume (REG) and (OBJ).
(1) g0 is L-concave or g0(y) = −∞ for all y.
(2) gr is L2-concave, gr(y) = −∞ for all y, or gr(y) = +∞ for all y.
(3) ϕ0 is M-convex or ϕ0(u) ∈ {+∞,−∞} for all u.
(4) ϕr is M2-convex or ϕr(u) ∈ {+∞,−∞} for all u.
Proof. We prove (1), (3), (4), and, ﬁnally, (2).
(1) Using Proposition 8.56 (1) we obtain
g0(y) = inf
x
K0(x,y) = inf
x
(c(x) − x,y ) − δB
•
(−y) = −c•
(y) − δB
•
(−y).
This shows g0 is L-concave or ≡ −∞, since the sum of two L-concave functions is
again L-concave provided the eﬀective domains of the summands are not disjoint.
(3) We have ϕ0(u) = infx(c(x) + δB(x + u)) = (c2Z δ−B)(−u). The assertion
follows from Theorem 6.13 (8).
(4) It follows from Fr(x,u) = F0(x,u) + r(u) that ϕr(u) = +∞ unless u ∈
domr and that ϕr(u) = ϕ0(u) + r(u) if u ∈ domr. If ϕ0 ∈ M[Z → Z], then
ϕr ∈ M2[Z → Z] or ϕr ≡ +∞. If ϕ0(u) ∈ {+∞,−∞}, then ϕr(u) ∈ {+∞,−∞}.
(2) First recall the relation gr(y) = −ϕr
•
(−y) (Theorem 8.53 (1)). If ϕr ∈
M2[Z → Z], the conjugacy in Theorem 8.48 implies the L2-concavity of gr. If
ϕr ≡ +∞, then gr ≡ +∞. If ϕr(u) = −∞ for some u, then gr ≡ −∞.
Strong duality holds true for M-convex programs with the Lagrangian function
Kr(x,y).
Theorem 8.59 (Strong duality). Assume (REG), (OBJ), and that the problem Psidca00si
2013/2/12
page 241
8.4. Lagrange Duality for Optimization 241
is feasible and bounded from below.
(1) min(P) = ϕr(0) = ϕr
••
(0) = max(Dr).
(2) opt(Dr) = −∂Zϕr(0).
Proof. Since ϕr(0) is ﬁnite by the assumption, ϕr is M2-convex by Theorem 8.58
(4) and ∂Zϕr(0) = ∅ by Theorem 8.35. Then the assertions follow from Theorem
8.53.
It should be emphasized that the M-convexity of the objective function c is a
suﬃcient condition and not an absolute prerequisite for the strong duality to hold.
Example 8.60. Let us consider the case where c(x) is a linear function on another
M-convex set B
⊆ ZV
. The primal problem with c(x) = x,w + δB(x) (where
w ∈ ZV
denotes a weight vector) reads as follows:
P: Minimize x,w subject to x ∈ B ∩ B
.
The Lagrangian function K0 is given by
K0(x,y) =

x,w − y + infz∈B z,y (x ∈ B
,y ∈ ZV
),
+∞ (x / ∈ B
,y ∈ ZV
),
from which is derived the following dual problem:
D: Maximize

inf
x∈B
x,w − y + inf
z∈B
z,y

subject to y ∈ ZV
.
This is the polymatroidal version of the optimal common base problem explained
in Example 8.27. The optimal solution y = y∗
to D gives the weight splitting
w∗
1 = w − y∗
and w∗
2 = y∗
.
For a concrete instance, take V = {1,2},
B = {x ∈ Z2
| x(1) ≥ 0,x(1) + x(2) = 0},
B
= {x ∈ Z2
| x(1) ≤ 1,x(1) + x(2) = 0}.
We have B ∩ B
= {(0,0),(1,−1)} and
K0(x,y) =
⎧
⎨
⎩
x,w − y (x ∈ B
,y(1) ≥ y(2)),
−∞ (x ∈ B
,y(1) < y(2)),
+∞ (otherwise).
(8.66)
## 8.4.4 Symmetry in Duality
So far we have derived the dual problem D from the primal P by means of a
perturbation function F(x,u) such that F(x,0) = f(x) and F(x,·) ∈ M2[Z → Z].
Namely,
P : minimize f(x) − − − − − − − − − − − − − − → D : maximize g(y).
F(x,0) = f(x)
F(x,·) ∈ M2[Z → Z]sidca00si
2013/2/12
page 242
## 242 Chapter 8. Conjugacy and Duality
We have seen that g is L2-concave, i.e., −g ∈ L2[Z → Z], in the “convex” case
where (REG) and (OBJ) are satisﬁed.
We are now interested in the reverse process, i.e., how to restore the primal
problem P from the dual D in a way consistent with the general duality framework of
section 8.4.1. We embed the dual problem D in a family of maximization problems
deﬁned in terms of another perturbation function G(y,v) such that G(y,0) = g(y)
and −G(y,·) ∈ L2[Z → Z]. Namely,
P : minimize f(x) ← − − − − − − − − − − − − − − D : maximize g(y).
G(y,0) = g(y)
−G(y,·) ∈ L2[Z → Z]
With reference to (8.60) and Proposition 8.51 we deﬁne a perturbation func-
tion G : ZU
× ZV
→ Z ∪ {±∞} by54
G(y,v) = inf{K(x,y) − x,v | x ∈ ZV
} (y ∈ ZU
,v ∈ ZV
). (8.67)
By this we intend to consider a family of maximization problems parametrized by
v ∈ ZV
:
Maximize G(y,v) subject to y ∈ ZU
.
The optimal value function γ : ZV
→ Z ∪ {±∞} is accordingly deﬁned by
γ(v) = sup{G(y,v) | y ∈ ZU
} (v ∈ ZV
). (8.68)
It is then natural to introduce the dual Lagrangian function K̃(x,y) : ZV
× ZU
→
Z ∪ {±∞} as
K̃(x,y) = sup{G(y,v) + x,v | v ∈ ZV
} (x ∈ ZV
,y ∈ ZU
). (8.69)
The problem dual to the problem D is to minimize
˜ f(x) = sup{K̃(x,y) | y ∈ ZU
} (x ∈ ZV
). (8.70)
As can be imagined from the corresponding constructions in convex analysis (cf. sec-
tion 4 of Rockafellar [177]), K̃(x,y) and ˜ f(x) thus constructed do not necessarily
coincide with the original K(x,y) and f(x). We show, however, that the dual of
the dual comes back to the primal in the canonical case with a bounded M-convex
set B using the Lagrangian function Kr.
Example 8.61. For K0 of (8.66) in Example 8.60 we can calculate
K̃0(x,y) =
⎧
⎨
⎩
x,w − y (x ∈ B
,y(1) ≥ y(2)),
+∞ (x / ∈ B
,y(1) ≥ y(2)),
−∞ (y(1) < y(2)).
We observe that K̃0(x,y) = K0(x,y) where they take ﬁnite values.
54Here we have v ∈ ZV and not v ∈ V .sidca00si
2013/2/12
page 243
8.4. Lagrange Duality for Optimization 243
In what follows we always assume (REG), (OBJ), and that B is bounded. We
consider the Lagrangian function Kr with U = V .
Proposition 8.62. Assume (REG), (OBJ), and that B is bounded. Then
K̃r(x,y) = Kr(x,y) (x,y ∈ ZV
), ˜ f(x) = f(x) (x ∈ ZV
).
Proof. The deﬁnitions (8.67) and (8.69) show Gr(y,·) = −(Kr(·,y))•
and K̃r(·,y) =
(−Gr(y,·))•
for each y. Since Kr(·,y) ∈ M2[Z → Z] or ≡ +∞ by Theorem 8.57
(4) when B is bounded, we have Kr(·,y) = (Kr(·,y))••
for each y. Hence follows
K̃r = Kr. Then Proposition 8.51 (2) and (8.70) imply ˜ f = f.
Proposition 8.63. Assume (REG), (OBJ), and that B is bounded.
(1) Gr(y,0) = gr(y) (y ∈ ZV
).
(2) For each y ∈ ZV
, Gr(y,v) is L2-concave in v or Gr(y,v) = +∞ for all v.
(3) For each v ∈ ZV
, Gr(y,v) is L2-concave in y, Gr(y,v) = −∞ for all y, or
Gr(y,v) = +∞ for all y.
Proof. (1) This is obvious from (8.65) and (8.67).
(2) The deﬁnition (8.67) shows Gr(y,·) = −(Kr(·,y))•
for each y, while
Kr(·,y) ∈ M2[Z → Z] or ≡ +∞ by Theorem 8.57 (4) when B is bounded. Hence
−Gr(y,·) ∈ L2[Z → Z] or ≡ −∞ by Theorem 8.48.
(3) By (8.67), (8.64), and (8.61), we have the expression
Gr(y,v) = inf
x
inf
u
(Fr(x,u) + u,y − x,v )
= inf
x
inf
u
(c[−v](x) + δB(x + u) + r(u) + u,y ),
in which c[−v] is M-convex. On the other hand, Theorem 8.58 (2) shows that
gr(y) = inf
x
inf
u
(c(x) + δB(x + u) + r(u) + u,y )
is L2-concave, gr(y) = −∞ for all y, or gr(y) = +∞ for all y. By replacing c with
c[−v] we obtain the claim.
The optimal value function γr, deﬁned by (8.68) with reference to Gr, enjoys
the following properties.
Theorem 8.64. Assume (REG), (OBJ), and that B is bounded.
(1) f(x) = −γr
◦
(−x).
(2) γr is L2-concave or γr(v) = +∞ for all v.
Proof. (1) Using Proposition 8.51 (2), (8.69), and Proposition 8.62 we obtain
f(x) = sup
y
Kr(x,y) = sup
y
sup
v
(Gr(y,v) + x,v )sidca00si
2013/2/12
page 244
## 244 Chapter 8. Conjugacy and Duality
= sup
v

(sup
y
Gr(y,v)) + x,v

= sup
v
(γr(v) + x,v ) = −γr
◦
(−x).
(2) Since f ∈ M2[Z → Z] or ≡ +∞, the assertion follows from (1) and the
conjugacy between L2[Z → Z] and M2[Z → Z].
Theorem 8.65. Assume (REG), (OBJ), and that the problem P is feasible and B
is bounded.
(1) min(P) = γr(0) = γr
◦◦
(0) = max(Dr).
(2) opt(P) = ∂Z(−γr)(0) = ∅.
Proof. The proof is essentially the same as that of Theorem 8.59. To be speciﬁc,
we have the following chain of equivalence: x ∈ ∂Z(−γr)(0) ⇔ γr(v) − γr(0) ≤
v,−x (∀v ∈ ZV
) ⇔ −infv( v,−x −γr(v)) = γr(0) ⇔ f(x) = γr(0). This implies
the claim when combined with the weak duality (Theorem 8.52).
Bibliographical Notes
The conjugacy relationship between M-convexity and L-convexity was established
ﬁrst for integer-valued functions (Theorem 8.12) by Murota [140], whereas the
present proof is based on Murota [147]. The conjugacy theorem for polyhedral
M-/L-convex functions (Theorem 8.4) is due to Murota–Shioura [152]. The polar-
ity between M-/L-convex cones in Theorem 8.5 is stated in [147] and Proposition
8.11 for the integer biconjugate is in [140]. Theorem 8.1 is a special case of a theorem
of Topkis [202], stated explicitly as Corollary 2.7.3 in Topkis [203].
The M-separation theorem (Theorem 8.15) is given in Murota [137], [140],
[142] and the L-separation theorem (Theorem 8.16) in [140]. The Fenchel-type
duality theorem for M-convex functions originated in [137] (see also [140]); the
present form (Theorem 8.21) is in Murota [147]. The M-convex intersection theorem
(Theorem 8.17) is in [137], [142]. The Fenchel-type duality theorem for submodular
set functions described in Example 8.26 is due to Fujishige [62]. The weight-splitting
theorem for weighted matroid intersection in Example 8.27 is due to Frank [54], and
that for valuated matroid intersection in Example 8.28 is due to Murota [135]; see
also Theorem 5.2.40 of Murota [146].
M2-convex and L2-convex functions were introduced by Murota [140], to which
Theorems 8.35, 8.36, 8.45, and 8.46 and the conjugacy theorem (Theorem 8.48) are
ascribed. Theorems 8.31 and 8.42 (integral convexity) as well as Theorem 8.49 are
due to Murota–Shioura [153]. Theorems 8.32 and 8.43 (M2-/L2-optimality criteria)
and Theorems 8.34 and 8.44 (M2-/L2-proximity theorems) are given by Murota–
Tamura [162]. See Tamura [198] for Notes 8.37 and 8.38.
The Lagrangeduality of section 8.4 is developed in Murota [140]. See Nemhauser–
Rinnooy Kan–Todd [166] and Nemhauser–Wolsey [167] for the subadditive duality.sidca00si
2013/2/12
page 245
Chapter 9
Network Flows
In Chapter 2 we had a glimpse of the intrinsic relationship between M-/L-convexity
and network ﬂows (nonlinear electrical networks). Pursuing this direction further
we show the following facts in this chapter. (i) The minimum cost ﬂow problem
can be generalized to the submodular ﬂow problem, where M-/L-convexity plays
a fundamental role. (ii) The submodular ﬂow problem with an M-convex function
admits nice optimality criteria in terms of potentials and negative cycles. (iii) The
optimality criterion using potentials is equivalent to the Fenchel-type duality theo-
rem. (iv) A conjugate pair of M-convex and L-convex functions is transformed to
another conjugate pair of M-convex and L-convex functions through network ﬂows.
Algorithms are treated in Chapter 10.
## 9.1 Minimum Cost Flow and Fenchel Duality
To single out the role of M-/L-convexity we ﬁrst review standard results on the
conventional minimum cost ﬂow problem. Emphasis is placed on the equivalence of
the optimality criterion in terms of potentials and the Fenchel duality theorem for
convex functions.
## 9.1.1 Minimum Cost Flow Problem
Let G = (V,A) be a directed graph with vertex set V and arc set A. Suppose that
each arc a ∈ A is associated with an upper capacity c(a), a lower capacity c(a), and
a cost γ(a) per unit ﬂow. Furthermore, for each vertex v ∈ V , the amount of ﬂow
supply at v is speciﬁed by x(v). The minimum cost ﬂow problem is to ﬁnd a ﬂow
ξ = (ξ(a) | a ∈ A) that minimizes the total cost γ,ξ A = a∈A γ(a)ξ(a) subject to
the capacity constraint and the supply speciﬁcation. Here the supply speciﬁcation
means a constraint that the boundary ∂ξ of ξ, deﬁned by
∂ξ(v) =

{ξ(a) | a ∈ δ+
v} −

{ξ(a) | a ∈ δ−
v} (v ∈ V ), (9.1)
245sidca00si
2013/2/12
page 246
## 246 Chapter 9. Network Flows
should be equal to the given x. The problem is described by a graph G = (V,A),
an upper capacity c : A → R ∪ {+∞}, a lower capacity c : A → R ∪ {−∞}, a
cost vector γ : A → R, and a supply vector x : V → R, where it is assumed that
c(a) ≥ c(a) for each a ∈ A. The variable to be optimized is the ﬂow ξ : A → R.
Minimum cost flow problem MCFP0 (linear arc cost)55
Minimize Γ1(ξ) =

a∈A
γ(a)ξ(a) (9.2)
subject to c(a) ≤ ξ(a) ≤ c(a) (a ∈ A), (9.3)
∂ξ = x, (9.4)
ξ(a) ∈ R (a ∈ A). (9.5)
The minimum cost ﬂow problem is a typical well-behaved combinatorial prob-
lem that has nice properties, such as
1. an optimality criterion in terms of potentials (dual variables),
2. an optimality criterion in terms of negative cycles,
3. the integrality of optimal solutions, and
4. eﬃcient algorithms.
Precise statements for the ﬁrst three above are given later in Theorems 9.4, 9.5,
and 9.6, respectively. In particular, the integrality of optimal solutions refers to
the fact that, if the capacity constraint and the supply speciﬁcation are given in
terms of integer-valued functions, c : A → Z ∪ {+∞}, c : A → Z ∪ {−∞}, and
x : V → Z, then there exists an integer-valued optimal ﬂow ξ to the above problem.
This implies that the problem MCFP0 speciﬁed by such integer-valued data remains
essentially the same even if the integrality condition
ξ(a) ∈ Z (a ∈ A) (9.6)
is additionally imposed on the ﬂow ξ. We refer to the problem with (9.6) in place
of (9.5) as the minimum cost integer-ﬂow problem.
To discuss the relationship to convex analysis it is convenient to consider a
more general form of the minimum cost ﬂow problem. The generalization is twofold.
First, the linear arc cost a∈A γ(a)ξ(a) is replaced with a nonlinear cost represented
by a separable convex function a∈A fa(ξ(a)) with a family of univariate polyhedral
convex functions fa ∈ C[R → R] indexed by a ∈ A. Second, with a polyhedral
convex function f : RV
→ R ∪ {+∞}, an additional term f(∂ξ) for the ﬂow
boundary ∂ξ is introduced in the cost function as a generalization of the supply
speciﬁcation ∂ξ = x.
Minimum cost flow problem MCFP3 (nonlinear cost)56
Minimize Γ3(ξ) =

a∈A
fa(ξ(a)) + f(∂ξ) (9.7)
subject to ξ(a) ∈ domfa (a ∈ A), (9.8)
55MCFP stands for minimum cost ﬂow problem.
56We have MCFPi for i = 0,3 and not for i = 1,2. This is for consistency with section 9.2.sidca00si
2013/2/12
page 247
9.1. Minimum Cost Flow and Fenchel Duality 247
∂ξ ∈ domf, (9.9)
ξ(a) ∈ R (a ∈ A). (9.10)
Obviously, MCFP0 is a special case of MCFP3, where
fa(t) =

γ(a)t (t ∈ [c(a),c(a)]),
+∞ (otherwise)
(9.11)
for a ∈ A and f is the indicator function δ{x} of the singleton set {x}.
Among the four nice properties of MCFP0 listed above, the optimality crite-
rion by potentials is generalized to MCFP3, as we will see in section 9.1.3, whereas
the other three fail to survive for a general f. In considering the integer-ﬂow version
of the problem it is natural to assume fa ∈ C[Z → R] (or fa ∈ C[Z|R → R]) for
each a ∈ A, but it is not clear what combinatorial property to impose on f to ensure
the integrality of optimal solutions. M-convexity gives an answer to this, as we will
see in section 9.4.
Note 9.1. In MCFP3 we have restricted f and fa (a ∈ A) to be polyhedral convex
functions. This is for consistency with our theoretical framework of polyhedral
M-/L-convex functions. The optimality criterion by potentials (Theorem 9.4), as
well as its equivalence to the Fenchel duality to be discussed in section 9.1.4, remains
valid for nonpolyhedral convex functions under appropriate assumptions; see Iri [94]
and Rockafellar [178].
## 9.1.2 Feasibility
For the minimum cost ﬂow problem MCFP0, a feasible ﬂow means a function ξ :
A → R that satisﬁes
c(a) ≤ ξ(a) ≤ c(a) (a ∈ A), (9.12)
∂ξ = x. (9.13)
We say that MCFP0 is feasible if it admits a feasible ﬂow.
For X ⊆ V we denote the sets of arcs leaving and entering X by
Δ+
X = {a ∈ A | ∂+
a ∈ X,∂−
a ∈ V \ X}, (9.14)
Δ−
X = {a ∈ A | ∂−
a ∈ X,∂+
a ∈ V \ X} (9.15)
and deﬁne the cut capacity function κ : 2V
→ R ∪ {+∞} by
κ(X) = c(Δ+
X) − c(Δ−
X) =

a∈Δ+X
c(a) −

a∈Δ−X
c(a) (X ⊆ V ). (9.16)
Proposition 9.2. The cut capacity function κ is submodular.
Proof. It is easy to verify
κ(X) + κ(Y ) − κ(X ∪ Y ) − κ(X ∩ Y ) =

a
[c(a) − c(a)] ≥ 0,sidca00si
2013/2/12
page 248
## 248 Chapter 9. Network Flows
where the summation is taken over all arcs a connecting X \ Y and Y \ X.
If a ﬂow ξ meets the capacity constraint (9.12), its boundary x = ∂ξ satisﬁes
x(X) = ∂ξ(X) =

a∈Δ+X
ξ(a) −

a∈Δ−X
ξ(a) ≤

a∈Δ+X
c(a) −

a∈Δ−X
c(a) = κ(X)
for all X ⊆ V and also x(V ) = 0 = κ(V ). This means x ∈ B(κ), where B(κ) is the
base polyhedron (4.13) associated with κ.
The above argument shows that the condition x ∈ B(κ) is necessary for
MCFP0 to be feasible. It is also suﬃcient, as stated in the following theorem.
Theorem 9.3 (Feasibility). For c : A → R ∪ {+∞}, c : A → R ∪ {−∞}, and
x : V → R, there exists a ﬂow ξ : A → R satisfying (9.12) and (9.13) if and only if
x(X) ≤ κ(X) (∀X ⊆ V ), x(V ) = 0. (9.17)
That is,
B(κ) = {∂ξ | ξ : A → R, c(a) ≤ ξ(a) ≤ c(a) (a ∈ A)}. (9.18)
If c and c are integer valued, we may restrict ξ to be integer ﬂows; namely,
B(κ) ∩ ZV
= {∂ξ | ξ : A → Z, c(a) ≤ ξ(a) ≤ c(a) (a ∈ A)}. (9.19)
Proof. This follows from the max-ﬂow min-cut theorem or a variant thereof, called
Hoﬀman’s circulation theorem (see, e.g., (2.65) of Fujishige [65] or Theorem 3.18 of
Cook–Cunningham–Pulleyblank–Schrijver [26]).
## 9.1.3 Optimality Criteria
The minimum cost ﬂow problem MCFP3, which has convex boundary cost and
separable convex arc cost, admits a nice optimality criterion in terms of potentials.
The conventional case MCFP0 admits, in addition, an optimality criterion in terms
of negative cycles and the integrality of optimal solutions.
A potential means a function p : V → R (or a vector p ∈ RV
) on the vertex
set. The coboundary of a potential p is a function δp : A → R deﬁned by
δp(a) = p(∂+
a) − p(∂−
a) (a ∈ A). (9.20)
The inner product (pairing) of tension η : A → R and ﬂow ξ : A → R can be
expressed as
η,ξ A = − δp,ξ A = − p,∂ξ V = − p,x V (9.21)
if x = ∂ξ and p is a potential such that
η(a) = −δp(a) = p(∂−
a) − p(∂+
a) (a ∈ A). (9.22)sidca00si
2013/2/12
page 249
9.1. Minimum Cost Flow and Fenchel Duality 249
The identity (9.21) is a fundamental relation, frequently used in the subsequent
arguments. It should be clear that
η,ξ A =

a∈A
η(a)ξ(a), p,x V =

v∈V
p(v)x(v).
With reference to a potential p we modify the cost functions f and fa (a ∈ A)
to the reduced cost functions f[−p] and fa[δp(a)] (a ∈ A) deﬁned by
f[−p](x) = f(x) −

v∈V
p(v)x(v) (x ∈ RV
), (9.23)
fa[δp(a)](t) = fa(t) + (p(∂+
a) − p(∂−
a))t (t ∈ R). (9.24)
A straightforward calculation with the use of (9.21) yields
Γ3(ξ) =

a∈A
fa(ξ(a)) + f(∂ξ)
=
8

a∈A
fa(ξ(a)) + δp,ξ A
9
+ (f(∂ξ) − p,∂ξ V )
=

a∈A
fa[δp(a)](ξ(a)) + f[−p](∂ξ)
≥

a∈A
inf fa[δp(a)] + inf f[−p], (9.25)
where inf f[−p] and inf fa[δp(a)] with a ∈ A mean the inﬁma of the reduced cost
functions. The inequality (9.25) gives a lower bound for the minimum of Γ3. In
particular, if
(i) ξ(a) ∈ argminfa[δp(a)] for every a ∈ A and
(ii) ∂ξ ∈ argminf[−p]
for some p, then ξ is an optimal ﬂow satisfying (9.25) with equality. This statement
is true for any functions f and fa (a ∈ A).
The converse is also true under a fairly general assumption that f and fa
(a ∈ A) are convex.
Theorem 9.4 (Potential criterion). In the minimum cost ﬂow problem MCFP3
with polyhedral convex f and fa (a ∈ A), we have the following:
(1) For a feasible ﬂow ξ : A → R, the two conditions (OPT) and (POT) below
are equivalent.
(OPT) ξ is an optimal ﬂow.
(POT) There exists a potential p : V → R such that
(i) ξ(a) ∈ argminfa[δp(a)] for every a ∈ A, and
(ii) ∂ξ ∈ argminf[−p].
(2) Suppose that a potential p : V → R satisﬁes (i) and (ii) above for an
optimal ﬂow ξ. A feasible ﬂow ξ
is optimal if and only ifsidca00si
2013/2/12
page 250
## 250 Chapter 9. Network Flows
(i) ξ
(a) ∈ argminfa[δp(a)] for every a ∈ A, and
(ii) ∂ξ
∈ argminf[−p].
Proof. (1) (POT) ⇒ (OPT) is already shown. To prove (OPT) ⇒ (POT), suppose
that ξ is an optimal ﬂow. Putting
fA(x) = inf
ξ
(

a∈A
fa(ξ
(a))
)
)
)
)
)
∂ξ
= x
*
, (9.26)
we see
inf
ξ
Γ3(ξ
) = inf
x
+8
inf
ξ:∂ξ=x

a∈A
fa(ξ
(a))
9
+ f(x)
,
= inf
x
[fA(x) + f(x)],
where inf Γ3 is ﬁnite and x = ∂ξ attains the inﬁmum of the last expression. Noting
that fA is a polyhedral convex function (see Note 2.17) and domfA ∩ domf = ∅,
we apply the Fenchel duality theorem in convex analysis (Theorem 3.6 and (3.42))
to obtain p : V → R such that
fA[p](∂ξ) = inf fA[p], f[−p](∂ξ) = inf f[−p]. (9.27)
The second equation shows (ii) in (POT). We will show that the ﬁrst equation above
implies (i) in (POT). It follows from (9.26) and (9.21) that
fA[p](x
) = inf
ξ
(

a∈A
fa(ξ
(a))
)
)
)
)
)
∂ξ
= x
*
+ p,x
V
= inf
ξ
(

a∈A
fa(ξ
(a)) + δp,ξ
A
)
)
)
)
)
∂ξ
= x
*
= inf
ξ
(

a∈A
fa[δp(a)](ξ
(a))
)
)
)
)
)
∂ξ
= x
*
for any x
∈ RV
, and therefore,
inf fA[p] =

a∈A
inf fa[δp(a)]. (9.28)
On the other hand, the optimality of ξ implies fA(∂ξ) = a∈A fa(ξ(a)), which, in
combination with (9.21), yields
fA[p](∂ξ) =

a∈A
fa[δp(a)](ξ(a)). (9.29)
Substituting (9.28) and (9.29) into the ﬁrst equation in (9.27) shows
fa[δp(a)](ξ(a)) = inf fa[δp(a)] (∀a ∈ A),sidca00si
2013/2/12
page 251
9.1. Minimum Cost Flow and Fenchel Duality 251
-
ξ(a)
6 η(a) =
p(∂−
a) − p(∂+
a)
?
γp(a)
c(a) c(a)
γ(a) 0
Γa
Figure 9.1. Characteristic curve (kilter diagram) for linear cost.
which is equivalent to (i) in (POT).
(2) This is obvious from (1) and (9.25).
A potential p satisfying (i) and (ii) in (POT) is called an optimal potential.
Though this deﬁnition refers to a particular optimal ﬂow ξ, it is, in fact, independent
of the choice of ξ by Theorem 9.4 (2).
Condition (i) in (POT) is closely related to the characteristic curve (or kilter
diagram) Γa introduced in section 2.2 with an illustration in Fig. 2.3. Since
ξ(a) ∈ argminfa[−η(a)] ⇐⇒ (ξ(a),η(a)) ∈ Γa (9.30)
by (2.34) and (2.35), condition (i) in (POT) says that ﬂow ξ(a) and tension η(a) =
−δp(a) should satisfy the constitutive equation in every arc a ∈ A. In the case of lin-
ear arc cost, the characteristic curve Γa takes the form of Fig. 9.1, and, accordingly,
condition (i) in (POT) is expressed as
γp(a) > 0 =⇒ ξ(a) = c(a), (9.31)
γp(a) < 0 =⇒ ξ(a) = c(a) (9.32)
in terms of the reduced cost γp : A → R deﬁned by
γp(a) = γ(a) + p(∂+
a) − p(∂−
a) (a ∈ A). (9.33)
In the conventional case MCFP0 with linear arc cost, the optimality criterion
can be reformulated in terms of negative cycles in an auxiliary network. For a
feasible ﬂow ξ : A → R, let Gξ = (V,Aξ) be a directed graph with vertex set V and
arc set Aξ = A∗
ξ ∪ B∗
ξ consisting of two disjoint parts:
A∗
ξ = {a | a ∈ A,ξ(a) < c(a)},sidca00si
2013/2/12
page 252
## 252 Chapter 9. Network Flows
B∗
ξ = {a | a ∈ A,c(a) < ξ(a)} (a: reorientation of a),
and deﬁne a function ξ : Aξ → R, representing arc lengths, by
ξ(a) =

γ(a) (a ∈ A∗
ξ),
−γ(a) (a ∈ B∗
ξ ,a ∈ A).
(9.34)
We refer to (Gξ,ξ) as the auxiliary network. We call a directed cycle of negative
length a negative cycle.
Theorem 9.5 (Negative-cycle criterion). For a feasible ﬂow ξ : A → R to the mini-
mum cost ﬂow problem MCFP0, conditions (OPT) and (NNC) below are equivalent.
(OPT) ξ is an optimal ﬂow.
(NNC) There exists no negative cycle in (Gξ,ξ) with ξ of (9.34).
Proof. By (9.31), (9.32), and the deﬁnition (9.34) of ξ, condition (i) of (POT) in
Theorem 9.4 is equivalent to
ξ(a) + p(∂+
a) − p(∂−
a) ≥ 0 (a ∈ Aξ), (9.35)
whereas condition (ii) of (POT) is void for MCFP0. On the other hand, the existence
of a potential p : V → R satisfying (9.35) is equivalent to (NNC), as is well known
in network ﬂow theory. Hence follows the equivalence of (NNC) and (OPT) by
Theorem 9.4.
The minimum cost ﬂow problem MCFP0 is endowed with remarkable inte-
grality properties:
1. An integer-valued optimal ﬂow exists if the upper and lower capacities and
the supply vector are integer valued (primal integrality).
2. An integer-valued optimal potential exists if the cost vector is integer valued
(dual integrality).
Theorem 9.6 (Integrality). Suppose that the minimum cost ﬂow problem MCFP0
has an optimal solution.
(1) [Primal integrality] If c : A → Z ∪ {+∞}, c : A → Z ∪ {−∞}, and
x : V → Z, then there exists an integer-valued optimal ﬂow ξ : A → Z.
(2) [Dual integrality] The set of optimal potentials
Π∗
= {p | p : optimal potential}
is an L-convex polyhedron. If γ : A → Z, then Π∗
is an integral L-convex polyhedron
and there exists an integer-valued optimal potential p : V → Z.
Proof. (1) Let p be an optimal potential. By (9.31) and (9.32), a ﬂow ξ is optimal if
and only if it is a feasible ﬂow with respect to a more restrictive capacity constraint
c∗
(a) ≤ ξ(a) ≤ c∗
(a) with
c∗
(a) =
⎧
⎨
⎩
c(a) (γp(a) > 0),
c(a) (γp(a) = 0),
c(a) (γp(a) < 0),
c∗
(a) =
⎧
⎨
⎩
c(a) (γp(a) > 0),
c(a) (γp(a) = 0),
c(a) (γp(a) < 0)sidca00si
2013/2/12
page 253
9.1. Minimum Cost Flow and Fenchel Duality 253
for each a ∈ A. Since c∗
(a) and c∗
(a) are integers for every a ∈ A, the claim follows
from (9.19) in Theorem 9.3.
(2) Since condition (i) of (POT) in Theorem 9.4 is equivalent to (9.35) in the
proof of Theorem 9.5, Π∗
coincides with the polyhedron described by (9.35) with
an optimal ξ. This implies the L-convexity of Π∗
(see section 5.6). The integrality
assertion follows from Proposition 5.1 (4).
The nice features of the minimum cost ﬂow problem discussed so far (Theorems
9.4, 9.5, and 9.6) are derived mainly from the combinatorial structure inherent
in the underlying graph, as well as the convexity of the cost functions. Further
combinatorial properties stemming from the M-convexity of the cost functions will
be investigated in section 9.4 and section 9.5.
Note 9.7. Here is a comment on the deﬁnition of the coboundary. In this book
we follow the convention of deﬁning δp(a) by
δp(a) = (p at the initial vertex of a) − (p at the terminal vertex of a).
The boundary ∂ξ(v) is deﬁned to be the amount of ﬂow leaving v and the tension η
is deﬁned as η = −δp (see (9.1), (9.20), and (9.22)). Then follows the fundamental
identity
η,ξ A = − δp,ξ A = − p,∂ξ V .
Another convention of deﬁning δp(a) by
δp(a) = (p at the terminal vertex of a) − (p at the initial vertex of a)
and the tension η by η = δp results in
η,ξ A = δp,ξ A = − p,∂ξ V .
The notations div and Δ in Rockafellar [178] are related to ours as div = ∂ and
Δ = −δ.
## 9.1.4 Relationship to Fenchel Duality
We discuss here the relationship between the potential criterion for optimality for
the minimum cost ﬂow problem MCFP3 and the Fenchel duality in convex analysis.
The potential criterion for MCFP3 (Theorem 9.4 in section 9.1.3) has been
derived from the Fenchel duality applied to f and −fA, where
fA(x) = inf
ξ
(

a∈A
fa(ξ(a))
)
)
)
)
)
∂ξ = x
*
and the evaluation of fA amounts to solving a minimum cost ﬂow problem with
nonlinear arc cost fa but without boundary cost f. Thus, the minimum cost ﬂow
problem MCFP3 with boundary cost can be understood as a composition of thesidca00si
2013/2/12
page 254
## 254 Chapter 9. Network Flows
V1
f1(x1)
V2
−h2(−x2)
-
-
-
-
-
Figure 9.2. Minimum cost ﬂow problem for Fenchel duality.
minimization/maximization problem of the Fenchel duality and the minimum cost
ﬂow problem without boundary cost.
The proof of Theorem 9.4 yields, as a byproduct, a min-max identity for
MCFP3:
inf
ξ∈RA,x∈RV
{Φ(ξ,x) | ∂ξ = x} = sup
η∈RA,p∈RV
{Ψ(η,p) | η = −δp}, (9.36)
where
Φ(ξ,x) = f(x) +

a∈A
fa(ξ(a)) (ξ ∈ RA
,x ∈ RV
),
Ψ(η,p) = −g(p) −

a∈A
ga(η(a)) (η ∈ RA
,p ∈ RV
),
with g = f•
and ga = fa
•
for a ∈ A. The identity (9.36) is an immediate conse-
quence of the Fenchel duality (3.41):
inf
x
[fA(x) + f(x)] = sup
p
[−fA
•
(−p) − f•
(p)],
in which f•
(p) = g(p) and
fA
•
(−p) =

a∈A
fa
•
(−δp(a)) =

a∈A
ga(−δp(a)),
by (9.28). The left-hand side of (9.36) is MCFP3 in disguise, and accordingly,
we may think of the maximization problem on the right-hand side of (9.36) as an
optimization problem dual to MCFP3.
Although the potential criterion for MCFP3 has been derived from the Fenchel
duality, they are essentially equivalent, which we demonstrate here. To be speciﬁc,
we derive the Fenchel duality theorem (Theorem 3.6, Case (a2)) from the optimality
criterion for MCFP3 (Theorem 9.4).
Given a polyhedral convex function f1 : RV
→ R ∪ {+∞} and a polyhedral
concave function h2 : RV
→ R ∪ {−∞} with domf1 ∩ domh2 = ∅, we consider
a minimum cost ﬂow problem MCFP3 on the bipartite graph G = (V1 ∪ V2,A) in
Fig. 9.2. The vertex set of G consists of two copies of V , i.e., V1 and V2, and thesidca00si
2013/2/12
page 255
9.2. M-Convex Submodular Flow Problem 255
arc set is A = {(v1,v2) | v ∈ V }, with v1 ∈ V1 and v2 ∈ V2 denoting the copies of
v ∈ V . We deﬁne the boundary cost function f : RV1
× RV2
→ R ∪ {+∞} by
f(x1,x2) = f1(x1) − h2(−x2) (x1 ∈ RV1
,x2 ∈ RV2
)
and assume that the arc cost functions fa (a ∈ A) are identically zero without
capacity constraints. Note that x1 = −x2 if (x1,x2) = ∂ξ for a ﬂow ξ in this
network. Assuming inf(f1 −h2) > −∞, let ξ be an optimal ﬂow, which exists since
f is a polyhedral convex function. Let (p1,p2) ∈ RV1
×RV2
be an optimal potential
satisfying (POT) in Theorem 9.4. Condition (i) of (POT) implies p1 = p2. Since
f[−(p1,p2)](x1,x2) = f1[−p1](x1) − h2[−p2](−x2),
condition (ii) of (POT) gives
x ∈ argminf1[−p] ∩ argmaxh2[−p]
for x = ∂ξ|V1 and p = p1. This implies the Fenchel duality (3.41) for f1 and h2; see
also (3.30) and (3.42).
9.2 M-Convex Submodular Flow Problem
A series of generalizations of the minimum cost ﬂow problem to the M-convex
submodular ﬂow problem is described. Recall the conventional minimum cost ﬂow
problem MCFP0 introduced in section 9.1.1. It is described by a graph G = (V,A),
an upper capacity c : A → R ∪ {+∞}, a lower capacity c : A → R ∪ {−∞}, a cost
vector γ : A → R, and a supply vector x : V → R, where c(a) ≥ c(a) for each
a ∈ A.
A generalization of MCFP0 is obtained by relaxing the supply speciﬁcation
∂ξ = x to the constraint that ∂ξ belong to a given set B of feasible or admissible
supplies:
∂ξ ∈ B. (9.37)
The nice properties described in section 9.1 are maintained if B is a base polyhedron
represented as B = B(ρ) with a submodular set function ρ : 2V
→ R∪{+∞}. Such
a problem described by some ρ ∈ S[R] is called the submodular ﬂow problem.
Submodular flow problem MSFP1 (linear arc cost)57
Minimize Γ1(ξ) =

a∈A
γ(a)ξ(a) (9.38)
subject to c(a) ≤ ξ(a) ≤ c(a) (a ∈ A), (9.39)
∂ξ ∈ B(ρ), (9.40)
ξ(a) ∈ R (a ∈ A). (9.41)
57MSFP stands for M-convex submodular ﬂow problem. We use the notation MSFPi with
i = 1,2,3 to indicate the hierarchy of generality in the problems.sidca00si
2013/2/12
page 256
## 256 Chapter 9. Network Flows
In the integer-ﬂow version of the problem, with ξ(a) ∈ Z (a ∈ A) instead of (9.41),
we assume ρ ∈ S[Z].
A further generalization of the problem is obtained by introducing a cost
function for the ﬂow boundary ∂ξ rather than merely imposing the constraint ∂ξ ∈
B. Namely, with a function f : RV
→ R ∪ {+∞} we add a new term f(∂ξ) to
the objective function, thereby imposing the constraint ∂ξ ∈ B = domf implicitly.
The aforementioned nice properties are maintained if f is a polyhedral M-convex
function. Such a problem described by some f ∈ M[R → R] is called the M-convex
submodular ﬂow problem.
M-convex submodular flow problem MSFP2 (linear arc cost)
Minimize Γ2(ξ) =

a∈A
γ(a)ξ(a) + f(∂ξ) (9.42)
subject to c(a) ≤ ξ(a) ≤ c(a) (a ∈ A), (9.43)
∂ξ ∈ domf, (9.44)
ξ(a) ∈ R (a ∈ A). (9.45)
Note that the M-convex submodular ﬂow problem with a {0,+∞}-valued f reduces
to the submodular ﬂow problem MSFP1. In the integer-ﬂow version of the problem
we assume c : A → Z ∪ {+∞}, c : A → Z ∪ {−∞}, and f ∈ M[Z → R] (or
f ∈ M[Z|R → R]).
A still further generalization is possible by replacing the linear arc cost in Γ2
with a separable convex function. Namely, using univariate polyhedral convex func-
tions fa ∈ C[R → R] (a ∈ A), we consider a∈A fa(ξ(a)) instead of a∈A γ(a)ξ(a)
to obtain MSFP3 below, a special case of MCFP3 with f being M-convex.
M-convex submodular flow problem MSFP3 (nonlinear arc cost)
Minimize Γ3(ξ) =

a∈A
fa(ξ(a)) + f(∂ξ) (9.46)
subject to ξ(a) ∈ domfa (a ∈ A), (9.47)
∂ξ ∈ domf, (9.48)
ξ(a) ∈ R (a ∈ A). (9.49)
In the integer-ﬂow version of the problem we assume f ∈ M[Z → R] and fa ∈
C[Z → R] for a ∈ A (or f ∈ M[Z|R → R] and fa ∈ C[Z|R → R] for a ∈ A).
Obviously, MSFP2 is a special case of MSFP3 with
fa(t) =

γ(a)t (t ∈ [c(a),c(a)]),
+∞ (otherwise).
(9.50)
The converse is also true; i.e., MSFP3 can be put into a problem of the form of
MSFP2, as is explained in Note 9.8.
Throughout this chapter we assume
ρ(V ) = 0, domf ⊆ {x ∈ RV
| x(V ) = 0}, (9.51)sidca00si
2013/2/12
page 257
9.2. M-Convex Submodular Flow Problem 257
since ∂ξ(V ) = 0 for any ﬂow ξ and ∂ξ ∈ domf = B = B(ρ) is imposed.
In subsequent sections we will see that the optimality criteria in terms of
potentials and negative cycles, as well as eﬃcient algorithms for the conventional
minimum cost ﬂow problem MCFP0, can be generalized for the M-convex submod-
ular ﬂow problem.
Note 9.8. The problem MSFP3 on G = (V,A) can be written in the form of
MSFP2 on a larger graph G̃ = (Ṽ ,Ã). We replace each arc a = (u,v) ∈ A with a
pair of arcs, a+
= (u,v−
a ) and a−
= (v+
a ,v), where v+
a and v−
a are newly introduced
vertices. Accordingly, we have Ã = {a+
,a−
| a ∈ A} and Ṽ = V ∪{v+
a ,v−
a | a ∈ A}.
For each a ∈ A we consider a function ˜ fa : R2
→ R ∪ {+∞} given by
˜ fa(t,s) =

fa(t) (t + s = 0),
+∞ (otherwise)
and deﬁne ˜ f : RṼ
→ R ∪ {+∞} by
˜ f(x̃) =

a∈A
˜ fa(x̃(v+
a ),x̃(v−
a )) + f(x̃|V ) (x̃ ∈ RṼ
),
where x̃|V denotes the restriction of x̃ to V . For a ﬂow ˜ ξ : Ã → R, we have
˜ ξ(a+
) = ˜ ξ(a−
) if (∂ξ̃(v+
a ),∂ξ̃(v−
a )) ∈ dom ˜ fa. The problem MSFP3 is thus reduced
to MSFP2 with the objective function Γ̃2(˜ ξ) = ˜ f(∂ξ̃). Note that, if f ∈ M[R → R]
and fa ∈ C[R → R] for a ∈ A, then ˜ f ∈ M[R → R].
Note 9.9. The cost function Γ3 of MSFP3 consists of two terms, the separable arc
cost a∈A fa(ξ(a)) and the M-convex boundary cost f(∂ξ). Noting that the former
is M
-convex, one might be tempted to consider a (nonseparable) M
-convex cost
function deﬁned on the arc set. The integer-ﬂow version of such a problem, however,
contains the Hamiltonian path problem, a well-known NP-complete problem, as a
special case.
Suppose that we want to check for the existence of an (s,t)-Hamiltonian path
in a directed graph G = (V,A), where we may assume s = t ∈ V and δ−
s = δ+
t = ∅.
We construct another directed graph G̃ = (Ṽ ,Ã) by replacing each arc a = (u,v) ∈
A with three arcs connected in series:
a+
= (u,v−
a ), a0
= (v−
a ,v+
a ), a−
= (v+
a ,v),
where v+
a and v−
a are newly introduced vertices. Hence, Ṽ = V ∪ {v+
a ,v−
a | a ∈ A}
and Ã = A+
∪ A0
∪ A−
, with A+
= {a+
| a ∈ A}, A0
= {a0
| a ∈ A}, and
A−
= {a−
| a ∈ A}. We consider three matroids, say, M+
, M−
, and M0
on A+
,
A−
, and A0
, respectively. M+
is a partition matroid in which B+
⊆ A+
is a base
if and only if
|B+
∩ {a+
| ∂+
a = v}| = 1 (∀v ∈ V ),
M−
is another partition matroid deﬁned similarly (with + replaced with −), and M0
is the graphic matroid in which B0
⊆ A0
is a base if and only if {a ∈ A | a0
∈ B0
} issidca00si
2013/2/12
page 258
## 258 Chapter 9. Network Flows
a tree of the original graph G. Let Q be the set of characteristic vectors of a subset
B̃ of Ã such that B̃ ∩ A+
is a base of M+
, B̃ ∩ A−
is a base of M−
, and B̃ ∩ A0
is
an independent set of M0
. Then a {0,1}-ﬂow ˜ ξ in G̃ with ˜ ξ ∈ Q and ∂ξ̃ = χs − χt
corresponds to an (s,t)-Hamiltonian path in G. Since Q is an M
-convex set, the
constraint ˜ ξ ∈ Q can be represented by a {0,+∞}-valued M
-convex cost function
on the arc set Ã.
## 9.3 Feasibility of Submodular Flow Problem
The feasibility of the submodular ﬂow problem MSFP1 is investigated here. Recall
that we are given a graph G = (V,A), an upper capacity c : A → R∪{+∞}, a lower
capacity c : A → R ∪ {−∞}, and a submodular set function ρ : 2V
→ R ∪ {+∞},
where c(a) ≥ c(a) for a ∈ A and ρ(∅) = ρ(V ) = 0. A feasible ﬂow means a function
ξ : A → R that satisﬁes
c(a) ≤ ξ(a) ≤ c(a) (a ∈ A), (9.52)
∂ξ ∈ B(ρ). (9.53)
The problem MSFP1 is said to be feasible if it admits a feasible ﬂow.
In section 9.1.2 we considered (9.52) to obtain Theorem 9.3. We now combine
(9.52) and (9.53) for the feasibility of MSFP1.
Theorem 9.10 (Feasibility). A submodular ﬂow problem MSFP1 is feasible if and
only if
c(Δ−
X) − c(Δ+
X) + ρ(X) ≥ 0 (∀X ⊆ V ). (9.54)
Moreover, if c, c, and ρ are integer valued and the problem is feasible, there exists
an integer-valued feasible ﬂow ξ : A → Z.
Proof. Let κ be the cut capacity function deﬁned by (9.16). By Theorem 9.3 a
feasible ﬂow exists if and only if B(κ) ∩ B(ρ) = ∅. The latter condition is equiva-
lent to
κ(V \ X) + ρ(X) ≥ 0 (∀X ⊆ V )
by Edmonds’s intersection theorem (Theorem 4.18) and further to (9.54) by
κ(V \ X) = c(Δ−
X) − c(Δ+
X).
In a feasible problem with integer-valued c, c, and ρ, both B(κ) and B(ρ) are
integral base polyhedra (integral M-convex polyhedra), and B(κ) ∩ B(ρ) ∩ ZV
is
nonempty by (4.32). Then (9.19) in Theorem 9.3 guarantees the existence of an
integer ﬂow ξ : A → Z with ∂ξ ∈ B(κ) ∩ B(ρ) ∩ ZV
.
Note 9.11. The necessity of (9.54) is easy to see. For any X ⊆ V , the net amount
of ﬂow entering X is equal to zero:

a∈Δ−X
ξ(a) −

a∈Δ+X
ξ(a) + ∂ξ(X) = 0, (9.55)sidca00si
2013/2/12
page 259
9.3. Feasibility of Submodular Flow Problem 259
and the constraints (9.52) and (9.53) should be satisﬁed:
ξ(a) ≤ c(a) (a ∈ Δ−
X), ξ(a) ≥ c(a) (a ∈ Δ+
X), ∂ξ(X) ≤ ρ(X). (9.56)
Combining these two yields (9.54). Theorem 9.10 claims that this “obvious” neces-
sary condition is in fact suﬃcient.
Note 9.12. In a feasible submodular ﬂow problem, the set of boundaries of feasible
ﬂows, ∂Ξ = {∂ξ | ξ : feasible ﬂow}, is an M2-convex polyhedron, and it is an integral
M2-convex polyhedron if c, c, and ρ are integer valued. This can be seen from the
proof of Theorem 9.10.
The maximum submodular ﬂow problem is to ﬁnd a feasible ﬂow ξ that max-
imizes ξ(a0) for a speciﬁed arc a0 ∈ A.
Maximum submodular flow problem maxSFP
Maximize ξ(a0) (9.57)
subject to c(a) ≤ ξ(a) ≤ c(a) (a ∈ A), (9.58)
∂ξ ∈ B(ρ), (9.59)
ξ(a) ∈ R (a ∈ A). (9.60)
A max-ﬂow min-cut theorem holds for this problem. Note that for any X ⊂ V
with a0 ∈ Δ+
X we have an “obvious” inequality:
ξ(a0) =

a∈Δ−X
ξ(a) −

a∈Δ+X\{a0}
ξ(a) + ∂ξ(X)
≤ c(Δ−
X) − c(Δ+
X \ {a0}) + ρ(X),
by (9.55) and (9.56).
Theorem 9.13 (Max-ﬂow min-cut theorem). For a feasible maximum submodular
ﬂow problem maxSFP,
max
ξ
{ξ(a0) | (9.58),(9.59),(9.60)}
= min
?
c(a0), min
X
{c(Δ−
X) − c(Δ+
X \ {a0}) + ρ(X) | a0 ∈ Δ+
X}
@
, (9.61)
where this common value can be +∞. If c, c, and ρ are integer valued and (9.61)
is ﬁnite, there exists an integer-valued maximum ﬂow ξ : A → Z.
Proof. Divide the arc a0 = (u,v) into two arcs in series, say, a0 = (u,w) and
a
0 = (w,v), and denote by G̃ = (Ṽ ,Ã) the resulting graph, where Ṽ = V ∪ {w}
and Ã = A ∪ {a
0}. Deﬁne the capacities of a
0 by c(a
0) = t and c(a
0) = +∞ with
a parameter t, and let ρ be deﬁned for all subsets of Ṽ by ρ(X ∪ {w}) = ρ(X) for
X ⊆ V . The maximum in (9.61) is equal to the maximum (or supremum) of t suchsidca00si
2013/2/12
page 260
## 260 Chapter 9. Network Flows
that the submodular ﬂow problem on G̃ = (Ṽ ,Ã) is feasible. With this relationship,
Theorem 9.10 implies (9.61) as well as the integrality assertion.
If ξ and X attain the maximum and the minimum in (9.61), respectively, and
if ξ(a0) < c(a0), then we have
∂ξ(X) = ρ(X), ξ(a) = c(a) (a ∈ Δ−
X), ξ(a) = c(a) (a ∈ Δ+
X \{a0}). (9.62)
## 9.4 Optimality Criterion by Potentials
In section 9.1.3 we saw a potential criterion for optimality (Theorem 9.4) for the
minimum cost ﬂow problem MCFP3. Since the M-convex submodular ﬂow problem
MSFP3 is a special case of MCFP3, the following optimality criterion for MSFP3 is
immediate from Theorem 9.4.
Theorem 9.14 (Potential criterion). In the M-convex submodular ﬂow problem
MSFP3 with fa ∈ C[R → R] (a ∈ A) and f ∈ M[R → R], we have the following.
(1) For a feasible ﬂow ξ : A → R, the two conditions (OPT) and (POT) below
are equivalent.
(OPT) ξ is an optimal ﬂow.
(POT) There exists a potential p : V → R such that
(i) ξ(a) ∈ argminfa[δp(a)] for every a ∈ A, and
(ii) ∂ξ ∈ argminf[−p].
(2) Suppose that a potential p : V → R satisﬁes (i) and (ii) above for an
optimal ﬂow ξ. A feasible ﬂow ξ
is optimal if and only if
(i) ξ
(a) ∈ argminfa[δp(a)] for every a ∈ A, and
(ii) ∂ξ
∈ argminf[−p].
A comment is in order on the role of the M-convexity of f. Since fa is a
univariate convex function for every a ∈ A, condition (i) in (POT) can be expressed
in terms of directional derivatives as:
ξ(a) ∈ argminfa[δp(a)]
⇐⇒ f
a(ξ(a);d) + d[p(∂+
a) − p(∂−
a)] ≥ 0 (d = ±1). (9.63)
If f is M-convex, condition (ii) in (POT) can also be expressed in terms of directional
derivatives as:
∂ξ ∈ argminf[−p]
⇐⇒ f
(∂ξ;−χu + χv) + p(u) − p(v) ≥ 0 (∀u,v ∈ V ), (9.64)
by the M-optimality criterion in Theorem 6.52 (1). These expressions show how the
conditions in (POT) can be veriﬁed eﬃciently for a given p. It is also mentioned that
these expressions lead to another optimality criterion in terms of negative cycles, to
be established in section 9.5, and furthermore to the cycle-canceling algorithm for
the M-convex submodular ﬂow problem, to be explained in section 10.4.3.sidca00si
2013/2/12
page 261
9.4. Optimality Criterion by Potentials 261
An alternative representation of condition (ii) in (POT) is obtained from the
M-convexity of f. The function conjugate to f, say, g, is a polyhedral L-convex
function with g(p+1) = g(p) for all p (by Theorem 8.4 and (9.51)). It follows from
(3.30) and the L-optimality criterion (Theorem 7.33 (1)) that
x ∈ argminf[−p] ⇐⇒ p ∈ argming[−x]
⇐⇒

g
(p;χX) − x(X) ≥ 0 (∀X ⊆ V ),
g
(p;1) − x(V ) = 0.
This shows that argminf[−p] coincides with the base polyhedron B(gp) associated
with the set function gp deﬁned by
gp(X) = g
(p;χX) (X ⊆ V ),
which is submodular by Theorem 7.43 (1). Hence,
∂ξ ∈ argminf[−p] ⇐⇒ ∂ξ ∈ B(gp). (9.65)
This expression is used in the primal-dual algorithm for the M-convex submodular
ﬂow problem, to be explained in section 10.4.4.
We go on to discuss integrality properties of the M-convex submodular ﬂow
problem. This generalizes the well-known facts (Theorem 9.6) for the minimum cost
ﬂow problem MCFP0. Recall the notation M[Z|R → R] and M[R → R|Z] for the
sets of integral and dual-integral polyhedral M-convex functions, respectively.
Theorem 9.15. Suppose that an optimal solution exists in the M-convex submod-
ular ﬂow problem MSFP3 with fa ∈ C[R → R] (a ∈ A) and f ∈ M[R → R].
(1) The set of the boundaries of optimal ﬂows,
∂Ξ∗
= {∂ξ | ξ : optimal ﬂow},
is an M2-convex polyhedron, and the set of optimal potentials,
Π∗
= {p | p : optimal potential},
is an L-convex polyhedron.
(2) [Primal integrality] If fa ∈ C[Z|R → R] (a ∈ A) and f ∈ M[Z|R → R],
then ∂Ξ∗
is an integral M2-convex polyhedron, and there exists an integer-valued
optimal ﬂow ξ : A → Z.
(3) [Dual integrality] If fa ∈ C[R → R|Z] (a ∈ A) and f ∈ M[R → R|Z], then
Π∗
is an integral L-convex polyhedron, and there exists an integer-valued optimal
potential p : V → Z.
Proof. (1) Let p be an optimal potential. Since argminfa[δp(a)] forms an interval,
say, [c∗
(a),c∗
(a)]R, condition (i) in (POT) of Theorem 9.14 can be expressed as
c∗
(a) ≤ ξ(a) ≤ c∗
(a) (a ∈ A). Just as in (9.16) and (9.18), the set of ∂ξ for such ξ
coincides with the base polyhedron B(κ∗
) for κ∗
deﬁned by
κ∗
(X) = c∗
(Δ+
X) − c∗
(Δ−
X) (X ⊆ V ).sidca00si
2013/2/12
page 262
## 262 Chapter 9. Network Flows
Combining this with (9.65) we obtain ∂Ξ∗
= B(κ∗
)∩B(gp), which is an M2-convex
polyhedron. Now let ξ be an optimal ﬂow. Potentials p satisfying (i) in (POT) form
an L-convex polyhedron, say, D1, by (9.63), whereas those satisfying (ii) in (POT)
form another L-convex polyhedron D2 by (9.64). Therefore, Π∗
= D1 ∩ D2 is an
L-convex polyhedron.
(2) Both B(κ∗
) and B(gp) are integral M-convex polyhedra. The integrality
of ∂Ξ∗
= B(κ∗
) ∩ B(gp) follows from (4.32).
(3) Both D1 and D2 are integral L-convex polyhedra by Theorem 6.61 (1).
The integrality of Π∗
= D1 ∩ D2 follows from Theorem 5.7.
For linear arc cost, with fa given by (9.50), the integrality conditions are
simpliﬁed as follows:
fa ∈ C[Z|R → R] ⇐⇒ c(a),c(a) ∈ Z, (9.66)
fa ∈ C[R → R|Z] ⇐⇒ γ(a) ∈ Z. (9.67)
Finally, we state the optimality criterion for the integer-ﬂow version of the
M-convex submodular ﬂow problem MSFP3. This is a corollary of Theorems 9.14
and 9.15.
Theorem 9.16 (Potential criterion). Consider the M-convex submodular integer-
ﬂow problem MSFP3 with fa ∈ C[Z → R] (a ∈ A) and f ∈ M[Z → R].
(1) For a feasible integer ﬂow ξ : A → Z, the two conditions (OPT) and
(POT) below are equivalent.
(OPT) ξ is an optimal integer ﬂow.
(POT) There exists a potential p : V → R such that
(i) ξ(a) ∈ argminfa[δp(a)] for every a ∈ A, and
(ii) ∂ξ ∈ argminf[−p].
(2) Suppose that a potential p : V → R satisﬁes (i) and (ii) above for an
optimal integer ﬂow ξ. A feasible integer ﬂow ξ
is optimal if and only if
(i) ξ
(a) ∈ argminfa[δp(a)] for every a ∈ A, and
(ii) ∂ξ
∈ argminf[−p].
(3) The set of the boundaries of optimal integer ﬂows,
∂Ξ∗
= {∂ξ | ξ : optimal integer ﬂow},
is an M2-convex set.
(4) If the cost functions are integer valued, i.e., if fa ∈ C[Z → Z] (a ∈ A) and
f ∈ M[Z → Z], then there exists an integer-valued potential p : V → Z in (POT).
Moreover, the set of integer-valued optimal potentials,
Π∗
= {p | p : integer-valued optimal potential},
is an L-convex set.
In connection to (i) and (ii) in (POT) in Theorem 9.16, note the equivalencessidca00si
2013/2/12
page 263
9.5. Optimality Criterion by Negative Cycles 263
ξ(a) ∈ argminfa[δp(a)]
⇐⇒ fa(ξ(a) + d) − fa(ξ(a)) + d[p(∂+
a) − p(∂−
a)] ≥ 0 (d = ±1), (9.68)
∂ξ ∈ argminf[−p]
⇐⇒ Δf(∂ξ;v,u) + p(u) − p(v) ≥ 0 (∀u,v ∈ V ). (9.69)
These are the discrete counterparts of (9.63) and (9.64).
Note 9.17. The Fenchel-type duality theorem for M-convex functions (Theorem
8.21) is essentially equivalent to the optimality criterion for the M-convex submod-
ular integer-ﬂow problem (Theorem 9.16). See section 9.1.4 and note that, for an
M-convex function f1 and an M-concave function h2, f(x1,x2) = f1(x1)−h2(−x2)
is an M-convex function.
## 9.5 Optimality Criterion by Negative Cycles
The optimality of an M-convex submodular ﬂow can also be characterized by the
nonexistence of negative cycles in an auxiliary network. This fact leads to the
cycle-canceling algorithm to be described in section 10.4.3.
## 9.5.1 Negative-Cycle Criterion
We consider the M-convex submodular ﬂow problem MSFP2 with M-convex bound-
ary cost and linear arc cost. This is not restrictive, since MSFP3, having nonlinear
convex arc cost, can be put in the form of MSFP2, as explained in Note 9.8. We
consider real-valued ﬂows and then integer-valued ﬂows.
We assume f ∈ M[R → R] in considering real-valued ﬂows. For a feasible
ﬂow ξ : A → R, we deﬁne an auxiliary network as follows. Let Gξ = (V,Aξ) be a
directed graph with vertex set V and arc set Aξ = A∗
ξ ∪B∗
ξ ∪Cξ consisting of three
disjoint parts:
A∗
ξ ={a | a ∈ A,ξ(a) < c(a)},
B∗
ξ ={a | a ∈ A,c(a) < ξ(a)} (a: reorientation of a),
Cξ ={(u,v) | u,v ∈ V,u = v,∃α > 0 : ∂ξ − α(χu − χv) ∈ domRf}. (9.70)
We deﬁne a function ξ : Aξ → R, representing arc lengths, by
ξ(a) =
⎧
⎨
⎩
γ(a) (a ∈ A∗
ξ),
−γ(a) (a ∈ B∗
ξ ,a ∈ A),
f
(∂ξ;−χu + χv) (a = (u,v) ∈ Cξ).
(9.71)
We refer to (Gξ,ξ) as the auxiliary network. We call a directed cycle of negative
length a negative cycle.
The following theorem gives an optimality criterion in terms of negative cycles.
Theorem 9.18 (Negative-cycle criterion). For a feasible ﬂow ξ : A → R to the
M-convex submodular ﬂow problem MSFP2 with f ∈ M[R → R], the conditions
(OPT) and (NNC) below are equivalent.sidca00si
2013/2/12
page 264
## 264 Chapter 9. Network Flows
(OPT) ξ is an optimal ﬂow.
(NNC) There exists no negative cycle in (Gξ,ξ) with ξ of (9.71).
Proof. As is well known in network ﬂow theory, (NNC) is equivalent to the existence
of a potential p : V → R such that
ξ(a) + p(∂+
a) − p(∂−
a) ≥ 0 (a ∈ Aξ).
By (9.31), (9.32), (9.64), and the deﬁnition (9.71) of ξ, this condition is equivalent
to conditions (i) and (ii) of (POT) in Theorem 9.14. Hence follows the equivalence
of (NNC) and (OPT) by Theorem 9.14.
Note 9.19. In a problem with dual integrality the arc length ξ is integer valued.
The integrality of ξ(a) for a ∈ A∗
ξ ∪ B∗
ξ is due to (9.67) and that for a ∈ Cξ is
by Theorem 6.61 (1). For integer-valued ξ, we can take an integer-valued p in the
proof of Theorem 9.18.
Next we consider the integer-ﬂow problem under the assumptions
c : A → Z ∪ {+∞}, c : A → Z ∪ {−∞}, f ∈ M[Z → R]. (9.72)
For a feasible integer ﬂow ξ : A → Z, we deﬁne an auxiliary network (Gξ,ξ) in a
similar manner, while modifying the deﬁnitions of Cξ and ξ to
Cξ = {(u,v) | u,v ∈ V,u = v,∂ξ − (χu − χv) ∈ domZf}, (9.73)
ξ(a) =
⎧
⎨
⎩
γ(a) (a ∈ A∗
ξ),
−γ(a) (a ∈ B∗
ξ ,a ∈ A),
Δf(∂ξ;v,u) (a = (u,v) ∈ Cξ).
(9.74)
Theorem 9.20 (Negative-cycle criterion). For a feasible integer ﬂow ξ : A → Z to
the M-convex submodular integer ﬂow problem MSFP2 with (9.72), the conditions
(OPT) and (NNC) below are equivalent.
(OPT) ξ is an optimal ﬂow.
(NNC) There exists no negative cycle in (Gξ,ξ) with ξ of (9.74).
Proof. This is similar to the proof of Theorem 9.18. Note, however, that Theorem
9.16 is used here in place of Theorem 9.14.
Note 9.21. The M-convex intersection problem introduced in section 8.2.1 can
be formulated as an M-convex submodular ﬂow problem. Given two M-convex
functions f1,f2 : ZV
→ R ∪ {+∞}, we consider an M-convex submodular ﬂow
problem on the bipartite graph G = (V1 ∪ V2,A) in Fig. 9.3, where V1 and V2 are
copies of V and A = {(v1,v2) | v ∈ V } with v1 ∈ V1 and v2 ∈ V2 denoting the copies
of v ∈ V . The boundary cost function f : ZV1
× ZV2
→ R ∪ {+∞} is deﬁned by
f(x1,x2) = f1(x1) + f2(−x2) for x1 ∈ ZV1
and x2 ∈ ZV2
, whereas the arc costs aresidca00si
2013/2/12
page 265
9.5. Optimality Criterion by Negative Cycles 265
V1
f1(x1)
V2
f2(−x2)
-
-
-
-
-
Figure 9.3. Submodular ﬂow problem for M-convex intersection problem.
identically zero without capacity constraints. Since x1 = −x2 if (x1,x2) = ∂ξ for
a ﬂow ξ in this network, the M-convex submodular ﬂow problem is equivalent to
minimizing f1(x) + f2(x). The negative-cycle optimality criterion (Theorem 9.20)
for this M-convex submodular ﬂow problem yields the M2-optimality criterion in
Theorem 8.33. This argument shows also that the M2-optimality criterion can be
veriﬁed in polynomial time.
## 9.5.2 Cycle Cancellation
The negative-cycle optimality criterion states that the existence of a negative cycle
implies the nonoptimality of a feasible ﬂow. This suggests the possibility of im-
proving a nonoptimal feasible ﬂow by the cancellation of a suitably chosen negative
cycle.
Let us consider the integer-ﬂow problem with (9.72). Suppose that negative
cycles exist in the auxiliary network (Gξ,ξ) for a feasible integer ﬂow ξ, where the
arc length ξ is deﬁned by (9.74). Choose a negative cycle with the smallest number
of arcs and let Q (⊆ Aξ) be the set of its arcs. Modifying the ﬂow ξ along Q we
obtain a new integer ﬂow ξ deﬁned by
ξ(a) =
⎧
⎨
⎩
ξ(a) + 1 (a ∈ Q ∩ A∗
ξ),
ξ(a) − 1 (a ∈ Q ∩ B∗
ξ ),
ξ(a) (otherwise).
(9.75)
The following theorem shows that ξ is a feasible ﬂow with an improvement in the
objective function
Γ2(ξ) =

a∈A
γ(a)ξ(a) + f(∂ξ).
This gives an alternative proof for “(OPT) ⇒ (NNC),” which has already been
established in Theorem 9.20 with the aid of Theorem 9.16.
Theorem 9.22. For a feasible integer ﬂow ξ to the M-convex submodular integer-
ﬂow problem MSFP2 with (9.72), let Q be a negative cycle with the smallest number
of arcs in (Gξ,ξ). Then ξ in (9.75) is a feasible integer ﬂow and
Γ2(ξ) ≤ Γ2(ξ) + ξ(Q) < Γ2(ξ).sidca00si
2013/2/12
page 266
## 266 Chapter 9. Network Flows
The rest of this section is devoted to the proof of Theorem 9.22. The key
ingredient of the proof is the unique-min condition, deﬁned as follows.
For a pair (x,y) of integer vectors satisfying x ∈ domZf and ||x−y||∞ = 1, we
consider a bipartite graph G(x,y) = (V +
,V −
;E) with vertex sets V +
= supp+
(x−
y) and V −
= supp−
(x − y) and arc set
E = {(u,v) | u ∈ V +
,v ∈ V −
,x − χu + χv ∈ domZf}
and associate c(u,v) = Δf(x;v,u) with arc (u,v) ∈ E as its weight. We say
that (x,y) satisﬁes the unique-min condition if there exists in G(x,y) exactly one
minimum-weight perfect matching with respect to c.
Denote by ˇ f(x,y) the minimum weight of a perfect matching in G(x,y), where
ˇ f(x,y) = +∞ if no perfect matching exists. Proposition 6.25 shows f(y) − f(x) ≥
ˇ f(x,y) for any x ∈ domZf and y ∈ ZV
. The unique-min condition is a suﬃcient
condition for this inequality to be an equality.
Proposition 9.23. Let f ∈ M[Z → R] be an M-convex function, and assume
x ∈ domZf, y ∈ ZV
, and ||x−y||∞ = 1. If (x,y) satisﬁes the unique-min condition,
then y ∈ domZf and
f(y) − f(x) = ˇ f(x,y). (9.76)
Proof. The set function ω deﬁned by ω(X) = −f(x∧y+χX) (X ⊆ V ) is a valuated
matroid; see (2.77). The present claim is a reformulation of the unique-max lemma
for valuated matroids (see Theorem 5.2.35 in Murota [146]).
The following proposition gives a necessary and suﬃcient condition for a bi-
partite graph to have a unique minimum-weight perfect matching. It also shows
that the unique-min condition for a pair of integer vectors can be checked by an
eﬃcient algorithm.
Proposition 9.24. Let G = (V +
,V −
;E) be a bipartite graph with |V +
| = |V −
| (=
m) and c : V +
×V −
→ R∪{+∞} be a weight function such that c(u,v) < +∞ ⇐⇒
(u,v) ∈ E. There exists a unique minimum-weight perfect matching if and only if
there exist a potential p̂ : V +
∪V −
→ R and orderings of vertices V +
= {u1,...,um}
and V −
= {v1,...,vm} such that
c(ui,vj) + p̂(ui) − p̂(vj)
⎧
⎨
⎩
= 0 (1 ≤ i = j ≤ m),
≥ 0 (1 ≤ j < i ≤ m),
> 0 (1 ≤ i < j ≤ m).
(9.77)
Proof. This follows from the complementarity (Theorem 3.10 (3)) in the linear
program formulation in the proof of Proposition 3.14.
The following is the key fact. Note that ∂ξ ∈ domZf and ||∂ξ − ∂ξ||∞ = 1.sidca00si
2013/2/12
page 267
9.5. Optimality Criterion by Negative Cycles 267
Proposition 9.25. (∂ξ,∂ξ) satisﬁes the unique-min condition.
Proof. Consider the bipartite graph G(∂ξ,∂ξ) = (V +
,V −
;E), where V +
=
supp+
(∂ξ − ∂ξ), V −
= supp−
(∂ξ − ∂ξ), and
E = {(u,v) | u ∈ V +
,v ∈ V −
,∂ξ − χu + χv ∈ domZf}.
We have |V +
| = |V −
| = m for m = ||∂ξ − ∂ξ||1/2 and the weight of arc (u,v)
equal to Δf(∂ξ;v,u). We may think of G(∂ξ,∂ξ) as a subgraph of the graph Gξ of
section 9.5.1 by regarding E as a subset of Cξ in (9.73). Then Q∩Cξ determines a
perfect matching in G(∂ξ,∂ξ).
Let M = {(ui,vi) | i = 1,...,m} be a minimum-weight perfect matching in
G(∂ξ,∂ξ) and p̂ be an optimal potential in Proposition 3.14. Note that M is a
subset of
C∗
ξ = {(u,v) | u ∈ V +
,v ∈ V −
,Δf(∂ξ;v,u) + p̂(u) − p̂(v) = 0}.
Regarding M as a subset of Cξ, we deﬁne Q
= (Q\Cξ)∪M. Since M is a minimum-
weight perfect matching, Q∩Cξ is a perfect matching, and ξ(a) = Δf(∂ξ;v,u) for
a = (u,v) ∈ Cξ, we have ξ(M) ≤ ξ(Q ∩ Cξ), from which follows
ξ(Q
) = ξ(Q) + [ξ(M) − ξ(Q ∩ Cξ)] ≤ ξ(Q) < 0. (9.78)
Since Q
is a union of disjoint cycles with |Q
| = |Q| and Q is a negative cycle with
the smallest number of arcs, (9.78) implies that Q
is also a negative cycle with the
smallest number of arcs.
To prove by contradiction, suppose that (∂ξ,∂ξ) does not satisfy the unique-
min condition. Since (ui,vi) ∈ C∗
ξ for i = 1,...,m, it follows from Proposition 9.24
that there exist distinct indices ik (k = 1,...,q;q ≥ 2) such that (uik
,vik+1
) ∈ C∗
ξ
for k = 1,...,q, where iq+1 = i1. That is,
Δf(∂ξ;vik+1
,uik
) = −p̂(uik
) + p̂(vik+1
) (k = 1,...,q).
On the other hand, we have
Δf(∂ξ;vik
,uik
) = −p̂(uik
) + p̂(vik
) (k = 1,...,q).
It then follows that
q 
k=1
Δf(∂ξ;vik+1
,uik
) =
q 
k=1
Δf(∂ξ;vik
,uik
);
i.e.,
q 
k=1
ξ(uik
,vik+1
) =
q 
k=1
ξ(uik
,vik
). (9.79)sidca00si
2013/2/12
page 268
## 268 Chapter 9. Network Flows
For k = 1,...,q, let P
(vik+1
,uik
) denote the path on Q
from vik+1
to uik
,
and let Q
k be the directed cycle consisting of arc (uik
,vik+1
) and path P
(vik+1
,uik
).
Obviously,
q :
k=1
Q
k =
8 q :
k=1
P
(vik+1
,uik
)
9
∪ {(uik
,vik+1
) | k = 1,...,q},
where the union here (and also below) means the multiset union, counting the
number of occurrences of elements. A simple but crucial observation is that
8 q :
k=1
P
(vik+1
,uik
)
9
∪ {(uik
,vik
) | k = 1,...,q} = q
· Q
(9.80)
for some integer q
with 1 ≤ q
< q. Hence,
q 
k=1
ξ(Q
k) =
q 
k=1
ξ(P
(vik+1
,uik
)) +
q 
k=1
ξ(uik
,vik+1
)
=
q 
k=1
ξ(P
(vik+1
,uik
)) +
q 
k=1
ξ(uik
,vik
)
= q
· ξ(Q
) < 0,
where (9.79) and (9.78) are used. This implies that ξ(Q
k) < 0 for some k, which,
however, is a contradiction, since Q
k has a smaller number of arcs than Q
. This
completes the proof.
Proof of Theorem 9.22: It follows from Propositions 9.25 and 9.23 as well as
the deﬁnition of ˇ f that
f(∂ξ) = f(∂ξ) + ˇ f(∂ξ,∂ξ) ≤ f(∂ξ) + ξ(Q ∩ Cξ),
whereas

a∈A
γ(a)ξ(a) =

a∈A
γ(a)ξ(a) + ξ(Q ∩ (A∗
ξ ∪ B∗
ξ )).
Adding these two results in Γ2(ξ) ≤ Γ2(ξ) + ξ(Q).
## 9.6 Network Duality
Transformation by a network is one of the most important operations for M-convex
and L-convex functions. A given pair of M-convex and L-convex functions deﬁned
on entrance vertices of a network is transformed through the network to another
pair of M-convex and L-convex functions on exit vertices. Moreover, if the functions
in the given pair are conjugate to each other, the resulting pair is also conjugate.
This fact reveals a deeper intrinsic relationship of M-/L-convexity to network ﬂow,
partly discussed in section 2.2. The theorems as well as their implications are stated
in section 9.6.1, and the proofs are given in section 9.6.2.sidca00si
2013/2/12
page 269
9.6. Network Duality 269
S
f(x)
g(p)
T
˜ f(y)
g̃(q)
-
j
-
*
s
q
1
j
N

1
-
j

>
-
O
W
(fa,ga)
(ξ(a),η(a))
Figure 9.4. Transformation by a network.
## 9.6.1 Transformation by Networks
We ﬁrst deal with functions of the Z → Z type, integer-valued functions deﬁned on
integer points, and then functions of other types, Z → R and R → R.
Let G = (V,A;S,T) be a directed graph with vertex set V , arc set A, entrance
set S, and exit set T, where S and T are disjoint subsets of V ; see Fig. 9.4 for
an illustration. For each a ∈ A, the costs of integer-valued ﬂow and tension are
represented, respectively, by functions fa : Z → Z∪{+∞} and ga : Z → Z∪{+∞}.
Given functions f,g : ZS
→ Z ∪ {+∞} associated with the entrance set S of
the network, we deﬁne functions ˜ f,g̃ : ZT
→ Z ∪ {±∞} on the exit set T by
˜ f(y) = inf
ξ,x
(
f(x) +

a∈A
fa(ξ(a))
)
)
)
)
)
∂ξ = (x,−y,0),
ξ ∈ ZA
,(x,−y,0) ∈ ZS
× ZT
× ZV \(S∪T)
*
(y ∈ ZT
), (9.81)
g̃(q) = inf
η,p,r
(
g(p) +

a∈A
ga(η(a))
)
)
)
)
)
η = −δ(p,q,r),
η ∈ ZA
,(p,q,r) ∈ ZS
× ZT
× ZV \(S∪T)
*
(q ∈ ZT
). (9.82)
We may think of ˜ f(y) as the minimum cost to meet a demand speciﬁcation y at the
exit, where the cost consists of two parts, the cost f(x) of supply or production of
x at the entrance and the cost a∈A fa(ξ(a)) of transportation through arcs; the
sum of these is to be minimized over varying supply x and ﬂow ξ subject to the
ﬂow conservation constraint ∂ξ = (x,−y,0). A similar interpretation is possible
for g̃(q). We regard ˜ f and g̃ as the results of transformations of f and g by the
network; (9.81) and (9.82) are called transformations of ﬂow type and of potential
type, respectively.sidca00si
2013/2/12
page 270
## 270 Chapter 9. Network Flows
The following theorem reveals the harmonious relationship between network
ﬂow and M-/L-convexity by which a conjugate pair of M-convex and L-convex func-
tions is transformed to another conjugate pair of M-convex and L-convex functions.
Note that C[Z → Z] denotes the set of univariate integer-valued discrete convex
functions, and •
means the discrete Legendre–Fenchel transformation (8.11)Z.
Theorem 9.26. Assume fa,ga ∈ C[Z → Z] for each a ∈ A. For f,g : ZS
→
Z ∪ {+∞}, let ˜ f,g̃ : ZT
→ Z ∪ {±∞} be the functions induced by G = (V,A;S,T)
according to (9.81) and (9.82), where it is assumed that ˜ f > −∞, ˜ f ≡ +∞, g̃ > −∞,
and g̃ ≡ +∞.
(1) f ∈ M[Z → Z] =⇒ ˜ f ∈ M[Z → Z], and
f ∈ M
[Z → Z] =⇒ ˜ f ∈ M
[Z → Z].
(2) g ∈ L[Z → Z] =⇒ g̃ ∈ L[Z → Z], and
g ∈ L
[Z → Z] =⇒ g̃ ∈ L
[Z → Z].
(3) f ∈ M
[Z → Z], g ∈ L
[Z → Z], g = f•
, ga = fa
•
(a ∈ A) =⇒ g̃ = ˜ f•
.
We explain the implications of this theorem by considering three special cases.
The ﬁrst special case is a well-known construction in matroid theory, induction of
a matroid through a graph. Given a graph G = (V,A;S,T) and a matroid (S,B) on
S with base family B, let B̃ be the family of subsets of T that can be linked with
some base of (S,B) by a vertex-disjoint linking in G. Then B̃ forms the base family
of a matroid on T, which is referred to as the matroid induced from (S,B) through
G. To formulate this as a special case of Theorem 9.26 (1), we split each vertex
v ∈ V into two copies, v
and v
, to consider a graph Ḡ = (V 
∪V 
,Ā;S
,T
) with
Ā = {(u
,v
) | (u,v) ∈ A} ∪ {(v
,v
) | v ∈ V },
where S
= {v
| v ∈ S} and T
= {v
| v ∈ T}. Let f : ZS
→ Z ∪ {+∞} be the
indicator function of the set of the characteristic vectors of bases, i.e., f = δB for
B = {χX | X ∈ B}, and, for each arc a ∈ Ā, deﬁne fa to be the indicator function
of {0,1}. Then the induced function ˜ f : ZT
→ Z ∪ {+∞} represents the family B̃
in the sense that ˜ f = δB̃ for B̃ = {χY  | Y ∈ B̃}. Then the M-convexity of ˜ f stated
in Theorem 9.26 (1) shows that (T,B̃) is a matroid.
The second case is where (S,T) = (V,∅). Then the induced functions ˜ f and
g̃ are constants, having no arguments, and the conjugacy asserted in Theorem 9.26
(3) amounts to a min-max relation
inf
ξ∈ZA,x∈ZV
{Φ(ξ,x) | ∂ξ = x} = sup
η∈ZA,p∈ZV
{Ψ(η,p) | η = −δp} (9.83)
for
Φ(ξ,x) = f(x) +

a∈A
fa(ξ(a)) (ξ ∈ ZA
,x ∈ ZV
),
Ψ(η,p) = −g(p) −

a∈A
ga(η(a)) (η ∈ ZA
,p ∈ ZV
).sidca00si
2013/2/12
page 271
9.6. Network Duality 271
This is the discrete counterpart of (9.36), showing the duality nature of the assertion
of Theorem 9.26 (3).
The third case is where S = ∅. Then the induced functions are
˜ f(y) = inf
ξ
(

a∈A
fa(ξ(a))
)
)
)
)
)
∂ξ = (−y,0) ∈ ZT
× ZV \T
,ξ ∈ ZA
*
(y ∈ ZT
),
g̃(q) = inf
η,r
(

a∈A
ga(η(a))
)
)
)
)
)
η = −δ(q,r),r ∈ ZV \T
,η ∈ ZA
*
(q ∈ ZT
),
which are identical to (2.42) and (2.43), respectively, and the claims in Theorem
9.26 reduce to the facts observed in section 2.2.2.
Whereas Theorem 9.26 deals with integer-valued functions deﬁned on integer
points, similar statements are true for functions of type Z → R and R → R. Note
that the conjugacy assertion is missing in the case of Z → R.
Theorem 9.27. Assume fa,ga ∈ C[Z → R] for each a ∈ A. For f,g : ZS
→
R ∪ {+∞}, let ˜ f,g̃ : ZT
→ R∪ {±∞} be the functions induced by G = (V,A;S,T)
according to (9.81) and (9.82), where it is assumed that ˜ f > −∞, ˜ f ≡ +∞, g̃ > −∞,
and g̃ ≡ +∞.
(1) f ∈ M[Z → R] =⇒ ˜ f ∈ M[Z → R], and
f ∈ M
[Z → R] =⇒ ˜ f ∈ M
[Z → R].
(2) g ∈ L[Z → R] =⇒ g̃ ∈ L[Z → R], and
g ∈ L
[Z → R] =⇒ g̃ ∈ L
[Z → R].
Theorem 9.28. Assume fa,ga ∈ C[R → R] for each a ∈ A. For f,g : RS
→
R∪{+∞}, let ˜ f,g̃ : RT
→ R∪{±∞} be the functions induced by G = (V,A;S,T)
according to
˜ f(y) = inf
ξ,x
(
f(x) +

a∈A
fa(ξ(a))
)
)
)
)
)
∂ξ = (x,−y,0),
ξ ∈ RA
,(x,−y,0) ∈ RS
× RT
× RV \(S∪T)
*
(y ∈ RT
),
g̃(q) = inf
η,p,r
(
g(p) +

a∈A
ga(η(a))
)
)
)
)
)
η = −δ(p,q,r),
η ∈ RA
,(p,q,r) ∈ RS
× RT
× RV \(S∪T)
*
(q ∈ RT
),
where it is assumed that ˜ f > −∞, ˜ f ≡ +∞, g̃ > −∞, and g̃ ≡ +∞.
(1) f ∈ M[R → R] =⇒ ˜ f ∈ M[R → R], and
f ∈ M
[R → R] =⇒ ˜ f ∈ M
[R → R].sidca00si
2013/2/12
page 272
## 272 Chapter 9. Network Flows
V 
, f
U
fU∗
u0
S T
-
-
-
-
z
-
:
V1, f1
V2, f2
V , f12Z f2
S T
j
j
j
j
>
>
>
>
Figure 9.5. Bipartite graphs for aggregation and convolution operations.
(2) g ∈ L[R → R] =⇒ g̃ ∈ L[R → R], and
g ∈ L
[R → R] =⇒ g̃ ∈ L
[R → R].
(3) f ∈ M
[R → R], g ∈ L
[R → R], g = f•
, ga = fa
•
(a ∈ A) =⇒ g̃ = ˜ f•
,
where •
means the Legendre–Fenchel transformation (3.26).
A number of fundamental operations on M-convex and L-convex functions can
be formulated as the transformation by networks, as is partly demonstrated below.
Note 9.29. The M-convexity of the aggregation fU∗
of an M-convex function f
(Theorem 6.13 (7)) is proved here as an application of Theorem 9.27. Let V 
be
a copy of V and consider a bipartite graph G = (S ∪ T,A;S,T) with S = V 
,
T = U ∪ {u0}, and A = {(v
,v) | v ∈ U} ∪ {(v
,u0) | v ∈ V \ U}, where v
∈ V 
is
the copy of v ∈ V and u0 is a distinguished vertex (see Fig. 9.5 (left)). We regard
f as being deﬁned on S and assume that the arc cost functions fa (a ∈ A) are
identically zero. The function ˜ f induced on T coincides with the aggregation fU∗
.
This also means that the aggregation fU∗
can be evaluated by solving an M-convex
submodular ﬂow problem.
Note 9.30. The M-convexity of the inﬁmal convolution f12Z f2 of M-convex
functions (Theorem 6.13 (8)) is proved here as an application of Theorem 9.27. Let
V1 and V2 be copies of V and consider a bipartite graph G = (S ∪ T,A;S,T) with
S = V1 ∪ V2, T = V , and A = {(v1,v) | v ∈ V } ∪ {(v2,v) | v ∈ V }, where vi ∈ Vi is
the copy of v ∈ V for i = 1,2 (see Fig. 9.5 (right)). We regard fi as being deﬁned
on Vi for i = 1,2 and assume that the arc cost functions fa (a ∈ A) are identically
zero. The function ˜ f induced on T coincides with the inﬁmal convolution f12Z f2.
This also means that the inﬁmal convolution f12Z f2 can be evaluated by solving
an M-convex submodular ﬂow problem.sidca00si
2013/2/12
page 273
9.6. Network Duality 273
u{1}
u{2}
u{3}
u{4}
u{5}
u{23}
u{45}
u{123}
uV u0
-
aV 
~a{45}
*
a{1}
j *
j
*
j
Figure 9.6. Rooted directed tree for a laminar family.
Note 9.31. An alternative proof of the M
-convexity of a laminar convex function
(6.34) is given here as an application of Theorem 9.27. Let T be a laminar family
of subsets of V , where we may assume that ∅ / ∈ T , V ∈ T , and every singleton
set belongs to T . We represent T by a directed tree G = (U,A;S,T) with root
u0, where U = {uX | X ∈ T } ∪ {u0}, A = {aX | X ∈ T }, S = {u0}, T =
{u{v} | v ∈ V }, and ∂−
aX = uX and ∂+
aX = uX̂ for X ∈ T , where X̂ denotes
the smallest member of T that properly contains X (and V̂ = 0 by convention).
As an example, the rooted directed tree (arborescence) for V = {1,2,3,4,5} and
T = {{1},{2},{3},{4},{5},{2,3},{1,2,3},{4,5},V} is depicted in Fig. 9.6. We
associate the given function fX with arc aX for X ∈ T . The function ˜ f on T induced
from f = 0 on S by this network coincides with the laminar convex function (6.34),
and its M
-convexity follows from Theorem 9.27.
## 9.6.2 Technical Supplements
Proof of Theorem 9.26
It suﬃces to consider the case of f ∈ M[Z → Z] and g ∈ L[Z → Z].
(1) To prove (M-EXC[Z]) for ˜ f, we ﬁx y1,y2 ∈ dom ˜ f and u ∈ supp+
(y1 −y2)
and look for v ∈ supp−
(y1 − y2) such that58
˜ f(y1) + ˜ f(y2) ≥ ˜ f(y1 − χT
u + χT
v ) + ˜ f(y2 + χT
u − χT
v ) (9.84)
by a reﬁnement of the augmenting path argument used in Note 2.19 for the special
case of S = ∅. We take ξi ∈ ZA
and xi ∈ ZS
for i = 1,2 such that
˜ f(yi) = f(xi) +

a∈A
fa(ξi(a)), ∂ξi = (xi,−yi,0) (i = 1,2). (9.85)
We search for a kind of augmenting path with respect to the pair (ξ1,ξ2) that yields
the desired inequality (9.84). If we are not successful in ﬁnding such a path, we
modify the ﬂow pair to a new pair with smaller 1-distance ||ξ1 − ξ2||1, so that we
can eventually ﬁnd an appropriate augmenting path.
58For w ∈ T, χT
w is the characteristic vector of {w} in ZT .sidca00si
2013/2/12
page 274
## 274 Chapter 9. Network Flows
Before giving a formal proof we explain the idea of the proof in a typical
situation. Consider the diﬀerence in the ﬂows, ξ2 − ξ1 ∈ ZA
, for which we have
∂(ξ2 − ξ1) = (x2 − x1,y1 − y2,0). Since u ∈ supp+
(∂(ξ2 − ξ1)), there exists a
simple path, say, P1, compatible with ξ2 − ξ1 that connects u to some vertex v1
in supp−
(∂(ξ2 − ξ1)) = supp+
(x1 − x2) ∪ supp−
(y1 − y2). This is an augmenting
path with respect to the pair of ﬂows ξ1 and ξ2. Suppose that we have the case of
v1 ∈ supp+
(x1 − x2). By (M-EXC[Z]) for f we obtain u1 ∈ supp−
(x1 − x2) such
that59
f(x1) + f(x2) ≥ f(x1 − χS
v1
+ χS
u1
) + f(x2 + χS
v1
− χS
u1
). (9.86)
Since u1 ∈ supp+
(∂(ξ2 − ξ1)), there exists a simple path, say, P2, compatible with
ξ2 − ξ1 that connects u1 to some v2 ∈ supp−
(∂(ξ2 − ξ1)) = supp+
(x1 − x2) ∪
supp−
(y1 −y2). Suppose further that v2 ∈ supp−
(y1 −y2) and P2 is vertex disjoint
from P1. Putting v = v2 we represent the path P1 ∪ P2 by π : A → {0,±1}
such that supp+
(π) ⊆ supp+
(ξ2 − ξ1), supp−
(π) ⊆ supp−
(ξ2 − ξ1), and ∂π =
(χS
u1
− χS
v1
,χT
u − χT
v ,0). For the augmented ﬂows ξ
1 = ξ1 + π and ξ
2 = ξ2 − π and
the new bases x
1 = x1 − χS
v1
+ χS
u1
and x
2 = x2 + χS
v1
− χS
u1
, we have
∂ξ
1 = (x
1,−(y1 − χT
u + χT
v ),0), ∂ξ
2 = (x
2,−(y2 + χT
u − χT
v ),0) (9.87)
and
fa(ξ1(a)) + fa(ξ2(a)) ≥ fa(ξ
1(a)) + fa(ξ
2(a)) (a ∈ A), (9.88)
since
ξ1(a) < ξ2(a) ⇒ fa(ξ1(a)) + fa(ξ2(a)) ≥ fa(ξ1(a) + 1) + fa(ξ2(a) − 1),
ξ1(a) > ξ2(a) ⇒ fa(ξ1(a)) + fa(ξ2(a)) ≥ fa(ξ1(a) − 1) + fa(ξ2(a) + 1).
By (9.85), (9.86), (9.88), and (9.87), we obtain
˜ f(y1) + ˜ f(y2) = [f(x1) + f(x2)] +

a∈A
[fa(ξ1(a)) + fa(ξ2(a))]
≥ [f(x
1) + f(x
2)] +

a∈A
[fa(ξ
1(a)) + fa(ξ
2(a))]
≥ ˜ f(y1 − χT
u + χT
v ) + ˜ f(y2 + χT
u − χT
v ),
which shows the inequality (9.84). Having presented the rough idea, we are now in
a position to start the proof that works in general.
We shall construct a pair of ﬂows ξ
1 and ξ
2 that satisfy (9.87) for some v ∈
supp−
(y1 − y2) and x
1,x
2 ∈ ZS
, and also
Φ(ξ
1,∂ξ
1) + Φ(ξ
2,∂ξ
2) ≤ Φ(ξ1,∂ξ1) + Φ(ξ2,∂ξ2), (9.89)
where
Φ(ϕ,b) = f(b|S) +

a∈A
fa(ϕ(a)) (ϕ ∈ ZA
,b ∈ ZV
),
59For w ∈ S, χS
w is the characteristic vector of {w} in ZS.sidca00si
2013/2/12
page 275
9.6. Network Duality 275
with b|S denoting the restriction of b to S. To obtain such (ξ
1,ξ
2) we generate a
sequence of tuples (ϕ1,ϕ2,b1,b2,w) with ϕ1,ϕ2 ∈ ZA
, b1,b2 ∈ ZV
, and w ∈ V
such that
ϕi(a) ∈ domfa (a ∈ A,i = 1,2), (9.90)
bi|S ∈ domf, bi|V \(S∪T) = 0 (i = 1,2), (9.91)
b1|T = −(y1 − χT
u ), b2|T = −(y2 + χT
u ), (9.92)
b1 = ∂ϕ1 + χw, b2 = ∂ϕ2 − χw, (9.93)
Φ(ϕ1,b1) + Φ(ϕ2,b2) ≤ Φ(ξ1,∂ξ1) + Φ(ξ2,∂ξ2), (9.94)
where χw ∈ ZV
in (9.93). We call (ϕ1,ϕ2,b1,b2,w) a ﬂow-boundary tuple and w
the frontier vertex. Note that (b1,b2) is determined uniquely from (ϕ1,ϕ2,w) by
(9.93).
We start with (ϕ1,ϕ2,b1,b2,w) = (ξ1,ξ2,∂ξ1+χu,∂ξ2−χu,u), which obviously
satisﬁes (9.90) to (9.94). If the frontier vertex w is in supp−
(y1 − y2), we end
successfully with (ξ
1,ξ
2,v) = (ϕ1,ϕ2,w); note that for w ∈ T we have ∂ϕ1 =
(b1|S,−(y1 − χT
u + χT
w),0) and ∂ϕ2 = (b2|S,−(y2 + χT
u − χT
w),0).
A ﬂow-boundary tuple (ϕ1,ϕ2,b1,b2,w) is updated to another ﬂow-boundary
tuple (ϕ
1,ϕ
2,b
1,b
2,w
) in three ways: (i) ﬂow push, (ii) basis exchange, and (iii) cross-
over. In all three cases, ||ϕ1 −ϕ2||1 ≥ ||ϕ
1 −ϕ
2||1 and the conditions (9.90) to (9.94)
are maintained.
A ﬂow push augments one unit of ﬂow along an arc a∗
incident to the frontier
vertex w. If w = ∂+
a∗
(w is the initial vertex of a∗
) and ϕ1(a∗
) < ϕ2(a∗
), the
ﬂows are updated as ϕ
1(a∗
) = ϕ1(a∗
) + 1, ϕ
2(a∗
) = ϕ2(a∗
) − 1, and the frontier
vertex is changed to w
= ∂−
a∗
, the terminal vertex of a∗
. Symmetrically, if
w = ∂−
a∗
and ϕ1(a∗
) > ϕ2(a∗
), the ﬂows and the frontier vertex are updated as
ϕ
1(a∗
) = ϕ1(a∗
) − 1, ϕ
2(a∗
) = ϕ2(a∗
) + 1, w
= ∂+
a∗
. The boundaries remain
unchanged; b
1 = b1 and b
2 = b2. See (9.88) for the condition (9.94).
A basis exchange applies when w ∈ S and b1(w) > b2(w). By (M-EXC[Z]) for
f there exists w
∈ S such that b1(w
) < b2(w
) and
f(b1|S) + f(b2|S) ≥ f(b1|S − χS
w + χS
w) + f(b2|S + χS
w − χS
w).
The frontier vertex is updated to this w
and the boundaries to b
1 = b1 −χw +χw,
b
2 = b2 + χw − χw. The ﬂows remain the same: ϕ
1 = ϕ1 and ϕ
2 = ϕ2.
A crossover updates (ϕ1,ϕ2,b1,b2,w) with reference to another ﬂow-boundary
tuple (ϕ◦
1,ϕ◦
2,b◦
1,b◦
2,w◦
) with the same frontier vertex w◦
= w. The ﬂow-boundary
tuple is updated to
(ϕ
1,ϕ
2,b
1,b
2,w
) = (ϕ1,ϕ◦
2,b1,b◦
2,w) or (ϕ◦
1,ϕ2,b◦
1,b2,w)
according to whether
Φ(ϕ1,b1) + Φ(ϕ◦
2,b◦
2) ≤ Φ(ϕ◦
1,b◦
1) + Φ(ϕ2,b2)
or not. The condition (9.94) is maintained, since
Φ(ϕ
1,b
1) + Φ(ϕ
2,b
2) ≤
1
2
[Φ(ϕ1,b1) + Φ(ϕ2,b2) + Φ(ϕ◦
1,b◦
1) + Φ(ϕ◦
2,b◦
2)].sidca00si
2013/2/12
page 276
## 276 Chapter 9. Network Flows
Under the additional conditions that
ϕ1 + ϕ2 = ϕ◦
1 + ϕ◦
2, ϕi ∈ [ϕ◦
1 ∧ ϕ◦
2,ϕ◦
1 ∨ ϕ◦
2]Z, ϕi = ϕ◦
i (i = 1,2), (9.95)
we have
||ϕ◦
1 − ϕ◦
2||1 − 1 ≥ ||ϕ
1 − ϕ
2||1. (9.96)
We use crossovers to avoid cycling in generating the ﬂow-boundary tuples.
The generation of ﬂow-boundary tuples consists of stages. Each stage consists
of repeated applications of ﬂow push and base exchange, possibly followed by an ap-
plication of crossover. Denote by (ϕ
(1)
1 ,ϕ
(1)
2 ,b
(1)
1 ,b
(1)
2 ,w(1)
) the ﬂow-boundary tuple
at the beginning of a stage and by (ϕ
(j)
1 ,ϕ
(j)
2 ,b
(j)
1 ,b
(j)
2 ,w(j)
) (j = 2,...,k) the ﬂow-
boundary tuples generated so far in the stage. We end the stage if either (a) w(k)
∈
supp−
(y1 −y2) or (b) w(k)
= u = w(1)
; we are done in case (a), whereas in case (b)
we go on to the next stage. If w(k)
= w(j)
for some j with 1 ≤ j ≤ k − 1, we apply
crossover to (ϕ
(k)
1 ,ϕ
(k)
2 ,b
(k)
1 ,b
(k)
2 ,w(k)
) with reference to (ϕ
(j)
1 ,ϕ
(j)
2 ,b
(j)
1 ,b
(j)
2 ,w(j)
)
to obtain the next ﬂow-boundary tuple (ϕ
(k+1)
1 ,ϕ
(k+1)
2 ,b
(k+1)
1 ,b
(k+1)
2 ,w(k+1)
) and
end this stage to go on to the next stage. Otherwise, we apply ﬂow push or
base exchange, whichever is applicable, to generate the next ﬂow-boundary tuple
(ϕ
(k+1)
1 ,ϕ
(k+1)
2 ,b
(k+1)
1 ,b
(k+1)
2 ,w(k+1)
) in the current stage. We prohibit, however,
applying ﬂow push on an arc a∗
right after a ﬂow push on the same arc a∗
(this
is possible if |ϕ1(a∗
) − ϕ2(a∗
)| = 1). We also prohibit applying a base exchange
with a pair (w,w
) right after a base exchange with (w
,w) (this is possible if
b1(w) = b2(w) + 1 and b1(w
) = b2(w
) − 1).
Thus, a stage terminates if (a) w(k)
∈ supp−
(y1 − y2), (b) w(k)
= u = w(1)
,
or (c) a crossover is applied. In case (a) we have successfully found v = w(k)
for (9.84). In case (b) we have b1 = ∂ϕ1 + χu, b2 = ∂ϕ2 − χu, and w = u for
(ϕ1,ϕ2,b1,b2,w) = (ϕ
(k)
1 ,ϕ
(k)
2 ,b
(k)
1 ,b
(k)
2 ,w(k)
), just as we had for (ϕ1,ϕ2,b1,b2,w) =
(ξ1,ξ2,∂ξ1 +χu,∂ξ2 −χu,u) at the beginning of the generation process. In case (c)
we obtain a closer pair of ﬂows, with which the next stage starts.
The above generation process terminates with a ﬁnite number of ﬂow-boundary
tuples. This is because (i) the frontier vertices in one stage are distinct and hence
the number of ﬂow-boundary tuples generated in one stage is bounded by |V |,
(ii) ||ϕ1 − ϕ2||1 decreases at least by one at a stage ending in case (c) (note that
the conditions in (9.95) are met and (9.96) holds true), and (iii) a stage ending in
case (b) must be preceded by a stage ending in case (c).
We have thus shown how to construct a desired pair of ﬂows (ξ
1,ξ
2) by gener-
ating ﬂow-boundary tuples starting with (ϕ1,ϕ2,b1,b2,w) = (ξ1,ξ2,∂ξ1 +χu,∂ξ2 −
χu,u). This completes the proof of (1).
(2) Put α = g(p + 1) − g(p), which is independent of p by (TRF[Z]). Since
δ(p + 1,q + 1,r + 1) = δ(p,q,r), we have
g̃(q + 1) = inf
η,p,r
(
g(p
) +

a∈A
ga(η(a))
)
)
)
)
)
η = −δ(p
,q + 1,r
)
*
= inf
η,p,r
(
g(p + 1) +

a∈A
ga(η(a))
)
)
)
)
)
η = −δ(p,q,r)
*
= g̃(q) + α,sidca00si
2013/2/12
page 277
9.6. Network Duality 277
which shows (TRF[Z]) for g̃. Suppose that g̃(q) is ﬁnite for q = q1,q2. There exist
(η1,p1,r1) and (η2,p2,r2) such that
g̃(qi) = g(pi) +

a∈A
ga(ηi(a)), ηi = −δ(pi,qi,ri) (i = 1,2).
Here we have
g(p1) + g(p2) ≥ g(p1 ∨ p2) + g(p1 ∧ p2)
by the submodularity (SBF[Z]) of g and
ga(η1(a)) + ga(η2(a)) ≥ ga(η∨(a)) + ga(η∧(a)) (a ∈ A),
with
η∨ = −δ(p1 ∨ p2,q1 ∨ q2,r1 ∨ r2), η∧ = −δ(p1 ∧ p2,q1 ∧ q2,r1 ∧ r2)
by the convexity of ga (see Note 2.20). The submodularity (SBF[Z]) of g̃ then
follows because
g̃(q1) + g̃(q2) ≥ g(p1 ∨ p2) + g(p1 ∧ p2) +

a∈A
[ga(η∨(a)) + ga(η∧(a))]
≥ g̃(q1 ∨ q2) + g̃(q1 ∧ q2).
(3) It follows from ∂ξ = (x,−y,0) and η = −δ(p,q,r) that
η,ξ A = − δ(p,q,r),ξ A = − (p,q,r),∂ξ V = − p,x S + q,y T
(cf. (9.21)), whereas the assumed conjugacy implies
f(x) + g(p) ≥ p,x ,

a∈A
[fa(ξ(a)) + ga(η(a))] ≥ η,ξ .
Therefore, we have
+
f(x) +

a∈A
fa(ξ(a))
,
+
+
g(p) +

a∈A
ga(η(a))
,
≥ q,y ,
from which follows the weak duality
˜ f(y) + g̃(q) ≥ q,y . (9.97)
Fix y with ˜ f(y) ﬁnite. By Theorem 9.16 (4) there exists (p∗
,q∗
,r∗
) such that
˜ f(y) = q∗
,y + inf f[−p∗
] +

a∈A
inf fa[−η∗
(a)]
with η∗
= −δ(p∗
,q∗
,r∗
). This implies
˜ f(y) = q∗
,y − f•
(p∗
) −

a∈A
fa
•
(η∗
(a)) = q∗
,y − g(p∗
) −

a∈A
ga(η∗
(a))
≤ q∗
,y − g̃(q∗
).
Combining this with (9.97) shows g̃ = ˜ f•
.
The proof of Theorem 9.26 is completed. It is mentioned that (1) follows from
(2) and (3) with the aid of the conjugacy theorem (Theorem 8.12).sidca00si
2013/2/12
page 278
## 278 Chapter 9. Network Flows
Proof of Theorem 9.27
Because the functions are real valued, the inﬁma in (9.81) and (9.82) may not be
attained. The proof for Theorem 9.26 can be adapted to this case by introducing
ε > 0 and letting ε → 0 as in Notes 2.19 and 2.20.
Proof of Theorem 9.28
The augmenting ﬂow argument for (1) suﬀers from a technical diﬃculty that the
amount of augmenting ﬂow may possibly converge to zero. To circumvent this
diﬃculty we ﬁrst prove (2) and (3) and then use the conjugacy (Theorem 8.4) to
show (1). See Murota–Shioura [152] for details.
Bibliographical Notes
The minimum cost ﬂow problem treated in section 9.1 is one of the most fundamen-
tal problems in combinatorial optimization. For network ﬂows, Ford–Fulkerson [53]
is the classic, whereas Ahuja–Magnanti–Orlin [1] describes recent algorithmic devel-
opments; see also Cook–Cunningham–Pulleyblank–Schrijver [26], Du–Pardalos [43],
Korte–Vygen [115], Lawler [119], and Nemhauser–Wolsey [167]. Thorough treat-
ments of the network ﬂow problem on the basis of convex analysis can be found in
Iri [94] and Rockafellar [178].
The submodular ﬂow problem was introduced by Edmonds–Giles [46] using
crossing-submodular functions. The present form avoids crossing-submodular func-
tions on the basis of the fact, due to Fujishige [61], that the base polyhedron deﬁned
by a crossing-submodular function can also be described by a submodular function.
See Fujishige [65] for other equivalent neoﬂow problems, such as the independent
ﬂow (Fujishige [59]) and the polymatroidal ﬂow (Hassin [87], Lawler–Martel [120],
[121]). The M-convex submodular ﬂow problem was introduced by Murota [142].
Section 9.3 is a collection of standard results on the submodular ﬂow problem.
Theorems 9.10 and 9.13 are taken from Fujishige [65] (Theorems 5.1 and 5.11,
respectively), where the former is ascribed to Frank [56].
The optimality criterion by potentials for the M-convex submodular ﬂow prob-
lem was established by Murota [142] for the integer-ﬂow version (Theorem 9.16) and
adapted to the real-valued case (Theorem 9.14) with the integrality assertion (The-
orem 9.15) in Iwata–Shigeno [105] and Murota [147].
The optimality criterion by negative cycles (Theorem 9.20) was established
by Murota [140], [142] for the integer-ﬂow version and adapted to the real-valued
case (Theorem 9.18) in Murota–Shioura [152]. Theorem 9.22 is in [140], [142].
Proposition 9.23 is a reformulation of the unique-max lemma due to Murota [135].
Proposition 9.25 is also from [135]; the proof technique using (9.80) originated in
Fujishige [59].
Transformationby networks was found ﬁrst for M-convex functions f ∈ M[Z →
R] by Murota [137]; the proof given in section 9.6.2 is due to Shioura [188], [189].
Transformation of L-convex functions is stated explicitly in Murota [145]. The ex-
tension to polyhedral M-convex and L-convex functions is made in Murota–Shiourasidca00si
2013/2/12
page 279
9.6. Network Duality 279
[152]. Theorems 9.26, 9.27, and 9.28 are explicit in Murota [147]. Induction of ma-
troids through graphs is due to Perfect [171] (for bipartite graphs) and Brualdi [21];
see also Schrijver [183], Welsh [211], and White [213]. The alternative proof of the
M
-convexity of a laminar convex function described in Note 9.31 is communicated
by A. Shioura.sidca00si
2013/2/12
page 281
Chapter 10
Algorithms
Algorithmic aspects of M-convex and L-convex functions are discussed in this chap-
ter. Three fundamental optimization problems tractable by eﬃcient algorithms are
(i) M-convex function minimization, which is a nonlinear extension of the minimum-
weight base problem for matroids; (ii) L-convex function minimization, which in-
cludes submodular set function minimization as a special case; and (iii) minimiza-
tion/maximization in the Fenchel-type min-max duality, which is equivalent to the
M-convex submodular ﬂow problem.
## 10.1 Minimization of M-Convex Functions
Four kinds of algorithms for M-convex function minimization are described: the
steepest descent algorithm, the steepest descent scaling algorithm, the domain re-
duction algorithm, and the domain reduction scaling algorithm. Throughout this
section we assume that f : ZV
→ R∪{+∞} is an M-convex function, n = |V |, and
F is an upper bound on the time to evaluate f.
## 10.1.1 Steepest Descent Algorithm
The local characterization of global minimality for M-convex functions (Theorem
6.26) immediately suggests the following algorithm of steepest descent type.
Steepest descent algorithm for an M-convex function f ∈ M[Z → R]
S0: Find a vector x ∈ domf.
S1: Find u,v ∈ V (u = v) that minimize f(x − χu + χv).
S2: If f(x) ≤ f(x − χu + χv), then stop (x is a minimizer of f).
S3: Set x := x − χu + χv and go to S1.
Step S1 can be done with n2
evaluations of function f. At the termination of
the algorithm in step S2, x is a global minimizer by Theorem 6.26 (M-optimality
criterion). The function value f decreases monotonically with iterations. This
281sidca00si
2013/2/12
page 282
## 282 Chapter 10. Algorithms
property alone does not ensure ﬁnite termination in general, although it does if f
is integer valued and bounded from below.
Let us derive an upper bound on the number of iterations by considering the
distance to the optimal solution rather than the function value.
Proposition 10.1. If f has a unique minimizer, say, x∗
, the number of iterations
in the steepest descent algorithm is bounded by ||x◦
−x∗
||1/2, where x◦
denotes the
initial vector found in step S0.
Proof. Put x
= x − χu + χv in step S2. By Theorem 6.28 (M-minimizer cut),
we have x∗
(u) ≤ x(u) − 1 = x
(u) and x∗
(v) ≥ x(v) + 1 = x
(v), which implies
||x
− x∗
||1 = ||x − x∗
||1 − 2. Note that ||x◦
− x∗
||1 is an even integer.
When given an M-convex function f, which may have multiple minimizers, we
consider a perturbation of f so that we can use Proposition 10.1. Assume now that
the eﬀective domain is bounded and denote its 1-size by
K1 = max{||x − y||1 | x,y ∈ domf}. (10.1)
We arbitrarily ﬁx a bijection ϕ : V → {1,2,...,n} to represent an ordering of the
elements of V , put vi = ϕ−1
(i) for i = 1,...,n, and deﬁne a vector p ∈ RV
by
p(vi) = εi
for i = 1,...,n, where ε > 0. The function fε = f[p] is M-convex by
Theorem 6.13 (3) and, for a suﬃciently small ε, it has a unique minimizer that is
also a minimizer of f. Suppose that the steepest descent algorithm is applied to the
perturbed function fε. Since fε(x − χu + χv) = f(x − χu + χv) +
n
i=1 εi
x(vi) −
εϕ(u)
+ εϕ(v)
, this amounts to employing a tie-breaking rule:
take (u,v) that lexicographically minimizes Φ(u,v), (10.2)
where
Φ(u,v) =

(−1,ϕ(u),−ϕ(v)) if ϕ(u) < ϕ(v),
(+1,−ϕ(v),ϕ(u)) if ϕ(u) > ϕ(v),
in the case of multiple candidates in step S1 of the steepest descent algorithm
applied to f.
With this tie-breaking rule we have the following complexity bound.
Proposition 10.2. For an M-convex function f with ﬁnite K1 in (10.1), the
number of iterations in the steepest descent algorithm with tie-breaking rule (10.2)
is bounded by K1/2. Hence, if a vector in domf is given, the algorithm ﬁnds a
minimizer of f in O(F · n2
K1) time.
By Theorem 6.76 (quasi M-optimality criterion) and Theorem 6.77 (quasi M-
minimizer cut), the steepest descent algorithm can also be used for minimizing quasi
M-convex functions satisfying (SSQM=
).
Note 10.3. For integrally convex functions we have the local optimality criterion
for global optimality (Theorem 3.21). This naturally suggests the following.sidca00si
2013/2/12
page 283
10.1. Minimization of M-Convex Functions 283
Steepest descent algorithm for an integrally convex function f
S0: Find a vector x ∈ domf.
S1: Find disjoint Y,Z ⊆ V that minimize f(x − χY + χZ).
S2: If f(x) ≤ f(x − χY + χZ), then stop (x is a minimizer of f).
S3: Set x := x − χY + χZ and go to S1.
The steepest descent algorithm for M-convex functions is a special case of this. It is
emphasized that no eﬃcient algorithm for step S1 is available for general integrally
convex functions.
## 10.1.2 Steepest Descent Scaling Algorithm
Scaling is one of the fundamental general techniques in designing eﬃcient algo-
rithms. The proximity theorem for M-convex functions leads us to the following
steepest descent scaling algorithm for M-convex function minimization. We assume
that the eﬀective domain is bounded and denote its ∞-size by
K∞ = max{||x − y||∞ | x,y ∈ domf}. (10.3)
Steepest descent scaling algorithm for an M-convex function
f ∈ M[Z → R]
S0: Find a vector x ∈ domf, and set α := 2log2(K∞/4n)
, B := domf.
S1: Find an integer vector y that locally minimizes
˜ f(y) =

f(x + αy) (x + αy ∈ B),
+∞ (x + αy / ∈ B)
in the sense of ˜ f(y) ≤ ˜ f(y − χu + χv) (∀u,v ∈ V ) by the steepest descent
algorithm of section 10.1.1 with initial vector 0 and set x := x + αy.
S2: If α = 1, then stop (x is a minimizer of f).
S3: Set B := B ∩ {y ∈ ZV
| ||y − x||∞ ≤ (n − 1)(α − 1)} and α := α/2 and go
to S1.
By the M-proximity theorem (Theorem 6.37 (1)), the set B always contains a global
minimizer of f and, at the termination of the algorithm in step S2, x is a global
minimizer by the M-optimality criterion (Theorem 6.26 (1)). The number of itera-
tions is bounded by log2(K∞/4n) . Some remarks are in order concerning step S1.
If the function f is such that the scaled function ˜ f remains M-convex, step S1 can
be done in O(F · n4
) time by the steepest descent algorithm with tie-breaking rule
(10.2). This time bound follows from Proposition 10.2 with K1 ≤ 4n2
. For a general
f, however, ˜ f is not necessarily M-convex (see Note 6.18) and no polynomial bound
for step S1 is guaranteed, although we have an obvious exponential time bound
O(F · (4n)n
n2
).
On the basis of Theorem 6.76 (quasi M-optimality criterion) and Theorem
6.78 (quasi M-proximity theorem), the steepest descent scaling algorithm can be
adapted to the minimization of quasi M-convex functions satisfying (SSQM=
).sidca00si
2013/2/12
page 284
## 284 Chapter 10. Algorithms
## 10.1.3 Domain Reduction Algorithm
The domain reduction algorithm is a kind of bisection method that searches for the
minimum of an M-convex function by generating a sequence of nested subsets of
the domain on the basis of the M-minimizer cut theorem (Theorem 6.28). For an
M-convex function with bounded eﬀective domain, the algorithm ﬁnds a minimizer
in time polynomial in n and log2 K∞, where K∞ is deﬁned by (10.3).
We introduce the following notations for a bounded nonempty set B ⊆ ZV
:
B(v) = min
y∈B
y(v), uB(v) = max
y∈B
y(v) (v ∈ V ),
◦
B =

1 −
1
n

B +
1
n
uB

, u◦
B =

1
n
B +

1 −
1
n

uB

,
B◦
= {y ∈ B | ◦
B ≤ y ≤ u◦
B}.
The set B◦
is intended to represent the central part of B, i.e., the set of vectors of
B lying away from the boundary. The set B◦
is nonempty if B is M-convex; see
Proposition 10.6 below.
Domain reduction algorithm for an M-convex function f ∈ M[Z → R]
S0: Set B := domf.
S1: Find a vector x ∈ B◦
.
S2: Find u,v ∈ V (u = v) that minimize f(x − χu + χv).
S3: If f(x) ≤ f(x − χu + χv), then stop (x is a minimizer of f).
S4: Set B := B ∩ {y ∈ ZV
| y(u) ≤ x(u) − 1,y(v) ≥ x(v) + 1} and go to S1.
The vector x ∈ B◦
in step S1 can be found with O(n2
log2 K∞) evaluations of f
by the procedure to be described below. The set B forms a decreasing sequence
of M-convex sets, which contain a minimizer of f because of the M-minimizer cut
theorem (Theorem 6.28). Since x is taken from the central part of B, uB(w)−B(w)
for w ∈ {u,v} decreases with a factor of (1− 1
n) and hence the number of iterations
is bounded by O(n2
log2 K∞). The above algorithm, therefore, ﬁnds a minimizer of
f with O(n4
(log2 K∞)2
) evaluations of f provided that it is given a vector in domf.
Proposition 10.4. If a vector in domf is given, the domain reduction algorithm
ﬁnds a minimizer of an M-convex function f in O(F · n4
(log2 K∞)2
) time.
It remains to show how to ﬁnd x ∈ B◦
in step S1 when given a vector of
B. For a vector y of an M-convex set B and two distinct elements u,v of V , the
exchange capacity is deﬁned by
cB(y,v,u) = max{α ∈ Z | y + α(χv − χu) ∈ B}, (10.4)
which is a nonnegative integer representing the distance from y to the boundary of
B in the direction of χv − χu. In the domain reduction algorithm, B is always an
M-convex set and the exchange capacity can be computed by a binary search with
log2 K∞ evaluations of f. For x ∈ B we deﬁne
V ◦
(x) = {v ∈ V | ◦
B(v) ≤ x(v) ≤ u◦
B(v)}sidca00si
2013/2/12
page 285
10.1. Minimization of M-Convex Functions 285
with an obvious observation that V ◦
(x) = V if and only if x ∈ B◦
.
If V ◦
(x) = V , we can modify x to x
∈ B with the property |V ◦
(x
)| ≥
|V ◦
(x)| + 1 as follows. Take any u ∈ V \ V ◦
(x) and assume x(u) > u◦
B(u);
the other case with x(u) < ◦
B(u) can be treated in a similar manner. Putting
{v1,v2,...,vn−1} = V \ {u} and x0 = x, we deﬁne a sequence x1,x2,...,xn−1 by
xi = xi−1 + αi(χvi − χu) with
αi =
⎧
⎨
⎩
0 if u◦
B(vi) ≤ xi−1(vi),
min[cB(xi−1,vi,u), xi−1(u) − u◦
B(u),
u◦
B(vi) − xi−1(vi)] otherwise
for i = 1,2,...,n − 1 and put x
= xn−1.
Proposition 10.5. V ◦
(x
) ⊇ V ◦
(x) ∪ {u}.
Proof. The inclusion V ◦
(x
) ⊇ V ◦
(x) is obvious. To prove x
(u) = u◦
B(u) by
contradiction, suppose x
(u) > u◦
B(u) and take x∗
∈ B◦
, where B◦
= ∅ by Propo-
sition 10.6 below. Since u ∈ supp+
(x
− x∗
), it follows from (M-EXC[Z]) that
x
≡ x
+ χvi − χu ∈ B and x
(vi) < x∗
(vi) ≤ u◦
B(vi) for some vi. Since vi ∈
supp+
(x
−xi) and supp−
(x
−xi) = {u}, (M-EXC[Z]) implies xi +χvi −χu ∈ B.
But this contradicts the deﬁnition of xi.
The modiﬁcation of x to x
described above can be done with n evaluations
of the exchange capacity. Repeating such modiﬁcations at most n times we arrive
at x with V ◦
(x) = V . Thus, given a vector in B, we can ﬁnd x ∈ B◦
with at most
n2
evaluations of the exchange capacity.
We ﬁnally prove the nonemptiness of B◦
.
Proposition 10.6. B◦
= ∅ if B is an M-convex set.
Proof. Let ρ ∈ S[Z] be the submodular function satisfying B = B(ρ) ∩ ZV
and ρ̂
be its Lovász extension. Then we have B(v) = ρ(V )−ρ(V \{v}) and uB(v) = ρ(v).
We can assert the nonemptiness of B◦
by establishing
(i) ◦
B(X) ≤ ρ(X) (X ⊆ V ), (ii) u◦
B(X) ≥ ρ(V ) − ρ(V \ X) (X ⊆ V )
(see Theorem 3.8 in Fujishige [65]). We prove (i) here; a similar argument works for
(ii). Fix X ⊆ V and put p = χX, pv = 1−χv (v ∈ X), and k = |X|. It follows from
k1 = p +

v∈X
pv, χv = p +

u∈X\{v}
pu − (k − 1)1 (v ∈ X)
that kρ(V ) = ρ̂(k1) = ρ̂(p + v∈X pv) and
ρ(v) = ρ̂(χv) = ρ̂
⎛
⎝p +

u∈X\{v}
pu − (k − 1)1
⎞
⎠ = ρ̂
⎛
⎝p +

u∈X\{v}
pu
⎞
⎠−(k−1)ρ(V ).sidca00si
2013/2/12
page 286
## 286 Chapter 10. Algorithms
With these identities we see

1 −
1
n

B(X) +
1
n
uB(X) ≤ ρ(X)
⇔ (n − 1)kρ(V ) +

v∈X
ρ(v) ≤ nρ(X) + (n − 1)

v∈X
ρ(V \ {v})
⇔ (n − k)ρ̂
8
p +

v∈X
pv
9
+

v∈X
ρ̂
⎛
⎝p +

u∈X\{v}
pu
⎞
⎠ ≤ nρ̂(p) + (n − 1)

v∈X
ρ̂(pv).
The last inequality holds true since
ρ̂
8
p +

v∈X
pv
9
≤ ρ̂(p) +

v∈X
ρ̂(pv), ρ̂
⎛
⎝p +

u∈X\{v}
pu
⎞
⎠ ≤ ρ̂(p) +

u∈X\{v}
ρ̂(pu)
by the positive homogeneity and convexity of ρ̂. Hence follows ◦
B(X) ≤ ρ(X).
By Theorem 6.77 (quasi M-minimizer cut), the domain reduction algorithm
can also be used for minimizing quasi M-convex functions satisfying (SSQM=
) pro-
vided that the eﬀective domain is a bounded M-convex set.
## 10.1.4 Domain Reduction Scaling Algorithm
We present here the domain reduction scaling algorithm for M-convex function min-
imization, a combination of the idea of the domain reduction algorithm of sec-
tion 10.1.3 with a scaling technique based on the theorem of M-minimizer cut with
scaling (Theorem 6.39).
The algorithm works with a pair (x,) of integer vectors, where x is the current
solution and  is a lower bound for an optimal solution. Speciﬁcally, two conditions
x ∈ S() ∩ domf, S() ∩ argminf = ∅ (10.5)
are maintained, where
S() = {y ∈ ZV
| y ≥ }.
The algorithm consists of scaling phases parametrized (or labeled) by a nonnegative
integer α, called the scaling factor, which is initially set to be suﬃciently large and
is decreased until it reaches unity. In each scaling phase with a ﬁxed α, the pair
(x,) is modiﬁed so that it satisﬁes an additional condition
 ≤ x ≤  + (n − 1)(α − 1)1. (10.6)
At the end of the algorithm we have α = 1 and hence x =  by (10.6). This means
S() ∩ domf = {x}, since x(V ) = y(V ) for any y ∈ domf by Proposition 6.1 and
since x(V ) < y(V ) for any y ∈ S() distinct from x. Furthermore, we see from the
second condition in (10.5) that x is a minimizer of f, since {x} = S() ∩ domf ⊇
S() ∩ argminf = ∅.
The outline of the algorithm reads as follows, where step S1 for the α-scaling
phase is described later and K∞ is deﬁned in (10.3).sidca00si
2013/2/12
page 287
10.1. Minimization of M-Convex Functions 287
Domain reduction scaling algorithm for an M-convex function
f ∈ M[Z → R]
S0: Find a vector x ∈ domf and set  := x − K∞1, α := 2log2(K∞/2n)
.
S1: Modify (x,) to meet (10.6) (α-scaling phase).
S2: If α = 1, then stop (x is a minimizer of f).
S3: Set α := α/2 and go to S1.
The α-scaling phase is now described. In view of (10.6) we employ a subset
V •
of V such that
x(w) ≤ (w) + (n − 1)(α − 1) (∀w ∈ V \ V •
). (10.7)
Initially, V •
is set to V and then decreases monotonically to the empty set.
α-scaling phase for (x,,α)
S0: Set V •
:= V .
S1: If V •
= ∅, then output (x,) and stop.
S2: Take any u ∈ V •
.
S3: Find v ∈ V that minimizes f(x + α(χv − χu)).
S4: If v = u or x(u) − α < (u), then set (u) := max[(u),x(u) − (n − 1)(α − 1)]
and V •
:= V •
\ {u} and go to S1.
S5: Otherwise, set (v) := max[(v),x(v)+α−(n−1)(α−1)], x := x+α(χv −χu)
and V •
:= V •
\ {v} and go to S1.
As is easily seen, the ﬁrst condition in (10.5) is maintained in steps S4 and S5.
The second condition in (10.5) is also maintained by virtue of Theorem 6.39 (M-
minimizer cut with scaling). The subset V •
is nonincreasing, although it may be
that v / ∈ V •
in step S5, and then the operation V •
:= V •
\ {v} is void and V •
remains unchanged. Denote the initial value of (x,) by (x◦
,◦
). For each w ∈ V
the value of x(w) is decreased at most (x◦
(w) − ◦
(w))/α times before it is deleted
from V •
. Hence, the number of iterations in the α-scaling phase is bounded by
||x◦
− ◦
||1/α. In particular, the α-scaling phase terminates with V •
= ∅.
The time complexity of the domain reduction scaling algorithm is given as
follows, where it is assumed for simplicity that K∞ is known.
Proposition 10.7. If a vector in domf is given, the domain reduction scaling
algorithm ﬁnds a minimizer of an M-convex function f in O(F · n3
log2(K∞/n))
time.
Proof. At the beginning of the α-scaling phase we have ||x◦
−◦
||1 ≤ n(n−1)(2α−1)
by (10.6). Since step S3 in the α-scaling phase can be done with n evaluations of
f, the α-scaling phase terminates in O(F · n3
) time. The number of scaling phases
is equal to log2(K∞/2n) .
On the basis of Theorem 6.79 (quasi M-minimizer cut with scaling), the do-
main reduction scaling algorithm can be adapted to the minimization of quasi
M-convex functions satisfying (SSQM=
) provided that the eﬀective domain is a
bounded M-convex set.sidca00si
2013/2/12
page 288
## 288 Chapter 10. Algorithms
## 10.2 Minimization of Submodular Set Functions
The minimization of submodular set functions is one of the most fundamental prob-
lems in combinatorial optimization. In this section we deal with algorithms for
minimizing submodular set functions, which we will use as an essential component
in algorithms for L-convex functions.
## 10.2.1 Basic Framework
Let ρ : 2V
→ R be a submodular set function,60
where ρ(∅) = 0 and n = |V |. In
discussing the eﬃciency or complexity of algorithms it is customary to categorize
them into ﬁnite, pseudopolynomial, weakly polynomial and strongly polynomial
algorithms. For our problem of minimizing ρ, a ﬁnite algorithm is trivial; we may
evaluate ρ(X) for all subsets X to ﬁnd the minimum. This takes O(F · 2n
) time,
where F is an upper bound on the time to evaluate ρ. The complexity of an
algorithm may depend on the complexity or size of ρ; if ρ is integer valued,
M = max
X⊆V
|ρ(X)| (10.8)
often serves as a measure of the size of ρ. An algorithm for minimizing ρ is said to be
(i) pseudopolynomial, (ii) weakly polynomial, or (iii) strongly polynomial, according
as the total number of evaluations of ρ as well as other arithmetic operations in-
volved is bounded by a polynomial in (i) n and M, (ii) n and log2 M, or (iii) n alone.
Our objective in this section is to describe two strongly polynomial algorithms for
minimizing ρ.
Let
B(ρ) = {x ∈ RV
| x(X) ≤ ρ(X) (∀X ⊂ V ),x(V ) = ρ(V )} (10.9)
be the base polyhedron associated with ρ. Recall that a point in B(ρ) is called a
base and an extreme point of B(ρ) is an extreme base. For any base x and any
subset X we obviously have
x−
(V ) ≤ x(X) ≤ ρ(X), (10.10)
where x−
is the vector in RV
deﬁned by x−
(v) = min(0,x(v)) for v ∈ V . The
inequalities are tight for some x and X, as follows.
Proposition 10.8. For a submodular set function ρ : 2V
→ R, we have
max{x−
(V ) | x ∈ B(ρ)} = min{ρ(X) | X ⊆ V }. (10.11)
If ρ is integer valued, the maximizer x can be chosen to be an integer vector.
Proof. Although this is an easy consequence of Edmonds’s intersection theorem
(Theorem 4.18) with ρ1 = ρ and ρ2 = 0, a direct proof is given here. Let x be a
60Note that we assume ρ to be ﬁnite valued for all subsets. An adaptation to the general case
ρ : 2V → R ∪ {+∞} is explained in Note 10.14.sidca00si
2013/2/12
page 289
10.2. Minimization of Submodular Set Functions 289
maximizer on the left-hand side. For any u ∈ supp−
(x) and v ∈ supp+
(x), there
exists a subset Xuv such that u ∈ Xuv ⊆ V \ {v} and x(Xuv) = ρ(Xuv). Put
X =
5
u∈supp−(x)
4
v∈supp+(x) Xuv. We have x(X) = ρ(X) by (4.23) and x−
(V ) =
x(X) since supp−
(x) ⊆ X and supp+
(x) ⊆ V \X. The integrality assertion can be
established by the same argument starting with an integral base x that maximizes
x−
(V ) over all integral bases.
The min-max relation (10.11) shows that we can demonstrate the optimality
of a subset X by ﬁnding a base x with x−
(V ) = ρ(X). But how can we verify that
a vector x belongs to B(ρ)? By deﬁnition, x ∈ B(ρ) if and only if minX(ρ(X) −
x(X)) = ρ(V ) − x(V ) = 0. Thus, testing for membership in B(ρ) for an arbitrary
x seems to need a submodular function minimization procedure.
To circumvent this diﬃculty, we recall from Note 4.10 that we can generate an
extreme base by the greedy algorithm. Let L = (v1,v2,...,vn) be a linear ordering
of V and deﬁne L(vj) = {v1,v2,...,vj} for j = 1,...,n. Then the extreme base y
associated with L is given by
y(v) = ρ(L(v)) − ρ(L(v) \ {v}) (v ∈ V ). (10.12)
Any base x can be represented as a convex combination of a number of extreme
bases, say, {yi | i ∈ I}, as
x =

i∈I
λiyi
8
with

i∈I
λi = 1,λi > 0 (i ∈ I)
9
, (10.13)
where we may assume |I| ≤ n by the Carathéodory theorem. Combining (10.12)
and (10.13) shows that any base can be represented by a list of linear orderings
{Li | i ∈ I} (that generate {yi | i ∈ I}) and coeﬃcients of the convex combination
{λi | i ∈ I}. With this representation of x we can be sure that x is a member of
B(ρ). For u,v ∈ V and i ∈ I we use the notation
u ≺i v ⇐⇒ u precedes v in Li, (10.14)
(u,v]≺i = {w | u ≺i w (i v}, (10.15)
where w (i v means w ≺i v or w = v.
The following proposition gives a suﬃcient condition for optimality in terms
of the linear orderings {Li | i ∈ I}.
Proposition 10.9. Let x be a base represented as (10.13) with {(Li,λi) | i ∈ I}
and W be a subset of V .
(1) If supp−
(x) ⊆ W and supp+
(x) ⊆ V \ W, then x−
(V ) = x(W).
(2) If u ≺i v for every u ∈ W, v ∈ V \ W, and i ∈ I, then x(W) = ρ(W).
(3) If the conditions in (1) and (2) are satisﬁed, x and W are optimal in
(10.11).
Proof. (1) is obvious. By (10.12) the condition in (2) implies ρ(W) = yi(W) for
every i ∈ I. Then x(W) = i∈I λiyi(W) = ρ(W). (3) follows from (1), (2), and
(10.10).sidca00si
2013/2/12
page 290
## 290 Chapter 10. Algorithms
We are thus led to a basic algorithmic framework:
1. We maintain (and update) a number of linear orderings {Li | i ∈ I}, together
with the associated extreme bases {yi | i ∈ I} and the coeﬃcients of convex
combination {λi | i ∈ I}, to represent a base x.
2. We terminate when the conditions in Proposition 10.9 are satisﬁed.
Two strongly polynomial algorithms using this framework are described in subse-
quent sections.
Note 10.10. Here is a brief historical account of submodular function minimiza-
tion. Its importance seems to have been recognized around 1970 by J. Edmonds [44]
and others. The ﬁrst polynomial algorithm was given by M. Grötschel, L. Lovász,
and A. Schrijver—weakly polynomial in 1981 [82], and strongly polynomial in 1988
[83]. These algorithms, however, are based on the ellipsoid method and, as such, are
not so much combinatorial as geometric. Eﬀorts for a combinatorial polynomial al-
gorithm have been continued with major contributions made by W. H. Cunningham
and others [15], [28], [29], who showed the basic framework above as well as a com-
binatorial pseudopolynomial algorithm for submodular function minimization. In
1994, extending the min-cut algorithm of Nagamochi–Ibaraki [163], M. Queyranne
[172] came up with a combinatorial algorithm for symmetric submodular function
minimization, which is to minimize over nonempty proper subsets a submodular
function ρ such that ρ(X) = ρ(V \X) for all X ⊆ V . Combinatorial strongly poly-
nomial algorithms for general submodular functions were found, independently, in
the summer of 1999 by two groups, S. Iwata, L. Fleischer, and S. Fujishige [101],
[102] and A. Schrijver [182]. Both of these follow Cunningham’s framework, but
they are signiﬁcantly distinct in technical aspects. Subsequently, a new problem was
recognized by Schrijver. These two algorithms are certainly combinatorial, but they
rely on arithmetic operations (division, in particular) in computing the coeﬃcients
of convex combination in (10.13). The question posed by Schrijver is as follows: Is
it possible to design a fully combinatorial strongly polynomial algorithm that is free
from division and relies only on addition, subtraction, and comparison? This was
answered in the aﬃrmative by Iwata [99] in the fall of 2000.
Note 10.11. Because the minimizers form a ring family (see Note 4.8), there exists
a unique minimal minimizer as well as a unique maximal minimizer of a submodular
set function ρ : 2V
→ R. Given an optimal base x with the representation x =
i∈I λiyi in (10.13), we can compute the minimal and maximal minimizers in
strongly polynomial time as follows.
With the notation D(x) for the family of tight sets at x, introduced in (4.22)
of Note 4.9, we have a representation
argminρ = {X ∈ D(x) | supp−
(x) ⊆ X ⊆ V \ supp+
(x)} (10.16)
for the family of the minimizers of ρ. Noting that D(x) is a ring family, let Gx =
(V,Ax) be the directed graph associated with D(x), as deﬁned by (4.20) in Notesidca00si
2013/2/12
page 291
10.2. Minimization of Submodular Set Functions 291
4.7. This is equivalent to saying that (u,v) ∈ Ax if and only if v ∈ dep(x,u), where
dep(x,u) means the smallest tight set at x that contains u. Then the minimal
minimizer can be identiﬁed as the set of vertices reachable from supp−
(x) in Gx
and the maximal minimizer as the complement of the set of vertices reachable to
supp+
(x) in Gx. Moreover, the graph Gx enables us to enumerate all the minimizers.
By (10.13) we have
D(x) =
2
i∈I
D(yi), Ax =
:
i∈I
Ayi .
Since each yi is an extreme base, we can easily compute dep(yi,u). For each u ∈ V ,
we start with D := V and update D to D \ {v} as long as D \ {v} ∈ D(yi)
for some v ∈ D \ {u}; we obtain D = dep(yi,u) at the termination. We can thus
compute dep(yi,u) with O(n2
) evaluations of ρ. The number of function evaluations
can be reduced to O(n) if a linear ordering Li = (v1,v2,...,vn) generating yi
is also available; assuming u = vk, start with D = {v1,v2,...,vk−1} and, for
j = k − 1,k − 2,...,1, update D to D \ {vj} if D \ {vj} ∈ D(yi). Therefore, the
graph Gx can be constructed with O(n3
|I|) or O(n2
|I|) evaluations of function ρ,
where it is reasonable to assume |I| ≤ n.
Note 10.12. The minimal minimizer of a submodular set function ρ : 2V
→ R
can also be computed using any submodular function minimization algorithm n+1
times. Let X be a minimizer of ρ. For each v ∈ X, compute a minimizer Yv of a
submodular set function ρv : 2X\{v}
→ R, the restriction of ρ to X \ {v}, deﬁned
by ρv(Y ) = ρ(Y ) for Y ⊆ X \ {v}. Then the minimal minimizer of ρ is given
by {v ∈ X | ρ(Yv) > ρ(X)}, since ρ(Yv) > ρ(X) if v is contained in the minimal
minimizer and ρ(Yv) = ρ(X) if not. The maximal minimizer can be computed
similarly.
Note 10.13. An alternative way to ﬁnd the minimal minimizer of a submodular
set function ρ : 2V
→ R is to introduce a penalty term to represent the size of a
subset and to minimize a modiﬁed submodular set function ρ̃(X) = ρ(X) + ε|X|
with a suﬃciently small positive parameter ε. If ρ is integer valued, ε = 1/(n + 1)
is a valid choice. The maximal minimizer can be computed similarly.
Note 10.14. It has been assumed that the submodular function ρ is ﬁnite valued for
all subsets. This assumption is not restrictive but for convenience of description. Let
ρ ∈ S[R] be a submodular set function on V taking values in R∪{+∞}; D = domρ
is a ring family with {∅,V } ⊆ D. For v ∈ V we denote by Mv the smallest member
of D containing v and by Nv the largest member of D not containing v. For X ⊆ V
we denote by X the smallest member of D including X. We assume that we can
compute Mv for each v ∈ V eﬃciently, say, in time polynomial in n. Then we can
compute X and Nv by
X =
:
v∈X
Mv, Nv =
:
u:v/ ∈Mu
Mu.sidca00si
2013/2/12
page 292
## 292 Chapter 10. Algorithms
Let us assume, without loss of generality, that the length of a maximal chain of D
is equal to n = |V |. Consider now a set function ρ : 2V
→ R deﬁned by
ρ(X) = ρ(X) + c(X) − c(X) (X ⊆ V ),
with c ∈ RV
given by
c(v) = max(0,ρ(Nv) − ρ(Nv ∪ {v})) (v ∈ V ).
As is shown below, (i) ρ is a ﬁnite-valued submodular function and (ii) X ∈ argminρ
implies X ∈ argminρ. Thus we can minimize ρ via the minimization of ρ.
Proof of (i): ρ is obviously ﬁnite valued. If X ∈ D, v / ∈ X, and Y = X ∪{v} ∈
D, we have Y ∪ Nv = Nv ∪ {v} and Y ∩ Nv = X and, therefore,
ρ(X) = ρ(Y ∩ Nv) ≤ ρ(Y ) + ρ(Nv) − ρ(Y ∪ Nv) ≤ ρ(Y ) + c(v).
This means that μ(X) = ρ(X)+c(X) is nondecreasing on D. Putting μ(X) = μ(X)
for X ⊆ V and noting X ∪ Y = X ∪ Y and X ∩ Y ⊇ X ∩ Y , we see
μ(X) + μ(Y ) = μ(X) + μ(Y ) ≥ μ(X ∪ Y ) + μ(X ∩ Y )
≥ μ(X ∪ Y ) + μ(X ∩ Y ) = μ(X ∪ Y ) + μ(X ∩ Y ),
which shows the submodularity of μ and hence that of ρ.
Proof of (ii): For any Y ∈ D we have ρ(X) ≤ ρ(X) + c(X) − c(X) = ρ(X) ≤
ρ(Y ) = ρ(Y ).
Note 10.15. The method in Note 10.14 can be used to minimize a submodular
function deﬁned on a (ﬁnite) distributive lattice. By a lattice we mean a tuple
(S,∨,∧) of a nonempty set S and two binary operations ∨ and ∧ on S such that
a ∨ a = a, a ∧ a = a; a ∨ b = b ∨ a, a ∧ b = b ∧ a;
a ∨ (b ∨ c) = (a ∨ b) ∨ c, a ∧ (b ∧ c) = (a ∧ b) ∧ c;
a ∧ (a ∨ b) = a, a ∨ (a ∧ b) = a
for any a,b,c ∈ S. A lattice (S,∨,∧) is a distributive lattice if, in addition, the
distributive law
a ∧ (b ∨ c) = (a ∧ b) ∨ (a ∧ c), a ∨ (b ∧ c) = (a ∨ b) ∧ (a ∨ c)
holds true. A ring family D is a typical distributive lattice, where (S,∨,∧) =
(D,∪,∩). The converse is essentially true: any distributive lattice (S,∨,∧) can be
represented in the form of a ring family (Birkhoﬀ’s representation theorem). The
size of the underlying set of the ring family is equal to the length of a maximal
chain of S. A function ρ : S → R deﬁned on a distributive lattice (S,∨,∧) is said
to be submodular if it satisﬁes
ρ(a) + ρ(b) ≥ ρ(a ∨ b) + ρ(a ∧ b) (a,b ∈ S).sidca00si
2013/2/12
page 293
10.2. Minimization of Submodular Set Functions 293
Thus, with an appropriate representation of (S,∨,∧), a submodular function ρ on
S can be minimized by using the method in Note 10.14.
Note 10.16. Maximizing a submodular set function is a diﬃcult task in general.
It is known that no polynomial algorithm exists for it (and this statement is inde-
pendent of the P = NP conjecture); see Jensen–Korte [106] and Lovász [122], [123].
In this context, M
-concave functions on {0,1}-vectors form a tractable subclass of
submodular set functions. Recall that an M
-concave function is submodular (The-
orem 6.19) and that it can be maximized eﬃciently by algorithms in section 10.1.
## 10.2.2 Schrijver’s Algorithm
We explain here Schrijver’s strongly polynomial algorithm for submodular func-
tion minimization. This algorithm achieves strong polynomiality using a distance
labeling with an ingenious lexicographic rule.
Following the basic framework introduced in section 10.2.1, the algorithm
employs the representation of a base in terms of a convex combination of extreme
bases associated with linear orderings. Given {(Li,λi) | i ∈ I}, the algorithm
constructs a directed graph G = (V,A) with arc set
A =
:
i∈I
{(u,v) | u ≺i v} (10.17)
(see (10.14) for the notation ≺i) and searches for a directed path from P = supp+
(x)
to N = supp−
(x). If there is no such path, the algorithm terminates by setting W
to be the set of vertices reachable to N. Then W and x satisfy all the conditions in
Proposition 10.9, and hence W is a minimizer of ρ and x is a maximizer of x−
(V ).
Otherwise, it modiﬁes {(Li,λi) | i ∈ I} with reference to a path from P to N.
Schrijver’s algorithm for submodular function minimization
S0: Take any linear ordering L1 and set I := {1}, λ1 := 1.
S1: Construct the graph G = (V,A) for {(Li,λi) | i ∈ I} by (10.17).
S2: Set P := supp+
(x), N := supp−
(x) for base x = i∈I λiyi in (10.13).
S3: If there exists no directed path from P to N in G, let W be the set
of vertices reachable to N and stop (W is a minimizer of ρ).
S4: Update {(Li,λi) | i ∈ I} and go to S1.
We now describe the concrete procedure for step S4, where a directed path exists
from P to N in G. Let d(v) denote the distance (= minimum number of arcs in a
directed path) in G from P to v.
We choose s,t ∈ V as follows (a lexicographic rule). We ﬁx a linear ordering ≺0
of elements of V ; this is independent of the linear orderings Li. Let t be the element
in N reachable from P with d(v) maximum; in the case of multiple candidates,
choose the largest with respect to ≺0. Let s be the element with (s,t) ∈ A, d(s) =
d(t)−1; in the case of multiple candidates, choose the largest with respect to ≺0. Let
α be the maximum of |(s,t]≺i | over i ∈ I and let k ∈ I be such that |(s,t]≺k
| = α.sidca00si
2013/2/12
page 294
## 294 Chapter 10. Algorithms
Index the elements of V so that Lk = (v1,...,vn) and assume vp = s. Then
we have vp+α = t and (s,t]≺k
= {vp+1,...,vp+α}. For j = 1,...,α, consider a
linear ordering
L•
j : v1 ···vp−1 | vp+j |
s
vp ···vp+j−1 | | vp+j+1 ···
t
vp+α | vp+α+1 ···vn,
which is obtained from Lk by moving vp+j to the position just before vp = s, and
let zj be the extreme base associated with L•
j.
Proposition 10.17. For some δ ≥ 0, yk + δ(χt − χs) can be represented as a
convex combination of {zj | j = 1,...,α}.
Proof. Put Vh = Lk(vh) = {v1,...,vh} for h = 1,...,n and V0 = ∅. By (10.12)
we have
yk(vh) = ρ(Vh) − ρ(Vh−1) (1 ≤ h ≤ n),
zj(vh) =
⎧
⎪ ⎪ ⎨
⎪ ⎪ ⎩
ρ(Vh) − ρ(Vh−1) (1 ≤ h ≤ p − 1),
ρ(Vh ∪ {vp+j}) − ρ(Vh−1 ∪ {vp+j}) (p ≤ h ≤ p + j − 1),
ρ(Vp−1 ∪ {vp+j}) − ρ(Vp−1) (h = p + j),
ρ(Vh) − ρ(Vh−1) (p + j + 1 ≤ h ≤ n)
and, therefore,
(zj − yk)(vh)
⎧
⎪ ⎪ ⎨
⎪ ⎪ ⎩
= 0 (1 ≤ h ≤ p − 1),
≤ 0 (p ≤ h ≤ p + j − 1),
≥ 0 (h = p + j),
= 0 (p + j + 1 ≤ h ≤ n),
(10.18)
where the inequalities follow from submodularity; for instance, for h = p+j, we have
(zj − yk)(vp+j) = [ρ(Vp−1 ∪ {vp+j}) − ρ(Vp−1)] − [ρ(Vp+j) − ρ(Vp+j−1)],
in which (Vp−1 ∪ {vp+j}) ∪ Vp+j−1 = Vp+j and (Vp−1 ∪ {vp+j}) ∩ Vp+j−1 = Vp−1.
The sign pattern of (10.18), as well as that of (χt −χs)(vh), for h with p ≤ h ≤ p+j
looks like:
p p + 1 ··· ··· p + α
z1 − yk * ⊕ 0 0 0
z2 − yk * * ⊕ 0 0
··· * * * ⊕ 0
zα − yk * * * * ⊕
χt − χs −1 0 0 0 1
⊕ = nonnegative
* = nonpositive
Note also that each row sum is equal to zero since zj(V ) = yk(V ). If all the diagonal
entries marked by ⊕ are strictly positive, we can represent χt −χs as a nonnegative
combination of {zj −yk | j = 1,...,α} with a positive coeﬃcient for j = α; namely,sidca00si
2013/2/12
page 295
10.2. Minimization of Submodular Set Functions 295
χt − χs = α
j=1 μj(zj − yk) with μj ≥ 0 (j = 1,...,α − 1) and μα > 0. Then the
claim is true for δ = 1/(
α
j=1 μj). If a diagonal entry, say, in the j0th row, vanishes,
then zj0 = yk and the claim is true for δ = 0.
Deﬁne x̂ = x + λkδ(χt − χs). This vector can be represented as a convex
combination of Ŷ = {yi | i ∈ I \{k}}∪{zj | j = 1,...,α} by Proposition 10.17 and
(10.13). Let x
be the point on the line segment connecting x and x̂ that is closest
to x̂ with the t-component x
(t) ≤ 0. This means
x̂(t) < 0 ⇒ x
= x̂ = x + λkδ(χt − χs), x
(t) < 0,
x̂(t) ≥ 0 ⇒ x
= x − x(t)(χt − χs), x
(t) = 0.
(10.19)
Note that x
can be represented as a convex combination of Ŷ ∪{yk} and, moreover,
{yk} can be dispensed with if x
(t) < 0. By a variant of Gaussian elimination we
can obtain a convex combination representation of x
using at most n vectors from
Ŷ ∪ {yk}. We update {(Li,λi) | i ∈ I} according to this representation. Since
|Ŷ | + 1 ≤ 2n, step S4 can be done with O(n3
) arithmetic operations.
Proposition 10.18. The number of iterations in Schrijver’s algorithm is bounded
by O(n6
). Hence, Schrijver’s algorithm ﬁnds a minimizer of a submodular set func-
tion ρ : 2V
→ R with O(n8
) function evaluations and O(n9
) arithmetic operations,
where n = |V |.
Proof. Denote by β the number of indices i ∈ I such that |(s,t]≺i | = α. Let
x
,d
,A
,P
,N
,t
,s
,α
,β
be the objects x,d,A,P,N,t,s,α,β in the next itera-
tion. We ﬁrst observe that a new arc appears only if it connects two vertices lying
between s and t with respect to ≺k:
(a) For each arc (v,w) ∈ A
\ A we have s (k w ≺k v (k t.
Proof of (a): By (v,w) / ∈ A we have w ≺k v and by (v,w) ∈ A
we have
v ≺•
j w for some j, where 1 ≤ j ≤ α and v ≺•
j w means that v precedes w in L•
j.
Hence v = vp+j and (a) follows.
The crucial properties are the monotonicity in the sense that
(b) d
(v) ≥ d(v) for all v ∈ V and,
(c) if d
(v) = d(v) for all v ∈ V , then (d
(t
),t
,s
,α
,β
) is lexicographically
smaller than (d(t),t,s,α,β).
Proof of (b): Note that P
⊆ P. If (b) fails, there exists an arc (v,w) ∈ A
\A
with d(w) ≥ d(v)+2. By (a) we have s (k w ≺k v (k t and hence d(w) ≤ d(s)+1 =
d(t) ≤ d(v) + 1, a contradiction. This shows (b).
Proof of (c): Assume d
(v) = d(v) for all v ∈ V . Since x
(t
) < 0, we have
x(t
) < 0 or t
= s by (10.19). By the choice of t and the inequality d(s) < d(t),
we see that d(t
) ≤ d(t) and that if d(t
) = d(t) then t
(0 t. Next assume also
that t
= t. We have (s
,t) ∈ A
, whereas (s
,t) / ∈ A
\ A by (a). Hence (s
,t) ∈ A
and the maximality of s implies s
(0 s. Finally assume also that s
= s. For eachsidca00si
2013/2/12
page 296
## 296 Chapter 10. Algorithms
j = 1,...,α, (s,t]≺•
j
is a proper subset of (s,t]≺k
. This implies α
≤ α. If α
= α,
then β
< β, since x
(t) = x
(t
) < 0 and Lk disappears in the update. Hence (c).
It follows from (c) that d(v) increases for some v ∈ V in O(n4
) iterations
because each of d(t), t, s, α, β is bounded by n and there are at most n pairs
(d(t),t) if d does not change. For each v ∈ V , d(v) can increase at most n times.
Therefore, the total number of iterations is bounded by O(n6
).
Note 10.19. A more detailed analysis of Vygen [208] yields an improved bound of
O(n5
) on the number of iterations in Schrijver’s algorithm.
## 10.2.3 Iwata–Fleischer–Fujishige’s Algorithm
We explain here Iwata–Fleischer–Fujishige’s strongly polynomial algorithm for sub-
modular function minimization. While sharing the basic frameworkof section 10.2.1,
this algorithm diﬀers substantially from Schrijver’s in that it is based on a scaling
technique rather than distance labeling.
Weakly Polynomial Scaling Algorithm
We start with a scaling algorithm for minimizing a submodular set function ρ : 2V
→
R. The algorithm is weakly polynomial for integer-valued ρ. It is emphasized that
the value of M in (10.8) need not be computed.
Recall from Proposition 10.8 that the problem dual to minimizing ρ is to
maximize x−
(V ) over x ∈ B(ρ). To add ﬂexibility in solving this maximization
problem we introduce a scaling parameter δ > 0 to relax (or enlarge) the feasible
region B(ρ) to B(ρ + κδ), where
κδ(X) = δ · |X| · |V \ X| (X ⊆ V ). (10.20)
The function κδ is submodular and therefore B(ρ+κδ) = B(ρ)+B(κδ) by Theorem
4.23 (1). For a concrete representation of B(κδ) we observe that κδ is the cut
capacity function associated with a complete directed graph G = (V,A), where
A = {(u,v) | u,v ∈ V,u = v}
and the arc capacities are all equal to δ; indeed, κδ coincides with κ in (9.16) with
c(a) = δ and c(a) = 0 for every arc a ∈ A. By a δ-feasible ﬂow we mean a function
ϕ : A → R such that for each (u,v) ∈ A we have (i) 0 ≤ ϕ(u,v) ≤ δ and (ii)
either ϕ(u,v) = 0 or ϕ(v,u) = 0. Then B(κδ) = {∂ϕ | ϕ is δ-feasible} by (9.18) in
Theorem 9.3. Thus our relaxation problem with parameter δ reads as follows:
Maximize z−
(V ) over z = x + ∂ϕ with x ∈ B(ρ) and δ-feasible ϕ. (10.21)
The algorithm consists of scaling phases, each of which corresponds to a ﬁxed
parameter value δ. We start with an arbitrary linear ordering, the extreme base x
associated with it, zero ﬂow ϕ = 0, and
δ = min{x+
(V ),|x−
(V )|}/n2
,sidca00si
2013/2/12
page 297
10.2. Minimization of Submodular Set Functions 297
where x+
is the vector in RV
deﬁned by x+
(v) = max(0,x(v)) for v ∈ V . In each
scaling phase, we construct an approximate solution to (10.21) from a given pair of
a base x and a δ-feasible ﬂow ϕ and then cut δ and ϕ in half for the next scaling
phase. We terminate the algorithm when δ is suﬃciently small; speciﬁcally, when
δ < 1/n2
for integer-valued ρ.
In the scaling phase with parameter value δ we maintain a δ-feasible ﬂow ϕ
and a directed graph Gϕ = (V,Aϕ) with arc set
Aϕ = {(u,v) | u,v ∈ V,u = v,ϕ(u,v) = 0}. (10.22)
We aim at increasing z−
(V ) by sending ﬂow along directed paths in Gϕ from S to
T deﬁned by
S = {v ∈ V | z(v) ≤ −δ}, T = {v ∈ V | z(v) ≥ +δ}.
Such a directed path is called a δ-augmenting path. We also maintain a base x
represented in the form of (10.13) with {(Li,λi) | i ∈ I}.
If there exists a δ-augmenting path P, we modify ϕ to another δ-feasible ﬂow
by setting
ϕ(u,v) := δ − ϕ(v,u), ϕ(v,u) := 0
for each arc (u,v) in P. This results in an increase of z−
(V ) by δ, an improvement
in the objective function in our optimization problem (10.21). We refer to this
operation as Augment(ϕ,P).
Suppose that no δ-augmenting path exists and denote by W the set of vertices
reachable from S in Gϕ; we have S ⊆ W ⊆ V \ T. In this case we cannot increase
z−
(V ) by ﬂow augmentation but the current solution may or may not be optimal.
With an additional condition we have approximate optimality for (10.21), as is
stated in the following theorem, which is a relaxation version of the min-max relation
in Proposition 10.8. A triple (i,u,v) of i ∈ I, u ∈ W, and v ∈ V \W is called active
if v is the immediate predecessor of u in Li.
Proposition 10.20. If S ⊆ W ⊆ V \ T, no arcs leave W in Gϕ, and no active
triples exist, then
z−
(V ) ≥ ρ(W) − nδ, x−
(V ) ≥ ρ(W) − n2
δ. (10.23)
Moreover, W is a minimizer of ρ if δ < Δ/n2
with
Δ ≤ min{ρ(X) − ρ(Y ) | X,Y ⊆ V,ρ(X) − ρ(Y ) > 0}. (10.24)
Proof. Since S ⊆ W ⊆ V \ T, we have z(v) < δ for every v ∈ W and z(v) > −δ
for every v ∈ V \ W. Therefore,
z−
(V ) = z−
(W) + z−
(V \ W) ≥ z(W) − δ|W| − δ|V \ W| = x(W) + ∂ϕ(W) − nδ.
Since x(W) = ρ(W) by the nonexistence of active triples and Proposition 10.9 (2)
and ∂ϕ(W) ≥ 0 by the nonexistence of arcs leaving W in Gϕ, we have z−
(V ) ≥
ρ(W) − nδ. Since ∂ϕ(v) ≤ (n − 1)δ for every v ∈ V , we have
x−
(V ) ≥ z−
(V ) − n(n − 1)δ ≥ ρ(W) − n2
δ.sidca00si
2013/2/12
page 298
## 298 Chapter 10. Algorithms
With δ < Δ/n2
we have x−
(V ) ≥ ρ(W)−n2
δ > ρ(W)−Δ, whereas x−
(V ) ≤ ρ(Y )
for all Y ⊆ V by (10.10). Hence W is a minimizer of ρ.
On the basis of Proposition 10.20 above we terminate the scaling phase if nei-
ther augmenting path nor active triple exists. Otherwise, while keeping z invariant,
we aim at “improving the situation” by either
1. eliminating an active triple or
2. enlarging the reachable set W.
With a view to eliminating an active triple (i,u,v) we modify Li by swapping u and
v in Li; denote the old pair (Li,yi) by (Lk,yk) with a new index k. The extreme
base associated with the updated Li is given by yi = yk + β(χu − χv) with
β = ρ(Lk(u) \ {v}) − ρ(Lk(u)) + yk(v)
(see (10.12)). Deﬁning α = min(ϕ(u,v),λiβ) let us modify x and ϕ by setting
x := x + α(χu − χv), ϕ(u,v) := ϕ(u,v) − α.
Then z = x + ∂ϕ is invariant and ϕ remains δ-feasible. The updated x is equal to

λi −
α
β

yk +
α
β
yi +

j∈I\{i}
λjyj, (10.25)
which is a convex combination of {yj | j ∈ I ∪ {k}}. In the saturating case where
α = λiβ, the old extreme base yk disappears from (10.25). Since u precedes v in
the new Li, the active triple (i,u,v) is successfully eliminated, whereas the size of
the index set I remains the same. In the nonsaturating case where α < λiβ, the
old extreme base yk remains and the size of I increases by one. Nevertheless, the
situation is somewhat improved; namely, the reachable set W is enlarged to contain
v as a result of ϕ(u,v) = 0 for the updated ﬂow ϕ. The above task is done by the
procedure Double-Exchange(i,u,v) below.
Procedure Double-Exchange(i,u,v)
S1: Set β := ρ(Li(u) \ {v}) − ρ(Li(u)) + yi(v), α := min(ϕ(u,v),λiβ).
S2: If α < λiβ, then let k be a new index and set
I := I ∪ {k}, λk := λi − α/β, λi := α/β, yk := yi, Lk := Li.
S3: Set yi := yi + β(χu − χv), x := x + α(χu − χv), ϕ(u,v) := ϕ(u,v) − α.
Update Li by swapping u and v.
The overall structure of the algorithm, which we name the IFF scaling algo-
rithm, is described below. Reduce(x,I) is a procedure that computes an expression
of x as a convex combination of at most n aﬃnely independent extreme bases cho-
sen from the current extreme bases indexed by I; this can be done by a variant
of Gaussian elimination. Parameter Δ for the stopping criterion in step S4 should
satisfy (10.24); we take Δ = 1 for integer-valued ρ.sidca00si
2013/2/12
page 299
10.2. Minimization of Submodular Set Functions 299
IFF scaling algorithm for submodular function minimization
S0: Take any linear ordering L1 and let y1 be the associated extreme base.
If y+
1 (V ) = 0, then output V as a minimizer and stop.
If y−
1 (V ) = 0, then output ∅ as a minimizer and stop.
Set I := {1}, λ1 := 1, x := y1, ϕ := 0, δ := min{x+
(V ),|x−
(V )|}/n2
.
S1: Let W be the set of vertices reachable from S in Gϕ.
S2: If W ∩ T = ∅, then let P be a δ-augmenting path, apply Augment(ϕ,P)
and Reduce(x,I), and go to S1.
S3: If there exists an active triple, then apply Double-Exchange to an active
triple (i,u,v) and go to S1.
S4: If δ < Δ/n2
, then output W as a minimizer and stop.
S5: Apply Reduce(x,I), set δ := δ/2, and ϕ := ϕ/2, and go to S1.
Iterations of steps S1 to S3 constitute a scaling phase. Step S2 increases z−
(V )
by ﬂow augmentation, whereas step S3 improves the situation by Double-Exchange.
Whenever ﬂow is augmented in step S2 we apply Reduce to reduce the size of I,
which may have grown as a result of repeated executions of step S3. The correctness
of the algorithm follows from the second half of Proposition 10.20, which guarantees
the optimality of W at the termination in step S4. Note, however, that the base
x is not necessarily optimal in (10.11). As for complexity the algorithm is weakly
polynomial for integer-valued ρ.
Proposition 10.21. The IFF scaling algorithm ﬁnds a minimizer of an integer-
valued submodular set function ρ : 2V
→ Z with O(n5
log2 M) function evaluations
and arithmetic operations, where n = |V | and M = max{|ρ(X)| | X ⊆ V }.
Proof. This can be derived from the properties listed in Proposition 10.22.
Proposition 10.22.
(1) The number of scaling phases is O(log2(M/Δ)).
(2) The ﬁrst scaling phase calls Augment O(n2
) times.
(3) A subsequent scaling phase calls Augment O(n2
) times.
(4) Between calls to Augment, there are at most n − 1 calls to nonsaturating
Double-Exchange.
(5) Between calls to Augment, there are at most 2n3
calls to saturating Double-
Exchange.
(6) We always have |I| < 2n.
(7) Reduce(x,I) with |I| < 2n can be done in O(n3
) arithmetic operations.
Proof. (1) We have δ ≤ M/n2
in step S0, since x+
(V ) = x(X) ≤ ρ(X) ≤ M for
X = supp+
(x). The number of scaling phases is bounded by log2((M/n2
)/(Δ/n2
)) =
log2(M/Δ).
(2) Let x denote the initial base in step S0. Then z−
(V ) = x−
(V ) at the
beginning of the scaling phase. Throughout the scaling phase we have z−
(V ) ≤
z(V ) = x(V ) as well as z−
(V ) ≤ 0. Since Augment increases z−
(V ) by δ, the
number of calls to Augment is bounded bysidca00si
2013/2/12
page 300
## 300 Chapter 10. Algorithms
min{x(V ),0} − x−
(V )
δ
=
min{x+
(V ),|x−
(V )|}
δ
= n2
.
(3) At the beginning of a subsequent scaling phase, we have ẑ−
(V ) ≥ ρ(W)−nδ̂
by Proposition 10.20, where ẑ = x + ∂ϕ̂ with ϕ̂ = 2ϕ and δ̂ = 2δ. Since
ẑ−
(V ) = min{ẑ(X) | X ⊆ V } = min{z(X) + ∂ϕ(X) | X ⊆ V }
≤ min{z(X) + n2
δ/4 | X ⊆ V } = z−
(V ) + n2
δ/4,
this implies that z−
(V ) ≥ ρ(W)−2nδ−n2
δ/4 at the beginning of the scaling phase.
Throughout the scaling phase we have
z−
(V ) ≤ z(W) = x(W) + ∂ϕ(W) ≤ ρ(W) + n2
δ/4.
Therefore, the number of calls to Augment is bounded by (2nδ + n2
δ/2)/δ = 2n +
n2
/2.
(4) Each nonsaturating Double-Exchange adds a new element to W.
(5), (6) A call to Reduce results in |I| ≤ n. A new index is added to I only in
a nonsaturating Double-Exchange. By (4), |I| grows to at most 2n − 1. Hence, the
number of triples (i,u,v) is bounded by 2n3
.
(7) Reduce can be performed by a variant of Gaussian elimination.
The following is a key property of the scaling algorithm that we make use of in
designing a strongly polynomial algorithm. Recall that a scaling phase ends when
the algorithm reaches step S4.
Proposition 10.23. At the end of a scaling phase with parameter δ, the following
hold true.
(1) If x(w) < −n2
δ, then w is contained in every minimizer of ρ.
(2) If x(w) > n2
δ, then w is not contained in any minimizer of ρ.
Proof. We have x−
(V ) ≥ ρ(W) − n2
δ by Proposition 10.20, whereas, for any
minimizer X of ρ, we have ρ(W) ≥ ρ(X) ≥ x(X) ≥ x−
(X). Hence, x−
(V ) ≥
x−
(X) − n2
δ. Therefore, if x(w) < −n2
δ, then w ∈ X. On the other hand,
x−
(X) ≥ x−
(V ) ≥ ρ(W) − n2
δ ≥ x(X) − n2
δ.
Therefore, if x(w) > n2
δ, then w / ∈ X.
Strongly Polynomial Fixing Algorithm
Using the scaling algorithm as a subroutine, we can devise a strongly polynomial al-
gorithm for submodular function minimization. The strongly polynomial algorithm,
which we call the IFF ﬁxing algorithm, exploits two fundamental facts:
• The minimizers of ρ form a ring family (see Note 4.8).sidca00si
2013/2/12
page 301
10.2. Minimization of Submodular Set Functions 301
• A ring family can be represented as the set of ideals of a directed graph (see
Note 4.7).
Let D◦
be the directed graph representing the family D◦
of minimizers of ρ. This
means that W ⊆ V is a minimizer of ρ if and only if it is an ideal of D◦
such
that minD◦
⊆ W ⊆ maxD◦
. The algorithm aims at constructing the graph by
identifying arcs of D◦
or elements of (minD◦
) ∪ (V \ maxD◦
) one by one with the
aid of the scaling algorithm.
To be more speciﬁc, we maintain an acyclic graph D = (U,F) and two disjoint
subsets Z and H of V such that
• Z is included in every minimizer of ρ, i.e., Z ⊆ minD◦
;
• H is disjoint from any minimizer of ρ, i.e., H ⊆ V \ maxD◦
;
• each u ∈ U corresponds to a nonempty subset, say, Γ(u), of V , and {Γ(u) |
u ∈ U} is a partition of V \ (Z ∪ H);
• for each u ∈ U and any minimizer W of ρ, either Γ(u) ⊆ W or Γ(u)∩W = ∅;
• an arc (u,w) ∈ F implies that every minimizer of ρ including Γ(u) includes Γ(w).
Using the notation Γ(Y ) =
5
u∈Y Γ(u) for Y ⊆ U, we deﬁne a function ρ̃ : 2U
→
R by
ρ̃(Y ) = ρ(Γ(Y ) ∪ Z) − ρ(Z) (Y ⊆ U).
It is easy to verify that
• ρ̃ is submodular;
• a subset W of V is a minimizer of ρ if and only if W = Γ(Y ) ∪ Z for a
minimizer Y ⊆ U of ρ̃;
• an arc (u,w) ∈ F implies that every minimizer of ρ̃ containing u contains w;
i.e., a minimizer of ρ̃ is an ideal of D.
The algorithm consists of iterations. Initially we set U := V , Z := ∅, H := ∅,
and F := ∅. At the beginning of each iteration, we compute
η = max{ρ̃(R(u)) − ρ̃(R(u) \ {u}) | u ∈ U}, (10.26)
where R(u) denotes the set of vertices reachable from u ∈ U in D. If η ≤ 0, we
are done by Proposition 10.24 below. Otherwise, we either enlarge Z ∪ H or add
an arc to D, where directed cycles that may possibly arise in this modiﬁcation are
contracted to a single vertex; the partition Γ of V \(Z∪H) is modiﬁed accordingly.
Proposition 10.24. If η ≤ 0, then V \ H is the maximal minimizer of ρ.
Proof. Let Y be the unique maximal minimizer of ρ̃. If Y = U, there is an
element u ∈ U \ Y such that Y ∪ {u} is an ideal of D. By Y ∪ {u} ⊇ R(u) and the
submodularity of ρ̃, we have
ρ̃(Y ∪ {u}) − ρ̃(Y ) ≤ ρ̃(R(u)) − ρ̃(R(u) \ {u}) ≤ 0,sidca00si
2013/2/12
page 302
## 302 Chapter 10. Algorithms
which contradicts the deﬁnition of Y . Thus, U is the maximal minimizer of ρ̃ and
hence Γ(U) ∪ Z = V \ H is the maximal minimizer of ρ.
Suppose that η > 0 and let û ∈ U be the vertex that attains the maximum in
(10.26). Then
η = ρ̃(U) − ρ̃(R(û) \ {û}) + [ρ̃(R(û)) − ρ̃(U)]
and we have at least one of the following three cases: (i) ρ̃(U) ≥ η/3, (ii) ρ̃(R(û) \
{û}) ≤ −η/3, or (iii) ρ̃(R(û)) − ρ̃(U) ≥ η/3.
Case (i): If ρ̃(U) ≥ η/3, we invoke a procedure Fix+
(ρ̃,D,η), described below,
to ﬁnd an element w ∈ U that is not contained in any minimizer of ρ̃. Since Γ(w)
cannot be included in any minimizer of ρ, we add Γ(w) to H and delete w from D.
Case (ii): If ρ̃(R(û)\{û}) ≤ −η/3, we invoke another procedure Fix−
(ρ̃,D,η),
described below, to ﬁnd an element w ∈ U that is contained in every minimizer of
ρ̃. Since Γ(w) must be included in every minimizer of ρ, we add Γ(w) to Z and
delete w from D.
Case (iii): If ρ̃(R(û))−ρ̃(U) ≥ η/3, we consider the contraction of ρ̃ by R(û),
which is a submodular function ρ̃∗ on U \ R(û) deﬁned by
ρ̃∗(X) = ρ̃(X ∪ R(û)) − ρ̃(R(û)) (X ⊆ U \ R(û)),
and ﬁnd an element w ∈ U \ R(û) that is contained in every minimizer of ρ̃∗. As
explained below, we can do this by applying Fix−
to (ρ̃∗,D∗,η), where D∗ means
the subgraph of D induced on the vertex set U \ R(û). A subset X ⊆ U \ R(û) is
a minimizer of ρ̃∗ if and only if X ∪ R(û) minimizes ρ̃ over subsets of U containing
R(û). Therefore, if a minimizer of ρ̃ containing û exists, then it must contain w.
Equivalently, if a minimizer of ρ including Γ(û) exists, then it must include Γ(w).
Accordingly, we add a new arc (û,w) to F, where the arc (û,w) is new because
w / ∈ R(û). If the added arc yields directed cycles, we contract the cycles to a single
vertex, with corresponding modiﬁcations of U and Γ.
Thus, in each iteration with η > 0, we either enlarge Z ∪ H or add a new arc
to D. Therefore, after at most n2
iterations, we can terminate the algorithm with
η ≤ 0 when we have a minimizer of ρ by Proposition 10.24.
The procedures Fix−
(ρ̃,D,η) and Fix+
(ρ̃,D,η) are as follows. Given a sub-
modular function ρ̃ : 2U
→ R, an acyclic graph D = (U,F), and a positive real
number η such that
ρ̃(Y ) ≤ −η/3 for some Y ⊆ U, (10.27)
the procedure Fix−
(ρ̃,D,η) ﬁnds an element w ∈ U that is contained in every
minimizer of ρ̃. Similarly, Fix+
(ρ̃,D,η) ﬁnds an element w ∈ U that is not contained
in any minimizer of ρ̃ when
ρ̃(U) ≥ η/3. (10.28)
The procedures Fix−
(ρ̃,D,η) and Fix+
(ρ̃,D,η) are the same as the IFF scaling
algorithm except that they start with δ = η and a linear extension of the partial
order represented by D and return w in step S4. We put ñ = |U|.sidca00si
2013/2/12
page 303
10.2. Minimization of Submodular Set Functions 303
Procedure Fix−
(ρ̃,D,η)
S0: Take any linear extension L1 of the partial order represented by D and
let y1 be the associated extreme base.
Set I := {1}, λ1 := 1, x := y1, ϕ := 0, δ := η.
S1: Let W be the set of vertices reachable from S in Gϕ.
S2: If W ∩ T = ∅, then let P be a δ-augmenting path, apply Augment(ϕ,P)
and Reduce(x,I), and go to S1.
S3: If there exists an active triple (i,u,v), then apply Double-Exchange to it
and go to S1.
S4: If there exists w ∈ U with x(w) < −ñ2
δ, then return such a w.
S5: Apply Reduce(x,I), set δ := δ/2, and ϕ := ϕ/2, and go to S1.
Procedure Fix+
(ρ̃,D,η) is identical to Fix−
(ρ̃,D,η) except that step S4 is replaced
with
S4: If there exists w ∈ U with x(w) > ñ2
δ, then return such a w.
The correctness of the above procedures at the termination in step S4 is guaran-
teed by Proposition 10.23. As to the complexity we have the following as well as
Proposition 10.22 (3)–(7).
Proposition 10.25. The following statements hold true for Fix±
(ρ̃,D,η).
(1) The number of scaling phases is O(log2 ñ), where ñ = |U|.
(2) If
y(u) ≤ η for any u ∈ U and any extreme base y for ρ̃
generated by a linear extension of the partial order of D, (10.29)
then the ﬁrst scaling phase calls Augment O(ñ) times.
Proof. (1) Assume δ < η/(3ñ3
). By (10.28) we have x(U) = ρ̃(U) ≥ η/3 > ñ3
δ
and hence x(w) > ñ2
δ for some w ∈ U. Therefore, the number of scaling phases
in Fix+
is bounded by log2(3ñ3
) = O(log2 ñ). For Y in (10.27), we have x(Y ) ≤
ρ̃(Y ) ≤ −η/3 < −ñ3
δ and hence x(w) < −ñ2
δ for some w ∈ Y . Therefore, the
number of scaling phases in Fix−
is bounded by O(log2 ñ).
(2) Let x denote the initial base in step S0. By the proof of Proposition
10.22 (2), the number of calls to Augment is bounded by x+
(U)/δ, whereas x+
(U) ≤
ñη by (10.29). Since δ = η, the number of calls to Augment is bounded by ñ.
The applications of Fix±
in the IFF ﬁxing algorithm are legitimate.
Proposition 10.26. Let η be deﬁned by (10.26).
(1) Conditions (10.28) and (10.29) are satisﬁed by (ρ̃,D,η) in Case (i).
(2) Conditions (10.27) and (10.29) are satisﬁed by (ρ̃,D,η) in Case (ii).
(3) Conditions (10.27) and (10.29) are satisﬁed by (ρ̃∗,D∗,η) in Case (iii).
Proof. In Case (i), (10.28) is obviously satisﬁed. Condition (10.27) is satisﬁed with
Y = R(û) \ {û} in Case (ii) and Y = U \ R(û) in Case (iii). To show (10.29) forsidca00si
2013/2/12
page 304
## 304 Chapter 10. Algorithms
(ρ̃,D,η), let y be an extreme base generated by a linear extension of the partial
order of D. For each u ∈ U we have y(u) = ρ̃(Y ) − ρ̃(Y \ {u}) for some Y ⊇ R(u),
whereas
ρ̃(Y ) − ρ̃(Y \ {u}) ≤ ρ̃(R(u)) − ρ̃(R(u) \ {u}) ≤ η
by the submodularity of ρ̃ and the deﬁnition of η. This proves (10.29) for (ρ̃,D,η).
Finally, for each u ∈ U \ R(û), put R∗(u) = R(u) \ R(û) and observe
ρ̃∗(R∗(u)) − ρ̃∗(R∗(u) \ {u}) = ρ̃(R(u) ∪ R(û)) − ρ̃((R(u) \ {u}) ∪ R(û))
≤ ρ̃(R(u)) − ρ̃(R(u) \ {u}) ≤ η.
This shows (10.29) for (ρ̃∗,D∗,η).
We are now in the position to assert the correctness and the strong polyno-
miality of the IFF ﬁxing algorithm.
Proposition 10.27. The IFF ﬁxing algorithm ﬁnds a minimizer of a submodular
set function ρ : 2V
→ R with O(n7
log2 n) function evaluations and arithmetic
operations, where n = |V |.
Proof. This follows from Proposition 10.25 and Proposition 10.22 (3)–(7).
Finally, we note that the maximal minimizer is found.
Proposition 10.28. The IFF ﬁxing algorithm ﬁnds the maximal minimizer of ρ.
Proof. This follows from Proposition 10.24.
Note 10.29. For minimization of a submodular set function ρ : 2V
→ R ∪ {+∞}
deﬁned eﬀectively on a general ring family, the IFF scaling/ﬁxing algorithm can
be applied to the associated ﬁnite-valued submodular function ρ in Note 10.14.
Alternatively, the IFF scaling/ﬁxing algorithm can be tailored to this general case
if the ring family is represented as the set of ideals of a directed graph (V,E). The
min-max relation (10.11) in Proposition 10.8 holds true in this general case. The
representation (10.13) of a base x as a convex combination of extreme bases yi
(i ∈ I) should be augmented by an additional term ∂ξ as
x =

i∈I
λiyi + ∂ξ
8
with

i∈I
λi = 1,λi > 0 (i ∈ I)
9
, (10.30)
where ∂ξ is the boundary of a nonnegative ﬂow ξ : E → R+. Then we have
z = x + ∂ϕ =

i∈I
λiyi + ∂ξ + ∂ϕ =

i∈I
λiyi + ∂ψ,sidca00si
2013/2/12
page 305
10.3. Minimization of L-Convex Functions 305
where ψ is a ﬂow in the complete graph on V representing the superposition of ξ and
ϕ. It is possible to design an algorithm that ﬁnds the minimum of ρ by maintaining
the extreme bases and the ﬂow ψ. See Iwata [99] for more details.
## 10.3 Minimization of L-Convex Functions
Three kinds of algorithms for L-convex function minimization are described: the
steepest descent algorithm, the steepest descent scaling algorithm, and the reduction
to submodular function minimization on a distributive lattice. All of them depend
heavily on the algorithms for submodular function minimization in section 10.2.
Throughout this section g : ZV
→ R ∪ {+∞} denotes an L- or L
-convex function
with |V | = n. For an L-convex function g, it is assumed that
g(p + 1) = g(p) (∀p ∈ ZV
), (10.31)
since otherwise g does not have a minimum.
## 10.3.1 Steepest Descent Algorithm
The local characterization of global minimality for L-convex functions (Theorem
7.14) naturally leads to the following steepest descent algorithm.
Steepest descent algorithm for an L-convex function g ∈ L[Z → R]
S0: Find a vector p ∈ domg.
S1: Find X ⊆ V that minimizes g(p + χX).
S2: If g(p) ≤ g(p + χX), then stop (p is a minimizer of g).
S3: Set p := p + χX and go to S1.
Step S1 amounts to minimizing a set function
ρp(X) = g(p + χX) − g(p) (10.32)
over all subsets X of V . As a consequence of the submodularity of g, ρp is sub-
modular and can be minimized in strongly polynomial time by the algorithms in
section 10.2. At the termination in step S2, p is a global minimizer by Theorem
7.14 (1) (L-optimality criterion). The function value g decreases monotonically with
iterations. This property alone does not ensure ﬁnite termination in general, but it
does if g is integer valued and bounded from below.
We introduce a tie-breaking rule in step S1:
take the (unique) minimal minimizer X of ρp. (10.33)
Thus, we can guarantee an upper bound on the number of iterations. Let p◦
be the
initial vector found in step S0. If g has a minimizer at all, it has a minimizer p∗
satisfying p◦
≤ p∗
by (10.31). Let p∗
denote the smallest of such minimizers, which
exists since p∗
∧ q∗
∈ argming for p∗
,q∗
∈ argming.sidca00si
2013/2/12
page 306
## 306 Chapter 10. Algorithms
Proposition 10.30. In step S1, p ≤ p∗
implies p + χX ≤ p∗
. Hence the number
of iterations is bounded by ||p◦
− p∗
||1.
Proof. Put Y = {v ∈ V | p(v) = p∗
(v)} and p
= p + χX. By submodularity we
have
g(p∗
) + g(p
) ≥ g(p∗
∨ p
) + g(p∗
∧ p
),
whereas g(p∗
) ≤ g(p∗
∨p
) since p∗
is a minimizer of g. Hence g(p
) ≥ g(p∗
∧p
). Here
we have p
= p + χX and p∗
∧ p
= p + χX\Y , whereas X is the minimal minimizer
by the tie-breaking rule (10.33). This means that X \ Y = X; i.e., X ∩ Y = ∅.
Therefore, p
= p + χX ≤ p∗
.
It is easy to ﬁnd the minimal minimizer of ρp using the existing algorithms
for submodular set function minimization (see Notes 10.11, 10.12, and 10.13 and
Proposition 10.28). Assuming that the minimal minimizer of a submodular set func-
tion can be computed with O(σ(n)) function evaluations and O(τ(n)) arithmetic
operations and denoting by F an upper bound on the time to evaluate g, we can
perform step S1 in O(σ(n)F + τ(n)) time. We measure the size of the eﬀective
domain of g by
K̂1 = max{||p − q||1 | p,q ∈ domg, p(v) = q(v) for some v ∈ V }, (10.34)
where it is noted that domg itself is unbounded by (10.31).
Proposition 10.31. For an L-convex function g with ﬁnite K̂1, the number of
iterations in the steepest descent algorithm with tie-breaking rule (10.33) is bounded
by K̂1. Hence, if a vector in domg is given, the algorithm ﬁnds a minimizer of g
in O((σ(n)F + τ(n))K̂1) time.
Proof. We have ||p◦
− p∗
||1 ≤ K̂1 since p◦
(v) = p∗
(v) for some v ∈ V . Then the
claim follows from Proposition 10.30.
The steepest descent algorithm can be adapted to L
-convex functions. Let g
be an L
-convex function and recall from (7.2) that it is associated with an L-convex
function g̃ as
g̃(p0,p) = g(p − p01) (p0 ∈ Z,p ∈ ZV
). (10.35)
The steepest descent algorithm above applied to this L-convex function g̃ yields the
following algorithm for the L
-convex function g.
Steepest descent algorithm for an L
-convex function g ∈ L
[Z → R]
S0: Find a vector p ∈ domg.
S1: Find ε ∈ {1,−1} and X ⊆ V that minimize g(p + εχX).
S2: If g(p) ≤ g(p + εχX), then stop (p is a minimizer of g).
S3: Set p := p + εχX and go to S1.
Step S1 amounts to minimizing a pair of submodular set functions
ρ+
p (X) = g(p + χX) − g(p), ρ−
p (X) = g(p − χX) − g(p).sidca00si
2013/2/12
page 307
10.3. Minimization of L-Convex Functions 307
Let X+
be the minimal minimizer of ρ+
p and X−
be the maximal minimizer of ρ−
p .
The tie-breaking rule in step S1 above reads
(ε,X) =

(1,X+
) if minρ+
p ≤ minρ−
p ,
(−1,X−
) if minρ+
p > minρ−
p .
(10.36)
This is a translation of the tie-breaking rule (10.33) for g̃ in (10.35) through the
correspondence
g g̃
p → p + χX ⇐⇒ p̃ → p̃ + (0,χX)
p → p − χX ⇐⇒ p̃ → p̃ + (1,χV \X)
where p̃ = (0,p) ∈ Z × ZV
. Since (1,χV \X−) cannot be minimal in the presence of
(0,χX+ ), we choose (1,X+
) in the case of minρ+
p = minρ−
p . At the termination in
step S2, p is a global minimizer by Theorem 7.14 (2) (L-optimality criterion).
In view of the complexity bound given in Proposition 10.31 we will derive a
bound on the size of domg̃ in terms of the size of domg. Let K̂1(g̃) be deﬁned by
(10.34) for g̃. The 1-size and ∞-size of domg are denoted, respectively, by
K1 = max{||p − q||1 | p,q ∈ domg}, (10.37)
K∞ = max{||p − q||∞ | p,q ∈ domg}. (10.38)
Proposition 10.32. K̂1(g̃) ≤ K1 + nK∞ ≤ min[(n + 1)K1, 2nK∞].
Proof. Take p̃ = (p0,p) and q̃ = (q0,q) in domg̃ such that K̂1(g̃) = |p0 − q0| +
||p − q||1 and either (i) p0 = q0 or (ii) p(v) = q(v) for some v ∈ V . We may assume
p0 ≥ q0 and p ≥ q since p̃ ∨ q̃,p̃ ∧ q̃ ∈ domg̃ and ||(p̃ ∨ q̃) − (p̃ ∧ q̃)||1 = ||p̃ − q̃||1.
The vectors p
= p − p01 and q
= q − q01 belong to domg. In case (i), we have
K̂1(g̃) = ||p−q||1 = ||p
−q
||1 ≤ K1. In case (ii), we have p0 −q0 = q
(v)−p
(v) and
K̂1(g̃) = |p0 − q0| + ||p − q||1
= (p0 − q0) +

u∈V
(p(u) − q(u))
= (p0 − q0) +

u∈V
(p
(u) − q
(u)) + n(p0 − q0)
=

u=v
(p
(u) − q
(u)) − n(p
(v) − q
(v))
≤ K1 + nK∞.
Note ﬁnally that K1 ≤ nK∞ and K∞ ≤ K1.
The steepest descent algorithm could be used for minimizing quasi L-convex
functions satisfying (SSQSBw) because of Theorem 7.53 (quasi L-optimality crite-
rion). Note, however, that the set function ρp of (10.32), to be minimized in step
S1, is not necessarily submodular and hence no eﬃcient procedure is available for
step S1.sidca00si
2013/2/12
page 308
## 308 Chapter 10. Algorithms
## 10.3.2 Steepest Descent Scaling Algorithm
The steepest descent algorithm for L-convex function minimization can be made
more eﬃcient with the aid of a scaling technique. The eﬃciency of the result-
ing steepest descent scaling algorithm is guaranteed by the complexity analysis in
section 10.3.1 combined with the proximity theorem for L-convex functions.
The algorithm for an L-convex function g with (10.31) reads as follows, where
K̂∞ = max{||p − q||∞ | p,q ∈ domg, p(v) = q(v) for some v ∈ V }.
Steepest descent scaling algorithm for an L-convex function g ∈ L[Z → R]
S0: Find a vector p ∈ domg and set α := 2log2(K̂∞/2n)
.
S1: Find an integer vector q that locally minimizes g̃(q) = g(p + αq) in the
sense of g̃(q) ≤ g̃(q + χX) (∀X ⊆ V ) by the steepest descent algorithm
of section 10.3.1 with initial vector 0 and set p := p + αq.
S2: If α = 1, then stop (p is a minimizer of g).
S3: Set α := α/2 and go to S1.
Note ﬁrst that the function g̃(q) = g(p + αq) is an L-convex function. By the
L-proximity theorem (Theorem 7.18 (1)), there exists a minimizer q of g̃ satis-
fying 0 ≤ q ≤ (n − 1)1. Then, by Propositions 10.30 and 10.31, the steepest
descent algorithm with tie-breaking rule (10.33) ﬁnds the minimizer in step S1 in
O((σ(n)F + τ(n))n2
) time, where σ(n), τ(n), and F are deﬁned in section 10.3.1.
The number of executions of step S1 is bounded by log2(K̂∞/2n) and, at the
termination of the algorithm in step S2 with α = 1, p is a minimizer of g by The-
orem 7.14 (L-optimality criterion). Thus, the complexity of the steepest descent
scaling algorithm is bounded by a polynomial in n and log2(K̂∞/2n).
The steepest descent scaling algorithm can be adapted to quasi L-convex func-
tions satisfying (SSQSB) because of Theorem 7.53 (quasi L-optimality criterion)
and Theorem 7.54 (quasi L-proximity theorem). Note, however, that no eﬃcient
procedure is available for the minimization in step S1.
## 10.3.3 Reduction to Submodular Function Minimization
The eﬀective domain of an L
-convex function g is a distributive lattice (a sublattice
of ZV
) on which g is submodular. Hence we can make use of submodular function
minimization algorithms as adapted to functions on distributive lattices (see Note
10.15). If the 1-size of domg is given by K1, domg is isomorphic to a sublattice
of the Boolean lattice 2Ṽ for a set Ṽ of cardinality K1. Hence, the complexity of
this algorithm is polynomial in n and K1. It may be noted, however, that, being
dependent only on the submodularity of g, this approach does not fully exploit
L
-convexity.
## 10.4 Algorithms for M-Convex Submodular Flows
Five algorithms for the M-convex submodular ﬂow problem are described: the two-
stage algorithm, the successive shortest path algorithm, the cycle-canceling algo-sidca00si
2013/2/12
page 309
10.4. Algorithms for M-Convex Submodular Flows 309
rithm, the primal-dual algorithm, and the conjugate scaling algorithm. Because
the optimality criterion for the M-convex submodular ﬂow problem is essentially
equivalent to the duality theorems for M-/L-convex functions, these algorithms can
be used for ﬁnding a separating aﬃne function in the separation theorem and the
optimal solutions in the minimization/maximization problems in the Fenchel-type
duality.
## 10.4.1 Two-Stage Algorithm
This section is intended to provide a general structural view on the duality nature
of the M-convex submodular ﬂow problem. It is based on the recognition of the
M-convex submodular ﬂow problem as a composition of the Fenchel-type duality
and the minimum cost ﬂow problem that does not involve an M-convex function.
The algorithm presented in this section, called the two-stage algorithm, computes
an optimal potential by solving an L-convex minimization problem in the dual
problem and constructs an optimal ﬂow as a feasible ﬂow to another submodular
ﬂow problem.
As an adaptation of our discussion in section 9.1.4, the relationship between
the M-convex submodular ﬂow problem MSFP3 and the Fenchel-type duality may
be summarized as follows. To be speciﬁc, we consider the integer-ﬂow version of
MSFP3 on the graph G = (V,A) with f ∈ M[Z → Z] and fa ∈ C[Z → Z] for a ∈ A.
M-convex submodular flow problem MSFP3 (integer flow)
Minimize Γ3(ξ) =

a∈A
fa(ξ(a)) + f(∂ξ) (10.39)
subject to ξ(a) ∈ domfa (a ∈ A), (10.40)
∂ξ ∈ domf, (10.41)
ξ(a) ∈ Z (a ∈ A). (10.42)
We assume the existence of an optimal solution.
First, we identify the problem dual to MSFP3 and indicate how to compute
an optimal potential. With the introduction of a function
fA(x) = inf
ξ∈ZA
(

a∈A
fa(ξ(a))
)
)
)
)
)
∂ξ = x
*
(x ∈ ZV
)
we obtain
inf
ξ∈ZA
Γ3(ξ) = inf
x∈ZV
[f(x) + fA(x)],
where f ∈ M[Z → Z] and fA ∈ M[Z → Z]. Putting g = f•
, ga = fa
•
for
a ∈ A, and
gA(p) =

a∈A
ga(δp(a)) (p ∈ ZV
),sidca00si
2013/2/12
page 310
## 310 Chapter 10. Algorithms
we have gA = fA
•
(see (9.28)) and also g ∈ L[Z → Z], ga ∈ C[Z → Z] for a ∈ A,
and gA ∈ L[Z → Z]. The Fenchel-type duality (Theorem 8.21 (3)) gives
inf
x∈ZV
[f(x) + fA(x)] = − inf
p∈ZV
[g(p) + gA(−p)], (10.43)
which is equivalent to61
inf
ξ∈ZA
+
f(∂ξ) +

a∈A
fa(ξ(a))
,
= − inf
p∈ZV
+
g(p) +

a∈A
ga(−δp(a))
,
. (10.44)
The function
g̃(p) = g(p) +

a∈A
ga(−δp(a)) (10.45)
to be minimized on the right-hand side of (10.44) is an L-convex function and a
minimizer of g̃ is an optimal potential for MSFP3, and vice versa, in the sense of
Theorem 9.16.
Next we discuss how to construct an optimal ﬂow. Let p∗
be a minimizer of g̃
and deﬁne c∗
: A → Z ∪ {−∞}, c∗
: A → Z ∪ {+∞}, and B∗
⊆ ZV
by
[c∗
(a),c∗
(a)]Z = argminfa[δp∗
(a)] (a ∈ A), (10.46)
B∗
= argminf[−p∗
], (10.47)
where B∗
is an M-convex set by Proposition 6.29. Since p∗
is an optimal potential,
a ﬂow ξ∗
is optimal if and only if
c∗
(a) ≤ ξ∗
(a) ≤ c∗
(a) (a ∈ A), ∂ξ∗
∈ B∗
. (10.48)
The two-stage algorithm is described as follows.
Two-stage algorithm for MSFP3 (integer flow)
S1: Find a minimizer p∗
of g̃ in (10.45).
S2: Find a ﬂow ξ∗
satisfying (10.48).
The feasibility of this approach is guaranteed by the following facts if the given
functions, f and fa for a ∈ A, can be evaluated.
1. We can evaluate g by applying an M-convex function minimization algorithm
to f. Similarly, we can evaluate ga for a ∈ A.
2. We can ﬁnd a minimizer p∗
in step S1 by applying an L-convex function
minimization algorithm to g̃.
3. We can ﬁnd a member of B∗
by applying an M-convex function minimization
algorithm to f[−p∗
].
4. We can ﬁnd a ﬂow ξ∗
in step S2 as a feasible ﬂow to the submodular ﬂow
problem deﬁned by c∗
, c∗
, and B∗
. This can be done, e.g., by the successive
shortest path algorithm described in section 10.4.2.
61We have seen (10.44) in (9.83) as a special case of Theorem 9.26 (3).sidca00si
2013/2/12
page 311
10.4. Algorithms for M-Convex Submodular Flows 311
## 10.4.2 Successive Shortest Path Algorithm
We present the successive shortest path algorithm to ﬁnd a feasible integer ﬂow in
an integral submodular ﬂow problem. We adopt the most primitive form of the
algorithm to better explain the basic idea without being bothered by technicalities.
Given a graph G = (V,A), an upper capacity c : A → Z ∪ {+∞}, a lower
capacity c : A → Z ∪ {−∞}, and an M-convex set B ⊆ ZV
, we are to ﬁnd an
integer ﬂow ξ : A → Z satisfying
c(a) ≤ ξ(a) ≤ c(a) (a ∈ A), (10.49)
∂ξ ∈ B. (10.50)
It is assumed that c(a) ≤ c(a) for each a ∈ A.
The algorithm maintains a pair (ξ,x) ∈ ZA
× ZV
of integer ﬂow ξ satisfying
(10.49) and base x ∈ B and repeats modifying (ξ,x) to resolve the discrepancy
between ∂ξ and x. For such (ξ,x) let Gξ,x = (V,Aξ,x) be a directed graph with
vertex set V and arc set Aξ,x = A∗
ξ ∪ B∗
ξ ∪ Cx consisting of three disjoint parts:
A∗
ξ = {a | a ∈ A,ξ(a) < c(a)},
B∗
ξ = {a | a ∈ A,c(a) < ξ(a)} (a: reorientation of a),
Cx = {(u,v) | u,v ∈ V,u = v,x − χu + χv ∈ B}, (10.51)
and deﬁne
S+
= {v | x(v) > ∂ξ(v)}, S−
= {v | x(v) < ∂ξ(v)}.
In order to reduce the discrepancy ||x − ∂ξ||1 = v∈V |x(v) − ∂ξ(v)|, the
algorithm augments a unit ﬂow along a shortest path P from S+
to S−
(shortest
with respect to the number of arcs) and modiﬁes ξ to ξ given by
ξ(a) =
⎧
⎨
⎩
ξ(a) + 1 (a ∈ P ∩ A∗
ξ),
ξ(a) − 1 (a ∈ P ∩ B∗
ξ ),
ξ(a) (otherwise).
Obviously, ξ satisﬁes the capacity constraint (10.49). The algorithm also updates
the base x to
x = x −

{χu − χv | (u,v) ∈ P ∩ Cx}, (10.52)
which remains a base belonging to B; see Note 10.33. For the initial vertex s ∈ S+
of the path P, either ∂ξ(s) increases or x(s) decreases by one and hence |x(s) −
∂ξ(s)| reduces by one. A similar result is true for the terminal vertex of P in S−
,
whereas x(v) = ∂ξ(v) is kept invariant at every inner vertex v of P. Therefore,
each augmentation along a shortest path decreases ||x − ∂ξ||1 by two. Repeating
this process until the source S+
and consequently the sink S−
become empty, the
algorithm constructs a pair (ξ,x) with ∂ξ = x. Then ξ is a feasible ﬂow satisfying
both (10.49) and (10.50).sidca00si
2013/2/12
page 312
## 312 Chapter 10. Algorithms
Successive shortest path algorithm for finding a feasible integer flow
S0: Find ξ ∈ ZA
satisfying (10.49) and x ∈ B.
S1: If S+
is empty, then stop (ξ is a feasible ﬂow).
S2: If there is no path from S+
to S−
, then stop (no feasible ﬂow exists).
S3: Let P be a shortest path from S+
to S−
and, for each arc a ∈ P, set ⎧
⎨
⎩
a ∈ A∗
ξ ⇒ ξ(a) := ξ(a) + 1,
a ∈ B∗
ξ ⇒ ξ(a) := ξ(a) − 1 (a: reorientation of a),
a ∈ Cx ⇒ x(∂+
a) := x(∂+
a) − 1, x(∂−
a) := x(∂−
a) + 1
and go to S1.
Note 10.33. The updated vector x in (10.52) remains a base, i.e., x ∈ B, by
Proposition 9.23 with f = δB (indicator function of B). Let G(x,x) be the bipartite
graph, as deﬁned in section 9.5.2. All the arcs have zero weight. Hence, (x,x) meets
the unique-min condition if and only if G(x,x) has a unique perfect matching. The
latter condition holds in the algorithm because P is chosen to be a shortest path,
whereas Proposition 9.23 says that the unique-min condition implies x ∈ B.
Note 10.34. Instead of augmenting a unit ﬂow along P it is more eﬃcient to
augment as much as possible. The maximum admissible amount is given by δ =
min{c(a) | a ∈ P} with
c(a) =
⎧
⎨
⎩
c(a) − ξ(a) (a ∈ A∗
ξ),
ξ(a) − c(a) (a ∈ B∗
ξ ,a ∈ A),
cB(x,v,u) (a = (u,v) ∈ Cx),
where cB(·,·,·) means the exchange capacity deﬁned in (10.4). It can be shown that
x = x − δ

{χu − χv | (u,v) ∈ P ∩ Cx}
stays in B; see Lemma 4.5 of Fujishige [65]. The successive shortest path algorithm
can be adapted to ﬁnding a real-valued feasible ﬂow to a nonintegral submodular
ﬂow problem. For a polynomial complexity bound of the algorithm, it is important
to choose, in the case of multiple candidates, an appropriate shortest path with
reference to some lexicographic ordering. The successive shortest path algorithm
can be generalized for optimal ﬂow problems involving cost functions; see [65],
Fujishige–Iwata [66], and Iwata [98] for such algorithms for MSFP1 (without M-
convex cost), whereas such an algorithm for the integer-ﬂow version of MSFP2
(with M-convex cost) is given in Moriguchi–Murota [132].
Note 10.35. A number of algorithms are available for ﬁnding a feasible submodular
ﬂow; e.g., Fujishige [59], Frank [56], Tardos–Tovey–Trick[199], and Fujishige–Zhang
[70]. The reader is referred to Fujishige [65], Fujishige–Iwata [66], and Iwata [98]
for expositions.
## 10.4.3 Cycle-Canceling Algorithm
For the M-convex submodular integer-ﬂow problem with linear arc cost, we have
seen in section 9.5 that a feasible ﬂow is optimal if and only if there exists no negativesidca00si
2013/2/12
page 313
10.4. Algorithms for M-Convex Submodular Flows 313
cycle in an auxiliary network (Theorem 9.20) and that a nonoptimal ﬂow can be
improved by augmenting a ﬂow along a suitably chosen negative cycle (Theorem
9.22). These two facts suggest the following cycle-canceling algorithm, which works
on the auxiliary network (Gξ,ξ) introduced in section 9.5.
Cycle-canceling algorithm for MSFP2 (integer flow)
S0: Find a feasible integer ﬂow ξ.
S1: If (Gξ,ξ) has no negative cycle, then stop (ξ is an optimal ﬂow).
S2: Let Q be a negative cycle with the smallest number of arcs.
S3: Modify ξ to ξ of (9.75) and go to S1.
The objective function Γ2 decreases monotonically by Theorem 9.22. This
property alone does not ensure ﬁnite termination in general, but it does if Γ2 is
integer valued and bounded from below. In the special case with domf ⊆ {0,1}V
,
which corresponds to the valuated matroid intersection problem (Example 8.28),
some variants of the cycle-canceling algorithm are known to be strongly polynomial
(see Murota [136]).
Cycle-canceling algorithms can also be designed for problems with real-valued
ﬂow on the basis of Theorem 9.18.
Note 10.36. For MSFP1 (submodular ﬂow problem with linear arc cost and with-
out M-convex cost), a number of cycle-canceling algorithms are proposed, includ-
ing Fujishige [59], Cui–Fujishige [27], Zimmermann [222], Wallacher–Zimmermann
[210], and Iwata–McCormick–Shigeno [103].
## 10.4.4 Primal-Dual Algorithm
A primal-dual algorithm for the M-convex submodular ﬂow problem is described.
The algorithm maintains a pair of ﬂow and potential and modiﬁes them to opti-
mality. We deal with the case of linear arc cost with dual integrality.
M-convex submodular flow problem MSFP2
Minimize Γ2(ξ) =

a∈A
γ(a)ξ(a) + f(∂ξ) (10.53)
subject to c(a) ≤ ξ(a) ≤ c(a) (a ∈ A), (10.54)
∂ξ ∈ domf, (10.55)
ξ(a) ∈ R (a ∈ A). (10.56)
Here, c : A → R ∪ {+∞}, c : A → R ∪ {−∞}, f ∈ M[R → R|Z], and γ : A → Z
(see (9.67)). The feasibility of the problem is also assumed.
By Theorems 9.14 and 9.15 as well as (9.31), (9.32), and (9.65), a feasible
ﬂow ξ : A → R is optimal if and only if there exists an integer-valued potential
p : V → Z such that
γp(a) > 0 =⇒ ξ(a) = c(a), (10.57)
γp(a) < 0 =⇒ ξ(a) = c(a), (10.58)
∂ξ ∈ B(gp), (10.59)sidca00si
2013/2/12
page 314
## 314 Chapter 10. Algorithms
where γp : A → Z is the (integer-valued) reduced cost deﬁned by
γp(a) = γ(a) + p(∂+
a) − p(∂−
a) (a ∈ A), (10.60)
gp : 2V
→ R ∪ {+∞} is the submodular set function derived from g = f•
∈
L[Z|R → R] by
gp(X) = g
(p;χX) = g(p + χX) − g(p) (X ⊆ V )
with gp(V ) = 0 by (9.51), and B(gp) is the base polyhedron (M-convex polyhedron)
associated with gp.
The algorithm maintains a pair (ξ,p) ∈ RA
× ZV
of a feasible ﬂow ξ and
an integer-valued potential p that satisﬁes (10.59) and repeats modifying (ξ,p) to
increase the set of arcs satisfying (10.57) and (10.58). We say an arc is in kilter
with respect to (ξ,p) if it satisﬁes (10.57) and (10.58) and out of kilter otherwise.
Note that exactly one of (10.57) and (10.58) fails for an out-of-kilter arc.
An initial (ξ,p) satisfying (10.59) can be found as follows. For any feasible
ﬂow ξ we consider a graph Gξ = (V,Cξ) with vertex set V and arc set
Cξ = {(u,v) | u,v ∈ V,u = v,∃α > 0 : ∂ξ − α(χu − χv) ∈ domf}
and deﬁne the length of arc (u,v) as f
(∂ξ;−χu + χv), which is an integer by the
assumed dual integrality (Note 9.19). By solving a shortest path problem we can
ﬁnd an integral vector p such that
p(v) − p(u) ≤ f
(∂ξ;−χu + χv) (u,v ∈ V ), (10.61)
which implies ∂ξ ∈ argminf[−p] = B(gp) by (9.64) and (9.65).
To classify out-of-kilter arcs we deﬁne
D+
ξ (v) = {a ∈ δ+
v | γp(a) < 0,ξ(a) < c(a)} (v ∈ V ),
D−
ξ (v) = {a ∈ δ−
v | γp(a) > 0,ξ(a) > c(a)} (v ∈ V ),
Dξ(v) = D+
ξ (v) ∪ D−
ξ (v) (v ∈ V ),
where the dependence on p is implicit in the notation. Note that D+
ξ (v) is the set
of arcs leaving v for which (10.58) fails, D−
ξ (v) is the set of arcs entering v for which
(10.57) fails, and {Dξ(v) | v ∈ V } gives a partition of the set of out-of-kilter arcs.
If Dξ(v) = ∅ for all v ∈ V , condition (i) of (POT) is satisﬁed and the current
(ξ,p) is optimal. Otherwise, the algorithm picks62
any v
∈ V with nonempty
Dξ(v
) and tries to meet the conditions (10.57) for a ∈ D−
ξ (v
) and (10.58) for
a ∈ D+
ξ (v
) by changing the ﬂow to ξ
. The ﬂow ξ
is determined by solving the
following maximum submodular ﬂow problem on G = (V,A) with a more restrictive
capacity constraint c
(a) ≤ ξ
(a) ≤ c
(a) with
62The original primal-dual algorithm picks an out-of-kilter arc and tries to meet (10.57) and
(10.58) for that arc. The present strategy to pick a vertex is to improve the worst-case complexity
bound.sidca00si
2013/2/12
page 315
10.4. Algorithms for M-Convex Submodular Flows 315
c
(a) =
⎧
⎨
⎩
c(a) (γp(a) > 0),
c(a) (γp(a) = 0),
ξ(a) (γp(a) < 0),
c
(a) =
⎧
⎨
⎩
ξ(a) (γp(a) > 0),
c(a) (γp(a) = 0),
c(a) (γp(a) < 0)
(10.62)
for each a ∈ A.
Maximum submodular flow problem maxSFP
Maximize ξ
(D+
ξ (v
)) − ξ
(D−
ξ (v
)) (10.63)
subject to c
(a) ≤ ξ
(a) ≤ c
(a) (a ∈ A), (10.64)
∂ξ
∈ B(gp), (10.65)
ξ
(a) ∈ R (a ∈ A), (10.66)
where ξ
: A → R is the variable to be optimized.
Since the capacity interval [c
(a),c
(a)] is included in the original capacity
interval [c(a),c(a)], any feasible ﬂow in maxSFP is feasible in MSFP2. Note also
that maxSFP has a feasible ﬂow ξ
= ξ. In maximizing the objective function
ξ
(D+
ξ (v
)) − ξ
(D−
ξ (v
)) =

a∈D+
ξ
(v)
ξ
(a) −

a∈D−
ξ
(v)
ξ
(a)
it is intended to meet the conditions (10.58) and (10.57) by increasing the ﬂow
in a ∈ D+
ξ (v
) to the upper capacity and decreasing the ﬂow in a ∈ D−
ξ (v
) to
the lower capacity. The maximum submodular ﬂow problem is a special case of
the feasibility problem for the submodular ﬂow problem and a number of eﬃcient
algorithms are available for it (see section 10.4.2).
Let ξ
be an optimal solution to maxSFP above. If Dξ(v
) is empty, the
algorithm updates ξ to ξ
without changing p. The condition (10.59) is maintained
because of (10.65). If Dξ(v
) is nonempty, the algorithm ﬁnds a minimum cut
W ⊆ V (explained later) and updates p to
p
= p + χW (10.67)
as well as ξ to ξ
. The condition (10.59) is maintained, as is shown in Proposition
10.38 below.
The primal-dual algorithm for the M-convex submodular ﬂow problem with a
linear arc cost (MSFP2) with dual integrality is summarized as follows.
Primal-dual algorithm for MSFP2 with dual integrality
S0: Find (ξ,p) ∈ RA
× ZV
satisfying (10.54) and (10.59).
S1: If Dξ(v) = ∅ for all v ∈ V , then stop ((ξ,p) is optimal).
S2: Take any v
∈ V with Dξ(v
) = ∅ and solve maxSFP to obtain ξ
.
S3: If Dξ(v
) = ∅, then ﬁnd a minimum cut W and set p := p + χW .
S4: Set ξ := ξ
and go to S1.
It remains to explain the minimum cut for maxSFP. For W ⊆ V containing
v
, we deﬁne the cut capacity ν(W) bysidca00si
2013/2/12
page 316
## 316 Chapter 10. Algorithms
v
:
D+
ξ (v
)
z
D−
ξ (v
)
:
γp < 0
ξ < c
z
γp > 0
ξ > c
N 
in kilter
G:
v
v̂
6 a0
:
D+
ξ (v
)
z
D−
ξ (v
)
:
γp < 0
ξ < c
z
γp > 0
ξ > c
N 
in kilter
Ĝ:
Figure 10.1. Structure of G and Ĝ at v
.
ν(W) = c
(Δ−
W \ D−
ξ (v
)) + c
(D+
ξ (v
) \ Δ+
W)
−c
(Δ+
W \ D+
ξ (v
)) − c
(D−
ξ (v
) \ Δ−
W)
+g(p + χW ) − g(p),
where Δ+
W and Δ−
W mean the sets of arcs leaving W and entering W, respec-
tively, as in (9.14) and (9.15). The following proposition states that the ﬂow value
ξ
(D+
ξ (v
))−ξ
(D−
ξ (v
)) is bounded by ν(W) for any W ⊆ V with v
∈ W and that
this bound is tight for some W, which is referred to as a minimum cut in the above.
A minimum cut can be found with the aid of an appropriately deﬁned auxiliary
network.
Proposition 10.37. In the maximum submodular ﬂow problem maxSFP, we have
max{ξ
(D+
ξ (v
)) − ξ
(D−
ξ (v
)) | (10.64),(10.65),(10.66)}
= min{ν(W) | v
∈ W ⊆ V }. (10.68)
For a maximum ﬂow ξ
and a minimum cut W, we have
∂ξ
(W) = g(p + χW ) − g(p), (10.69)
ξ
(a) = c
(a) (a ∈ (Δ+
W \ D+
ξ (v
)) ∪ (D−
ξ (v
) \ Δ−
W)), (10.70)
ξ
(a) = c
(a) (a ∈ (Δ−
W \ D−
ξ (v
)) ∪ (D+
ξ (v
) \ Δ+
W)). (10.71)
Proof. We prove this by applying Theorem 9.13 (max-ﬂow min-cut theorem) to a
maximum submodular ﬂow problem on a graph Ĝ = (V̂ ,Â), which is obtained from
G = (V,A) by a local modiﬁcation at v
illustrated in Fig. 10.1. The vertex v
in
G is split into two vertices, v
and v̂
, and a new arc a0 = (v
,v̂
) is introduced;
V̂ = V ∪{v̂
} and Â = A∪{a0}. The initial vertex of a ∈ D+
ξ (v
) is changed to v̂
and the terminal vertex of a ∈ D−
ξ (v
) is changed to v̂
. For W ⊆ V̂ we denote by
Δ̂+
W and Δ̂−
W the sets of arcs leaving and entering W, respectively, in Ĝ.
The problem maxSFP is equivalent to maximizing the ﬂow ξ
(a0) in a0 in Ĝ =
(V̂ ,Â), where the conservation of ﬂow at v̂
(i.e., ∂ξ
(v̂
) = 0) is assumed and nosidca00si
2013/2/12
page 317
10.4. Algorithms for M-Convex Submodular Flows 317
capacity constraint is imposed on a0. Note that ξ
(a0) = ξ
(D+
ξ (v
))−ξ
(D−
ξ (v
)) as
a consequence of the ﬂow conservation at v̂
. As for cuts, we note the correspondence
between W ⊆ V̂ with a0 ∈ Δ̂+
W and W ⊆ V with v
∈ W and observe the
identities
Δ̂+
W = (Δ+
W \ D+
ξ (v
)) ∪ (D−
ξ (v
) \ Δ−
W) ∪ {a0},
Δ̂−
W = (Δ−
W \ D−
ξ (v
)) ∪ (D+
ξ (v
) \ Δ+
W)
for such a W. Then we obtain (10.68) from (9.61) in Theorem 9.13. Note that
g(p + χW ) − g(p) = gp(W) in ν(W) corresponds to ρ in (9.61). Finally, (10.69),
(10.70), and (10.71) are shown in (9.62).
The condition (10.59) is maintained when (ξ,p) is modiﬁed to (ξ
,p
).
Proposition 10.38. ∂ξ
∈ B(gp) for an optimum ﬂow ξ
in maxSFP and potential
p
= p + χW with a minimum cut W.
Proof. It follows from (10.65), (10.69), and discrete midpoint convexity (7.7) that
∂ξ
(X) = ∂ξ
(X ∪ W) + ∂ξ
(X ∩ W) − ∂ξ
(W)
≤ g(p + χX∪W ) + g(p + χX∩W ) − g(p) − g(p + χW )
≤ g(p + χW + χX) − g(p + χW ) = gp (X) (X ⊆ V ).
This shows ∂ξ
∈ B(gp).
The following proposition shows the key properties for the correctness and
complexity of the primal-dual algorithm.
Proposition 10.39.
(1) The set of out-of-kilter arcs is nonincreasing.
(2) For each arc a, |γp(a)| is nonincreasing while the arc stays out of kilter.
(3) The potential is changed in at most |V | iterations and, each time the
potential is changed, the value of maxa∈Dξ(v) |γp(a)| decreases at least by one.
(4) Each time (ξ,p) is changed, the value of
N =

v

max
a∈Dξ(v)
|γp(a)|
)
)
)
)v ∈ V,Dξ(v) = ∅
A
(10.72)
decreases at least by one. Therefore, the primal-dual algorithm terminates in at
most N0 iterations, where N0 denotes the value of N at step S0.
Proof. The reader is referred to the kilter diagram in Fig. 9.1.
(1) We show that an in-kilter arc a with respect to (ξ,p) remains in kilter in
updating (ξ,p). It follows from ξ
(a) ∈ [c
(a),c
(a)] and (10.62) that a remains in
kilter with respect to (ξ
,p). Suppose that p is updated to p
= p + χW . Since
γp (a) − γp(a) =
⎧
⎨
⎩
+1 (a ∈ Δ+
W),
−1 (a ∈ Δ−
W),
0 (otherwise),
(10.73)sidca00si
2013/2/12
page 318
## 318 Chapter 10. Algorithms
we may assume that a is in kilter with respect to (ξ
,p) and (i) a ∈ Δ+
W \D+
ξ (v
)
or (ii) a ∈ Δ−
W \ D−
ξ (v
). In case (i) we have ξ
(a) = c
(a) from (10.70), whereas
γp (a) > 0 ⇒ γp(a) ≥ 0 ⇒ c
(a) = c(a),
γp (a) < 0 ⇒ γp(a) < 0 ⇒ c
(a) = ξ(a) = c(a).
In case (ii) we have ξ
(a) = c
(a) from (10.71), whereas
γp (a) > 0 ⇒ γp(a) > 0 ⇒ c
(a) = ξ(a) = c(a),
γp (a) < 0 ⇒ γp(a) ≤ 0 ⇒ c
(a) = c(a).
Thus the conditions (10.57) and (10.58) are preserved in either case.
(2) By (10.73), it suﬃces to show that, if (i) γp(a) > 0, a ∈ Δ+
W, or
(ii) γp(a) < 0, a ∈ Δ−
W, then a is in kilter with respect to (ξ
,p
). In case (i), we
have a ∈ Δ+
W \D+
ξ (v
), from which follows ξ
(a) = c
(a) = c(a) by (10.70). Since
γp(a) > 0, a is in kilter with respect to (ξ
,p
), and similarly for case (ii).
(3) If the potential does not change, we have Dξ (v
) = ∅ as well as Dξ(v) ⊆
Dξ(v) for all v ∈ V by (1). Therefore, the potential must be updated in |V |
iterations. Suppose now that p is changed to p
. An arc a ∈ D+
ξ (v
) \ Δ+
W is in
kilter with respect to (ξ
,p
), since γp (a) ≤ γp(a) < 0 and ξ
(a) = c
(a) = c(a) by
(10.71). Similarly, a ∈ D−
ξ (v
)\Δ−
W is in kilter with respect to (ξ
,p
) because of
(10.70). For a ∈ D+
ξ (v
)∩Δ+
W, we have |γp (a)| = |γp(a)|−1 from γp(a) = γp(a)+
1 and γp(a) < 0. Similarly, for a ∈ D−
ξ (v
) ∩ Δ−
W, we have |γp (a)| = |γp(a)| − 1
from γp(a) = γp(a) − 1 and γp(a) > 0. Therefore, maxa∈Dξ(v) |γp(a)| decreases at
least by one.
(4) When the potential changes, N decreases because of (3). When the po-
tential remains invariant, N decreases because of Dξ(v
) = ∅.
Primal-dual algorithms can also be designed for problems without dual inte-
grality by using real-valued potential functions.
Note 10.40. The framework of the primal-dual algorithm for MSFP1 (submodular
ﬂow problem without M-convex cost) was established in Frank [55] and Cunningham–
Frank [30]. See Fujishige [65], Fujishige–Iwata [66], and Iwata [98] for expositions.
## 10.4.5 Conjugate Scaling Algorithm
With the use of conjugate scaling of the M-convex cost function, the primal-dual
algorithm is enhanced to a polynomial-time algorithm. We continue to deal with the
M-convex submodular ﬂow problem MSFP2 with dual integrality; i.e., we assume
γ : A → Z and f ∈ M[R → R|Z].
First we explain the intuition behind the cost-scaling algorithm for the sub-
modular ﬂow problem MSFP1 without M-convex function (see section 9.2 for MSFP1).
As Proposition 10.39 (4) shows, the time complexity of the primal-dual algorithm
depends essentially on
|γp(a)| = |γ(a) + p(∂+
a) − p(∂−
a)|. (10.74)sidca00si
2013/2/12
page 319
10.4. Algorithms for M-Convex Submodular Flows 319
Motivated by this fact, we consider MSFP1 with a new objective function

a∈A

γ(a)
α

ξ(a), (10.75)
where α is a positive integer representing cost scaling and · means rounding up
to the nearest integer. It is expected (or hoped) that such a scaling will result in
smaller values of (10.74) and hence in an improvement in the computation time of
the algorithm. On the other hand, the scaled problem with (10.75) is fairly close
to the original problem, since α γ(a)/α ≃ γ(a), and, therefore, the solution to the
scaled problem is likely to be a good approximation that can be used as an initial
solution in solving the original problem by the primal-dual algorithm. The scaling
algorithm embodies the above idea by starting with a large α and successively
halving α until α = 1.
When an M-convex function f is involved, as in MSFP2, it is natural to try
a scaling of the form f(·)/α . This approach, however, does not seem to work
in general, since f(·)/α is not necessarily M-convex for an M-convex function f.
Conjugate scaling is a kind of scaling operation compatible with M-convexity.
Let f : RV
→ R∪{+∞} be a polyhedral convex function with dual integrality
in the sense that the conjugate function g = f•
has integrality (6.75). Then we have
f(x) = sup{ p,x − g(p) | p ∈ ZV
} (x ∈ RV
), (10.76)
where the supremum is taken over integer points. Replacing g(p) with gα
(p) =
g(αp)/α (p ∈ ZV
) in this expression we deﬁne
fα
(x) = sup

p,x −
1
α
g(αp)
)
)
)
)p ∈ ZV
A
(x ∈ RV
), (10.77)
which we call the conjugate scaling of f with scaling factor α ∈ Z++. Note that
fα
is again a dual-integral polyhedral convex function. It is easy to see that
fα
(x) ≤
1
α
f(x) (x ∈ RV
)
and that domRfα
= domRf provided fα
> −∞. Figure 10.2 illustrates the
conjugate scaling of a univariate function f with α = 2.
Proposition 10.41. For a dual-integral polyhedral M-convex function f ∈ M[R →
R|Z], we have fα
∈ M[R → R|Z] provided fα
> −∞.
Proof. We have f•
= g ∈ L[Z|R → R] and hence gα
∈ L[Z → R] by Theorem
7.10 (2). Therefore, fα
= (gα
)•
∈ M[R → R|Z] by (8.10).
We are now in the position to present the conjugate scaling algorithm. Initially
the algorithm ﬁnds a feasible ﬂow ξ0 and an integer-valued potential p0 satisfying
(10.59) and applies the conjugate scaling to the objective function rewritten as
Γ2(ξ) =

a∈A
γ(a)ξ(a)+f(∂ξ) =

a∈A
γp0 (a)ξ(a)+f[−p0](∂ξ) =

a∈A
γ̃(a)ξ(a)+ ˜ f(∂ξ),sidca00si
2013/2/12
page 320
## 320 Chapter 10. Algorithms
f(x)
αfα
(x)
-
x
6
−3 −2 −1 0 1 2 3
8
6
4
2
g(p)
αgα
(p
α)
-
p
6
−1 0 1 2 3 4
8
6
4
2
Figure 10.2. Conjugate scaling fα
and scaling gα
for α = 2.
where γ̃ = γp0 and ˜ f = f[−p0]. We denote the conjugate scaling of ˜ f by ˜ fα
and
put g̃ = ˜ f•
. Note that ˜ f ∈ M[R → R|Z] and
g̃(p) = g(p + p0), g̃α
(p) =
1
α
g(αp + p0) (p ∈ ZV
),
where we regard g̃ as a member of L[Z → R]. Recall the notation n = |V |.
Conjugate scaling algorithm for MSFP2 with dual integrality
S0: Find a feasible ﬂow ξ0 ∈ RA
and an integer-valued potential p0 ∈ ZV
satisfying (10.59) and deﬁne γ̃, ˜ f, and g̃ accordingly.
Set p∗
:= 0, K := maxa∈A |γ̃(a)|, α := 2log2 K
.
S1: If α < 1, then stop ((ξ,p0 + p∗
) is optimal).
S2: Find an integer vector p ∈ ZV
that minimizes g̃α
(p) − p,∂ξ subject
to 2p∗
≤ p ≤ 2p∗
+ (n − 1)1.
S3: Solve MSFP2 for (γ,f) = ( γ̃/α , ˜ fα
) by the primal-dual algorithm
starting with (ξ,p) to obtain an optimal (ξ∗
,p∗
) ∈ RA
× ZV
.
S4: Set ξ := ξ∗
and α := α/2 and go to S1.
The correctness of the algorithm is ensured by Theorem 7.18 (L-proximity theorem),
which implies that the minimizer p found in step S2 under the restriction 2p∗
≤ p ≤
2p∗
+(n−1)1 is in fact a global minimizer of g̃α
(p)− p,∂ξ . Hence, the condition
∂ξ ∈ B(g̃α
p) = argmin ˜ fα
[−p] for (10.59) is maintained.
In step S2, the minimizer p can be found by the L-convex function minimiza-
tion algorithms of section 10.3, where the number of evaluations of g̃α
is bounded
by a polynomial in n. Given f, an evaluation of g̃α
amounts to minimizing a poly-
hedral M-convex function, since g(p) = sup{ p,x −f(x) | x ∈ RV
}. If f has primalsidca00si
2013/2/12
page 321
10.4. Algorithms for M-Convex Submodular Flows 321
integrality, i.e., if f ∈ M[Z|R → R], then g(p) = sup{ p,x −f(x) | x ∈ ZV
}, which
can be computed by the algorithms in section 10.1.
In step S3, the number of iterations (updates of (ξ,p)) within the primal-dual
algorithm is bounded by n2
. Denote by pα
the value of p at the beginning of step
S3 and put p2α
= p∗
, γα
= γ̃/α , and γ2α
= γ̃/(2α) . Then we have
2γ2α
− 1 ≤ γα
≤ 2γ2α
, 2p2α
≤ pα
≤ 2p2α
+ (n − 1)1,
from which follows
)
)[γα
(a) + pα
(∂+
a) − pα
(∂−
a)] − 2[γ2α
(a) + p2α
(∂+
a) − p2α
(∂−
a)]
)
) ≤ n.
This means that at the beginning of step S3 we have
)
)γα
(a) + pα
(∂+
a) − pα
(∂−
a)
)
) ≤ n
for every out-of-kilter arc a and therefore N in (10.72) is bounded by n2
.
Obviously, steps S1 through S4 are repeated log2 K times. For the value of
K we have
K ≤ max
a∈A
|γ(a)| + max
x
max
u,v∈V
|f
(x;−χu + χv)| (10.78)
if the initial potential p0 in step S0 is computed from a shortest path on the graph
Gξ = (V,Cξ), as explained in section 10.4.4, where in the second term on the
right-hand side we consider only those x,u,v for which f
(x;−χu + χv) is ﬁnite. If
f ∈ M[Z|R → R], the second term can be bounded as
max
x
max
u,v∈V
|f
(x;−χu + χv)| ≤ 2 max
x∈domf
|f(x)|,
which implies
K ≤ max
a∈A
|γ(a)| + 2 max
x∈domf
|f(x)|. (10.79)
Bibliographical Notes
The tie-breaking rule (10.2) for M-convex function minimization, as well as Propo-
sition 10.2, is due to Murota [148]. Variants of steepest descent algorithms are re-
ported in Moriguchi–Murota–Shioura [133] with some computational results. Scal-
ing algorithms for M-convex function minimization, including the one described in
section 10.1.2, were considered ﬁrst in [133], although the proposed algorithms run
in polynomial time only for a subclass of M-convex functions that are closed un-
der scaling. A polynomial-time scaling algorithm for general M-convex functions is
given by Tamura [197]. The domain reduction algorithm in section 10.1.3 is due to
Shioura [190] and its extension to quasi M-convex functions is observed in Murota–
Shioura [154]. The domain reduction scaling algorithm in section 10.1.4, with its
extension to quasi M-convex functions, is due to Shioura [192]. Minimizing an M-
convex function on {0,1}-vectors is equivalent to maximizing a matroid valuation,
for which a greedy algorithm of Dress–Wenzel [41] works; see also section 5.2.4 of
Murota [146].sidca00si
2013/2/12
page 322
## 322 Chapter 10. Algorithms
The literature of submodular function minimization was described in Note
10.10. The algorithmic framework expounded in section 10.2.1 is due to Cun-
ningham [28], [29] as well as Bixby–Cunningham–Topkis [15]. The algorithm in
section 10.2.2 is by Schrijver [182], whereas an earlier version of this algorithm
based on partial orders associated with extreme bases (presented at the Workshop
on Polyhedral and Semideﬁnite Programming Methods in Combinatorial Optimiza-
tion, Fields Institute, November 1–6, 1999) is described in Murota [147]. The
algorithm in section 10.2.3 is due to Iwata–Fleischer–Fujishige [102]. Improvements
on those algorithms in terms of time complexity were made by Fleischer–Iwata [50]
and Iwata [100]. See McCormick [127] for a detailed survey on submodular function
minimization. Note 10.12 was communicated by K. Nagano, Note 10.14 is based on
[182], and Proposition 10.28 was communicated by S. Iwata.
Favati–Tardella [49] proposes a weakly polynomial algorithm for submodular
integrally convex function minimization. This is the ﬁrst polynomial algorithm for
L-convex function minimization, when translated through the equivalence between
submodular integrally convex functions and L
-convex functions. The steepest de-
scent algorithm for L-convex function minimization in section 10.3.1 is given in
Murota [145]. The tie-breaking rule (10.33), as well as Proposition 10.31, is due
to Murota [148]. The steepest descent scaling algorithm in section 10.3.2 is due
to S. Iwata (presented at Workshop on Matroids, Matching, and Extensions, Uni-
versity of Waterloo, December 6–11, 1999), where step S1 is performed not by the
steepest descent algorithm but by the algorithm in section 10.3.3.
The framework of M-convex submodular ﬂow problems is advanced by Murota
[142]. The successive shortest path algorithm for a feasible ﬂow described in sec-
tion 10.4.2 originates in Fujishige [59] and the present form is due to Frank [56].
The cycle-canceling algorithm of section 10.4.3 is devised in [142] as a proof of
the negative-cycle criterion for optimality (Theorem 9.20). In the special case of
valuated matroid intersection, the algorithm can be polished to a strongly polyno-
mial algorithm (Murota [136]); see also Note 10.36. The primal-dual algorithm of
section 10.4.4 is due to Iwata–Shigeno [105]; see also Note 10.40. A strongly polyno-
mial primal-dual algorithm for the valuated matroid intersection problem is given
in [136]. The conjugate scaling algorithm of section 10.4.5 is due to [105]. A scal-
ing algorithm for a subclass of the M-convex submodular ﬂow problem is given by
Moriguchi–Murota [132]. Capacity scaling algorithms for submodular ﬂow problems
(without M-convex costs) are given in Iwata [97] and Fleischer–Iwata–McCormick
[51]. For other algorithms for submodular ﬂow problems (without M-convex costs),
see the book of Fujishige [65] and surveys of Fujishige–Iwata [66] and Iwata [98].sidca00si
2013/2/12
page 323
Chapter 11
Application to
Mathematical Economics
This chapter presents an application of discrete convex analysis to a subject in
mathematical economics: competitive equilibria in economies with indivisible (or
discrete) commodities. For economies consisting of continuous commodities, repre-
sented by real-valued vectors, a rigorous mathematical framework was established
around 1960 on the basis of convexity, compactness, and ﬁxed-point theorems. For
indivisible commodities, however, no general mathematical framework seems to have
been established. Such a framework, if any, should embrace both convexity and dis-
creteness; the present theory of discrete convex analysis appears to be a promising
candidate for it. It is shown that, in an Arrow–Debreu type model of competitive
economies with indivisible commodities, an equilibrium exists under the assumption
of the M
-concavity of consumers’ utility functions and the M
-convexity of produc-
ers’ cost functions. Moreover, the equilibrium prices form an L
-convex polyhedron,
and, therefore, they have maximum and minimum elements. The conjugacy between
M-convexity and L-convexity corresponds to the relationship between commodities
and prices.
## 11.1 Economic Model with Indivisible Commodities
As an application of discrete convex analysis we deal with competitive equilibria in
economies with a number of indivisible commodities and money. Indivisible com-
modities mean commodities (goods) whose quantities are represented by integers,
such as houses, cars, and aircraft, whereas money is a real number representing the
aggregation of the markets of other commodities.
We consider an economy (of Arrow–Debreu type) with a ﬁnite set L of pro-
ducers, a ﬁnite set H of consumers, a ﬁnite set K of indivisible commodities, and
a perfectly divisible commodity called money. Productions of producers and con-
sumptions of consumers are integer-valued vectors in ZK
representing the numbers
of indivisible commodities that they produce or consume. Here producers’ out-
puts are represented by positive numbers, while negative numbers are interpreted
as inputs to them, and consumers’ inputs are represented by positive numbers,
323sidca00si
2013/2/12
page 324
## 324 Chapter 11. Application to Mathematical Economics
while negative numbers are interpreted as outputs from them. Given a price vector
p = (p(k) : k ∈ K) ∈ RK
of commodities, each producer (assumed to be male) in-
dependently schedules a production in order to maximize his proﬁt, each consumer
(assumed to be female) independently schedules a consumption to maximize her
utility under the budget constraint, and all agents exchange commodities by buy-
ing or selling them through money. An important feature of this model is that the
independent agents take the price as granted; i.e., they assume that their individual
behaviors do not aﬀect the price. Such an economy is called a competitive economy.
We assume that a producer l ∈ L is described by his cost function Cl : ZK
→
R∪{+∞}, whose value is expressed in units of money. He wishes to maximize the
proﬁt p,y − Cl(y) in determining his production y = yl ∈ ZK
. This means that
yl is chosen from the supply set
Sl(p) = arg max
y∈ZK
( p,y − Cl(y)) (p ∈ RK
), (11.1)
where the function Sl : RK
→ 2ZK
is called the supply correspondence. Accordingly,
the proﬁt function πl : RK
→ R is deﬁned by
πl(p) = max
y∈ZK
( p,y − Cl(y)) (p ∈ RK
). (11.2)
To avoid possible technical complications irrelevant to discreteness issues, we assume
that domCl is a bounded subset of ZK
for each l ∈ L. This guarantees, for instance,
that Sl(p) is nonempty for any p.
Each consumer h ∈ H has an initial endowment of indivisible commodities
and money, represented by a vector (x◦
h,m◦
h) ∈ ZK
× R+, where x◦
h(k) denotes
the number of the commodity k ∈ K and m◦
h the amount of money in her initial
endowment. Consumers share in the proﬁts of the producers. We denote by θlh the
share of the proﬁt of producer l owned by consumer h, where

h∈H
θlh = 1 (l ∈ L), θlh ≥ 0 (l ∈ L,h ∈ H). (11.3)
Thus, consumer h gains an income
βh(p) = p,x◦
h + m◦
h +

l∈L
θlhπl(p) (p ∈ RK
), (11.4)
where βh : RK
→ R, and accordingly her schedule (x,m) = (xh,mh) should belong
to her budget set
Bh(p) = {(x,m) ∈ ZK
× R+ | p,x + m ≤ βh(p)}. (11.5)
We assume that a consumer h is associated with a utility function Ūh : ZK
× R →
R ∪ {−∞} that is quasi linear in money; namely,
Ūh(x,m) = Uh(x) + m ((x,m) ∈ ZK
× R) (11.6)sidca00si
2013/2/12
page 325
11.1. Economic Model with Indivisible Commodities 325
-
6
indivisible commodities x
money m
indiﬀerence curve
(contour of utility Ūh)
Bh(p)
slope
= −p
Dh(p)
Figure 11.1. Consumer’s behavior.
with a function63
Uh : ZK
→ R∪{−∞}. Consumer h maximizes Ūh under the bud-
get constraint; that is, (x,m) = (xh,mh) is a solution to the following optimization
problem:
Maximize Uh(x) + m subject to (x,m) ∈ Bh(p)
(see Fig. 11.1). Under the assumption that domUh is bounded64
and m◦
h is suﬃ-
ciently large, we can take
mh = βh(p) − p,xh (≥ 0) (11.7)
to reduce the above problem to an unconstrained optimization problem:
Maximize Uh(x) − p,x .
This means that xh is chosen from the demand set
Dh(p) = arg max
x∈ZK
(Uh(x) − p,x ) (p ∈ RK
). (11.8)
The function Dh : RK
→ 2ZK
is called the demand correspondence.
A tuple ((xh | h ∈ H),(yl | l ∈ L),p), where xh ∈ ZK
, yl ∈ ZK
, and p ∈ RK
,
is called an equilibrium or a competitive equilibrium if
xh ∈ Dh(p) (h ∈ H), (11.9)
63In economic terminology, Uh is called the reservation value function, although we refer to it
as the utility function in this book.
64The boundedness of domUh is a natural assumption because no one can consume an inﬁ-
nite number of indivisible commodities. This assumption is also convenient for concentrating on
discreteness issues in our discussion.sidca00si
2013/2/12
page 326
## 326 Chapter 11. Application to Mathematical Economics
yl ∈ Sl(p) (l ∈ L), (11.10)

h∈H
xh =

h∈H
x◦
h +

l∈L
yl, (11.11)
p ≥ 0. (11.12)
That is, each agent achieves what he or she wishes to achieve, the balance of supply
and demand holds, and an equilibrium price vector is nonnegative. Denoting the
total initial endowment of indivisible commodities by
x◦
=

h∈H
x◦
h, (11.13)
we can rewrite the supply-demand balance (11.11) as
x◦
=

h∈H
xh −

l∈L
yl. (11.14)
On eliminating xh and yl using (11.9) and (11.10), we see that p ∈ RK
+ is an
equilibrium price if and only if
x◦
∈

h∈H
Dh(p) −

l∈L
Sl(p), (11.15)
where the right-hand side is a Minkowski sum in ZK
. It is noted that money balance

h∈H
mh =

h∈H
m◦
h −

l∈L
Cl(yl) (11.16)
is implied by (11.11) with (11.3), (11.4), (11.7), and πl(p) = p,yl − Cl(yl).
We are concerned with mathematical properties of equilibria, rather than their
economic-theoretical signiﬁcance. A most fundamental question would be as follows:
When does an equilibrium exist? Namely, the ﬁrst problem we should address is this:
Problem 1: Give a (suﬃcient) condition for the existence of an equilib-
rium in terms of utility functions Uh and cost functions Cl.
The conditions (11.9) and (11.10) for an equilibrium are given in terms of demand
correspondences Dh and supply correspondences Sl without explicit reference to
utility functions Uh and cost functions Cl. This motivates the following:
Problem 2: Give a (suﬃcient) condition for the existence of an equi-
librium in terms of demand correspondences Dh and supply correspon-
dences Sl.
When an equilibrium exists, we may be interested in its structure:
Problem 3: Investigate the structure of the set of equilibria.
A more speciﬁc problem in this category is as follows: Do the maximum and mini-
mum exist among equilibrium price vectors?
We shall answer the above problems with the use of concepts and results in
discrete convex analysis. Our answers are the following.sidca00si
2013/2/12
page 327
11.2. Diﬃculty with Indivisibility 327
(1) An equilibrium exists if Uh (h ∈ H) are M
-concave functions and Cl (l ∈ L)
are M
-convex functions (Theorems 11.13 and 11.14).
(2) An equilibrium exists if Dh(p) (h ∈ H) and Sl(p) (l ∈ L) are M
-convex sets
for each p (Theorem 11.15).
(3) The set P∗
of the equilibrium prices is an L
-convex polyhedron (Theorem
11.16). This means, in particular, that p∨q,p∧q ∈ P∗
for any p,q ∈ P∗
and
that there exist a maximum and a minimum among equilibrium prices.
As a preliminary consideration, the diﬃculty arising from indivisible com-
modities is demonstrated in section 11.2 by a simple example. In section 11.3 we
discuss the relevance of M
-concavity as an essential property of utility functions.
The results mentioned above are proved in section 11.4. Finally, in section 11.5,
we show that an equilibrium can be computed by solving an M-convex submodular
ﬂow problem.
Note 11.1. A special case of our economic model with L = ∅, where no producers
are involved, is called the exchange economy. A diﬃculty of indivisible commodities
already arises in this case, as we will see in section 11.2.
Note 11.2. Commodities that can be represented by real-valued vectors are called
divisible commodities. A framework for the rigorous mathematical treatment of
equilibria in economies of divisible commodities was established around 1960 using
convexity, compactness, and ﬁxed-point theorems as major mathematical tools. See
Debreu [37], [38], Nikaido [168], Arrow–Hahn [4], and McKenzie [128].
Note 11.3. A considerable literature already exists on equilibria in economies
with indivisible commodities. We name a few: Henry [88], 1970; Shapley–Scarf
[187], 1974; Kaneko [107], 1982; Kelso–Crawford[111], 1982; Gale [72], 1984; Quinzii
[173], 1984; Svensson [196], 1984; Wako [209], 1984; Kaneko–Yamamoto [108], 1986;
Van der Laan–Talman–Yang [204], 1997; Bikhchandani–Mamer [13], 1997; Danilov–
Koshevoy–Murota [34], 1998 (also [35], 2001); Bevia–Quinzii–Silva [12], 1999; Gul–
Stacchetti [84], 1999; and Yang [219], 2000.
## 11.2 Diﬃculty with Indivisibility
The diﬃculty in the mathematical treatment of indivisible commodities is illustrated
by a simple example. We consider an exchange economy consisting of two agents
(H = {1,2}, L = ∅) dealing in two indivisible commodities (K = {1,2}). Putting
S = {(0,0),(0,1),(1,0),(1,1)} we deﬁne the utility functions Uh for h = 1,2 in
(11.6) by
U1(x) = min(2x(1) + 2x(2),x(1) + x(2) + 1) (x = (x(1),x(2)) ∈ S),
U2(x) = min(x(1) + 2x(2),2x(1) + x(2)) (x = (x(1),x(2)) ∈ S),
where domU1 = domU2 = S (see Fig. 11.2). The demand correspondences D1 and
D2, calculated according to (11.8), are also given in Fig. 11.2. For instance, forsidca00si
2013/2/12
page 328
## 328 Chapter 11. Application to Mathematical Economics
-
x(1)
6 x(2)
Values of utility U1(x)
0
2
2
3
-
x(1)
6 x(2)
Values of utility U2(x)
0
1
1
3
-
p(1)
6 p(2)
0 1 2
0
1
2
Demand D1(p)
(1,1)
(0,1)
(1,0)
(0,0)
-
p(1)
6 p(2)
0 1 2
0
1
2
Demand D2(p)
(1,1)
(0,1)
(1,0)
(0,0)
Figure 11.2. Exchange economy with no equilibrium for x◦
= (1,1).
p = (p(1),p(2)) with 0 ≤ p(1) < 1 and 0 ≤ p(2) < 1, we have D1(p) = {(1,1)}; for
p = (1,1), we have D1(p) = {(1,1),(0,1),(1,0)} and D2(p) = {(1,1)}.
Given a total initial endowment x◦
, an equilibrium is a tuple (x1,x2,p) ∈
Z2
× Z2
× R2
+ such that
x1 ∈ D1(p), x2 ∈ D2(p), x1 + x2 = x◦
.
For x◦
= (1,2), for example, the tuple of x1 = (0,1), x2 = (1,1), p = (2,1) satisﬁes
the above conditions and hence is an equilibrium.
Another case, x◦
= (1,1), is problematic. As we have seen in (11.15), a
nonnegative vector p is an equilibrium price if and only if x◦
∈ D1(p) + D2(p).
Superposition of the diagrams for D1(p) and D2(p) in Fig. 11.2 yields a similar
diagram for the Minkowski sum D1(p) + D2(p), shown in Fig. 11.3. We see from
this diagram that no p satisﬁes (1,1) ∈ D1(p) + D2(p) and hence no equilibrium
exists for x◦
= (1,1). The diagram consists of eight regions, corresponding to the
eight points in [0,2]Z ×[0,2]Z except {(1,1)}. Hence an equilibrium exists for everysidca00si
2013/2/12
page 329
11.2. Diﬃculty with Indivisibility 329
-
p(1)
6 p(2)
0 1 2
0
1
2
(2,0) (1,0) (0,0)
(2,1) (0,1)
(2,2) (1,2) (0,2)
Figure 11.3. Minkowski sum D1(p) + D2(p).
x◦
∈ ([0,2]Z ×[0,2]Z)\{(1,1)} and not for x◦
= (1,1). Let us have a closer look at
the problematic case to better understand the discreteness inherent in the problem
and to identify the source of the diﬃculty.
In view of the established mathematical framework for divisible commodi-
ties, we consider an embedding of our discrete problem via a concave extension of
the utility functions. Denote by Û1 and Û2 the concave extensions of U1 and U2,
respectively. Obviously, domRÛ1 = domRÛ2 = S, where S = [0,1]R × [0,1]R, and
Û1(x) = min(2x(1) + 2x(2),x(1) + x(2) + 1) (x = (x(1),x(2)) ∈ S),
Û2(x) = min(x(1) + 2x(2),2x(1) + x(2)) (x = (x(1),x(2)) ∈ S).
The demand correspondences are deﬁned by
D̂h(p) = arg max
x∈RK
(Ûh(x) − p,x ) (p ∈ RK
)
for h = 1,2 and an equilibrium is a tuple (x1,x2,p) ∈ R2
× R2
× R2
+ such that
x1 ∈ D̂1(p), x2 ∈ D̂2(p), x1 + x2 = x◦
.
In our case of x◦
= (1,1), the tuple of x1 = x2 = (1/2,1/2) and p = (3/2,3/2) is
an equilibrium in this sense, but it is not qualiﬁed as an equilibrium in the original
problem of indivisible commodities, in which x1 and x2 must be integer vectors.
Thus, there is an essential discrepancy between the original discrete problem and
the derived continuous problem.
We can identify the reason for this discrepancy as the lack of convexity in
Minkowski sum discussed in section 3.3. Since D̂h(p) coincides with the convex
hull Dh(p) of Dh(p) and D1(p) + D2(p) = D1(p) + D2(p) holds by Proposition
3.17 (4), the derived continuous problem has an equilibrium if and only if x◦
∈sidca00si
2013/2/12
page 330
## 330 Chapter 11. Application to Mathematical Economics
D1(p) + D2(p). On the other hand, the original discrete problem has an equilibrium
if and only if x◦
∈ D1(p) + D2(p), as noted already. For p = (3/2,3/2), we have
D1(p) = {(0,1),(1,0)}, D2(p) = {(0,0),(1,1)}, and
D1(p) + D2(p) = {(0,1),(1,0),(1,2),(2,1)},
which has a hole at (1,1) (see Example 3.15 and Fig. 3.4). This hole is the very
reason for the nonexistence of an equilibrium for indivisible commodities.
11.3 M
-Concave Utility Functions
We demonstrate the relevance of M
-concavity to utility functions by indicating its
relationship with fundamental properties such as submodularity, the gross substi-
tutes property, and the single improvement property, discussed in the literature of
mathematical economics.
First, recall from Theorem 6.2 that we can deﬁne an M
-concave function as
a function U : ZK
→ R ∪ {−∞} with domU = ∅ satisfying the following exchange
property:
(−M
-EXC[Z]) For x,y ∈ domU and i ∈ supp+
(x − y),
U(x) + U(y) ≤ max

U(x − χi) + U(y + χi),
max
j∈supp−(x−y)
{U(x − χi + χj) + U(y + χi − χj)}

, (11.17)
where χi is the ith unit vector and a maximum taken over an empty set is deﬁned
to be −∞. A more compact expression of this exchange property is
min
i∈supp+(x−y)
max
j∈supp−(x−y)∪{0}
[ΔU(x;j,i) + ΔU(y;i,j)] ≥ 0, (11.18)
where χ0 is the zero vector, ΔU(x;j,i) = U(x − χi + χj) − U(x) as in (6.2),
ΔU(x;0,i) = U(x − χi) − U(x), and ΔU(y;i,0) = U(y + χi) − U(y).
All the results established in the previous chapters for M
-convex functions
can obviously be rephrased for M
-concave functions. In particular, an M
-concave
function U has the following properties (reformulations of Theorems 6.42, 6.19, 6.26,
and 6.24, Propositions 6.33 and 6.35, and Theorem 6.30).
• Concave extensibility: The concave closure Û of U satisﬁes
Û(x) = U(x) (x ∈ ZK
).
• Submodularity:
U(x) + U(y) ≥ U(x ∨ y) + U(x ∧ y) (x,y ∈ ZK
). (11.19)
Utility functions are usually assumed to have decreasing marginal returns, a
property that corresponds to submodularity in the discrete case.sidca00si
2013/2/12
page 331
11.3. M
-Concave Utility Functions 331
• Local characterization of global maximality: For x ∈ domU,
U(x) ≥ U(y) (∀y ∈ ZK
) ⇐⇒

U(x) ≥ U(x − χi + χj) (∀i,j ∈ K),
U(x) ≥ U(x ± χj) (∀j ∈ K).
• (−M
-SI[Z]): For p ∈ RK
and x,y ∈ ZK
with −∞ < U[−p](x) < U[−p](y),
U[−p](x) < max
i∈supp+(x−y)∪{0}
max
j∈supp−(x−y)∪{0}
U[−p](x − χi + χj). (11.20)
This says that special ascent directions work for increasing a utility function.
• (−M
-GS[Z]): If x ∈ argmaxU[−p+p01], p ≤ q, p0 ≤ q0, and argmaxU[−q+
q01] = ∅, there exists y ∈ argmaxU[−q + q01] such that
(i) y(i) ≥ x(i) for every i ∈ K with p(i) = q(i) and
(ii) y(K) ≤ x(K) if p0 = q0.
This is a version of the gross substitutes property. Recall the brief discussion
on the gross substitutes property at the beginning of section 6.8.
• (−M
-SWGS[Z]): For x ∈ argminU[−p], p ∈ RK
, and i ∈ K, at least one of
(i) and (ii) holds true:
(i) x ∈ argmaxU[−p − αχi] for any α ≥ 0,
(ii) there exist α ≥ 0 and y ∈ argmaxU[−p−αχi] such that y(i) = x(i) −1
and y(j) ≥ x(j) for all j ∈ K \ {i}.
This is another version of the gross substitutes property, called the stepwise
gross substitutes property.
• M
-convexity of maximizers: For every p ∈ RK
, argmaxU[−p] is an M
-
convex set.
The properties above are essential features of M
-concave functions and, in
fact, the last four characterize M
-concavity, as follows (reformulations of Theorems
6.24, 6.34, 6.36, and 6.30). Note that submodularity and concave extensibility (even
together) do not imply M
-concavity.
Theorem 11.4. For a function U : ZK
→ R ∪ {−∞} with a nonempty eﬀective
domain,
U is an M
-concave function ⇐⇒ U satisﬁes (−M
-SI[Z]).
Theorem 11.5. For a concave-extensible function U : ZK
→ R ∪ {−∞} with a
bounded nonempty eﬀective domain,
U is M
-concave ⇐⇒ U satisﬁes (−M
-GS[Z]).
Theorem 11.6. For a concave-extensible function U : ZK
→ R ∪ {−∞} with a
nonempty eﬀective domain,
U is M
-concave ⇐⇒ U satisﬁes (−M
-SWGS[Z]).sidca00si
2013/2/12
page 332
## 332 Chapter 11. Application to Mathematical Economics
Theorem 11.7. For a function U : ZK
→ R ∪ {−∞} with a bounded nonempty
eﬀective domain,
U is M
-concave ⇐⇒ argmaxU[−p] is an M
-convex set for each p ∈ RK
.
Let us consider the special case of set functions to discuss the relationship of
the above theorems to the results of Kelso–Crawford [111] and Gul–Stacchetti [84].
The gross substitutes property was deﬁned originally for a set function Ũ : 2K
→ R
in [111]. It reads as follows:
(GS) If X ∈ argmaxŨ[−p] and p ≤ q, there exists Y ∈ argmaxŨ[−q]
such that {i ∈ X | p(i) = q(i)} ⊆ Y ,
where
Ũ[−p](X) = Ũ(X) −

i∈X
p(i) (X ⊆ K).
Two novel properties introduce are introduced in [84]; i.e., the single improvement
property:
(SI) For any p ∈ RK
, if X / ∈ argmaxŨ[−p], there exists Y ⊆ K such
that |X \ Y | ≤ 1, |Y \ X| ≤ 1, and Ũ[−p](X) < Ũ[−p](Y ),
and the no complementarities property:
(NC) For any p ∈ RK
, if X,Y ∈ argmaxŨ[−p] and I ⊆ X \ Y , there
exists J ⊆ Y \ X such that (X \ I) ∪ J ∈ argmaxŨ[−p].
It is pointed out in [84] that these three properties are equivalent:65
(GS) ⇐⇒ (SI) ⇐⇒ (NC), (11.21)
for a set function Ũ. It is also observed that (NC) is implied by the strong no
complementarities property:
(SNC) For X,Y ⊆ K and I ⊆ X \Y , there exists J ⊆ Y \X such that
Ũ(X) + Ũ(Y ) ≤ Ũ((X \ I) ∪ J) + Ũ((Y \ J) ∪ I).
To derive these results from our previous theorems, we identify a set function
Ũ : 2K
→ R with a function U : ZK
→ R ∪ {−∞}, where domU = {0,1}K
, by
Ũ(X) = U(χX) (X ⊆ K).
When translated for U, the properties (GS) and (SI) for Ũ may be written respec-
tively as follows:
65To be precise, this equivalence is shown in [84] for a monotone nondecreasing Ũ, where p and
q can be restricted to nonnegative vectors.sidca00si
2013/2/12
page 333
11.3. M
-Concave Utility Functions 333
(−M
-GSw[Z]) If x ∈ argmaxU[−p] and p ≤ q, there exists y ∈
argmaxU[−q] such that y(i) ≥ x(i) for every i ∈ K with p(i) = q(i).
(−M
-SIw[Z]) For p ∈ RK
and x ∈ domU \ argmaxU[−p],
U[−p](x) < max
i∈K∪{0}
max
j∈K∪{0}
U[−p](x − χi + χj).
Obviously, we have (−M
-GS[Z]) ⇒ (−M
-GSw[Z]) and (−M
-SI[Z]) ⇒ (−M
-
SIw[Z]) and it can be shown (see Murota–Tamura [160]) that the converses are also
true if domU = {0,1}K
. It follows from this and Theorems 11.4 and 11.5 that
(SI) for Ũ ⇐⇒ M
-concavity for U ⇐⇒ (GS) for Ũ.
On the other hand, we see
(NC) for Ũ ⇐⇒ ∀p ∈ RK
: argmaxU[−p] is an M
-convex set
⇐⇒ M
-concavity for U
from the multiple exchange axiom for a matroid (see Theorem 4.3.1 in Kung [117])
and Theorem 11.7. Thus, the three conditions (GS), (SI), and (NC) for Ũ are all
equivalent to the M
-concavity of U. Obviously, the special case of (SNC) with
|I| = 1 coincides with the exchange axiom (−M
-EXC[Z]) for U and, therefore,
(SNC) for Ũ =⇒ M
-concavity for U.
Finally, we mention that the submodularity (11.19) of U is equivalent to the sub-
modularity of Ũ:
Ũ(X) + Ũ(Y ) ≥ Ũ(X ∪ Y ) + Ũ(X ∩ Y ) (X,Y ⊆ K).
Note 11.8. Utility functions are to be maximized by consumers. As is discussed
in Note 10.16, however, maximizing a general submodular set function is compu-
tationally intractable. M
-concave utility functions form a subclass of submodular
functions that can be maximized eﬃciently.
Note 11.9. We mention here some examples of M
-concave utility functions treated
explicitly or implicitly in the literature of indivisible commodities. See also the
examples of M
-convex functions shown in section 6.3.
(1) A separable concave function
U(x) =

i∈K
ui(x(i)) (x = (x(i) | i ∈ K) ∈ ZK
)
deﬁned in terms of a family of univariate discrete concave functions (ui | i ∈ K)
(i.e., −ui ∈ C[Z → R]) is an M
-concave function (see (6.31)).sidca00si
2013/2/12
page 334
## 334 Chapter 11. Application to Mathematical Economics
(2) A quasi-separable concave function
U(x) =

i∈K
ui(x(i)) + u0
8

i∈K
x(i)
9
(x = (x(i) | i ∈ K) ∈ ZK
)
deﬁned in terms of a family of univariate discrete concave functions (ui | i ∈ K∪{0})
(i.e., −ui ∈ C[Z → R]) is an M
-concave function (see (6.32)).
(3) Given a vector (ai | i ∈ K) ∈ RK
, we denote by Ũ(X) the maximum value
of ai with index i belonging to X ⊆ K. More formally, choosing a∗ ∈ R ∪ {−∞}
with a∗ ≤ mini∈K ai, we deﬁne a set function Ũ : 2K
→ R ∪ {−∞} by
Ũ(X) =

max{ai | i ∈ X} (X = ∅),
a∗ (X = ∅).
Identifying X with its characteristic vector χX and imposing monotonicity, we
obtain a function U : ZK
→ R ∪ {−∞} given by
U(x) =
⎧
⎨
⎩
max{ai | i ∈ supp+
(x)} (x ∈ ZK
+ \ {0}),
a∗ (x = 0),
−∞ (otherwise).
This is an M
-concave function. The function Ũ represents a unit demand prefer-
ence.
## 11.4 Existence of Equilibria
We prove the existence of equilibria by establishing two statements: (i) an equilib-
rium price can be characterized as a nonnegative subgradient of the aggregate cost
function and (ii) under the assumption of M
-convexity/concavity of individual cost
functions and utility functions, the aggregate cost function is an M
-convex function
for which the subdiﬀerential is nonempty.
## 11.4.1 General Case
The conditions xh ∈ Dh(p) and yl ∈ Sl(p) in (11.9) and (11.10) can be rewritten
by (3.30) as
p ∈ ∂
RUh(xh) (h ∈ H), p ∈ ∂RCl(yl) (l ∈ L), (11.22)
using the notations for subdiﬀerentials deﬁned in (8.19) and (6.86). Hence, p ∈ RK
+
is an equilibrium price if and only if it satisﬁes (11.22) for some xh ∈ domUh
(h ∈ H) and yl ∈ domCl (l ∈ L) meeting the supply-demand balance (11.14) for
the given total initial endowment x◦
. Furthermore, if ((xh | h ∈ H),(yl | l ∈ L),p)
is an equilibrium, the set P∗
(x◦
) of all equilibrium prices for x◦
is expressed as
P∗
(x◦
) =
8
2
h∈H
∂
RUh(xh)
9
∩
8
2
l∈L
∂RCl(yl)
9
∩ RK
+ . (11.23)sidca00si
2013/2/12
page 335
11.4. Existence of Equilibria 335
In particular, the right-hand side of this expression is independent of the choice of
an equilibrium allocation ((xh | h ∈ H),(yl | l ∈ L)).
We deﬁne the aggregate cost function Ψ : ZK
→ R ∪ {+∞} by
Ψ(z) = inf
(

l∈L
Cl(yl) −

h∈H
Uh(xh)
)
)
)
)
)

h∈H
xh −

l∈L
yl = z
*
(z ∈ ZK
). (11.24)
This is the integer inﬁmal convolution (6.43) of producers’ cost functions and the
negatives of consumers’ utility functions. Owing to our assumptions that
• domUh is bounded for each h ∈ H, and
• domCl is bounded for each l ∈ L,
the inﬁmum in (11.24) is attained for each z in
domΨ =

h∈H
domUh −

l∈L
domCl, (11.25)
where the right-hand side is a Minkowski sum in ZK
(see (6.44)).
Proposition 11.10. For a total initial endowment x◦
, the following statements
hold true under the boundedness assumption on domUh for h ∈ H and domCl for
l ∈ L.
(1) There exists an equilibrium if and only if x◦
∈ domΨ and (−∂RΨ(x◦
)) ∩
RK
+ = ∅.
(2) P∗
(x◦
) = (−∂RΨ(x◦
)) ∩ RK
+ .
(3) If ((xh | h ∈ H),(yl | l ∈ L)) satisﬁes (11.9), (11.10), and (11.14) for some
p (not necessarily nonnegative), then
−∂RΨ(x◦
) =
8
2
h∈H
∂
RUh(xh)
9
∩
8
2
l∈L
∂RCl(yl)
9
(11.26)
and ((xh | h ∈ H),(yl | l ∈ L),p
) is an equilibrium for any p
∈ (−∂RΨ(x◦
))∩RK
+ .
Proof. Deﬁnition (11.24) can be rewritten as
Ψ(z) = inf
(

l∈L
(Cl(yl) − p,yl ) −

h∈H
(Uh(xh) − p,xh )
)
)
)
)
)

h∈H
xh −

l∈L
yl = z
*
− p,z , (11.27)
which shows
Ψ[p](z) = inf
(

l∈L
Cl[−p](yl) −

h∈H
Uh[−p](xh)
)
)
)
)
)

h∈H
xh −

l∈L
yl = z
*
. (11.28)
Therefore, we have
inf
z
Ψ[p](z) =

l∈L
inf
yl
Cl[−p](yl) −

h∈H
sup
xh
Uh[−p](xh). (11.29)sidca00si
2013/2/12
page 336
## 336 Chapter 11. Application to Mathematical Economics
Ψ
-
x(1)
6 x(2)
0
−2
−3
−2
−3
−5
−3
−5
−6
Ψ
-
x(1)
6 x(2)
0
−2
−3
−2
−3.5
−5
−3
−5
−6
Figure 11.4. Aggregate cost function Ψ and its convex closure Ψ for an
exchange economy with no equilibrium.
If ((xh | h ∈ H),(yl | l ∈ L),p) is an equilibrium, we have xh ∈ argmaxUh[−p]
(h ∈ H), yl ∈ argminCl[−p] (l ∈ L), and (11.14), from which follows
Ψ[p](x◦
) =

l∈L
Cl[−p](yl) −

h∈H
Uh[−p](xh) = inf Ψ[p]. (11.30)
Since p ∈ RK
+ , we have p ∈ (−∂RΨ(x◦
)) ∩ RK
+ .
Conversely, for p ∈ (−∂RΨ(x◦
)) ∩ RK
+ , we have Ψ[p](x◦
) = inf Ψ[p]. Let
(xh | h ∈ H) and (yl | l ∈ L) be vectors that attain the minimum on the right-hand
side of (11.28) for z = x◦
. Then we have (11.30) and hence xh ∈ argmaxUh[−p]
(h ∈ H) and yl ∈ argminCl[−p] (l ∈ L) by (11.29). This means that ((xh | h ∈
H),(yl | l ∈ L),p) is an equilibrium. The expression (11.26) follows from the above
argument.
Proposition 11.10 suggests that if a diﬃculty in the discreteness of indivisible
commodities exists, it should be reﬂected in the emptiness of the subdiﬀerential
∂RΨ(x◦
).
Example 11.11. Let us investigate the previous example (section 11.2) of an
exchange economy with no equilibrium. The aggregate cost function Ψ takes the
values shown in Fig. 11.4 (left), where domΨ = [0,2]Z ×[0,2]Z. The convex closure
Ψ of Ψ is given on the right of Fig. 11.4. Since Ψ(1,1) = Ψ(1,1), ∂RΨ(1,1) is empty
and, by Proposition 11.10, no equilibrium exists for x◦
= (1,1). For x◦
= (1,2), on
the other hand, p = (2,1) is an equilibrium price since (2,1) ∈ (−∂RΨ(x◦
)) ∩ R2
+.sidca00si
2013/2/12
page 337
11.4. Existence of Equilibria 337
11.4.2 M
-Convex Case
The M
-concavity of utility functions and the M
-convexity of cost functions are
key to the existence of equilibria, as well as to a desirable structure of equilibrium
prices.
In Proposition 11.10 we saw that the existence of an equilibrium is almost
equivalent to the existence of a subgradient of Ψ. The latter is guaranteed under
M
-concavity/convexity as follows.
Proposition 11.12. Let Uh (h ∈ H) be M
-concave functions with domUh bounded
and Cl (l ∈ L) be M
-convex functions with domCl bounded. Then Ψ is an M
-
convex function and ∂RΨ(x◦
) = ∅ for any x◦
∈ domΨ.
Proof. By the assumption, Ψ is an inﬁmal convolution of M
-convex functions,
which is M
-convex by Theorem 6.15. The second claim follows from Theorem
6.61 (2).
We shall present three theorems on the existence of equilibria. The ﬁrst is for
an exchange economy (with L = ∅).
Theorem 11.13. Consider an exchange economy with agents indexed by H and
suppose that Uh (h ∈ H) are nondecreasing M
-concave functions with domUh
bounded. Then there exists an equilibrium ((xh | h ∈ H),p) for every x◦
∈
h∈H domUh.
Proof. We use Proposition 11.10. Since ∂RΨ(x◦
) = ∅ by Proposition 11.12, it
suﬃces to show the nonnegativity of (any) p ∈ −∂RΨ(x◦
). The function U(z) =
−Ψ(z) is nondecreasing and
U(z) − U(x◦
) ≤ p,z − p,x◦
(∀z ∈ ZK
).
Putting z = x◦
+ αχi and letting α → +∞, we see that p(i) ≥ 0.
We next consider the existence of equilibria in the general case with consumers
and producers. To separate discreteness issues from topological ones, we consider
an embedding of our discrete model in a continuous space, just as we have done for
the simple exchange economy in section 11.2.
Utility functions Uh, being M
-concave, are extensible to concave functions
Ûh : RK
→ R∪{−∞}. Similarly, cost functions Cl, being M
-convex, are extensible
to convex functions Ĉl : RK
→ R ∪ {+∞}. Then demand correspondences D̂h for
h ∈ H and supply correspondences Ŝl for l ∈ L are deﬁned, respectively, as
D̂h(p) = arg max
x∈RK
(Ûh(x) − p,x ) (p ∈ RK
), (11.31)
Ŝl(p) = arg max
y∈RK
( p,y − Ĉl(y)) (p ∈ RK
). (11.32)
Note that D̂h(p) and Ŝl(p) coincide respectively with the convex hulls Dh(p) and
Sl(p) of Dh(p) and Sl(p). We deﬁne an equilibrium in the continuous model as asidca00si
2013/2/12
page 338
## 338 Chapter 11. Application to Mathematical Economics
tuple ((xh | h ∈ H),(yl | l ∈ L),p) of xh ∈ RK
, yl ∈ RK
, and p ∈ RK
+ satisfying
xh ∈ D̂h(p) (h ∈ H), (11.33)
yl ∈ Ŝl(p) (l ∈ L), (11.34)
as well as the supply-demand balance (11.14) and the price nonnegativity (11.12).
The following theorems state that the existence of an equilibrium in the con-
tinuous model implies that of an equilibrium for indivisible commodities under
our assumption of M
-concavity/convexity. We emphasize here that this is by no
means a general phenomenon, as we have seen in section 11.2, but is peculiar to M
-
concavity/convexity. For topological issues, the reader is referred to the literature
in economics indicated in Note 11.2.
Theorem 11.14. Suppose that utility functions Uh (h ∈ H) are M
-concave and
cost functions Cl (l ∈ L) are M
-convex. If the derived continuous economy has
an equilibrium satisfying (11.33), (11.34), (11.14), and (11.12) for a total initial
endowment x◦
∈ ZK
+ , there exists an equilibrium of indivisible commodities for x◦
satisfying (11.9), (11.10), (11.14), and (11.12).
Proof. By Theorem 11.7, Dh(p) and Sl(p) are M
-convex sets if they are not empty.
Hence, the claim follows from Theorem 11.15 below.
Theorem 11.15. Suppose that, for each p ∈ RK
+ , demand sets Dh(p) (h ∈ H) and
supply sets Sl(p) (l ∈ L) are M
-convex if they are not empty. If the derived contin-
uous economy has an equilibrium satisfying (11.33), (11.34), (11.14), and (11.12)
for a total initial endowment x◦
∈ ZK
+ , there exists an equilibrium of indivisible
commodities for x◦
satisfying (11.9), (11.10), (11.14), and (11.12).
Proof. For an equilibrium price p ∈ RK
+ in the continuous model, we have
x◦
∈

h∈H
D̂h(p) −

l∈L
Ŝl(p).
On noting D̂h(p) = Dh(p) and Ŝl(p) = Sl(p), as well as Theorem 4.12 and Propo-
sition 3.17 (4), we see

h∈H
D̂h(p) −

l∈L
Ŝl(p) =

h∈H
Dh(p) −

l∈L
Sl(p) =

h∈H
Dh(p) −

l∈L
Sl(p).
By Theorem 4.23 (3), on the other hand, h∈H Dh(p)− l∈L Sl(p) is an M
-convex
set, which is hole free by Theorem 4.12. Hence follows
x◦
∈
8

h∈H
Dh(p) −

l∈L
Sl(p)
9
∩ ZK
=

h∈H
Dh(p) −

l∈L
Sl(p),
which shows (11.15).sidca00si
2013/2/12
page 339
11.4. Existence of Equilibria 339
Finally we consider the structure of equilibrium prices.
Theorem 11.16. Suppose that utility functions Uh (h ∈ H) are M
-concave and
cost functions Cl (l ∈ L) are M
-convex and that there exists an equilibrium for
a total initial endowment x◦
. Then the set P∗
(x◦
) of all the equilibrium price
vectors is an L
-convex polyhedron. This means, in particular, that p,q ∈ P∗
(x◦
)
⇒ p∨q, p∧q ∈ P∗
(x◦
), which implies the existence of the smallest and the largest
equilibrium price vectors.
Proof. The subdiﬀerentials ∂
RUh(xh) (h ∈ H) and ∂RCl(yl) (l ∈ L) in (11.23)
are L
-convex polyhedra by Theorem 6.61 (2). Since RK
+ is L
-convex and the
intersection of L
-convex polyhedra is L
-convex, P∗
(x◦
) is an L
-convex poly-
hedron.
As we have seen in the above, we have the correspondence
commodity ←→ M
-convex, price ←→ L
-convex.
Note 11.17. Inspection of the proof of Theorem 11.15 shows that it relies solely
on the following two properties of M
-convex sets: (i) M
-convex sets are hole free
and (ii) Minkowski sums of M
-convex sets are M
-convex sets. This suggests a
generalization of Theorem 11.15 for a class F of sets of integer points such that (i)
S ∈ F, x ∈ ZK
⇒ S = S ∩ ZK
, x − S ∈ F, and (ii) S1,S2 ∈ F ⇒ S1 + S2 ∈ F
(cf. Proposition 3.16). Namely, if Dh(p) ∈ F (h ∈ H) and Sl(p) ∈ F (l ∈ L) for
each p ∈ RK
+ , where we assume ∅ ∈ F, and if the derived continuous economy has
an equilibrium, then there exists an equilibrium for indivisible commodities.
Note 11.18. In an exchange economy with two agents, an equilibrium exists under
the L
-concavity of utility functions or the L
-convexity of demand sets.
(1) If the utility functions U1 and U2 are nondecreasing L
-concave functions,
an equilibrium exists for any x◦
∈ domU1 + domU2 (cf. Theorem 11.13).
(2) Suppose that the utility functions U1 and U2 are L
-concave. If the derived
continuous economy has an equilibrium for x◦
∈ ZK
+ , there exists an equilibrium
for indivisible commodities (cf. Theorem 11.14).
(3) Suppose that, for each p ∈ RK
+ , the demand sets D1(p) and D2(p) are L
-
convex if they are not empty. If the derived continuous economy has an equilibrium
for x◦
∈ ZK
+ , there exists an equilibrium for indivisible commodities (cf. Theorem
11.15).
Proof: (1) In the proof of Theorem 11.13, Ψ is an L
2-convex function and,
therefore, ∂RΨ(x◦
) = ∅ by Theorem 8.45.
(2) In the proof of Theorem 11.14, D1(p) and D2(p) are L
-convex or empty.
Hence the claim follows from (3) by Proposition 7.16.
(3) This follows from the proof of Theorem 11.15 by virtue of the convexity
in Minkowski sum for L
-convex sets (Theorem 5.8).sidca00si
2013/2/12
page 340
## 340 Chapter 11. Application to Mathematical Economics
## 11.5 Computation of Equilibria
In this section we show an algorithmic procedure to compute an equilibrium in the
case where Cl are M
-convex and Uh are M
-concave. We use the framework of the
M-convex submodular ﬂow problem MSFP2, introduced in section 9.2. The solution
to this problem yields consumptions and productions satisfying (11.9), (11.10), and
(11.14), as well as a price vector, which, however, may not be nonnegative. This
constitutes the ﬁrst phase of our algorithm. The second phase ﬁnds an equilibrium
price vector by solving a shortest path problem. We can modify the second phase
so that we can ﬁnd the smallest or the largest equilibrium price vector.
For an M
-convex cost function Cl : ZK
→ R ∪ {+∞}, we deﬁne the corre-
sponding M-convex function C̃l : Z{0}∪K
→ R ∪ {+∞} by
C̃l(y0,y) =

Cl(y) if y0 = −y(K),
+∞ otherwise,
compatibly with (6.4). We also deﬁne the M-concave function Ũh : Z{0}∪K
→
R ∪ {−∞} associated with Uh : ZK
→ R ∪ {−∞} by
Ũh(x0,x) =

Uh(x) if x0 = −x(K),
−∞ otherwise.
In accordance with (11.24), we consider the aggregate cost function
Ψ̃(z̃) = inf
(

l∈L
C̃l(ỹl) −

h∈H
Ũh(x̃h)
)
)
)
)
)

h∈H
x̃h −

l∈L
ỹl = z̃
*
(z̃ ∈ Z{0}∪K
).
Obviously, we have
Ψ̃(z0,z) =

Ψ(z) if z0 = −z(K),
+∞ otherwise
for the aggregate cost function Ψ deﬁned in (11.24). For the total initial endowment
x◦
∈ ZK
, we put x̃◦
= (−x◦
(K),x◦
) ∈ Z{0}∪K
.
The function Ψ̃, being an integer inﬁmal convolution of M-convex functions,
is also M-convex and can be evaluated by solving an MSFP2 (see Note 9.30). A
concrete description is given below.
The instance of MSFP2 for the evaluation of Ψ̃(x̃◦
) is deﬁned on a directed
bipartite graph G = (V +
,V −
,A) with vertex partition (V +
,V −
) and arc set A
given by
V +
= V +
e ∪
8
:
l∈L
V +
l
9
, V −
=
:
h∈H
V −
h ,
V +
e = {k+
e | k ∈ {0} ∪ K},
V +
l = {k+
l | k ∈ {0} ∪ K} (l ∈ L),
V −
h = {k−
h | k ∈ {0} ∪ K} (h ∈ H),
A = {(k+
l ,k−
h ) | l ∈ L,h ∈ H,k ∈ {0}∪K} ∪ {(k+
e ,k−
h ) | h ∈ H,k ∈ {0}∪K}.sidca00si
2013/2/12
page 341
11.5. Computation of Equilibria 341
j z j z j z ? j ? j ? j ?  ?  ? 
0+
e 1+
e 2+
e 0+
A 1+
A 2+
A 0+
B 1+
B 2+
B
0−
α 1−
α 2−
α 0−
β 1−
β 2−
β
B CD E
V +
e
B CD E
V +
A
B CD E
V +
B
D EB C
V −
α
D EB C
V −
β
Figure 11.5. Graph for computing a competitive equilibrium.
Note that V +
e , V +
l , and V −
h are copies of {0}∪K. Figure 11.5 illustrates the graph G
for H = {α,β}, L = {A,B}, and K = {1,2}. For each arc a ∈ A, we put c(a) = −∞,
c(a) = +∞, and γ(a) = 0. Using the indicator function δ{x̃◦} : ZV +
e → {0,+∞} of
{x̃◦
}, we deﬁne a function f : ZV +
∪V −
→ R ∪ {+∞} by
f(w̃,(ỹl | l ∈ L),(x̃h | h ∈ H)) = δ{x̃◦}(w̃) +

l∈L
C̃l(ỹl) −

h∈H
Ũh(−x̃h),
where w̃ ∈ ZV +
e , ỹl ∈ ZV +
l for l ∈ L, and x̃h ∈ ZV −
h for h ∈ H. The function f is
M-convex, since C̃l (l ∈ L) are M-convex and Ũh (h ∈ H) are M-concave. This is
the instance of the MSFP2 that we use for the computation of Ψ̃(x̃◦
).
The optimal ﬂow and the optimal potential for the MSFP2 above give the
allocation and the price vector in the equilibrium, as is stated later in Theorem
11.20. The following proposition is a lemma for it.
Proposition 11.19. Let ξ ∈ ZA
be an optimal ﬂow and p̄ ∈ RV +
∪V −
be an optimal
potential for the above instance of MSFP2. Deﬁne66
x̃∗
h = −∂ξ|V −
h
(h ∈ H), ỹ∗
l = ∂ξ|V +
l
(l ∈ L), w̃∗
= ∂ξ|V +
e
, p̃ = p̄|V +
e
and regard x̃∗
h, ỹ∗
l , w̃∗
, and p̃ as vectors on {0} ∪ K.
(1) w̃∗
= x̃◦
, x̃∗
h(0) = −x̃∗
h(K) for h ∈ H, and ỹ∗
l (0) = −ỹ∗
l (K) for l ∈ L.
(2) x̃◦
+ l∈L ỹ∗
l = h∈H x̃∗
h.
(3) p̄(k−
h ) = p̄(k+
l ) = p̄(k+
e ) for k ∈ {0} ∪ K, h ∈ H, and l ∈ L.
(4) x̃∗
h ∈ argmaxŨh[−p̃] for h ∈ H and ỹ∗
l ∈ argminC̃l[−p̃] for l ∈ L.
Proof. (1) is obvious from the deﬁnitions of C̃l, Ũh, and δ{x̃◦}. By the structure
of G, for each k ∈ {0} ∪ K, we have
w̃∗
(k) +

l∈L
ỹ∗
l (k) =

h∈H
ξ(k+
e ,k−
h ) +

l∈L

h∈H
ξ(k+
l ,k−
h )
66The notation −∂ξ|V −
h
designates the restriction of −∂ξ to V −
h
. Hence x̃∗
h = −∂ξ|V −
h
means
x̃∗
h
(k) = −∂ξ(k) for k ∈ V −
h
.sidca00si
2013/2/12
page 342
## 342 Chapter 11. Application to Mathematical Economics
=

h∈H
+
ξ(k+
e ,k−
h ) +

l∈L
ξ(k+
l ,k−
h )
,
=

h∈H
x̃∗
h(k).
This means (2), since w̃∗
= x̃◦
by (1). Since γ(a) = 0, c(a) = −∞, and c(a) = +∞
for any a ∈ A, condition (i) of (POT) of Theorem 9.16 implies p̄(∂+
a)−p̄(∂−
a) = 0
for all a ∈ A. This implies (3). It follows from (3) that
minf[−p̄] = min
(
δ{x̃◦}[−p̃](w̃) +

l∈L
C̃l[−p̃](ỹl) −

h∈H
Ũh[−p̃](−x̃h)
*
=

l∈L
min
ỹ
C̃l[−p̃](ỹ) −

h∈H
max
x̃
Ũh[−p̃](x̃) − p̃,x̃◦
(11.35)
= minΨ̃[p̃] − p̃,x̃◦
. (11.36)
We also have
f[−p̄](∂ξ) =

l∈L
C̃l[−p̃](ỹ∗
l ) −

h∈H
Ũh[−p̃](x̃∗
h) − p̃,x̃◦
. (11.37)
Then (4) follows from (ii) of (POT) in Theorem 9.16, (11.35), and (11.37).
The following theorem, an immediate consequence of Proposition 11.19, shows
that consumptions and productions satisfying (11.9), (11.10), and (11.14) can be
obtained from a solution to the above instance of MSFP2 and that, if the optimal
potential is nonnegative, then it serves as an equilibrium price vector.
Theorem 11.20. Let ξ ∈ ZA
be an optimal ﬂow and p̄ ∈ RV +
∪V −
be an optimal
potential with p̄(0+
e ) = 0 for the above instance of MSFP2. Deﬁne
x∗
h = −∂ξ|V −
h
\{0−
h
} (h ∈ H), y∗
l = ∂ξ|V +
l
\{0+
l
} (l ∈ L), p = p̄|V +
e \{0+
e }
and regard x∗
h, y∗
l , and p as vectors on K. Then we have
x◦
+

l∈L
y∗
l =

h∈H
x∗
h, x∗
h ∈ argmaxUh[−p] (h ∈ H), y∗
l ∈ argminCl[−p] (l ∈ L).
Therefore, ((x∗
h | h ∈ H),(y∗
l | l ∈ L),p) is an equilibrium if p ≥ 0. Moreover, if
there exists an equilibrium at all, then ((x∗
h | h ∈ H),(y∗
l | l ∈ L)) is the consump-
tions and productions of some equilibrium.
Any algorithm for the MSFP2 will ﬁnd a tuple ((x∗
h | h ∈ H),(y∗
l | l ∈ L),p),
which gives an equilibrium for the total initial endowment x◦
if the optimal potential
p happens to be nonnegative. We go on to consider the set of all nonnegative optimal
potentials or, equivalently, the set of all equilibrium price vectors. We already know
from Theorem 11.16 that the set is an L
-convex polyhedron, and our objective here
is to derive a concrete description in terms of a linear inequality system. With this
knowledge, the existence of an equilibrium price vector can be checked by solvingsidca00si
2013/2/12
page 343
11.5. Computation of Equilibria 343
a linear programming problem, which can be reduced to the dual of a single-source
shortest path problem.
Recall from (11.23) that the set P∗
(x◦
) of all equilibrium price vectors for x◦
is expressed as
P∗
(x◦
) =
8
2
h∈H
∂
RUh(x∗
h)
9
∩
8
2
l∈L
∂RCl(y∗
l )
9
∩ RK
+ ,
in which we have
p ∈ ∂
RUh(x∗
h) ⇐⇒ x∗
h ∈ argmaxUh[−p],
p ∈ ∂RCl(y∗
l ) ⇐⇒ y∗
l ∈ argminCl[−p]
by (3.30). By Theorem 6.26 (2) (M-optimality criterion), we have y∗
l ∈ argminCl[−p]
if and only if

Cl(y∗
l ) − Cl(y∗
l − χj) ≤ p(j) ≤ Cl(y∗
l + χj) − Cl(y∗
l ) (j ∈ K),
p(j) − p(i) ≤ Cl(y∗
l − χi + χj) − Cl(y∗
l ) (i,j ∈ K,i = j)
(11.38)
and x∗
h ∈ argmaxUh[−p] if and only if

Uh(x∗
h + χj) − Uh(x∗
h) ≤ p(j) ≤ Uh(x∗
h) − Uh(x∗
h − χj) (j ∈ K),
p(j) − p(i) ≤ Uh(x∗
h) − Uh(x∗
h + χi − χj) (i,j ∈ K,i = j).
(11.39)
By deﬁning
(j) = max{max{Uh(x∗
h + χj) − Uh(x∗
h) | h ∈ H},
max{Cl(y∗
l ) − Cl(y∗
l − χj) | l ∈ L}}, (11.40)
u(j) = min{min{Uh(x∗
h) − Uh(x∗
h − χj) | h ∈ H},
min{Cl(y∗
l + χj) − Cl(y∗
l ) | l ∈ L}}, (11.41)
u(i,j) = min{min{Uh(x∗
h) − Uh(x∗
h + χi − χj) | h ∈ H},
min{Cl(y∗
l − χi + χj) − Cl(y∗
l ) | l ∈ L}}, (11.42)
we obtain a concrete representation of P∗
(x◦
) as follows. Note that (j) < +∞,
u(j) > −∞, and u(i,j) > −∞ for any i,j ∈ K (i = j).
Theorem 11.21. The set P∗
(x◦
) of all equilibrium price vectors is an L
-convex
polyhedron described as
P∗
(x◦
) =

p ∈ RK max{0,(j)} ≤ p(j) ≤ u(j) (j ∈ K),
p(j) − p(i) ≤ u(i,j) (i,j ∈ K,i = j)
A
(11.43)
with (j), u(j), and u(i,j) deﬁned in (11.40), (11.41), and (11.42).
By Theorem 11.21, the nonemptiness of P∗
(x◦
) can be checked by linear
programming. In particular, the largest equilibrium price vector, if any, can besidca00si
2013/2/12
page 344
## 344 Chapter 11. Application to Mathematical Economics
found by solving a linear programming problem:
Maximize

k∈K
p(k)
subject to max{0,(j)} ≤ p(j) ≤ u(j) (j ∈ K),
p(j) − p(i) ≤ u(i,j) (i,j ∈ K,i = j).
(11.44)
Similarly, the smallest equilibrium price vector can be found by solving another
linear programming problem:
Minimize

k∈K
p(k)
subject to max{0,(j)} ≤ p(j) ≤ u(j) (j ∈ K),
p(j) − p(i) ≤ u(i,j) (i,j ∈ K,i = j).
(11.45)
Both (11.44) and (11.45) can be easily reduced to the dual of a single-source shortest
path problem.
Theorem 11.22. There exists an equilibrium price vector if and only if the problem
(11.44) is feasible. The smallest and the largest equilibrium price vectors, if any,
can be found by solving the shortest path problem.
Thus, the existence of a competitive equilibrium in our economic model with
M
-convexcost functions of producers and M
-concave utility functions of consumers
can be checked in polynomial time by the following algorithm.
Algorithm for computing an equilibrium
S0: Construct the instance of the MSFP2.
S1: Solve the MSFP2 to obtain ((x∗
h | h ∈ H),(y∗
l | l ∈ L),p).
(If MSFP2 is infeasible, no equilibrium exists.)
S2: Solve the problem (11.44) to obtain an equilibrium ((x∗
h | h ∈ H),
(y∗
l | l ∈ L),p∗
) with largest p∗
.
(If (11.44) is infeasible, no equilibrium exists.)
Whereas the above algorithm yields the largest equilibrium price vector, the smallest
price vector can be computed by solving (11.45) instead of (11.44) in step S2.
Bibliographical Notes
The uniﬁed framework for indivisible commodities by means of discrete convex
analysis is proposed in Danilov–Koshevoy–Murota [34], [35], to which Theorems
11.14 and 11.15 as well as Notes 11.9 and 11.17 are ascribed. Theorem 11.16 for
the structure of equilibrium prices and Note 11.18 are by Murota [147].
The gross substitutes property was introduced by Kelso–Crawford [111] and
investigated thoroughly by Gul–Stacchetti [84], in which the equivalence of (GS),
(SI), and (NC) is proved. The connection of these conditions to M
-concavity was
pointed out by Fujishige–Yang [69] for set functions, with subsequent generaliza-
tions by Danilov–Koshevoy–Lang [33] (Theorem 11.6) and Murota–Tamura [160]
(Theorems 11.4 and 11.5). See Roth–Sotomayor [180] for more on (GS).sidca00si
2013/2/12
page 345
11.5. Computation of Equilibria 345
The computation of an equilibrium via an M-convex submodular ﬂow problem
described in section 11.5 is due to Murota–Tamura [161].
M-convexity is also amenable to the stable marriage problem (stable matching
problem) of Gale–Shapley [74], which is one of the most applicable models in eco-
nomics and game theory. Eguchi–Fujishige [47] formulates a generalization of the
stable marriage problem in terms of M
-convex functions and presents an extension
of the Gale–Shapley algorithm.
Submodularity plays important roles in economics and game theory. We
mention here the paper of Shapley [186] as an early contribution and Bilbao [14],
Danilov–Koshevoy [31], Milgrom–Shannon [129], and Topkis [203] as recent litera-
ture.sidca00si
2013/2/12
page 347
Chapter 12
Application to
Systems Analysis by
Mixed Matrices
This chapter presents an application of discrete convex analysis to systems analysis
by mixed matrices. Motivated by a physical observation to distinguish two kinds
of numbers appearing in descriptions of physical/engineering systems, the concepts
of mixed matrices and mixed polynomial matrices are introduced as mathematical
tools for dealing with two kinds of numbers in systems analysis. Discrete convex
functions arise naturally in this context and the discrete duality theorems are vital
for the analysis of the rank of mixed matrices and the degree of determinants of
mixed polynomial matrices.
## 12.1 Two Kinds of Numbers
A physical/engineering system can be characterized by a set of relations among var-
ious kinds of numbers representing physical quantities, parameter values, incidence
relations, etc., where it is important to recognize the diﬀerence in the nature of
the quantities involved in the problem and to establish a mathematical model that
reﬂects the diﬀerence.
A primitive, yet fruitful, way of classifying numbers is to distinguish nonvan-
ishing elements from zeros. This dichotomy often leads to graph-theoretic methods
for systems analysis, where the existence of nonvanishing numbers is represented by
a set of arcs in a certain graph.
Closer inspection reveals, however, that two diﬀerent kinds can be distin-
guished among the nonvanishing numbers; some of the nonvanishing numbers are
accurate in value and others are inaccurate in value but independent of one another.
We may alternatively refer to the numbers of the ﬁrst kind as ﬁxed constants and
to those of the second kind as system parameters.
Accurate numbers (fixed constants): Numbers accounting for various sorts of
conservation laws, such as Kirchhoﬀ’s laws, which, stemming from the topo-
logical incidence relation, are precise in value (often ±1).
Inaccurate numbers (system parameters): Numbers representingindependent
347sidca00si
2013/2/12
page 348
## 348 Chapter 12. Application to Systems Analysis by Mixed Matrices
a
b c d
η1
-
η2

η3 = αη1
6
η4
6
η5
6
ξ1

ξ2
-
ξ3 ? ξ4 = βξ2 ? ξ5 ?
r1 r2
e 6
Figure 12.1. Electrical network with mutual couplings.
physical parameters, such as resistances in electrical networks and masses in
mechanical systems, which, being contaminated with noise and other errors,
take values independent of one another.
It is emphasized that the distinction between accurate and inaccurate numbers
is not a matter in mathematics but in mathematical modeling, i.e., the way in
which we recognize the problem. This means in particular that it is impossible in
principle to give a mathematical deﬁnition to the distinction between the two kinds
of numbers.
The objective of this section is to explain, by means of typical examples, what
is meant by accurate and inaccurate numbers and how numbers of diﬀerent nature
arise in mathematical descriptions of physical/engineering systems. We consider
three examples from diﬀerent disciplines: an electrical network, a chemical process,
and a mechanical system.
Example 12.1. Consider the electrical network in Fig. 12.1, which consists of
ﬁve elements: two resistors of resistances ri (branch i) (i = 1,2), a voltage source
(branch 3) controlled by the voltage across branch 1, a current source (branch 4)
controlled by the current in branch 2, and an independent voltage source of voltage
e (branch 5). The element characteristics are represented as
η1 = r1ξ1, η2 = r2ξ2, η3 = αη1, ξ4 = βξ2, η5 = −e,
where ξi and ηi are the current in and the voltage across branch i (i = 1,...,5)
in the directions indicated in Fig. 12.1. We then obtain the following system of
equations:sidca00si
2013/2/12
page 349
12.1. Two Kinds of Numbers 349
⎡
⎢
⎢
⎢
⎢
⎢
⎢
⎢
⎢
⎢
⎢
⎢
⎢
⎢
⎢
⎣
0 0 1 1 1
1 0 0 0 −1
0 1 −1 0 0
1 0 0 −1 1
0 1 1 −1 0
r1 −1
r2 −1
0 α −1
β −1 0
0 −1
⎤
⎥
⎥
⎥
⎥
⎥
⎥
⎥
⎥
⎥
⎥
⎥
⎥
⎥
⎥
⎦
⎡
⎢
⎢
⎢
⎢
⎢
⎢
⎢
⎢
⎢
⎢
⎢
⎢
⎢
⎢
⎣
ξ1
ξ2
ξ3
ξ4
ξ5
η1
η2
η3
η4
η5
⎤
⎥
⎥
⎥
⎥
⎥
⎥
⎥
⎥
⎥
⎥
⎥
⎥
⎥
⎥
⎦
=
⎡
⎢
⎢
⎢
⎢
⎢
⎢
⎢
⎢
⎢
⎢
⎢
⎢
⎢
⎢
⎣
0
0
0
0
0
0
0
0
0
e
⎤
⎥
⎥
⎥
⎥
⎥
⎥
⎥
⎥
⎥
⎥
⎥
⎥
⎥
⎥
⎦
. (12.1)
The upper ﬁve equations are the structural equations (Kirchhoﬀ’s laws), while the
remaining ﬁve are the constitutive equations.
The nonzero coeﬃcients, ±1, appearing in the structural equations represent
the incidence relation in the underlying graph and are certainly accurate in value.
The entries of −1 contained in the constitutive equations are also accurate by deﬁ-
nition. In contrast, the values of the physical parameters r1, r2, α, and β are likely
to be inaccurate, being only approximately equal to their nominal values on account
of various kinds of noises and errors.
The unique solvability of this network amounts to the nonsingularity of the
coeﬃcient matrix of (12.1). A direct calculation shows that the determinant of this
matrix is equal to r2 +(1−α)(1+β)r1, which is highly probably distinct from zero
by the independence of the physical parameters {r1,r2,α,β}. Thus, the electrical
network of this example is solvable in general or, more precisely, solvable generically
with respect to the parameter set {r1,r2,α,β}. The solvability of this system will
be treated in Example 12.11 by a systematic combinatorial method (without direct
computation of the determinant).
The second example concerns a chemical process simulation.
Example 12.2. Consider a hypothetical system (Fig. 12.2) for the production
of ethylene dichloride (C2H4Cl2), which is slightly modiﬁed from an example used
in the Users’ Manual of Generalized Interrelated Flow Simulation of The Service
Bureau Company.
Feeds to the system are 100 mol/h of pure chlorine (Cl2) (stream 1) and 100
mol/h of pure ethylene (C2H4) (stream 2). In the reactor, 90% of the input ethylene
is converted into ethylene dichloride according to the reaction formula
C2H4 + Cl2 → C2H4Cl2. (12.2)
At the puriﬁcation stage, the product ethylene dichloride is recovered and the unre-
acted chlorine and ethylene are separated for recycling. The degree of puriﬁcation is
described in terms of the component recovery ratios a1, a2, and a3 of chlorine, ethy-
lene, and ethylene dichloride, respectively, which indicate the ratios of the amounts
recovered in stream 6 of the respective components over those in stream 5. We
consider the following problem:sidca00si
2013/2/12
page 350
## 350 Chapter 12. Application to Systems Analysis by Mixed Matrices
reactor
C2H4 + Cl2 −→ C2H4Cl2
90 % conversion of C2H4
puriﬁcation
-
1 chlorine feed
100 mol Cl2/h
-
2 ethylene feed
100 mol C2H4/h
- 3
- 4 - 5
-
6 recycle
-
7 product
Figure 12.2. Hypothetical ethylene dichloride production system.
Given the component recovery ratios a1 and a2 of chlorine and ethylene,
determine the recovery ratio x = a3 of ethylene dichloride with which a
speciﬁed production rate y mol/h of ethylene dichloride is realized.
Let ui1, ui2, and ui3 mol/h be the component ﬂow rates of chlorine, ethylene,
and ethylene dichloride in stream i, respectively. The system of equations to be
solved may be put in the following form, where u is an auxiliary variable in the
reactor and r (= 0.90) is the conversion ratio of ethylene:
str3 = str1 + str6: u31 = u61 + 100,
u3j = u6j (j = 2,3);
str4 = str2 + str3: u42 = u32 + 100,
u4j = u3j (j = 1,3);
reactor: u = ru42,
u5j = u4j − u (j = 1,2),
u53 = u43 + u,
puriﬁcation: u6j = aj u5j (j = 1,2),
u63 = xu53,
u7j = u5j − u6j (j = 1,2),
y = u53 − u63.
(12.3)
This is a system of linear/nonlinearequations in the unknown variables x, u, and uij,
where the equation u63 = x u53 in the puriﬁcation is the only nonlinear equation.
We may regard aj (j = 1,2) and r (= 0.90) as inaccurate and independent numbers.
The stoichiometric coeﬃcients in the reaction formula (12.2) are accurate numbers.
The Jacobian matrix of (12.3), shown in Fig. 12.3, contains ﬁve inaccurate numbers,
a1, a2, r, x, and u53. The solvability of this problem will be treated in Example
12.12.
Example 12.3. Consider the mechanical system in Fig. 12.4 consisting of two
masses m1 and m2, two springs k1 and k2, and a damper f; u is the force exertedsidca00si
2013/2/12
page 351
12.1. Two Kinds of Numbers 351
x u31 u32 u33 u41 u42 u43 u51 u52 u53 u61 u62 u63 u71 u72 u
y 1 −1
u31 −1 1
u32 −1 1
u33 −1 1
u41 1 −1
u42 1 −1
u43 1 −1
u51 1 −1 −1
u52 1 −1 −1
u53 1 −1 1
u61 a1 −1
u62 a2 −1
u63 u53 x −1
u71 1 −1 −1
u72 1 −1 −1
u r −1
Figure 12.3. Jacobian matrix in the chemical process simulation.
from outside. This system may be described by vectors x = (x1,x2,x3,x4,x5,x6)
and u = (u), where x1 and x2 are the vertical displacements (downward) of masses
m1 and m2, x3 and x4 are their velocities, x5 is the force by the damper f, and x6
is the relative velocity of the two masses. The governing equation is
F̄
dx
dt
= Ā x + B̄ u, (12.4)
with
F̄ =
⎡
⎢
⎢
⎢
⎢
⎢
⎣
1 0 0 0 0 0
0 1 0 0 0 0
0 0 m1 0 0 0
0 0 0 m2 0 0
0 0 0 0 0 0
1 −1 0 0 0 0
⎤
⎥
⎥
⎥
⎥
⎥
⎦
, Ā =
⎡
⎢
⎢
⎢
⎢
⎢
⎣
0 0 1 0 0 0
0 0 0 1 0 0
−k1 0 0 0 −1 0
0 −k2 0 0 1 0
0 0 0 0 −1 f
0 0 0 0 0 1
⎤
⎥
⎥
⎥
⎥
⎥
⎦
, B̄ =
⎡
⎢
⎢
⎢
⎢
⎢
⎣
0
0
1
0
0
0
⎤
⎥
⎥
⎥
⎥
⎥
⎦
.
We may regard {m1,m2,k1,k2,f} as independent system parameters and other
nonvanishing entries (i.e., ±1) of F̄, Ā, and B̄ as ﬁxed constants. The Laplace
transform67
of the equation (12.4) gives a frequency domain description
-
Ā − sF̄ B̄
.

x
u

= 0, (12.5)
where x(0) = 0 and u(0) = 0 are assumed. The coeﬃcient matrix [Ā − sF̄ | B̄] is
a polynomial matrix in s with coeﬃcients depending on the system parameters.
67See Chen [23] or Zadeh–Desoer [220] for the Laplace transform.sidca00si
2013/2/12
page 352
## 352 Chapter 12. Application to Systems Analysis by Mixed Matrices
f
=
=
m1
k1
x2
x1
x3 x1
x2 x4
k2
m2
.
.
u
Figure 12.4. Mechanical system.
We have employed a six-dimensional vector x in our description of the system.
It is possible, however, to describe this system using a four-dimensional state vector.
The minimum dimension of the state vector is known to be equal to the degree in
s of the determinant of
A(s) = Ā − sF̄ =
⎡
⎢
⎢
⎢
⎢
⎢
⎢
⎣
−s 0 1 0 0 0
0 −s 0 1 0 0
−k1 0 −sm1 0 −1 0
0 −k2 0 −sm2 1 0
0 0 0 0 −1 f
−s s 0 0 0 1
⎤
⎥
⎥
⎥
⎥
⎥
⎥
⎦
. (12.6)
Thus the number degdet[Ā − sF̄] is an important characteristic, sometimes called
the dynamical degree, of the system (12.4).
As illustrated by the examples above, accurate numbers often appear in equa-
tions for conservation laws such as Kirchhoﬀ’s laws; the law of conservation of
mass, energy, or momentum; and the principle of action and reaction, where the
nonvanishing coeﬃcients are either 1 or −1, representing the underlying topological
incidence relations. Another typical example is integer coeﬃcients (stoichiometric
coeﬃcients) in chemical reactions such as
2 · H2O = 2 · H2 + 1 · O2,
where nonunit integers such as 2 appear. In dealing with dynamical systems, we
encounter another example of accurate numbers that represent the deﬁning rela-
tions, such as those between velocity v and position x and between current ξ and
charge Q:
v = 1 ·
dx
dt
, ξ = 1 ·
dQ
dt
.sidca00si
2013/2/12
page 353
12.2. Mixed Matrices and Mixed Polynomial Matrices 353
-
j
*
ξ1
ξ2
ξ3
Kirchhoﬀ’s current law
−1 · ξ1 − 1 · ξ2 + 1 · ξ3 = 0
-
U
η1
η2
η3
Kirchhoﬀ’s voltage law
−1 · η1 − 1 · η2 + 1 · η3 = 0
-
-
- H2O
H2
O2
stoichiometry
2 · H2O = 2 · H2 + 1 · O2
velocity v – displacement x v = 1 · dx/dt (= s · x)
current ξ – charge Q ξ = 1 · dQ/dt (= s · Q)
Figure 12.5. Accurate numbers.
Typical accurate numbers are illustrated in Fig. 12.5.
The rather intuitive concept of two kinds of numbers will be given a mathe-
matical formalism in the next section.
## 12.2 Mixed Matrices and Mixed Polynomial Matrices
The distinction of two kinds of numbers can be embodied in the concepts of mixed
matrices and mixed polynomial matrices.
Assume that we are given a pair of ﬁelds F and K, where K is a subﬁeld of
F. Typically, K is the ﬁeld Q of rational numbers and F is a ﬁeld large enough to
contain all the numbers appearing in the problem in question. In so doing we intend
to model accurate numbers as numbers belonging to K and inaccurate numberssidca00si
2013/2/12
page 354
## 354 Chapter 12. Application to Systems Analysis by Mixed Matrices
as numbers in F that are algebraically independent over K, where a family of
numbers t1,...,tm of F is called algebraically independent over K if there exists no
nonzero polynomial p(X1,...,Xm) over K such that p(t1,...,tm) = 0. Informally,
algebraically independent numbers are tantamount to free parameters.
A matrix A = (Aij) over F, i.e., Aij ∈ F, is called a mixed matrix with
respect to (K,F) if
A = Q + T, (12.7)
where
(M-Q) Q = (Qij) is a matrix over K and
(M-T) T = (Tij) is a matrix over F such that the set of its nonzero
entries is algebraically independent over K.
We usually assume
Tij = 0 =⇒ Qij = 0
to make the decomposition (12.7) unique.
Example 12.4. In the electrical network of Example 12.1 it is reasonable to regard
{r1,r2,α,β} as independent free parameters. Then the coeﬃcient matrix in (12.1) is
a mixed matrix with respect to (K,F) = (Q,Q(r1,r2,α,β)), where Q(r1,r2,α,β)
means the ﬁeld of rational functions in r1,r2,α,β with coeﬃcients from Q. The
decomposition A = Q + T is given by
Q =
⎡
⎢
⎢
⎢
⎢
⎢
⎢
⎢
⎢
⎢
⎢
⎢
⎢
⎣
0 0 1 1 1
1 0 0 0 −1
0 1 −1 0 0
1 0 0 −1 1
0 1 1 −1 0
0 −1
0 −1
0 0 −1
0 −1 0
0 −1
⎤
⎥
⎥
⎥
⎥
⎥
⎥
⎥
⎥
⎥
⎥
⎥
⎥
⎦
,
T =
⎡
⎢
⎢
⎢
⎢
⎢
⎢
⎢
⎢
⎢
⎢
⎢
⎢
⎣
0 0 0 0 0
0 0 0 0 0
0 0 0 0 0
0 0 0 0 0
0 0 0 0 0
r1 0
r2 0
0 α 0
β 0 0
0 0
⎤
⎥
⎥
⎥
⎥
⎥
⎥
⎥
⎥
⎥
⎥
⎥
⎥
⎦
.
Consider now a polynomial matrix in s with coeﬃcients from F:
A(s) =
N 
k=0
sk
Ak,sidca00si
2013/2/12
page 355
12.2. Mixed Matrices and Mixed Polynomial Matrices 355
where Ak (k = 0,1,...,N) are matrices over F. We say that A(s) is a mixed
polynomial matrix with respect to (K,F) if it can be represented as
A(s) = Q(s) + T(s) (12.8)
with
Q(s) =
N 
k=0
sk
Qk, T(s) =
N 
k=0
sk
Tk,
where
(MP-Q) Qk (k = 0,1,...,N) are matrices over K and
(MP-T) Tk (k = 0,1,...,N) are matrices over F such that the set of
their nonzero entries is algebraically independent over K.
Obviously, the coeﬃcient matrices
Ak = Qk + Tk (k = 0,1,...,N)
are mixed matrices with respect to (K,F). Also note that A(s) is a mixed matrix
with respect to (K(s),F(s)) in spite of the occurrence of the variable s in both Q(s)
and T(s), where K(s) and F(s) denote the ﬁelds of rational functions in variable s
with coeﬃcients from K and F, respectively.
Mixed polynomial matrices are useful in dealing with linear time-invariant dy-
namical systems. The variable s here is primarily intended to denote the variable for
the Laplace transform for continuous-time systems, though it could be interpreted
as the variable for the z-transform68
for discrete-time systems.
Example 12.5. In the mechanical system of Example 12.3 it is reasonable to regard
{m1,m2,k1,k2,f} as independent free parameters. Then the matrix A(s) in (12.6)
is a mixed polynomial matrix with respect to (K,F) = (Q,Q(m1,m2,k1,k2,f)).
The decomposition A(s) = Q(s) + T(s) is given by
Q(s) =
⎡
⎢
⎢
⎢
⎢
⎢
⎣
−s 0 1 0 0 0
0 −s 0 1 0 0
0 0 0 0 −1 0
0 0 0 0 1 0
0 0 0 0 −1 0
−s s 0 0 0 1
⎤
⎥
⎥
⎥
⎥
⎥
⎦
, T(s) =
⎡
⎢
⎢
⎢
⎢
⎢
⎣
0 0 0 0 0 0
0 0 0 0 0 0
−k1 0 −sm1 0 0 0
0 −k2 0 −sm2 0 0
0 0 0 0 0 f
0 0 0 0 0 0
⎤
⎥
⎥
⎥
⎥
⎥
⎦
.
Our intention in the splitting (12.7) or (12.8) is to extract a meaningful com-
binatorial structure from the matrix A or A(s) by treating the Q-part numerically
and the T-part symbolically. This is based on the following observations.
68See Chen [23] or Zadeh–Desoer [220] for the z-transform.sidca00si
2013/2/12
page 356
## 356 Chapter 12. Application to Systems Analysis by Mixed Matrices
Q-part: As is typical with electrical networks, the Q-part primarily represents
the interconnection of the elements. The Q-matrix, however, is not uniquely
determined, but is subject to our choice in the mathematical description. In
the electrical network of Example 12.1, for instance, the coeﬃcient matrix

1 0 0 −1 1
0 1 1 −1 0

for Kirchhoﬀ’s voltage law may well be replaced with

1 0 0 −1 1
1 −1 −1 0 1

.
Accordingly, the structure of the Q-part should be treated numerically or
linear algebraically. In fact, this is feasible in practice, since the entries of the
Q-matrix are usually small integers, causing no serious numerical diﬃculty in
arithmetic operations.
T-part: The T-part primarily represents the element characteristics. The nonzero
pattern of the T-matrix is relatively stable against our choice in the mathe-
matical description of constitutive equations, and therefore it can be regarded
as representing some intrinsic combinatorial structure of the system. It can
be treated properly by graph-theoretic concepts and algorithms.
Combination: The structural information from the Q-part and the T-part can be
combined properly and eﬃciently by virtue of the fact that each part deﬁnes
a combinatorial structure with discrete convexity (matroid or valuated ma-
troid, to be more speciﬁc). Mathematical and algorithmic results in discrete
convex analysis (matroid theory and valuated matroid theory) aﬀord eﬀective
methods of systems analysis.
We may summarize the above as follows:
Q-part by linear algebra
T-part by graph theory
Combination by matroid theory
## 12.3 Rank of Mixed Matrices
The rank of a mixed matrix A = Q+T can be expressed in terms of the L
-convex
functions (submodular set functions) associated with Q and T. This enables us, for
example, to test eﬃciently for the solvability of the electrical network in Example
12.1 and of the chemical process simulation problem in Example 12.2.
Let A = Q + T be a mixed matrix with respect to (K,F). The rank of A
is deﬁned with reference to the ﬁeld F. That is, the rank of A is equal to (i) the
maximum number of linearly independent column vectors of A with coeﬃcients
taken from F, (ii) the maximum number of linearly independent row vectors of A
with coeﬃcients taken from F, and (iii) the maximum size of a submatrix of A forsidca00si
2013/2/12
page 357
12.3. Rank of Mixed Matrices 357
which the determinant does not vanish in F. The row set and the column set of A
are denoted by R and C, respectively. For I ⊆ R and J ⊆ C, the submatrix of A
with row indices in I and column indices in J is designated by A[I,J].
We start with the nonsingularity of a mixed matrix.
Proposition 12.6. A square mixed matrix A = Q + T is nonsingular if and only
if there exist some I ⊆ R and J ⊆ C such that both Q[I,J] and T[R \ I,C \ J] are
nonsingular.
Proof. It follows from the deﬁning expansion of the determinant that
detA =

|I|=|J|
ε(I,J) · detQ[I,J] · detT[R \ I,C \ J],
with ε(I,J) ∈ {1,−1}. If A is nonsingular, we have detA = 0 and hence detQ[I,J]·
detT[R \ I,C \ J] = 0 for some I and J. The converse is also true, since no
cancellation occurs among nonzero terms on the right-hand side by virtue of the
algebraic independence of the nonzero entries of T.
The following is a basic rank identity for a mixed matrix.
Theorem 12.7. For a mixed matrix A = Q + T,
rankA = max{rankQ[I,J] + rankT[R \ I,C \ J] | I ⊆ R,J ⊆ C}. (12.9)
Proof. Proposition 12.6 applied to submatrices of A establishes (12.9).
The right-hand side of the identity (12.9) is a maximization over all pairs
(I,J), the number of which is as large as 2|R|+|C|
, too large for an exhaustive
search for maximization. Fortunately, however, it is possible to design an eﬃcient
algorithm to compute this maximum on the basis of the following facts:
• The function ρ(I,J) = rankQ[I,J] can be evaluated easily by Gaussian elim-
ination.
• The function τ(I,J) = rankT[I,J] can be evaluated easily by ﬁnding a max-
imum matching in a bipartite graph representing the nonzero pattern of T.
• The maximization can be converted, with the aid of Edmonds’s intersection
theorem for matroids (a special case of Theorem 4.18), to the minimum of an
L
-convex function.
To state the main theorem of this section we need another function γ : 2R
×
2C
→ Z deﬁned by
γ(I,J) = |{i ∈ I | ∃j ∈ J : Tij = 0}| (I ⊆ R,J ⊆ C).
Note that γ(I,J) represents the number of nonzero rows of the submatrix T[I,J].sidca00si
2013/2/12
page 358
## 358 Chapter 12. Application to Systems Analysis by Mixed Matrices
Theorem 12.8. For a mixed matrix A = Q + T,
rankA = min
I⊆R,J⊆C
{ρ(I,J) + τ(I,J) − |I| − |J|} + |R| + |C|, (12.10)
rankA = min
I⊆R,J⊆C
{ρ(I,J) + γ(I,J) − |I| − |J|} + |R| + |C|, (12.11)
rankA = min
I⊆R,J⊆C
{ρ(I,J) − |I| − |J| | γ(I,J) = 0} + |R| + |C|. (12.12)
Proof. (12.10) can be proved from (12.9) with the aid of Edmonds’s intersection
theorem for matroids (a special case of Theorem 4.18) and (12.11) can be derived
from (12.10) using the formula
τ(I,J) = min{γ(I,J
) − |J
| | J
⊆ J} + |J|,
which is a version of the fundamental min-max relation between maximum match-
ings and minimum covers. (12.12) follows easily from (12.11). For details see the
proofs of Theorem 4.2.11 and Corollary 4.2.12 of Murota [146].
We mention the following theorem as an immediate corollary of the third
identity (12.12). Note the duality nature of this theorem.
Theorem 12.9 (Kőnig–Egerváry theorem for mixed matrices). For a mixed matrix
A = Q + T, there exist I ⊆ R and J ⊆ C such that
(i) |I| + |J| − rankQ[I,J] = |R| + |C| − rankA, and
(ii) rankT[I,J] = 0.
Proof. Take (I,J) that attains the minimum in (12.12).
To see the connection of the above rank formulas to L
-convexity, we deﬁne
three functions gρ,gτ,gγ : ZR∪C
→ Z ∪ {+∞}, with domgρ = domgτ = domgγ =
{0,1}R∪C
, by
gρ(χI∪J) = ρ(R \ I,J) + |I| (I ⊆ R,J ⊆ C),
gτ(χI∪J) = τ(R \ I,J) + |I| (I ⊆ R,J ⊆ C),
gγ(χI∪J) = γ(R \ I,J) + |I| (I ⊆ R,J ⊆ C).
Proposition 12.10. gρ, gτ, and gγ are L
-convex functions.
Proof. It is easy to see that ρ̃(I∪J) = ρ(R\I,J)+|I| is a submodular set function
on R∪C (see (2.70)). This is equivalent to the L
-convexity of gρ by Theorem 7.1,
and similarly for gτ and gγ.
We can rewrite the right-hand sides of (12.10) and (12.11) using these L
-
convex functions. Namely, we see
(12.10) ⇐⇒ rankA = min
p
{gρ(p) + gτ(p) − p,1 } + |C| = |C| − (gρ + gτ)•
(1),
(12.11) ⇐⇒ rankA = min
p
{gρ(p) + gγ(p) − p,1 } + |C| = |C| − (gρ + gγ)•
(1),sidca00si
2013/2/12
page 359
12.4. Degree of Determinant of Mixed Polynomial Matrices 359
where 1 ∈ ZR∪C
. Note that both gρ + gτ and gρ + gγ are L
-convex and therefore
(gρ + gτ)•
and (gρ + gγ)•
are M
-convex. As for (12.12) we observe that
DT = {p ∈ {0,1}R∪C
| p = χI∪J,γ(R \ I,J) = 0}
is an L
-convex set and
(12.12) ⇐⇒ rankA = min{gρ(p) − p,χC + |C| | p ∈ DT }.
This shows that the right-hand side of (12.12) is the minimum of an L
-convex
function over an L
-convex set. The discrete convexity implicit in Theorem 12.8
is thus exposed. A concrete algorithmic procedure for computing the rank of A =
Q + T is described in section 4.2 of Murota [146].
Example 12.11. The unique solvability of the electrical network in Example
12.1 can be shown by Theorem 12.7 applied to A = Q + T in Example 12.4. In
(12.9) the maximum value of 10 is attained by I = {1,2,3,4,5,7,10} and J =
{3,4,5,7,8,9,10}. In Theorem 12.8 the right-hand sides of (12.10), (12.11), and
(12.12) are equal to 10 with the minima attained by I = R and J = ∅.
Example 12.12. The generic solvability of the chemical process simulation prob-
lem in Example 12.2 is denied by Theorem 12.8 applied to the Jacobian matrix in
Fig. 12.3. In (12.12) the minimum is attained by
I = {y,u32,u33,u42,u43,u52,u53,u62,u72,u},
J = {x,u31,u33,u41,u43,u51,u53,u61,u63,u71}.
Note that γ(I,J) = 0, |I| = |J| = 10, and ρ(I,J) = 3, for which ρ(I,J) − |I| −
|J| +|R|+|C| = 3−10−10+16+16 = 15 < |R| = |C| = 16. This shows that the
Jacobian matrix in Fig. 12.3 is singular, and hence the simulation problem is not
solvable in general.
## 12.4 Degree of Determinant of Mixed Polynomial
Matrices
The degree of determinant of a mixed polynomial matrix A(s) = Q(s)+T(s) can be
expressed in terms of the inﬁmal convolution of two M-convex functions associated
with T(s) and Q(s). This enables us, for example, to compute the dynamical degree
of the mechanical system in Example 12.3 in an eﬃcient way by solving an M-convex
submodular ﬂow problem.
Let A(s) = (Aij(s)) be a polynomial matrix with each entry being a poly-
nomial in s with coeﬃcients from a certain ﬁeld F. We denote by R and C the
row set and the column set of A(s). The degree of minors (subdeterminants) is an
important characteristic of A(s). For example, the sequence of δk (k = 1,2,...) of
the highest degree in s of a minor of order k,
δk = max
I,J
{degdetA[I,J] | |I| = |J| = k}, (12.13)sidca00si
2013/2/12
page 360
## 360 Chapter 12. Application to Systems Analysis by Mixed Matrices
determines the Smith–McMillan form at inﬁnity as well as the structural indices of
the Kronecker form (see section 5.1 of Murota [146]). Here the function
δ(I,J) = degdetA[I,J]
to be maximized in (12.13) is essentially M-concave, since ω : 2R∪C
→ Z ∪ {−∞}
deﬁned by ω(I ∪ J) = δ(R \ I,J) for I ⊆ R and J ⊆ C is a valuated matroid (see
(2.74) and (2.77) as well as Example 5.2.15 of Murota [146]).
The following is the basic identity for the degree of the determinant of a mixed
polynomial matrix.
Theorem 12.13. For a square mixed polynomial matrix A(s) = Q(s) + T(s),
degdetA = max{degdetQ[I,J] + degdetT[R \ I,C \ J] | |I| = |J|,I ⊆ R,J ⊆ C},
(12.14)
where both sides are equal to −∞ if A is singular.
Proof. It follows from the deﬁning expansion of the determinant that
detA =

|I|=|J|
ε(I,J) · detQ[I,J] · detT[R \ I,C \ J],
with ε(I,J) ∈ {1,−1}. Since the degree of a sum is bounded by the maximum
degree of a summand, we obtain
degdetA ≤ max
|I|=|J|
deg(detQ[I,J] · detT[R \ I,C \ J])
= max
|I|=|J|
{degdetQ[I,J] + degdetT[R \ I,C \ J]}.
The inequality turns into an equality if the highest degree terms do not cancel one
another. The algebraic independence of the nonzero coeﬃcients in T(s) ensures
this.
The right-hand side of the identity (12.14) is a maximization over all pairs
(I,J), the number of which is as large as 2|R|+|C|
, too large for an exhaustive search
for maximization. Fortunately, however, it is possible to compute this maximum
eﬃciently by reducing this maximization problem to the M-convex submodular ﬂow
problem.
To see the connection to M-convexity, we deﬁne functions fQ,fT : ZR∪C
→
Z ∪ {+∞} with domfQ,domfT ⊆ {0,1}R∪C
by
fQ(χI∪J) = −degdetQ[R \ I,J] (I ⊆ R,J ⊆ C),
fT (χI∪J) = −degdetT[R \ I,J] (I ⊆ R,J ⊆ C).
Both fQ and fT are M-convex functions. The right-hand side of (12.14) can now
be identiﬁed as the negative of an integer inﬁmal convolution of these M-convex
functions. Namely,
(12.14) ⇐⇒ degdetA = −(fQ2Z fT )(1),sidca00si
2013/2/12
page 361
12.4. Degree of Determinant of Mixed Polynomial Matrices 361
where 1 ∈ ZR∪C
. This reveals the discrete convexity implicit in Theorem 12.13
and also shows an eﬃcient way to compute the degree of determinant of a mixed
polynomial matrix A(s) = Q(s) + T(s), since the inﬁmal convolution of M-convex
functions can be computed eﬃciently by solving an M-convex submodular ﬂow
problem, as we have seen in Note 9.30. Such an algorithm is described in detail in
section 6.2 of Murota [146].
Example 12.14. The dynamical degree of the mechanical system in Example 12.3
can be computed by Theorem 12.13 applied to A(s) = Q(s)+T(s) in Example 12.5.
In (12.14) the maximum value of 4 is attained by I = {1,2,5,6} and J = {1,2,5,6}.
Hence the dynamical degree is equal to four.
Bibliographical Notes
This chapter is largely based on Murota [146]. The observation on two kinds of num-
bers and the concept of mixed matrices are due to Murota–Iri [149], [150], in which
Theorem 12.7 is given. Theorem 12.8 is taken from [146]. The Kőnig–Egerváry the-
orem for mixed matrices (Theorem 12.9) is due to Bapat [7] and Hartﬁel–Loewy [86].
The connection between mixed polynomial matrices and M-convexity explained in
section 12.4 is due to Murota [143] and a related topic can be found in Iwata–Murota
[104].
Applications of matroid theory to electrical networks are fully expounded in
Iri [95] and Recski [175]. When gyrators are involved in electrical networks, a
generalization of mixed matrices to mixed skew-symmetric matrices is useful, as is
explained in section 7.3 of Murota [146]. See Geelen–Iwata [75] and Geelen–Iwata–
Murota [76] for recent results on mixed skew-symmetric matrices.
Matroid theory also ﬁnds applications in statics and scene analysis (Graver–
Servatius–Servatius [80], Recski [175], Sugihara [195], Whiteley [215], [216], [217]).
For planar truss structures, in particular, a necessary and suﬃcient condition for
generic (inﬁnitesimal) rigidity can be expressed in terms of unions of graphic ma-
troids, where a matroid union is a special case of the Minkowski sum of two M-
convex sets. It is noted that the rigidity of a truss structure can be represented by
a rank condition on a matrix associated with the truss, but that this matrix does
not fall into the category of mixed matrices. Recent results on rigidity in nongeneric
cases are surveyed in Radics–Recski [174].sidca00si
2013/2/12
page 363
Bibliography
[1] R. K. Ahuja, T. L. Magnanti, and J. B. Orlin: Network Flows—Theory, Al-
gorithms and Applications, Prentice–Hall, Englewood Cliﬀs, NJ, 1993. (Cited
on pp. 74, 145, 278)
[2] I. Althöfer and W. Wenzel: Two-best solutions under distance constraints:
The model and exemplary results for matroids, Advances in Applied Mathe-
matics, 22 (1999), 155–185. (Cited on p. 75)
[3] D. H. Anderson: Compartmental Modeling and Tracer Kinetics, Lecture Notes
in Biomathematics, 50, Springer-Verlag, Berlin, 1983. (Cited on p. 43)
[4] K. J. Arrow and F. H. Hahn: General Competitive Analysis, Holden–Day, San
Francisco, 1971. (Cited on p. 327)
[5] M. Avriel, W. E. Diewert, S. Schaible, and I. Zang: Generalized Concavity,
Plenum Press, New York, 1988. (Cited on p. 169)
[6] O. Axelsson: Iterative Solution Methods, Cambridge University Press, Cam-
bridge, U.K., 1994. (Cited on p. 42)
[7] R. B. Bapat: König’s theorem and bimatroids, Linear Algebra and Its Appli-
cations, 212/213 (1994), 353–365. (Cited on p. 361)
[8] M. S. Bazaraa, H. D. Sherali, and C. M. Shetty: Nonlinear Programming:
Theory and Algorithm, 2nd ed., Wiley, New York, 1993. (Cited on p. 36)
[9] A. Berman and R. J. Plemmons: Nonnegative Matrices in the Mathematical
Sciences, SIAM, Philadelphia, 1994. (Cited on pp. 42, 74)
[10] D. P. Bertsekas: Nonlinear Programming, 2nd ed., Athena Scientiﬁc, Belmont,
MA, 1999. (Cited on p. 36)
[11] M. J. Best, N. Chakravarti, and V. A. Ubhaya: Minimizing separable convex
functions subject to simple chain constraints, SIAM Journal on Optimization,
10 (2000), 658–672. (Cited on p. 202)
[12] C. Bevia, M. Quinzii, and J. Silva: Buying several indivisible goods, Mathe-
matical Social Sciences, 37 (1999), 1–23. (Cited on p. 327)
[13] S. Bikhchandani and J. W. Mamer: Competitive equilibrium in an exchange
economy with indivisibilities, Journal of Economic Theory, 74 (1997), 385–
413. (Cited on p. 327)
363sidca00si
2013/2/12
page 364
## 364 Bibliography
[14] J. M. Bilbao: Cooperative Games on Combinatorial Structures, Kluwer Aca-
demic, Boston, 2000. (Cited on p. 345)
[15] R. E. Bixby, W. H. Cunningham, and D. M. Topkis: Partial order of a polyma-
troid extreme point, Mathematics of Operations Research, 10 (1985), 367–378.
(Cited on pp. 290, 322)
[16] A. Björner, M. Las Vergnas, B. Sturmfels, N. White, and G. M. Ziegler:
Oriented Matroids, 2nd ed., Cambridge University Press, Cambridge, U.K.,
1999. (Cited on pp. 5, 75)
[17] J. M. Borwein and A. S. Lewis: Convex Analysis and Nonlinear Optimization:
Theory and Examples, Springer-Verlag, Berlin, 2000. (Cited on p. 99)
[18] A. Bouchet and W. H. Cunningham: Delta-matroids, jump systems, and
bisubmodular polyhedra, SIAM Journal on Discrete Mathematics, 8 (1995),
17–32. (Cited on p. 120)
[19] R. K. Brayton and J. K. Moser: A theory of nonlinear networks, I, II, Quar-
terly of Applied Mathematics, 22 (1964), 1–33, 81–104. (Cited on p. 74)
[20] R. A. Brualdi: Comments on bases in dependence structures, Bulletin of the
Australian Mathematical Society, 1 (1969), 161–167. (Cited on p. 75)
[21] R. A. Brualdi: Induced matroids, Proceedings of the American Mathematical
Society, 29 (1971), 213–221. (Cited on p. 279)
[22] P. M. Camerini, M. Conforti, and D. Naddef: Some easily solvable nonlinear
integer programs, Ricerca Operativa, 50 (1989), 11–25. (Cited on p. 175)
[23] Ch.-T. Chen: Linear System Theory and Design, 2nd ed., Holt, Rinehart and
Winston, New York, 1970. (Cited on pp. 351, 355)
[24] V. Chvátal: Linear Programming, W. H. Freeman and Company, New York,
1983. (Cited on pp. 88, 89, 99)
[25] R. Clay: Nonlinear Networks and Systems, John Wiley and Sons, New York,
1971. (Cited on p. 74)
[26] W. J. Cook, W. H. Cunningham, W. R. Pulleyblank, and A. Schrijver: Com-
binatorial Optimization, John Wiley and Sons, New York, 1998. (Cited on
pp. 36, 37, 74, 89, 99, 248, 278)
[27] W. Cui and S. Fujishige: A primal algorithm for the submodular ﬂow prob-
lem with minimum-mean cycle selection, Journal of the Operations Research
Society of Japan, 31 (1988), 431–440. (Cited on p. 313)
[28] W. H. Cunningham: Testing membership in matroid polyhedra, Journal of
Combinatorial Theory (B), 36 (1984), 161–188. (Cited on pp. 290, 322)
[29] W. H. Cunningham: On submodular function minimization, Combinatorica,
5 (1985), 185–192. (Cited on pp. 290, 322)
[30] W. H. Cunningham and A. Frank: A primal-dual algorithm for submodular
ﬂows, Mathematics of Operations Research, 10 (1985), 251–262. (Cited on
p. 318)sidca00si
2013/2/12
page 365
Bibliography 365
[31] V. I. Danilov and G. A. Koshevoy: Cores of cooperative games, superdiﬀer-
entials of functions, and the Minkowski diﬀerence of sets, Journal of Mathe-
matical Analysis and Applications, 247 (2000), 1–14. (Cited on p. 345)
[32] V. I. Danilov and G. A. Koshevoy: Discrete convexity and unimodularity, I,
Advances in Mathematics, 189 (2004), pp. 301–324. (Cited on pp. 99, 120)
[33] V. Danilov, G. Koshevoy, and C. Lang: Gross substitution, discrete convexity,
and submodularity, Discrete Applied Mathematics (2003), in press. (Cited on
pp. 176, 344)
[34] V. Danilov, G. Koshevoy, and K. Murota: Equilibria in economies with indi-
visible goods and money, RIMS Preprint 1204, Kyoto University, May 1998.
(Cited on pp. 175, 327, 344)
[35] V. Danilov, G. Koshevoy, and K. Murota: Discrete convexity and equilibria
in economies with indivisible goods and money, Mathematical Social Sciences,
41 (2001), 251–273. (Cited on pp. 175, 327, 344)
[36] G. B. Dantzig: Linear Programming and Extensions, Princeton University
Press, Princeton, NJ, 1963. (Cited on pp. 88, 99)
[37] G. Debreu: Theory of Value—An Axiomatic Analysis of Economic Equilib-
rium, John Wiley and Sons, New York, 1959. (Cited on p. 327)
[38] G. Debreu: Existence of competitive equilibrium, in: K. J. Arrow and M.
D. Intriligator, eds., Handbook of Mathematical Economics, Vol. II, North-
Holland, Amsterdam, 1982, Chap. 15, 697–743. (Cited on p. 327)
[39] P. G. Doyle and J. L. Snell: Rondom Walks and Electrical Networks, Mathe-
matical Society of America, Washington, DC, 1984. (Cited on p. 74)
[40] A. W. M. Dress and W. Terhalle: Well-layered maps and the maximum-degree
k × k-subdeterminant of a matrix of rational functions, Applied Mathematics
Letters, 8 (1995), 19–23. (Cited on p. 176)
[41] A. W. M. Dress and W. Wenzel: Valuated matroid: A new look at the greedy
algorithm, Applied Mathematics Letters, 3 (1990), 33–35. (Cited on pp. 6, 7,
75, 321)
[42] A. W. M. Dress and W. Wenzel: Valuated matroids, Advances in Mathemat-
ics, 93 (1992), 214–250. (Cited on pp. 6, 7, 75)
[43] D.-Z. Du and P. M. Pardalos, eds.: Handbook of Combinatorial Optimization,
Vols. 1–3, A, Kluwer Academic, Boston, 1998, 1999. (Cited on pp. 36, 99,
278)
[44] J. Edmonds: Submodular functions, matroids and certain polyhedra, in: R.
Guy, H. Hanani, N. Sauer, and J. Schönheim, eds., Combinatorial Structures
and Their Applications, Gordon and Breach, New York, 1970, 69–87. (Cited
on pp. 5, 6, 7, 35, 37, 119, 146, 224, 290)
[45] J. Edmonds: Matroid intersection, Annals of Discrete Mathematics, 14
(1979), 39–49. (Cited on pp. 6, 7, 35, 224)sidca00si
2013/2/12
page 366
## 366 Bibliography
[46] J. Edmonds and R. Giles: A min-max relation for submodular functions on
graphs, Annals of Discrete Mathematics, 1 (1977), 185–204. (Cited on p. 278)
[47] A. Eguchi and S. Fujishige: An extension of the Gale–Shapley stable matching
algorithm to a pair of M
-concave functions, Discrete Mathematics and Sys-
tems Science Research Report, No. 02-05, Division of Systems Science, Osaka
University, November 2002; Mathematics of Operations Research, submitted.
(Cited on p. 345)
[48] U. Faigle: Matroids in combinatorial optimization, in: N. White, ed., Com-
binatorial Geometries, Cambridge University Press, London, 1987, 161–210.
(Cited on p. 74)
[49] P. Favati and F. Tardella: Convexity in nonlinear integer programming,
Ricerca Operativa, 53 (1990), 3–44. (Cited on pp. 6, 7, 8, 38, 99, 202, 322)
[50] L. Fleischer and S. Iwata: A push-relabel framework for submodular function
minimization and applications to parametric optimization, Discrete Applied
Mathematics (2003), in press. (Cited on p. 322)
[51] L. Fleischer, S. Iwata, and S. T. McCormick: A faster capacity scaling al-
gorithm for minimum cost submodular ﬂow, Mathematical Programming, 92
(2002), 119–139. (Cited on p. 322)
[52] R. Fletcher: Practical Methods of Optimization, 2nd ed., John Wiley and
Sons, New York, 1987. (Cited on p. 36)
[53] L. R. Ford, Jr. and D. R. Fulkerson: Flows in Networks, Princeton University
Press, Princeton, NJ, 1962. (Cited on pp. 74, 278)
[54] A. Frank: A weighted matroid intersection algorithm, Journal of Algorithms,
2 (1981), 328–336. (Cited on pp. 6, 7, 35, 37, 224, 244)
[55] A. Frank: An algorithm for submodular functions on graphs, Annals of Dis-
crete Mathematics, 16 (1982), 97–120. (Cited on pp. 6, 35, 37, 119, 224,
318)
[56] A. Frank: Finding feasible vectors of Edmonds–Giles polyhedra, Journal of
Combinatorial Theory (B), 36 (1984), 221–239. (Cited on pp. 278, 312, 322)
[57] A. Frank: Generalized polymatroids, in: A. Hajnal, L. Lovász, and V. T. Sós,
eds., Finite and Inﬁnite Sets, I, North-Holland, Amsterdam, 1984, 285–294.
(Cited on p. 119)
[58] A. Frank and É. Tardos: Generalized polymatroids and submodular ﬂows,
Mathematical Programming, 42 (1988), 489–563. (Cited on p. 119)
[59] S. Fujishige: Algorithms for solving the independent-ﬂow problems, Journal of
Operations Research Society of Japan, 21 (1978), 189–204. (Cited on pp. 278,
312, 313, 322)
[60] S. Fujishige: Lexicographically optimal base of a polymatroid with respect
to a weight vector, Mathematics of Operations Research, 5 (1980), 186–196.
(Cited on p. 4)sidca00si
2013/2/12
page 367
Bibliography 367
[61] S. Fujishige: Structure of polyhedra determined by submodular functions on
crossing families, Mathematical Programming, 29 (1984), 125–141. (Cited on
p. 278)
[62] S. Fujishige: Theory of submodular programs: A Fenchel-type min-max the-
orem and subgradients of submodular functions, Mathematical Programming,
29 (1984), 142–155. (Cited on pp. 6, 35, 224, 244)
[63] S. Fujishige: On the subdiﬀerential of a submodular function, Mathematical
Programming, 29 (1984), 348–360. (Cited on pp. 6, 37, 119)
[64] S. Fujishige: A note on Frank’s generalized polymatroids, Discrete Applied
Mathematics, 7 (1984), 105–109. (Cited on p. 119)
[65] S. Fujishige: Submodular Functions and Optimization, Annals of Discrete
Mathematics, 47, North-Holland, Amsterdam, 1991; 2nd ed., 58, Elsevier,
2005. (Cited on pp. 4, 37, 117, 119, 202, 248, 278, 285, 312, 318, 322)
[66] S. Fujishige and S. Iwata: Algorithms for submodular ﬂows, IEICE Transac-
tions on Systems and Information, E83-D (2000), 322–329. (Cited on pp. 312,
318, 322)
[67] S. Fujishige, K. Makino, T. Takabatake, and K. Kashiwabara: Polybasic poly-
hedra: structure of polyhedra with edge vectors of support size at most 2,
Discrete Mathematics, 280 (2004), 13–27. (Cited on p. 120)
[68] S. Fujishige and K. Murota: Notes on L-/M-convex functions and the sepa-
ration theorems, Mathematical Programming, 88 (2000), 129–146. (Cited on
pp. 6, 8, 38, 131, 202)
[69] S. Fujishige and Z. Yang: A note on Kelso and Crawford’s gross substitutes
condition, Mathematics of Operations Research, to appear. (Cited on pp. 120,
176, 344)
[70] S. Fujishige and X. Zhang: New algorithms for the intersection problem of
submodular systems, Japan Journal of Industrial and Applied Mathematics,
9 (1992), 369–382. (Cited on p. 312)
[71] M. Fukushima, Y. Oshima, and M. Takeda: Dirichlet Forms and Symmetric
Markov Processes, Walter de Gruyter, Berlin, 1994. (Cited on pp. 45, 74)
[72] D. Gale: Equilibrium in a discrete exchange economy with money, Interna-
tional Journal of Game Theory, 13 (1984), 61–64. (Cited on p. 327)
[73] D. Gale and T. Politof: Substitutes and complements in network ﬂow prob-
lems, Discrete Applied Mathematics, 3 (1981), 175–186. (Cited on p. 74)
[74] D. Gale and L. S. Shapley: College admissions and stability of marriage,
American Mathematical Monthly, 69 (1962), 9–15. (Cited on p. 345)
[75] J. F. Geelen and S. Iwata: Matroid matching via mixed skew-symmetric ma-
trices, Combinatorica, 25 (2005), 187–215. (Cited on p. 361)
[76] J. F. Geelen, S. Iwata, and K. Murota: The linear delta-matroid parity prob-
lem, Journal of Combinatorial Theory (B), 88 (2003), 377–398. (Cited on
p. 361)sidca00si
2013/2/12
page 368
## 368 Bibliography
[77] E. Girlich, M. Kovalev, and A. Zaporozhets: A polynomial algorithm for
resource allocation problems with polymatroid constraints, Optimization, 37
(1996), 73–86. (Cited on p. 4)
[78] E. Girlich and M. M. Kowaljow: Nichtlineare diskrete Optimierung,
Akademie-Verlag, Berlin, 1981. (Cited on p. 4)
[79] F. Granot and A. F. Veinott, Jr.: Substitutes, complements and ripples in net-
work ﬂows, Mathematics of Operations Research, 10 (1985), 471–497. (Cited
on p. 74)
[80] J. Graver, B. Servatius, and H. Servatius: Combinatorial Rigidity, American
Mathematical Society, Providence, RI, 1993. (Cited on p. 361)
[81] H. Groenevelt: Two algorithms for maximizing a separable concave function
over a polymatroid feasible region, European Journal of Operational Research,
54 (1991), 227–236. (Cited on p. 4)
[82] M. Grötschel, L. Lovász, and A. Schrijver: The ellipsoid method and its
consequences in combinatorial optimization, Combinatorica, 1 (1981), 169–
197 [Corrigendum: Combinatorica, 4 (1984), 291–295]. (Cited on p. 290)
[83] M. Grötschel, L. Lovász, and A. Schrijver: Geometric Algorithms and Combi-
natorial Optimization, 1st ed., 2nd. ed., Springer-Verlag, Berlin, 1988, 1993.
(Cited on p. 290)
[84] F. Gul and E. Stacchetti: Walrasian equilibrium with gross substitutes, Jour-
nal of Economic Theory, 87 (1999), 95–124. (Cited on pp. 327, 332, 344)
[85] B. Hajek: Extremal splittings of point processes, Mathematics of Operations
Research, 10 (1985), 543–556. (Cited on p. 202)
[86] D. J. Hartﬁel and R. Loewy: A determinantal version of the Frobenius–König
theorem, Linear Multilinear Algebra, 16 (1984), 155–165. (Cited on p. 361)
[87] R. Hassin: Minimum cost ﬂow with set-constraints, Networks, 12 (1982),
1–21. (Cited on p. 278)
[88] C. Henry: Indivisibilités dans une économie d’échanges, Econometrica, 38
(1970), 542–558. (Cited on p. 327)
[89] J.-B. Hiriart-Urruty and C. Lemaréchal: Convex Analysis and Minimization
Algorithms I, II, Springer-Verlag, Berlin, 1993. (Cited on p. 99)
[90] D. S. Hochbaum: Lower and upper bounds for the allocation problem and
other nonlinear optimization problems, Mathematics of Operations Research,
19 (1994), 390–409. (Cited on pp. 4, 158)
[91] D. S. Hochbaum and S.-P. Hong: About strongly polynomial time algorithms
for quadratic optimization over submodular constraints, Mathematical Pro-
gramming, 69 (1995), 269–309. (Cited on p. 4)
[92] D. S. Hochbaum, R. Shamir, and J. G. Shanthikumar: A polynomial algo-
rithm for an integer quadratic non-separable transportation problem, Mathe-
matical Programming, 55 (1992), 359–371. (Cited on pp. 5, 175)sidca00si
2013/2/12
page 369
Bibliography 369
[93] T. Ibaraki and N. Katoh: Resource Allocation Problems: Algorithmic Ap-
proaches, MIT Press, Boston, 1988. (Cited on pp. 4, 5)
[94] M. Iri: Network Flow, Transportation and Scheduling—Theory and Algo-
rithms, Academic Press, New York, 1969. (Cited on pp. 64, 74, 132, 247,
278)
[95] M. Iri: Applications of matroid theory, in: A. Bachem, M. Grötschel, and
B. Korte, eds., Mathematical Programming—The State of the Art, Springer-
Verlag, Berlin, 1983, 158–201. (Cited on p. 361)
[96] M. Iri and N. Tomizawa: An algorithm for ﬁnding an optimal “independent
assignment,” Journal of the Operations Research Society of Japan, 19 (1976),
32–57. (Cited on pp. 6, 7, 35, 224)
[97] S. Iwata: A capacity scaling algorithm for convex cost submodular ﬂows,
Mathematical Programming, 76 (1997), 299–308. (Cited on p. 322)
[98] S. Iwata: Submodular ﬂow problems (in Japanese), in: S. Fujishige, ed.,
Discrete Structures and Algorithms, Vol. VI, Kindai-Kagakusha, Tokyo, 1999,
Chapter 4, 127–170. (Cited on pp. 312, 318, 322)
[99] S. Iwata: A fully combinatorial algorithm for submodular function minimiza-
tion, Journal of Combinatorial Theory (B), 84 (2002), 203–212. (Cited on
pp. 290, 305)
[100] S. Iwata: A faster scaling algorithm for minimizing submodular functions, in:
W. J. Cook and A. S. Schulz, eds., Integer Programming and Combinatorial
Optimization, Lecture Notes in Computer Science, 2337, Springer-Verlag,
2002, 1–8; SIAM Journal on Computing, 32 (2003), 833–840. (Cited on p. 322)
[101] S. Iwata, L. Fleischer, and S. Fujishige: A combinatorial, strongly polynomial-
time algorithm for minimizing submodular functions, Proceedings of the 32nd
ACM Symposium on Theory of Computing (2000), 97–106. (Cited on p. 290)
[102] S. Iwata, L. Fleischer, and S. Fujishige: A combinatorial, strongly polynomial-
time algorithm for minimizing submodular functions, Journal of the ACM, 48
(2001), 761–777. (Cited on pp. 290, 322)
[103] S. Iwata, S. T. McCormick, and M. Shigeno: Fast cycle canceling algo-
rithms for minimum cost submodular ﬂow, Combinatorica, 23 (2003), 503–
525. (Cited on p. 313)
[104] S. Iwata and K. Murota: Combinatorial relaxation algorithm for mixed poly-
nomial matrices, Mathematical Programming, 90 (2001), 353–371. (Cited on
p. 361)
[105] S. Iwata and M. Shigeno: Conjugate scaling algorithm for Fenchel-type duality
in discrete convex optimization, SIAM Journal on Optimization, 13 (2003),
204–211. (Cited on pp. 202, 278, 322)
[106] P. M. Jensen and B. Korte: Complexity of matroid property algorithms, SIAM
Journal on Computing, 11 (1982), 184–190. (Cited on p. 293)
[107] M. Kaneko: The central assignment game and the assignment markets, Jour-
nal of Mathematical Economics, 10 (1982), 205–232. (Cited on p. 327)sidca00si
2013/2/12
page 370
## 370 Bibliography
[108] M. Kaneko and Y. Yamamoto: The existence and computation of competitive
equilibria in markets with an indivisible commodity, Journal of Economic
Theory, 38 (1986), 118–136. (Cited on p. 327)
[109] K. Kashiwabara and T. Takabatake: Polyhedra with submodular support
functions and their unbalanced simultaneous exchangeability, Discrete Applied
Mathematics (2003), in press. (Cited on p. 120)
[110] N. Katoh and T. Ibaraki: Resource allocation problems, in: D.-Z. Du and P.
M. Pardalos, eds., Handbook of Combinatorial Optimization, Vol. 2, Kluwer
Academic, Boston, 1998, 159–260. (Cited on p. 176)
[111] A. S. Kelso, Jr., and V. P. Crawford: Job matching, coalition formation, and
gross substitutes, Econometrica, 50 (1982), 1483–1504. (Cited on pp. 327,
332, 344)
[112] J. Kindler: Sandwich theorems for set functions, Journal of Mathematical
Analysis and Applications, 133 (1988), 529–542. (Cited on p. 5)
[113] S. Kodama and N. Suda: Matrix Theory for System Control (in Japanese),
Society of Instrument and Control Engineers, Tokyo, 1978. (Cited on p. 42)
[114] B. Korte, L. Lovász, and R. Schrader: Greedoids, Springer-Verlag, Berlin,
1991. (Cited on p. 5)
[115] B. Korte and J. Vygen: Combinatorial Optimization: Theory and Algorithms,
Springer-Verlag, Berlin, 2000; 5th ed., 2012. (Cited on pp. 36, 74, 89, 99, 278)
[116] J. P. S. Kung: A Source Book in Matroid Theory, Birkhäuser, Boston, 1986.
(Cited on p. 74)
[117] J. P. S. Kung: Basis-exchange properties, in: N. White, ed., Theory of Ma-
troids, Cambridge University Press, London, 1986, Chapter 4, 62–75. (Cited
on p. 333)
[118] E. L. Lawler: Matroid intersection algorithms, Mathematical Programming, 9
(1975), 31–56. (Cited on pp. 6, 7)
[119] E. L. Lawler: Combinatorial Optimization: Networks and Matroids, Holt,
Rinehart and Winston, New York, 1976, Dover Publications, New York, 2001.
(Cited on pp. 36, 74, 89, 99, 278)
[120] E. L. Lawler and C. U. Martel: Computing maximal polymatroidal network
ﬂows, Mathematics of Operations Research, 7 (1982), 334–337. (Cited on
p. 278)
[121] E. L. Lawler and C. U. Martel: Network ﬂow formulations of polymatroid
optimization problems, Annals of Discrete Mathematics, 16 (1982), 515–534.
(Cited on p. 278)
[122] L. Lovász: Matroid matching and some applications, Journal of Combinato-
rial Theory (B), 28 (1980), 208–236. (Cited on p. 293)
[123] L. Lovász: Submodular functions and convexity, in: A. Bachem, M. Grötschel,
and B. Korte, eds., Mathematical Programming—The State of the Art,
Springer-Verlag, Berlin, 1983, 235–257. (Cited on pp. 5, 6, 37, 119, 146,
293)sidca00si
2013/2/12
page 371
Bibliography 371
[124] L. Lovász: The membership problem in jump systems, Journal of Combina-
torial Theory (B), 70 (1997), 45–66. (Cited on p. 120)
[125] L. Lovász and M. Plummer: Matching Theory, North-Holland, Amsterdam,
1986. (Cited on p. 99)
[126] O. L. Mangasarian: Nonlinear Programming, SIAM, Philadelphia, 1994.
(Cited on p. 36)
[127] S. T. McCormick: Submodular Function Minimization, in: K. Aardal, G.
Nemhauser, and R. Weismantel, eds., Discrete Optimization, Elsevier Science,
Berlin, 2006, Chapter 7, 321–391. (Cited on p. 322)
[128] L. McKenzie: General equilibrium, in: J. Eatwell, M. Milgate, and P. New-
man, eds., The New Palgrave: General Equilibrium, Macmillan, London, 1989,
Chapter 1. (Cited on p. 327)
[129] P. Milgrom and C. Shannon: Monotone comparative statics, Econometrica,
62 (1994), 157–180. (Cited on pp. 198, 203, 345)
[130] B. L. Miller: On minimizing nonseparable functions deﬁned on the integers
with an inventory application, SIAM Journal on Applied Mathematics, 21
(1971), 166–185. (Cited on pp. 5, 99)
[131] M. Minoux: Solving integer minimum cost ﬂows with separable convex ob-
jective polynomially, Mathematical Programming, 26 (1986), 237–239. (Cited
on p. 4)
[132] S. Moriguchi and K. Murota: Capacity scaling algorithm for scalable M-
convex submodular ﬂow problems, Optimization Methods and Software, 18
(2003), 207–218. (Cited on pp. 312, 322)
[133] S. Moriguchi, K. Murota, and A. Shioura: Scaling algorithms for M-convex
function minimization, IEICE Transactions on Fundamentals of Electronics,
Communications and Computer Sciences, E85-A (2002), 922–929. (Cited on
pp. 175, 176, 321)
[134] S. Moriguchi and A. Shioura: On Hochbaum’s proximity-scaling algorithm for
the general resource allocation problem, Mathematics of Operations Research,
29 (2004), 394–397. (Cited on pp. 158, 176)
[135] K. Murota: Valuated matroid intersection, I: optimality criteria, SIAM Jour-
nal on Discrete Mathematics, 9 (1996), 545–561. (Cited on pp. 6, 7, 35, 224,
244, 278)
[136] K. Murota: Valuated matroid intersection, II: algorithms, SIAM Journal on
Discrete Mathematics, 9 (1996), 562–576. (Cited on pp. 8, 313, 322)
[137] K. Murota: Convexity and Steinitz’s exchange property, Advances in Mathe-
matics, 124 (1996), 272–311. (Cited on pp. 6, 8, 37, 175, 176, 244, 278)
[138] K. Murota: Matroid valuation on independent sets, Journal of Combinatorial
Theory (B), 69 (1997), 59–78. (Cited on p. 176)sidca00si
2013/2/12
page 372
## 372 Bibliography
[139] K. Murota: Fenchel-type duality for matroid valuations, Mathematical Pro-
gramming, 82 (1998), 357–375. (Cited on pp. 6, 8)
[140] K. Murota: Discrete convex analysis, Mathematical Programming, 83 (1998),
313–371. (Cited on pp. 6, 8, 37, 74, 119, 131, 132, 176, 202, 244, 278)
[141] K. Murota: Discrete convex analysis (in Japanese), in: S. Fujishige, ed.,
Discrete Structures and Algorithms, Vol. V, Kindai-Kagakusha, Tokyo, 1998,
Chapter 2, 51–100. (Cited on pp. 37, 74, 119, 132, 175, 176, 202)
[142] K. Murota: Submodular ﬂow problem with a nonseparable cost function,
Combinatorica, 19 (1999), 87–109. (Cited on pp. 8, 37, 74, 176, 221, 244, 278,
322)
[143] K. Murota: On the degree of mixed polynomial matrices, SIAM Journal on
Matrix Analysis and Applications, 20 (1999), 196–227. (Cited on p. 361)
[144] K. Murota: Discrete convex analysis—Exposition on conjugacy and duality,
in: L. Lovász, A. Gyárfás, G. O. H. Katona, A. Recski, and L. Székely, eds.,
Graph Theory and Combinatorial Biology, The János Bolyai Mathematical
Society, Budapest, 1999, 253–278. (Cited on pp. 175, 202)
[145] K. Murota: Algorithms in discrete convex analysis, IEICE Transactions on
Systems and Information, E83-D (2000), 344–352. (Cited on pp. 202, 278,
322)
[146] K. Murota: Matrices and Matroids for Systems Analysis, Springer-Verlag,
Berlin, 2000. (Cited on pp. 74, 75, 244, 266, 321, 358, 359, 360, 361)
[147] K. Murota: Discrete Convex Analysis—An Introduction (in Japanese), Ky-
oritsu Publishing Company, Tokyo, 2001. (Cited on pp. xxii, 74, 99, 175, 176,
202, 203, 244, 278, 279, 322, 344)
[148] K. Murota: On steepest descent algorithms for discrete convex functions,
SIAM Journal on Optimization, 14 (2003), 699–707. (Cited on pp. 321, 322)
[149] K. Murota and M. Iri: Matroid-theoretic approach to the structural solvability
of a system of equations (in Japanese), Transactions of Information Processing
Society of Japan, 24 (1983), 157–164. (Cited on p. 361)
[150] K. Murota and M. Iri: Structural solvability of systems of equations—A
mathematical formulation for distinguishing accurate and inaccurate num-
bers in structural analysis of systems, Japan Journal of Applied Mathematics,
2 (1985), 247–271. (Cited on p. 361)
[151] K. Murota and A. Shioura: M-convex function on generalized polymatroid,
Mathematics of Operations Research, 24 (1999), 95–105. (Cited on pp. 6, 8,
38, 119, 175)
[152] K. Murota and A. Shioura: Extension of M-convexity and L-convexity to
polyhedral convex functions, Advances in Applied Mathematics, 25 (2000),
352–427. (Cited on pp. 6, 8, 38, 98, 120, 132, 162, 163, 176, 190, 192, 202,
203, 244, 278, 279)sidca00si
2013/2/12
page 373
Bibliography 373
[153] K. Murota and A. Shioura: Relationship of M-/L-convex functions with dis-
crete convex functions by Miller and by Favati–Tardella, Discrete Applied
Mathematics, 115 (2001), 151–176. (Cited on pp. 36, 38, 99, 119, 132, 176,
231, 244)
[154] K. Murota and A. Shioura: Quasi M-convex and L-convex functions: Quasi-
convexity in discrete optimization, Discrete Applied Mathematics, 131/132
(2003), 467–494. (Cited on pp. 176, 202, 203, 321)
[155] K. Murota and A. Shioura: Quadratic M-convex and L-convex functions,
Advances in Applied Mathematics, 33 (2004), 318–341. (Cited on pp. 9, 38,
52, 74, 175)
[156] K. Murota and A. Shioura: Fundamental properties of M-convex and L-convex
functions in continuous variables, IEICE Transactions on Fundamentals of
Electronics, Communications and Computer Sciences, E87-A (2004), 1042–
1052. (Cited on pp. 6, 9, 38, 176, 202, 211)
[157] K. Murota and A. Shioura: Conjugacy relationship between M-convex and
L-convex functions in continuous variables, Mathematical Programming, 101
(2004), 415–433. (Cited on pp. 6, 9, 38, 176, 202, 211)
[158] K. Murota and A. Shioura: Substitutes and complements in network ﬂows
viewed as discrete convexity, Discrete Optimization, 2 (2005), 256–268. (Cited
on p. 74)
[159] K. Murota and A. Tamura: On circuit valuation of matroids, Advances in
Applied Mathematics, 26 (2001), 192–225. (Cited on p. 75)
[160] K. Murota and A. Tamura: New characterizations of M-convex functions
and their applications to economic equilibrium models with indivisibilities,
Discrete Applied Mathematics, 131 (2003), 495–512. (Cited on pp. 176, 333,
344)
[161] K. Murota and A. Tamura: Application of M-convex submodular ﬂow problem
to mathematical economics, in: P. Eades and T. Takaoka, eds., Algorithms
and Computation, Lecture Notes in Computer Science, 2223, Springer-Verlag,
2001, 14–25; Japan Journal of Industrial and Applied Mathematics, 20 (2003),
257–277. (Cited on p. 345)
[162] K. Murota and A. Tamura: Proximity theorems of discrete convex functions,
Mathematical Programming, 99 (2004), 539–562. (Cited on pp. 158, 228, 244)
[163] H. Nagamochi and T. Ibaraki: Computing edge-connectivity in multigraphs
and capacitated graphs, SIAM Journal on Discrete Mathematics, 5 (1992),
54–64. (Cited on p. 290)
[164] T. Nakasawa: Zur Axiomatik der linearen Abhängigkeit, I, II, III, Science
Reports of the Tokyo Bunrika Daigaku, Section A, 2 (1935), 235–255; 3 (1936),
45–69; 3 (1936), 123–136. (Cited on p. 74)
[165] H. Narayanan: Submodular Functions and Electrical Networks, Annals of Dis-
crete Mathematics, 54, North-Holland, Amsterdam, 1997. (Cited on p. 37)sidca00si
2013/2/12
page 374
## 374 Bibliography
[166] G. L. Nemhauser, A. H. G. Rinnooy Kan, and M. J. Todd, eds.: Optimization,
Handbooks in Operations Research and Management Science, Vol. 1, Elsevier
Science, Amsterdam, 1989. (Cited on pp. 36, 244)
[167] G. L. Nemhauser and L. A. Wolsey: Integer and Combinatorial Optimization,
John Wiley and Sons, New York, 1988. (Cited on pp. 36, 99, 244, 278)
[168] H. Nikaido: Convex Structures and Economic Theory, Academic Press, New
York, 1968. (Cited on p. 327)
[169] J. Nocedal and S. J. Wright: Numerical Optimization, Springer-Verlag, New
York, 1999. (Cited on p. 36)
[170] J. G. Oxley: Matroid Theory, Oxford University Press, Oxford, U.K., 1992.
(Cited on p. 74)
[171] H. Perfect: Independence spaces and combinatorial problems, Proceedings of
the London Mathematical Society, 19 (1969), 17–30. (Cited on p. 279)
[172] M. Queyranne: Minimizing symmetric submodular functions, Mathematical
Programming, 82 (1998), 3–12. (Cited on p. 290)
[173] M. Quinzii: Core and equilibria with indivisibilities, International Journal of
Game Theory, 13 (1984), 41–61. (Cited on p. 327)
[174] N. Radics and A. Recski: Applications of combinatorics to statics—Rigidity of
grids, Discrete Applied Mathematics, 123 (2002), 473–485. (Cited on p. 361)
[175] A. Recski: Matroid Theory and Its Applications in Electric Network Theory
and in Statics, Springer-Verlag, Berlin, 1989. (Cited on pp. 74, 361)
[176] R. T. Rockafellar: Convex Analysis, Princeton University Press, Princeton,
NJ, 1970. (Cited on pp. 84, 85, 99)
[177] R. T. Rockafellar: Conjugate Duality and Optimization, SIAM Regional Con-
ference Series in Applied Mathematics 16, SIAM, Philadelphia, 1974. (Cited
on pp. 99, 235, 242)
[178] R. T. Rockafellar: Network Flows and Monotropic Optimization, John Wiley
and Sons, New York, 1984. (Cited on pp. 53, 60, 64, 74, 132, 247, 253, 278)
[179] R. T. Rockafellar and R. J.-B. Wets: Variational Analysis, Springer-Verlag,
Berlin, 1998. (Cited on p. 99)
[180] A. E. Roth and M. A. O. Sotomayor: Two-Sided Matching—A Study in Game-
Theoretic Modelling and Analysis, Cambridge University Press, Cambridge,
U.K., 1990. (Cited on p. 344)
[181] A. Schrijver: Theory of Linear and Integer Programming, John Wiley and
Sons, New York, 1986. (Cited on pp. 88, 89, 99)
[182] A. Schrijver: A combinatorial algorithm minimizing submodular functions in
strongly polynomial time, Journal of Combinatorial Theory (B), 80 (2000),
346–355. (Cited on pp. 290, 322)
[183] A. Schrijver: Combinatorial Optimization—Polyhedra and Eﬃciency,
Springer-Verlag, Heidelberg, Germany, 2003. (Cited on pp. 74, 119, 279)sidca00si
2013/2/12
page 375
Bibliography 375
[184] L. S. Shapley: On network ﬂow functions, Naval Research Logistics Quarterly,
8 (1961), 151–158. (Cited on p. 74)
[185] L. S. Shapley: Complements and substitutes in the optimal assignment prob-
lem, Naval Research Logistics Quarterly, 9 (1962), 45–48. (Cited on p. 74)
[186] L. S. Shapley: Cores of convex games, International Journal of Game Theory,
1 (1971), 11–26 (errata, 199). (Cited on p. 345)
[187] L. S. Shapley and H. Scarf: On cores and indivisibilities, Journal of Mathe-
matical Economics, 1 (1974), 23–37. (Cited on p. 327)
[188] A. Shioura: An algorithmic proof for the induction of M-convex functions
through networks, Research Reports on Mathematical and Computing Sci-
ences, B-317, Tokyo Institute of Technology, July 1996. (Cited on p. 278)
[189] A. Shioura: A constructive proof for the induction of M-convex functions
through networks, Discrete Applied Mathematics, 82 (1998), 271–278. (Cited
on p. 278)
[190] A. Shioura: Minimization of an M-convex function, Discrete Applied Mathe-
matics, 84 (1998), 215–220. (Cited on pp. 176, 321)
[191] A. Shioura: Level set characterization of M-convex functions, IEICE Trans-
actions on Fundamentals of Electronics, Communications and Computer Sci-
ences, E83-A (2000), 586–589. (Cited on p. 176)
[192] A. Shioura: Fast scaling algorithms for M-convex function minimization with
application to the resource allocation problem, Discrete Applied Mathematics,
134 (2003), 303–316. (Cited on p. 321)
[193] D. D. Šiljak: Large-Scale Dynamic Systems—Stability and Structure, North-
Holland, New York, 1978. (Cited on p. 42)
[194] J. Stoer and C. Witzgall: Convexity and Optimization in Finite Dimensions I,
Springer-Verlag, Berlin, 1970. (Cited on pp. 85, 99)
[195] K. Sugihara: Machine Interpretation of Line Drawings, MIT Press, Cam-
bridge, MA, 1986. (Cited on p. 361)
[196] L.-G. Svensson: Competitive equilibria with indivisible goods, Journal of Eco-
nomics, 44 (1984), 373–386. (Cited on p. 327)
[197] A. Tamura: Coordinatewise domain scaling algorithm for M-convex function
minimization, in: W. J. Cook and A. S. Schulz, eds., Integer Programming
and Combinatorial Optimization, Lecture Notes in Computer Science, 2337,
Springer-Verlag, 2002, 21–35; Mathematical Programming, 102 (2005), 339–
354. (Cited on pp. 176, 321)
[198] A. Tamura: On convolution of L-convex functions, Optimization Methods and
Software, 18 (2003), 231–245. (Cited on p. 244)
[199] É. Tardos, C. A. Tovey, and M. A. Trick: Layered augmenting path algo-
rithms, Mathematics of Operations Research, 11 (1986), 362–370. (Cited on
p. 312)sidca00si
2013/2/12
page 376
## 376 Bibliography
[200] N. Tomizawa: Theory of hyperspaces (XVI)—On the structure of hedrons
(in Japanese), Papers of the Technical Group on Circuit and System Theory,
Institute of Electronics and Communication Engineers of Japan, CAS82-174,
1983. (Cited on p. 120)
[201] N. Tomizawa and M. Iri: An algorithm for solving the “independent assign-
ment” problem with application to the problem of determining the order of
complexity of a network (in Japanese), Transactions of the Institute of Elec-
tronics and Communication Engineers of Japan, 57A (1974), 627–629. (Cited
on pp. 6, 7)
[202] D. M. Topkis, Minimizing a submodular function on a lattice, Operations
Research, 26 (1978), 305–321. (Cited on pp. 202, 244)
[203] D. M. Topkis: Supermodularity and Complementarity, Princeton University
Press, Princeton, NJ, 1998. (Cited on pp. 37, 244, 345)
[204] G. van der Laan, D. Talman, and Z. Yang: Existence of an equilibrium in a
competitive economy with indivisibilities and money, Journal of Mathematical
Economics, 28 (1997), 101–109. (Cited on p. 327)
[205] B. L. van der Waerden: Algebra, Springer-Verlag, Berlin, 1955. (Cited on
p. 73)
[206] R. J. Vanderbei: Linear Programming: Foundations and Extensions, 2nd ed.,
Kluwer Academic, Boston, 2001. (Cited on pp. 88, 99)
[207] R. S. Varga: Matrix Iterative Analysis, 2nd ed., Springer-Verlag, Berlin, 2000.
(Cited on p. 42)
[208] J. Vygen: A note on Schrijver’s submodular function minimization algorithm,
Journal of Combinatorial Theory (B), 88 (2003), 399–402. (Cited on p. 296)
[209] J. Wako: A note on the strong core of a market with indivisible goods, Journal
of Mathematical Economics, 13 (1984), 189–194. (Cited on p. 327)
[210] C. Wallacher and U. T. Zimmermann: A polynomial cycle canceling algorithm
for submodular ﬂows, Mathematical Programming, 86 (1999), 1–15. (Cited
on p. 313)
[211] D. J. A. Welsh: Matroid Theory, Academic Press, London, 1976. (Cited on
pp. 74, 279)
[212] N. White, ed.: Theory of Matroids, Cambridge University Press, London,
1986. (Cited on p. 74)
[213] N. White, ed.: Combinatorial Geometries, Cambridge University Press, Lon-
don, 1987. (Cited on pp. 74, 279)
[214] N. White, ed.: Matroid Applications, Cambridge University Press, London,
1992. (Cited on p. 74)
[215] W. Whiteley: Matroids and rigid structures, in: N. White, ed., Matroid Appli-
cations, Cambridge University Press, London, 1992, Chapter 1, 1–53. (Cited
on p. 361)sidca00si
2013/2/12
page 377
Bibliography 377
[216] W. Whiteley: Some matroids from discrete applied geometry, in: J. E. Bonin,
J. G. Oxley, and B. Servatius, eds., Matroid Theory, American Mathematical
Society, Providence, RI, 1996, 171–311. (Cited on p. 361)
[217] W. Whiteley: Rigidity and scene analysis, in: J. E. Goodman and J.
O’Rourke, eds., Handbook of Discrete and Computational Geometry, CRC
Press, Boca Raton, FL, 1997, 893–916. (Cited on p. 361)
[218] H. Whitney: On the abstract properties of linear dependence, American Jour-
nal of Mathematics, 57 (1935), 509–533. (Cited on pp. 5, 6, 8, 74)
[219] Z. Yang: Equilibrium in an exchange economy with multiple indivisible com-
modities and money, Journal of Mathematical Economics, 33 (2000), 353–365.
(Cited on p. 327)
[220] L. A. Zadeh and C. A. Desoer: Linear System Theory, McGraw-Hill, New
York, 1963. (Cited on pp. 351, 355)
[221] U. Zimmermann: Minimization of some nonlinear functions over polyma-
troidal network ﬂows, Annals of Discrete Mathematics, 16 (1982), 287–309.
(Cited on p. 176)
[222] U. Zimmermann: Negative circuits for ﬂows and submodular ﬂows, Discrete
Applied Mathematics, 36 (1992), 179–189. (Cited on p. 313)
Addition in 2nd Printing
[223] E. Altman, B. Gaujal, and A. Hordijk: Discrete-Event Control of Stochastic
Networks: Multimodularity and Regularity, Lecture Notes in Mathematics,
1829, Springer-Verlag, Heidelberg, Germany, 2003. (Not cited)
[224] S. Fujishige and A. Tamura: A general two-sided matching market with dis-
crete concave utility functions, Discrete Applied Mathematics, 154 (2006),
950–970. (Not cited)
[225] S. Fujishige and A. Tamura: A two-sided discrete-concave market with possi-
bly bounded side payments: An approach by discrete convex analysis, Math-
ematics of Operations Research, 32 (2007), 136–155. (Not cited)
[226] H. Hirai: A geometric study of the split decomposition, Discrete and Compu-
tational Geometry, 36 (2006), 331–361. (Not cited)
[227] H. Hirai and K. Murota: M-convex functions and tree metrics, Japan Journal
of Industrial and Applied Mathematics, 21 (2004), 391–403. (Not cited)
[228] W. T. Huh and G. Janakiraman: On the optimal policy structure in serial
inventory systems with lost sales, Operations Research, 58 (2010), 486–491.
(Not cited)
[229] T. Iimura, K. Murota, and A. Tamura: Discrete ﬁxed point theorem recon-
sidered, Journal of Mathematical Economics, 41 (2005), 1030–1036. (Not
cited)sidca00si
2013/2/12
page 378
## 378 Bibliography
[230] S. Iwata, S. Moriguchi, and K. Murota: A capacity scaling algorithm for M-
convex submodular ﬂow, Mathematical Programming, 103 (2005), 181–202.
(Not cited)
[231] Y. Kobayashi and K. Murota: Induction of M-convex functions by linking
systems, Discrete Applied Mathematics, 155 (2007), 1471–1480. (Not cited)
[232] Y. Kobayashi, K. Murota, and K. Tanaka: Operations on M-convex functions
on jump systems, SIAM Journal on Discrete Mathematics, 21 (2007), 107–
129. (Not cited)
[233] V. Kolmogorov and A. Shioura: New algorithms for convex cost tension prob-
lem with application to computer vision, Discrete Optimization, 6 (2009),
378–393. (Not cited)
[234] B. Lehmann, D. Lehmann, and N. Nisan: Combinatorial auctions with de-
creasing marginal utilities, Games and Economic Behavior, 55 (2006), 270–
296. (Not cited)
[235] S. Moriguchi and K. Murota: Discrete Hessian matrix for L-convex functions,
IEICE Transactions on Fundamentals of Electronics, Communications and
Computer Sciences, E88-A (2005), 1104–1108. (Not cited)
[236] S. Moriguchi and K. Murota: On discrete Hessian matrix and convex exten-
sibility, Journal of Operations Research Society of Japan, 55 (2012), 48–62.
(Not cited)
[237] S. Moriguchi, A. Shioura, and N. Tsuchimura: M-convex function minimiza-
tion by continuous relaxation approach—Proximity theorem and algorithm,
SIAM Journal on Optimization, 21 (2011), 633–668. (Not cited)
[238] K. Murota: Note on multimodularity and L-convexity, Mathematics of Oper-
ations Research, 30 (2005), 658–661. (Not cited)
[239] K. Murota: M-convex functions on jump systems: A general framework for
minsquare graph factor problem, SIAM Journal on Discrete Mathematics, 20
(2006), 213–226. (Not cited)
[240] K. Murota: Recent developments in discrete convex analysis, in: W. Cook, L.
Lovász, and J. Vygen, eds., Research Trends in Combinatorial Optimization,
Springer, Berlin, 2009, Chapter 11, 219–260. (Not cited)
[241] K. Murota: Submodular function minimization and maximization in discrete
convex analysis, RIMS Kokyuroku Bessatsu, B23 (2010), 193–211. (Not cited)
[242] K. Murota and K. Tanaka: A steepest descent algorithm for M-convex func-
tions on jump systems, IEICE Transactions on Fundamentals of Electronics,
Communications and Computer Sciences, E89-A (2006), 1160–1165. (Not
cited)
[243] A. Shioura: On the pipage rounding algorithm for submodular function max-
imization: A view from discrete convex analysis, Discrete Mathematics, Al-
gorithms and Applications, 1 (2009), 1–23. (Not cited)sidca00si
2013/2/12
page 379
Bibliography 379
[244] A. Shioura and K. Tanaka: Polynomial-time algorithms for linear and convex
optimization on jump systems, SIAM Journal on Discrete Mathematics, 21
(2007), 504–522. (Not cited)
[245] A. Tamura: Applications of discrete convex analysis to mathematical eco-
nomics, Publications of Research Institute for Mathematical Sciences, 40
(2004), 1015–1037. (Not cited)
[246] P. Zipkin: On the structure of lost-sales inventory models, Operations Re-
search, 56 (2008), 937–944. (Not cited)sidca00si
2013/2/12
page 380sidca00si
2013/2/12
page 381
Index
accurate number, 347
active triple, 297
acyclic, 107
admissible potential, 122
aﬃne hull, 78
agent, 324
aggregate cost function, 335
aggregation
of function to subset, 143, 162
by network transformation, 272
algebraically independent, 354
algorithm
competitive equilibrium, 344
conjugate scaling, 320
cycle-canceling, 313
domain reduction, 284
domain reduction scaling, 287
fully combinatorial, 290
greedy, 3, 108
IFF ﬁxing, 300
IFF scaling, 299
L-convex function minimization,
305, 306, 308
M-convex function minimization,
281, 283, 284, 287
primal-dual, 315
pseudopolynomial, 288
Schrijver’s, 293
steepest descent, 281, 305, 306
steepest descent scaling, 283, 308
strongly polynomial, 288
submodular function minimization,
293, 299, 300
successive shortest path, 312
two-stage, 310
weakly polynomial, 288
arc, 52
entering, 53
leaving, 52
augmenting path, 60, 273, 274
δ-, 297
auxiliary network, 252, 263
base, 105
extreme, 105
matrix, 69
matroid, 70
base family
matrix, 69
matroid, 70
valuated matroid, 72
base polyhedron, 18, 105
integral, 18
biconjugate function, 82
integer, 212
bipartite graph, 89
bipartite matching, 89
Birkhoﬀ’s representation theorem, 292
Boolean lattice, 104
boundary, 53
branch, 52
budget set, 324
certiﬁcate of optimality, 12
chain, 88
characteristic curve, 54, 251
discrete, 57
characteristic vector, 16
chemical process, 349
Choquet integral, 16, 104
closed convex function, 79
closed convex hull, 78
closed interval, 77
closure
381sidca00si
2013/2/12
page 382
## 382 Index
concave function, 216
convex function, 93
convex set, 78
coboundary, 53, 248
another convention, 253
cocontent, 55
combinatorial optimization, 3
commodity
divisible, 327
indivisible, 323
compartmental matrix, 43
competitive economy, 324
competitive equilibrium, 325
complementarity, 88
complements, 62
concave closure, 216
concave conjugate, 11, 81
discrete, 212
concave extensible, 93
concave extension, 93
concave function, 9, 78
quasi-separable, 334
separable, 333
conductance, 41
cone, 78
convex, 78
L-convex, 131
M-convex, 119
polar, 82
conformal decomposition, 64
conjugacy theorem
closed proper M-/L-convex, 210
in convex analysis, 11, 82
discrete M-/L-convex, 30, 212
polyhedral M-/L-convex, 209
conjugate function
concave, 81, 212
convex, 81, 212
conjugate scaling, 319
conjugate scaling algorithm, 320
conservation law, 54
constitutive equation, 54, 349
constraint, 1
consumer, 323
consumption, 323
content, 55
contraction
normal, 45
unit, 45
convex closure
function, 93
set, 78
convex combination, 78
convex cone, 78
convex conjugate, 10, 81
discrete, 212
convex extensible, 93
convex extension, 93
local, 93
convex function, 2, 9, 77
closed, 79
dual-integral polyhedral, 161
integral polyhedral, 161
laminar, 141
polyhedral, 80
positively homogeneous, 82
proper, 77
quadratic, 40
quasi, 168
quasi-separable, 140
separable, 10, 95, 140, 182
strictly, 77
univariate, 10
convex hull, 78
closed, 78
convex polyhedron, 78
convex program, 2
M-, 235
convex set, 2, 78
convexity
discrete midpoint, 23, 129, 180
function, 77
in intersection, 92
midpoint, 9
in Minkowski sum, 92
quasi, 168
set, 78
convolution
inﬁmal, 80
integer inﬁmal, 143
by network transformation, 272
cost functionsidca00si
2013/2/12
page 383
Index 383
aggregate, 335
ﬂow, 53, 246, 255, 256
ﬂow boundary, 256
producer’s, 324
reduced, 249
tension, 53
current, 41, 53
current potential, 55
cut capacity function, 247
cycle
negative, 122, 252, 263
simple, 62
cycle-canceling algorithm, 313
decreasing marginal return, 330
demand
correspondence, 325
set, 325
descent direction, 147
diagonal dominance, 41
directed graph, 52, 88
directional derivative, 80
Dirichlet form, 45
discrete Legendre–Fenchel transforma-
tion, 13, 212
discrete midpoint convexity
function, 23, 180
set, 129
discrete separation theorem
generic form, 13, 216
L-convex function, 218
L-convex set, 36, 126
M-convex function, 217
M-convex set, 36, 114
submodular function, 17, 111
submodular function (as special
case of L-separation), 33, 224
discreteness
in direction, 10
in value, 13
distance function, 122
distributive lattice, 292
distributive law, 292
divisible commodity, 327
domain reduction algorithm, 284
domain reduction scaling algorithm,
287
dual-integral polyhedral
convex function, 161
L-convex function, 191
M-convex function, 161
dual integrality
intersection theorem, 20, 114
linear programming, 89
minimum cost ﬂow problem, 252
polyhedral convex function, 161
polyhedral L-convexfunction, 191
polyhedral M-convex function, 161
submodular ﬂow problem, 261
dual linear program, 87
dual problem, 87
dual variable, 53
duality, 2, 11
Edmonds’s intersection theorem,
20
Fenchel, 85
Fenchel-type, 222, 225
L-separation, 218
linear programming, 87
M-separation, 217
matroid intersection, 225
separation for convex functions,
84
separation for convex sets, 35, 83
separation for L-convexfunctions,
218
separation for M-convex functions,
217
separation for submodular func-
tions, 17, 111
strong, 87
valuated matroid intersection, 225
weak, 87
weight splitting, 34, 225
dynamical degree, 352
economy
of Arrow–Debreu type, 323
Edmonds’s intersection theorem, 3, 20,
112sidca00si
2013/2/12
page 384
## 384 Index
(as special case of Fenchel-type
duality), 34, 224
eﬀective domain
function over Rn
, 9, 21, 77
function over Zn
, 21
set function, 103
electrical network, 41, 43, 348
multiterminal, 53
elementary vector, 64
entering arc, 53
epigraph, 79
equilibrium
competitive, 325
economy, 325
electrical network, 55
exchange axiom
(B-EXC[R]), 118
(B-EXC+[R]), 118
(B-EXC[Z]), 18, 101
(B-EXC+[Z]), 102
(B-EXC−[Z]), 103
(B-EXCw[Z]), 103
(B
-EXC[R]), 118
(B
-EXC[Z]), 117
local, 135
M-convex function, 26, 58, 133
M-convex polyhedron, 118
M-convex set, 18, 101
M
-convex function, 27, 134
M
-convex polyhedron, 118
M
-convex set, 117
(M-EXC[R]), 29, 56, 160
(M-EXC
[R]), 160
(M-EXC[Z]), 26, 58, 133
(M-EXC
[Z]), 26, 133
(M-EXCloc[Z]), 135
(M-EXCw[Z]), 137
(M
-EXC[R]), 29, 47, 162
(M
-EXC
[R]), 162
(M
-EXC+
[R]), 48
(M
-EXC[Z]), 27, 134
(M
-EXC
[Z]), 134
(−M
-EXC[Z]), 330
matroid, 69
multiple, 333
polyhedral M-convex function, 29,
56, 160
polyhedral M
-convexfunction, 29,
47, 162
simultaneous, 69
weak, 137
exchange capacity, 284, 312
exchange economy, 327
extension
concave, 93
convex, 93
distance function, 165
local convex, 93
Lovász, 16, 104, 111
partial order, 108
set function, 16, 104
extreme base, 105
Farkas lemma, 50, 87
feasible
δ-, 296
dual problem, 236
ﬂow, 247, 258
minimum cost ﬂow problem, 247
potential, 122
primal problem, 235
set, 1
submodular ﬂow problem, 258
Fenchel duality, 12, 85
Fenchel transformation, 81
Fenchel-type duality
generic form, 13
L-convex function, 32, 222
M-convex function, 32, 222
submodular function, 225
ﬁxed constant, 347
ﬂow, 53
δ-feasible, 296
feasible, 247, 258
Frank’s discrete separation theorem,
17, 111
(as special case of L-separation),
33, 224
Frank’s weight-splitting theorem, 34,
225
fully combinatorial algorithm, 290sidca00si
2013/2/12
page 385
Index 385
fundamental circuit, 149
g-polymatroid, 117
generalized polymatroid, 117
generator, 45
global minimizer, 79
global optimality, 2
global optimum, 9
goods
divisible, 327
indivisible, 323
gradient, 80
graph
acyclic, 107
bipartite, 89
directed, 52, 88
Grassmann–Plücker relation, 69
greedy algorithm, 3, 108
gross substitutes property, 153, 331
stepwise, 155, 331
ground set, 70
gyrator, 361
Hamiltonian path problem, 257
hole free, 90
ideal, 107
IFF ﬁxing algorithm, 300
IFF scaling algorithm, 298, 299
in kilter, 314
inaccurate number, 347
incidence
chain, 88
graph, 88
topological, 347
income, 324
independent set
matrix, 68
matroid, 70
indicator function, 79, 90
indivisible commodity, 323
indivisible goods, 323
inﬁmal convolution, 80
integer, 143
by network transformation, 272
initial endowment, 324
total, 326
initial vertex, 53
inner product, 79
integer biconjugate, 212
integer inﬁmal convolution, 143
integer interval, 92
integer subdiﬀerential, 166
integral base polyhedron, 18
integral L-convex polyhedron, 131
integral M-convex polyhedron, 118
integral neighborhood, 93
integral polyhedral
convex function, 161
L-convex function, 191
L
-convex function, 192
M-convex function, 161
M
-convex function, 162
integral polyhedron, 90
integrality
dual, 161, 252, 261
linear programming, 89
minimum cost ﬂow problem, 252
polyhedral convex function, 161
polyhedral L-convexfunction, 191
polyhedral M-convex function, 161
polyhedron, 90
primal, 252, 261
submodular ﬂow problem, 261
integrally concave function, 94
integrally convex function, 7, 94
submodular, 189
integrally convex set, 96
intersection
convexity in, 92
M-convex, 219
matroid, 3
submodular polyhedron, 20
valuated matroid, 225
intersection theorem
Edmonds’s, 3, 20, 112
Edmonds’s (as special case of Fenchel-
type duality), 34, 224
M-convex, 219
valuated matroid, 225
weighted matroid, 225
intervalsidca00si
2013/2/12
page 386
## 386 Index
closed, 77
integer, 92
open, 77
jump system, 120
kilter
diagram, 53, 251
in, 314
out of, 314
Kirchhoﬀ’s law, 349
current, 353
voltage, 353
Kőnig–Egervárytheorem for mixed ma-
trix, 358
L-concave function, 22
polyhedral, 190
L-convex cone, 131
L-convex function, 8, 22, 177
dual-integral polyhedral, 191
integral polyhedral, 191
polyhedral, 190
positively homogeneous, 193
quadratic, 52, 182
quasi, 199
semistrictly quasi, 199
L-convex polyhedron, 123, 131
integral, 131
L-convex set, 22, 121
L-optimality criterion, 185, 193
quasi, 201
L-proximity theorem, 186
quasi, 201
L-separation theorem, 33, 218
L2-optimality criterion, 232
L2-proximity theorem, 232
L2-convex function, 229
L2-convex set, 128
L
2-convex function, 229
L
2-convex set, 129
L
-convex function, 8, 23, 178
integral polyhedral, 192
polyhedral, 192
quadratic, 48, 52, 182
L
-convex polyhedron, 129, 131
L
-convex set, 121, 128
Lagrange duality, 234
Lagrangian function, 236
dual, 242
laminar convex function, 141
by network transformation, 273
laminar family, 141
Laplace transform, 351
lattice, 292
distributive, 292
sub-, 104
leading principal minor, 40
leading principal submatrix, 40
leaving arc, 52
Legendre–Fenchel transform
concave, 11, 81
convex, 10, 81
discrete, 13, 212
Legendre–Fenchel transformation
concave, 11, 81
convex, 10, 81
discrete, 13, 212
Legendre transformation, 81
level set, 172
linear extension
partial order, 108
set function, 16, 104
linear order, 108
linear program, 87
dual problem, 87
primal problem, 87
linear programming, 86
duality, 87
linearity in direction 1, 177, 190
local convex extension, 93
local optimality, 2
local optimum, 10
Lovász extension, 16, 104, 111
LP, 87
duality, 87
M-concave function, 8, 26
polyhedral, 160
M-convex cone, 119
M-convex function, 8, 26, 133
dual-integral polyhedral, 161sidca00si
2013/2/12
page 387
Index 387
integral polyhedral, 161
polyhedral, 160
positively homogeneous, 164
quadratic, 52, 139
quasi, 169
semistrictly quasi, 169
M-convex intersection
problem, 219, 264
theorem, 219
M-convex polyhedron, 108, 118
integral, 118
M-convex program, 235
M-convex set, 27, 101
M-convex submodular ﬂow problem,
256
economic equilibrium, 341
M-matrix, 42
M-minimizer cut, 149
with scaling, 158
M-optimality criterion, 148, 163
quasi, 173
M-proximity theorem, 156
quasi, 174
M-separation theorem, 33, 217
M2-optimality criterion, 227, 228
M2-proximity theorem, 228
M2-convex function, 226
M2-convex set, 116
M
2-convex function, 226
M
2-convex set, 117
M
-convex function, 8, 27, 134
integral polyhedral, 162
polyhedral, 161
quadratic, 48, 52, 139
M
-convex polyhedron, 117, 118
M
-convex set, 102, 117
Markovian, 45
matching, 89
bipartite, 89
perfect, 89
weighted, 89, 266
mathematical programming, 1
matrix
compartmental, 43
incidence (chain), 88
incidence (graph), 88
M-, 42
mixed, 354
mixed polynomial, 355
mixed skew-symmetric, 361
node admittance, 42
polynomial, 71, 354
positive-deﬁnite, 39
positive-semideﬁnite, 39
principal sub-, 40
totally unimodular, 88
matroid, 70
induction through a graph, 270
intersection problem, 34, 225
valuated, 72
max-ﬂow min-cut theorem
for submodular ﬂow, 259
maximum submodular ﬂow problem,
259
maximum weight circulation problem,
61
mechanical system, 350
midpoint convexity, 9
discrete function, 23, 180
discrete set, 129
Miller’s discrete convex function, 98
min-max relation, 2
minimizer, 79
global, 9, 79
integrally convex function, 94
L-convex function, 185, 305
L2-convex function, 232
local, 10
M-convex function, 148, 281
M2-convex function, 227, 228
maximal, 290, 291, 304, 307
minimal, 290, 291, 305, 307
submodular set function, 288
minimizer cut
M-convex function, 149
M-convex function with scaling,
158
quasi M-convex function, 174
quasi M-convex function with scal-
ing, 175
minimum cost ﬂow problem, 53, 245sidca00si
2013/2/12
page 388
## 388 Index
integer ﬂow, 246
minimum cut, 316
minimum spanning tree problem, 149
Minkowski sum, 80, 90
convexity in, 92
discrete, 90
integral, 90
minor, 40, 359
leading principal, 40
principal, 40
mixed matrix, 354
mixed polynomial matrix, 355
mixed skew-symmetric matrix, 361
money, 323
monotonicity, 54
multimodular function, 183
multiple exchange axiom, 333
multiterminal electrical network, 53
negative cycle, 122, 252, 263
criterion, 252, 263, 264
negative support, 18
neighborhood, integral, 93
network, 53
auxiliary, 252, 263
electrical, 53
transformation by, 270
network ﬂow
duality, 268
electrical network, 41, 43
L-convexity, 24, 31, 56, 58, 270
M-convexity, 28, 31, 56, 58, 270
maximum weight circulation, 61
minimum cost ﬂow, 245
multiterminal, 53
submodular ﬂow, 255
no complementarities property, 332
strong, 332
node, 52
node admittance matrix, 42
normal contraction, 45
objective function, 1
oﬀ-diagonal nonpositivity, 41
open interval, 77
optimal potential, 89, 251
optimal value function, 236
optimality
global, 2, 9
local, 2, 10
optimality criterion
integrally convex function, 94, 95
L-convex function, 185, 193
L2-convex function, 232
M-convex function, 148, 163
M-convex submodular ﬂow, 262–
264
M2-convex function, 219, 227, 228
minimum cost ﬂow, 249, 252
by negative cycle, 252, 263, 264
by potential, 249, 260, 262
quasi L-convex function, 201
quasi M-convex function, 173
submodular ﬂow, 260
submodular set function, 185
sum of M-convex functions, 219
valuated matroid intersection, 225
weighted matroid intersection, 225
optimization
combinatorial, 3
continuous, 1
discrete, 3
optimum
global, 9
local, 10
out of kilter, 314
pairing, 79
parallel, 62
partial order
acyclic graph, 107
extreme base, 108
perfect matching, 89
minimum weight, 89, 266
Poisson equation, 41, 43, 47
polar cone, 82
polyhedral
convex function, 25, 80
L-concave function, 190
L-convex function, 190
L
-convex function, 192
M-concave function, 160sidca00si
2013/2/12
page 389
Index 389
M-convex function, 160
M
-convex function, 161
method, 8
polyhedron
base, 105
convex, 78
integral, 90
integral L-convex, 131
integral M-convex, 118
L-convex, 123, 131
L
-convex, 129, 131
M-convex, 108, 118
M
-convex, 117, 118
rational, 90
submodular, 112
polynomial matrix, 71, 354
mixed, 355
polytope, 90
positive deﬁnite, 39
positive semideﬁnite, 39
positive support, 18
positively homogeneous
function, 7, 82
L-convex function, 193
M-convex function, 164
potential, 41, 53, 89, 248
criterion, 249, 260, 262
optimal, 251
primal-dual algorithm, 315
primal integrality, 252, 261
intersection theorem, 20, 114
linear programming, 89
primal problem, 87
principal minor, 40
principal submatrix, 40
leading, 40
producer, 323
production, 323
proﬁt, 324
function, 324
projection
base polyhedron, 117
function to subset, 143, 162
M-convex function, 134
M-convex polyhedron, 118
M-convex set, 102
M2-convex function, 226
M2-convex set, 117
polyhedral M-convex function, 161
proper convex function, 77
proximity theorem, 156
L-convex function, 186
L2-convex function, 232
M-convex function, 156
M2-convex function, 228
quasi L-convex function, 201
quasi M-convex function, 174
pseudopolynomial algorithm, 288
quadratic
form, 39
function, 39
L-convex function, 182
L
-convex function, 48, 52, 182
M-convex function, 139
M
-convex function, 48, 52, 139
quasi convex, 168
semistrictly, 168
quasi L-convex function, 199
quasi L-optimality criterion, 201
quasi L-proximity theorem, 201
quasi linear, 324
quasi M-convex function, 169
quasi M-minimizer cut, 174
with scaling, 175
quasi M-optimality criterion, 173
quasi M-proximity theorem, 174
quasi-separable
concave function, 334
convex function, 140
quasi submodular, 198
semistrictly, 198
rank function
matrix, 69
matroid, 70
rational polyhedron, 90
reduced cost, 249, 251
relative interior, 78
reservation value function, 325
resistance, 41
resolvent, 45sidca00si
2013/2/12
page 390
## 390 Index
resource allocation problem, 4, 176
restriction
function to interval, 92
function to subset, 143, 162
L-convex function, 178
L-convex polyhedron, 131
L-convex set, 121
L2-convex function, 229
L2-convex set, 129
polyhedral L-convex function, 192
rigidity, 361
ring family, 104, 107, 292
saddle-point theorem, 238
scaling, 145
conjugate, 319
cost, 318
domain, 145
nonlinear, 170, 199
scaling algorithm
L-convex function, 308
M-convex function, 283, 287
M-convex submodular ﬂow, 320
semigroup, 45
semistrictly quasi convex, 168
semistrictly quasi L-convex, 199
semistrictly quasi M-convex, 169
semistrictly quasi submodular, 198
separable concave function, 333
quasi, 334
separableconvex function, 10, 95, 140,
182
with chain condition, 182
quasi, 140
separation theorem
convex function, 2, 11, 84
convex set, 35, 83
generic discrete, 13, 216
L-convex function, 218
L-convex set, 36, 126
M-convex function, 217
M-convex set, 36, 114
submodular function, 17, 111
series, 62
simple cycle, 62
single improvement property, 332
spanning tree, 149
stable marriage problem, 345
stable matching problem, 345
steepest descent algorithm
L-convex function, 305, 306
M-convex function, 281
steepest descent scaling algorithm
L-convex function, 308
M-convex function, 283
stepwise grosssubstitutes property, 155,
331
stoichiometric coeﬃcient, 350
strictly convex function, 77
strong duality, 87
strong no complementarities property,
332
strongly polynomial algorithm, 288
structural equation, 54, 349
subdeterminant, 40, 359
subdiﬀerential, 80
concave function, 217
discrete function, 166
integer, 166
subgradient, 80
discrete function, 166
sublattice, 104
submatrix
leading principal, 40
submodular, 62, 206
function, 16, 44, 70, 104
function on distributive lattice, 292
integrally convex function, 7, 189
polyhedron, 20, 112
utility function, 330
submodular ﬂow problem, 255
economic equilibrium, 341
feasibility theorem, 258
M-convex, 256
maximum, 259
submodular function minimization
IFF ﬁxing algorithm, 300
IFF scaling algorithm, 298, 299
Schrijver’s algorithm, 293
submodularity, 44, 177, 190
inequality, 16, 44, 177
local, 180sidca00si
2013/2/12
page 391
Index 391
substitutes, 62
successive shortest path algorithm, 312
sum
of functions, 80
of M-convex functions, 226
supermodular, 16, 62, 105, 145, 206
function, 105
supply
correspondence, 324
set, 324
support
function, 82
negative, 18
positive, 18
system parameter, 347
tension, 53
another convention, 253
terminal vertex, 52, 53
tight set, 108
transformation by network, 269
of ﬂow type, 269
of potential type, 269
transitive, 107, 119
translation submodularity, 23, 44, 178
triangle inequality, 24, 122
two-stage algorithm, 310
unimodular
totally, 88
unique-min condition, 266
unit contraction, 45
unit demand preference, 334
univariate function, 10
discrete convex, 95
polyhedral convex, 80
utility function, 324
valuated matroid, 7, 72, 225
intersection problem, 225
valuation, 72
variational formulation, 43, 55
vertex, 52
initial, 53
terminal, 53
voltage, 41, 53
voltage potential, 55
weak duality, 87
weak exchange axiom, 137
weakly polynomial algorithm, 288
weight splitting
matroid intersection, 34, 225
valuated matroid intersection, 225
z-transform, 355