# Option Price Update Flow: UI to Contract Layer

This document traces how option prices are fetched, calculated, and updated in real-time after a user purchases options.

## Flow Overview

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

---

## 1. UI Layer: Price Display

**File:** `contracts/lib/op-hook/packages/nextjs/app/opswap/page.tsx`

**Location:** Lines 18, 75-87

```18:18:contracts/lib/op-hook/packages/nextjs/app/opswap/page.tsx
  const { prices } = useGetOptions();
```



**Actions:**
- Calls `useGetOptions()` hook to fetch prices
- Displays `price.price` (in wei, 18 decimals) converted to dollars
- Maps over all prices and renders each option's current price
- Price updates automatically when `prices` array changes

---

## 2. React Hook Layer: useGetOptions

**File:** `contracts/lib/op-hook/packages/nextjs/app/useGetOptions.ts`

**Function:** `useGetOptions()`

```1:17:contracts/lib/op-hook/packages/nextjs/app/useGetOptions.ts
import { useContract } from "./opswap/useContract";
import { Address } from "viem";
import { useReadContract } from "wagmi";

export const useGetOptions = () => {
  const contract = useContract();
  const { data: prices, error } = useReadContract({
    address: contract?.OpHook.address as Address,
    abi: contract?.OpHook.abi,
    functionName: "getPrices",
  });
  if (!contract) {
    console.warn(`No contracts found`);
  }
  //   const prices = data?.[0] || [];
  return { prices, error };
};
```

**Actions:**
- Uses `wagmi`'s `useReadContract` hook
- Calls `OpHook.getPrices()` view function
- **Automatic Refetching:** `useReadContract` automatically refetches on:
  - New block mined (default wagmi behavior)
  - Component remount
  - Network/account changes
- Returns `prices` array and any errors

**Note:** The hook doesn't pass a `collateral` parameter, so it likely uses a default or the contract handles it internally.

---

## 3. Contract Layer: OpHook.getPrices()

**File:** `contracts/lib/op-hook/packages/foundry/contracts/OpHook.sol`

**Function:** `getPrices(address collateral)` (Lines 317-328)

```317:328:contracts/lib/op-hook/packages/foundry/contracts/OpHook.sol
    function getPrices(address collateral) public view returns (CurrentOptionPrice[] memory prices) {
        prices = new CurrentOptionPrice[](allPools.length);
        uint256 collateralPrice = getCollateralPrice(collateral);
        for (uint256 i = 0; i < allPools.length; i++) {
                prices[i] =  CurrentOptionPrice({
                    collateralPrice: collateralPrice,
                    collateral: address(collateral),
                    optionToken: allPools[i].optionToken,
                    price: getPrice(collateralPrice, allPools[i].optionToken)
            });
        }
    }
```

**Actions:**
1. Creates array for all option pools
2. **Fetches current collateral price** (see Step 4)
3. **Loops through all pools** and calculates price for each option
4. Returns array of `CurrentOptionPrice` structs containing:
   - `collateral`: Address of collateral token
   - `optionToken`: Address of option token
   - `price`: Current option price (18 decimals)
   - `collateralPrice`: Current collateral price (18 decimals)

---

## 4. Collateral Price Fetch: getCollateralPrice()

**File:** `contracts/lib/op-hook/packages/foundry/contracts/OpHook.sol`

**Function:** `getCollateralPrice(address collateral)` (Lines 285-305)

```285:305:contracts/lib/op-hook/packages/foundry/contracts/OpHook.sol
    function getCollateralPrice(address collateral) public view returns (uint256 price) {

        IUniswapV3Pool pricePool = IUniswapV3Pool(collateralPricePool[collateral]);

        bool collateralIsOne = pricePool.token0() == collateral ? pool.token1() == collateral : pool.token0() == collateral;
        uint8 decimals0 = IERC20Metadata(pricePool.token0()).decimals();
        uint8 decimals1 = IERC20Metadata(pricePool.token1()).decimals();
        uint256 power = 10 ** (decimals1 >= decimals0 ? decimals1 - decimals0 : decimals0 - decimals1);

        (uint160 sqrtPriceX96,,,,,,) = pricePool.slot0();
        // Calculate price with proper scaling
        // priceX192 is in Q192.192 format, we need to extract the integer part
        // uint256 priceX96 = priceX64 >> 96; // Convert from Q192.192 to Q96.96
        price = (getPriceX64(sqrtPriceX96) * 10**18) >> 64; // Convert from Q96.96 to 1e18 fixed point
        price = decimals1>decimals0 ? (price / power) : (price * power);
 
        if (collateralIsOne) {
            require(price > 0, "Price cannot be zero for inverse calculation");
            price = 1e36 / price;
        }
    }
```

