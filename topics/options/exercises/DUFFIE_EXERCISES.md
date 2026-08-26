import [$\Omega$, $A^{C}(\mathcal{Q})$, $\delta^{\star}$](../notes/BASE.md)
import [no-arb $A^{C}(\mathcal{Q}) \iff \exists\,\delta^{\star}$](../notes/ARBITRAGE_FREE.md)
# [1.11]()


## **(A)**

We have $ \underbrace{M}_{\text{number of states of the world}} = 2$ and $\underbrace{N}_{\text{number of securities}} = 3$

Then:

$$
\Omega = \{u, 1/u\} = \{\lambda^{\Delta_i}, \lambda^{-\Delta_i}\}\qquad(u=\lambda^{\Delta_i},\ \text{one tick spacing})
$$

$$
P = \langle \, P^{(\mathcal{R})},\; P^{(B)} \,\rangle
$$

The three assets are:

$$
\underbrace{\mathcal{R}(\varepsilon)}_{\text{risky asset with random shocks } \epsilon},\;
\underbrace{B(r)}_{\text{bond with yield rate } r},\;
\underbrace{\text{Call}\Big (K,\tau; \mathcal{R}(\varepsilon) \Big)}_{\text{call option on } \mathcal{R} \text{ with strike } K \text{ and expiration/stopping } \tau}
$$


Where:

$$
\begin{aligned}
    \epsilon 
    &= 
    \begin{cases}
        \lambda^{\Delta_i} & ;\, \mathbb{P} (\lambda^{\Delta_i}) = p \\
        \lambda^{-\Delta_i} & ;\, \mathbb{P} (\lambda^{-\Delta_i}) = 1- p

    \end{cases} & \, \text{on} \, (\Omega , \sigma(\Omega), \mathbb{P})
\end{aligned}
$$
**Tick-space grounding.** With tick spacing $\Delta_i$ (the $\Delta_{i_X}$ of
[FINANCE](../../cfmm-discrete/FINANCE.md)/DRAFT) and $P_X(i)=\lambda^i$, the up-factor is
$u=\lambda^{\Delta_i}$ and the two-state world $\Omega=\{u,1/u\}=\{\lambda^{\Delta_i},\lambda^{-\Delta_i}\}$
is the **one-tick-spacing move** from tick $i$: up $\Leftrightarrow i\to i+\Delta_i$
($P^{(\mathcal{R})}\to\lambda^{\Delta_i}P^{(\mathcal{R})}$), down $\Leftrightarrow i\to i-\Delta_i$. Tick
space is the canonical coordinate — additive, recombining, manifestly $P_X(i)=\lambda^i$, unifying with
FINANCE/DRAFT and the on-chain tick $i_X$. We inline $\lambda^{\pm\Delta_i}$ below.

Payoff matrix is given by:

$$
\Pi = 
\begin{bmatrix}
   \lambda^{\Delta_i}\, P^{(\mathcal{R})}       & r\, P^{(B)} \\
   \lambda^{-\Delta_i}\, P^{(\mathcal{R})} & r\, P^{(B)} \\
   \big (\Pi_{11} -  K \big)^{+} & \big (\Pi_{12} -  K\big)^{+} 
\end{bmatrix}
$$
where $\lambda^{\Delta_i} > \lambda^{-\Delta_i} >0, r > 0, K \geq 0$


We need to show **necessary** and **sufficient** conditions on $(\lambda^{\Delta_i}, r)$ for the absence of arbitrage involving ONLY the stock and the bond


### **Solution**



Considering only $\mathcal{R}$ and $B$, we focus on the submatrix

$$
\Pi^{(\mathcal{R}, B)} \in \mathbb{R}^{2\times 2}
$$

For the absence of arbitrage, we require the existence of a state price vector 
$$
\exists_{\psi \, \in \, \mathbb{R}^{M}} \quad P =  \Big (\Pi^{(\mathcal{R}, B)} \Big)^\top \, \psi
$$

