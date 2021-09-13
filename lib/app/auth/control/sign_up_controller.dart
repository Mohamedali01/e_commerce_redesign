import 'package:flutter/material.dart';

class SignUpController with ChangeNotifier {
  bool _isPassVisible = false;
bool get isPassVisible => _isPassVisible;
  void togglePassVisibility() {
    _isPassVisible = !_isPassVisible;
    notifyListeners();
  }
}
