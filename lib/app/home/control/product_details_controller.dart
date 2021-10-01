import 'package:e_commerce_app/app/home/model/product_model.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class ProductDetailsController with ChangeNotifier {


  /// UI HANDLING
  bool _isReadMore = false;
  int _selectedPage = 0;

  ProductDetailsController() {
    _pageController = PageController(initialPage: 0);
  }


  int get selectedPage => _selectedPage;

  PageController? _pageController;
  PageController? get pageController => _pageController;
  bool get isReadMore => _isReadMore;
  List<bool> _sizes = [false, false, false, false, false];

  List<bool> get sizes => _sizes;

  changeIsReadMore() {
    _isReadMore = !_isReadMore;
    notifyListeners();
  }

  // resetIsReadMore() {
  //   _isReadMore = false;
  //   notifyListeners();
  // }
  //
  _resetSizes() {
    for (int i = 0; i < _sizes.length; i++) {
      _sizes[i] = false;
    }
    notifyListeners();
  }

  resetPage() {
    _pageController = PageController(initialPage: 0);
    _selectedPage = 0;
    _isReadMore = false;
    _resetSizes();
    notifyListeners();
  }

  changeSize(SIZE size) {
    switch (size) {
      case SIZE.SMALL:
        _sizes[0] = true;
        for (int i = 0; i < _sizes.length; i++) {
          if (i != 0) _sizes[i] = false;
        }
        break;
      case SIZE.MEDIUM:
        _sizes[1] = true;
        for (int i = 0; i < _sizes.length; i++) {
          if (i != 1) _sizes[i] = false;
        }
        break;
      case SIZE.LARGE:
        _sizes[2] = true;
        for (int i = 0; i < _sizes.length; i++) {
          if (i != 2) _sizes[i] = false;
        }
        break;
      case SIZE.XLARGE:
        _sizes[3] = true;
        for (int i = 0; i < _sizes.length; i++) {
          if (i != 3) _sizes[i] = false;
        }
        break;
      case SIZE.XXLARGE:
        _sizes[4] = true;
        for (int i = 0; i < _sizes.length; i++) {
          if (i != 4) _sizes[i] = false;
        }
        break;
    }
    notifyListeners();
  }

  changePage(int page) {
    _selectedPage = page;
    notifyListeners();
  }




  /// LOGIC HANDLING
  List<ProductModel> _productModels = [];
  // List<ProductModel> _favoritesModels = [];
  //
  // List<ProductModel> get favoritesModels => _favoritesModels;


  void update(List<ProductModel> list) {
    _productModels = list;
    notifyListeners();
  }
}
