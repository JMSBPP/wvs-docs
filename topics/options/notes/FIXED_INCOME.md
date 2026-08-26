 	
\[
\pi^{ZCB}(T)
\overset{D}{=}
1
\]


Which price is: 
\[
P^{ZCB}(t,T)
\overset{D}{=}
\mathbb E_t^{\mathbb Q}
\left[
\frac{\pi^{ZCB}(T)}
{(1+r_f)^{T-t}}
\right]
=
\frac{1}{(1+r_f)^{T-t}}.
\]


Then the perpetuity payoff constructed from aggregating ZCB prices is defined as: 

\[
\pi^{ZCB\text{-}Perp}(t;\cdot)
\overset{D}{=}
\lim_{T\to\infty}
\sum_{\tau=t+1}^{T}
\pi^{ZCB}(\tau).
\]


If $r_f$ is constant:

\[
\begin{aligned}
P_{\pi^{ZCB\text{-}Perp}}(t;\cdot)
&\overset{D}{=}
\lim_{T\to\infty}
\sum_{\tau=t+1}^{T}
P^{ZCB}(t,\tau)
\\[1em]
&=
\lim_{T\to\infty}
\sum_{\tau=t+1}^{T}
\frac{1}{(1+r_f)^{\tau-t}}
\\[1em]
&=
\frac{1}{\overline r_f(t)}.
\end{aligned}
\]



\[
\begin{aligned}
\pi^{ZCB\text{-}Perp}(t;\cdot)
&\overset{R}{=}
P_{\pi^{ZCB\text{-}Perp}}(t;\cdot)
\\[1em]
&=
\frac{1}{\overline r_f(t)}
\\[1em]
&\iff
\overline r_f(t)
\overset{D}{=}
\frac{1}
{P_{\pi^{ZCB\text{-}Perp}}(t;\cdot)}.
\end{aligned}
\]

By construction, the perpetual claim satisfies

\[
P_{\pi^{Perp}}(t-1;\cdot)\,
\overline r_f(t-1)
\overset{D}{=}
1.
\]

Hence, holding $\Delta B(t-1)$ units of perpetual claims implies

\[
\Delta B(t-1)\,
P_{\pi^{Perp}}(t-1;\cdot)\,
\overline r_f(t-1)
\overset{D}{=}
\Delta B(t-1),
\]

meaning that one unit of account is replicated by the value of the
perpetual claim discounted by the long-run risk-free rate.


The *effective rate of return* is defined as:

\[
R_{\pi}(t)
\overset{D}{=}
\frac{
P_{\pi}(t)-P_{\pi}(t-1)
}{
P_{\pi}(t-1)
}.
\]


And, the *expected rate of return*:

\[
\mathbb{E}R_{\pi}(t)
\overset{D}{=}
\frac{
\mathbb E_t
\!\left[
P_{\pi}(t+1)
\right]
-
P_{\pi}(t)
}{
P_{\pi}(t)
}.
\]


Then:

\[
\mathbb{E}R_{\pi}(t)
=
\overline r_f(t)
+
\beta
\left[
\frac{
\mathbb E_t
\!\left[
P_{\pi}(t+1)
\right]
-
P_{\pi}(t)
}{
P_{\pi}(t)
}
\right].
\]

Where :
\[
\beta
\overset{D}{=}
\text{confidence coefficient attached to expected capital gains}.
\]

Th, household portafolio-decision vector


\[
F(t)
\overset{D}{=}
\begin{bmatrix}
P_{\pi}
\\[0.8em]
\mathbb{E}R_{\pi}
\\[0.8em]
\beta
\end{bmatrix}\, (t)
\]


which reads as:

\[
F(t)
=
\begin{bmatrix}
\text{Am I buying at a fair price?}
\\[0.8em]
\text{Do I expect to sell at a fair price?}
\\[0.8em]
\text{How confident am I in that expectation?}
\end{bmatrix}.
\]

Equivalently:

\[
F(t)
=
\begin{bmatrix}
\text{current market valuation of the claim}
\\[0.8em]
\text{expected future appreciation of the claim}
\\[0.8em]
\text{confidence in expected appreciation}
\end{bmatrix}.
\]


The wealth accumulation attributable to savings value shocks is defined as:

$$
\begin{aligned}
	\frac{\Delta_t \, W_S }{\Delta \, V_{\pi \, \cdot}}
\end{aligned}
$$

Where:

$$
\begin{aligned}
	V_{\pi} \, (t; \cdot) \, &\overset{D}{=} \, B(t) \, P_{\pi}\, (t) \\
	\\
	\Delta_t \, V_{\pi} \, (t; \cdot) \, &= \, \underbrace{\Delta_t \, B\, P_{\pi}\, (t)}_{\text{savings shock}} \, + \, \underbrace{\Delta_t P_{\pi}\, B\, (t-1)}_{\text{capital gain}}  	
\end{aligned}
$$

