import 'package:e_commerce_app/app/Cart/model/cart_model.dart';
import 'package:e_commerce_app/app/home/view/home_screen.dart';
import 'package:e_commerce_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce_app/constants.dart';

class CartController with ChangeNotifier {

  deleteCartItem(String id) {
    for (int i = 0; i < cartModels.length; i++) {
      if (cartModels[i].cartId == id) {
        cartModels.removeAt(i);
        notifyListeners();
        break;
      }
    }
  }

  addCartItem(CartModel cartModel) {
    bool found = false;
    cartModels.forEach((element) {
      if (element.cartId == cartModel.cartId) {
        found = true;
        buildFlutterToast('Product already exists in the cart!');
      }
    });
    if (!found) {
      cartModels.add(cartModel);
      notifyListeners();
      buildFlutterToast('Product added successfully!');
      Get.offAll(HomeScreen());
    }
  }

  increaseQuantity(String id) {
    for (int i = 0; i < cartModels.length; i++) {
      if (cartModels[i].cartId == id) {
        cartModels[i].quantity = cartModels[i].quantity! + 1;
        notifyListeners();
        break;
      }
    }
  }

  decreaseQuantity(String id) {
    for (int i = 0; i < cartModels.length; i++) {
      if (cartModels[i].cartId == id) {
        if (cartModels[i].quantity! > 0) {
          cartModels[i].quantity = cartModels[i].quantity! - 1;
          notifyListeners();
          break;
        }
      }
    }
  }
}
