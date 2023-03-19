//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract Token{
    string public name = "hardhat token";
    string public symbol = "HHT";
    uint public totalSupply = 10000;

    address public owner;

    mapping (address => uint) balances;

    constructor() {
        owner = msg.sender;
        balances[msg.sender] = totalSupply;
    }

    function Transfer(address _to, uint amount) external {
        require(balances[msg.sender] >= amount, "not enough amount");
        balances[msg.sender] -= amount;
        balances[_to] += amount;
    }

    function checkBalance(address _addr) external view returns(uint) {
        return balances[_addr];
    }
}