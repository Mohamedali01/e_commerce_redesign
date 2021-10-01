import 'package:e_commerce_app/core/size_config.dart';
import 'package:e_commerce_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';


class SizeContainerWidget extends StatelessWidget {
  final double? defaultSize;
  final String? size;
  final void Function()? onTap;
  final bool? isActive;

  const SizeContainerWidget(
      {required this.defaultSize,
      required this.size,
      this.isActive,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: isActive! ? Color(kPrimaryColor) : Color(0xffF3F3F3),
            borderRadius: BorderRadius.circular(5)),
        height: SizeConfig.screenWidth * 0.12,
        width: SizeConfig.screenWidth * 0.12,
        child: Center(
          child: FittedBox(
            child: CustomText(
              size!,
              color: isActive! ? Colors.white : Colors.black,
              fontSize: defaultSize! * 1.9,
            ),
          ),
        ),
      ),
    );
  }
}
