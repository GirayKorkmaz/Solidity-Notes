// SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.0;

contract Loops {
    uint256[15] public numbers0;
    uint256[15] public numbers1;
     function listByFor() public {
        uint256[15] memory nums=numbers0;
       

        for (uint256 i=0; i<nums.length ; i++) {
            if (i==9) break ; 
            if (i==9) continue ; 
            nums[i]=i;

        }
         numbers0=nums;
       
     }
        function getArr0() public view returns (uint256[15] memory) {
    return numbers0;
    }
     }