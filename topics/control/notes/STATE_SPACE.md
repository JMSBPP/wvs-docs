
import $\Pi^{\text{LP}} \, (\sigma \, (t))$ from [PAYOFF](../cfmm-options/PAYOFF.md)

import $\sigma_{IV} \, (t)$ from [IMPLIED_VOLATILITY](../cfmm-options/IMPLIED_VOLATILITY.md)



$$
\begin{aligned}
     L^{(t+1)} \, (\Omega) \, &= \partial_{(L,)} L^{(t)} \, (\Omega) \,+ \partial_{(L,L(\cdot))} \, L^{\circ}_t \, (\Omega) \\
	 \\
	 \Pi^{\text{LP}}_{t} \,(\Omega) \,&= \, \partial_{(C^{LP}, L)} \,  L_t \, (\Omega) \, + \partial_{(\Theta (C^{LP}), L)} \, L^{\circ}_t \, (\Omega)
\end{aligned} 
$$


Define:

$$
\begin{aligned}
	\Omega := \left\{ \omega_t , \neg \omega_t \right\} \iff \left\{ \sigma_{IV} (t) \geq \sigma (t), \, \sigma_{IV} (t) < \sigma (t) \right\}
\end{aligned}
$$

Given tick state $\iota := (i(t), \Delta_i)$.


Define the base:


$$
\begin{aligned}
	\partial_{(\Omega ,\iota)} &= 
	\begin{bmatrix}
		\mathbb{Q}\, (\omega_t) & 0 \\
		0 & \mathbb{Q}\, (\neg\, \omega_t)
	\end{bmatrix} & \, \mathbb{Q} \, (\cdot) \in (0,1]; \, \sum_\omega \mathbb{Q}\,(\omega) = 1
\end{aligned}
$$



Then the full controllable book space is defined as:

$$
\begin{aligned}
	L_t (\Omega) &= \Big \{ \partial_{(\Omega ,\iota)} \, 
	\begin{bmatrix} 
		\ell (i_t) \, ,\\
		\ell (i_t + \Delta_i \,\xi (\cdot)) \,  
	\end{bmatrix} : \ell (\cdot) \in \text{Q128.128}\, \Big\} & \, \xi: \cdot \to i
\end{aligned}
$$

It carries both legs — the current-tick allocation $\ell(i_t)$ and the breakout-tick allocation $\ell(i_t+\Delta_i,\xi)$ — so it is the two-sided, breakout-defended book. 


$$
\partial_{(C^{LP},L)} \;=\;
\begin{bmatrix} c_{11} & c_{12} \\[2pt] c_{21} & c_{22} \end{bmatrix},
\qquad
c_{rj} = \frac{\partial\,\Pi^{LP}_{r}}{\partial\,L^{j}}, \quad r\in\{\omega_t,\neg\omega_t\},\ \ j\in\{\text{asset},\text{cash}\}
$$


$$
\partial_{(L,\,L)} \;=\; \frac{\partial\, L_{t+1}}{\partial\, L_{t}} \;=\;
\begin{bmatrix}
\dfrac{\partial\, L^{\text{asset}}_{t+1}}{\partial\, L^{\text{asset}}_{t}} & \dfrac{\partial\, L^{\text{asset}}_{t+1}}{\partial\, L^{\text{cash}}_{t}} \\[12pt]
\dfrac{\partial\, L^{\text{cash}}_{t+1}}{\partial\, L^{\text{asset}}_{t}} & \dfrac{\partial\, L^{\text{cash}}_{t+1}}{\partial\, L^{\text{cash}}_{t}}
\end{bmatrix}
$$

