var EthMessage = artifacts.require("./EthMessage.sol");

module.exports = function(deployer) {
  deployer.deploy(EthMessage);
};
