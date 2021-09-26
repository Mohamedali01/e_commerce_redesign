import 'package:e_commerce_app/core/size_config.dart';
import 'package:e_commerce_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  final double? defaultSize;
  final String? image;
  final String? categoryName;
  final Color? color;

  CategoryWidget({this.defaultSize, this.image, this.categoryName
    ,this.color
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.screenWidth * 0.35,
      height: SizeConfig.screenHeight*0.1,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Stack(
          children: [
            Image.asset(
              image!,
              fit: BoxFit.fill,
            ),
            Container(
              color: color,
              width: SizeConfig.screenWidth * 0.35,
              height: SizeConfig.screenHeight*0.1,

            ),
            Center(
              child: CustomText(
                categoryName!,
                color: Colors.white,
                fontSize: defaultSize! * 2,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
