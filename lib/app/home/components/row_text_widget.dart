import 'package:e_commerce_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class RowTextWidget extends StatelessWidget {
  final double? defaultSize;
  final String? firstText;
  final String? secondText;

  RowTextWidget({this.defaultSize, this.firstText, this.secondText});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          firstText!,
          fontSize: defaultSize! * 2.4,
          color: Colors.black87,
        ),
        CustomText(
          secondText!,
          fontSize: defaultSize! * 1.8,
          color: Colors.black87,
        ),
      ],
    );
  }
}
