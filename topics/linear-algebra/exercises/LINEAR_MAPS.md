import $\underbrace{(\text{cfg}) \, (i) = L (i)\, \times \, \Phi (i) \, \times \, \Delta(i)}_{\text{Product space}} \in \mathbb{R}^{\overbrace{|\mathcal{I}|}^{\text{TickBitmap}}} \, \mathbb{F}$ from [INIT](~/learning/cfmm-theory/cfmm-linear-algebra/INIT.md)

[Exercise 3.A.3 (S. Axler)]()

$$
\begin{aligned}
    L \in \mathbb{R}^{|\mathcal{I}|}, \Delta \in \mathbb{R}^{|\mathcal{I}|}\, ,\partial_{L,\Delta} \\
    \\
    \implies \\
    \\
    \exists \, \frac{\partial \Delta}{\partial \ell} \in \mathbb{R} : \partial_{L,\Delta} \Big ( \ell_i\Big) \, = 
    \begin{bmatrix}
        \sum_{i}^{|\mathcal{I}|} \frac{\partial \Delta_1}{\partial \ell_i} \, \ell_i \\
         \vdots \\
        \sum_{i}^{|\mathcal{I}|} \frac{\partial \Delta_M}{\partial \ell_i} \, \ell_i
    \end{bmatrix}
\end{aligned}
$$

#### **Solution**


Consider the pair of basis $(\hat{\ell}, \hat{\Delta})$:

Using basis of domain theorem:

$$
\begin{aligned}
	\forall_{j}\, j \, \in [1,M] : \partial_{L,\Delta} (\hat{\ell_j}) \, &=\, \hat{\Delta_j} 
\end{aligned}
$$

[Exercise 3.A.4]()

$$
\begin{aligned}
	\partial_{(L, \Delta)}: L \to \Delta , \\
	\, \ell_1, \cdots, \ell_m \in L, \\
	\partial_{(L, \Delta)}\ell_1, \cdots, \partial_{(L, \Delta)}\ell_m \, \text{linearly independent in } \, \Delta  \\
	\implies \\
	\ell_1, \cdots, \ell_m \, \text{linearly independent in } \, L
\end{aligned}
$$



#### **Solution**

$$
\begin{aligned}
	\partial_{(L, \Delta)}\ell_1, \cdots, \partial_{(L, \Delta)}\ell_m \, \text{linearly independent in } \, \Delta \\
	\\
	\implies \\
	\\
	N^{(\partial)}_1 \, \partial_{(L, \Delta)}\ell_1 + \, \cdots \, + N^{(\partial)}_m \, \partial_{(L, \Delta)}\ell_m \, &= \,0 \\
	\\
	\implies \\
	\\
	N^{(\partial)}_1 \Big (\sum_{i}^{|\mathcal{I}|} \frac{\partial \Delta_1}{\partial \ell_i} \, \ell_i\Big ) + \cdots + N^{(\partial)}_m \Big (\sum_{i}^{|\mathcal{I}|} \frac{\partial \Delta_m}{\partial \ell_i} \, \ell_i\Big ) \, &= \, 0 \\
	\\
	\implies \\
	\\
	\Big (\sum_{i}^m \, N^{(\partial)}_i \, \frac{\partial \Delta_i}{\partial \ell_1}\Big)\, \ell_1 + \cdots \, +  \Big (\sum_{i}^m \, N^{(\partial)}_i \, \frac{\partial \Delta_i}{\partial \ell_m}\Big)\, \ell_m \, &=\, 0 \\
	\\
	\implies \\
	\\
	\ell_1, \cdots, \ell_m \, \text{linearly independent in } \, L
\end{aligned}
$$



[Exercise 3.A.10]()

$$
\begin{aligned}
	\begin{cases}
		\Phi_G \subset \Phi \\
		\\
		\partial_{(\Phi , X)}: \Phi \to X \, \wedge \, \partial_{(\Phi_G , X)}: \Phi_G \to X \\
		\\
		\partial_{(\Phi_G , X)} \neq 0 \\
		\\
		\partial_{(\Phi , X)} \, \phi \, = \, 
		\begin{cases}
			\partial_{(\Phi_G , X)}\, \phi & \phi \, \in \Phi_{G} \\
			\\
			0 & \phi \, \in \Phi_G - \Phi
		\end{cases}
	\end{cases}
	\\
	\implies \partial_{(\Phi, X)} \, \text{is not linear map on } \, \Phi
\end{aligned}
$$

#### **Solution**

