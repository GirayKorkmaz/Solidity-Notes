// SPDX-License-Identifier: MIT
pragma solidity  ^0.8.0;

contract vaultFactory{
    mapping(address =>Vault[]) public userVaults;

function createVault()external{ 
    Vault vault =new Vault(msg.sender);//buradaki instance msg.sender ın oluşturduğu Vault kontratının adresini tutar .Yeni Vault kontratı oluşturulurken msg.sender (_owner olarak) kontratın sahibi olarak atanır. Yani, createVault fonksiyonunu kim çağırdıysa, bu adres Vault'un sahibi olur.
    userVaults[msg.sender].push(vault); //msg.sender ın oluşturduğu vault instancenın(yeni kontratların) saklanması için vaults instanceını Vault arrayine push ediyoruz.
}

function createVoultWithPayment()external payable{// ödeme alınıp kontrat oluşturan fonksiyonumuz
    Vault vault =new Vault{value:msg.value}(msg.sender);
    userVaults[msg.sender].push(vault);
}

}


contract Vault{
    address public owner;
    uint256 private balance;

    constructor(address _owner) payable { //Eğer kontrat oluşturulurken ona Ether gönderilmesi gerekiyorsa, constructor'ın payable olması zorunludur.
        owner = _owner;
        balance +=msg.value;
    }

    receive() external payable{
        balance+=msg.value;
    }

    fallback() external payable{
        balance+=msg.value;
    }

    function getBalance()external view returns (uint256) {
        return balance;
    }

    function deposit()external payable{
        balance+= msg.value;
    }

    function withDraw(uint256 _amount) external {
        require(msg.sender ==owner,"You are not authorized");
        balance -= _amount;
        payable(owner).transfer(_amount);
    }
}