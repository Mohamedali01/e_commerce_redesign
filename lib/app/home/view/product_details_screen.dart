import 'package:e_commerce_app/app/home/components/buy_now_button.dart';
import 'package:e_commerce_app/app/home/components/description_widget.dart';
import 'package:e_commerce_app/app/home/components/full_image_screen.dart';
import 'package:e_commerce_app/app/home/components/image_product_details_widget.dart';
import 'package:e_commerce_app/app/home/components/product_details_title_and_price.dart';
import 'package:e_commerce_app/app/home/components/rating_widget.dart';
import 'package:e_commerce_app/app/home/components/size_container_widget.dart';
import 'package:e_commerce_app/app/home/components/sizes_details_widget.dart';
import 'package:e_commerce_app/app/home/control/product_details_controller.dart';
import 'package:e_commerce_app/app/home/model/product_model.dart';
import 'package:e_commerce_app/core/size_config.dart';
import 'package:e_commerce_app/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModel? productModel;

  ProductDetailsScreen({this.productModel});

  @override
  Widget build(BuildContext context) {
    final defaultSize = SizeConfig.defaultSize;
    final productDetailsController =
        Provider.of<ProductDetailsController>(context);
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            ImageProductDetailsWidget(
              productDetailsController: productDetailsController,
              productModel: productModel,
              defaultSize: defaultSize,
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductDetailsTitleAndPrice(
                          productModel: productModel, defaultSize: defaultSize),
                      RatingWidget(
                        productModel: productModel,
                        defaultSize: defaultSize,
                      ),
                      DescriptionWidget(defaultSize: defaultSize, productModel: productModel),
                      Divider(
                        height: 1,
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CustomText(
                              'Select Size',
                              fontWeight: FontWeight.bold,
                              fontSize: defaultSize * 2,
                            ),
                            CustomText(
                              'Select Color',
                              fontSize: defaultSize * 2,
                            )
                          ],
                        ),
                      ),
                      Divider(
                        height: 1,
                        color: Colors.grey,
                      ),
                      SizesDetailsWidget(
                        productDetailsController: productDetailsController,
                        defaultSize: defaultSize,
                      ),
                      BuyNowButton(defaultSize: defaultSize)
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



