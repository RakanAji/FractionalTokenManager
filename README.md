# Fractional NFT Manager

A Foundry-based Solidity project that demonstrates how to fractionalize NFTs by depositing an ERC721 token and minting fractional ERC20 tokens. This project includes smart contracts, tests, and deployment scripts to help you understand the process of NFT fractionalization on-chain.

## Table of Contents

- [Fractional NFT Manager](#fractional-nft-manager)
  - [Table of Contents](#table-of-contents)
  - [About](#about)
  - [Features](#features)
  - [Project Structure](#project-structure)
  - [Installation](#installation)
  - [USAGE](#usage)
  - [TESTING](#testing)
  - [DEPLOYMENT](#deployment)
  - [CONTRIBUTING](#contributing)
  - [License](#license)

## About

The **Fractional NFT Manager** project allows users to deposit an NFT (ERC721) and, in return, deploys a new fractional token (ERC20) that represents shares of the NFT. This concept makes it possible to:
- Fractionalize valuable digital assets.
- Enable shared ownership of NFTs.
- Provide liquidity to traditionally illiquid assets.

The project uses [Foundry](https://getfoundry.sh/) for development, testing, and deployment of Solidity smart contracts.

## Features

- **NFT Deposit:** Transfer an NFT into the manager contract.
- **Fractional Token Minting:** Automatically deploy a fractional ERC20 token contract upon NFT deposit.
- **ERC721 Receiver:** Implements the `IERC721Receiver` interface to safely receive NFT transfers.
- **Comprehensive Testing:** Includes tests written in Solidity with Foundry to verify functionality.
- **Deployment Script:** Easy deployment using Foundry's scripting capabilities.

## Project Structure

```
fractional-nft/
├── src
│   ├── FractionalNFTManager.sol   // Core contract to manage NFT deposits and fractional token creation
│   ├── FractionalToken.sol        // ERC20 token that represents fractional ownership
│   └── TestNFT.sol                // A test ERC721 token to simulate NFT deposits
├── test
│   └── FractionalTokenTest.t.sol  // Foundry tests for fractionalization functionality
├── script
│   └── Deploy.s.sol               // Deployment script to broadcast contracts
├── .env                           // Environment variables (e.g., PRIVATE_KEY)
├── foundry.toml                   // Foundry configuration
└── README.md                      // This file
```

## Installation

1. **Clone the Repository:**

   ```bash
   git clone https://github.com/yourusername/fractional-nft.git
   cd fractional-nft

2. Install Foundry:
    Follow the instructions on the Foundry website to install Foundry.

3. Install Dependencies:
    This project uses OpenZeppelin contracts. Foundry automatically fetches dependencies defined in your foundry.toml, so simply run:

    ```bash
    forge install

4. Set Up Environment Variables:
    Create a .env file in the project root with your private key and any other variables. For example:

    ```env
    PRIVATE_KEY=0xYourPrivateKeyHere
    SEPOLIA_RPC_URL=https://eth-sepolia.alchemy.com/v2/YourAlchemyApiKey

## USAGE
Fractionalizing an NFT
1. Mint an NFT:
    Use the TestNFT contract to mint an NFT.

2. Approve the Manager:
    Approve the FractionalNFTManager contract to transfer your NFT.

3. Deposit the NFT:
    Call the depositNFT function from the FractionalNFTManager contract to deposit your NFT and create fractional tokens.

## TESTING
1. Run your tests using Foundry:

    ```bash 
    forge test

2. To run tests on a fork (e.g., Sepolia):

    ```bash
    forge test --fork-url $SEPOLIA_RPC_URL

Ensure your environment variables are loaded (for example, by running source .env).


## DEPLOYMENT
1. Deploy your contracts using the provided Foundry script:

    ```bash
    forge script script/Deploy.s.sol --rpc-url $SEPOLIA_RPC_URL --private-key $PRIVATE_KEY --broadcast --verify


This script deploys the FractionalNFTManager and TestNFT contracts, and logs their addresses.

## CONTRIBUTING
Contributions are welcome! Feel free to open issues or submit pull requests for improvements or bug fixes.

## License
This project is licensed under the MIT License.