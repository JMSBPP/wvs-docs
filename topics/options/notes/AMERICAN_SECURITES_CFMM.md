

Consider the [**MINIMAL_MARKOVIAN_DESCRIPTION**](./BASE.md) $X_t$

$$
\begin{aligned}
    X_t &:= \Big (i_t, L_t, t\Big) \, \to \Pi^{\text{CFMM}} \, \Big ( P(i), L(i)\Big) \\
    \\
    &\implies \Big \langle \nabla \, \Pi^{\text{LP}} = \langle \frac{\delta \pi}{\delta P} , \frac{\delta \pi}{\delta L}\rangle\Big \rangle \\
    \\
    \Delta \, \Pi^{\text{LP}} &= \sum_{\text{ticks}} \, \nabla \pi \, \Delta X
\end{aligned}
$$


$$
\begin{aligned}
    P_{\Pi} & \sim \mathbb{E}^{\mathbb{Q}}\, \Big [ \delta^{\star} \circ \Delta \Pi \Big] \\
    \\
    P_{\Pi}^{(t)} &= \mathbb{E} \Big [ \delta_{(t, t+1)}\, ( \, P_{\pi}^{(t+1)}  \, + \Phi_{t+1} )\Big] \\
    \\
    \underbrace{\Big( P_{\pi}^{(t)} - \mathbb{E}\Big[ P_{\pi}^{(t+1)} \Big] \Big) - r\, P_{\pi}^{(t)} \Delta t + \Phi_{t+1}}_{\text{discrete time no-arbitrage pricing recursion}} = 0 \\
    & \text{s.t.} \quad P_{\pi}^{(T)} = \underbrace{G_T( X_T;\ \cdot )}_{\text{liquidation (exercise payoff)}} \\
    &&= \Pi_T^{\text{HODL}} + \text{LvR}_T
\end{aligned}
$$

Now:

$$
\begin{aligned}
    \Big( P_{\pi}^{(t)} - \mathbb{E}\Big[ P_{\pi}^{(t+1)} \Big] \Big) \, &\approx \, \underbrace{\frac{\Delta P_{\pi} (t)}{\Delta \pi}}_{\Theta_t} \, + \, \underbrace{\frac{\Delta P_{\pi}\, (t)}{\Delta \pi}\, \mu \, (\pi, t)}_{\Delta_t} \, + \, \underbrace{\frac{1}{2}\,\sigma^2 \, (\pi, t)\,\frac{\Delta^2 P_{\pi}(t)}{\Delta \, \pi^2}}_{\Gamma_t} 
\end{aligned}
$$

## AMERICAN $\Pi^A$
Consider 
$$
\tau: \Omega \to \{t, t+1, \cdots, T\}\, \quad \{\tau \leq t\} \in \mathcal{F}_t \, \forall_t
$$
A random variable with $\mathcal{F}_{t}$- measurable Random variable hazard-rate:

$$
\begin{aligned}
    \lambda_t &:= \mathbb{P} (\tau = t \mid  \{\tau \leq t\} \in \mathcal{F}_t) \, \in \mathbb{B} \\
    \\
    &= 
    \begin{cases}
        1 & X_t \in \mathbb{S} \\
        0 & \text{oth}
    \end{cases}
\end{aligned}
$$

Thus $(1)$, changes to:

$$
\begin{aligned}
    P_{\pi^A}^{(t)} &= \sup_{\tau\, \in \tau_t} \, \mathbb{E}\, \Big [\delta_{(t, \tau)} \, \Big ( G^{(\tau)} + \sum_{j= t+1}^{\tau} \delta_{t,j}\, \Phi_j \Big)\Big]
\end{aligned}
$$

Defining the fee revenue $\Phi$ as the equvalent security dividend induced by the dynamic fee kernel $\phi (\cdot ; \cdot)$:

$$
\begin{aligned}
    \Phi^{(\tau)}_{t} &= \sum_{j= t+1}^{\tau}\, \phi\, (X_j ; \cdot)\, \Delta \, t
\end{aligned}
$$
