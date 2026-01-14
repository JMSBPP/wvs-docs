// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.24;

import {PanopticPool} from "@panoptic/PanopticPool.sol";
import "./ForkUtils.sol" as ForkUtilsMod;
import {Test,console2} from "forge-std/Test.sol";


contract OptionPlayground is Test{
    address optionBuyer;
    PanopticPool USDC_UTH_5PS;
    function setUp() public {
        try vm.envString("UNICHAIN_RPC_MAINNET") returns(string memory rpcUrl) {
            vm.createSelectFork(rpcUrl);
            vm.rollFork(21_243_907);
            USDC_UTH_5PS = PanopticPool(ForkUtilsMod.referencePair("unichain"));
        
        } catch {
            console2.log("No fork found");
        }


    }
}