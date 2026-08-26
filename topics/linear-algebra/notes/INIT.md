

**import** $\delta^{\text{disc}}$ from [STOCHASTIC_DISCOUNT_FACTOR](~/learning/cfmm-theory/lp-derivatives/notes/ASSET_PRICING/STOCHASTIC_DISCOUNT_FACTOR.md)



Following the [pool configuration vector space notation](~/learning/cfmm-theory/refs/cfmmStateMachine.pdf)

$$
\begin{aligned}
	\underbrace{(\text{cfg}) \, (i) = L (i)\, \times \, \Phi (i) \, \times \, \Delta(i)}_{\text{Product space}} \in \mathbb{R}^{\overbrace{|\mathcal{I}|}^{\text{TickBitmap}}} \, \mathbb{F}
\end{aligned}
$$



# SUBSPACES
$$
\begin{aligned}
	(\text{cfg}) &= \bigoplus_{G_i} \, (\text{cfg})_{\underbrace{G_i}_{\text{disyuntive groups}}}
\end{aligned}
$$

$$
\begin{aligned}
	\underbrace{\Big ( (\text{cfg}) /(\text{cfg})_{G_i} \Big)}_{\text{quotient space}} &= \{(\text{cfg})^{\circ} + (\text{cfg})_{G}\ : 
	(\text{cfg})^{\circ} \, \in (\text{cfg}) \}
\end{aligned}
$$

## INVARIANT


$$
\begin{aligned}
	\underbrace{(\text{cfg})_{G_i} \, \subseteq \, \partial_{(\cdot)} \, (\text{cfg})_{G_i} }_{\text{invariant subspace under } \partial_{(\cdot)} }
\end{aligned}
$$

*CFG evolution on $G_i$ is independeent, (e.g "isolated vol regimes, segmented LP behavior")*

## CHARACTERISTIC (EIGEN)

Take a pool configuration $\text{cfg.H}$ the **1-dimension invariant sub-space**:

$$
\begin{aligned}
	\text{span} \, \Big (\text{cfg.H} \Big) &= \{\lambda \, \text{cfg.H} : \lambda \in \mathbb{F}\} \\
	\\
	\implies  \\
	\text{dim}\, \bigg (\text{span} \, \Big (\text{cfg.H} \Big) \bigg) &= 1
\end{aligned}
$$



# DYNAMICS

$$
\begin{aligned}
	(\text{cfg})_{t+1} = \partial_{\Big( (\text{cfg}), T \Big)} \, (\text{cfg})_{t}
\end{aligned}
$$


