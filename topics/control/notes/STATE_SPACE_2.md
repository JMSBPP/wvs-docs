

# CANONICAL SYSTEM

\[
    \begin{aligned}

	OM \, (\cdot ; i) &\overset{d}{=} \, 
	\begin{bmatrix}
		\ell \, (\cdot ; i)\\
		\phi \, (\cdot ; i)
	\end{bmatrix}
	 &= \, 
		\begin{cases}
		\ell \, (\cdot ; i \, + i_{\text{next}}) \, &= \, \psi \, \Big ( \ell\, (\cdot; i )\, , \phi \, (\cdot; i) ,\, i\Big)
		\\
		\phi \, (\cdot ; i \, + i_{\text{next}}) \, &= \, \zeta \, \Big ( \ell\, (\cdot; i )\, , \phi \, (\cdot; i) ,\, i\Big)
		\end{cases}
	\end{aligned}
\]


# LINEAR SYSTEM
\[
	\begin{aligned}
			\ell \, (\cdot ; i \, + i_{\text{next}}) \, &\overset{L}{=} \, \partial_{\ell}  \, \ell\, (\cdot; i ) \, + \,  \partial_{(\phi,\ell)} \, \phi \, (\cdot; i) \\
		    \\
		    \phi \, (\cdot ; i \, + i_{\text{next}}) \, &\overset{L}{=} \, \, \partial_{(\ell, \phi)}  \, \ell\, (\cdot; i ) \, + \,  \partial_{\phi} \, \phi \, (\cdot; i)
	\end{aligned}
\]

## CONTROL SYSTEM :: EXOGENOUS TRADING FLOW

\[
	\begin{aligned}
			OM \, (\cdot ; i \, + i_{\text{next}}) \, &\overset{L}{=} \, \partial_{OM}  \, \ell\, (\cdot; i ) \, + \,  \partial_{(\Delta,OM)} \, \Delta \, (\cdot; i) \\
		    \\
		    \Gamma \, (\cdot;i)&\overset{d}{\equiv}\, \kappa \, (\cdot ; i ) \, &\overset{L}{=} \, \, \partial_{(OM, \kappa)}  \, OM\, (\cdot; i ) \, + \,  \partial_{(\Delta , \kappa)} \, \Delta \, (\cdot; i)
	\end{aligned}
\]


### CONTROLLER :: PROTOCOL-GAMMA-EXPOSURE

Subject to how to define \(\Delta i\) (*e.g* \(\Delta i = | i_{\text{nextInit}}\, - \, i_{\text{prevInit}} |\)), we have:

\[
	\begin{aligned}
		\frac{\Delta \, \phi}{\Delta i} \, \overset{d}{\equiv} \, \frac{\phi \, (i + \Delta i) \, - \, \phi \, (i)}{\Delta i}
	\end{aligned}
\]

Define the *protocol-gamma-fee-gradient controller* as:

\[
	\begin{aligned}
		\digamma_{(\phi, \Gamma)} \, (i) \, &\overset{d}{\equiv} \,  \frac{\Delta \, \phi}{\Delta \, i}
	\end{aligned}
\]

Thus; given \(\bar \Gamma_i\) a protocol target-tick gamma exposure:

\[
\begin{aligned}
	\phi \, (i + \Delta i) =  \phi (i) + \digamma_{(\phi, \Gamma)} \, (\bar \Gamma_i;i) \, \Delta i \\
	\\
	\implies \\
	\\
	\boxed{\digamma_{(\phi, \Gamma)} \, (\bar \Gamma_i;i) \, = \, 1/\alpha \, \bar \Gamma_i \, + \, \frac{\Delta}{\Delta \, i} \Big [\, (1 - \tau (i)) \, \frac{\Delta \pi}{\Delta \, X^{\text{TRANS}}} \Big ]} 
\end{aligned}
\]



For **observability** this claim is to be verified: 

import [\(\varphi \, (\cdot)\)](../cfmm-dgp/TRADING_FLOW.md)

\[
	\begin{aligned}
		\kappa_{\varphi} \, (i)\, &\propto \, \frac{\Delta}{\Delta \, \Delta X } \, \underbrace{\Big [ \frac{\Delta P_X}{\Delta \Delta X} \, (i)\Big]}_{\text{price impact}} \\
        &= \, \Gamma \, (\cdot ;i)
	\end{aligned}
\]

In particular for \(\eta = 1/2\), one has:

\[
	\begin{aligned}
		\Gamma_i \, (\frac{1}{2}; P_X (i) \,) \, = P_X \, (i)^{2/3}
	\end{aligned}
\]



## PRIMAL SPACE
For the primitive:

\[
	\begin{aligned}
		\ell \, (\, \xi\, , \iota \, ; i\, ) \, &= \, \frac{\xi^{(i - i_\mu) \, / \Delta_i}}{\sum_{z}^{\iota -1} \, \xi^z} \,\quad z:= \frac{i - i_\mu}{ \Delta_i} \, < \iota \, \quad \, \xi \, \in \text{Q96} / \{1\}\\
		\\
	    &= \, \xi \, (\cdot)^{z} \, (\, 1 - \xi\, (\cdot)\,)^{1-\iota}  
	\end{aligned}
\];

