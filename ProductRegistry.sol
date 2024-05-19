// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract ProductRegistry {
    struct Product {
        string name;
        string description;
        address manufacturer;
        bool isRegistered;
        bool isCounterfeit;
    }

    mapping(uint256 => Product) public products;
    uint256 private productId;

    event ProductRegistered(uint256 indexed id, string name, address manufacturer);
    event ProductFlaggedAsCounterfeit(uint256 indexed id, string reason);

    function registerProduct(string memory _name, string memory _description) public {
        require(bytes(_name).length > 0, "Name cannot be empty");
        require(bytes(_description).length > 0, "Description cannot be empty");

        productId++;
        products[productId] = Product(_name, _description, msg.sender, true, false);
        emit ProductRegistered(productId, _name, msg.sender);
    }

    function reportCounterfeit(uint256 _productId, string memory _reason) public {
        require(products[_productId].isRegistered, "Product does not exist");
        require(products[_productId].manufacturer != msg.sender, "Cannot report own product as counterfeit");

        products[_productId].isCounterfeit = true;
        emit ProductFlaggedAsCounterfeit(_productId, _reason);
    }

    function getProductDetails(uint256 _productId) public view returns (string memory name, string memory description, address manufacturer, bool isRegistered, bool isCounterfeit) {
        require(products[_productId].isRegistered, "Product does not exist");

        Product memory product = products[_productId];
        return (product.name, product.description, product.manufacturer, product.isRegistered, product.isCounterfeit);
    }
}