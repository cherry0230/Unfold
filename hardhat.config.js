require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.19",
  networks: {
    hardhat: {
    },
    avalanche: {
      url: "https://api.avax-test.network/ext/bc/C/rpc",
      accounts: ["577ecb18544b1b3e0fca2a6915937e828ef542e59774adf28a5ce7b456f99430"]
    }
  }

};
