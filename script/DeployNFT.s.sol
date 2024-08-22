// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {Script} from "lib/forge-std/src/Script.sol";
import {BuildNFT} from "../src/BuildNFT.sol";

contract DeployNFT is Script {
    function run() public returns (BuildNFT) {
        vm.startBroadcast();
        BuildNFT nft = new BuildNFT();
        vm.stopBroadcast();
        return nft;
    }
}
