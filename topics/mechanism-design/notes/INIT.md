import $\Omega$ from [STATE_SPACE](~/learning/cfmm-theory/cfmm-control/STATE_SPACE.md)
import $A$ from []()

$$
\begin{aligned}
	\Pi_{A \times \Omega} \, &= \, \langle \, \pi_{a_i} \, (\omega_j) \, \rangle_{A \, \times \, \Omega}
\end{aligned}
$$ ;


$$
\begin{aligned}
	\mathbb{P}_{\Omega} : \Omega \to \mathbb{F}
\end{aligned}
$$;


$$
\begin{aligned}
	T \, = \, (t_0, \, \cdots, \, t_N)
\end{aligned}
$$;

Fix $\overline{a}_i \, \in \, A$:

$$
\begin{aligned}
	W_{\overline{a}_i}^{(T)} \, = \, \text{Agg}_{\underbrace{H\, (T)}_{\text{history}}}\, \Big (\pi_{\overline{a}_i}^{(T)} \, \Big)
\end{aligned}
$$;



```
                                          \pi (\omega_( \cdot, t_0) | I_{t_0})  -> root
                                                 /                      \ 
                                                /                        \
                                               /                           \
                                  \pi (\omega_( 1, t_1) | I_{t_1})  \pi (\omega_( 2, t_1) | I_{t_1})
                                               
                                           /     \                        /      \
										  /       \                      /        \ 
										    ...                            ...
	
	
```	


Strategies
$$
\begin{aligned}
	S_A \, (\Omega_T) \, : I_{(A, T)} \to \underbrace{\Big ( L_A \, (\Omega) ), \, \Delta_A \, (\Omega), \cdots \Big)}_{\text{"Admissible protocol actions"  } \mathcal{P}_A \, (\Omega_T)}
\end{aligned}
$$


Protocol state transition operator:

$$
\begin{aligned}
	\partial_{(\Omega, T)}^{\mathcal{P}_A} \, : \Omega \, \times \, \mathcal{P}_A (\Omega_T) \, \to \, \Omega_{T+1}
\end{aligned}
$$


Fixing $\overline{a}_i \, \in \, A$ and $\overline{t} \, \in \, T$; then define:

$$
\begin{aligned}
	\hat{\Pi}  : \,  \mathcal{P}_{\overline{a}_i} \, (\Omega_{\overline{t}}) \, \to \, \mathbb{F}^M
\end{aligned}
$$; 

Define $\geq_{\hat{\Pi}}$ partial order on $\mathcal{P}_{\overline{a}_i} (\Omega_{\overline{t}})$ :

$$
\begin{aligned}
	\alpha_1 \, \geq_{\hat{\Pi}} \alpha_2 \, \iff \,\hat{\Pi} \, (\alpha_1) \, \geq \, \hat{\Pi} \, (\alpha_2)
\end{aligned}
$$

Then, given $\Big ( \hat{\Pi}, (\mathcal{P}_{A} (\Omega_{T})\, , \geq_{\hat{\Pi}})\Big)$:

$$
\begin{aligned}
	\hat{S}_A \, (\Omega_T) \, &= \, \arg \max_{\alpha \in \mathcal{P}_A (\cdot )} \, \Big [ \hat{\Pi}_{(A, \Omega_T)} \, (\alpha \mid I_{(A, T)})\Big]
\end{aligned}
$$;

$$
\begin{aligned}
	\hat{\Pi}^{\star}_A \, (\mathcal{P}_A \, (\Omega)) \, &= \, \sup_{\alpha \, \in \mathcal{P}} \, \Big [ \hat{\Pi}_{(A, \Omega_T)} \Big [ \alpha \mid I_{(A, T)}\Big]\Big]
\end{aligned}
$$


$$
\begin{aligned}
	\underbrace{\theta_{a_i}}_{a_i \text{ belief adjusted payoff representation}} \, \in \overbrace{\Theta_i}^{\text{type profile}} \, \subseteq \, \Big (L^{p(x_{a_i})} \, (\Omega) \Big )^{N_{a_i}}
\end{aligned}
$$


$$
\begin{aligned}
	\Theta \, &= \, \Theta_1 \times \cdots \times \Theta_N
\end{aligned}
$$

From the space of all possible probability distributions $\mathbb{P}\, (\Theta)$; there is a common prior distribution $\overline{\psi} \, \in \, \mathbb{P} (\Theta)$


$$
\begin{aligned}
	\psi_i \, : \theta_{a_i} \, \to \, \mathbb{P} \, (\Theta / \Theta_i); \\
	\\
	\tilde{\pi}_i \, (\omega, \theta_i) \to \mathbb{F}
\end{aligned}
$$


$$
\begin{aligned}
	\mathcal{m}_D : \Theta \to \Pi \, (\Omega) \quad \, & \text{Direct mechanism}\\
	\\
	\mathcal{m}_I : \mathcal{P}_A \, (\Omega) \to \Pi \, (\Omega) \, \quad & \, \text{Indirect mechanism}\\
	\\
	\mathcal{m}_D \, \equiv \mathcal{m}_I \, \iff \, \Theta \, \equiv \, \mathcal{P}_A \, (\Omega)
\end{aligned}
$$

