import 'package:e_commerce_app/app/home/model/product_model.dart';
import 'package:e_commerce_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../../constants.dart';
class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({
    Key? key,
    required this.defaultSize,
    required this.productModel,
  }) : super(key: key);

  final double defaultSize;
  final ProductModel? productModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            'Description',
            fontSize: defaultSize * 2,
          ),
          SizedBox(
            height: defaultSize,
          ),
          ReadMoreText(
            productModel!.description!,
            trimLines: 5,
            colorClickableText: Colors.pink,
            trimMode: TrimMode.Line,
            trimCollapsedText: 'More',
            trimExpandedText: ' Less',
            style: TextStyle(
                color: Colors.black87,
                height: 1.7,
                fontSize: defaultSize * 1.6),
            moreStyle: TextStyle(
                fontSize: defaultSize * 1.8,
                fontWeight: FontWeight.bold,
                color: Color(kPrimaryColor)),
            lessStyle: TextStyle(
                fontSize: defaultSize * 1.8,
                fontWeight: FontWeight.bold,
                color: Color(kPrimaryColor)),
          ),
        ],
      ),
    );
  }
}
