// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {FractionalToken} from "./FractionalToken.sol";
import {IERC721} from "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import {IERC721Receiver} from "@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol";

contract FractionalNFTManager is IERC721Receiver {
    // Mapping: NFT contract address => tokenId => FractionalToken contract address.
    mapping(address => mapping(uint256 => address)) public fractionalTokens;

    event NFTDeposited(address indexed nftAddress, uint256 indexed tokenId, address fractionalToken);

    /**
     * @notice Deposits an NFT and deploys a new FractionalToken contract.
     * @param nftAddress Address of the ERC721 token contract.
     * @param tokenId Token ID of the NFT to deposit.
     * @param tokenName Name for the fractional ERC20 token.
     * @param tokenSymbol Symbol for the fractional ERC20 token.
     * @param tokenSupply Total supply of fractional tokens.
     */
    function depositNFT(
        address nftAddress,
        uint256 tokenId,
        string memory tokenName,
        string memory tokenSymbol,
        uint256 tokenSupply
    ) external {
        // Transfer the NFT from the sender to this contract.abi
        IERC721(nftAddress).safeTransferFrom(msg.sender, address(this), tokenId);

        // Deploy a new Fractional Token contract with tokens minted to the depositor
        FractionalToken fractionalToken = new FractionalToken(tokenName, tokenSymbol, msg.sender, tokenSupply);

        // Record the fractional token address against the NFT.
        fractionalTokens[nftAddress][tokenId] = address(fractionalToken);

        emit NFTDeposited(nftAddress, tokenId, address(fractionalToken));
    }

    // Required function to receive ERC721 tokens.
    function onERC721Received(address operator, address from, uint256 tokenId, bytes calldata data)
        external
        override
        returns (bytes4)
    {
        return IERC721Receiver.onERC721Received.selector;
    }
}
