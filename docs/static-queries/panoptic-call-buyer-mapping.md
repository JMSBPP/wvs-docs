# Panoptic Call Buyer Strategy: Traditional Options Mapping

> **Analysis Date**: 2026-01-08
> **Protocol**: Panoptic v1-core
> **Scope**: Mapping traditional options variables to Panoptic contract implementation

---

## Traditional Framework

At a current price $P$:

- **"Call buyer"**: Long volatility (upwards) expecting $P + \sigma$
- Buy an option conferring the right to buy $X$ at $\psi_{\text{bid}} = P + \varepsilon < P + \sigma$
- The option is OTM (no intrinsic value), only time value $\int \phi^E$
- Expected profit from $\sigma - \varepsilon$ (realized volatility minus forecasted volatility)

**Profit function**:
$$\Pi_{\text{trader}}(P) = (\psi_{\text{bid}} - P) - \int \phi^E$$

---

## Complete Variable Mapping

| Traditional Notation | Meaning | Panoptic Variable | Contract Location |
|---------------------|---------|-------------------|-------------------|
| $P$ | Current price | `slot0.sqrtPriceX96` → tick | `IUniswapV3Pool.slot0()` |
| $\psi_{\text{bid}}$ | Strike price | `tickLower` of range | `TokenId.strike(leg)` |
| $\varepsilon$ | Distance to strike | `strike - currentTick` | Encoded in `TokenId` |
| $\int \phi^E$ | Time value / premium | `s_accountPremiumOwed` | `SFPM:1413-1482` |
| Intrinsic value | $\psi_{\text{bid}} - P$ when ITM | `intrinsicValue` | `CollateralTracker:1095-1120` |
| $\sigma$ | Realized volatility | Price movement (tick change) | Observed on-chain |

---

## Contract Architecture

### Core Contracts

| Contract | Role |
|----------|------|
| `PanopticPool` | Entry point for minting/burning options |
| `SemiFungiblePositionManager` (SFPM) | Manages LP positions, tracks liquidity & premium |
| `CollateralTracker` | Handles collateral, commission, ITM spread fees |
| `TokenId` | Encodes position parameters (strike, width, isLong, tokenType) |

### Key State Variables

| State Variable | Type | Purpose |
|----------------|------|---------|
| `s_accountLiquidity[key]` | `LeftRightUnsigned` | Right: net liquidity, Left: removed (borrowed) |
| `s_accountFeesBase[key]` | `LeftRightSigned` | Fee growth baseline at position creation |
| `s_accountPremiumOwed[key]` | `LeftRightUnsigned` | Accumulated premium OWED by longs = $\int \phi^E$ |
| `s_accountPremiumGross[key]` | `LeftRightUnsigned` | Total premium EARNED by shorts |
| `s_ITMSpreadFee` | `uint128` | Additional fee on ITM intrinsic value |

---

## The Long Call Flow

### Step 1: Position Encoding (TokenId)

OTM call at $\psi_{\text{bid}} = P + \varepsilon$ is encoded as:

```
TokenId structure:
├── poolId (64 bits)       // Which Uniswap pool
├── leg 0:
│   ├── isLong = 1         // CRITICAL: Makes it a "buy"
│   ├── tokenType = 1      // 1 = call (token1 numeraire)
│   ├── strike             // ψ_bid encoded as tick
│   └── width              // Range width in tick spacing units
```

### Step 2: Minting the Long Position

```
PanopticPool.mintOptions()
    └── _mintInSFPMAndUpdateCollateral()
        └── SFPM.mintTokenizedPosition()
            └── _createLegInAMM()
```

**Key logic in `_createLegInAMM` (SFPM:951-1073)**:

```solidity
// When isLong = 1: BUYING by REMOVING liquidity from Uniswap
if (isLong == 1) {
    // Must have existing short liquidity to borrow from
    if (startingLiquidity < chunkLiquidity) {
        revert Errors.NotEnoughLiquidity();
    }
    updatedLiquidity = startingLiquidity - chunkLiquidity;

    // Track removed liquidity (the "borrowed" option)
    removedLiquidity += chunkLiquidity;
}

// Execute: BURN liquidity from Uniswap
moved = _burnLiquidity(liquidityChunk, univ3pool);
```

### Step 3: Premium (Streamia) Accumulation

**Location**: `getAccountPremium` (SFPM:1413-1482)

