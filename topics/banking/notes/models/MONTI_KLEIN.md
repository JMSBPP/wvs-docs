


import [*](~/learning/cfmm-theory/cfmm-banking/notes/INIT.md)



# MONOPOLY

Given $(r_M, E^{FI})$;

\[
\begin{aligned}
r_B &= r_B(B),
\qquad
\Delta_B r_B(B)<0
\\
r_L &= r_L(L),
\qquad
\Delta_L r_L(L)>0
\end{aligned}
\]

where:

\[
\begin{aligned}
\Delta_B r_B(B)
&\overset{D}{=}
r_B(B+\Delta B)-r_B(B)
\\
\Delta_L r_L(L)
&\overset{D}{=}
r_L(L+\Delta L)-r_L(L).
\end{aligned}
\]

Then the elasticities of the demand for loans and suppoly of deposits are defined as:

\[
\begin{aligned}
\eta_B
&\overset{D}{=}
\frac{\Delta_B r_B(B)}{\Delta B}
\frac{B}{r_L(B)}
\\[1em]
\eta_L
&\overset{D}{=}
\frac{\Delta_L r_L(L)}{\Delta L}
\frac{L}{r_L(L)}.
\end{aligned}
\]


\[
\begin{aligned}
\pi^{FI}(L,B;E^{FI})
&\overset{D}{=}
r_B(B)B
-
r_L(L)L
+
r_M N^{FI}(L,B;m)
-
C(L,B)
\\
&=
r_L(B)B
-
r_L(L)L
+
r_M\big((1-m)L-B\big)
-
C(L,B)
\\
&=
\big(r_B(B)-r_M\big)B
+
\big((1-m)r_M-r_L(L)\big)L
-
C(L,B).
\end{aligned}
\]


\[
\begin{aligned}
\max_{L,B}
\quad
\Pi^{FI}(L,B;E^{FI})
\end{aligned}
\]



# OLIGOPOLY


% ============================================================
% INFORMATION SET OF INTERMEDIARY j
% ============================================================

\[
\begin{aligned}
Q_{FI}^{(j)}
&\overset{D}{=}
\Big\{
(L_i,B_i)
\Big\}_{i=1}^{N^{FI}}
\end{aligned}
\]

\[
\begin{aligned}
Q_{FI}^{(j)}
&=
\left(
L_1,\ldots,L_{N^{FI}},
B_1,\ldots,B_{N^{FI}}
\right)
\end{aligned}
\]


% ============================================================
% PROFIT FUNCTIONAL
% ============================================================

Given $\# FI$ for FI $j$, given $Q_{FI}^{(j)} \, \equiv \, (L_i, B_i)_{i}^{\# FI}$

\[
\begin{aligned}
\Pi_j^{FI}
\Big(
Q_{FI}^{(j)};\cdot
\Big)
\end{aligned}
\]

Assuming:

% ============================================================
% LINEAR INVENTORY / WAREHOUSING COSTS
% ============================================================

\[
\begin{aligned}
C_{FI}(L,B)
&\overset{D}{=}
\gamma_LL+\gamma_BB
\end{aligned}
\]

\[
\begin{aligned}
\nabla C_{FI}(L,B)
&=
\begin{bmatrix}
\gamma_L\\
\gamma_B
\end{bmatrix}
\end{aligned}
\]


% ============================================================
% ELASTICITIES UNDER INTERMEDIARY COMPETITION
% ============================================================

\[
\begin{aligned}
\eta_B
&\overset{D}{=}
\eta_B
\!\left(
r_B^{\star},
\gamma_B,
\# FI
\right)
\\[1em]
\eta_L
&\overset{D}{=}
\eta_L
\!\left(
r_L^{\star},
\gamma_L,
\# FI
\right)
\end{aligned}
\]


% ============================================================
% COMPETITION EFFECT
% ============================================================

\[
\begin{aligned}
\frac{\partial \eta_B}{\partial N^{FI}}
&<0
\\
\frac{\partial \eta_L}{\partial N^{FI}}
&<0
\end{aligned}
\]

