import 'package:e_commerce_app/core/size_config.dart';
import 'package:e_commerce_app/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {

  final BoxConstraints? constraints;


  const SearchWidget({this.constraints});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenHeight * 0.07,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 6,
              spreadRadius: 1),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 10, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  width: constraints!.maxWidth * 0.1,
                  child: Icon(
                    Icons.search,
                    color: Colors.black38,
                    size: 35,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                VerticalDivider(
                  color: Colors.grey.shade300,
                  thickness: 1,
                ),
              ],
            ),
            SizedBox(
              width: constraints!.maxWidth * 0.65,
              child: CustomTextFormField(
                  inputBorder: InputBorder.none,
                  hintText: 'Search Your Product'),
            ),
          ],
        ),
      ),
    );
  }
}

