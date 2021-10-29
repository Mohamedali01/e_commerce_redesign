import 'package:e_commerce_app/core/size_config.dart';
import 'package:flutter/material.dart';


class CustomRoundedButton extends StatelessWidget {
  final double? width;
  final Gradient? gradient;
  final Widget? child;
  final Color? color;
  final void Function() onTap;

  CustomRoundedButton(
      { this.width,
      this.gradient,
      this.child,
      this.color,
      required this.onTap});

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: onTap,
      child: Container(
          height: SizeConfig.screenHeight *0.06,
          width: width,
          decoration: BoxDecoration(
            color: color,
            gradient: gradient,
            borderRadius: BorderRadius.circular(5),
          ),
          child: child),
    );
  }
}
