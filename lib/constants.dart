import 'package:flutter/material.dart';

enum SIZE { SMALL, MEDIUM, LARGE, XLARGE, XXLARGE, XXXLARGE }

enum CATEGORY { MALE, FEMALE, KIDS }

enum GENDER {MALE, FEMALE, KNOWN}

final gradient = LinearGradient(
    colors: [
      Color(0xff65B0FD),
      Color(0xff6684EC)
    ],
    begin: Alignment.topRight,
    end: Alignment.topLeft);