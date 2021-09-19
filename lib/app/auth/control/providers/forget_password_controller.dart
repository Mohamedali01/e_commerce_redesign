import 'package:e_commerce_app/app/auth/view/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../../constants.dart';

class ForgetPasswordController with ChangeNotifier {
  final _auth = FirebaseAuth.instance;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> resetPassword(String localEmail) async {
    try {
      _isLoading = true;
      notifyListeners();
      print('Mohamed Ali: before reset');

      await _auth.sendPasswordResetEmail(email: localEmail);
      print('Mohamed Ali: after reset');

      Fluttertoast.showToast(
          msg: 'Please check your email!', toastLength: Toast.LENGTH_LONG);
      print('Mohamed Ali: before toast');

      _isLoading = false;
      notifyListeners();
      Get.offAll(WelcomeScreen());
    } on Exception catch (e) {
      print('Mohamed Ali: error occurred');

      _isLoading = false;
      notifyListeners();
      buildSnackBar('Error!', 'Error happened ${e.toString()}');
      Get.offAll(WelcomeScreen());
    }
  }
}
