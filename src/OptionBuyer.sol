// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.0;


import {IERC20} from "forge-std/interfaces/IERC20.sol";
import {PoolKey} from "@uniswap/v4-core/src/types/PoolKey.sol";



type ReferenceAsset is address;
type Cash is address;

bytes32 constant STORAGE_SLOT = keccak256("option-buyer");

struct OptionBuyerStorage{
    ReplicationEngine replicationEngine;
}

function getStorage() pure returns(OptionBuyerStorage storage $){
    bytes32 position = STORAGE_SLOT;
    assembly("memory-safe"){
        $.slot := position
    }
}

struct ReplicationEngine{
    bytes exchange;
}

function replicationEngine() returns (ReplicationEngine memory){
    OptionBuyerStorage storage $ = getStorage();
    return $.replicationEngine;
}


function uniswapV4(ReplicationEngine memory replicationEngine) returns(PoolKey memory){
    return abi.decode(exchange(replicationEngine), (PoolKey));
}

function uniswapV3(ReplicationEngine memory replicationEngine) returns(address){
    return abi.decode(exchange(replicationEngine), (UniswapV3Pool));
}

function setUniswapV3(UniswapFactory poolFactoryV3) {
    
}

function exchange(ReplicationEngine memory replicationEngine) returns(bytes memory){
    return replicationEngine.exchange;
}

function cash(address _asset) pure returns(Cash){
    return cash(IERC20(_asset));        
}

function cash(IERC20 _asset) pure returns(Cash){
    return Cash.unwrap(_asset);    
}

function cash(Cash _asset) pure returns(IERC20){
    return IERC20(Cash.unwrap(_asset));
}

function referencedAsset(address asset) pure returns(ReferenceAsset){
    return referencedAsset(IERC20(asset));        
}

function referencedAsset(IERC20 asset) pure returns(ReferenceAsset){
    return ReferenceAsset.wrap(address(asset));
}

function referencedAsset(ReferenceAsset _referenceAsset) pure returns(IERC20){
    return IERC20(ReferenceAsset.unwrap(_referenceAsset));
}

// function uniswapV3(ReferenceAsset underlying, Cash collateral) returns(ReplicationEngine memory){
//     IUniswapV3Pool().getPool(referencedAsset(underlying), cash(collateral))
//     if (IUniswapV3Pool.getPool(referencedAsset(underlying), cash(collateral)) == address(0x00)){

//     }
// }


 
