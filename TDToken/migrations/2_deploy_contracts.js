var TDCOIN = artifacts.require("TDToken");

module.exports = function (deployer) {
  // deployer.deploy(#Nom, #TotalSupply, #Address Admin)
  //deployer.deploy(TDCOIN,100000000000000, '0x9d40750332cE4f6e6c49D72658076A1f02Fb53f8'); // address admin pour Ganache
  deployer.deploy(TDCOIN,100000000000000, '0x565B26667C941004381dA56a23Fa04bFf35D39cb'); // address (Metamask) admin pour Infura 
};
