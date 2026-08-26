

(Discrete-calculus foundations are imported per-file below; implementation docs live in the external `~/cfmm-playground/cavRel-contracts` repo.)


Consider the underling bonding curve of a \(\alpha\) - indexed *digital commodity* sub-net investment market at tick \(i\):

\[
	\begin{aligned}
		\varphi \, (\, \eta \, ;\,  X^{(\alpha)} \, (i)\, Y^{(\tau)} \, (i)\, , i) \, &= \, X^{(\alpha)} \, (i)^{\eta} \, Y^{(\tau)} \, (i)^{1\, -\, \eta}
	\end{aligned}
\];

Take \(\mathbf{D}_c (N)\, := \{1, \, \cdots\, , N\}\) digital commoditiesl; each with bonding market \(\varphi_{i \, \in \, \mathbf{D}_c}\)

<!-- PROVENANCE (corrected 2026-06-20): `taoDynamics.pdf` is NOT a Bittensor/dTAO
     whitepaper. `pdfinfo` reports it as Maymin, "Option Pricing on Automated Market
     Maker Tokens" (arXiv 2603.29763) — the AMM-token-as-CEV-process lens used here,
     NOT a primary spec of TAO's liquidity policy. The canonical dTAO emission/Yuma
     reward spec is a SEPARATE, still-missing source (see TODO on reward mechanism
     below). Lui & Sun, "Bittensor Protocol: The Bitcoin in Decentralized AI?"
     (arXiv 2507.02951) is the on-chain empirical reference. -->

Using the AMM-token pricing lens of Maymin, *Option Pricing on AMM Tokens* (`taoDynamics.pdf`, arXiv 2603.29763), we define *liquidity schedule policies*:


IMPORT [\mathbf{d}](../cfmm-discrete/DIFFERENTIATION.md)


\[
	\begin{aligned}
		\mathbf{d} \, L \, &:= \, \Big (\mathbf{d} \, L^{(\alpha)}, \mathbf{d} \, L^{(\tau)}\Big) 
	\end{aligned}
\]; s.t 

Given \(\mathbf{w}^{(d)} \, \in \, (0,1)\)by the protocol and at \(\{p_{\alpha_i}\}_{i \, \in \mathbf{D}_c}\) prices:

\[
	\begin{aligned}
		\forall_{i\, \in \, \mathbf{D}_c} \, \quad 
		\begin{cases}
			\mathbf{d} \, L^{(\alpha_i)} \, \equiv \mathbf{w}^{(d)}\, \mathbf{d} \, L^{(\alpha_i)} \, +\, (1\, -\, \mathbf{w}^{(d)}) \, \mathbf{d} \, L^{(\alpha_i)}\
			\\
			\frac{\mathbf{d} \, L^{(\alpha_i)}}{p_{\alpha_i}} \, \overset{I}{\equiv} \, \mathbf{d} \, \bar M^{(\tau)} \, s_i\\
			\\
			\mathbf{w}^{(d)}\, \mathbf{d} \, L^{(\alpha_i)} \, = \, \mathbf{d}\, \bar M^{\alpha_i}\\
			\\
			p_{\alpha_i} \, (1 \, - \, \mathbf{w}_i^{(d)}) \,  \mathbf{d} \, L^{(\alpha_i)} \, \overset{I}{\equiv} \,  p_{\alpha_i} \, \mathbf{d} \, \bar M^{(\tau)} \, s_i\\
			\\
			\mathbf{d} \, \bar M^{(\tau)} \, \overset{F}{=} \, \sum_{i \, \in \, \mathbf{D}_c} \, \mathbf{d} \, L^{(\tau)}
		\end{cases}
	\end{aligned}
\]

and \(M_{\text{max}}^{(\tau)} \, = \, 21e6\)

<!-- CORRECTION (2026-06-21): the per-subnet emission SHARE is FLOW-based, NOT price-weighted.
     The earlier price-weighted form 1/Σ_{j≠i} p_{α_j} was the DEPRECATED dTAO mechanism
     (subtensor `get_shares_price_ema`, now dead code). Verified against opentensor/subtensor@main
     (`coinbase/subnet_emissions.rs::get_shares_flow`) AND Maymin, "The Pricing of Options on
     AMM-Native Tokens" (arXiv 2603.29763 = taoDynamics.pdf). See the cfmms-playground
     EMISSION-LAYER.md / memory:dtao-emission-flow-based-corrected. -->

