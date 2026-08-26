
Import $\sigma_{IV} (t), \, \sigma (t)$ from [IMPLIED_VOLATILITY](~/learning/cfmm-theory/cfmm-options/IMPLIED_VOLATILITY.md).


Import $L_{t+1} \, (\Omega) \, = \partial_{(L,)} L_t \, (\Omega) \,+ \partial_{(L,L(\cdot))} \, L^{\circ}_t \, (\Omega)$  from [STATE_SPACE](~/learning/cfmm-theory/cfmm-control/STATE_SPACE.md)



[Exercises 5.A.1 (S. Axler)](~/learning/cfmm-theory/cfmm-linear-algebra/LADR4e.pdf)

$$
\begin{aligned}
\begin{cases}
		L_{(G)} \subseteq L ;\, \partial_L : L \to L \\
		L_{(G)} \subseteq \text{null} \left( \partial_L \right)
	\end{cases}
	\\
	\implies \\
	\\
	\partial_L \left( L_{(G)} \right) \subseteq L_{(G)} \qquad ( L_{(G)} \text{ invariant under } \partial_L )
\end{aligned}
$$

#### Solution


Consider a protocol ccharacterized by $\xi = -1, \Gamma$, which provides a user interface to long volatility with dynami hedge on the tick below. This teh allocation policy:

$$
\begin{aligned}
	L_{(\Gamma)}^{(t)} \, (\Omega) \, &= \, \Big \{ \partial_{(\Omega ,\iota)} \, 
	\begin{bmatrix} 
		\Delta \ell (i_t) \, ,\\
		\Delta \ell (i_t -\Delta i ) 
	\end{bmatrix} : \Delta \, \Delta \, \ell (i_t) < 0 \, \wedge \, \, \Delta \, \ell \, (i_t - \Delta_i)\,  > \, 0 \, \Big\}
\end{aligned}
$$

As is, it is not a sub-space. We need $\overline{L}_{\Gamma} \, (\cdot) = L_{\Gamma} |_{\Delta \ell (i_t - \Delta_i) = - \Delta \ell (i_t)}$ (*liquidity reallocation*)


> Protocols are being assesed on different dimension, one of which is **external liquidity sourcing**
 
 
Defined as:
 
$$
\begin{aligned}
	\partial_{(L, L(A))} \, &= \, 
	\begin{bmatrix}
		1& 1 \\
	    1 & 1	
	\end{bmatrix}
\end{aligned}
$$


Sinc the proocol re-allocates user liqudiity from exisiting one we clearly have


$$
\begin{aligned}
	\partial_{(L, L(A))} \, \overline{L}_{\Gamma} = 0 & \iff  \, \overline{L}_{\Gamma} \subseteq \text{null} \, \Big [ \partial_{(L, L(A))}\Big]
\end{aligned}
$$

[Exercises 5.A.2 (S. Axler)](~/learning/cfmm-theory/cfmm-linear-algebra/LADR4e.pdf)


From **IMPLIED_VOLATILITY**, take $\Sigma \, = \, \sigma \, \times \, \sigma_{\text{iv}}$;

Define:
$$
\begin{aligned}
	\xi: \Sigma \to \mathbb{Z}; \\
	\\
	\frac{i_{\text{min}} - i^\star}{\Delta_i} \leq \xi \leq \frac{i_{\text{max}} - i^\star}{\Delta_i}
\end{aligned}
$$



$$
\begin{aligned}
	d_{\Sigma}
(\sigma_1,\sigma_2)
\, &= \,
	\sqrt{
	(\sigma_{R,1}-\sigma_{R,2})^2
	+
	(\sigma_{I,1}-\sigma_{I,2})^2}
\end{aligned}
$$

$$
\begin{aligned}
D
=
\left\{
(\sigma_R,\sigma_I)
\in
\Sigma
:
\sigma_R=\sigma_I
\right\}
\end{aligned}
$$

$$
\begin{aligned}
	d_D(\sigma)
    \, &= \, 
   \inf_{\tau\in D}
    d_{\Sigma}(\sigma,\tau)
\end{aligned}
$$




$$
\begin{aligned}
\xi(\sigma,\, \sigma_{\text{IV}})
	\, &= \, 
	\operatorname{sgn}
	(\sigma_R-\sigma_I)
	\left\lfloor
	\kappa\,
	d_D(\sigma_R,\sigma_I)
	\right\rfloor
\end{aligned}
$$;



$$
\begin{aligned}
L_k \, (\Omega) \,
&= \, 
\left\{
\ell
\in
L(\Omega)
:
\xi(\sigma_R,\sigma_I)
=
k
\right\}
\end{aligned}
$$






[Exercises 5.A.19 (S. Axler)](~/learning/cfmm-theory/cfmm-linear-algebra/LADR4e.pdf)

Suppose $n$ is a positive integer and consider $\xi := (\xi_i)_{i=1}^n; \, \xi_i = i$;

$$
\begin{aligned}
	L \, (\Omega ; \xi) \, &:= \, \Big ( \, L(\Omega; \xi_i)\, \Big)_{i=1}^n \, \subseteq \, L\, (\Omega; \cdot )^n