```solidity
// Current fees accumulated in Uniswap since last touch
LeftRightSigned feesBase = FeesCalc.calculateAMMSwapFees(
    _univ3pool, atTick, _tickLower, _tickUpper, netLiquidity
);

// Fees accumulated since position was opened
amountToCollect = feesBase.subRect(s_accountFeesBase[positionKey]);

// For LONG positions (isLong == 1):
// premiumOwed = what you OWE to the LP who sold you this option
acctPremia = isLong == 1 ? premiumOwed : premiumGross;
```

**Mathematical representation**:
$$\text{streamia} = \int_{t_0}^{t} \text{feeGrowth}(\tau) \cdot L \, d\tau$$

Where $L$ is `removedLiquidity`.

### Step 4: Commission & ITM Spread

**Location**: `CollateralTracker._getExchangedAmount` (lines 1095-1120)

```solidity
// Intrinsic value = swap amount minus position delta
int256 intrinsicValue = int256(swappedAmount) - (shortAmount - longAmount);

// Commission = base fee + ITM spread fee
uint256 commission =
    // Base fee on notional
    (shortAmount + longAmount) * COMMISSION_FEE / DECIMALS
    +
    // ITM spread fee (time value component for ITM)
    (intrinsicValue == 0 || isCovered)
        ? 0
        : s_ITMSpreadFee * |intrinsicValue| / (DECIMALS * 100);
```

**ITM Spread Fee formula**:
```solidity
s_ITMSpreadFee = ITM_SPREAD_MULTIPLIER * poolFee / DECIMALS
// Typically 2x the pool fee on intrinsic value
```

---

## Profit Function Translation

### Traditional:
$$\Pi_{\text{trader}}(P) = (\psi_{\text{bid}} - P) - \int \phi^E$$

### Panoptic:
$$\Pi_{\text{panoptic}} = \underbrace{\text{intrinsicValue}}_{\text{at close}} - \underbrace{\text{accumulatedStreamia}}_{\texttt{s\_accountPremiumOwed}} - \underbrace{\text{commission}}_{\text{base + ITM spread}}$$

**In code**:
```solidity
profit = (positionValueAtClose - positionValueAtOpen)
       - (s_accountPremiumOwed[positionKey].rightSlot()  // token0 premium
        + s_accountPremiumOwed[positionKey].leftSlot())   // token1 premium
       - commission;
```

---

## Execution Flow Diagram

