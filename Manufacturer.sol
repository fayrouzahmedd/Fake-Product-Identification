// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "./ProductRegistry.sol";

contract Manufacturer {
    address public owner;
    address public productRegistryAddress;

    constructor(address _productRegistryAddress) {
        owner = msg.sender;
        productRegistryAddress = _productRegistryAddress;
    }

}
