

$$
\begin{aligned}
	\Sigma : \sigma \, \times \, \sigma_{IV}
\end{aligned}
$$



[Implied volatility](~/learning/cfmm-theory/lp-derivatives/kristensen-perpetual_options_uniswap_v3-2024.pdf)
$$
\begin{aligned}
	\sigma_{IV} \, (t) \, &=\, 2 \,\overline{\phi} \, \sqrt{\frac{V_t(\Delta)}{V(L(i(t)))}} 
\end{aligned}
$$


[realized volatility](~/learning/cfmm-theory/lp-derivatives/Algerbra Tech Paper-15411d15f8653a81d5f7f574bfe655ad.pdf)

The realized-volatility state variable $\sigma_X(t)$ is the **on-chain windowed tick-variance** tracked by the Algebra dynamic-fee plugin's `VolatilityOracle`. Over the strictly-trailing window $[t-\text{WINDOW}, t]$:

$$
\begin{aligned}
	\sigma_X \, (t) \, &= \, \frac{1}{\text{WINDOW}} \sum_{s \, \in \, [t-\text{WINDOW},\, t]} \Big(\, i_X(s) - \overline{i_X}(t)\, \Big)^2, \\
	\\
	\overline{i_X}(t) \, &= \, \frac{1}{\text{WINDOW}} \sum_{s \, \in \, [t-\text{WINDOW},\, t]} i_X(s), \\
	\\
	i_X(s) \, &= \, \big\lfloor \log_{1.0001} \sqrt{P(s)} \big\rfloor,
\end{aligned}
$$

where $i_X(s)$ is the tick index, computable on-chain from `sqrtPriceX96`, and $\sigma_X(t) \in \mathbb{R}_{\geq 0}$.

**Window pin.** The window is the literal trailing interval `[t−WINDOW, t]` with `WINDOW = 1 day` — a fixed **Algebra protocol constant** (`VolatilityOracle.sol:16`, `uint32 internal constant WINDOW = 1 days`), **NOT** a free hyperparameter $Z$. The window $[t-\text{WINDOW}, t]$ is strictly trailing: block-$t$ data up to the current timestamp is used, but no future timestamp enters.

> **No future information enters: the window $[t-\text{WINDOW}, t]$ is strictly trailing and look-ahead-free, so the $(\text{state}, \phi_{\text{obs}})$ series is constructible on-chain in real time.**

**Canonical on-chain source.** This $\sigma_X(t)$ is the realized volatility from `@cryptoalgebra/volatility-oracle-plugin/contracts/libraries/VolatilityOracle.sol`: `_volatilityOnRange` (VolatilityOracle.sol:284–308) computes $\sum (\text{tick}(s) - \text{avgTick})^2$ over an interval in closed form, and `getAverageVolatility` (VolatilityOracle.sol:195–242) returns the average over the trailing window. The matching discrete-notes form is at [`FINANCE.md §Adaptive fee & realized variance`](../cfmm-discrete/FINANCE.md) (with $\text{tick} = i_X$, $\text{avgTick} = \overline{i_X}$) — the on-chain oracle and the discrete-notes form **agree**. The Phase-2 numerical leg reads $\sigma_{\text{obs}}$ from this same oracle and $\phi_{\text{obs}}$ is the sigmoid adaptive fee, so the WDEF-04→NUM contract is concrete.

**Scope.** Of the product space $\Sigma = \sigma \times \sigma_{IV}$, only the realized-vol factor $\sigma$ (i.e. $\sigma_X(t)$) enters the $\bar\phi^\star$ (1.7(ii)) closure; the $\sigma_{IV}$ factor is out-of-(ii)-closure. See [`PHI_STAR_DEPS.md`](notes/PHI_STAR_DEPS.md): $\sigma_X(t)$ is the state variable $x$, tagged `defined-in-v1`.







