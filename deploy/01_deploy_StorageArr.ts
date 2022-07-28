import { DeployFunction } from "hardhat-deploy/dist/types";

const func: DeployFunction = async hre => {
  const { deployments, getNamedAccounts } = hre;
  const { deploy } = deployments;

  const { deployer } = await getNamedAccounts();
  const StorageArr = await deploy("StorageArr", {
    from: deployer,
    log: true,
  });

  console.log(`Storage arr Deployed at ${StorageArr.address} `);
};

export default func;
func.tags = ["StorageArr"];
