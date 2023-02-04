pragma solidity ^0.8.0;

import "forge-std/Test.sol";

contract Trespasser1Test is Test {
    // address gatekeeper;
    Trespasser1 tresspasser;

    function setUp() public {
        // gatekeeper = 0x2F2f628d4dBc8D94eAA1DEC76FC24FDf552D7cD5;
        tresspasser = new Trespasser1(0x2F2f628d4dBc8D94eAA1DEC76FC24FDf552D7cD5);
    }

    function testGateKey() public {
      bytes8 gateKey = bytes8(0x26bbE18a00007245);
      assertEq(uint32(uint64(_gateKey)), uint16(uint64(_gateKey)));
    }
}
