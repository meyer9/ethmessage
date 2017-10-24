var HDWalletProvider = require("truffle-hdwallet-provider");

var mnemonic = "load secret canvas siren recall mimic lizard chaos romance opera spray urban";


module.exports = {
  networks: {
    development: {
      host: "localhost",
      port: 8545,
      network_id: 3
    },
    ropsten: {
      provider: new HDWalletProvider(mnemonic, "https://ropsten.infura.io/"),
      network_id: 3
    },
    main: {
      host: "localhost",
      port: 8545,
      network_id: 1
    }
  }
};
