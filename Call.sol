// SPDX-License-Identifier: MIT
pragma solidity  ^0.8.0;

contract Test{

    uint public total =0;
    string public incrementer;
    uint public fallbackCount =0;

    fallback() external payable {
        fallbackCount ++;
     }

    function inc(uint256 _amount,string memory _incrementer)external returns (uint256){
        total += _amount;
        incrementer=_incrementer;

        return total;
    }
}


contract Caller{

    function testCaller(address _contract,uint256 _amount ,string memory _incrementer)external returns(bool,uint256){
        (bool err,bytes memory res)=_contract.call(abi.encodeWithSignature("inc(uint256,string)", _amount,_incrementer ));//önce fonksiyonun adı ve aldığı parametreler ardından parametrelerin isimlerini yazıyoruzz


        uint256 _total =abi.decode(res,(uint256));//decode etmesini istediğimiz değeri ve hangi türde decode etmesini istediğimizi yazıyoruz.

        return (err,_total);
    }

    function payToFallback(address _contract) external payable {
       (bool err,)= _contract.call{value:msg.value}("");//Bir kontrata düşük seviyeli fonksiyon çağrıları (call, delegatecall veya send) kullanılarak erişildiğinde ve hedef kontratta çağrılan fonksiyon bulunamadığında fallback fonksiyonu tetiklenir.
    

    if (!err) revert(); 
        
    }

}