Where the per-subnet emission **share** \(s_i\) is FLOW-based — a moving average (EMA, half-life \(\sim\) 1 month) of net TAO **staking** flow, NOT a price weight — with protocol exponent \(p \in [1,\infty)\) (currently \(p = 1\), so the share is linear) and lower clip \(L\) (currently \(0\)):

\[
    \begin{aligned}
        s_i \, = \, \frac{z_i^{\, p}}{\sum_{j \, \in \, \mathbf{D}_c} \, z_j^{\, p}}, \qquad
        z_i \, = \, \max\!\Big( \, \mathrm{EMA}\big[\, \dot F^{(\tau_i)} \,\big] \, - \, L, \; 0 \,\Big), \qquad
        \dot F^{(\tau_i)} \, := \, \text{net TAO staking flow into } i \;\; (\text{driven by } I^{(\alpha_i)} = \partial_t X^{(\alpha_i)}).
    \end{aligned}
\]

The injection is **price-preserving**: the matching alpha inject \(\mathbf{d} L^{(\alpha_i)} = \mathbf{d} L^{(\tau_i)} / p_{\alpha_i}\) holds the spot \(P_{\alpha_i}\) fixed and grows the invariant \(K\). The *only* mechanical price move is the excess-TAO swap on alpha-injection-**capped** (high-price) subnets. The resulting price obeys a constant-elasticity-of-variance process

\[
    \mathbf{d} P_{\alpha_i} \, = \, \mu(P_{\alpha_i}) \, \mathbf{d} t \, + \, \delta \, P_{\alpha_i}^{\, \beta} \, \mathbf{d} W, \qquad \beta \, = \, \mathbf{w}^{(d)} \, = \, \tfrac{1}{2}
\]

driven by cumulative net staking flow [Maymin, Thm 1]. **NOTE \(\beta = \tfrac12\) is the MECHANICAL constant-product weight** (empirically \(\hat\beta \approx 0.52\) across 92 subnets) — it is NOT the demand elasticity \(\eta_{X^{(\alpha_i)} / P_{\alpha_i}}\) of TODO@198, which remains the free behavioral parameter to estimate.


Where given \(\mathbf{w}^{(s)}\, \mathbf{w}^{(v)} \, \mathbf{w}^{(m)} \, \in (0,1)\, , \, \sum \mathbf{w}^{(\cdot)} \, = \, 1 \)

\[
	\begin{aligned}
		\forall_{i \, \in \mathbf{D}_c} \quad \mathbf{d}\, \bar M^{\alpha_i} \, = \, \mathbf{w}_i^{(s)} \, \mathbf{d} \, L^{(\alpha_i)} \, + \, (1 \, - \, \mathbf{w}_i^{(s)}) \, \mathbf{d} \, L^{(\alpha_i)} \\
		\\
        1 \, - \, \mathbf{w}_i^{(s)} = \mathbf{w}_i^{(v)} \, + \, \mathbf{w}_i^{(m)} \\
		\\
		\mathbf{w}_i^{(s)}  \, \mathbf{d}\, \bar M^{\alpha_i} \, = \, (1\, - \lambda_i) \, \mathbf{w}_i^{(s)}  \, \mathbf{d}\, \bar M^{\alpha_i} \, + \, \lambda_i \, \mathbf{w}_i^{(s)}  \, \mathbf{d}\, \bar M^{\alpha_i}
	\end{aligned}
\]

Where given \(\bar \gamma^{(\tau)} \in (0,1)\), defining the savings stock as :


import [\(\int\)](../cfmm-discrete/INTEGRATION.md)

\[
	\begin{aligned}
		S^{(\tau)} \,(t) \, := \, \int_{s<t} \, S^{(\tau)} \,(s) \quad \, TS^{(\alpha)}  \, = \, X^{(\alpha)} \, + \, S^{(\alpha)}
	\end{aligned}
\]

> TODO: We are missing the non-integrated definition/realtion of savings with TAO holdings, etc

