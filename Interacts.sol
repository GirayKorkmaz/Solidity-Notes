//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Interact {
    address public caller;
    mapping(address => uint256) public counts;

    function callThis() external {
        caller = msg.sender;
        counts[msg.sender]++;
    }
}

contract Pay {
    mapping(address => uint256) public userBalances;

    // receive,  fallback

    function payEth(address _payer) external payable {
        userBalances[_payer] += msg.value;
    }
}

   //!!Adreslerin farklı gözükme sebebi ----->>>  // msg.sender -> A (mesaj yollayan: msg.sender) -> B (mesaj yollayan: A adresi)  

contract Caller {
    Interact interact;//Interact interact değişkenini bir kontrat adresi ile başlatmadığınız sürece bu değişken null olur ve işlevsellik kazanamaz. 
    
    constructor(address _interactContract) {
        interact = Interact(_interactContract);//_interactContract sadece bir adrestir ve bu adresin hangi kontrata ait olduğu hakkında bilgi vermez. Bu adresin Interact kontratına ait olduğunu belirtmek ve onun fonksiyonlarına erişmek için adresi Interact tipi olarak kastetmemiz gerekir. Bu yüzden Interact(_interactContract) ifadesini kullanıyoruz.
    }//_interactContract adresi, Interact kontratının dağıtıldığı adresi belirtir. Ancak, bu adresin Interact kontratına ait olduğunu belirtmek yeterli değildir; bu adresin fonksiyonlarına ve verilere erişmek için onu Interact türünde bir değişkene dönüştürmemiz gerekir.

    function callInteract() external {
        interact.callThis();//Caller kontratı, Interact kontratındaki callThis fonksiyonunu çağırdığında, msg.sender Caller kontratının adresi olur.
    }

    function readCaller() external view returns (address) {
        return interact.caller();
    }

    function readCallerCount() public view returns (uint256) {
        return interact.counts(msg.sender);/*callInteract çağrıldığında Interact kontratındaki msg.sender Caller kontratının adresi olur.
readCallerCount fonksiyonunda msg.sender sizin adresinizdir, bu yüzden 0 döner.*/
    }
    function payToPay(address _payAddress)public payable{
        Pay pay=Pay(_payAddress);//Tüm kontrat boyunca sabit bir kontrat adresiyle erişim yapılacaksa constructor içinde erişimi kullanmalıyız
        pay.payEth{value:msg.value}(msg.sender);//Belli bir adres için değil herkesin işlem yapabilmesi için parametremizi msg.sender yapıyoruz.
        Pay(_payAddress).payEth{value:msg.value}(msg.sender);    //msg.sender'dan msg.value kadar alınan değer _payAddress'deki kontrata gönderiliyor.
    }
    function sendEthByTransfer() public payable{
        payable(address(interact)).transfer(msg.value);//Bu durumda interact bir Interact kontrat örneğidir, ve address(interact) ifadesi, bu örneğin bağlı olduğu adresi döndürür.address(interact), Interact kontratının blockchain üzerindeki adresini ifade eder. sendEthByTransfer fonksiyonunda bu ifadeyi kullanarak, Caller kontratına gönderilen Ether'i Interact kontratına transfer ediyorsunuz.
        //Interact kontratının blockchain üzerinde konuşlandırıldığı (deployed) adresdir. Yani, Interact kontratının kurulduğu ve tüm verilerinin saklandığı yerdir.
    }
    //Caller kontratından Interact kontratına msg.value kadar değer transfer edilir.


    
    
   }