```
┌─────────────────────────────────────────────────────────────────┐
│                    LONG CALL TRADE FLOW                         │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  1. OPEN POSITION                                               │
│     ┌──────────────────────────────────────────────────────┐   │
│     │ mintOptions(tokenId, positionSize, ...)              │   │
│     │   where tokenId encodes:                             │   │
│     │     - isLong = 1                                     │   │
│     │     - tokenType = 1 (call)                          │   │
│     │     - strike = tick(ψ_bid)                          │   │
│     │     - width = range width                            │   │
│     └──────────────────────────────────────────────────────┘   │
│                           ↓                                    │
│     s_accountLiquidity[key].leftSlot += chunkLiquidity         │
│     (borrowed position recorded)                               │
│                                                                 │
│  2. WHILE POSITION OPEN                                         │
│     ┌──────────────────────────────────────────────────────┐   │
│     │ Streamia accumulates as fees accrue in Uniswap       │   │
│     │                                                       │   │
│     │ s_accountPremiumOwed grows proportional to:          │   │
│     │   - removedLiquidity (position size)                 │   │
│     │   - Trading activity in tick range                   │   │
│     │   - Time position is held                            │   │
│     └──────────────────────────────────────────────────────┘   │
│                                                                 │
│  3. CLOSE POSITION (when P reaches P + σ)                       │
│     ┌──────────────────────────────────────────────────────┐   │
│     │ burnOptions(tokenId, ...)                            │   │
│     │                                                       │   │
│     │ Settlement:                                          │   │
│     │   positionValue = current worth of range             │   │
│     │   premiumOwed = accumulated streamia                 │   │
│     │   profit = positionValue - premiumOwed - commission  │   │
│     └──────────────────────────────────────────────────────┘   │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

---

## Key Differences from Traditional Options

| Aspect | Traditional | Panoptic |
|--------|-------------|----------|
| **Premium payment** | Upfront ($\int \phi^E$ paid at open) | Continuous (streamia accrues) |
| **Premium basis** | Implied volatility | Actual trading fees in range |
| **Expiration** | Fixed date | None (perpetual) |
| **Strike** | Single price | Tick range [tickLower, tickUpper] |
| **Path dependency** | None (only final price matters) | Yes (fees depend on trading path) |
| **Counterparty** | Options seller | LP who deposited in that range |

---

## Core Insight

In Panoptic, you don't "buy" an option from a counterparty—you **borrow LP liquidity** from existing short positions. Your premium ($\int \phi^E$) is the **streamia** you owe to those LPs, calculated as the trading fees that would have accrued on the liquidity you removed.

This creates a direct link between:
- **Traditional time value** → **Uniswap trading activity in your range**
- **Implied volatility** → **Realized fee generation**

---

## Complete Protocol Lifecycle & Personas

This section describes the **end-to-end lifecycle** from Uniswap V3 pool creation to active options trading, identifying each persona and their role.

### Persona Overview

| Persona | Role | Motivation | Risk Profile |
|---------|------|------------|--------------|
| **Pool Creator** | Creates Uniswap V3 pool | Enable trading for token pair | One-time action |
| **Panoptic Deployer** | Deploys Panoptic wrapper | Earn deployer NFT, enable options | One-time action |
| **Passive LP (PLP)** | Deposits to CollateralTracker | Earn yield from commissions | Low risk, passive |
| **Option Seller** | Mints short positions (isLong=0) | Earn streamia (premium) | High risk, active |
| **Option Buyer** | Mints long positions (isLong=1) | Speculate on volatility | Limited risk, active |
| **Liquidator** | Liquidates undercollateralized positions | Earn liquidation bonus | MEV/bot operator |
| **Force Exerciser** | Force exercises OTM longs | Earn exercise bonus | MEV/bot operator |

---

### Phase 0: Uniswap V3 Pool Creation

**Persona**: Pool Creator (could be token team, DAO, or anyone)

```
┌─────────────────────────────────────────────────────────────────┐
│  PHASE 0: UNISWAP V3 POOL CREATION                              │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  Persona: Pool Creator                                          │
│  Contract: IUniswapV3Factory                                    │
│                                                                 │
│  Action:                                                        │
│    UniswapV3Factory.createPool(tokenA, tokenB, fee)            │
│    → Returns: pool address                                      │
│                                                                 │
│  Then initialize with starting price:                           │
│    IUniswapV3Pool(pool).initialize(sqrtPriceX96)               │
│                                                                 │
│  Fee tiers available:                                           │
│    - 0.01% (100)  - Stablecoin pairs                           │
│    - 0.05% (500)  - Stable/major pairs                         │
│    - 0.30% (3000) - Most pairs (default)                       │
│    - 1.00% (10000)- Exotic/volatile pairs                      │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

**Why this matters**: Panoptic CANNOT create options on a token pair unless a Uniswap V3 pool already exists. The Uniswap pool provides:
- Price oracle (TWAP)
- Liquidity venue for option settlement
- Fee structure that determines streamia rates

---

### Phase 1: Panoptic Pool Deployment

**Persona**: Panoptic Deployer (anyone can do this)

```
┌─────────────────────────────────────────────────────────────────┐
│  PHASE 1: PANOPTIC POOL DEPLOYMENT                              │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  Persona: Panoptic Deployer                                     │
│  Contract: PanopticFactory                                      │
│  Incentive: Receives deployer NFT (vanity address mining)       │
│                                                                 │
│  Action:                                                        │
│    PanopticFactory.deployNewPool(token0, token1, fee, salt)    │
│                                                                 │
│  Creates:                                                       │
│    ┌─────────────────────────────────────────────────────┐     │
│    │  PanopticPool (clone)                               │     │
│    │    └── Links to underlying Uniswap V3 pool          │     │
│    │                                                      │     │
│    │  CollateralTracker0 (for token0, e.g., ETH)         │     │
│    │    └── Accepts token0 deposits                       │     │
│    │                                                      │     │
│    │  CollateralTracker1 (for token1, e.g., USDC)        │     │
│    │    └── Accepts token1 deposits                       │     │
│    └─────────────────────────────────────────────────────┘     │
│                                                                 │
│  Post-deployment state:                                         │
│    - Pool exists but has NO liquidity                          │
│    - No options can be traded yet                              │
│    - Observation cardinality increased for TWAP                │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

**Code**: `PanopticFactory.deployNewPool` (lines 114-171)

```solidity
// Verify Uniswap pool exists
IUniswapV3Pool v3Pool = IUniswapV3Pool(UNIV3_FACTORY.getPool(token0, token1, fee));
if (address(v3Pool) == address(0)) revert Errors.UniswapPoolNotInitialized();