Then:

Given $\psi > 0$:
$$
\begin{bmatrix}
   \lambda^{\Delta_i}\, P^{(\mathcal{R})}       & \lambda^{-\Delta_i}\, P^{(\mathcal{R})}  \\
   r\, P^{(B)}                & r\, P^{(B)}                 
\end{bmatrix}^{T}
\cdot  
\begin{bmatrix}
   \psi_1 \\
   \psi_2 
\end{bmatrix}
=
\begin{bmatrix}
   P^{(\mathcal{R})} \\
   P^{(B)}
\end{bmatrix}
\tag{1}
$$



Then to solve for $\psi$, we require:

$$
\det \bigg (\Big (\Pi^{(\mathcal{R}, B)} \Big)^\top \bigg) \neq 0
$$

Which yields the expression:


$$
\begin{aligned}
\det \left(
\begin{bmatrix}
   \lambda^{\Delta_i}\, P^{(\mathcal{R})}       & r\, P^{(B)}  \\
   \lambda^{-\Delta_i}\, P^{(\mathcal{R})}  & r\, P^{(B)}                 
\end{bmatrix}
\right)
&= \bigg[\lambda^{\Delta_i}\, r P^{(\mathcal{R})} P^{(B)} -  \lambda^{-\Delta_i}\,r P^{(\mathcal{R})} P^{(B)} \bigg] \\

&= r P^{(\mathcal{R})} P^{(B)} \left( \lambda^{\Delta_i} - \lambda^{-\Delta_i} \right)
\end{aligned}
$$

This expression is zero when:

$$
\lambda^{\Delta_i} = \lambda^{-\Delta_i}
$$

Since $\lambda^{\Delta_i} > \lambda^{-\Delta_i}$, then:

$$
\det \bigg (\Big (\Pi^{(\mathcal{R}, B)} \Big)^\top \bigg) \neq 0
$$


Now, from (1):

$$
\begin{aligned}
    &\text{(1.1)}\quad \psi_1 \lambda^{\Delta_i}\, P^{(\mathcal{R})} + \psi_2 \, r \, P^{(B)} = P^{(\mathcal{R})} \\
    &\text{(1.2)}\quad \psi_1 \lambda^{-\Delta_i} P^{(\mathcal{R})} + \psi_2 \, r \, P^{(B)} = P^{(B)}
\end{aligned}
$$

From wich:


$$
\begin{aligned}
    &\text{(1.1)} \implies \psi_1 + \psi_2 = \frac{1}{r} \\
    &\text{(1.2)} \implies \lambda^{\Delta_i} \, \psi_1 + \lambda^{-\Delta_i} \, \psi_2 = 1
\end{aligned}
$$


The intersection point $(\psi_1^\star, \psi_2^\star)$ is the unique solution to (1.1) and (1.2).

$$
\begin{aligned}
    \psi_1^\star &= \frac{1 - \frac{1}{\lambda^{\Delta_i}\, r }}{\lambda^{\Delta_i} - \lambda^{-\Delta_i}} \\
    \psi_2^\star &= \frac{\frac{\lambda^{\Delta_i}}{r} - 1}{\lambda^{\Delta_i} - \lambda^{-\Delta_i}}
\end{aligned}
$$

Absence of arbitrage in the $(\mathcal{R}, B)$-market requires $(\psi_1^\star, \psi_2^\star) \in \mathbb{R}_{++}^2$.

Which holds if and only if $r$ and $u$ satisfy

$$
\boxed{\lambda^{-\Delta_i} < r < \lambda^{\Delta_i}}\qquad(r\ \text{gross},\ r=1+r_f=e^{\tilde r\Delta t})
$$


## **(B)**

Assuming **no-arbitrage** for $\Big (\mathcal{R},\, B,\, \text{Call} (\cdot; \mathcal{R}(\varepsilon))\Big )$ we are asked to calculate 

