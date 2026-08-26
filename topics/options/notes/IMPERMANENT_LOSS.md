

[](~/learning/cfmm-theory/lp-derivatives/deng_zong_wang-static_replication_impermanent_loss-2022.pdf)


IL in linearized raw-tick space, matrix form:

$$
\begin{bmatrix} \mathrm{IL}_{\text{asset}} \\[4pt] \mathrm{IL}_{\text{cash}} \end{bmatrix}
=
\frac{(\ln 1.0001)^2}{4}
\begin{bmatrix} +1 & -1 & 0 & 0 \\[2pt] 0 & 0 & -1 & +1 \end{bmatrix}
\begin{bmatrix} \sqrt{\mathbb{P}^{S}_{l}} & 0 & 0 & 0 \\ 0 & \sqrt{\mathbb{P}^{S}_{u}} & 0 & 0 \\ 0 & 0 & \sqrt{\mathbb{P}_{l}} & 0 \\ 0 & 0 & 0 & \sqrt{\mathbb{P}_{u}} \end{bmatrix}
\begin{bmatrix} \big(i(t)-i^{S}_{l}\big)^{2}\,\mathbf{1}_{\{i(t)<i^{S}_{l}\}} \\[6pt] \big(i(t)-i^{S}_{u}\big)^{2}\,\mathbf{1}_{\{i(t)<i^{S}_{u}\}} \\[6pt] \big(i(t)-i_{l}\big)^{2}\,\mathbf{1}_{\{i(t)>i_{l}\}} \\[6pt] \big(i(t)-i_{u}\big)^{2}\,\mathbf{1}_{\{i(t)>i_{u}\}} \end{bmatrix}
$$

IL call-basis (replication) form — Deng, Zong, Wang Prop. 3.2, exact, options-on-price:

$$
\begin{bmatrix} \mathrm{IL}_{\text{asset}} \\[4pt] \mathrm{IL}_{\text{cash}} \end{bmatrix}
=
\underbrace{\begin{bmatrix} 2 & -2 & -\tfrac{1}{\sqrt{\mathbb{S}_l}} & +\tfrac{1}{\sqrt{\mathbb{S}_u}} & 0 & 0 & 0 & 0 \\[4pt] 0 & 0 & 0 & 0 & 2 & -2 & -\tfrac{1}{\sqrt{\mathbb{P}_l}} & +\tfrac{1}{\sqrt{\mathbb{P}_u}} \end{bmatrix}}_{W\ \ (2\times8)\ \text{weights}}
\begin{bmatrix}
\big(\sqrt{\mathbb{S}_l}-\sqrt{P_t}\big)^{+} \\[4pt]
\big(\sqrt{\mathbb{S}_u}-\sqrt{P_t}\big)^{+} \\[4pt]
\big(\mathbb{S}_l-P_t\big)^{+} \\[4pt]
\big(\mathbb{S}_u-P_t\big)^{+} \\[4pt]
\big(\sqrt{P_t}-\sqrt{\mathbb{P}_l}\big)^{+} \\[4pt]
\big(\sqrt{P_t}-\sqrt{\mathbb{P}_u}\big)^{+} \\[4pt]
\big(P_t-\mathbb{P}_l\big)^{+} \\[4pt]
\big(P_t-\mathbb{P}_u\big)^{+}
\end{bmatrix}
$$

asset leg = 4 puts (strikes $\mathbb{S}_l,\mathbb{S}_u$ on $\sqrt{P}$ and $P$); cash leg = 4 calls (strikes $\mathbb{P}_l,\mathbb{P}_u$). $P_t = 1.0001^{\,i(t)}$. Exact form — the options are not linearized individually: summing each boundary pair cancels first order and yields the square form above.


[](~/learning/cfmm-theory/lp-derivatives/fukasawa_maire_wunsch-weighted_variance_swaps_impermanent_loss.pdf)


import $\Phi \, (\sigma(t)) \;=\; \boldsymbol{\alpha}^{\top}\, s\big(\mathbf{z}(t)\big), \qquad
\mathbf{z}(t) \;=\; G\,\big(\boldsymbol{\beta} - \sigma(t)\,\mathbf{1}\big), \qquad
s(z) \;=\; \frac{1}{1+e^{z}}\ \text{(elementwise)}$ from [FEE_PREMIUM](~/learning/cfmm-theory/cfmm-options/FEE_PREMIUM.md)


$$
\mathrm{UIL}\big(\sigma(t)\big) \;=\; \boldsymbol{\alpha}_{\mathrm{IL}}^{\top}\, g\big(\mathbf{z}_{\mathrm{IL}}(t)\big), \qquad g(z) = 1 - e^{-z}\ \text{(elementwise)}
$$

$$
\mathbf{z}_{\mathrm{IL}}(t) = G_{\mathrm{IL}}\,\sigma(t), \qquad
\boldsymbol{\alpha}_{\mathrm{IL}} = \begin{bmatrix} 2\sqrt{\mathbb{P}_0} \end{bmatrix}, \qquad
G_{\mathrm{IL}} = \begin{bmatrix} \tfrac{6}{8}(\ln 1.0001)^2 \end{bmatrix}
$$


$$
\underbrace{\mathbf{z}_{\mathrm{IL}}(t) = G_{\mathrm{IL}}\,\sigma(t)}_{\text{affine — matrix}}
\;\longrightarrow\;
\underbrace{\mathbf{s}_{\mathrm{IL}}(t) = g(\mathbf{z}_{\mathrm{IL}}(t))}_{\text{nonlinearity}}
\;\longrightarrow\;
\underbrace{\mathrm{UIL}(\sigma(t)) = \boldsymbol{\alpha}_{\mathrm{IL}}^{\top}\mathbf{s}_{\mathrm{IL}}(t)}_{\text{readout — matrix}}
$$

Fee uses sigmoid $s(z)=1/(1+e^{z})$ with $N$ units; IL uses $g(z)=1-e^{-z}$ with $N=1$. 
