// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.0;

// import {IERC20} from "forge-std/interfaces/IERC20.sol";

interface IERC20{}

interface IPriceOracle {
    function asset() external;   
}


type time is uint48;

type asset is address;

function price(asset) returns(uint256){}
function unitOfAccount(asset) returns(address){}
function getAsset(asset) returns(IERC20){}


function budget(time, asset, asset) returns(uint256){}

type portafolio is address;


interface IERC7540{}

function getPortafolio(portafolio) returns(IERC7540){}
function value(portafolio) returns(uint256){}


function opportunityCost(portafolio, portafolio) returns(uint256){}



interface IERC4626{}

type derivative is address;

function admissible(derivative,portafolio) returns(bool){}

function getDerivative(derivative) returns (IERC4626){}
function notional(derivative) returns(asset){}
function collateral(derivative) returns(asset){}


// 
function payoff(derivative) returns(address){}

function premia(derivative) returns(uint24){}

function probability(time) returns(bool){}

// NOTE It involves the oracle, and it's asset functionalities

contract BinaryCallSeller{
    
    function initialize(portafolio _portafolio) external {
        require(value(_portafolio) > 0);
    }

    function buy(uint256 units) external{
        bool assetOne = probability(time.wrap(uint48(block.timestamp)));
        if (assetOne) {
            transfer(msg.sender,address(this), one(unitOfAccount));
            transfer(address(this),msg.sender, mul(units, price(asset)));
        } else {
            
        }

    }

}