$$
P^{\text{Call}\Big (K,\tau; \mathcal{R}(\varepsilon) \Big)}
$$


### **Solution**

From **(A)** we have the present value discount factors:

$$
\frac{\psi^{\star}(\lambda^{\Delta_i})}{\psi}, \frac{\psi^{\star}(\lambda^{-\Delta_i})}{\psi}; \, \; \psi = \psi^{\star} (\lambda^{\Delta_i}) + \psi^{\star} (\lambda^{-\Delta_i})
$$


From **(A) (1.1)**:

$$
\psi  = \frac{1}{r}
$$

Then:

$$
\begin{aligned}
    \mathbb{Q} (\lambda^{\Delta_i}) := \frac{\psi^{\star} (\lambda^{\Delta_i})}{\psi} = \frac{r- \lambda^{-\Delta_i}}{ \lambda^{\Delta_i} - \lambda^{-\Delta_i}} \\
    \\
    \mathbb{Q} (\lambda^{-\Delta_i}) := \frac{\psi^{\star} (\lambda^{-\Delta_i})}{\psi} = \frac{\lambda^{\Delta_i} - r}{ \lambda^{\Delta_i}- \lambda^{-\Delta_i}} 
\end{aligned} \tag{2}
$$

From:

$$
\begin{align*}
    \Pi^{\text{Call} (\cdot; \mathcal{R}(\varepsilon))} 
    &= 
    \begin{bmatrix}
        \left( \Pi_{11} - K \right)^{+} \\
        \left( \Pi_{12} - K \right)^{+}
    \end{bmatrix} \\
    \\
    &=
    \begin{bmatrix}
        \left( \lambda^{\Delta_i}\, P^{(\mathcal{R})} - K \right)^{+} \\
        \left( \lambda^{-\Delta_i}\, P^{(\mathcal{R})} - K \right)^{+}
    \end{bmatrix}
\end{align*}
$$


Then:

$$
\begin{align*}
    \frac{P^{\text{Call}\Big (K,\tau; \mathcal{R}(\varepsilon) \Big)}}{\psi} 
    &= 
    \big (\frac{\psi^{\star} (\lambda^{\Delta_i})}{\psi}\big)\left( \lambda^{\Delta_i}\, P^{(\mathcal{R})} - K \right)^{+} + \big (\frac{\psi^{\star} (\lambda^{-\Delta_i})}{\psi}\big )    \left( \lambda^{-\Delta_i}\, P^{(\mathcal{R})} - K \right)^{+} \\
    \\
    &= \bigg ( \frac{r- \lambda^{-\Delta_i}}{ \lambda^{\Delta_i} - \lambda^{-\Delta_i}} \bigg)\cdot \left( \lambda^{\Delta_i}\, P^{(\mathcal{R})} - K \right)^{+} + \cdots \\
    \\
    & \quad \bigg( \frac{\lambda^{\Delta_i} - r}{ \lambda^{\Delta_i} - \lambda^{-\Delta_i}} \bigg)\cdot \left( \lambda^{-\Delta_i}\, P^{(\mathcal{R})} - K \right)^{+}
\end{align*}
$$

Then:

$$
\boxed{
      P_0^{\text{Call}\Big (K,\tau; \mathcal{R}(\varepsilon) \Big)} = \frac{1}{r} \bigg[ \left( \frac{r - \lambda^{-\Delta_i}}{\lambda^{\Delta_i} - \lambda^{-\Delta_i}} \right) \left( \lambda^{\Delta_i}\, P^{(\mathcal{R})} - K \right)^{+} 
    + \left( \frac{\lambda^{\Delta_i} - r}{\lambda^{\Delta_i} - \lambda^{-\Delta_i}} \right) \left( \lambda^{-\Delta_i}\, P^{(\mathcal{R})} - K \right)^{+} \bigg]
}
$$


## Economic Meaning

