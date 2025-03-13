// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract TestNFT is ERC721 {
    uint256 private s_tokenCounter;
    string private constant TOKEN_NAME = "YUNA";
    string private constant TOKEN_SYMBOL = "YNA";

    constructor() ERC721(TOKEN_NAME, TOKEN_SYMBOL) {
        s_tokenCounter = 0;
    }

    // Mints a new NFT and assigns it to the sender.
    function mintNFT() public returns (uint256) {
        uint256 newTokenId = s_tokenCounter;
        _mint(msg.sender, newTokenId);
        s_tokenCounter++;
        return newTokenId;
    }
}
