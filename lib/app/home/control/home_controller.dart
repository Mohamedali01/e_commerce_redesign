import 'package:e_commerce_app/app/home/model/product_model.dart';
import 'package:e_commerce_app/constants.dart';
import 'package:flutter/material.dart';

class HomeController with ChangeNotifier {
  List<ProductModel> _productModels = [
    ProductModel(
      color: Colors.blue,
      description: 'This is a very nice shirt',
      price: 34,
      salePrice: 34,
      category: CATEGORY.MALE,
      size: [SIZE.SMALL, SIZE.MEDIUM, SIZE.LARGE, SIZE.XLARGE],
      rating: 4.8,
      numberOfReviews: 29,
      numberInTheStock: 135,
      numberSold: 122,
      ownerName: 'Ahmed',
      productId: 'ahmedId',
      productImage: 'assets/images/product_sample_1.png',
      title:'Man T-Shirt',
    ),
    ProductModel(
      color: Colors.red,
      description: 'This is a very nice shirt',
      price: 55,
      salePrice: 55,
      category: CATEGORY.FEMALE,
      size: [SIZE.SMALL, SIZE.MEDIUM, SIZE.LARGE, SIZE.XLARGE],
      rating: 4.5,
      numberOfReviews: 20,
      numberInTheStock: 35,
      numberSold: 12,
      ownerName: 'Mohamed',
      productId: 'mohamedId',
      productImage: 'assets/images/product_sample_2.png',
      title:'Woman T-Shirt',
    ),
    ProductModel(
      color: Colors.lightBlue,
      description: 'This is a very nice shirt',
      price: 34,
      salePrice: 34,
      category: CATEGORY.FEMALE,
      size: [SIZE.SMALL, SIZE.MEDIUM, SIZE.LARGE, SIZE.XLARGE],
      rating: 4.5,
      numberOfReviews: 20,
      numberInTheStock: 35,
      numberSold: 12,
      ownerName: 'Khaled',
      productId: 'khaledId',
      productImage: 'assets/images/product_sample_3.png',
      title:'Woman T-Shirt',
    ),
  ];

  List<ProductModel> get productModels => _productModels;
}
