import 'package:e_commerce_app/core/size_config.dart';
import 'package:e_commerce_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomListTileWidget extends StatelessWidget {
  final double? height;
  final String? titleText;
  final String? trailingText;
  final Color? color;

  CustomListTileWidget({this.height, this.titleText, this.trailingText,this.color});

  @override
  Widget build(BuildContext context) {
    final defaultSize = SizeConfig.defaultSize;

    return SizedBox(
      height: height,
      child: ListTile(
        title: CustomText(
          titleText!,
          color: color,
          fontSize: defaultSize * 1.8,
        ),
        trailing: CustomText(
          trailingText!,
          fontSize: defaultSize * 1.5,
        ),
      ),
    );
  }
}
