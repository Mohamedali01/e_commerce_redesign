import 'package:e_commerce_app/app/Cart/model/cart_model.dart';
import 'package:flutter/material.dart';

class CartController with ChangeNotifier {
  List<CartModel> _cartModels = [
    CartModel(
        title: 'Shirt',
        ownerName: 'Mohamed',
        price: 25,
        image: 'assets/images/product_sample_1.png',
        cartId: '1',
        quantity: 10),
    CartModel(
        title: 'Shirt',
        ownerName: 'Mohamed',
        price: 50,
        image: 'assets/images/product_sample_2.png',
        cartId: '2',
        quantity: 19),
    CartModel(
        title: 'Jacket',
        ownerName: 'Mohamed',
        price: 100,
        image: 'assets/images/product_sample_3.png',
        cartId: '3',
        quantity: 10),
    CartModel(
        title: 'Shirt',
        ownerName: 'Mohamed',
        price: 200,
        image: 'assets/images/product_sample_1.png',
        cartId: '4',
        quantity: 20),
  ];

  List<CartModel> get cartModels => _cartModels;

  deleteCartItem(String id) {
    for (int i = 0; i < _cartModels.length; i++) {
      if (_cartModels[i].cartId == id) {
        _cartModels.removeAt(i);
        notifyListeners();
        break;
      }
    }
  }

  increaseQuantity(String id) {
    for (int i = 0; i < _cartModels.length; i++) {
      if (_cartModels[i].cartId == id) {
        _cartModels[i].quantity = _cartModels[i].quantity! + 1;
        notifyListeners();
        break;
      }
    }
  }

  decreaseQuantity(String id) {
    for (int i = 0; i < _cartModels.length; i++) {
      if (_cartModels[i].cartId == id) {
        _cartModels[i].quantity = _cartModels[i].quantity! - 1;
        notifyListeners();
        break;
      }
    }
  }
}
