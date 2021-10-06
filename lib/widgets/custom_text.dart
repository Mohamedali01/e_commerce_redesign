import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontSize;
  final double? width;
  final double? height;
  final bool? lineThrough;
  final int? maxLines;

  CustomText(this.text,
      {this.color,
      this.fontWeight,
      this.fontSize,
      this.width,
      this.height,
      this.lineThrough = false,
      this.maxLines});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Text(
        text,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: color,
          fontWeight: fontWeight,
          fontSize: fontSize,
          decoration: lineThrough == true ? TextDecoration.lineThrough : null,
        ),
      ),
    );
  }
}
