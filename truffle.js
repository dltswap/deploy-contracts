module.exports = {
  networks: {
    local: {
      host: 'localhost',
      port: 9545,
      gas: 5000000,
      gasPrice: 5e9,
      network_id: '*',
    },
    emerald_testnet: {
      host: 'http://web3.ja.nez.si',
      port: 8545,
      gas: 5000000,
      gasPrice: 0,
      network_id: 42261,
    }
  }
}
