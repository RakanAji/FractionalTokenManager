// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Test} from "forge-std/Test.sol";
import {FractionalNFTManager} from "../src/FractionalNFTManager.sol";
import {FractionalToken} from "../src/FractionalToken.sol";
import {TestNFT} from "../src/TestNFT.sol";

contract FractionalTokenTest is Test {
    FractionalNFTManager public fractionalNFTManager;
    TestNFT public testNFT;

    address private immutable USER = makeAddr("user");
    address PLAYER = address(1);

    function setUp() public {
        fractionalNFTManager = new FractionalNFTManager();
        testNFT = new TestNFT();
        // Mint the NFT first
        vm.prank(USER);
        testNFT.mintNFT(); // Ensure this mints the correct token ID

        // Approve the manager to transfer NFTs on behalf of PLAYER
        vm.prank(USER);
        testNFT.setApprovalForAll(address(fractionalNFTManager), true);
    }

    function testMintNFT() public {
        vm.prank(USER);
        testNFT.mintNFT();
    }

    function testDepositNFTApprovedByOperator() public {
        vm.prank(USER);
        testNFT.setApprovalForAll(address(fractionalNFTManager), true);
    }

    function testDepositNFT() public {
        uint256 tokenId = 0;
        uint256 totalSupply = 1000e18;

        // Deposit the NFT
        vm.prank(USER);
        fractionalNFTManager.depositNFT(address(testNFT), tokenId, "YUNA", "YNA", totalSupply);
    }
}
