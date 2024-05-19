const ProductRegistry = artifacts.require("ProductRegistry");
const Consumer = artifacts.require("Consumer");
const Manufacturer = artifacts.require("Manufacturer");
const FakeProductDetection = artifacts.require("FakeProductDetection");
const Distribution = artifacts.require("Distribution");

module.exports = async function(deployer, network, accounts) {
  // Deploy the ProductRegistry contract first
  await deployer.deploy(ProductRegistry);
  const productRegistryInstance = await ProductRegistry.deployed();

  // Deploy the Consumer contract with the address of the deployed ProductRegistry contract
  await deployer.deploy(Consumer, productRegistryInstance.address);

  // Deploy the Manufacturer contract with the address of the deployed ProductRegistry contract
  await deployer.deploy(Manufacturer, productRegistryInstance.address);

  // Deploy the FakeProductDetection contract (assuming it has no dependencies)
  await deployer.deploy(FakeProductDetection, productRegistryInstance.address);

  // Deploy the Distribution contract (assuming it has no dependencies)
  await deployer.deploy(Distribution, productRegistryInstance.address);
};
