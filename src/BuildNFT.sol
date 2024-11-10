// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/token/ERC721/ERC721.sol";

/**
 * @title BuildNFT
 * @dev ERC721 token representing a BuildNFT
 */
contract BuildNFT is ERC721 {
    uint256 private s_tokenCounter; // Counter for token IDs
    mapping(uint256 => string) private s_tokenIdToUri; // Mapping from token ID to URI

    /**
     * @dev Constructor that sets the name and symbol of the token
     */
    constructor() ERC721("Doogie", "DOG") {
        s_tokenCounter = 0;
    }

    /**
     * @dev Mints a new NFT with a given URI
     * @param tokenUri The URI for the token metadata
     */
    function mintNFT(string memory tokenUri) public {
        s_tokenIdToUri[s_tokenCounter] = tokenUri;
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenCounter++;
    }

    /**
     * @dev Returns the URI for a given token ID
     * @param tokenId The ID of the token
     * @return The URI of the token
     */
    function toKenURI(uint256 tokenId) public view returns (string memory) {
        return s_tokenIdToUri[tokenId];
    }
}
