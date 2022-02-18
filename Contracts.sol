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

    function Pay() public payable returns (string memory) {
        require(currentStatus == Status.noStarted, "Status is wrong");
        require(msg.sender == employer, "Access Denied");
        require(msg.value == amount, "amount is not enugh");
        startProjectDate = block.timestamp;
        currentStatus = Status.Paid;
        return "Project started";
    }

    function Deposit() public payable returns (string memory) {
        require(msg.sender == contractor, "Access Denied");
        require(msg.value == deposit, "amount is least than deposit amount");
        require(currentStatus == Status.Paid, "Status is not paid");
        currentStatus = Status.Started;
        return "Deposit paid";
    }

    function Confirm(bool _confirm) public returns (string memory) {
        require(msg.sender == employer, "Access Denied");
        require(currentStatus == Status.Started, "The project has not started");

        if (_confirm == true) {
            currentStatus = Status.Ended;
            return "The project was approved by the employer";
        } else {
            if (block.timestamp > (day * 84600) + startProjectDate) {
                currentStatus = Status.Suspended;
                return "The project was suspended";
            } else {
                return "DeadLine is not over";
            }
        }
    }

    function Judgment(bool _trustedConfimation) public returns (string memory) {
        require(msg.sender == trusted, "Just Trusted Can run this function");
        require(currentStatus == Status.Suspended, "Status is not Suspended");
        if (_trustedConfimation == true) {
            currentStatus = Status.Ended;
            return "The project is approved";
        } else if (_trustedConfimation == false) {
            currentStatus = Status.Failed;
            return "The project is not approved";
        }
        return "Judgement run";
    }

    function WithdrawContractor() public payable returns (string memory) {
        require(
            msg.sender == contractor,
            "just contactor can run this function"
        );
        require(
            currentStatus == Status.Ended,
            "The Project has not yet finished"
        );
        contractor.transfer(1100);
        return "Contractor payment was made";
    }

    function WithdrawEmployer() public payable returns (string memory) {
        require(msg.sender == employer, "Just Empoler can run this function");
        require(currentStatus == Status.Failed, "Project is not failed");
        employer.transfer(1100);
        return "The employer was compensated";
    }
}
