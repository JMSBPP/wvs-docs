
import $L^{(t+1)} \, (\Omega)$ from [STATE_SPACE](~/learning/cfmm-theory/cfmm-control/STATE_SPACE.md)

[Exercise 2.1](convexPolyotypes.pdf)

Let $\xi_1, \xi_2; \xi_1 \neq \xi_2$:
	
$$
\begin{aligned}
	L_{\xi_1} \, (\Omega) \, ; \, L_{\xi_1} \, (\Omega) \, \subseteq \, \mathbb{F}^2 
\end{aligned}
$$

For a *fixed* breakout map $\xi$, $L_\xi(\Omega) \subseteq \mathbb{F}^2$ is a convex set — the set of all two-leg book vectors the 
LP can reach by choosing the allocation function $\ell(\cdot)$ under that breakout direction. So $\xi$ indexes **the strategy** (which way the breakout leg leans) and $L_\xi(\Omega)$ is the **reachable book shape** that strategy generates in the $(\text{asset},\text{cash})$ plane.


Define:
,,,,,,
$$
\begin{aligned}	
	L_{\xi_1} \, (\Omega) \, \approx \, L_{\xi_2} \, (\Omega) \, &\equiv  \, \exists \, \tilde{\ell} \,\in \, \mathbb{F}^2 \,, \, \lambda \, > \, 0 \, : \, L_{\xi_1} \, (\Omega) \, =  \, \tilde{\ell} + \lambda \, L_{\xi_2} \, (\Omega)
\end{aligned}
$$

Two LP strategies $\xi_1, \xi_2$ are $\approx$-equivalent iff one reachable book can be obtained from the other by a **static inventory shift** and a **proportional capital scaling**:

Prove:
K
The convex subsets of $\mathbb{F}^1$ (including $\emptyset, \mathbb{F}^{1}$) form eleven distinct classes with respect to the relation $\approx$. Describe these classes. How many classes are there in the definition of $\approx$, the only restriction on $\lambda$ is $\lambda \neq 0$. What is the number of classes in $\mathbb{F}^2$

**Formal restatement (Latin symbols only).** Let

$$
C \;:=\; \mathcal{C}(\mathbb{F}^1) \;=\; \{\, S \subseteq \mathbb{F}^1 \,:\, S \text{ convex} \,\} \,\cup,\, \{\, \emptyset,\ \mathbb{F}^1 \,\}.
$$

kDefine the positive-homothety relation $H$ on $C$ by
kk
$$
S \;H\; T \;:\Longleftrightarrow\; \exists\, b \in \mathbb{F}^1,\ a \in \mathbb{F}^1_{>0} \;:\; S \;=\; b \,+\, a\,T,
$$

,with equivalence class $[\,T\,]_H \,:=\, \{\, S \in C : S \,H\, T \,\}$ and quotient $C/H \,:=\, \{\, [\,T\,]_H : T \in C \,\}$. The statement, to prove is

$$
\big|\, C \,/\, H \,\big| \;=\; 11,
$$
K
together with the exhibition of a complete system of representatives $R_1, R_2, \dots, R_{11} \in C$ such that

$$
C \;=\; \bigsqcup_{k=1}^{11} \,[\,R_k\,]_H .
k$$

k
#,### **Solution**

kLet:
K
$$
\begin{aligned}
   \mathcal{C} (\mathbb{F})\, \subset \, \mathcal{P}\, (\mathbb{F})
\end{aligned}
$$

