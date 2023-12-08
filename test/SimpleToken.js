const { expect } = require("chai");

describe("SimpleToken contract", function() {
  it("Deployment should assign the total supply of tokens to the owner", async function() {
    const [owner] = await ethers.getSigners();

    const SimpleToken = await ethers.getContractFactory("SimpleToken");

    const hardhatToken = await SimpleToken.deploy();

    const ownerBalance = await hardhatToken.balanceOf(owner.address);
    expect(await hardhatToken.totalSupply()).to.equal(ownerBalance);
  });
});