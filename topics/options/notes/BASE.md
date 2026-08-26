## Infra

$$
\begin{aligned}
    \Omega_T &= \{+\Delta_i, -\Delta_i\}^T \quad (\text{tick-increment paths};\ \varepsilon^{\mathbb{Q}}_i\in\{+\Delta_i,-\Delta_i\},\ i_t = i_0 + \textstyle\sum_{s\le t}\varepsilon^{\mathbb{Q}}_s) \\
    \Big (\Omega_T, \{\mathcal{F}_i\}_{i=0}^T, \mathbb{Q}\Big) \implies
    \hat{\epsilon}^{\mathbb{Q}}_T &\in \Omega_T\, ; && \hat{\epsilon}^{\mathbb{Q}}_T &:= \overbrace{(\epsilon^{\mathbb{Q}}_1,\ldots, \epsilon^{\mathbb{Q}}_T)}^{T \text{ times}} \\
    \\
\hat{\epsilon^{\mathbb{Q}}} \sim \text{IID} \Big \{ \epsilon^{\mathbb{Q}}_i\Big\}_i \tag{4}   \\

\end{aligned}
$$

with tick spacing $\Delta_i$ (the $\Delta_{i_X}$ of [FINANCE](../../cfmm-discrete/FINANCE.md)/DRAFT) and
$P_X(i)=\lambda^i$: the shock $\varepsilon^{\mathbb{Q}}_i=+\Delta_i$ is one tick up
($P_X\to\lambda^{\Delta_i}P_X$), $-\Delta_i$ one tick down, so the up-factor is $u=\lambda^{\Delta_i}$ and the
per-step price factor is $\lambda^{\varepsilon^{\mathbb{Q}}_i}\in\{\lambda^{\Delta_i},\lambda^{-\Delta_i}\}=\{u,1/u\}$.
The $\{u,1/u\}^T$ price-factor tree IS the additive **recombining tick lattice** $\{+\Delta_i,-\Delta_i\}^T$
— the canonical (space-axis) coordinate.

Where:

$$
\begin{aligned}
    \mathcal{F}_t = \sigma \, (\epsilon_1, \cdots,  \epsilon_t)
\end{aligned}
$$

And:
$$
\begin{aligned}
    \tau \, (T): \Omega_T \to \mathbb{N}
    &; \,  
    \tau (T) \leq T \\
    \\
    &; \{\tau \leq t\} \in \mathcal{F}_{t}\tag{5}
\end{aligned}
$$

Where:

$$
\mathcal{T} \ (T) = \Big \{ \tau \in \mathbb{N}^{\Omega_T} \mid \{\tau = t\} \{\mathcal{F_t}\}\Big\}
$$


## Measure Theory

$$
\underbrace{\forall \, F: \mathbb{R}^{\Omega_T} \to \mathbb{R} \quad\exists ! \, \delta^{\star} \in \mathbb{R}^{\Omega_T} \quad : \forall  x \in \mathbb{R}^{\Omega_T} \quad F^{(\delta^{\star})}(x) = \mathbb{E} \Big [ \sum_{t=0}^T \delta^{\star}_t\, x_t \Big]}_{\text{Reisz representation of } F} 
$$


$$
X \in \underbrace{\mathcal{M} \, (\mathbb{R}^{\Omega_T})}_{\text{martingales}} \iff \forall_{\tau \, (T) \, \in \mathcal{T} \ (T)} \quad \mathbb{E}\Big [\, X_{\tau \, (T)} \,\Big] = X_0
$$

## Market

$$
\begin{aligned}
    \overbrace{M}^{\text{market}} := \Big (\mathcal{R}_1, \cdots , \mathcal{R}_i,\cdots, \mathcal{R}_N\Big) \\
    \\
    \mathcal{R}_i = \, (\, \underbrace{P^{(\mathcal{R_i})}}_{\text{price}}, \,  \underbrace{D^{(\mathcal{R_i})}}_{\text{dividend}}\, ) \in \mathbb{R}_+^{\Omega_T} \times \, \mathbb{R}_+^{\Omega_T}
\end{aligned}
$$



$$
    \underbrace{A^{C} \, (\mathcal{Q})}_{\text{no-arbitrage}} \iff \Big (\exists \, \underbrace{F}_{\text{linear, increasing}} : \mathcal{Q}\to \mathbb{R} \, \mid \forall_q \, F (D \, (q)) =0 \Big )
$$


$$
\begin{aligned}
    \delta^{\star} \iff \forall_t \, P_t^{(\mathcal{R})} = \frac{\mathbb{E} \Big [ \sum_{j=t+1}^T \delta^{\star}_j \, D_j
    \mid \mathcal{F}_t\Big]}{\underbrace{\delta^{\star}_t}_{\text{state price deflator}}} \\
    \\   
    \delta^{\star} \iff P_T^{(\mathcal{R})} = 0 \tag{1}
\end{aligned}
$$

$$
\delta^{\star} \iff \forall_q \, \forall_t \, \quad q_t \, P^{\mathcal{(R)}}_t = \frac{\mathbb{E} \Big [ \sum_{j=t+1}^T \delta^{\star}_j \, D_j \, (q)
    \mid \mathcal{F}_t\Big]}{\delta^{\star}_t}
$$


## FINANCE bridge

The existence statement $A^{C}(\mathcal{Q}) \iff \exists\,\delta^{\star}$ is the finite-$\Omega$
instance of the no-arbitrage characterization in
import [$\mathbb{Q}$, $q$, no-arb $\iff \exists\,\delta^{\star}$](../../cfmm-discrete/FINANCE.md).

The state-price deflator is **discount $\times$ density**, NOT the measure itself:

$$
\delta^{\star}_t = e^{-r\Delta t}\,\frac{d\mathbb{Q}}{d\mathbb{P}}\Big|_t,
\qquad
\mathbb{Q}(\text{state}) = \frac{\delta^{\star}(\text{state})}{\sum \delta^{\star}},
\qquad
\sum \delta^{\star} = e^{-r\Delta t}\ \text{(the discount)}.
$$

So $\exists\,\delta^{\star}$ (a strictly positive deflator) is the single-tick instance of
FINANCE's "no-arb $\iff \exists$ constant $q\in(0,1)$": the normalized deflator weights ARE $q$.


   



