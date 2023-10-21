// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract banking{

    mapping(address=>uint) public  user;
    address  public manager;
    
    constructor(){
        manager = msg.sender;
    }

    modifier onlyOwner(){
        require(msg.sender == manager,"You are not the owner of the smart contract");
        _;
    }

    function deposit() public payable returns(bool){
        require(msg.value >= 1 wei ,"The balance is insuffcient");
        user[msg.sender]+=msg.value;
        return true;
    }

    function withdraw(uint _amount) public returns(bool){
        require(user[msg.sender] >_amount,"You have the unsufficient balance");
        user[msg.sender]-=_amount;
        payable(msg.sender).transfer(_amount);
        return true;
    }

    function checkbalance() view public returns(uint){
        return user[msg.sender];
    }

    function contract_balance() view  public onlyOwner returns(uint){
        return address(this).balance;
    }

    function withdraw_all() public payable onlyOwner returns(bool){
       payable(manager).transfer(contract_balance());
       user[msg.sender] = 0;
       return true;
    }

}