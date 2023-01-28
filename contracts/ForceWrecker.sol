// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ForceWrecker {
  address immutable public owner;
  constructor () {
    owner = msg.sender;
  }

  fallback () external payable {}
  receive () external payable {}

  function destroy(address _to) public {
    require(msg.sender == owner, "ERR_NOT_OWNER");
    selfdestruct(payable(_to));
  }
}