// Deploy Panoptic infrastructure
newPoolContract = PanopticPool(POOL_REFERENCE.cloneDeterministic(salt32));
collateralTracker0.startToken(true, token0, token1, fee, newPoolContract);
collateralTracker1.startToken(false, token0, token1, fee, newPoolContract);
newPoolContract.startPool(v3Pool, token0, token1, collateralTracker0, collateralTracker1);

// Mint deployer NFT
_mint(msg.sender, uint256(uint160(address(newPoolContract))));
```

---

### Phase 2: Passive Liquidity Provider (PLP) Deposits

**Persona**: Passive Liquidity Provider (yield seekers, protocols, treasuries)

```
┌─────────────────────────────────────────────────────────────────┐
│  PHASE 2: PLP COLLATERAL DEPOSITS                               │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  Persona: Passive Liquidity Provider (PLP)                      │
│  Contract: CollateralTracker                                    │
│  Incentive: Earn yield from commission fees + spread            │
│                                                                 │
│  Action:                                                        │
│    // Approve tokens first                                      │
│    IERC20(token).approve(collateralTracker, amount);           │
│                                                                 │
│    // Deposit and receive shares                                │
│    CollateralTracker.deposit(assets, receiver);                │
│    → Returns: shares (ERC20 receipt token)                      │
│                                                                 │
│  What PLPs provide:                                             │
│    - Capital pool that backs all option positions              │
│    - Liquidity buffer for settlement                           │
│                                                                 │
│  What PLPs earn:                                                │
│    - Share of COMMISSION_FEE on all trades                     │
│    - Spread on streamia (when utilization is high)             │
│    - Share appreciation as fees accumulate                     │
│                                                                 │
│  Risk:                                                          │
│    - If many positions go bad simultaneously, PLPs may lose    │
│    - Socialized losses in extreme scenarios                    │
│                                                                 │
│  Post-deposit state:                                            │
│    - s_poolAssets increased                                    │
│    - Shares minted to depositor                                │
│    - Still NO options tradeable (need sellers)                 │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

**Code**: `CollateralTracker.deposit` (lines 396-417)

```solidity
function deposit(uint256 assets, address receiver) external returns (uint256 shares) {
    shares = previewDeposit(assets);

    // Transfer tokens from user to PanopticPool
    SafeTransferLib.safeTransferFrom(s_underlyingToken, msg.sender, address(s_panopticPool), assets);

    // Mint collateral shares
    _mint(receiver, shares);

    // Update tracked assets
    s_poolAssets += uint128(assets);
}
```

**PLP Economics**:
```
Share Value = totalAssets() / totalSupply
            = (s_poolAssets + s_inAMM + accumulatedFees) / totalSupply

As fees accumulate → share value increases → PLP profit
```

---

### Phase 3: Option Seller (Market Maker) Opens Short Positions

**Persona**: Option Seller / Market Maker (sophisticated traders, yield farmers)

```
┌─────────────────────────────────────────────────────────────────┐
│  PHASE 3: OPTION SELLER MINTS SHORT POSITIONS                   │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  Persona: Option Seller (Market Maker)                          │
│  Contract: PanopticPool → SFPM                                  │
│  Incentive: Earn streamia (continuous premium) from buyers      │
│                                                                 │
│  Prerequisites:                                                 │
│    1. Has collateral deposited in CollateralTracker            │
│    2. Understands the tick range they're selling               │
│                                                                 │
│  Action:                                                        │
│    // Construct TokenId with isLong = 0                         │
│    TokenId tokenId = TokenId.wrap(0)                           │
│        .addPoolId(poolId)                                      │
│        .addLeg(0, 1, 0, 0, tokenType, strike, width);         │
│        //       │  │  │  │     │        │      └── range width │
│        //       │  │  │  │     │        └── strike tick        │
│        //       │  │  │  │     └── 0=put, 1=call               │
│        //       │  │  │  └── riskPartner                       │
│        //       │  │  └── isLong = 0 (SHORT/SELL)              │
│        //       │  └── optionRatio                             │
│        //       └── legIndex                                   │
│                                                                 │
│    PanopticPool.mintOptions([tokenId], positionSize, ...);     │
│                                                                 │
│  What happens:                                                  │
│    1. Collateral requirement checked                           │
│    2. Liquidity ADDED to Uniswap V3 pool                       │
│    3. s_accountLiquidity[key].rightSlot += liquidity           │
│    4. Position tracked in SFPM                                 │
│                                                                 │
│  Seller's P&L:                                                  │
│    Profit = streamia earned - losses from price movement       │
│           = Σ(fees from buyers) - max(0, intrinsic value)      │
│                                                                 │
│  Risk:                                                          │
│    - Unlimited loss potential (like traditional short options) │
│    - Must maintain collateral above maintenance margin         │
│    - Can be liquidated if undercollateralized                  │
│                                                                 │
│  Post-mint state:                                               │
│    - Liquidity deployed in Uniswap at [tickLower, tickUpper]   │
│    - BUYERS CAN NOW TRADE THIS RANGE                           │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

**Code flow**:
```
PanopticPool.mintOptions()
  └── _mintInSFPMAndUpdateCollateral()
      └── SFPM.mintTokenizedPosition()
          └── _createLegInAMM()
              └── _mintLiquidity()  // Adds to Uniswap
