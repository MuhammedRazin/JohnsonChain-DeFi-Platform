// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IERC20 {
    function transferFrom(address from, address to, uint amount) external returns (bool);
    function transfer(address to, uint amount) external returns (bool);
}

contract Staking {
    IERC20 public token;
    mapping(address => uint) public balances;
    mapping(address => uint) public rewards;

    constructor(address _token) {
        token = IERC20(_token);
    }

    function stake(uint amount) public {
        require(amount > 0, "Amount must be greater than zero");
        token.transferFrom(msg.sender, address(this), amount);
        balances[msg.sender] += amount;
    }

    function calculateReward(address user) public view returns (uint) {
        return balances[user] / 10;
    }

    function claimReward() public {
        uint reward = calculateReward(msg.sender);
        rewards[msg.sender] += reward;
    }

    function withdraw(uint amount) public {
        require(balances[msg.sender] >= amount, "Not enough balance");
        balances[msg.sender] -= amount;
        token.transfer(msg.sender, amount);
    }
}
