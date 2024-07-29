// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Functions{
    uint public luckyNumber =7; // Aşağıdki kod satırının yerine bunu kullanabiliriz
    /*function showNumber()public view returns(uint){
        return luckyNumber;
    }*/
    function setNumber(uint newNumber) public {
        luckyNumber = newNumber;
    }
     function nothing() public pure returns(uint, bool, bool) {
        return (5, true, false);
    }
//nothing ve nothing2 benzer kullanımlara sahiptir 
    function nothing2() public pure returns(uint x, bool y, bool z) {
        x = 5;
        y = true;
        z = false;
    }
    uint g=15;
    
    function setG(uint k) public view returns(uint){
        return g+k;
    }
    function add(uint a,uint b) public view returns(uint){
        return a+b+block.timestamp;
    }
    function add2(uint a,uint b) public pure returns(uint){
        return a+b;
    }
}