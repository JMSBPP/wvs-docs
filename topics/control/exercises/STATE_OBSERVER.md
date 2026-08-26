[Problem A-6-1](../Sistemas_de_Control_en_tiempo_Discreto-Katsuhiko_Ogata.pdf)

import $L^{(t+1)} \, (\Omega)$ from [STATE_SPACE](../STATE_SPACE.md)

import $L_{(\Gamma)}^{(t)}$ from [INVARIANT_SUBSPACES](../../cfmm-linear-algebra/EXERCISES/INVARIANT_SUBSPACES.md)


Show that the system:

$$
\begin{aligned}
	L^{(t+1)} \, (\Omega) \, &= \, 
	\begin{bmatrix}
		0 & 0 \\
		-1 & 1
	\end{bmatrix} \, L^{(t)} \, (\Omega) \, + \,
	\begin{bmatrix}
		0\\
		1
	\end{bmatrix} \, \overline{L}_{(\Gamma)} \, (\Omega)
\end{aligned}
$$




Is controllable, but is not reachable.


#### ***Solution**

> Note that $\partial^{(i_t - \Delta_i)} \begin{bmatrix} 0 \\ 1 \end{bmatrix}$ can be interpreted as the **Hedge-tick concentration operrator** since it measures liquidity allocated to the hedge region




