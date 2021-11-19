pragma solidity >= 0.5.16;

import './Multicall.sol';

contract Deploy {
    function deploy(bytes memory code, bytes32 salt, bytes memory initData) public returns (address addr) {
        assembly {
            addr := create2(0, add(code, 0x20), mload(code), salt)
            if iszero(extcodesize(addr)) { revert(0, 0) }
        }

        if (initData.length > 0) {
            (bool success,) = addr.call(initdata);
            require(success);
        }
    }

    function deployMulticall() public returns (address addr) {
        bytes memory bytecode = type(Multicall).creationCode;
        bytes32 salt = keccak256(abi.encodePacked(msg.sender));
        bytes initData = bytes(0);
        addr = deploy(bytecode, salt, initData);
    }
}