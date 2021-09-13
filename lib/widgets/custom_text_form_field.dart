import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final TextInputType? textInputType;
  final Widget? suffixIcon;
  final bool obscure;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;

  CustomTextFormField(
      {this.label,
      this.textInputType,
      this.suffixIcon,
      this.obscure = false,
      this.validator,
      this.onSaved});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      obscureText: obscure,
      onSaved: onSaved,
      validator: validator,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        labelText: label,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
