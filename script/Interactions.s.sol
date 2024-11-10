// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {Script} from "lib/forge-std/src/Script.sol";
import {BuildNFT} from "../src/BuildNFT.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";
import {MoodNft} from "../src/MoodNFt.sol";

/**
 * @title MintBuildNft
 * @dev Script to mint BuildNFT tokens
 */
contract MintBuildNft is Script {
    string constant URI = "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";

    /**
     * @dev Runs the minting process
     */
    function run() public {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment("BuildNFT", block.chainid);
        mintNftOnContract(mostRecentlyDeployed);
    }

    /**
     * @dev Mints an NFT on the specified contract
     * @param nftAddress The address of the NFT contract
     */
    function mintNftOnContract(address nftAddress) public {
        vm.startBroadcast();
        BuildNFT(nftAddress).mintNFT(URI);
        vm.stopBroadcast();
    }
}

/**
 * @title MintMoodNft
 * @dev Script to mint MoodNFT tokens
 */
contract MintMoodNft is Script {
    string public sadSvgUri = "data:image/svg+xml;base64,..."; // SVG data for sad mood
    string public happySvgUri = "data:image/svg+xml;base64,..."; // SVG data for happy mood

    /**
     * @dev Runs the minting process
     */
    function run() public {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment("MoodNft", block.chainid);
        mintNftOnContract(mostRecentlyDeployed);
    }

    /**
     * @dev Mints an NFT on the specified contract
     * @param nftAddress The address of the NFT contract
     */
    function mintNftOnContract(address nftAddress) public {
        vm.startBroadcast();
        MoodNft(nftAddress).mintNFT();
        vm.stopBroadcast();
    }
}