```

**In `_createLegInAMM` for sellers (isLong=0)**:
```solidity
if (isLong == 0) {
    // SELLING: Add liquidity TO Uniswap
    updatedLiquidity = startingLiquidity + chunkLiquidity;

    // If burning a short, removed liquidity decreases
    if (isBurn) {
        removedLiquidity -= chunkLiquidity;
    }
}

// Execute: MINT liquidity into Uniswap
moved = _mintLiquidity(liquidityChunk, univ3pool);
```

---

### Phase 4: Option Buyer Opens Long Positions

**Persona**: Option Buyer (traders, speculators, hedgers)

```
┌─────────────────────────────────────────────────────────────────┐
│  PHASE 4: OPTION BUYER MINTS LONG POSITIONS                     │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  Persona: Option Buyer (Trader)                                 │
│  Contract: PanopticPool → SFPM                                  │
│  Incentive: Profit from price movement exceeding premium paid   │
│                                                                 │
│  Prerequisites:                                                 │
│    1. Has collateral deposited in CollateralTracker            │
│    2. Sellers exist in desired tick range (Phase 3 complete)   │
│                                                                 │
│  Action:                                                        │
│    // Construct TokenId with isLong = 1                         │
│    TokenId tokenId = TokenId.wrap(0)                           │
│        .addPoolId(poolId)                                      │
│        .addLeg(0, 1, 1, 0, tokenType, strike, width);         │
│        //          └── isLong = 1 (LONG/BUY)                   │
│                                                                 │
│    PanopticPool.mintOptions([tokenId], positionSize, ...);     │
│                                                                 │
│  What happens:                                                  │
│    1. Check: startingLiquidity >= chunkLiquidity (sellers exist)│
│    2. Liquidity REMOVED from Uniswap V3 pool                   │
│    3. s_accountLiquidity[key].leftSlot += liquidity (borrowed) │
│    4. Buyer now OWES streamia to seller                        │
│                                                                 │
│  Buyer's P&L (your original formula):                          │
│    Π = (ψ_bid - P) - ∫φ^E                                      │
│      = intrinsic_value - accumulated_streamia - commission     │
│                                                                 │
│  Risk:                                                          │
│    - Limited to collateral posted + accumulated streamia       │
│    - Can be force-exercised if position goes deep OTM          │
│                                                                 │
│  Post-mint state:                                               │
│    - Buyer has borrowed liquidity from seller                  │
│    - Streamia accumulates continuously                         │
│    - Position can be closed anytime via burnOptions()          │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

**In `_createLegInAMM` for buyers (isLong=1)**:
```solidity
if (isLong == 1) {
    // BUYING: Remove liquidity FROM Uniswap (borrow from sellers)
    if (startingLiquidity < chunkLiquidity) {
        revert Errors.NotEnoughLiquidity();  // No sellers!
    }
    updatedLiquidity = startingLiquidity - chunkLiquidity;

    // Track borrowed amount
    if (!isBurn) {
        removedLiquidity += chunkLiquidity;
    }
}

// Execute: BURN liquidity from Uniswap
moved = _burnLiquidity(liquidityChunk, univ3pool);
```

---

### Phase 5: Position Lifecycle (Monitoring & Settlement)

