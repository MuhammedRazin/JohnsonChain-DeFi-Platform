// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RewardToken {
    string public name = "Arafat Reward Token";
    string public symbol = "ART";
    uint public totalSupply = 1000000;

    mapping(address => uint) public balanceOf;

    constructor() {
        balanceOf[msg.sender] = totalSupply;
    }

    function transfer(address to, uint amount) public returns (bool) {
        require(balanceOf[msg.sender] >= amount, "Insufficient balance");
        balanceOf[msg.sender] -= amount;
        balanceOf[to] += amount;
        return true;
    }
}
