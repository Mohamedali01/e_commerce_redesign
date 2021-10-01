import 'package:e_commerce_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class RowTextWidget extends StatelessWidget {
  final double? defaultSize;
  final String? firstText;
  final String? secondText;
  final void Function()? onTap;

  RowTextWidget({this.defaultSize =10, this.firstText, this.secondText,this.onTap});

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
        InkWell(
          onTap: onTap,
          child: CustomText(
            secondText!,
            fontSize: defaultSize! * 1.8,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
