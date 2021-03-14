const TDCOIN = artifacts.require("./TDToken.sol");

module.exports = function (deployer) {
  // deployer.deploy(#Nom, #TotalSupply, #Address Admin)
  deployer.deploy(TDCOIN,100000000000000, '0xa58155a23f5628c3690b4E07d7D9AaCF214BEDbA');
};
