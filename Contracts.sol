// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Contracts {
    uint256 public startProjectDate;
    uint16 public day;
    uint256 public amount = 1000;
    uint256 public deposit = 100;
    address payable employer;
    address payable contractor;
    address trusted;

    enum Status {
        noStarted,
        Started,
        Ended,
        Failed,
        Paid,
        Suspended
    }
    Status currentStatus = Status.noStarted;

    constructor(
        address payable _employer,
        address payable _contractor,
        address _trusted,
        uint16 _day
    ) public {
        employer = _employer;
        contractor = _contractor;
        trusted = _trusted;
        day = _day;
        currentStatus = Status.noStarted;
    }
}
