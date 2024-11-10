// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import {BuildNFT} from "../src/BuildNFT.sol";
import {DeployNFT} from "../script/DeployNFT.s.sol";

/**
 * @title BuildNftTest
 * @dev Test suite for the BuildNFT contract
 */
contract BuildNftTest is Test {
    BuildNFT public nft;
    DeployNFT public deployer;
    address public USER = makeAddr("USER");
    string constant URI = "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";

    /**
     * @dev Sets up the test environment
     */
    function setUp() public {
        deployer = new DeployNFT();
        nft = deployer.run();
    }

    /**
     * @dev Tests that the name of the NFT is correct
     */
    function testNameIsCorrect() public view {
        string memory expectedName = "Doogie";
        string memory actualName = nft.name();
        assert(keccak256(abi.encodePacked(expectedName)) == keccak256(abi.encodePacked(actualName)));
    }

    /**
     * @dev Tests minting and balance of the NFT
     */
    function testCanMintAndHaveABalance() public {
        vm.prank(USER);
        nft.mintNFT(URI);

        assert(nft.balanceOf(USER) == 1);
        assert(keccak256(abi.encodePacked(nft.toKenURI(0))) == keccak256(abi.encodePacked(URI)));
    }
}