Define:

\[
    \begin{aligned}
		\lambda_i \, = \frac{\bar \gamma^{(\tau)}}{\bar \gamma^{(\tau)}\, S^{(\tau)} \, + \, S^{(\alpha_i)}} \quad 1 \, - \, \lambda_i \, = \, \frac{S^{(\alpha_i)}}{\bar \gamma^{(\tau)} \, S^{(\tau)}\, + \, S^{(\alpha)}} 
	\end{aligned}
\]


From this one obtains the root *risk-free* interest rate and \(\alpha_i - \) *return-rate* given \(\bar \beta \, \in \, (0,1)\) at some maturity \(T\):

\[
r_F^{(i)}(T;\cdot)
=
\frac{1}{S^{(\tau)}}
\left[
\sum_{t}^{T}
\frac{
\bar{\gamma}^{(\tau)}
\,\bar{\beta}\,
\overline{\Delta M}^{(\alpha_i)}
}
{
\bar{\gamma}^{(\tau)}S^{(\tau)}
+
S^{(\alpha)}(0)
+
t\,\overline{\Delta M}^{(\alpha_i)}
}
\right].
\]

\[
r^{(\alpha_i)}(\bar{T};\cdot)
=
\frac{1}{S^{(\alpha)}(0)}
\left[
\sum_{t}^{T}
\left(
\frac{
\left(
S^{(\alpha)}(0)
+
t\,\overline{\Delta M}^{(\alpha_i)}
\right)
\bar{\beta}\,
\overline{\Delta M}^{(\alpha_i)}
}
{
\bar{\gamma}^{(\tau)}S^{(\tau)}
+
S^{(\alpha)}(0)
+
t\,\overline{\Delta M}^{(\alpha_i)}
}
\right)
\right].
\]



import [\(\partial_t\)](../cfmm-discrete/BINARY_TREES.md)

Define the \(\alpha_i\)-investment flow at time \(t\) as :


\[
	\begin{aligned}
		I^{(\alpha_i)} \, &:= \, \partial_t \, X^{(\alpha_i)}
	\end{aligned}
\]
 
# PROTOCOL DESIGN SPACE

The protocol taken as given all the above **state** with the high-level goal of financial intermediation (a.k.a \(I^{(\alpha_i)} \to  S^{(t)}\to I^{(\alpha_i)}\))

defines their relative prices subject to its financial intermediation and has as control **input** the investment demand as the aggregate of asset demands:

\[
	\begin{aligned}
		I^{D} \, &= \Sigma \, \Big ( \cdot ; I^{(\alpha_i)} \, \Big )
	\end{aligned}
\]

Given cash-flows are implied by the investment market bonding curve:

\[
	\begin{aligned}
		\mathbf{d}\, Y^{(\tau)} \, = \, \Phi_{\varphi} \, ( \cdot ; \mathbf{d}\, X^{(\alpha_i)})
	\end{aligned}
\]

As **output** there is the *price-impact* identity:

\[
	\begin{aligned}
		P_{\alpha_i} \, + \, \mathbf{d} \, P_{\alpha_i} \, \equiv \, \frac{Y^{(\tau)} \, + \, \mathbf{d} \, Y^{\tau}}{X^{(\alpha_i)} \, + \, \mathbf{d} \, X^{(\alpha_i)}}
	\end{aligned}
\];



## ASSET DEMAND MODEL


import [M^{\cdot}](../cfmm-discrete/DISCRETE_CONVEX.md)

We approach this by the discrete calculus set up defininin a matroid concave aggregate valuation function:

\[
	\begin{aligned}
		\mathcal{V} : \mathcal{F} \subseteq \mathcal{P} \, (\mathbf{D}_c) \to \mathbb{R}_+ \, \overset{R}{=} \, Q128.128
	\end{aligned}
\]

> TODO: How can this be done empirically, from the tao stats API, stablishing model and equations from the elasticities of demand ? \(\eta_{X^{(\alpha_i)} / P_{\alpha_i}}\)

> TODO: We are missing the actual protocol reward mechanism which they define and must also help provide insights to the protocol we are buidling
> This is how they define their production process when receiving investment and transform it in output 




