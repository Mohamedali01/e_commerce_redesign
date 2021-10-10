class CartModel {
  // ProductModel? productModel;
  String? cartId;
  String? ownerName;
  String? title;
  String? image;
  int? quantity;
  double? price;
  double? salePrice;

  CartModel(
      {this.cartId,
      this.ownerName,
      this.title,
      this.image,
      this.quantity,
      this.price,
      this.salePrice});

  CartModel.fromJson(Map<dynamic, dynamic>? map) {
    if (map == null)
      return;
    else {
      cartId = map['cartId'];
      ownerName = map['ownerName'];
      title = map['title'];
      image = map['image'];
      quantity = map['quantity'];
      price = map['price'];
      salePrice = map['salePrice'];
    }
  }

  toJson(){
    return{
      'cartId':cartId,
      'ownerName':ownerName,
      'title':title,
      'image':image,
      'quantity':quantity,
      'price':price,
      'salePrice':salePrice,
    };
  }
}
