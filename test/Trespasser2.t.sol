pragma solidity ^0.8.0;

import "../contracts/Trespasser2.sol";
import "../contracts/GatekeeperTwo.sol";
import "forge-std/Test.sol";

contract Trespasser1Test is Test {
  GatekeeperTwo gatekeeper;
  Trespasser2 trespasser;

  function setUp() public {
    gatekeeper = new GatekeeperTwo();
  }

  function testGateKey2() public {
    trespasser = new Trespasser2(address(gatekeeper));
  }
}
