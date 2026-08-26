import [ $(\, \Omega, \, \mathcal{F}, \, \mathbb{P} )$](./BASE)

$$
\delta_{\text{state}}^{\text{discount}}
$$

is:

- density
- kernel
- deflator

Given some *custom* **adimissible** payoff $\pi^{\text{state}}$

# **STATE_PRICE** $P^{(\text{state})}$

    - unit price of state occurrance
$$
\begin{aligned}
    P^{(\text{state})} \Big (\, \pi^{(\text{state})}\,\Big) &= \sum_{\text{(state)}} \, P^{(\text{state})} \, \pi^{(\text{state})}\, \\
    \\
    &= \sum_{\text{(state)}} \, \mathbb{P} \, (\text{state}) \, \Big (\frac{P^{(\text{state})}}{\mathbb{P}\, (\text{state})}\Big) \, \pi^{(\text{state})} \\
    \\
    &\implies \, \langle \, \delta_{\text{state}}^{\text{discount}} := \frac{P^{(\text{state})}}{\mathbb{P}\, (\text{state})}\, \rangle \\
    \\
    &= \sum_{\text{(state)}} \, \mathbb{P} \, (\text{state}) \, \delta_{\text{state}}^{\text{discount}} \, \pi^{(\text{state})} \\
    \\
    &= \underbrace{\mathbb{E}^{\mathbb{P}} \, \Big [ \, \delta_{\text{state}}^{\text{discount}} \, \pi^{\text{state}}\, \Big]}_{\text{Reisz representation of } P^{state}}
\end{aligned}
$$

#  **RISKLESS BORROWING - FLASH-LOAN**

import [$q$](./TRADING_STRATEGY.md)

import [$d_t^{F-L} (\, q ; \, j\,)$](./DIVIDEND_PRICE.md)


$$
\begin{aligned}
    \underbrace{\hat{d_t} \, =\, - \, d_t^{F-L} (\, q ; \, j\,)}_{\text{discount factor}}
\end{aligned}
$$

$$
\begin{aligned}
    R^{F-L}_{t\, , \tau} \, = \frac{1}{\prod_{i=t}^{\tau} \, \hat{d_j}}
\end{aligned}
$$

$$
\begin{aligned}
    \sum_{{\text{state}}} \, P^{\, (\text{state})} 
    
    &\iff \prod_{i=t}^{\tau} \, \hat{d_j}\\
    \\
    &= \mathbb{E}^{\mathbb{P}} \, \Big [\, \delta^{\text{state}}\,\Big]\\
    \\
\end{aligned}
$$



# **RISK-NEUTRAL PROBABILITY MEASURE** $\mathbb{Q}$

$$
\begin{aligned}
    \boxed{
        \mathbb{Q} \, (\text{state}) = \mathbb{P} \, (\text{state}) \, \frac{ \delta^{\text{discount}}_{\text{state}} }{ \mathbb{E}^{\mathbb{P}} \left[ \delta^{\text{discount}}_{\text{state}} \right] }
    }
\end{aligned}
$$

|                                 | $\mathbb{Q}$ (Risk-Neutral Measure)        | $\mathbb{P}$ (Physical Measure)      |
|---------------------------------|--------------------------------------------|--------------------------------------|
| Weight on states with high average marginal value $\delta^{\text{discount}}_{\text{state}}$ | Greater weight (reflects subjective risk perceptions) | Uniform weight                      |


- Example


*People who report high subjective probabilities of "Airplane crash" state asre not "irrational expectations" under $\mathbb{Q}$, but are reporting $\underbrace{\delta^{\text{discount}}_{\text{state}}}_{\text{personal, chosen by individual marginal utility}} \mathbb{P} \, (\text{state})$*


# **RADON ... DERIVATIVE**


import [MEASURE_THEORY.CHANGE_OF_MEASURE](.\BASE.md)

$$
\begin{aligned}
    \boxed{

        \delta_{\text{state}}^{\text{discount}} \, = \, \mathbb{E}^{\mathbb{P}} \, \Big [ \delta^{\text{discount}}\Big] \, \Big (\, \frac{\mathbb{Q} \, (\text{state})}{\mathbb{P} \, (\text{state})}\, \Big)
    }
\end{aligned}
$$

- Change of measure from *unobserved* **real probability measure** $\mathbb{P}$ 
$$
\to
$$
- *observed* **subjective risk-neutral probability measure** $\mathbb{Q}$

# INFORMATION_SET_FACTORS $\mathcal{I}_{\delta^{\text{discount}}}$

- $\approx \, \delta^{discount}$


## DESCRIPTION


- vector of factors
- indicator variables, indicate that states have occurred

- forecasting variables

- "Any variable that forecasts asset returns (changes in the investment opportunity set)" **OR** Macroeconomic variables

## REQUIREMENTS

- "Be kind of unpredictable" $\sim$ "Not white noise adverse"


## SCHEMA

## METHODS

### LINEAR APPROXIMATION
import [representative LP value functional $\nu$](./UTILITY_VALUE_FUNCIONAL.md)
$$


\begin{aligned}
    \delta_{t+1}^{\text{discount}} \, = \, \mathbb{E} \, \Big [ \delta^{\text{discount}}\Big] + \beta'\, \text{VAR} \, (\mathcal{I}_{\delta}\,) \\
    \\
    \implies \\
    (\mathcal{I}_{\delta})_{t+1} \approx \frac{\frac{\nu (c_{t+1})}{\nu (c_t)} - \mathbb{E} \, \Big [ \delta^{\text{discount}}\Big]}{\beta '}
\end{aligned}
$$




