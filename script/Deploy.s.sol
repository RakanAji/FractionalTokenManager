// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script, console} from "forge-std/Script.sol";
import {FractionalNFTManager} from "../src/FractionalNFTManager.sol";
import {TestNFT} from "../src/TestNFT.sol";
import {FractionalToken} from "../src/FractionalToken.sol";

contract DeployFractionalToken is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        
        vm.startBroadcast(deployerPrivateKey);

        FractionalNFTManager fractionalNFTManager = new FractionalNFTManager();
        console.log("FractionalNFTManager deployed at: ", address(fractionalNFTManager));

        TestNFT testNFT = new TestNFT();
        console.log("TestNFT deployed at: ", address(testNFT));

        vm.stopBroadcast();
    }
}
