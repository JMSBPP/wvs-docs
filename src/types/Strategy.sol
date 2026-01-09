// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.0;


struct Strategy{
    PathTrackerMod.Checkpoints.Trace226[2] path;

}

function payoff(Strategy memory) pure returns(uint256){}

function PnL(Strategy memory benchmark,Strategy memory self) pure returns(int256){
    return int256(int256(payoff(benchmark)) - int256(payoff(self)));
}