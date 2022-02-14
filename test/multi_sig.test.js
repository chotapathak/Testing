const { assert } = require("chai");
const Multisig = artifacts.require('Multi_sig');
module.exports = function(deployer) {
  deployer.deploy(Multisig);
};
// contract("Multisig", async (accounts) => {
//     let wallet;
//     beforeEach(async () => {
//       wallet = Multisig.new([accounts[0], accounts[1], accounts[2]]);
//       web3.eth.sendTransaction({
//         from: accounts[0],
//         to: wallet.address,
//         value: 10 ** 18,
//       });
//     });
contract('Multi_sig', () => {
  
  
    it("it should deploye smart contract Owner properly", async () => {
      const multi_sig = await Multisig.deployed();
      console.log(multi_sig.address)
      assert(multi_sig.address !== undefined);
      expect(multi_sig).to.be.equal("Owner added successfully !")
  })
    
    
  });