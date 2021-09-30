import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';


const kPrimaryColor = 0xff667EEA;



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
