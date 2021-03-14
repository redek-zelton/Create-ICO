const Web3 = require('web3');

const web3 = new Web3('HTTP://127.0.0.1:7545')

web3.eth.getAccounts()
.then(console.log);
web3.eth.getBalance('0x76C62b4dCD568de0DEcA09b86E3A71B27DFCB669')
.then(console.log);