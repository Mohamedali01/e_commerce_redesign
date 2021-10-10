import 'package:e_commerce_app/app/home/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'app/Cart/model/cart_model.dart';
import 'app/address/model/address_model.dart';

const kPrimaryColor = 0xff667EEA;
const kBlackColor = 0xff565656;

final appBar = AppBar(
  leading: Padding(
    padding: const EdgeInsets.all(8.0),
    child: InkWell(
      onTap: () {
        Get.offAll(HomeScreen());
      },
      child: Image.asset(
        'assets/images/left_arrow.png',
        scale: 1.8,
      ),
    ),
  ),
  backgroundColor: Colors.white,
  elevation: 0.0,
);

enum SIZE { SMALL, MEDIUM, LARGE, XLARGE, XXLARGE }

enum CATEGORY { MALE, FEMALE, KIDS }

enum GENDER { MALE, FEMALE, KNOWN }

final gradient = LinearGradient(
    colors: [Color(0xff65B0FD), Color(0xff6684EC)],
    begin: Alignment.topRight,
    end: Alignment.topLeft);

buildSnackBar(String title, String text) {
  Get.snackbar(
    title,
    text,
    colorText: Colors.white,
    backgroundColor: Colors.red,
    duration: Duration(
      seconds: 4,
    ),
  );
}

final color = Colors.blueAccent;

buildFlutterToast(String msg) {
  Fluttertoast.showToast(msg: msg, backgroundColor: Colors.grey);
}
String userId = '';
String password = '';
String name = '';
String email = '';
String phoneNumber = '';
String gender = 'KNOWN';
List<AddressModel>? addressModel;
List<CartModel> cartModels = [
  CartModel(
      title: 'Shirt',
      ownerName: 'Mohamed',
      price: 25,
      salePrice: 15,
      image: 'assets/images/product_sample_1.png',
      cartId: '1',
      quantity: 10),
  CartModel(
      title: 'Shirt',
      ownerName: 'Mohamed',
      price: 50,
      salePrice: 15,
      image: 'assets/images/product_sample_2.png',
      cartId: '2',
      quantity: 19),
  CartModel(
      title: 'Jacket',
      ownerName: 'Mohamed',
      price: 100,
      salePrice: 15,
      image: 'assets/images/product_sample_3.png',
      cartId: '3',
      quantity: 10),
  CartModel(
      title: 'Shirt',
      ownerName: 'Mohamed',
      price: 200,
      salePrice: 15,
      image: 'assets/images/product_sample_1.png',
      cartId: '4',
      quantity: 20),
  CartModel(
      salePrice: 15,
      title: 'Shirt',
      ownerName: 'Mohamed',
      price: 25,
      image: 'assets/images/product_sample_1.png',
      cartId: '1',
      quantity: 10),
  CartModel(
      salePrice: 15,
      title: 'Shirt',
      ownerName: 'Mohamed',
      price: 50,
      image: 'assets/images/product_sample_2.png',
      cartId: '2',
      quantity: 19),
  CartModel(
      salePrice: 15,
      title: 'Jacket',
      ownerName: 'Mohamed',
      price: 100,
      image: 'assets/images/product_sample_3.png',
      cartId: '3',
      quantity: 10),
  CartModel(
      salePrice: 15,
      title: 'Shirt',
      ownerName: 'Mohamed',
      price: 200,
      image: 'assets/images/product_sample_1.png',
      cartId: '4',
      quantity: 20),
  CartModel(
      salePrice: 15,
      title: 'Shirt',
      ownerName: 'Mohamed',
      price: 25,
      image: 'assets/images/product_sample_1.png',
      cartId: '1',
      quantity: 10),
  CartModel(
      salePrice: 15,
      title: 'Shirt',
      ownerName: 'Mohamed',
      price: 50,
      image: 'assets/images/product_sample_2.png',
      cartId: '2',
      quantity: 19),
  CartModel(
      salePrice: 15,
      title: 'Jacket',
      ownerName: 'Mohamed',
      price: 100,
      image: 'assets/images/product_sample_3.png',
      cartId: '3',
      quantity: 10),
  CartModel(
      salePrice: 15,
      title: 'Shirt',
      ownerName: 'Mohamed',
      price: 200,
      image: 'assets/images/product_sample_1.png',
      cartId: '4',
      quantity: 20),
];


// CartTable
final String cartTable = 'cart';
final String columnId = 'cartId';
final String columnName = 'name';
final String columnImage = 'image';
final String columnPrice = 'price';
final String columnQuantity = 'quantity';