Structurally:

\[
	\begin{aligned}
		\ell \ (\cdot ; i + i_{\text{next}}) \, &\overset{d}{\equiv}\, \underbrace{\xi \, (\cdot )}_{\text{strike preference}} \ell \ (\cdot ; i \, )
	\end{aligned}
\];

If \(\xi (i) \, = \xi\) *autonomous*

## DUAL SPACE

Considering:

import [STREMIA]()

Structurally:

\[
	\begin{aligned}
		\frac{\Delta \, P_{\pi}}{\Delta \, X} \, &:= \, \phi \, (\cdot \, , i \, + \, i_{\text{next}}) \\
		\\
		\frac{\Delta \, \pi}{\Delta \, X}&\overset{R}{=}
	\end{aligned}
\];

We have:

\[
	\begin{aligned}
		\phi \, (\cdot ; i \, + \, i_{\text{next}}) \, &= \, \zeta \, \Big  (\ell \, (\cdot ; i) \, , \, \phi (\cdot , i) , i \Big)
	\end{aligned}
\]

Since $\Delta X$ includes all trading flow including transactional trading flow:

Now decompose:

\[
	\begin{aligned}
		\frac{\Delta \, \pi}{\Delta \, X} \, &= \, \tau \, (i) \, \frac{\Delta \pi}{\Delta X^{\text{INF}}}\, + \, (1 - \tau (i)) \, \frac{\Delta \pi}{\Delta \, X^{\text{TRANS}}}; \quad \tau \, () \, [0,1]\\
		\\
		\Delta \, X &\equiv \, \mathbb{P_{I}} \, \Delta \, X^{\text{TRANS}} \, + \, (1 \, - \, \mathbb{P_{I}})\Delta X^{\text{INF}}; \, \quad \, \mathbb{P}_{I} \, [0,1]
	\end{aligned}
\]

Note that by definition the *delta-greek* of the payoff $\pi$; which encodes the directional sensitivity of the payoff :

\[
	\begin{aligned}
		\Delta \, (\cdot) \, &\overset{d}{\equiv} \, \frac{\Delta \, \pi}{\Delta \, i} \\
		\\
		& \, &= \, \alpha \, \Big [ \, \tau (i)\, \frac{\Delta \, \pi}{\Delta \, X^{\text{INF}}}\, \Big ] \\
		\\
		& \, &= \, \alpha \, \Big [ \, (1\, - \, \tau \, (i)) \, \frac{\Delta \pi}{\Delta X^{\text{TRANS}}} \, - \, \phi \, (\cdot ; i)\, \Big ]
	\end{aligned}
\]



For the volatility sensitivity we have the *gama-greek* exposure:

\[
	\begin{aligned}
		\Gamma \, (\cdot \, ; i ) \, \overset{d}{\equiv} \, \frac{\Delta}{\Delta \, i} \, \Big [ \Delta (\cdot )\Big ] \\
		\\
		& \, &\overset{\Delta \alpha / \Delta \, i = 0}{=} \, \alpha \, \bigg [\frac{\Delta}{\Delta \, i} \Big [\, (1 - \tau (i)) \, \frac{\Delta \pi}{\Delta \, X^{\text{TRANS}}} \Big] \, - \, \frac{\Delta \, \phi}{\Delta \, i} \, \bigg ]
	\end{aligned}
\]

### RISK EXPOSURE MEASURES

Consider a measure $\mu_{r-e} (i) \in [0,1]$ s.t:

\[
	\begin{aligned}
		\begin{cases}
			\mu_{r-e} \, (i_{\text{min}}) \, = \, 0 \\
			\\
			\mu_{r-e} \, (i_{\text{max}}) \, = \, 1
		\end{cases}
	\end{aligned}
\];

#### **EXAMPLES**

Since:

\[
	\begin{aligned}
		\sum_{i \, = \, i_{\text{min}}}^{i_{\text{max}}} \, \ell \, (i) \, = 1 \, \implies 0 \, < \,\sum_{j \, > \, i_{\text{min}}}^{k < i_{\text{max}}} \, \ell \, (j) \,  \, < \, 1 \\
	\end{aligned}
\]
-  **TAIL RISK**

\[
	\begin{aligned}
		\mu_{r-e} \, (i) \, &= \, \sum_{j\, >\, i}^{i \, \leq \, i_{\text{max}}} \, \ell \, (j)
	\end{aligned}
\]


- **Stability**

For some *admissible* $\mu \, (\cdot) \, \in \, [0,1]$. Give a *equilibrium* fee rate \(\phi^{\star} \, \in \, \{\phi \, \mid \, \phi (\cdot ; i) = \mu (i)\}\):

\[
	\begin{aligned}
		\phi^{\star} \, \text{stable} \, \iff \, \forall_{\varepsilon > 0} \, \exists_{\delta \, > 0\, ; \, i_0} \, \mid \phi (\cdot ; i) - \phi^{\star} \mid \, < \delta \, \implies \mid \, \zeta^{i} \, (\cdot \, , \phi \, (\cdot ; i_0))- \, \phi^{\star} \mid \, < \varepsilon
	\end{aligned}
\]

