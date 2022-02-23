pragma solidity ^0.8.0;

import "../Proxy.sol";
import "./IBeacon.sol";
import "../ERC1967/ERC1967Upgrade.sol";

contract BeaconProxy is Proxy, ERC1967Upgrade {
    constructor(address beacon, bytes memory data) payable {
        assert(_BEACON_SLOT == bytes32(uint256(keccak256("eip1967.proxy.beacon")) - 1));
        _upgradeBeaconToAndCall(beacon, data, false);
    }

    function _beacon() internal view virtual returns (address) {
        return _getBeacon();
    }

    function _implementation() internal view virtual override returns (address) {
        return IBeacon(_getBeacon()).implementation();
    }

    function _setBeacon(address beacon, bytes memory data) internal virtual {
        _upgradeBeaconToAndCall(beacon, data, false);
    }
}