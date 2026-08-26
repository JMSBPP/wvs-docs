import [*](~/learning/cfmm-theory/cfmm-banking/notes/models/MONTI_KLEIN.md)

[3.9.1]()

Assume that the financial intermediary lends the total borrowed liquidity stock
\(B\) to a representative borrower.

The borrower invests the entire amount \(B\) in a risky technology with random
net return \(\widetilde{r}\).

In the absence of collateral, the repayment received by the intermediary is

\[
\begin{aligned}
\pi^{Repay}(\widetilde{r};B)
&\overset{D}{=}
\min
\Big(
r_L(B),
\widetilde{r}
\Big)\,B.
\end{aligned}
\]

Equivalently,

\[
\begin{aligned}
\pi^{Repay}(\widetilde{r};B)
=
\begin{cases}
\widetilde{r}\,B,
&
\widetilde{r}<r_L(B),
\\[1em]
r_L(B)\,B,
&
\widetilde{r}\ge r_L(B).
\end{cases}
\end{aligned}
\]

When

\[
\widetilde{r}<r_L(B) \, \implies \, \pi^{\text{Liquidation}}  (\underbrace{\omega_f}_{\text{firm defaults}} \equiv \widetilde{r}<r_L(B)) \, = \, (1 \, + \, \tilde{r}) \, B
\]


- (i) 

$$
\begin{aligned}
	\omega_f \quad \wedge \quad  E^{FI}  (\cdot) \, = \, 0 \, \implies \, \Big (\, \omega_{FI} \, \iff \,  \tilde{r} \, < \tilde{r}^{\star}\, \Big)
\end{aligned}
$$; compute $\tilde{r}^{\star}$

- (ii)

#### **Solution**

- (i)
\[
\begin{aligned}
	E^{FI}  (\cdot) \, = \, 0 \, \overbrace{\implies}^{\text{solvency}} \, \pi^{FI} \, (L, B) > \, 0 \\
	\\
	\pi^{FI} \, (L, B; \, \cdot) = \, 0 \\
	\\
	\implies \, \tilde{r}^{\star} \, = \, r_M \, - \, \Big [\, (1-m) \, r_M\, - r_L\Big]  \, L/B
\end{aligned}
\]
