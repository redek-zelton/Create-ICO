var TDCOIN = artifacts.require("TDToken");

module.exports = function (deployer) {
  // deployer.deploy(#Nom, #TotalSupply, #Address Admin)
  //deployer.deploy(TDCOIN,100000000000000, '0x9d40750332cE4f6e6c49D72658076A1f02Fb53f8'); // address admin pour Ganavhe
  deployer.deploy(TDCOIN,100000000000000, '0x84f3C9F6e2d84d7A90b9adD60477B6ad809806a3'); // address (Metamask) admin pour Infura 
};
