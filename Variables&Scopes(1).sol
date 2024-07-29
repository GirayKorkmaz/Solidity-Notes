// SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.0;

contract Variables{
    // ---> make an comment 
    /* ---> make an comment between this area     */
    
    //Fixed-Size Types
    bool isTrue=true; // ---> bool's default value is false
    int number = 12; //int256  -2^256 to 2^256
    uint number2 =12; // 0 to 2^256
    address myAddress = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    bytes32 name ="LEO";

    //Dynamic-Size Types
    string name2= "Joe";
    bytes name3 = "Adam";
    
    uint[] array  =[1,2,3,4,5];
    mapping (uint => address) list;

    //User-Defined Types
    struct Human{
        uint ID;
        string name;
        uint age;
        address addresss;

    }
    //mapping(uint => Human) list2;

    // Human person1;
    // person1.ID = 12345465;
    // person1.name = "Steve";
    // person1.age=20;
    // person1.addresss = 0x...;


    enum trafficLight{
        RED,
        YELLOW,
        GREEN
    }
    //trafficLight.GREEN;
    
    // 1 wei= 1;
    // 1 ether =10^18 wei;
    // 1 gwei =10^9 wei;


    //STATE VARİABLES
    string public bestClub ="itu blockchain";
    
    
    function show() public pure  returns(uint) {
        //LOCAL VARİABLES
        uint number4 = 17;
         return number4;
    }
    function show2() public view  returns (uint) {
        //global variables
        return block.timestamp;
        
    

         
    


    }
    }