\end{aligned}
$$

Define:

$$
\begin{aligned}
	\partial^{(X)}_{(L, L(\cdot))} \, &= \, \, \Big ( \, \xi_i \, L(\Omega; \xi_i)\, \Big)_{i=1}^n 
\end{aligned}
$$


(a) Find all *eigenvalues* and *eigeenvectors* of $\partial^{(X)}_{(L, L(\cdot))}$


#### **Solution**

Note:

$$
\begin{aligned}
	\ell^{(n)}_t \, &\in L (\Omega, \xi) \\
	\\
	&= 
	\begin{bmatrix}
	 \quad
		\mathbb{Q}\, (\omega_t) \, \ell \, (i_t) \, + \, (1- \mathbb{Q}\, (\omega_t)) \, \ell \, (i_t \, + \, \xi_1 \, \Delta_i) \quad \\
		\\
		\cdots \\
		\\
		\quad \mathbb{Q}\, (\omega_t) \, \ell \, (i_t) \, + \, (1- \mathbb{Q}\, (\omega_t)) \, \ell \, (i_t \, + \, \xi_n \, \Delta_i)
		\quad
	\end{bmatrix}
\end{aligned}
$$
And:

$$
\begin{aligned}
	\partial^{(X)}_{(L, L(\cdot))} \, &= \, 
	\begin{bmatrix}
		\quad \xi_1, \, & 0, & \cdots & 0 \quad \\
		\\
		& \cdots &  \\
		\\
		\quad 0, \, & 0, & \cdots & \xi_n  \quad		
	\end{bmatrix}
	\, \ell^{(n)}_t
\end{aligned}
$$
 




Let $\Lambda := \Lambda \, \Big [\, \partial^{(X)}_{(L, L(\cdot))} \, \Big]$, be the set of *eigenvalues * of $\partial^{(X)}_{(L, L(\cdot))}$

By the equivalent conditions to be an *eigenvalue*, we have:

$$
\begin{aligned}
	\lambda \, \in \, \Lambda \, \iff \, \Big ( \partial^{(X)}_{(L, L(\cdot))} \, - \, \Lambda \, \mathbb{I} \Big ) \, \text{  is not injective}
\end{aligned}
$$

Let $\Big (\ell^{(n)}_t\Big)_{a_j}, \,  \Big (\ell^{(n)}_t\Big)_{a_k} \, \in \, L\, (\Omega; \cdot )^n$ s.t:

$$
\begin{aligned}
	\Big ( \partial^{(X)}_{(L, L(\cdot))} \, - \, \Lambda \, \mathbb{I} \Big ) \, \Big (\ell^{(n)}_t\Big)_{a_j} \, &= \, \Big ( \partial^{(X)}_{(L, L(\cdot))} \, - \, \Lambda \, \mathbb{I} \Big ) \, \Big (\ell^{(n)}_t\Big)_{a_k} 
\end{aligned} \tag{1}
$$


We need to find $\lambda_j \, (\xi_j)$ s.t $\Big (\ell^{(n)}_t\Big)_{a_j} \,  \neq \Big (\ell^{(n)}_t\Big)_{a_k}$
**(1)** Follows:


$$
\begin{aligned}
	\Big (\xi_j \, - \, \lambda_j \Big) \, \bigg [\, \mathbb{Q}\, (\omega_t) \, \ell_{a_j} \, (i_t) \, + \, (1- \mathbb{Q}\, (\omega_t)) \, \ell_{a_j} \, (i_t \, + \, \xi_j \, \Delta_i) \, \bigg] \, \\
	\\
	= \, \Big (\xi_j \, - \, \lambda_j \Big) \, \bigg [\, \mathbb{Q}\, (\omega_t) \, \ell_{a_j} \, (i_t) \, + \, (1- \mathbb{Q}\, (\omega_t)) \, \ell_{a_j} \, (i_t \, + \, \xi_j \, \Delta_i) \, \bigg] \\
	\\
	\Big (\xi_j \, - \, \lambda_j \Big) \,\bigg [ \, \, \mathbb{Q}\, (\omega_t) \, \Big (\,\ell_{a_j} \, (i_t) \, -\, \ell_{a_k} \, (i_t) \, \Big)\, - \, \Big (\, 1-  \mathbb{Q}\, (\omega_t) \, \Big )\Big (\, \ell_{a_j} \, (i_t \, + \, \xi_j \, \Delta_i) \, -\, \ell_{a_k} \, (i_t \, + \, \xi_j \, \Delta_i)\, \Big)\, \bigg ]\, &= \, 0
\end{aligned}
$$


Since we require $\Big (\ell^{(n)}_t\Big)_{a_j} \,  \neq \Big (\ell^{(n)}_t\Big)_{a_k}$ and $\mathbb{Q}\, (\cdot ) >0 $, then:

$$
\begin{aligned}
	\boxed{\, \lambda_j \, (\xi_j) \, =\, \xi_j\,}
\end{aligned}
$$


