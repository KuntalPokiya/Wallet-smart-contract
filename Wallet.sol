//SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Wallet{
    address public owner;
    mapping(address=>uint) public balance;

    constructor(){
        owner=msg.sender;
    }

    function pay() public payable{
    }

    function getBalanceOfOwner() public view returns(uint){
        require(msg.sender==owner,"You are Traitor."); 
        return balance[msg.sender];
    }

    function transferEther(address payable receiver, uint value) public {
        require(msg.sender==owner,"You are Traitor.");
        require(balance[msg.sender]>=value,"Insufficient balance");
        receiver.transfer(value);
    }
}


