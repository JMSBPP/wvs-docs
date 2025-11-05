# Derivatives on LP Positions (position-backed hedges)

- On Uniswap v4
- Uses Diamond Pattern
- Can leverage Reactive Network (https://dev.reactive.network/)
- Leverages EigenLayer for off-chain computation (https://docs.eigencloud.xyz/products/eigenlayer/concepts/understanding-avs-on-eigenlayer)

## Primitives
- Tokenized LP claims per tokenId (ERC-1155 receipt wrappers)
- variance swaps on tick moves
- afterSwap (realized vol proxy), afterModifyPosition (liquidity delta), afterInitialize (new pool).  


