//SPDX-License-Identifier:Unlicensed
pragma solidity ^0.8.20;

contract StructEnum{
    
    enum Status {
    Taken,//0
    Preparing,//1
    Boxed,//2
    Shipped//3
     }

    struct Order{
        address customer;
        string zipCode;
        uint256[] products;
       // uint256 status alttaki yerine bunu da yazabiliriz.
        Status status;
    }
  
    Order[]public orders;
    address public owner;
    uint256 public txCount;

    event OrderCreated(uint256 _orderId, address indexed customer);
    event zipChanged(uint256 _orderId,string _zipCode);

      constructor() {
        owner = msg.sender;}


    function siparisOlustur(string memory _zipCode, uint256[] memory _products)checkProducts(_products)incTx external returns(uint256){
        // require(_products.length>0, "No products");
        Order memory order ;
        order.customer= msg.sender;
        order.products=_products;
        order.zipCode=_zipCode;
        order.status=Status.Taken;
        orders.push(order);
        emit OrderCreated(orders.length - 1,msg.sender);

    // orders.push(
        //     Order({
        //         customer: msg.sender,
        //         zipCode: _zipCode,---------------------->2.yöntem
        //         products: _products,
        //         status: Status.Taken
        //     })
        // );
        // orders.push(Order(msg.sender,_zipCode,_products,Status.Taken));
        return orders.length - 1; // 0 1 2 3
    }

        function siparisiIlerlet(uint256 _orderId)checkOrderId(_orderId) OnlyOwner external{
            // require(owner==msg.sender,"You are not authorized ");
            // require(_orderId<orders.length,"Not a valid id");

            Order storage order =orders[_orderId];
              require(order.status != Status.Shipped, "Order is already shipped.");
            if (order.status==Status.Taken) {
                order.status=Status.Preparing;
            } else if(order.status ==Status.Preparing) {
                order.status=Status.Boxed;
            }else if(order.status == Status.Boxed){
                order.status==Status.Shipped;
                }
        }
        function siparisiGor(uint256 _orderId)checkOrderId(_orderId) external view returns (Order memory) {
        //require(_orderId < orders.length, "Not a valid order id."); 
          return orders[_orderId];
}
    function zipiGuncelle(uint256 _orderId,string memory _zip)checkOrderId(_orderId) OnlyCustomer(_orderId) incTx external {
        // require(_orderId <orders.length,"Not a valid order id");
        Order storage order= orders[_orderId];
        //  require(order.customer==msg.sender, "You are not the owner of the order ");
     order.zipCode=_zip;
     emit zipChanged(_orderId, _zip);
    }
    modifier checkProducts(uint256[] memory _products){
        require(_products.length>0, "No products");
        _;
    }
    modifier checkOrderId(uint256 _orderId){
        require(_orderId<orders.length,"Not a valid id"); //-----> Burada önce modifier sonra fonksiyon çalışacak
        _;

    }
    modifier incTx{
        _;         // ----------> Burada da fonksiyon önce çalışacak sonrasında modifierımız çalışacak
        txCount++;
    }
    modifier OnlyOwner(){
        require(owner==msg.sender,"You are not authorized ");
         _;
    }
    modifier OnlyCustomer(uint256 _orderId){
        require(orders[_orderId].customer==msg.sender, "You are not the owner of the order ");
        _;


    }
}