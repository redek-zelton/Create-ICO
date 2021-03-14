# Create-ICO
Create an ICO with Open Zeppline


# I) Installation dans vs code
npm init
npm i -g truffle
npm install --save-dev @openzeppelin/contracts
npm i -g ganache
truffle init

# II) Lier Truffle vers Ganache
### dans vs code
truffle-config.js ==> networks
SET
ganache: {
      host: "127.0.0.1",     // Localhost (default: none)
      port: 7545,            // Standard Ethereum port (default: none)
      network_id: 5777,       // Any network (default: none)
    },
### dans Ganache
-new workspace
-set name
-add truffle ou truffle-config js file
-save workspace

### Executer
truffle compile
truffle migrate --reset -- network ganache
truffle console
Token.deployed().then(function(i) { token = i;})
token.address
token._totalSupply

### Ressource
suivre https://www.trufflesuite.com/docs/ganache/truffle-projects/linking-a-truffle-project

# III) Lier truffle avec infura

### dans vs code
npm install @truffle/hdwallet-provider


truffle-config.js ==> networks

const HDWalletProvider = require("@truffle/hdwallet-provider");
const mnemonic = #mnemonic;

SET
infura: {
      provider: function() {
        return new HDWalletProvider(mnemonic, #testnet_URL)
      },
      network_id: 3
    }
truffle migrate --reset --network infura

### dans infura
-create new project
-ENDPOINTS => Rinkeby

### Ressource
suivre : https://www.trufflesuite.com/tutorials/using-infura-custom-provider

