# NFT Minting Project

This project consists of two types of NFTs: BuildNFT and MoodNft. The BuildNFT contract allows users to mint NFTs with a specified URI, while the MoodNft contract allows users to mint NFTs that can change moods between happy and sad.

## Contracts

### BuildNFT

- **Description**: An ERC721 token representing a BuildNFT.
- **Functions**:
  - `mintNFT(string memory tokenUri)`: Mints a new NFT with the specified URI.
  - `toKenURI(uint256 tokenId)`: Returns the URI for a given token ID.

### MoodNft

- **Description**: An ERC721 token representing a Mood NFT that can change moods.
- **Functions**:
  - `mintNFT()`: Mints a new Mood NFT with a default mood of HAPPY.
  - `flipMood(uint256 tokenId)`: Flips the mood of the NFT between HAPPY and SAD.
  - `tokenURI(uint256 tokenId)`: Returns the token URI for a given token ID.

## Scripts

### MintBuildNft

- **Description**: Script to mint BuildNFT tokens.
- **Usage**: Call the `run()` function to mint a new BuildNFT.

### MintMoodNft

- **Description**: Script to mint MoodNFT tokens.
- **Usage**: Call the `run()` function to mint a new MoodNFT.

### DeployNFT

- **Description**: Script to deploy the BuildNFT contract.
- **Usage**: Call the `run()` function to deploy the contract.

### DeployMoodNft

- **Description**: Script to deploy the MoodNft contract.
- **Usage**: Call the `run()` function to deploy the contract.

## Testing

The project includes tests for both the BuildNFT and MoodNft contracts. Use the following commands to run the tests:

```bash
forge test
```

## Installation

To install the necessary dependencies, run:

```bash
npm install
```

## License

This project is licensed under the MIT License.
