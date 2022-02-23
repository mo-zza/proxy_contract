pragma solidity ^0.8.0;

import "../Proxy.sol";
import "./ERC1967Upgrade.sol";
import "../../access/Ownable.sol";

contract ERC1967Proxy is Proxy, ERC1967Upgrade, Ownable {
    constructor(address _logic, bytes memory _data) payable {
        assert(_IMPLEMENTATION_SLOT == bytes32(uint256(keccak256("eip1967.proxy.implementation")) - 1));
        _upgradeToAndCall(_logic, _data, false);
    }

    function _implementation() internal view virtual override returns (address impl) {
        return _getImplementation();
    }

    function upgradeTo(address newImplementation, bytes memory _data) public payable onlyOwner {
        _upgradeToAndCall(newImplementation, _data, false);
    }
}