$$
\begin{aligned}
	\implies \partial_{(\Phi, X)} \, \text{is linear map on } \, \Phi \\
	\\
	\implies \, \Big \langle \text{Let }\,\phi_g , \, \partial_{(\Phi_G, X)} \phi_g \neq 0\, \text{and }\, \phi_{-g} \in \Phi_G - \Phi \Big \rangle \\
	\\
	\partial_{(\Phi_G, X)} \, (- \phi_g) \neq 0 \\
	\\
	\implies \,\Big \langle \phi_{-g} - \phi_g \, \in \Phi_G - \Phi \Big \rangle  \\
	\\
	\partial_{\Phi, X} (\phi_{-g} - \phi_g) &= \partial_{\Phi, X} (\phi_{-g}) - \partial_{\Phi, X}(\phi_g)\\
	0 &= \\
	\\
	\implies \Big \langle \text{definition of } \partial_{\Phi, X}\Big \rangle \\
	\\
	\partial_{\Phi, X} (\phi_{-g}) = \partial_{\Phi, X}(\phi_g)	\\
	\\
	\implies \Big \langle \, \partial_{\Phi, X} \, \phi_{-g} = 0 \, \wedge \, \partial_{\Phi, X} \, \phi_{g} \neq 0\, \Big \rangle \\
	\\
	false
\end{aligned}
$$

[Exercise 3.B.1 (S. Axler)]()

Give an example of a linear map 
$$
(\mathbb{I} + \partial) : L \to \Phi
$$
such that

$$
\dim(\mathrm{Null}(\mathbb{I}+\partial)) = 3
\qquad \text{and} \qquad
\dim(\mathrm{Range}(\mathbb{I}+\partial)) = 2.
$$

#### **Solution**

By the Rank–Nullity Theorem,

$$
\begin{aligned}
\dim L
&=
\dim(\mathrm{Null}(\mathbb{I}+\partial))
+
\dim(\mathrm{Range}(\mathbb{I}+\partial))
\\
&= 3 + 2
\\
&= 5.
\end{aligned}
$$

Thus the liquidity allocation space admits 5 independent allocation directions.

Let the liquidity basis states be

$$
(\omega_1,\omega_2,\omega_3,\omega_4,\omega_5).
$$

Define the liquidity allocation vector

$$
L
=
\begin{pmatrix}
\hat{\ell}_1 \\
\hat{\ell}_2 \\
\hat{\ell}_3 \\
\hat{\ell}_4 \\
\hat{\ell}_5
\end{pmatrix}.
$$

We first represent the operator in its full $5\times5$ state representation:

$$
\begin{aligned}
(\mathbb{I}+\partial)L
=
\begin{bmatrix}
\eta_{\phi/\omega_1} & 0 & 0 & 0 & 0 \\
0 & \eta_{\phi/\omega_2} & 0 & 0 & 0 \\
0 & 0 & \eta_{\phi/\omega_3} & 0 & 0 \\
0 & 0 & 0 & \eta_{\phi/\omega_4} & 0 \\
0 & 0 & 0 & 0 & \eta_{\phi/\omega_5}
\end{bmatrix}
\begin{pmatrix}
\hat{\ell}_1 \\
\hat{\ell}_2 \\
\hat{\ell}_3 \\
\hat{\ell}_4 \\
\hat{\ell}_5
\end{pmatrix}.
\end{aligned}
$$

Suppose now that only the first two liquidity directions generate fee response, while the remaining three directions generate no fees.

Thus,

$$
\eta_{\phi/\omega_3}
=
\eta_{\phi/\omega_4}
=
\eta_{\phi/\omega_5}
=
0.
$$

The operator becomes

$$
\begin{aligned}
(\mathbb{I}+\partial)L
=
\begin{bmatrix}
\eta_{\phi/\omega_1} & 0 & 0 & 0 & 0 \\
0 & \eta_{\phi/\omega_2} & 0 & 0 & 0 \\
0 & 0 & 0 & 0 & 0 \\
0 & 0 & 0 & 0 & 0 \\
0 & 0 & 0 & 0 & 0
\end{bmatrix}
\begin{pmatrix}
\hat{\ell}_1 \\
\hat{\ell}_2 \\
\hat{\ell}_3 \\
\hat{\ell}_4 \\
\hat{\ell}_5
\end{pmatrix}.
\end{aligned}
$$

Hence,

$$
\mathrm{Rank}(\mathbb{I}+\partial)=2,
$$

because only two independent fee-response directions remain active.

Equivalently, restricting to the effective fee-generating subspace,

$$
\begin{aligned}
(\mathbb{I}+\partial)L
=
\begin{bmatrix}
\eta_{\phi/\omega_1} & 0 \\
0 & \eta_{\phi/\omega_2}
\end{bmatrix}
\begin{pmatrix}
\hat{\phi}_1 \\
\hat{\phi}_2
\end{pmatrix}.
\end{aligned}
$$

Therefore,

$$
\dim(\mathrm{Range}(\mathbb{I}+\partial)) = 2.
$$

The null space is generated by the liquidity directions associated with

$$
(\omega_3,\omega_4,\omega_5),
$$

since allocations along those directions produce zero fee response.

Thus,

$$
\dim(\mathrm{Null}(\mathbb{I}+\partial)) = 3.
$$

Economically, this means there exist three independent liquidity allocation states for which the protocol produces no marginal fee generation, while only two independent liquidity directions contribute to fee revenue generation.