**Actions:**
1. **Gets Uniswap V3 price pool** from `collateralPricePool` mapping
2. **Calls `pool.slot0()`** to get current `sqrtPriceX96` (real-time price from Uniswap V3)
3. **Converts sqrtPriceX96 to price** using `getPriceX64()`:
   - `sqrtPriceX96` is in Q64.96 format
   - Squares it to get price ratio
   - Converts to 18 decimal fixed point
4. **Adjusts for token decimals** (handles different decimal places)
5. **Handles inverse pairs** (if collateral is token1, inverts price)

**Key Point:** This reads **live price from Uniswap V3**, which updates on every swap in that pool.

---

## 5. Option Price Calculation: getPrice()

**File:** `contracts/lib/op-hook/packages/foundry/contracts/OpHook.sol`

**Function:** `getPrice(uint256 collateralPrice, address option_)` (Lines 312-315)

```312:315:contracts/lib/op-hook/packages/foundry/contracts/OpHook.sol
    function getPrice(uint256 collateralPrice, address option_) public view returns (uint256) {
        IOptionToken option = IOptionToken(option_);
        return optionPrice.getPrice(collateralPrice, option.strike(), option.expirationDate(), option.isPut(), false);
    }
```

**Actions:**
1. Gets option token contract
2. Reads option parameters:
   - `strike()`: Strike price
   - `expirationDate()`: Expiration timestamp
   - `isPut()`: Whether it's a put option
3. Calls `OptionPrice.getPrice()` with all parameters

---

## 6. Black-Scholes Pricing: OptionPrice.getPrice()

**File:** `contracts/lib/op-hook/packages/foundry/contracts/OptionPrice.sol`

**Function:** `getPrice()` (Lines 260-277)

```260:277:contracts/lib/op-hook/packages/foundry/contracts/OptionPrice.sol
    function getPrice(uint collateralPrice, uint256 strike, uint256 expiration, bool isPut, bool inverse) external view returns (uint256) {

        uint256 timeToExpiration = expiration > block.timestamp ? expiration - block.timestamp : 0;
        
        uint256 price = blackScholesPrice(
            collateralPrice, 
            strike, 
            timeToExpiration, 
            0.2 * 1e18, 
            0.05 * 1e18, 
            isPut
            );

        if (inverse && price > 0) {
            return 1e36 / price;
        }
        return price;
    }
```

**Actions:**
1. **Calculates time to expiration:**
   - `timeToExpiration = expiration - block.timestamp`
   - If expired, returns 0
   - **This decreases every second!**

2. **Calls Black-Scholes formula** with:
   - `collateralPrice`: Current underlying price (from Uniswap V3)
   - `strike`: Strike price (fixed)
   - `timeToExpiration`: Time remaining (decreases over time)
   - `volatility`: 20% (0.2 * 1e18) - **fixed parameter**
   - `riskFreeRate`: 5% (0.05 * 1e18) - **fixed parameter**
   - `isPut`: Option type (fixed)

3. Returns calculated option price in 18 decimals

**Black-Scholes Formula** (Lines 27-99):
- For **Call Options:** `C = U * N(d1) - S * exp(-r*t) * N(d2)`
- For **Put Options:** `P = S * exp(-r*t) * N(-d2) - U * N(-d1)`

Where:
- `U` = Underlying price (collateralPrice)
- `S` = Strike price
- `r` = Risk-free rate (0.05)
- `t` = Time to expiration
- `N()` = Cumulative normal distribution

---

