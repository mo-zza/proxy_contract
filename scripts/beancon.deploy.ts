import { ethers } from 'hardhat';

async function beaconDeploy() {
    const beaconProxyContract = await ethers.getContractFactory('BeaconProxy');
    const beaconProxy = await beaconProxyContract.deploy(
        `${process.env.BEACON_ADDRESS}`,
        `${process.env.BEACON_DATA}`
    );
    await beaconProxy.deployed();
}

beaconDeploy();
