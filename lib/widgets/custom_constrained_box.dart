import 'package:flutter/material.dart';

class CustomConstrainedBox extends StatelessWidget {
  final double minHeight;
  final double minWidth;
  final Widget? child;

  CustomConstrainedBox(
      {required this.minHeight, required this.minWidth, this.child});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: minHeight,
        minWidth: minWidth,
      ),
      child: IntrinsicHeight(child: child),
    );
  }
}
