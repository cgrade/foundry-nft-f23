// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/token/ERC721/ERC721.sol";

contract BuildNFT is ERC721 {
    uint256 private s_tokenCounter;
    mapping(uint256 => string) private s_tokenIdToUri;

    constructor() ERC721("Doogie", "DOG") {
        s_tokenCounter = 0;
    }

    function mintNFT(string memory tokenUri) public {
        s_tokenIdToUri[s_tokenCounter] = tokenUri;
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenCounter++;
    }

    function toKenURI(uint256 tokenId) public view returns (string memory) {
        return s_tokenIdToUri[tokenId];
    }
}