```
┌─────────────────────────────────────────────────────────────────┐
│  PHASE 5: POSITION LIFECYCLE                                    │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  WHILE POSITIONS ARE OPEN:                                      │
│                                                                 │
│  ┌─────────────────────────────────────────────────────────┐   │
│  │  Streamia Accumulation (continuous)                      │   │
│  │                                                          │   │
│  │  For each block where price is IN RANGE:                │   │
│  │    fees_generated = swap_volume * pool_fee_rate         │   │
│  │    streamia_delta = fees * (removed_liq / total_liq)    │   │
│  │                                                          │   │
│  │  Buyer: s_accountPremiumOwed increases                  │   │
│  │  Seller: s_accountPremiumGross increases                │   │
│  └─────────────────────────────────────────────────────────┘   │
│                            │                                    │
│                            ▼                                    │
│  ┌─────────────────────────────────────────────────────────┐   │
│  │  Collateral Monitoring                                   │   │
│  │                                                          │   │
│  │  required = _getTotalRequiredCollateral(tick, positions)│   │
│  │  available = convertToAssets(balanceOf[user])           │   │
│  │                                                          │   │
│  │  If available < required:                               │   │
│  │    → Position becomes LIQUIDATABLE                      │   │
│  └─────────────────────────────────────────────────────────┘   │
│                            │                                    │
│                            ▼                                    │
│  ┌─────────────────────────────────────────────────────────┐   │
│  │  Exit Paths                                              │   │
│  │                                                          │   │
│  │  A. Voluntary Close (burnOptions)                       │   │
│  │     → Settle streamia, return collateral                │   │
│  │                                                          │   │
│  │  B. Liquidation (if undercollateralized)                │   │
│  │     → Liquidator closes position, earns bonus           │   │
│  │                                                          │   │
│  │  C. Force Exercise (if long is deep OTM)                │   │
│  │     → Exerciser forces close, earns bonus               │   │
│  └─────────────────────────────────────────────────────────┘   │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

---

### Phase 6: Liquidation

**Persona**: Liquidator (MEV bots, keepers)

```
┌─────────────────────────────────────────────────────────────────┐
│  PHASE 6: LIQUIDATION                                           │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  Persona: Liquidator                                            │
│  Contract: PanopticPool.liquidate()                            │
│  Incentive: Earn liquidation bonus from undercollateralized    │
│             position's remaining collateral                     │
│                                                                 │
│  Trigger condition:                                             │
│    collateral_value < required_collateral                      │
│    (account is insolvent at current tick)                      │
│                                                                 │
│  Action:                                                        │
│    PanopticPool.liquidate(                                     │
│        liquidatorPositions,  // Liquidator's own positions     │
│        positionIdListLiquidatee,  // Victim's positions        │
│        liquidatee  // Address being liquidated                 │
│    );                                                          │
│                                                                 │
│  What happens:                                                  │
│    1. Verify liquidatee is actually undercollateralized        │
│    2. Close all liquidatee's positions                         │
│    3. Calculate liquidation bonus                              │
│    4. Transfer bonus from liquidatee to liquidator             │
│    5. Haircut premium if needed (socialize losses to PLPs)     │
│                                                                 │
│  Liquidation bonus formula:                                     │
│    bonus = f(collateral_shortfall, position_size)              │
│    Capped to prevent excessive extraction                      │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

**Code**: `PanopticPool.liquidate` (lines 925-1063)

---

### Phase 7: Force Exercise

**Persona**: Force Exerciser (MEV bots, keepers)

