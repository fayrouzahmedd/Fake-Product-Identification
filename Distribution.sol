// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "./ProductRegistry.sol";

contract Distribution {
    ProductRegistry private registry;

    mapping(uint256 => address[]) public productHistory;

    constructor(ProductRegistry _registry) {
        registry = _registry;
    }

    function updateProductHistory(uint256 _productId, address _handler) public {
        productHistory[_productId].push(_handler);
    }

    function getProductHistory(uint256 _productId) public view returns (address[] memory) {
        return productHistory[_productId];
    }
}