This is the **single-tick CRR instance** of the discrete Black–Scholes / no-arbitrage
framework in [FINANCE](../../cfmm-discrete/FINANCE.md). The two-state world
$\Omega=\{u,1/u\}=\{\lambda^{\Delta_i},\lambda^{-\Delta_i}\}$ is **one tick-spacing step** of a CFMM price lattice:

- **Tick multiplier.** $u=\lambda^{\Delta_i}$ is the one-tick-spacing factor of the geometric grid
  $P_X(i)=\lambda^{i}$ (up = one spacing $i\mapsto i+\Delta_i$; $1/u=\lambda^{-\Delta_i}$ = one tick down,
  $\Delta_i$ the tick spacing). $\mathcal{R}$ is the pool's reserve-priced asset; $B(r)$ the numéraire.
- **Rate convention.** DUFFIE's $r$ is a **gross** bond return ($P^{(B)}_{t+1}=r P^{(B)}_t$,
  $\psi=1/r$); it maps to FINANCE's continuous rate by $r_{\text{DUFFIE}}=e^{r\Delta t}$ —
  this is what makes the two risk-neutral formulas the *same* object.
- **No-arbitrage cone.** $\boxed{\lambda^{-\Delta_i}<r<\lambda^{\Delta_i}}$ IS the **no-arbitrage cone of the 2-asset
  $\{\text{risky reserve }\mathcal{R},\ \text{bond }B\}$ CRR pool** — the feasible
  $(\lambda^{\Delta_i},r)$ region with a strictly positive state-price vector; the single-tick image of
  FINANCE's $q\in(0,1)$: $\;q\in(0,1)\iff \lambda^{-\Delta_i}<e^{r\Delta t}<\lambda^{\Delta_i}$.
- **Risk-neutral up-prob.** $\mathbb{Q}(\lambda^{\Delta_i})=\frac{r-\lambda^{-\Delta_i}}{\lambda^{\Delta_i}-\lambda^{-\Delta_i}}$ is the single-tick-spacing instance
  of FINANCE's $q=\frac{\lambda e^{r\Delta t}-1}{\lambda^2-1}$ (the $\Delta_i=1$ unit-tick form; identical under
  $\lambda\to\lambda^{\Delta_i},\ r=e^{r\Delta t}$) — fixed by the pool's $\sigma_X=\ln\lambda/\sqrt{\Delta t}$.
- **Claim value = CRR backward induction.** $P_0^{\text{Call}}=\frac1r\mathbb{E}^{\mathbb{Q}}
  [(P^{(\mathcal{R})}_1-K)^+]$ is the one-step backward-induction value of the LP claim
  $\pi$ — the single-tick case of FINANCE's
  $\pi(i,j)=e^{-r\Delta t}\{q\,\pi(i+1,j+1)+(1-q)\pi(i-1,j+1)\}$.
- **State price = deflator.** $\psi^\star(\lambda^{\Delta_i}),\psi^\star(\lambda^{-\Delta_i})$ are the pool's state-price
  deflator $\delta^{\star}$ ([BASE](../notes/BASE.md)): $\delta^{\star}=e^{-r\Delta t}d\mathbb{Q}$,
  $\mathbb{Q}=\delta^{\star}/\sum\delta^{\star}$.

### Implementation pointer
The 2-asset no-arb cone $\lambda^{-\Delta_i}<r<\lambda^{\Delta_i}$ is the feasible-trade region of a Uniswap-V2-style
constant-product pool over one tick; no on-chain twin beyond existing CRR/tick math in
`clamm-automaton/src/` is warranted for this single step.


# [2.1]()

We again have three securities, characteerized by its price and dividend adapted process pair to the filtration $\mathcal{F}$ on the measurable space $(\Omega = \{u, 1/u\} = \{\lambda^{\Delta_i}, \lambda^{-\Delta_i}\} , \mathcal{F})$ ($u=\lambda^{\Delta_i}$, one tick spacing):


