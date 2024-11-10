// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {Script} from "lib/forge-std/src/Script.sol";
import {BuildNFT} from "../src/BuildNFT.sol";

/**
 * @title DeployNFT
 * @dev Script to deploy the BuildNFT contract
 */
contract DeployNFT is Script {
    /**
     * @dev Deploys the BuildNFT contract
     * @return The deployed BuildNFT contract
     */
    function run() public returns (BuildNFT) {
        vm.startBroadcast();
        BuildNFT nft = new BuildNFT();
        vm.stopBroadcast();
        return nft;
    }
}

/**
 * @title DeployMoodNft
 * @dev Script to deploy the MoodNft contract
 */
contract DeployMoodNft is Script {
    /**
     * @dev Deploys the MoodNft contract
     * @return The deployed MoodNft contract
     */
    function run() public returns (MoodNft) {
        // Implementation to deploy MoodNft
    }
}
