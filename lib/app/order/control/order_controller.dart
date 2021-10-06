import 'package:e_commerce_app/app/address/model/address_model.dart';
import 'package:e_commerce_app/app/order/model/order_model.dart';
import 'package:e_commerce_app/app/order/view/order_screen.dart';
import 'package:e_commerce_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderController with ChangeNotifier {
  List<OrderModel> _orderModels = [];

  List<OrderModel> get orderModels => _orderModels;

  // void update(List<CartModel> cartModels) {
  //   cartModels = cartModels;
  //   print('Mohamed Ali ${cartModels!.length}');
  //   notifyListeners();
  // }

  double calculateOrderBeforeSale() {
    double count = 0.0;
    cartModels.forEach((element) {
      count += element.price!;
    });
    return count;
  }

  double calculateOrderAfterSale() {
    double count = 0.0;
    cartModels.forEach((element) {
      count += element.salePrice!;
    });
    return count;
  }

  void addOrder() {
    bool found = false;
    for (int i = 0; i < cartModels.length; i++) {
      found = false;
      for (int j = 0; j < _orderModels.length; j++) {
        if (cartModels[i].cartId == _orderModels[j].order!.cartId) {
          _orderModels[j].order!.quantity =
              _orderModels[j].order!.quantity! + cartModels[i].quantity!;
          found = true;
          break;
        }
      }
      if (!found) {
        _orderModels.add(OrderModel(
            addressModel: AddressModel(
                area: '',
                city: '',
                country: '',
                numberOfHouse: 23,
                numberOfRoad: 12),
            dateTime: DateTime.now().toString(),
            order: cartModels[i],
            productsPriceAfterSale: calculateOrderAfterSale(),
            productsPriceBeforeSale: calculateOrderBeforeSale(),
            shippingPrice: 0.1 * calculateOrderAfterSale(),
            userId: userId));
        notifyListeners();
      }
    }
    Get.to(OrderScreen());
    cartModels = [];
    notifyListeners();
  }
}
