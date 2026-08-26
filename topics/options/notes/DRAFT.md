

Let $\pi_X$ be a payoff of underlying $X$ contingnent to $\Omega = \{u,1/u\}$ (with real probability measure $(\mathbb{P}_u, 1- \mathbb{P}_u)$) and parametrized by $t \in [t_0: T]$ and we have money market with fixed risk-free rate $r_f$

no arbitrage in the underlying market comes after $1/u  <1 + r_f < u$; The exogenous market price of the underlying is a random variable on $\Omega^t$: with per-step shock $\epsilon_t : \Omega \to \{u, 1/u\}$, $\mathbb{P}(\epsilon_t = u) = \mathbb{P}_u$,

$$
\begin{aligned}
	P_X (t) \, &= \, \epsilon_t \, P_X(t-1) \, = \, P_X(0) \prod_{s=1}^{t} \epsilon_s
\end{aligned}
$$

whose physical conditional expectatioman is

$$
\begin{aligned}
	\mathbb{E}^{\mathbb{P}}\big[ P_X(t) \mid \mathcal{F}_{t-1} \big] \, &= \, \Big (\mathbb{P}_u \, u + (1- \mathbb{P}_u) \tfrac1u \Big )P_X(t-1)
\end{aligned}
$$;


Then now we define the measure $\mathbb{Q}_u = \frac{(1+r_f) - 1/u}{u-1/u},\ \mathbb{Q}_{\neg u} = \frac{u - (1+r_f)}{u-1/u}$ (satisfying $\mathbb{Q}_u \, u + \mathbb{Q}_{\neg u}\,\tfrac1u = 1+r_f$) and the state-price deflator $\delta = \frac{1}{1+r_f}$ :
The pricing $P_{\pi_X} (t)$ is such that the discounted price is a $\mathbb{Q}$ -martingale:

$$
\begin{aligned}
	P_{\pi_X} (0) \, &= \, \mathbb{E}^{\mathbb{Q}}\big[ \delta^{T} \, \pi_X(T) \big], &
	\delta^{t} P_{\pi_X}(t) \ \text{a } \mathbb{Q}\text{-martingale}.
\end{aligned}
$$


Note: 

$$
\begin{aligned}
	\pi_X (T) \, &\equiv \, \sum_{t=t_0}^T \, \Big (\pi_X (t)\, - \, \pi_X (t-1) \Big)
\end{aligned}
$$;

Then:

each increment $\pi_X(t)-\pi_X(t-1)$ is a cashflow accrued at $t$, hence discounted at $\delta^{t}$. By
linearity of $\mathbb{E}^{\mathbb{Q}}$:

$$
\begin{aligned}
	P_{\pi_X} (0) \, &= \, \sum_{t=t_0}^T \, \delta^{t}\, \mathbb{E}^{\mathbb{Q}}\Big[\, \pi_X (t)\, - \, \pi_X (t-1) \,\Big] \\
	\\
	&= \, \sum_{t=t_0}^T \, \delta^{t}\, \sum_{\omega \, \in \, \Omega^{t}} \, \mathbb{Q}^{\otimes t}(\omega)\, \Big(\, \pi_X (t, \omega)\, - \, \pi_X (t-1, \omega) \,\Big)
\end{aligned}
$$
 
where $\mathbb{Q}^{\otimes t}(\omega) = \prod_{s=1}^{t}\mathbb{Q}_{\epsilon_s(\omega)}$ is the risk-neutral probability of path $\omega \in \Omega^t$ 



We impose:

import $\sigma_X$ from [IMPLIED_VOLATILITY](../IMPLIED_VOLATILITY.md)

import $i_X (\cdot)$, $\Delta_{i_X}$ from [FINANCE](../../cfmm-discrete/FINANCE.md)


import $\phi(\sigma)$ (adaptive fee rate) from [FEE_PREMIUM](../FEE_PREMIUM.md); let $V(t,\sigma)$ be the path-$\sigma$ trading volume to $t$

