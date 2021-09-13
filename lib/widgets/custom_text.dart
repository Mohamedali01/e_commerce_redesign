import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontSize;
  final double? width;
  final double? height;

  CustomText(this.text,
      {this.color, this.fontWeight, this.fontSize, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Text(
        text,
        style:
            TextStyle(color: color, fontWeight: fontWeight, fontSize: fontSize),
      ),
    );
  }
}
