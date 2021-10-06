import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/core/size_config.dart';
import 'package:e_commerce_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class EmptyScreen extends StatelessWidget {
  final String? text;
  final double? fontSize;

  EmptyScreen({this.text, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.screenHeight * 0.7,
      child: Expanded(
        child: Center(
          child: CustomText(
            text!,
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}
