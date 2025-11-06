Modified(IOption)[./contracts/lib/op-hook/packages/foundry/contracts/IOptionToken.sol]

```solidity

interface Hedge{
    function collateral() external view returns (IERC20);

    function consideration() external view returns (IERC20) { return _consideration; }

    function toConsideration(uint256 amount) external pure returns (uint256) { return amount; }

}


interface IOption{
    function strike() external view returns (uint256);
    function STRIKE_DECIMALS() external view returns (uint256);
    function isPut() external view returns (bool);
    function isCall() external view returns(bool);
    function exercise(
        IPermit2.PermitTransferFrom calldata permit,
        IPermit2.SignatureTransferDetails calldata transferDetails,
        bytes calldata signature
    ) external;

}


abstract contract Option is ERC4626{
    IHedge hedge;

}
```
## Op-Hook Analysis

### buy option

```
UI Button Click
  ↓
useBuyOption Hook
  ↓
Token Approvals (USDC → Permit2 → Universal Router)
  ↓
Uniswap V4 Universal Router.execute()
  ↓
Uniswap V4 PoolManager.swap()
  ↓
OpHook._beforeSwap() [Hook Callback]
  ↓
OptionToken.mint() + PoolManager Accounting
  ↓
Option Tokens Transferred to User
```


### Price Update

```
UI Component Renders
  ↓
useGetOptions Hook (wagmi useReadContract)
  ↓
OpHook.getPrices(collateral) [View Function]
  ↓
getCollateralPrice() → Uniswap V3 Pool.slot0()
  ↓
For each option: getPrice(collateralPrice, optionToken)
  ↓
OptionPrice.getPrice() → Black-Scholes Calculation
  ↓
Prices Returned to UI
  ↓
Automatic Refetch on New Blocks (wagmi default)

```
User Views UI
  ↓
useGetOptions() hook (wagmi)
  ↓
OpHook.getPrices(collateral) [VIEW]
  ├─→ getCollateralPrice()
  │   └─→ Uniswap V3 Pool.slot0() [LIVE PRICE]
  │
  └─→ For each option:
      └─→ getPrice(collateralPrice, optionToken)
          └─→ OptionPrice.getPrice()
              ├─→ Reads: strike, expiration, isPut
              ├─→ Calculates: timeToExpiration = expiration - block.timestamp
              └─→ blackScholesPrice(collateralPrice, strike, timeToExpiration, ...)
                  └─→ Returns option price
  ↓
Prices array returned to UI
  ↓
UI displays: price.price / 1e18
  ↓
Auto-refetch on new block → Prices update
```

- The Diamod needs to have an entry point for Greek.fi to mint options tailored for LP's who are using options from the hedging market
    - The OpHook is the entry point from minting options. All we need is tehe custom LP parameters for the optio, to pass the parameters fro miniting the option
