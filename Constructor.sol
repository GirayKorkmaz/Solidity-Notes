//SPDX-License-Identifier:Unlicensed
pragma solidity ^0.8.0;

contract Constructor{
    string public tokenName;
    uint public totalSupply;
    
    constructor(string memory name , uint number){
        tokenName = name;
        totalSupply = number;
    }

    function set(uint number)public{
        totalSupply=number;
    }

    //Constant,immutable

//     uint public constant number =10;

//     function set(uint num) public {
//         number=num  -------------> This is a wrong using because we chose the number constant
//     }


    // uint public immutable number;

    // constructor(uint num){
    //     number=num;
    // } 

    // function set(uint number2) public ;
    // number = number2; --------> This is a wrong using too


    //The difference between constant and immutable is that in constant we need to give the value at first, while immutable gives us the right to give it in the constructor. 
 
 /*address public immutable owner;
 constructor() {
    owner=msg.sender;
 }*/


}










