// SPDX-License-Identifier: MIT

pragma solidity ^0.8.16;

import {ERC721} from "lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
import {Base64} from "lib/openzeppelin-contracts/contracts/utils/Base64.sol";

contract MoodNft is ERC721 {

    // errors
    error MoodNft__CantFlipMoodIfNotOwner();

    // state variables
    uint256 private s_tokenCounter;
    string private s_sadSvgImgUri;
    string private s_happySvgImgUri;

    enum Mood {
        SAD,
        HAPPY
    }

    mapping(uint256 => Mood) private s_tokenIdToMood;

    constructor(
        string memory sadSvgImgUri,
        string memory happySvgImgUri
    ) ERC721("MoodNft", "MN") {
        s_tokenCounter = 0;
        s_sadSvgImgUri = sadSvgImgUri;
        s_happySvgImgUri = happySvgImgUri;
    }

    function mintNFT() public {
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenIdToMood[s_tokenCounter] = Mood.HAPPY;
        s_tokenCounter++;
    }
    function flipMood(uint256) public {
        // Only want NFT owner to be able to flip the mood
        if(!_isAapprovedOrOwner(msg.sender, tokenId){
            revert  MoodNft__CantFlipMoodIfNotOwner();
        }
        if (s_tokenIdToMood[tokenId] == Mood.HAPPY) {
            s_tokenIdToMood[tokenId] = Mood.SAD;
        } else {
            s_tokenIdToMood[tokenId] = Mood.HAPPY;
        }
    }

    function tokenURI(
        uint256 tokenId
    ) public view override returns (string memory) {
        string memory imageUri;
        if (s_tokenIdToMood[tokenId] == Mood.HAPPY) {
            imageUri = s_happySvgImgUri;
        } else {
            imageUri = s_sadSvgImgUri;
        }
        bytes memory tokenMetadata = abi.encodePacked(
            '{"name": "", name(), ", "description": "A mood NFT", "image": "',
            imageUri,
            '"}'
        );

        return
            string(
                abi.encodePacked(
                    "data:application/json;base64,",
                    Base64.encode(bytes(tokenMetadata))
                )
            );
    }
}
