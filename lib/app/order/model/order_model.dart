import 'package:e_commerce_app/app/address/model/address_model.dart';
import 'package:e_commerce_app/app/Cart/model/cart_model.dart';

class OrderModel {
  String? userId;
  String? dateTime;
  CartModel? order;
  AddressModel? addressModel;
  double? productsPriceBeforeSale;
  double? productsPriceAfterSale;
  double? shippingPrice;

  OrderModel(
      {this.userId,
      this.dateTime,
      this.order,
      this.addressModel,
      this.productsPriceBeforeSale,
      this.productsPriceAfterSale,
      this.shippingPrice});

  OrderModel.fromJson(Map<dynamic, dynamic>? map) {
    if (map == null)
      return;
    else {
      userId = map['userId'];
      dateTime = map['dateTime'];
      order = map['order'];
      addressModel = map['addressModel'];
      productsPriceBeforeSale = map['productsPriceBeforeSale'];
      productsPriceAfterSale = map['productsPriceAfterSale'];
      shippingPrice = map['shippingPrice'];
    }
  }

  toJson() {
    return {
      'userId': userId,
      'dateTime': dateTime,
      'order': order,
      'addressModel': addressModel,
      'productsPriceBeforeSale': productsPriceBeforeSale,
      'productsPriceAfterSale': productsPriceAfterSale,
      'shippingPrice': shippingPrice,
    };
  }
}
