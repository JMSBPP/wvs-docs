
import $L^{(t)} \, (\Omega), \, \partial_{(\Omega ,\iota)}$ from [STATE_SPACE](../cfmm-control/STATE_SPACE.md)

# AGENTS

Consider the agent's space, meaning agents interacting with the volatility claims market

$$
\begin{aligned}
	A_N \, &= \, (a_1, \cdots, a_N)
\end{aligned}
$$;

Then:

$$
\begin{aligned}
	L^{A_N} \, (\Omega) \, &= \, \Big \{ \ell^{(a_i)}\, \in \, L\, (\Omega)\, \mid a_i \, \in A_N \, \, \Big\}
\end{aligned}
$$


Consider for $\mathbb{F}\, = \, \text{Q}128.128$:

$$
\begin{aligned}
	M_L\, :L^{A_N} \, (\Omega) \, \to \mathbb{F}^M 
\end{aligned}
$$

which *economically* reads as **admissible aggregate liquidity states**.

## DIMENSION:: LIQUIDITY COMPOSITION 

### $M=2$

For $N =2$:

$$
\begin{aligned}
	M_L (\ell^{(a_1)}\, ,\ell^{(a_2)} \,) \, &= \, \Big  (\, L^{(\text{asset})} (\ell^{(a_1)}\, ,\ell^{(a_2)})\, ,L^{(\text{cash})} (\ell^{(a_1)}\, ,\ell^{(a_2)}) \, \Big )
\end{aligned}
$$

Note that since the base of $L(\Omega)$ is $\partial_{(\Omega ,\iota)}$, and we introduced $\xi: \cdot \to i$.

Given market price tick state $\iota := (i_t, \Delta_i)$

$$
\begin{aligned}
	\ell^{(a_i)}\, (\iota\, ; \mathbb{Q}_{\omega}, \, \xi \, (\cdot)\, ): (0,1) \, \times \, [\frac{\text{TICK_MIN} - i_t}{\Delta_i}, \, \frac{\text{TICK_MAX} - i_t}{\Delta_i}]\, \to L^{A_N} \, (\Omega)
\end{aligned}
$$

Which reads as **volatility-conditioned liquiidty hedge allocation surface**:

Fix $\xi \, (\cdot) = \overline{\xi}$,

We have the **volatility-belief liquidity curve**:


$$
\begin{aligned}
	\ell_{\overline{\xi}}^{(a_i)} \, (\cdot \, ; \, \mathbb{Q}_{\omega}))\, : \, (0,1)\, \to \,  L^{A_N} \, (\Omega)
\end{aligned}
$$


We have the tangent vector which reads as the *(belief-induced liquidity velocity) marginal liquidity reallocation under uncertainty repricing* **and** the normal vector which reads as *(liquidity stress vector) marginal liquidity stress acceleration*:

$$
\begin{aligned}
	\begin{cases}
		T\, (\mathbb{Q}_{\omega}) \, &= \, \frac{\partial}{\partial \, \mathbb{Q}_{\omega}} \, \ell_{\overline{\xi}}^{(a_i)}\\
		\\
		N \, (\mathbb{Q}_{\omega}) \, &= 
	\end{cases}
\end{aligned}
$$

Then the belief-induced liquidity *circulation density* and belief-induced liquidity *flow/stress density* are defined as:

$$
\begin{aligned}
	\begin{cases}
		\delta\, \mathcal{C}_{\mathbb{Q}}^{M_L} \, &= \, M_L \,(\cdot, \cdot ) \, \cdot \,T\, (\mathbb{Q}_{\omega}) \\
		\delta\, \mathcal{S}_{\mathbb{Q}}^{M_L} \, &= \, M_L \,(\cdot, \cdot ) \, \cdot \,N\, (\mathbb{Q}_{\omega})
	\end{cases}
\end{aligned}
$$

From where the objects *total endogeneous liquidity redistribution* **and** *total accumulated liquidity stress* are defined as:


$$
\begin{aligned}
	\begin{cases}
	\mathcal{C}_{\mathbb{Q}}^{M_L} \, &= \, \displaystyle\int_{\Gamma_{\mathbb{Q}_{\omega}}\,\subset \, L^{A_N} \, (\Omega)}\delta\, \mathcal{C}_{\mathbb{Q}}^{M_L}\, || T\, (\mathbb{Q}_{\omega}) ||\, \partial \, \mathbb{Q}_{\omega}  \\
	\mathcal{S}_{\mathbb{Q}}^{M_L} \, &= \, \displaystyle\int_{\Gamma_{\mathbb{Q}_{\omega}}\,\subset \, L^{A_N} \, (\Omega)}\delta\, \mathcal{S}_{\mathbb{Q}}^{M_L}\, || T\, (\mathbb{Q}_{\omega}) ||\, \partial \, \mathbb{Q}_{\omega} \\
	\end{cases}
\end{aligned}
$$




## DIMENSION:: CONVEXITY REGIMES

Consider:

$$
\begin{aligned}
	\Omega^{(\Gamma, 3)} \, &= \, \Big \{ \omega_{+\Gamma}\, , \omega_{0-\Gamma}, \, \omega_{-\, \Gamma}\Big \}
\end{aligned}
$$
import $\Sigma$ from []()

Define:

$$
\begin{aligned}
	c^{(\Sigma)}\, (t) \, &= \, \sigma (t) - \sigma_{iv}\, (t)
\end{aligned}
$$;

Then for some fixed $\epsilon > 0$. Define:

$$
\begin{aligned}
	\partial_{(\,\Sigma, \Omega^{(\Gamma, 3)\,)}}\, \Big ( c^{(\Sigma)}\Big) \, &= \,
	\begin{cases}
		\omega_{-\, \Gamma}\, & c^{(\Sigma)} < - \epsilon \\
		\\
		\omega_{0-\Gamma} \, &  |c^{(\Sigma)}| \leq \epsilon \\
		\\
		\omega_{+ \, \Gamma} \,& |c^{(\Sigma)}| > \epsilon
		\end{cases}
\end{aligned}
$$

Then:



$$
\partial_{(\Omega^{(\Gamma, 3)}, L)} =  
\begin{bmatrix}
0 & \mathbb{Q}^{(+\Gamma)} \\[10pt]
\mathbb{Q}_{0}^{(-\Gamma)} & \mathbb{Q}_{0}^{(+\Gamma)} \\[10pt]
\mathbb{Q}^{(-\Gamma)} & 0
\end{bmatrix} 
\partial_{(\Omega, L)}
$$

subject to:

$$
\begin{aligned}
	\mathbb{Q}_{0}^{(-\Gamma)} +\mathbb{Q}^{(-\Gamma)} =1 \quad   \mathbb{Q}_{0}^{(+\Gamma)} +\mathbb{Q}^{(+\Gamma)}=1
\end{aligned}
$$



$$
\begin{aligned}
	M_{\Gamma} \, & : \, L^{A_N}(\Omega^{(\Gamma, 3)}) \,\to \, \mathbb{F}^{M}\\
	\\
	&= \, \Gamma^{(+)} \, + \, \Gamma^{(0)} \, + \, \Gamma^{(-)} 
\end{aligned}
$$







