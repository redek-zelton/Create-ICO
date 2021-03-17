# Create ICO
## _TDCOIN, TDC_

-  Send in Ethers, receive tokens
- use truffle , Open Zeppelin 
- test with ganache , infura , a testnet network and MyCrypto

## Methods

- Admin() : gives the admin address
- decimals(): gives the decimals of the token
- _decimals() : read the decimal given to the tokenn
- allowlistedNumber() :  gives the number of address in the list for those allowed to get token 
- balanceOf(address) : gives the balance of token of an address
    - balanceOf(address): with the admin address give the current total supply of token
- name() : gives the name of the token
- symbol() : gives the symbol of the token
- totalSupply() : gives the initial total supply 
- allowlistAddress(address) : add an address to the list if it is not alredy in it (only admin)
- mint(address,uint256) : mint token to an arbitrary address (only admin)
- send_from_admin(address,uint256) : send token from the current supply to an arbitrary address (only admin)
-  fallback() gets called when money is sent to this contract , and getToken(amount, rate) is called and token is sent if the sender is in the allowed list (only members)

## Installation

1) Truffle :
> Truffle is a development environment where you can easily
develop smart contracts with it’s built-in testing framework, smart contract
compilation, deployment, interactive console

```bash
npm install -g truffle
```
create a project :  
```bash
mkdir nameoffile
cd file
truffle init
```
usefull commands :
```shell
Compile: truffle compile
Migrate: truffle migrate
Test contracts: truffle test
Console : truffle console
Version : truffle version
```
* [See more](https://github.com/trufflesuite/truffle)
2) Ganache :
> Ganache acts as our local Blockchain to deploy and test the 
contract functionality locally before deploying it to a public testnet.

* [follow instruction here](https://github.com/trufflesuite/ganache) to download the .appx
* launch the application and create a Workspace with the name TDToken for example
* links Truffle to Gnache ([follow this](https://www.trufflesuite.com/docs/ganache/truffle-projects/linking-a-truffle-project)) :
* In the `truffle-config.js` 

```javascript
module.exports = {
  networks: {
    ganache: {
      host: "127.0.0.1",     // Localhost (default: none)
      port: 7545,            // Standard Ethereum port (default: none)
      network_id: 5777,       // Any network (default: none)
    }
  },
```
* Then add in the Ganache Worksplace the truffle-config js file

To test with Ganache : 
In the `2_deploy_contracts.js` : choose your Ganache address as Admin address

```javascript
var TDCOIN = artifacts.require("TDToken");
module.exports = function (deployer) {
  // deployer.deploy(#Nom, #TotalSupply, #Address Admin)
  //deployer.deploy(TDCOIN,100000000000000, '0x.......................'); // address admin pour Ganache
  deployer.deploy(TDCOIN,100000000000000, '0x......................'); // address (Metamask) admin pour Infura 
};
```

```shell
# Compile 
truffle compile

# Migrate
truffle migrate --reset -- network ganache

# Test
truffle console 
# in the console 
TDToken.deployed().then((instance) => {td = instance;})
#example :
td.name()
td.totalSupply()
```
When contracts are deployed to the local Blockchain in Ganache
if we look at the first row from the accounts table we can see that the ETH balance 
has dropped slightly and that the number of transactions has increased above 0
1) Openzeppelin
> OpenZeppelin is a library that consists of multiple, reusable contracts, to build ERC20 tokens for example.

```bash
npm init
npm install @openzeppelin/contracts
```
## Deploy to testnet with Infura
```bash
npm install @truffle/hdwallet-provider
```
* [follow instruction here](https://www.trufflesuite.com/tutorials/using-infura-custom-provider)
* link truffle to infura :
    truffle-config.js ==> networks
    const HDWalletProvider = require("@truffle/hdwallet-provider");
    const mnemonic = #mnemonic;
```javascript
const HDWalletProvider = require("@truffle/hdwallet-provider");
const mnemonic = """; //#mnemonic"
```
```javascript
 networks: {
    ganache: {
      host: "127.0.0.1",     // Localhost (default: none)
      port: 7545,            // Standard Ethereum port (default: none)
      network_id: 5777,       // Any network (default: none)
    },
    infura: {
      provider: function() {
        //return new HDWalletProvider(mnemonic, "https://rinkeby.infura.io/v3/290e39df33ee41b6bdbc079bd550fa7a")
        return new HDWalletProvider(mnemonic, "https://ropsten.infura.io/v3/290e39df33ee41b6bdbc079bd550fa7a")
      },
      network_id: 4
    },
```
* create a new project -ENDPOINTS => Rinkeby/Ropsten/..
* To test with testnet
* get token in a faucet

In the `2_deploy_contracts.js` : choose your metamask address as Admin address
Your account need to have enough gas and ether to deploy the contracts

```shell
# Migrate
truffle migrate --reset --network infura
```
Once the contract is migrated , you can get the contract address in the console
- In Metamask you can add a token with the contract address and the token will be displayed in your metamask
- In MyCrypto choose to interact with your contract in the given testnet , then find the abi in the `build\contracts\TDToken.json` and paste it
- Now you can interact with the contract and test it
- In Metamask send ether to the contract address with Metamsk to get token


## Start 
Install the dependencies and devDependencies
```sh
npm install
```
Deploy localy with Ganache or in a testnet with Infura and Test
* [Contract](https://ropsten.etherscan.io/address/0x5C0355Fa5d9f541c91FfE0812Ced0deeFFCE546c) - Send ether to this contract if you want to receive our token (Ropsten testnet) , ask us before to add you in the member list 
Contract address : 0x565B26667C941004381dA56a23Fa04bFf35D39cb

## More