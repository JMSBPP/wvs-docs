

[Adaptive Realized Volatility Fee Rate $\phi \, (\sigma; \alpha, \beta )$](~/learning/cfmm-theory/lp-derivatives/Algerbra Tech Paper-15411d15f8653a81d5f7f574bfe655ad.pdf)

import $\Sigma$ from [VOLATILITY](~/learning/cfmm-theory/cfmm-options/FEE_PREMIUM.md)
Consider $\mathbb{F} = Q128.128$


import $\Omega, \, L(\Omega)$ from [STATE_SPACE](~/learning/cfmm-theory/cfmm-control/STATE_SPACE.md)
0
$$
\begin{aligned}
\phi\, (\sigma(t) ; \, \alpha , \beta, \gamma ) \;=\; \boldsymbol{\alpha}^{\top}\, s\big(\mathbf{z}(t)\big), \qquad
\mathbf{z}(t) \;=\; G\,\big(\boldsymbol{\beta} - \sigma(t)\,\mathbf{1}\big), \qquad
s(z) \;=\; \frac{1}{1+e^{z}}\ \text{(elementwise)} \\
\\
\phi: \Sigma \, |_{\sigma} \, \to \mathbb{F}
\end{aligned}
$$

$$
\boldsymbol{\alpha} = \begin{bmatrix} \alpha_1 \\ \vdots \\ \alpha_N \end{bmatrix}, \qquad
\boldsymbol{\beta} = \begin{bmatrix} \beta_1 \\ \vdots \\ \beta_N \end{bmatrix}, \qquad
G = \begin{bmatrix} \gamma_1 & & \\ & \ddots & \\ & & \gamma_N \end{bmatrix}, \qquad
\mathbf{1} = \begin{bmatrix} 1 \\ \vdots \\ 1 \end{bmatrix}
$$


$$
\underbrace{\mathbf{z}(t) = G\,(\boldsymbol{\beta} - \sigma(t)\,\mathbf{1})}_{\text{affine — matrix}}
\;\longrightarrow\;
\underbrace{\mathbf{s}(t) = s(\mathbf{z}(t))}_{\text{nonlinearity}}
\;\longrightarrow\;
\underbrace{\phi(\sigma(t)) = \boldsymbol{\alpha}^{\top}\mathbf{s}(t)}_{\text{readout — matrix}}
$$

For the linear case consider $s_l = 1$


$$
\begin{aligned}
	\underbrace{\partial_{(\Sigma , \, \Omega)}}_{\text{volatility event classifier}} \, : \Sigma \to \Omega
\end{aligned}
$$



$$
\begin{aligned}
	\underbrace{\partial_{(\Sigma, \, \Omega)}^{-1}}_{\text{pre-image}} \, (\omega): \Omega \to \Sigma := \Big \{ \sigma \, \in \, \Sigma \, \mid \, \partial_{(\Sigma, \Omega)} \, \sigma = \omega \Big\}
\end{aligned}
$$


$$
\begin{aligned}
	\Phi^{(t)} \, (\Omega) &= \, \partial_{(\Phi, L)} \, L^{(t)} \, (\Omega)
\end{aligned}
$$
