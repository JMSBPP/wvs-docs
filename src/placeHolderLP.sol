// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.0;

// NOTE: Hypothesis

import "@uniswap/v4-utils/src/libraries/SqrtPriceLibrary.sol" as placeHolderMod;
import "@uniswap/v4-core/libraries/StateLibrary.sol" as StateViewMod;
import "@openzeppelin/utils/structs/Checkpoints.sol" as PathTrackerMod;

// assume token1 is margin

struct Inventory{
    uint256 notional;
    uint256 marginal;
}

function notional(Inventory memory) returns(uint256);
function margin(Inventory memory) returns(uint256);


struct Storage{
    PathTrackerMod.Checkpoints.Trace226[2] path;
    address pm;
    uint256 positionId;
    address oracle;
}


function startingTime() returns(uint256){}

function strategyPath() returns(PathTrackerMod.Checkpoints.Trace226[2] memory){}

fucntion initialReserves() returns(Inventory memory){
    PathTrackerMod.Checkpoints.lowerLookup(strategyPath(), startingTime());
}


function initialMargin() returns(uint256){}
function inititalNominal() returns(uint256){}


function position() returns(uint256){}

function positionManager() returns(PositionManager){}

function oracle() returns (IPriceOracle){}

function price() returns(uint256);

function il() returns(int256){
    (uint160 sqrtPriceX96,,,) = StateViewMod.StateLibrary.getSlot0(
        positionManager().poolManager(),
        positionManager().getPool(position())
    );

    uint160 sqrtPrice = placeHolderMod.SqrtPriceLibrary.divX96(sqrtPriceX96,uint160(1e18));
    int256 valueLP = LiquidityAmounts.getAmount1ForLiquidity() + int256(sqrtprice*LiquidityAmounts.getAmount0ForLiquidity());
    
    int256 valueBenchmark = int256(initialMargin()) + int256(initialNominal()*price());
    return int256(valueBenchmark - valueLP);





}