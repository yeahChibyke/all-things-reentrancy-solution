// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.13;

import "forge-std/Test.sol"; //debug

interface IVulnerable {
    function deposit() external payable;
    function withdraw(uint256 amount) external;
    function stake(uint256 amount) external returns (uint256);
    function unstake(uint256 amount) external returns (uint256);
    function userBalance(address _user) external view returns (uint256);
    function userStake(address _user) external view returns (uint256);
    function getValueOfShares(uint256 amount) external pure returns (uint256);
    function getSharesOfValue(uint256 amount) external pure returns (uint256);
}

contract Attacker {
    IVulnerable public target;
    bool public retrieving;

    constructor(address _target) {
        target = IVulnerable(_target);
    }

    receive() external payable {
        /*
            Your code goes here!
        */
    }

    function exploit() public payable {
        /*
            Your code goes here!
        */
    }

    function getTheMoney() external returns (uint256) {
        /*
            Your code goes here!
        */
    }
}
