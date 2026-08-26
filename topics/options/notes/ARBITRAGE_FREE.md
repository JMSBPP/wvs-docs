import [$A^{C}(\mathcal{Q})$, $\delta^{\star}$](BASE.md)

$$

\underbrace{A^{C} \, (\mathcal{Q})}_{\text{no-arbitrage}} \iff \underbrace{\delta^{\star}}_{\text{exists state price deflator}}
$$




$$
G \in \mathbb{R}^{\Omega_T}; 
\\

\underbrace{G_t}_{\text{gain process}} = P_t^{(\mathcal{R})} + \sum_{j=1}^t \, D_j \\
\\
\underbrace{G_t^{(\delta^{\star})}}_{\text{deflated gain process}} = \delta^{\star}_t \, P_t^{(\mathcal{R})} + \sum_{j=1}^t \, \delta^{\star}_j \, D_j
$$





### Theorem

$$
\delta^{\star} \iff P_T^{(\mathcal{R})} = 0 \;\wedge\; G_T^{(\delta^{\star})} \in \mathcal{M}(\mathbb{R}^{\Omega_T})
$$

#### **Proof**:

1.
$$
\begin{aligned}
    \delta^{\star} \iff P_T^{(\mathcal{R})} = 0 \;\wedge\; G_T^{(\delta^{\star})} \in \mathcal{M}(\mathbb{R}^{\Omega_T}) \\
    \\
    \equiv \Big \langle (1)\Big \rangle\\

    \delta^{\star} \iff  G_T^{(\delta^{\star})} \in \mathcal{M}(\mathbb{R}^{\Omega_T})
\end{aligned}
$$

2.

$$
\begin{aligned}
    \delta^{\star} \\
    \iff \\
    \\
    A^{C} \, (\mathcal{Q}) \\
    \iff \\
    \forall_q \quad \mathbb{E} [\sum_{j=0}^T \delta^{\star}_j \, D_j \, (q)] =0 

\end{aligned}
$$

Define

$$
\begin{aligned}
    q_{\, t}\, (n) \in \mathcal{Q}
    &= 
    \begin{cases}
        0 &  q^{(i)} \neq q^{(n)}\quad \forall_{\tau \,(T) \in \, \mathcal{T} \, (T)} \\
        
        1_{\{\, t <\tau \, (T) \}} & q^{(i)} = q^{(n)} \, 
    \end{cases}
\end{aligned}
$$


## FINANCE bridge

With the dividends deflated (so $G_t^{(\delta^{\star})} = \delta^{\star}_t P_t^{(\mathcal{R})}
+ \sum_{j\le t}\delta^{\star}_j D_j$), the deflated gain process is a $\mathbb{Q}$-MARTINGALE,
and the theorem $A^{C}(\mathcal{Q}) \iff \exists\,\delta^{\star}$ is the finite-$\Omega$
instance of FINANCE's no-arbitrage characterization:
import [$\mathbb{Q}$-martingale, $q$](../../cfmm-discrete/FINANCE.md).

Via $\delta^{\star}_t = e^{-r\Delta t}\,\frac{d\mathbb{Q}}{d\mathbb{P}}\big|_t$ (deflator = discount $\times$ density,
$\mathbb{Q} = \delta^{\star}/\sum\delta^{\star}$ — NOT $\delta^{\star}\equiv\mathbb{Q}$), the deflated
gain is a $\mathbb{Q}$-martingale $\iff$ the claim value $\Pi = \Pi_0 e^{jr\Delta t}$ carries
no $dP_X$ term.


