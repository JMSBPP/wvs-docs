straddle 1 ---> 2 options ---> 1..* underlying

underlying 1 ---> 1 price_path


Before options exist, there must exist a price path.

Options only make sense if uncertainty can accumulate.


$$
\min_{T} \sum^T \text{price wiggle}
Tmin​s.t.E[i=1∑Tmin​​(ΔPi​)2]≫transaction cost floor
$$

is not trivial and hedgeable
That optimization problem makes sense if the price variable over whioch the wiggle measure is applied complies with:

1. needs formaliziation --> "a path exist --> trades repetidly"
2. price moves randomly
3. needs formalizarion --> "is hedgeable"
$$
bid-ask+impact≪∣ΔPt​∣
$$

Informally:

"Minimum lifetime is the shortest horizon where realized variance dominates frictions."

Then, An option only exists if the path has enough entropy to finance convexity replication.


$$
t=1∑T​(ΔPt​)2>friction budget
$$

The shortest horizon over which realized uncertainty dominates frictions and can be hedged.

It is not fixed.
It depends on:

Liquidity

Tick size

Transaction costs

Volatility regime

Funding

Jump risk

$$
Tmin​=argTmin​(E[Realized VarianceT​]>Replication FrictionsT​)
$$

Now this $T_min (\text{asset class})$. How do we make a qualititive attribute like asset class enter the optimization problem $T_min (\text{asset class})$



ONe method is parametrize the fundamentals of such asset class:

This is:

| Symbol      | Meaning                   | Comes from                            |
| ----------- | ------------------------- | ------------------------------------- |
| ( \sigma )  | Instantaneous volatility  | Business model, market microstructure |
| ( \lambda ) | Liquidity depth           | Asset class + venue                   |
| ( c )       | Transaction cost          | Tick size, fees                       |
| ( \delta )  | Jump intensity            | Fundamentals                          |
| ( \kappa )  | Funding spread            | Margin system                         |
| ( \phi )    | Market hours / continuity | 24/7 vs 9–5                           |
