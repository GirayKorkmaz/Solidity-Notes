//SPDX-License-Identifier:Unlicensed
pragma solidity ^0.8.0;
contract NestedMapping{
    mapping(address=>mapping(address=>uint256))public debts;

     function incDebt(address _borrower, uint256 _amount) public {
        debts[msg.sender][_borrower] += _amount;
    }
     function decDebt(address _borrower, uint256 _amount) public {
        require(debts[msg.sender][_borrower]>=_amount,"Not enough debt");
        debts[msg.sender][_borrower] -= _amount;
        
    }
    function getDebt()public view returns(uint256){
        return debts[msg.sender][msg.sender];
    }

    
}
