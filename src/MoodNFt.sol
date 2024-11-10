// SPDX-License-Identifier: MIT

pragma solidity ^0.8.16;

import {ERC721} from "lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
import {Base64} from "lib/openzeppelin-contracts/contracts/utils/Base64.sol";

/**
 * @title MoodNft
 * @dev ERC721 token representing a Mood NFT
 */
contract MoodNft is ERC721 {
    // Errors
    error MoodNft__CantFlipMoodIfNotOwner();

    // State variables
    uint256 private s_tokenCounter; // Counter for token IDs
    string private s_sadSvgImgUri; // URI for sad mood SVG
    string private s_happySvgImgUri; // URI for happy mood SVG

    enum Mood { SAD, HAPPY } // Mood states

    mapping(uint256 => Mood) private s_tokenIdToMood; // Mapping from token ID to mood

    /**
     * @dev Constructor that sets the SVG URIs and initializes the token counter
     * @param sadSvgImgUri The URI for the sad mood SVG
     * @param happySvgImgUri The URI for the happy mood SVG
     */
    constructor(string memory sadSvgImgUri, string memory happySvgImgUri) ERC721("MoodNft", "MN") {
        s_tokenCounter = 0;
        s_sadSvgImgUri = sadSvgImgUri;
        s_happySvgImgUri = happySvgImgUri;
    }

    /**
     * @dev Mints a new Mood NFT
     */
    function mintNFT() public {
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenIdToMood[s_tokenCounter] = Mood.HAPPY; // Default mood is HAPPY
        s_tokenCounter++;
    }

    /**
     * @dev Flips the mood of the NFT
     * @param tokenId The ID of the token to flip mood
     */
    function flipMood(uint256 tokenId) public {
        // Only want NFT owner to be able to flip the mood
        if (!_isAapprovedOrOwner(msg.sender, tokenId)) {
            revert MoodNft__CantFlipMoodIfNotOwner();
        }
        if (s_tokenIdToMood[tokenId] == Mood.HAPPY) {
            s_tokenIdToMood[tokenId] = Mood.SAD;
        } else {
            s_tokenIdToMood[tokenId] = Mood.HAPPY;
        }
    }

    /**
     * @dev Returns the token URI for a given token ID
     * @param tokenId The ID of the token
     * @return The token URI
     */
    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        string memory imageUri = (s_tokenIdToMood[tokenId] == Mood.HAPPY) ? s_happySvgImgUri : s_sadSvgImgUri;
        bytes memory tokenMetadata = abi.encodePacked(
            '{"name": "", "description": "A mood NFT", "image": "', imageUri, '"}'
        );

        return string(abi.encodePacked("data:application/json;base64,", Base64.encode(bytes(tokenMetadata))));
    }
}