```
┌─────────────────────────────────────────────────────────────────┐
│  PHASE 7: FORCE EXERCISE                                        │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  Persona: Force Exerciser                                       │
│  Contract: PanopticPool.forceExercise()                        │
│  Incentive: Earn exercise cost from OTM long holder            │
│                                                                 │
│  Why force exercise exists:                                     │
│    - Long positions that are deep OTM don't generate streamia  │
│    - Sellers' liquidity is "stuck" not earning fees            │
│    - Force exercise frees up this liquidity                    │
│                                                                 │
│  Trigger condition:                                             │
│    - Position is LONG (isLong = 1)                             │
│    - Position is OUT OF RANGE (not generating premium)         │
│    - Sufficient distance from current price                    │
│                                                                 │
│  Action:                                                        │
│    PanopticPool.forceExercise(                                 │
│        account,        // Owner of long position               │
│        touchedId,      // The OTM long position                │
│        positionIdList, // Account's other positions            │
│        positionIdListExercisor  // Exercisor's positions       │
│    );                                                          │
│                                                                 │
│  What happens:                                                  │
│    1. Verify position is exercisable (OTM, out of range)       │
│    2. Close the long position                                  │
│    3. Transfer exercise cost from long holder to exercisor     │
│    4. Liquidity returns to Uniswap (sellers can earn again)    │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

**Code**: `PanopticPool.forceExercise` (lines 1070-1141)

---

### Complete Lifecycle Diagram

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                     COMPLETE PANOPTIC LIFECYCLE                              │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  PHASE 0                    PHASE 1                    PHASE 2               │
│  ┌──────────┐              ┌──────────┐              ┌──────────┐           │
│  │ Uniswap  │              │ Panoptic │              │   PLP    │           │
│  │  Pool    │─────────────▶│  Pool    │─────────────▶│ Deposit  │           │
│  │ Creator  │              │ Deployer │              │          │           │
│  └──────────┘              └──────────┘              └──────────┘           │
│       │                         │                         │                  │
│       ▼                         ▼                         ▼                  │
│  createPool()              deployNewPool()           deposit()               │
│  initialize()              → PanopticPool            → shares                │
│                            → CollateralTrackers      → s_poolAssets          │
│                                                                              │
│                                                                              │
│  PHASE 3                    PHASE 4                    PHASE 5               │
│  ┌──────────┐              ┌──────────┐              ┌──────────┐           │
│  │  Option  │              │  Option  │              │ Position │           │
│  │  Seller  │─────────────▶│  Buyer   │─────────────▶│Lifecycle │           │
│  │(isLong=0)│              │(isLong=1)│              │          │           │
│  └──────────┘              └──────────┘              └──────────┘           │
│       │                         │                         │                  │
│       ▼                         ▼                         ▼                  │
│  mintOptions()             mintOptions()             • Streamia accrues      │
│  → Add liquidity           → Borrow liquidity        • Collateral monitored  │
│  → Earn streamia           → Pay streamia            • Price moves           │
│                                                                              │
│                                                                              │
│  PHASE 6                    PHASE 7                    EXIT                  │
│  ┌──────────┐              ┌──────────┐              ┌──────────┐           │
│  │Liquidator│              │  Force   │              │ Voluntary│           │
│  │          │              │Exerciser │              │  Close   │           │
│  │          │              │          │              │          │           │
│  └──────────┘              └──────────┘              └──────────┘           │
│       │                         │                         │                  │
│       ▼                         ▼                         ▼                  │
│  liquidate()               forceExercise()           burnOptions()           │
│  → If undercollat.         → If OTM long             → Settle streamia       │
│  → Earn bonus              → Earn bonus              → Return collateral     │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

### Persona Incentive Summary

| Persona | Earns | Pays | Risk |
|---------|-------|------|------|
| **Pool Creator** | - | Gas for deployment | None |
| **Panoptic Deployer** | NFT (vanity address) | Gas for deployment | None |
| **PLP** | Commission share, spread | Opportunity cost | Socialized losses |
| **Option Seller** | Streamia from buyers | Losses if price moves against | Unlimited (like short options) |
| **Option Buyer** | Profit if price moves favorably | Streamia + commission | Limited to collateral |
| **Liquidator** | Liquidation bonus | Gas | Failed liquidation gas |
| **Force Exerciser** | Exercise cost | Gas | Failed exercise gas |

---

### The Bootstrapping Problem

| Phase | Blocker | Solution |
|-------|---------|----------|
| 0→1 | No Uniswap pool | Create one (or wait for someone else) |
| 1→2 | No Panoptic pool | Deploy one (anyone can) |
| 2→3 | No collateral | PLPs must deposit first |
| 3→4 | **No sellers** | **Market makers must sell first** |
| 4→∞ | No liquidity in your range | Wait or use different strike |

**Key insight**: The critical bottleneck is **Phase 3→4**. Option buyers cannot trade until option sellers have deposited liquidity in their desired tick ranges. This is why market makers are essential to bootstrap a Panoptic market.

---

## Collateral System

### Why Collateral is Required

```
WITHOUT COLLATERAL (DANGEROUS):
  Seller writes a put at strike $2000
  Price drops: $2000 → $1000
  Seller OWES buyer $1000 per unit
  But seller has $0 in the system
  → Buyer cannot be paid = PROTOCOL INSOLVENCY

