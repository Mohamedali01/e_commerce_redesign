import 'package:flutter/material.dart';


class CustomRoundedButton extends StatelessWidget {
  final double width;
  final Gradient? gradient;
  final Widget? child;
  final Color? color;
  final void Function() onTap;

  CustomRoundedButton(
      {required this.width,
      this.gradient,
      this.child,
      this.color,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          height: 50,
          width: width,
          decoration: BoxDecoration(
            color: color,
            gradient: gradient,
            borderRadius: BorderRadius.circular(10),
          ),
          child: child),
    );
  }
}
