import 'package:flutter/cupertino.dart';

class AuthUiController with ChangeNotifier {
  bool _isLoginPassVisible = false;

  bool get isLoginPassVisible => _isLoginPassVisible;

  bool _isSignUpPassVisible = false;

  bool get isSignUpPassVisible => _isSignUpPassVisible;

  bool _isResetPassActive = false;

  bool get isResetPassActive => _isResetPassActive;



  /// Login
  void loginTogglePassVisibility() {
    _isLoginPassVisible = !_isLoginPassVisible;
    notifyListeners();
  }

  /// Sign Up
  void signUpTogglePassVisibility() {
    _isSignUpPassVisible = !_isSignUpPassVisible;
    notifyListeners();
  }

  /// Reset password

  void changeResetPassCheckBox(bool value) {
    _isResetPassActive = value;
    notifyListeners();
  }


}
