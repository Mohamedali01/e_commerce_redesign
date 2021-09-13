import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final TextInputType? textInputType;
  final Widget? suffixIcon;
  final bool obscure;

  CustomTextFormField(
      {this.label, this.textInputType, this.suffixIcon, this.obscure = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      obscureText: obscure,
      decoration: InputDecoration(
          suffixIcon: suffixIcon,
          labelText: label,
          floatingLabelBehavior: FloatingLabelBehavior.always),
    );
  }
}
