import 'package:flutter/material.dart';

class LogInController with ChangeNotifier {
  bool _isPassVisible = false;

  bool get isPassVisible => _isPassVisible;

  void togglePassVisibility() {
    _isPassVisible = !_isPassVisible;
    notifyListeners();
  }
}