$$
\begin{aligned}
	\pi_X (t; K)\, - \, \pi_X (t-1; K) \, &= \, \frac{P_X (t)\, \sigma_X (t)}{\sqrt{8 \, \pi \, t}} \, \exp \bigg (- \frac{\Big [\ln (P_X (0)/K) + \frac{\sigma_X^2(t) \, t}{2}\Big]^2}{2\sigma_X^2(t)\, t}\bigg) \\
  \\
  &= \, \frac{P_X (t)\, \sigma_X (t)}{\sqrt{8 \, \pi \, t}} \, \exp \bigg (- \frac{\Big [\frac{i_X \, (P_X(0)) - i_X \, (K)}{\ln_{1.0001} \, e} + \frac{\sigma_X^2(t) \, t}{2}\Big]^2}{2\sigma_X^2(t)\, t}\bigg)
\end{aligned}
$$


Then, define:

$$
\begin{aligned}
	BS^{CFMM} \,(\cdot) \,&= \, \frac{P_X (t)\, \sigma_X (t)}{\sqrt{8 \, \pi \, t}} \, \exp \bigg (- \frac{\Big [\ln (P_X (0)/K) + \frac{\sigma_X^2(t) \, t}{2}\Big]^2}{2\sigma_X^2(t)\, t}\bigg) \\
	\\
	\Pi^{LP} \, (\Omega) \, &= \, \bigg \{\pi_X \, (\cdot)\mid P_{\pi_X} (t; K)\,  = \, BS^{CFMM} \,(t; \cdot) \, \bigg \}
\end{aligned}
$$



