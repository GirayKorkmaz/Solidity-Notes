//SPDX-License-Identifier:Unlicensed
pragma solidity ^0.8.0;

contract Bank {
    mapping(address=>uint)balances;

    function SendEtherToContract() external payable{ //---> Kontrata para gönderebilmek için kontratın payable olarak işaretlenmesi lazım 
        balances[msg.sender]=msg.value;
    }
    function showBalances()external view returns(uint){
        return balances[msg.sender];
    }
    // function withDraw()external{
    //      payable (msg.sender).transfer(balances[msg.sender]); //----> Burada ise para çekmek için alıcının payable olarak işaretlenmesi lazım
    //     balances[msg.sender] = 0;
    // }

    function withDraw(address payable to,uint amount) external{
        // require(balances[msg.sender]>=amount, "Yetersiz bakiye"); --> Transfer fonksiyonu bunun kontrolünü yapıyor ve yetersiz bakiye olması durumunda revert döndürüyor.
        to.transfer(amount);
        balances[msg.sender]-=amount;//parayı göndermek isteyen msg.sender dan alıcı "to" ya para gönderdiğimizde göndericimizden paranın azalması lazım 
    }
    //Transfer ---> Revert 
    //Send ---> true,false 
     // Call --> bool, data


    //Transfer ile yaptığımız işlemin Send ile gösterimi
    function withDrawwithSend(address payable to,uint  amount)external returns(bool){
        bool oK = to.send(amount);
        balances[msg.sender]-=amount;
        return oK;   
}
    //Transfer ile yaptığımız işlemin call ile gösterimi
    function withDrawwithCall(address payable to,uint amount)external payable returns(bool){
        (bool sent,/*bytes memory data*/) =to.call{value: amount}("");
        balances[msg.sender]-=amount;
        return sent;
    }
    
    uint public receiveCount =0;
    uint public fallbackCount =0;

    receive() external payable{
        receiveCount++;
    }//-----------------------------> Receive ve fallback fonksiyonlarının tanımlı olmadığı bir yerde bir kontrata direkt olarak ether gönderemiyoruz

    fallback() external payable { //Calldata kısmında data göndermek için  fallback fonksiyonuna ihtiyacımız var.
        fallbackCount ++;
}//Eğer kontratta sadece fallback var ise data göndermeden de ether transferi fallback fonksiyonu ile yapılabiliyor.




}