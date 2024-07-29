// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Functions{
    //Public:Hem dışarıdan hem de kontrat çağırabilir.

function add(uint a, uint b) public pure returns(uint){
    return a+b;
}
function add2(uint c,uint d)public pure returns(uint){
    return add(c,d);
}
function publicKeyword() public pure returns (string memory){
    return "Bu bir public fonksiyondur";
    }
function callPublicKeyword() public pure returns(string memory){
    return publicKeyword();
}

//Private :Sadece kontrat çağırabilir dışarıdan çağırılamaz

function privateKeyword() private pure returns (string memory){
    return "Bu bir private fonksiyondur";
}
function callPrivateKeyword() public pure returns(string memory){
    return privateKeyword();
}

//Internal: Sadece miras alan kontrat çağırabilir dışarıdan çağırılamaz.

 function internalKeyword() internal pure returns(string memory) {
        return "bu bir internal fonskiyondur...";
    }

    function callInternalKeyword() public pure returns(string memory) {
        return internalKeyword();
    }

     // External : Burada ise dışarıdan kullanıcalar çağırabilir fakat kontrat içerisnde çağırlmaz.

    function externalKeyword() external pure returns(string memory) {
        return "bu bir external fonskiyondur...";
    }

    /*function callExternalKeyword() public pure returns(string memory) {
        return externalKeyword(); Bu fonksiyon çalışmaz.Çünkü external fonksiyonlar kontrat tarafından çağırılamaz */ 
    }
    

