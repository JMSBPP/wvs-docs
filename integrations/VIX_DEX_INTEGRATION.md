# create

```
UI Create Derive Page
  ↓
User Enters Pool Address
  ↓
useCreateDerive Hook
  ↓
Volume Oracle API Call
  ↓
Vix.deploy2Currency() [Contract Call]
  ↓
Deploy VolatileERC20 Tokens (HIGH & LOW)
  ↓
Mint Initial Supply (250M tokens each)
  ↓
Calculate Initial IV
  ↓
Liquidate Tokens to PoolManager
  ↓
Router.createPool() [Create Uniswap V4 Pools]
  ↓
Initialize HIGH/USDC Pool
  ↓
Initialize LOW/USDC Pool
  ↓
Pair Ready for Trading
```
1. **Entry Point:** `/create-derive` page in vixdex-interface
2. **User Input:** Uniswap V3 pool address (e.g., WETH/WBTC 0.3% pool on Sepolia)
3. **Process:**
   - Volume oracle API call to get pool metadata
   - `Vix.deploy2Currency()` contract call to create HIGH/LOW tokens
   - `Router.createPool()` calls to initialize Uniswap V4 pools
4. **Result:** Two trading pools (HIGH/USDC and LOW/USDC) ready for trading


# buy
```
UI Trade Button Click
  ↓
Navigate to /token/[deriveToken]
  ↓
TradingWidget Component
  ↓
Buy/Sell Button Click
  ↓
useSwap Hook (buy/sell)
  ↓
Token Approvals (USDC → Router → Permit2)
  ↓
Router.ExactInputSwapSingle() or ExactOutputSwapSingle()
  ↓
Uniswap V4 Universal Router.execute()
  ↓
Uniswap V4 PoolManager.swap()
  ↓
Vix._beforeSwap() [Hook Callback]
  ↓
buyOperator() / sellOperator()
  ↓
BondingCurve.costOfPurchasingToken() / costOfSellingToken()
  ↓
PoolManager Accounting & Token Transfers
  ↓
Vix._afterSwap() [Hook Callback]
  ↓
IV Calculation & Reserve Adjustment
```
### Buy Flow:
```
User Input: customAmount (USDC)
  ↓
buyToken() → buy() hook
  ↓
USDC Approval → Router → Permit2
  ↓
Router.ExactInputSwapSingle() or ExactOutputSwapSingle()
  ↓
Universal Router.execute()
  ↓
PoolManager.swap()
  ↓
Vix._beforeSwap()
  ↓
buyOperator() → buyHighToken() or buyLowToken()
  ↓
BondingCurve.costOfPurchasingToken() → calculates cost
  ↓
Updates: contractHoldings, circulation, reserve
  ↓
PoolManager flash accounting:
  - Takes USDC from user
  - Mints HIGH/LOW tokens to user
  ↓
Vix._afterSwap()
  ↓
Calculate IV → Adjust reserves based on IV changes
```

### Sell Flow:
```
User Input: customAmount (HIGH/LOW tokens)
  ↓
sellToken() → sell() hook
  ↓
Token Approval → Router → Permit2
  ↓
Router.ExactInputSwapSingle() or ExactOutputSwapSingle()
  ↓
Universal Router.execute()
  ↓
PoolManager.swap()
  ↓
Vix._beforeSwap()
  ↓
sellOperator() → sellHighToken() or sellLowToken()
  ↓
BondingCurve.costOfSellingToken() → calculates returns
  ↓
Updates: contractHoldings, circulation, reserve
  ↓
PoolManager flash accounting:
  - Takes HIGH/LOW tokens from user
  - Burns tokens
  - Returns USDC to user
  ↓
Vix._afterSwap()
  ↓
Calculate IV → Adjust reserves based on IV changes
```


# price update