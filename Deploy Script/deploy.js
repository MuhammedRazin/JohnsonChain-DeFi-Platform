const hre = require("hardhat");

async function main() {
    const RewardToken = await hre.ethers.getContractFactory("RewardToken");
    const rewardToken = await RewardToken.deploy();
    await rewardToken.deployed();

    const Staking = await hre.ethers.getContractFactory("Staking");
    const staking = await Staking.deploy(rewardToken.address);
    await staking.deployed();

    console.log("RewardToken deployed to:", rewardToken.address);
    console.log("Staking deployed to:", staking.address);
}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});
