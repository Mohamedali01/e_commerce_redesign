import 'package:e_commerce_app/constants.dart';
import 'package:flutter/material.dart';

class ProductModel {
  String? productId;
  String? ownerName;
  String? title;
  String? description;
  String? productImage;
  double? price;
  double? salePrice;
  double? rating;
  int? numberOfReviews;
  Color? color;
  List<SIZE>? size;
  List<CATEGORY>? category;

  ProductModel(
      {this.productId,
      this.ownerName,
      this.title,
      this.description,
      this.productImage,
      this.price,
      this.salePrice,
      this.rating,
      this.numberOfReviews,
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
      productImage = map['productImage'];
      price = map['price'];
      salePrice = map['salePrice'];
      rating = map['rating'];
      numberOfReviews = map['numberOfReviews'];
      color = map['color'];
      size = map['size'];
      category = map['category'];
    }
  }
}
