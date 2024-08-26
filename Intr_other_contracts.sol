// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Interact{
    address public caller;
    mapping(address=> uint) public counts;

    function callThis() external{
        caller=msg.sender;
        counts[msg.sender]++;
    }

}

contract Pay{
    mapping(address => uint256) public userBalances;
    
    function payEth(address _payer)external payable{
        userBalances[_payer]+=msg.value;
    }

}

contract Caller{
    
    Interact interact;

    constructor(address _interactContractAddress){
        interact=Interact(_interactContractAddress);
    }

    function callInteract()external{
        interact.callThis();
    }
    function readCaller()external view returns (address){
        return interact.caller();
    }

    function readCallerCount()external view returns (uint){
        return interact.counts(msg.sender);
}
    function payToPay(address _payContractAddress)external payable {
        Pay pay =Pay(_payContractAddress);
        pay.payEth{value:msg.value}(msg.sender);//msg.sender payer yerine geçiyor
        //Pay(payContractAddress).payEth{value:msg.value}(msg.sender);//Belli bir değişkene atamadan kullanımı
}
    function sendEtherByTransfer()external payable{
        payable(address(interact)).transfer(msg.value);
    }
}