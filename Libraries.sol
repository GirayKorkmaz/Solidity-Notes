//SPDX-License-Identifier:Unlicensed
pragma solidity ^0.8.0;

library Math {
    
    function plus(uint x ,uint y )public pure returns (uint){
        return  x+y ;
    }
    function minus( uint x, uint y) public pure returns (uint) {
        return x-y ;
        }
    function multi(uint x, uint  y) public pure returns ( uint) {
        return x*y;
         }
    function divide(uint x ,uint y)public pure returns(uint){
         require(y!=0,"Tanimsiz deger");
        return x/y;
    }
      function min(uint x, uint y) public pure returns(uint) {
        if( x <= y){
            return x;
        }else {
            return y;
        }
    }
     function max(uint x, uint y) public pure returns(uint) {
        if( x >= y){
            return x;
        }else {
            return y;
        }
    }

}
  library Search{
            function indexOf(uint[] memory list,uint data )public pure returns (uint){
                for (uint i=0; i<list.length; i++) {
                    if (list[i]==data) {
                        return i;
                    }
                }
                return list.length;
            }
         }
   
        contract Library{

        using Math for uint;
        using Search for uint[];


        function trialornek(uint[] memory x,uint y)public pure returns(uint){
            return Search.indexOf(x,y);
            //return x.indexOf(y); using Search for uint [] kullanıldığında bu kullanılır

        }

        function trial1(uint x,uint y) public pure returns(uint){
            //return x.plus(y); ----> bunu using math for uint yazdığımız zaman kullanıyoruz 
            return Math.plus(x,y);
        }
        
        function trial2(uint x,uint y) public pure returns(uint) {
            return Math.minus(x,y);
        }
        function trial3( uint x, uint y) public pure returns(uint) {
            return Math.multi(x,y);
         }
         function trial4( uint x, uint y) public pure returns( uint) {
            return Math.divide(x,y);
         }
         function trial5( uint x, uint y) public pure returns( uint) {
            return Math.min(x,y);
         }
         function trial6( uint x, uint y) public pure returns( uint) {
            return Math.max(x,y);
         }
    }
  
library Human{
    struct Person{
        uint age;
    }
    function birthday(Person storage _person)public{
        _person.age+=1;
    }
    function showAge(Person storage _person) public view returns (uint){
        return _person.age;
    }
}

    contract HumanContract{
        mapping(uint =>Human.Person) public people;
    
        function newYear()public{
            Human.birthday(people[0]);
        }
        function getAge()public view returns(uint){
            return Human.showAge(people[0]);
        } 
}




    
    
       
            

         
         




    

    
   