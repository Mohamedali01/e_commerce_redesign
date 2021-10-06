import 'package:e_commerce_app/constants.dart';
import 'package:flutter/material.dart';

class ProductModel {
  String? productId;
  String? ownerName;
  String? title;
  String? description;
  List<String>? productImages;
  double? price;
  double? salePrice;
  double? rating;
  int? numberOfReviews;
  int? numberInTheStock;
  int? numberSold;
  bool isFav = false;
  bool inCart = false;
  Color? color;
  List<SIZE>? size;
  CATEGORY? category;

  ProductModel(
      {this.productId,
      this.ownerName,
      this.title,
      this.description,
      this.productImages,
      this.price,
      this.salePrice,
      this.rating,
      this.numberOfReviews,
      this.numberInTheStock,
      this.numberSold,
      this.isFav = false,
      this.inCart = false,
      this.color,
      this.size,
      this.category});

  ProductModel.fromJson(Map<dynamic, dynamic>? map) {
    if (map == null)
      return;
    else {
      productId = map['productId'];
      ownerName = map['ownerName'];
      title = map['title'];
      description = map['description'];
      productImages = map['productImage'];
      price = map['price'];
      salePrice = map['salePrice'];
      rating = map['rating'];
      numberOfReviews = map['numberOfReviews'];
      numberInTheStock = map['numberInTheStock'];
      numberSold = map['numberSold'];
      color = map['color'];
      size = map['size'];
      category = map['category'];
    }
  }
}
