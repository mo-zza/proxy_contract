pragma solidity ^0.8.0;

import "./IBeacon.sol";
import "../../utils/Address.sol";
import "../../access/Ownable.sol";

contract BeaconUpgrade is IBeacon, Ownable {
    address private _implementation;

    event Upgraded(address indexed implementation);

    constructor(address implementation_) {
        _setImplementation(implementation_);
    }

    function _setImplementation(address newImplementation) private {
        require(Address.isContract(newImplementation), "BeaconUpgrade: implementation is not a contract");
        _implementation = newImplementation;
    }

    function implementation() public view virtual override returns (address) {
        return _implementation;
    }

    function upgradeTo(address newImplementation) public virtual onlyOwner {
        _setImplementation(newImplementation);
        emit Upgraded(newImplementation);
    }
}