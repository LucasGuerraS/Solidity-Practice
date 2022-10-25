//SPDX-License-Identifier: MIT

 pragma solidity 0.8.14;

 contract Wallet {

    uint public balance;
    address public owner;

    constructor(){
        owner = msg.sender;
    }

    function getBalance() public view returns(uint){
        return address(this).balance;
    }
    
    function deposit() public payable {
        balance += msg.value;
    }

    function withdrawAll() public payable {
        payable(owner).transfer(getBalance());
    }

    function withdrawToAddress(address to) public payable {
        payable(to).transfer(getBalance());
    }
 }