On discrete tick space, define the **liquidity density function** $L_K$ (Bunni V2's LDF) over ricks —
rounded ticks $i = \lfloor i_X/\Delta_{i_X}\rfloor\,\Delta_{i_X}$ of spacing $\Delta_{i_X}$ — as the
normalized distribution


$$
\begin{aligned}
	\sum_{i} \, L_K(i)\,\Delta_{i_X} \, &= \, 1 \\
	\\
	\ell_K(i) \, &= \, L\cdot L_K(i)
\end{aligned}
$$

where $L$ is the pool's total liquidity and $\ell_K(i)$ the per-tick liquidity.

**Properties of $L_K$.**

1. **Non-negativity & bounded:** $L_K(i)\ge 0$, with mass $L_K(i)\,\Delta_{i_X}\in[0,1]$ (Bunni LDF range $[0,1]$).
2. **Normalization:** $\sum_i L_K(i)\,\Delta_{i_X}=1$ — $L_K$ is a probability measure on the rick lattice.
3. **Compact support:** supported on a finite rick range $[i_{\min}, i_{\max}]$, zero outside — the position's range.
4. **Convexity:** $w\,L_K^{a}+(1-w)\,L_K^{b}$, $w\in[0,1]$, is again a valid LDF (verified $w\cdot1+(1-w)\cdot1=1$; Bunni §2.5 composability). The set $\{L_K\}$ is a simplex of tick-distributions.
5. **Extreme points $=$ single-rick LDFs:** every $L_K$ is a convex combination of single-tick atoms $\delta_{i_K}$; a single-rick LDF is one Uniswap-v3 range position (the spanning/replication basis).
6. **Scale-homogeneity in $L$:** $\ell_K(i)=L\cdot L_K(i)$ is degree-1 in total liquidity; the shape $L_K$ is scale-free.
7. **Shape parameters (shapeshifting):** parametrized by location $\mu$ (rick-index $x=(i-\mu)/\Delta_{i_X}$) and shape — shift $\mu$, morph the shape, or switch the LDF (Bunni §4).
8. **Tick$\to$price pushforward:** as a measure, $L_K$ pushes to price space via $P=1.0001^{\,i}$ with the $\sqrt{1.0001^{\,i}}$ Jacobian; tick-moments and price-moments differ by this factor.
9. **Atomic/discrete:** supported on the lattice (multiples of $\Delta_{i_X}$) — sums, not integrals; the density is the mass $L_K(i)\,\Delta_{i_X}$ per rick.

$$
\begin{aligned}
	\pi_X (t; K) \, &= \, \sum_{i_K \, \in \, L_K} \, \ell_K(i_K)\,\big(i_X(t) - i_K\big)^{+}\,\Delta_{i_X}
\end{aligned}
$$
 
where $i_K$ is the strike tick, $(i_X(t)-i_K)^{+}$ the tick-linear (log-moneyness) ramp, and
$L_K(i_K)\,\Delta_{i_X}$ the probability mass there. This is the static replication of the target
payoff by a concentrated-liquidity ladder

Telescoping the price increment over strike-ticks (forward step $\Delta_{i_X}$):

$$
\begin{aligned}
	\sum_{i_K} \Big[ P_{\pi_X}(t; i_K+\Delta_{i_X}) - P_{\pi_X}(t; i_K) \Big] \, &= \, P_{\pi_X}\big(t; i_K^{\max}+\Delta_{i_X}\big) - P_{\pi_X}\big(t; i_K^{\min}\big)
\end{aligned}
$$

Strike-direction. Vol-direction analog (telescoping the $\sigma$-difference along the smile to its wings):

$$
\begin{aligned}
	\sum_{i_K}\Big[P_{\pi_X}(t;i_K)\big|_{\sigma(i_K+\Delta_{i_X})}-P_{\pi_X}(t;i_K)\big|_{\sigma(i_K)}\Big] \, &= \, P_{\pi_X}\big|_{\sigma_{\max}}-P_{\pi_X}\big|_{\sigma_{\min}}
\end{aligned}
$$

The per-step increment is the LP (short-gamma) theta $=$ fee accrued at step $t$, positive:

$$
\begin{aligned}
	\underbrace{\pi_X(t;i_K)-\pi_X(t-1;i_K)}_{\text{fee at step }t} \, &= \, +\frac{\sigma_X(t)}{2t}\Big[P_{\pi_X}(t;i_K)\big|_{\sigma+\Delta\sigma}-P_{\pi_X}(t;i_K)\big|_{\sigma}\Big] \, > \, 0
\end{aligned}
$$

Concretely the payoff is the accumulated fee revenue, $\pi_X(t;i_K)=\phi(t,\sigma)\,V(t,\sigma)$ (Kristensen eq. 3.14). The bare increment telescopes to the terminal cumulative fee:

$$
\begin{aligned}
	\sum_{t=t_0}^{T}\Big[\phi(t,\sigma)V(t,\sigma)-\phi(t-1,\sigma)V(t-1,\sigma)\Big] \, &= \, \phi(T,\sigma)V(T,\sigma)-\phi(t_0-1,\sigma)V(t_0-1,\sigma) \, = \, \pi_X(T)
\end{aligned}
$$

(with $\phi(t_0-1,\sigma)V(t_0-1,\sigma)=0$, no fee accrued before inception). The price is the discounted risk-neutral sum of the same increment — general functional, then the concrete substitution:

$$
\begin{aligned}
	P_{\pi_X}(0) \, &= \, \sum_{t=t_0}^{T}\delta^{t}\sum_{\omega\in\Omega^t}\mathbb{Q}^{\otimes t}(\omega)\,\Big(\pi_X(t,\omega)-\pi_X(t-1,\omega)\Big) \\
	\\
	&= \, \sum_{t=t_0}^{T}\delta^{t}\sum_{\omega\in\Omega^t}\mathbb{Q}^{\otimes t}(\omega)\,\Big[\phi(t,\omega)V(t,\omega)-\phi(t-1,\omega)V(t-1,\omega)\Big]
\end{aligned}
$$

([clark-2021](../../lp-derivatives/clark-replicating_portfolio_bounded_liquidity-2021.pdf),
[deng-zong-wang-2022](../../lp-derivatives/deng_zong_wang-static_replication_impermanent_loss-2022.pdf)).
