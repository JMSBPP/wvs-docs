**import** [LINEAR_ALGEBRA.ORTHOGONAL_DECOMPOSITION](./BASE.md)
**import** [LINEAR_ALGEBRA.EIGENVALUES](./BASE.md)



## [$D_{(M \times N)}$ PAYOFF MATRIX](./diagrams/PAYOFF_MATRIX.excalidraw)

- Changes the hyperplane geomtry such that pricing is orthogonal to no-arbitrage payoffs
- Maps portafolio space $\mathbb{R}^N$ into payoff space, and under this mapping, the pricing functional $P_{\pi}\, \Big (\cdot \Big)$ becomes a normal vector (**state prices**) to hyperplanes of constant price


- **THEOREM NAME**
$$
\begin{aligned}
    \forall_{\pi \, \in D_{\pi}} \, \exists ! \delta^{\star} \in D_{\pi} \, \mid P_{\pi} = \mathbb{E} \, \Big [ \delta^{\star}\odot \pi \Big]
\end{aligned}
$$

*Given a payoff $\pi \, \in D_{\pi}$; it's price can b obtained by a payoff-price generator payoff vector $\delta^{\star}$; that assigns economic weight to each state based on it's real probability of occurreence, meeaning Ho does the economy valuees the occurrence of such states*

 - **PORTAFOLIO FORMATION:**

$$
\begin{aligned}
    w \odot \underbrace{\hat{\pi}^{(D)}}_{\text{Base of payoff space}} \in D_{(\pi)} 
\end{aligned}
$$



 - **LAW OF ONE PRICE:**

$$
\begin{aligned}
    P_{\pi}\, \Big (w^T \, q\, ; P \Big ) &= w^T \,P_{\pi}\, \Big (q\, ; P \Big )     
\end{aligned}
$$


$$
\begin{aligned}
    \left\lVert P_{\pi} \, \Big ( \cdot \Big)\right\rVert &= \left\lVert \delta_{\pi}^{\star} \right\rVert \, \left\lVert \pi \right\rVert \, \cos \Big ( \angle \delta_{\pi}^{\star} \, \pi\Big)
\end{aligned}
$$

Applying **LINEAR_ALGEBRA.ORTHOGONAL_DECOMPOSITION** we have:

$$
\begin{aligned}
     \pi = \underbrace{P_{\pi}}_{\text{pricing operator/projection operator; Linear map}} + \underbrace{\varepsilon}_{\text{unpriced component of } \pi} \iff \mathbb{R}^M = \operatorname{span} \{\delta^{\star}\} \oplus \{\delta^{\star}\}^{\perp}
\end{aligned}
$$

$\varepsilon$ represents the unpriced component of $\pi$ if is [orthogonal to $\delta^{\star}$](./diagrams/PAYOFF_MATRIX.excalidraw):

$$
\begin{aligned}
    \mathbb{E} \left[\, \delta^{\star} \circ \varepsilon\, \right] = 0
\end{aligned}
$$


Note:

$$
\begin{aligned}
    \underbrace{\operatorname{span} \{\delta^{\star}\}}_{\dim (\cdot)= 1} \, \subseteq \mathbb{R}^M \text{is invariant under } \, P_{\pi} \, (\, \cdot \, )
\end{aligned}
$$

Then note that the **LINEAR_ALGEBRA.EIGENVALUES** are:

- **CHARACTERSITIC VALUES OF $P_{\pi} \, (\cdot)$**

$$
\begin{aligned}    
    \Lambda \, \Big ( P_{\pi} \Big) &= \Big \{ \beta_{\pi}^{\delta^{\star}} = \frac{\langle \,\delta^{\star} ; \pi \rangle_{\mathbb{Q}} }{\left\lVert \delta^{\star}\right\rVert^2_{\mathbb{Q}}}\mid P_{\pi} \, (\cdot) = \beta_{\pi}^{\delta^{\star}} \, \delta^{\star} \Big\} \\
    \\
    &\implies \Big \langle \, \mathbb{I}_{\pi}(\pi) = \pi \Big \rangle \\
    &\implies    \Big (P_{\pi} - \beta_{\pi}^{\delta^{\star}}\, \mathbb{I}_{\pi}(\pi)\Big )\, \text{not injective, surjective, invertible} 
\end{aligned}
$$


