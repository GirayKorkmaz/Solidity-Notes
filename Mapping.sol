//SPDX-License-Identifier:Unlicensed
pragma solidity ^0.8.0;

contract Mapping{
    mapping(address => bool) public registered;
    mapping(address => int256) public favNums;

    function register(int256 _favNum) public {
        //require(!registered[msg.sender], "Kullanıcınız daha önce kayıt yaptı.");
        require(!isRegistered(), "Kullaniciniz daha once kayit yapti.");
        registered[msg.sender] = true;
        favNums[msg.sender] = _favNum;
    }

    function isRegistered() public view returns (bool) {
        return registered[msg.sender];
    }
     function deleteRegistered() public {
        require(isRegistered(), "Kullaniciniz kayitli degil.");
        delete (registered[msg.sender]);
        delete (favNums[msg.sender]);
    }
}