## 7. Price Update Triggers

### Automatic Updates (Built-in)

1. **New Block Mined** (wagmi default)
   - `useReadContract` automatically refetches on new blocks
   - Typically every ~12 seconds (Ethereum) or faster on L2s
   - Prices recalculate with:
     - **New `block.timestamp`** → Time decay
     - **New collateral price** (if Uniswap V3 pool had swaps)

2. **Component Remount**
   - User navigates away and back
   - React component remounts

3. **Network/Account Changes**
   - User switches network
   - User connects/disconnects wallet

### Manual Updates

- Currently **no manual refresh button** in the UI
- Could add `refetch()` call from `useGetOptions` hook

---

## Price Change Factors

### 1. Time Decay (Theta)
- **Every second:** `timeToExpiration` decreases
- **Effect:** Option price decreases as expiration approaches
- **Formula:** `timeToExpiration = expiration - block.timestamp`
- **Impact:** Exponential decay in Black-Scholes

### 2. Underlying Price Changes (Delta)
- **When:** Uniswap V3 pool has swaps
- **Effect:** `collateralPrice` changes
- **Impact:** 
  - **Calls:** Price increases if collateral price ↑
  - **Puts:** Price increases if collateral price ↓

### 3. Volatility (Vega)
- **Current:** Fixed at 20% (0.2 * 1e18)
- **Note:** Not dynamic in current implementation

### 4. Risk-Free Rate (Rho)
- **Current:** Fixed at 5% (0.05 * 1e18)
- **Note:** Not dynamic in current implementation

---

## Data Flow Summary

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

---

## Key Contracts & Addresses

1. **OpHook Contract**
   - Deployed address from `deployedContracts.ts`
   - Manages option pools and price calculations

2. **OptionPrice Contract**
   - Deployed by OpHook constructor
   - Contains Black-Scholes implementation

3. **Uniswap V3 Price Pool**
   - Stored in `collateralPricePool[collateral]` mapping
   - Provides real-time collateral price via `slot0()`

4. **OptionToken Contracts**
   - One per option type
   - Stores: strike, expiration, isPut, collateral

---

## Important Notes

1. **No Slippage in Price Display**
   - Prices shown are theoretical (Black-Scholes)
   - Actual swap prices may differ slightly

2. **Fixed Volatility & Risk-Free Rate**
   - Volatility: 20% (hardcoded)
   - Risk-free rate: 5% (hardcoded)
   - These don't change, only time and underlying price change

3. **Real-Time Updates**
   - Prices update automatically on new blocks
   - No manual refresh needed
   - Updates happen ~every 12 seconds (Ethereum mainnet)

4. **Expired Options**
   - If `expiration <= block.timestamp`, `timeToExpiration = 0`
   - Black-Scholes returns intrinsic value only
   - For calls: `max(0, underlying - strike)`
   - For puts: `max(0, strike - underlying)`

5. **Gas Costs**
   - `getPrices()` is a view function (free to call)
   - Only costs gas if called from a transaction
   - UI calls are free (read-only)

---

## Example Price Update Timeline

```
Block 100: User buys option
  - Price: $50.00
  - Time to expiration: 30 days
  - Collateral price: $2000

Block 101 (12 seconds later):
  - Time to expiration: 29.99986 days (decreased by 12 seconds)
  - Collateral price: $2001 (if Uniswap pool had swaps)
  - New price: $50.15 (increased due to collateral, decreased due to time)

Block 200 (20 minutes later):
  - Time to expiration: 29.986 days
  - Collateral price: $2010
  - New price: $52.30

... continues until expiration
```

---

## Potential Improvements

1. **Add Manual Refresh Button**
   - Expose `refetch()` from `useGetOptions`
   - Allow users to manually update prices

2. **Add Polling Interval Configuration**
   - Currently relies on block-based refetch
   - Could add explicit polling interval

3. **Dynamic Volatility**
   - Calculate implied volatility from market
   - Update volatility based on recent price movements

4. **Price History/Charts**
   - Track price changes over time
   - Display price charts for options

5. **Price Alerts**
   - Notify users when option price reaches target

