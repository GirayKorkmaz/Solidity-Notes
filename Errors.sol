//SPDX-License-Identifier:Unlicensed
pragma solidity ^0.8.0;

contract Errors{
    uint256 public totalBalance;
    mapping(address=>uint256) public userBalance;
    error ExceedingAmount(address _user , uint256 exceedAmount);
    error Deny(string reason);
    receive() external payable {
        revert Deny("Direkt odeme yapilamaz.");
     }
     fallback() external payable {
         revert Deny("Direkt odeme yapilamaz.");

      }


    function pay()noZero(msg.value) external payable {
        require(msg.value==1 ether,"Sadece 1 ether girisi yapilabilir.");
        
        totalBalance+=1 ether; 
        userBalance[msg.sender]+=1 ether;

    }
    function withDraw(uint256 _amount) noZero(_amount) external{
        // require(userBalance[msg.sender]>=_amount, "Yetersiz bakiye ");
        uint256 initialBalance =totalBalance;

        if (userBalance[msg.sender]<_amount) {
           // revert("Yetersiz bakiye");
           revert ExceedingAmount(msg.sender,_amount-userBalance[msg.sender]);
        }
        totalBalance -=_amount;
        userBalance[msg.sender]-=_amount;
        payable(msg.sender).transfer(_amount);
        assert(totalBalance<initialBalance);
        

    }
    modifier noZero(uint256 _amount){
        require(_amount !=0);
        _;
    }

}