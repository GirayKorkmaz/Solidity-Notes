// SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.0;

contract Functions {
    
    uint public  luckyNumber = 7;
    
    // function showNumber()public view returns(uint){
    //     return luckyNumber;
    // }

    function setNumber(uint newNumber )public{  //We are making change on contract
        luckyNumber = newNumber;
    }
    // function nothing() public pure returns(uint,bool,bool){
    //     return(10,false,false);

    // }
    function nothing() public pure returns(uint x,bool y ,bool z){
        x=6;
        y=false;
        z=true;
        
    }
    // uint public t=3;
    // function setT(uint newT) public {
    //     t=newT;
    // }

    uint t=3;

    function setT()public view returns(uint){
        return t;
    }


     //Addition 
    function setT(uint y)public view returns(uint){
        return t+y;
    } 

    function add(uint a,uint b) public view returns(uint){
        return a+b+block.timestamp;
    }
    function add2(uint a, uint b) public pure returns(uint){
        return a+b;
    }
    //Public,External,İnternal,Private
    //Public: This function can be called by both internal and external users and can be called by a contract
    function add3(uint c ,uint d) public pure returns (uint){
        return add2(c,d);
    }
    function publicKeyword() public pure returns(string memory){
        return "This is a public function";
    }
    function callPublicKeyword()public pure returns(string memory){
        return publicKeyword();
    }

    //Private:Only this contract can access this function. No one from outside can access this function.
    
    function privateKeyword()private pure returns (string memory){
        return "This is a private function";
    }
    function callPrivateKeyword() public  pure returns (string memory){
        return privateKeyword();
    }

    //İnternal:Only inheriting contracts can call this function. External users cannot call it.

    function internalKeyword() internal  pure returns (string memory){
        return "This is a internal function";
    }
    function callinternalKeyword() public pure returns(string memory){
        return internalKeyword();
    }

    //External:Can call external users but not within the contract

    function externalKeyword() external pure returns (string memory){
        return "This is a external function";
    }
    // function callexternalKeyword() public pure returns(string memory){
    //     return externalKeyword();
    // } This is a wrong using 

    

   }




