//SPDX-License-Identifier:Unlicensed
pragma solidity ^0.8.0;

contract Constructor{
    string public tokenName;
    uint public totalSupply;

    constructor(string memory name, uint number){
        tokenName = name;
        totalSupply=number;
    }
    function set(uint number )public{
        totalSupply=number;
    }

    //constant ,immutable
   /* uint public constant num= 10;
    function sett(unint numbb) public{
        number =numbb; //Burada constant bir değeri değiştirmeye çalıştığımızda oluşan hatayı ele aldık 

    } */
    


}
