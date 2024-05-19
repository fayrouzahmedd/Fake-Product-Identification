// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "./ProductRegistry.sol";

contract Consumer {
    ProductRegistry private registry;

    constructor(ProductRegistry _registry) {
        registry = _registry;
    }

    function verifyProduct(uint256 _productId) public view returns (string memory name, string memory description, address manufacturer, bool isRegistered, bool isCounterfeit) {
        return registry.getProductDetails(_productId);
    }
}