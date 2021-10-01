import 'package:e_commerce_app/app/home/model/product_model.dart';
import 'package:e_commerce_app/core/size_config.dart';
import 'package:e_commerce_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({
    Key? key,
    required this.productModel,
    required this.defaultSize,
  }) : super(key: key);

  final ProductModel? productModel;
  final double defaultSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: SizeConfig.screenWidth * 0.17,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Colors.grey.shade300,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: SizeConfig.screenWidth * 0.2,
                  height: SizeConfig.screenWidth * 0.2,
                  decoration: BoxDecoration(
                      color: Color(kPrimaryColor),
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                    child: CustomText(
                      productModel!.rating!.toStringAsFixed(1),
                      color: Colors.white,
                      fontSize: defaultSize * 2,
                    ),
                  ),
                ),
                SizedBox(
                  width: defaultSize * 1.5,
                ),
                CustomText(
                  'Very Good',
                  fontSize: defaultSize * 2,
                ),
              ],
            ),
            CustomText(
              '${productModel!.numberOfReviews!.toStringAsFixed(0)} Reviews',
              color: Color(kPrimaryColor),
              fontSize: defaultSize*1.6,
            )
          ],
        ),
      ),
    );
  }
}
