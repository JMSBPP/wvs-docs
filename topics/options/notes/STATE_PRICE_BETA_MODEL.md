import [$q$](./PORTAFOLIO.md)


import [$\delta^{\text{discount}}, \, \delta^{\star}$](./STOCHASTIC_DISCOUNT_FACTOR.md)

import [$(D, P)$](./DIVIDEND_PRICE.md)

import [$P(\Pi) = \mathbb{E} \, \Big [\delta\, \Pi\Big]$](./BASE.md)

import [$\text{Cov} \, (\cdot ), \text{Corr} \, (\cdot)$](./BASE.md)



From $(D, \, P)$, we have $R \subseteq D$:

- **Portafolio Return:**
$$
\begin{aligned}
    \underbrace{p\, q \neq 0}_{\text{portfolio carries value/debt}} \iff \underbrace{R^{(q)} = \frac{D^T \, q}{p \, q}}_{\text{portfolio return}}
\end{aligned}
$$

Define $R^{(0)}$ as a risk-less portafolio (bank account)

$$
\begin{aligned}
    \underbrace{\mathbb{E}\, \Big [ R^{(q)} - R^{(0)} \Big]}_{\text{excess returns}} \, &\propto \, - \frac{\text{Cov} \, (R^{(q)}, \delta^{\star})}{\mathbb{E} \, \Big [\delta^{\star}\Big ]} \\
    \\
    \implies \Big \langle \text{Corr} = \sigma_1 \, \sigma_1 \text{Cov}\Big \rangle\\
    \\
    &\propto - \frac{\mid \sigma_{\delta^{\star}} \mid \, \mid \sigma_{R^{(q)}}\mid \, \text{Corr} \, (\delta^{\star}\, ,R^{(q)})}{\mathbb{E} \, \Big [\delta^{\star}\Big]} \\
    \\
    \implies \Big \langle \text{What matters is excess return per unit of risk}\Big \rangle \\
    \\
    \underbrace{\frac{\mathbb{E}\, \Big [ R^{(q)} - R^{(0)} \Big]}{\mid \sigma_{R^{(q)}}\mid}}_{\text{sharpe ratio}} \, & \propto - \, \underbrace{\text{Corr} \, ( \delta^{\star}, R^{(q)}) \,}_{\text{How aligned is the payoff portafolio with what states the economy values}} \frac{|\sigma_{\delta^{\star}}|}{\mathbb{E} [\delta^{\star}]} 
\end{aligned}
$$

$$
\begin{aligned}
    \frac{\overbrace{|\sigma_{\delta^{\star}}|}^{\text{Risk value perception}}}{\underbrace{\mathbb{E} \, [\delta^{\star}]}_{\text{average discounting (time value)}}} : \text{How disperse is the value risk across states relative to its average value}
\end{aligned}
$$

- **Global Portafolio**

$$
\begin{aligned}
    q^{\star} \iff \text{Corr} \, (\delta^{\star}, \, q^{\star}) = -1 \\
    \implies \\
    \frac{\mathbb{E} \, \Big [ R^{(q^{\star})} - R^{(0)}\Big]}{|\sigma_{R^{q^\star}}|} &= \frac{|\sigma_{\delta^{\star}}|}{\mathbb{E}\, [\delta^{\star}]} \tag{1}
\end{aligned}
$$
> $q^{\star}$ is ofter a **reference** but not *"practically"* obtainable portafolio

- $q^{\star}$ loads on the component of risk the market cares about -> *"It has no wasted volatility"*

$$
\begin{aligned}
    (1) \implies \, \sigma_1 \sigma_2 = -\text{Cov} \, (R^{(q)}, \delta^{\star})   
\end{aligned}
$$

Back to:

$$
\begin{aligned}
    \frac{\mathbb{E}\left[ R^{(q)} - R^{(0)} \right]}{|\sigma_{R^{(q)}}|} \, &\propto -\, \text{Corr}(\delta^{\star}, R^{(q)}) \, \frac{|\sigma_{\delta^{\star}}|}{\mathbb{E} [\delta^{\star}]}  \\
    \\
    \sup_{q} \left( \frac{\mathbb{E}\left[ R^{(q)} - R^{(0)} \right]}{|\sigma_{R^{(q)}}|} \right) \, &\propto\, \sup_{q} \left( \text{Corr}(\delta^{\star}, R^{(q)}) \right) \, \frac{|\sigma_{\delta^{\star}}|}{\mathbb{E} [\delta^{\star}]} \\
    \\
    \implies \left\langle (1) \right\rangle \\
    &\propto\, \sup_{q} \left( \text{Corr}(\delta^{\star}, R^{(q)}) \right) \, \frac{\mathbb{E}\left[ R^{(q^{\star})} - R^{(0)} \right]}{|\sigma_{R^{q^{\star}}}|} \\
    \\
    \implies \left\langle \text{If } q \text{ solves for } \sup (\cdot) \right\rangle \\ 
    \\
    \mathbb{E}\left[ R^{(q)} - R^{(0)} \right] &\propto\, |\sigma_{R^{(q)}}| \, \frac{-\text{Cov}(R^{(q)}, \delta^{\star})}{|\sigma_{\delta^{\star}}|\, |\sigma_{R^{(q)}}|} \, \frac{\mathbb{E}\left[ R^{(q^{\star})} - R^{(0)} \right]}{|\sigma_{R^{q^{\star}}}|} \\
    \\
    &\implies \left\langle \text{If } \text{Corr}(R^{(q^{\star})}, \delta^{\star}) = -1, \text{ then } \text{Cov}(R^{(q)}, R^{(q^{\star})}) = |\sigma_{\delta^{\star}}| \, \text{Cov}(R^{(q)}, \delta^{\star}) \right\rangle \\
    \\
    \mathbb{E}\left[ R^{(q)} - R^{(0)} \right] &\propto \frac{\text{Cov}(R^{(q)}, R^{(q^{\star})})}{|\sigma_{R^{q^{\star}}}|} \, \mathbb{E}\left[ R^{(q^{\star})} - R^{(0)} \right] \\
    \\
    &\implies \left\langle \beta_{(q)} := \frac{\text{Cov}(R^{(q)}, R^{(q^{\star})})}{|\sigma_{R^{q^{\star}}}|}\right\rangle \\
    \\
    \boxed{\mathbb{E}\left[ R^{(q)} - R^{(0)} \right] = \beta_{(q)} \, \mathbb{E}\left[ R^{(q^{\star})} - R^{(0)} \right]}
\end{aligned}
$$



