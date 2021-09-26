import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final TextInputType? textInputType;
  final Widget? suffixIcon;
  final bool obscure;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final InputBorder? inputBorder;
  final String? hintText;

  CustomTextFormField(
      {this.label,
      this.textInputType,
      this.suffixIcon,
      this.obscure = false,
      this.validator,
      this.onSaved
      ,this.inputBorder,
      this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      obscureText: obscure,
      onSaved: onSaved,
      validator: validator,
      style: TextStyle(fontSize: 18),
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: suffixIcon,
        border: inputBorder,

        labelText: label,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
