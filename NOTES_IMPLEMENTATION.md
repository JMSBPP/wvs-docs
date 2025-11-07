 This is a google -chrome extension, brave extension over triggered when the user interacts with Uniswap X UI to provide liquidity

 ->

Once the user provides liqudity it needs to get the user's tokenId of the position. This tokenId has ALL the information needed

- There are sdk componetns that already help on building metrics over LP position $i$. Let's call them $M(i)$
    - The classic metrics are already displayed on Uniswap dashboard so we dop not bother with those

- We only have on the extension the built-in metrics / or already implemented metrics $M-H(i) \subseteq M(i)$ that are helpful for trading any herdge instruments

- Below we provide the "Hedge Options" wich then shows the user
available derivatives for the pool id associated with teh tokenId (The liquidity provider position) and teh metrics associated with such instrumnes value-oiriednted on their risk-rewqrad metricds and capacity to hedge user's position.

The metric's are adjusted such per amount entered to be short/long by the user for the instrument