Collateral ensures sellers can always pay their obligations.
```

### What Collateral is Allowed

Each Panoptic pool has **TWO CollateralTrackers**—one for each token in the pair:

| CollateralTracker | Accepts | Example (ETH/USDC pool) |
|-------------------|---------|------------------------|
| `CollateralTracker0` | token0 | ETH |
| `CollateralTracker1` | token1 | USDC |

**From `startToken()` (CollateralTracker:206-245)**:
```solidity
// store the address of the underlying ERC20 token
s_underlyingToken = underlyingIsToken0 ? token0 : token1;
```

### Why Only Pool Tokens as Collateral?

| Reason | Explanation |
|--------|-------------|
| **Natural Hedge** | Sell ETH put → collateralize with ETH (no currency mismatch) |
| **No Oracle Dependency** | Value determined by Uniswap pool itself, not external oracle |
| **Atomic Liquidation** | Collateral IS settlement token; no swaps needed during liquidation |

### Collateral Ratios

```solidity
SELLER_COLLATERAL_RATIO = _sellerCollateralRatio;  // e.g., 20% (2000 bps)
BUYER_COLLATERAL_RATIO = _buyerCollateralRatio;    // e.g., 10% (1000 bps)
```

| Role | Typical Ratio | Example |
|------|---------------|---------|
| **Seller** | ~20% of notional | Sell $10,000 notional → need $2,000 collateral |
| **Buyer** | ~10% of notional | Buy $10,000 notional → need $1,000 collateral |

### Dynamic Collateral Adjustment

**Location**: `CollateralTracker` (lines 840-858)

```solidity
// When pool is heavily utilized, buyer collateral requirements DROP
// (incentivizes buying to balance the pool)
if (utilization < TARGET_POOL_UTIL) {
    return BUYER_COLLATERAL_RATIO;
} else if (utilization > SATURATED_POOL_UTIL) {
    return BUYER_COLLATERAL_RATIO / 2;  // 50% reduction!
} else {
    // Linear interpolation between target and saturated
}
```

### Collateral Lifecycle

```
┌─────────────────────────────────────────────────────────────────┐
│                    COLLATERAL LIFECYCLE                         │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  1. DEPOSIT COLLATERAL                                          │
│     CollateralTracker.deposit(assets, receiver)                 │
│     → User deposits ETH or USDC (depending on tracker)          │
│     → User receives collateral shares (ERC20)                   │
│     → Assets held by PanopticPool                               │
│                                                                 │
│  2. OPEN POSITION (collateral locked)                           │
│     PanopticPool.mintOptions(...)                               │
│     → System checks: collateral_balance >= required_collateral  │
│     → Required = f(position_size, strike, utilization)          │
│                                                                 │
│  3. POSITION MONITORING                                         │
│     As price moves, collateral requirement changes              │
│     If collateral < required → Position can be LIQUIDATED       │
│                                                                 │
│  4. CLOSE OR LIQUIDATE                                          │
│     Normal close: burnOptions() → collateral released           │
│     Liquidation: liquidator seizes collateral                   │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

### Key State Variables (CollateralTracker)

| Variable | Type | Purpose |
|----------|------|---------|
| `s_underlyingToken` | `address` | The ERC20 token accepted as collateral |
| `s_poolAssets` | `uint128` | Total assets in the pool |
| `s_inAMM` | `uint128` | Assets currently deployed in Uniswap |
| `s_ITMSpreadFee` | `uint128` | Fee charged on ITM intrinsic value |
| `SELLER_COLLATERAL_RATIO` | `uint256` | Collateral ratio for sellers |
| `BUYER_COLLATERAL_RATIO` | `uint256` | Collateral ratio for buyers |

---

## Practical Checklist for Call Buyer

Before executing a long call at strike $\psi_{\text{bid}}$:

| Check | How | What If Missing |
|-------|-----|-----------------|
| 1. Panoptic pool exists | `PanopticFactory.getPanopticPool(v3Pool)` | Call `deployNewPool()` or wait |
| 2. You have collateral deposited | `CollateralTracker.balanceOf(you)` | Call `deposit()` first |
| 3. Sellers exist in your range | `SFPM.getAccountLiquidity(...)` | Wait for market makers or use different strike |
| 4. Sufficient liquidity | Check `rightSlot > your_position_size` | Reduce size or wait |

---

## Code References

| Function | File | Lines | Purpose |
|----------|------|-------|---------|
| `_createLegInAMM` | SFPM.sol | 951-1073 | Creates long/short leg in AMM |
| `getAccountPremium` | SFPM.sol | 1413-1482 | Calculates accumulated premium |
| `_getExchangedAmount` | CollateralTracker.sol | 1095-1120 | Commission + ITM spread calc |
| `takeCommissionAddData` | CollateralTracker.sol | 995-1038 | Processes commission on mint |
| `mintOptions` | PanopticPool.sol | 478-492 | Entry point for minting |
| `burnOptions` | PanopticPool.sol | 499-536 | Entry point for burning |
| `deployNewPool` | PanopticFactory.sol | 114-171 | Creates new Panoptic pool |
| `deposit` | CollateralTracker.sol | 396-417 | Deposit collateral |
| `startToken` | CollateralTracker.sol | 206-245 | Initialize CollateralTracker |
| `_getTotalRequiredCollateral` | CollateralTracker.sol | 1161-1192 | Calculate margin requirements |
