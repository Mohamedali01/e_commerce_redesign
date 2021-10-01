import 'package:e_commerce_app/app/home/model/product_model.dart';
import 'package:e_commerce_app/constants.dart';
import 'package:flutter/material.dart';

class HomeController with ChangeNotifier {
  HomeController() {
    favorites();
  }

  List<ProductModel> _productModels = [
    ProductModel(
      color: Colors.blue,
      description: 'A wonderful serenity has taken possession '
          'of my entire soul, like these sweet mornings '
          'of spring which I enjoy with my whole heart. '
          'I am alone, and feel the charm of existence '
          'in this spot, which was created for the bliss '
          'of souls like mine.'
          'A wonderful serenity has taken possession'
          'of my entire soul, like these sweet mornings '
          'of spring which I enjoy with my whole heart. '
          'I am alone, and feel the charm of existence '
          'in this spot, which was created for the bliss '
          'of souls like mine.A wonderful serenity has taken possession '
          'of my entire soul, like these sweet mornings '
          'of spring which I enjoy with my whole heart. '
          'I am alone, and feel the charm of existence '
          'in this spot, which was created for the bliss '
          'of souls like mine.'
          'A wonderful serenity has taken possession'
          'of my entire soul, like these sweet mornings '
          'of spring which I enjoy with my whole heart. '
          'I am alone, and feel the charm of existence '
          'in this spot, which was created for the bliss '
          'of souls like mine.',
      price: 35,
      salePrice: 34,
      category: CATEGORY.MALE,
      size: [SIZE.SMALL, SIZE.MEDIUM, SIZE.LARGE, SIZE.XLARGE],
      rating: 4.8,
      numberOfReviews: 29,
      numberInTheStock: 135,
      numberSold: 122,
      ownerName: 'Ahmed',
      productId: '1',
      productImages: [
        'assets/images/product_sample_1.png',
        'assets/images/product_sample_2.png',
        'assets/images/product_sample_1.png'
      ],
      title: 'Man T-Shirt',
    ),
    ProductModel(
      color: Colors.red,
      description:
          'This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt ',
      price: 55,
      salePrice: 55,
      category: CATEGORY.FEMALE,
      size: [SIZE.SMALL, SIZE.MEDIUM, SIZE.LARGE, SIZE.XLARGE],
      rating: 4.5,
      numberOfReviews: 20,
      numberInTheStock: 35,
      numberSold: 12,
      ownerName: 'Mohamed',
      productId: '2',
      productImages: [
        'assets/images/product_sample_2.png',
        'assets/images/product_sample_1.png',
        'assets/images/product_sample_3.png'
      ],
      title: 'Woman T-Shirt',
    ),
    ProductModel(
      color: Colors.lightBlue,
      description:
          'This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt ',
      price: 34,
      salePrice: 34,
      category: CATEGORY.FEMALE,
      size: [SIZE.SMALL, SIZE.MEDIUM, SIZE.LARGE, SIZE.XLARGE],
      rating: 4.5,
      numberOfReviews: 20,
      numberInTheStock: 35,
      numberSold: 12,
      ownerName: 'Khaled',
      productId: '3',
      productImages: ['assets/images/product_sample_3.png'],
      title: 'Woman T-Shirt',
    ),
    ProductModel(
      color: Colors.blue,
      description:
          'This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt ',
      price: 34,
      salePrice: 34,
      category: CATEGORY.MALE,
      size: [SIZE.SMALL, SIZE.MEDIUM, SIZE.LARGE, SIZE.XLARGE],
      rating: 4.8,
      numberOfReviews: 29,
      numberInTheStock: 135,
      numberSold: 122,
      ownerName: 'Ahmed',
      productId: '4',
      productImages: ['assets/images/product_sample_1.png'],
      title: 'Man T-Shirt',
    ),
    ProductModel(
      color: Colors.red,
      description:
          'This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt ',
      price: 55,
      salePrice: 55,
      category: CATEGORY.FEMALE,
      size: [SIZE.SMALL, SIZE.MEDIUM, SIZE.LARGE, SIZE.XLARGE],
      rating: 4.5,
      numberOfReviews: 20,
      numberInTheStock: 35,
      numberSold: 12,
      ownerName: 'Mohamed',
      productId: '5',
      productImages: ['assets/images/product_sample_2.png'],
      title: 'Woman T-Shirt',
    ),
    ProductModel(
      color: Colors.lightBlue,
      description:
          'This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt This is a very nice shirt ',
      price: 34,
      salePrice: 34,
      category: CATEGORY.FEMALE,
      size: [SIZE.SMALL, SIZE.MEDIUM, SIZE.LARGE, SIZE.XLARGE],
      rating: 4.5,
      numberOfReviews: 20,
      numberInTheStock: 35,
      numberSold: 12,
      ownerName: 'Khaled',
      productId: '6',
      productImages: ['assets/images/product_sample_3.png'],
      title: 'Woman T-Shirt',
    ),
  ];

  List<ProductModel> _favouritesModels = [];

  List<ProductModel> get productModels => _productModels;

  List<ProductModel> get favouritesModels => _favouritesModels;

  void toggleFavourites(String id) {
    _productModels.forEach((element) {
      if (element.productId == id) {
        element.isFav = !element.isFav!;
        notifyListeners();
        favorites();
      }
    });
  }

  List<ProductModel> favorites() {
    List<ProductModel> placeHolder = [];
    _productModels.forEach((element) {
      if (element.isFav!) {
        placeHolder.add(element);
      }
    });
    _favouritesModels = placeHolder;
    notifyListeners();
    return _favouritesModels;
  }
}
