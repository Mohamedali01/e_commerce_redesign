import 'package:e_commerce_app/app/home/model/product_model.dart';
import 'package:e_commerce_app/core/size_config.dart';
import 'package:e_commerce_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class ProductDetailsTitleAndPrice extends StatelessWidget {
  const ProductDetailsTitleAndPrice({
    Key? key,
    required this.productModel,
    required this.defaultSize,
  }) : super(key: key);

  final ProductModel? productModel;
  final double defaultSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            productModel!.title!,
            fontSize: defaultSize * 2.5,
            color: Colors.black87,
          ),
          SizedBox(
            height: defaultSize,
          ),
          SizedBox(
            width: SizeConfig.screenWidth * 0.2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  '\$${productModel!.salePrice!.toStringAsFixed(0)}',
                  color: Color(kPrimaryColor),
                  fontSize: defaultSize * 2,
                ),
                if (productModel!.salePrice! != productModel!.price!)
                  CustomText(
                    '\$${productModel!.price!.toStringAsFixed(0)}',
                    fontSize: defaultSize * 1.7,
                    lineThrough: true,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
