


import [$\Delta i$](../cfmm-control/STATE_SPACE_2.md)

For pricing any convex payoff $\pi \, (|\beta| < 1; \cdot)$, the base (becase of the Carr-Madam theorem) is given by the price of the call, the put and a bond. These are the building blocks:

\[
	\begin{aligned}
		P_{\pi} \, (\phi ; \cdot) &= \, \Sigma \, \Big (P_{\text{call}} \, (\phi; \cdot)\, , \,  P_{\text{put}} \, (\phi; \cdot)\Big)
	\end{aligned}
\]

Given the risk-free rate \(r_f\); The *girsanov-kernel*:

\[
\begin{aligned}
	\varsigma \, (i) \, &= \frac{\mu_X \, (i) \, - r_f \, i}{\sigma_X \, (i)}
\end{aligned}
\];

realizes \(\mathbb{P} \, \to\, \mathbb{Q}\)s.t :
\[
	\begin{aligned}
 		\Delta \, i \, &\overset{\mathbb{Q}}{=} \, r_f \, i \, \Delta i + \sigma_X (i) \Delta \hat{W}^{\mathbb{Q}} \, (i)
	\end{aligned}
\];

On the price $P_X-$ space:

\[
	\begin{aligned}
		P_{\text{call}} \, (P_X \, (i), K, T; r_f \, ) \, &= \, P_X \,(i) \, \Big [1\, -\, \varkappa^2 (a,b+2,c)\,\Big] \, - \, K\, e^{-r_f \, T} \, \varkappa^2 \, (c; b,a )
	\end{aligned}
\];

Where:
\[
	\begin{aligned}
		\varrho \, &= \, \frac{2\, r_f}{\delta \, (1 - \eta) (e^{2 \, r_f (1-\eta)\, T} \, - \,1 )} \\
		\\
		c \, (\varrho) \, &= \, \varrho \, P_X , (i)^{2\, (1 \, - \eta)} \, e^{2 \, r_f (1-\eta)\, T} \\
		\\
		a \, (\varrho) \, &= \, \varrho \, K^{2\, (1 \, - \, \eta)} \\
		\\
		b \, (\varrho) \, &= \, \frac{1}{1-\eta}
	\end{aligned}
\]

Thus;

\[
	\begin{aligned}
		P_{\text{put}} \, (\cdot ; r_f) \, &= \, P_{\text{call}} \, (\cdot; r_f \, ) \, - \, P_X \, (i) \, + \, K \, e^{-r_f \, T}
	\end{aligned}
\]


\[
\pi(P_X)
=
\int_0^\infty
w_C(K)\,(P_X-K)^+\,dK
+
\int_0^\infty
w_P(K)\,(K-P_X)^+\,dK .
\]

\[
P_\pi(i)
=
\int_0^\infty
w_C(K)P_C(i,K;\sigma_i)\,dK
+
\int_0^\infty
w_P(K)P_P(i,K;\sigma_i)\,dK .
\]

\[
\phi_\pi(i)
\overset{D}{=}
\frac{
\Delta P_\pi(i)
}{
\Delta X(i)
}.
\]


\[
L_\pi(i)
\quad\text{s.t.}\quad
\phi_\pi(i)\Delta X(i)L_\pi(i)
\approx
\Delta P_\pi(i).
\]


\[
\Delta P_\pi(i)
=
\phi_\pi(i)
\Delta X(i)
L_\pi(i).
\]

\[
\boxed{
L_\pi(i)
=
\frac{
\Delta P_\pi(i)
}{
\phi_\pi(i)\Delta X(i)
}.
}
\]


