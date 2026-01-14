// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.24;

bytes32 constant UNICHAIN_HASH = keccak256(bytes("unichain"));

struct OptionData{
    address pairAddress;
}
function referencePair(string memory chain) pure returns(address){
    if (keccak256(bytes(chain)) == UNICHAIN_HASH) return address(0x000003493cb99a8C1E4F103D2b6333E4d195DF7d);
}

function optionBuyer()