$$
\begin{aligned}
    \underbrace{S_1 \Big (P^{(\mathcal{R})}, 0\Big)}_{\text{risky asset}}, \underbrace{S_2 \Big (P^{(B)}, 0\Big)}_{\text{riskless bond}}, \underbrace{S_3 \Big (P^{\text{Call}\Big (K,\tau; \mathcal{R}(\varepsilon) \Big)}, 0\Big)}_{\text{call option on risky asset}}
\end{aligned}
$$



- For $P^{(\mathcal{R})}$ (i.e risky asset market price adapted process), we have:


$$
\begin{aligned}
    \begin{cases}
        P_0^{(\mathcal{R})} > 0 \\
        \\
        \forall_{t \geq 0} \quad P_{t+1}^{(\mathcal{R})} = \epsilon^{\mathbb{Q}}_tP_{t}^{(\mathcal{R})} 
    \end{cases}
\end{aligned}
$$

where $\epsilon^{\mathbb{Q}} \sim \mathcal{B}^{\mathbb{Q}}_{\hat{\psi}}$, defined as:

$$
\begin{aligned}
    \epsilon^{\mathbb{Q}}_t = 
    \begin{cases}
        \lambda^{\Delta_i} & \mathbb{Q} (\lambda^{\Delta_i}) \\
        \lambda^{-\Delta_i} & \mathbb{Q} (\lambda^{-\Delta_i}) = 1- \mathbb{Q} (\lambda^{\Delta_i}) 
    \end{cases}
\end{aligned} 
$$


- For $P^{(B)}$ (i.e bond market price adapted process), we have:


$$
\begin{aligned}
    \begin{cases}
        P_0^{(B)} > 0 \\
        \\
        \forall_{t \geq 0} \quad P_{t+1}^{(B)} = r\,P_{t}^{(B)} 
    \end{cases}
\end{aligned}
$$

- For $P^{\text{Call}\Big (K,\tau; \mathcal{R}(\epsilon^{\mathbb{Q}}) \Big)}$ , we have:

$$
\begin{aligned}
    \begin{cases}
        P_0^{\text{Call}\Big (K,\tau; \mathcal{R}(\epsilon^{\mathbb{Q}}) \Big)} > 0 \\
        \\
        \boxed{\underbrace{\forall_{t} : 0 \leq t \leq \tau \quad \quad P_{t}^{\text{Call}\Big (K,\tau; \mathcal{R}(\epsilon^{\mathbb{Q}}) \Big)} = \frac{1}{r^{\tau -t}}\sum_{i=0}^{\tau - t} \mathcal{B}^{\mathbb{Q}}(i) \Big ((\lambda^{\Delta_i})^i (\lambda^{-\Delta_i})^{\tau -t -i}\cdot P^{(\mathcal{R})}_{t} - K\Big)^{+}}_{\text{To be shown on (A)};\ (\lambda^{\Delta_i})^i(\lambda^{-\Delta_i})^{\tau-t-i}=\lambda^{\Delta_i(2i-(\tau-t))}=P_X(i_t+\Delta_i(2i-(\tau-t)))/P_X(i_t)} } \\
        \\
        \forall_{t} : \tau < t < T \quad  P_t^{\text{Call}\Big (K,\tau; \mathcal{R}(\epsilon^{\mathbb{Q}}) \Big)} = 0
    \end{cases}
\end{aligned}
$$


## **(A)**
### **Solution**

