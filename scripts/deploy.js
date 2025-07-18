const hre = require("hardhat");

async function main() {
  const [deployer] = await hre.ethers.getSigners();
  console.log("Deploying contract with:", deployer.address);

  const FlashloanArbitrage = await hre.ethers.getContractFactory("FlashloanArbitrage");
  const contract = await FlashloanArbitrage.deploy();

  await contract.deployed();
  console.log("FlashloanArbitrage deployed at:", contract.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
