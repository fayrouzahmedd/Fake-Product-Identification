// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "./ProductRegistry.sol";

contract FakeProductDetection {
    ProductRegistry private registry;

    constructor(ProductRegistry _registry) {
        registry = _registry;
    }

    function reportCounterfeit(uint256 _productId, string memory _reason) public {
        registry.reportCounterfeit(_productId, _reason);
    }
}