Considering  [**BASE**](../notes/BASE.md). From [**1.11**](#1.11) at time zero:

$$
\begin{aligned}
    P^{\text{Call}\Big (K,\tau (1); \mathcal{R}(\epsilon^{\mathbb{Q}}) \Big)}_{0}  &=
    \frac{1}{r} \bigg[ \left( \frac{r - \lambda^{-\Delta_i}}{\lambda^{\Delta_i} - \lambda^{-\Delta_i}} \right) \left( \lambda^{\Delta_i}\, P^{(\mathcal{R})}_0 - K \right)^{+} 
    + \cdots \\
    \\
    & \left( \frac{\lambda^{\Delta_i} - r}{\lambda^{\Delta_i} - \lambda^{-\Delta_i}} \right) \left( \lambda^{-\Delta_i}\, P^{(\mathcal{R})} - K \right)^{+} \bigg] \\
    \\
    & \implies \Big \langle \text{(2)} \Big\rangle \\
    \\ 
    &= \frac{1}{r} \bigg[ \mathbb{Q} (\lambda^{\Delta_i}) \left( \lambda^{\Delta_i}\, P^{(\mathcal{R})}_0 - K \right)^{+} 
    + \left( 1- \mathbb{Q}(\lambda^{\Delta_i}) \right) \left( \lambda^{-\Delta_i}\, P^{(\mathcal{R})} - K \right)^{+} \bigg] \\
    \\
    &= \frac{1}{r^{1}}\mathbb{E}^{\mathbb{Q}} \Big [ \, (P^{(\mathcal{R})}_{1} - K)^{+} \, \Big]
\end{aligned}
$$
24
This is seems to be base case of:

$$
\begin{aligned}
    P^{\text{Call}\Big (K,\tau (T); \mathcal{R}(\epsilon^{\mathbb{Q}}) \Big)}_{t-1} = \frac{1}{r^{t-(t-1)}}\mathbb{E}^{\mathbb{Q}} \Big [ \, (P^{(\mathcal{R})}_{t} - K)^{+} \mid \mathcal{F}_{t-1}\, \Big]\quad ; \, \forall \, t < \tau (T) \tag{3}
\end{aligned}
$$




Let's define the process $\hat{P^{(\mathcal{R})}}$ as:

$$
\begin{aligned}
    \hat{P^{(\mathcal{R})}}_{0} =  P^{(\mathcal{R})}_{0}
    \\
    \hat{P^{(\mathcal{R})}}_{t+1} = \hat{P_0}^{(\mathcal{R})}\prod_{i=0}^{t} \epsilon^{\mathbb{Q}}_i  
\end{aligned}
$$


Thus, it follows:

$$
\begin{aligned}
    \hat{P^{(\mathcal{R})}}_{t+1} &= \Big (\prod_{i=0}^{t} \epsilon^{\mathbb{Q}}_i\Big)\cdot \hat{P_0^{(\mathcal{R})}} \\
    \\
    \Big (\hat{P^{(\mathcal{R})}}_{t+1} - K \Big )^+ &= \Big (\Big (\prod_{i=0}^{t} \epsilon^{\mathbb{Q}}_i\Big)\cdot \hat{P_0^{(\mathcal{R})}} - K\Big)^+ \\
    \\
    \mathbb{E}^{\mathbb{Q}}\Big [ \Big (\hat{P^{(\mathcal{R})}}_{t+1} - K \Big )^+ \Big]&= \mathbb{E}^{\mathbb{Q}}\Big [ \Big (\Big (\prod_{i=0}^{t} \epsilon^{\mathbb{Q}}_i\Big)\cdot \hat{P_0^{(\mathcal{R})}} - K\Big)^+\Big] 
\end{aligned}
$$

Define a random variable on **(4)** that counts how many times the event $\{ϵ_
i = \lambda^{\Delta_i}\}$ occurs from time $t$:

$$ 
 \begin{aligned} 
 
     \#^u (t;\epsilon) = \sum_{i=t}^{T} \mathbf{1}_{\left\{ \epsilon^{\mathbb{Q}}_i = \lambda^{\Delta_i} \right\}} ; && \#^u (\epsilon) \sim \mathcal{B}^{\mathbb{Q}} (T- t) \tag{6}
 
 \end{aligned}
$$

Then:

$$
\begin{aligned}
    \mathbb{E}^{\mathbb{Q}}\left[ \left( \hat{P}^{(\mathcal{R})}_{t+1} - K \right )^+ \right]
    &= 
    \mathbb{E}^{\mathbb{Q}}\left[ \left( \left( \prod_{i=0}^{t} \epsilon^{\mathbb{Q}}_i \right) \cdot \hat{P}^{(\mathcal{R})}_{t} - K \right )^+ \right] \\
    \\
    \implies \left\langle\, (6) \implies \prod_{i=0}^{t} \epsilon^{\mathbb{Q}}_i 
    = (\lambda^{\Delta_i})^{\#^u (0;\epsilon)} \, \big (\lambda^{-\Delta_i}\big)^{(t+1-\#^u (0;\epsilon))}\, \right\rangle \\

    &= 
    \mathbb{E}^{\mathbb{Q}}\left[ \left( (\lambda^{\Delta_i})^{\#^u (0;\epsilon)} \big( \lambda^{-\Delta_i} \big )^{t+1-\#^u (0;\epsilon)} \cdot \hat{P}^{(\mathcal{R})}_{t} - K \right )^+ \right] \\
    \\
    \implies \left\langle\, \mathbb{E}^{\mathbb{Q}}[f(K_t)] = \sum_{i=0}^{t} f(i) \, \mathbb{Q}(K_t=i) \, \right\rangle \\
    &=  \sum_{i=0}^{T - t} \mathcal{B}^{\mathbb{Q}}(i) \Big ((\lambda^{\Delta_i})^i (\lambda^{-\Delta_i})^{(T-t) -i}\cdot P^{(\mathcal{R})}_{t} - K\Big)^{+}
\end{aligned}
$$

Thus, it follows:

$$
\begin{aligned}
    P_{t}^{\text{Call}\Big (K,\tau (T); \mathcal{R}(\epsilon^{\mathbb{Q}}) \Big)} = \frac{1}{r^{\tau (T) -t}}\sum_{i=0}^{\tau(T) - t} \mathcal{B}^{\mathbb{Q}}(i) \Big ((\lambda^{\Delta_i})^i (\lambda^{-\Delta_i})^{\tau(T) -t -i}\cdot P^{(\mathcal{R})}_{t} - K\Big)^{+}
\end{aligned}
$$

## **(B)**
## **(C)**
From the canonical stopping time **(5)**:

We have:

$$
\begin{aligned}
    \tau^E (T) = T \iff \text{Call} (K, \tau^E(T),\mathcal{R}) \tag{European}
\end{aligned}
$$

And:

$$
\begin{aligned}
    \tau^{A} \, (T) = \mathcal{T} \, (T)  \iff \text{Call} (K, \tau^A(T),\mathcal{R}) \\
    \tag{American}
\end{aligned}
$$

Where:

$$
\mathcal{T} \ (T) = \Big \{ \tau \in \mathbb{N}^{\Omega_T} \mid \{\tau = t\} \{\mathcal{F_t}\}\Big\}
$$



## **(D)**


## [Panoptic Bridge](https://paper.panoptic.xyz/)

The key difference between the pricing of regular options and the streaming premium model is that, instead of requiring the users to pay for their options upfront, the pricing of an option is path-dependent and will grow at each block according to the proximity of the spot price to the option strike price. Formally, this corresponds to continuously integrating the theta of the option. Note that the theta of an option is defined as the derivative of the option’s value with respect to time.

$$
\begin{align*}
    P_{\mathcal{u}/ C_{\mathcal{T}}} \left(K; P_{\mathcal{u}/\mathcal{T}}, \sigma, (1+\overline{r}) \right) 
    &= \underbrace{\sum_i^{M} \big (\frac{\psi_i^{\star}}{\sum_j^M \psi_j^{\star}}\big) \cdot (\Pi_{i, \mathcal{T}} - K)^{+}}_{\text{Arrow-Debreu Duffie notation}} \\
    \\
    &\overbrace{=}^{\text{Will “integrating theta over the price S(t)” result in an fair options pricing?}} 
    \\
    &
    \underbrace{\int_{\mathcal{P}_{\mathcal{u}/\mathcal{T}} (t)} \theta \big ( K \, ;P_{\mathcal{u}/\mathcal{T}}^t, \sigma_t, (1+\overline{r})_t\big )\cdot dt}_{\text{Panoptic G.Lambert notation}}
\end{align*}
$$

Where:

$$
\theta \big ( K \, ;P_{\mathcal{u}/\mathcal{T}}^t, \sigma_t, (1+\overline{r})_t\big ) = \frac{\partial}{\partial t} \big ( P_{\mathcal{u}/ C_{\mathcal{T}}} \left(K; P_{\mathcal{u}/\mathcal{T}}, \sigma, (1+\overline{r}) \right) \big)
$$

### Method

Multi Period ---> Monte Carlo Simulation to compute the integral of theta over time for thousands of simulated price paths based on Geometric Brownian Motion. 

The result does converge to the BlackScholes price, but the distribution of option price can be quite large  --> Convergenge --> Discrete method of convergence

## Economic Meaning

Exercise 2.1 is the **multi-period CRR lattice** generalization of 1.11 — the full
recombining tick tree of [FINANCE](../../cfmm-discrete/FINANCE.md). Its concrete CFMM
construct is the **CRR backward-induction value of the LP call-claim $\pi$ on the
$(i,j)$ price–time lattice**:

- **Recombining tick lattice.** $P^{(\mathcal{R})}_{t+1}=\epsilon^{\mathbb{Q}}_t
  P^{(\mathcal{R})}_t$, $\epsilon^{\mathbb{Q}}\in\{\lambda^{\Delta_i},\lambda^{-\Delta_i}\}$, is the random walk
  on the geometric tick grid (spacing $\Delta_i$): after $t$ steps the reserve price sits at tick $i$,
  $P^{(\mathcal{R})}_t=\lambda^{i}P_0$. The binomial count $\#^u$ scales the **net tick
  displacement** $\Delta_i(2\#^u-t)$, $\mathcal{B}^{\mathbb{Q}}$ its risk-neutral law.
- **Backward-induction claim value.** The boxed $P_t^{\text{Call}}=\frac{1}{r^{\tau-t}}
  \sum_i \mathcal{B}^{\mathbb{Q}}(i)((\lambda^{\Delta_i})^i(\lambda^{-\Delta_i})^{\tau-t-i}P^{(\mathcal{R})}_t-K)^+$ is FINANCE's
  recursion rolled back over $\tau-t$ ticks — the **value of the LP option-claim on the
  pool**, constant per-step weight $q=\mathbb{Q}(\lambda^{\Delta_i})$ (under $r=e^{r\Delta t}$), per-state
  deflator $\delta^{\star}$.
- **European vs American = passive vs active LP.** $\tau^E(T)=T$ is the European claim;
  $\tau^A(T)=\mathcal{T}(T)$ (any adapted stopping) is the American claim — the LP's
  optimal-rebalance / early-close right on the position.
- **Panoptic streaming bridge.** The Arrow–Debreu sum
  $\sum_i(\psi_i^\star/\sum_j\psi_j^\star)(\Pi_{i,\mathcal{T}}-K)^+$ IS Panoptic's
  streaming-premium price; "integrating $\theta$ over the path" is the $\Delta t\to0$
  limit of this discrete backward induction — the lattice is the convergent, MEV-free
  twin of the Monte-Carlo $\theta$-integral (answering the closing Question).

### Implementation pointer
The recombining lattice + backward induction is the discrete core of a Panoptic-style
streaming-premium AMM option; the on-chain twin is tick-indexed premium accrual in
`clamm-automaton/src/`, the discrete convergent of the $\theta$-integral.

## **Questions**:

    - How we could connect this discrete simple case with the premia defined by panoptic being path depdendant as above, using the language of the above exercises?





