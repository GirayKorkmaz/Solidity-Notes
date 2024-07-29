// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Variables{
    //Fixed-Size Types
    bool isTrue=false;
    int8 number=12;
    uint number2=12;
    address myAdress = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    bytes32 name1 = "itu bc";

    //Dynamic-Size Types
    string name2="itu blokchain";
    bytes name3 ="itu";
    uint[] array =[1,2,3,4,5,6];
    mapping(uint => string)list ;
    //list[3]="alim";

    //User Defined Value
    struct Human{
        uint ID;
        string name;
        uint age;
        address addresss ;
        
    }
    enum trafficLight{
        RED,
        YELLOW,
        GREEN
    }

    //state variables,
    string public bestClub ="itublock";
    function show() public view returns(string memory){
        return bestClub;
    }




    
}