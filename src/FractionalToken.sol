// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract FractionalToken is ERC20 {
    constructor(string memory TOKEN_NAME, string memory TOKEN_SYMBOL, address owner, uint256 totalSupply)
        ERC20(TOKEN_NAME, TOKEN_SYMBOL)
    {
        _mint(owner, totalSupply);
    }
}
