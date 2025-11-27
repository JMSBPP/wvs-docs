```solidity
//===============PRICES====================

// uint160 sqrtPriceX96 (value) , uint48 timeStamp, 
// uint8 source
// enum source{
// POOL
// EXTERNAL
//} 

struct OptionPrice{
    price underlyingPrice;
    realizedVolatility;
    uint160 sqrtStrike
    timeStamp expiration;
    percentage riskFreeRate;
}

type price is uint216;


type sqrtPriceX96 is uint256;








type percentage is uint24;
struct Reserves{
    uint256 amount0;
    uint256 amount1;
}
struct PositionAmounts{
    PositionInfo;
    sqrtPriceX96;
    Reserves;
}
// 128 position value  + 1 byte for type = uint136
type position is uint136;
// AT the same price
// | (position1 - position2)/position1|

type opportunityCost is percentage;
// different positions AND different prices
function calculateOpportunityCost(position p1,position p2) returns(opportunityCost){
    require(p1.sqrtPriceX96 != p2.sqrtPriceX96);
    require(p1.type != p2.type);
}

type LP is position; // position.type == liquidity
type hodl is position; // position.type == hodl

function calculatLP(PositionInfo, sqrtPriceX96, Reserves) returns(LP);

function calculateHodl(PositionInfo, sqrtPriceX96, Reserves) returns(hodl);

type impermanentLoss is opportunityCost;

function calculateImpermanentLoss(liquidity p1,hodl p2) returns(impermanentLoss){
    require(p1.sqrtPriceX96 != p2.sqrtPriceX96);
    require(p1.type != p2.type);

    require(p1.type == lp && p2.type == hold);


    // NOTE: The position is liquidity and the other is hodl

}

// V_T = V_0 f(P_T/P0)
type priceReturn is percentage;
// requires same position BUT different prices

// ∆LP = V'(P) = ∂V(P)/∂P
// Price sensitivity: rate of change of position value with respect to price
type delta is int256;  // or could be a signed percentage type
// requires same position at a specific price
// Measures how much position value changes per unit price change
// Can be positive or negative

// ΓLP = V''(P) = ∂²V(P)/∂P²  
// Convexity: rate of change of delta with respect to price
type gamma is int256;  // or could be a signed percentage type
// requires same position at a specific price
// Measures how much delta changes per unit price change
// Typically negative for LP positions (concave payoff)




// 1 byte for unit, 2 bytes for precision
// 3 bytes -> 24 
type lpShare is uint24;
function calculateLpShare(
    liquidity aggregatedRangeLiquidity,
    liquidity lpLiquidity
) returns(lpShare);


type swap is BalanceDelta;

//========TIME===========

type timeStamp is uint48;

/// time related types 


//=====MEASURES========


// uint48 x1, uint48 x2, 
// uint160 int_{x1}^{x2} f(x) dx

type measure is uint256;


// uint48 t_0, uint48 t_1, 
// uint160 int_{t_0}^{t_1} swap_{t} dt

type volume is measure;


// uint48 t_0, uint48 t_1, 
// uint160 int_{t_0}^{t_1} f(position.price) dt

type volatility is measure;

// uint48 t_0, uint48 t_1, 
// uint160 int_{t_0}^{t_1} priceReturn_t dt

type realizedVolatility is volatility;

// uint48 t_0, uint48 t_1, 
// uint160 int_{t_0}^{t_1} opportunityCost_t dt

type differentialVolatility is volatility;

//Double integral over a collection of option prices AND the time

type impliedVolatility is measure;

```