import 'package:e_commerce_app/app/Cart/model/cart_model.dart';
import 'package:e_commerce_app/app/home/components/small%20widgets/buy_now_button.dart';
import 'package:e_commerce_app/app/home/components/small%20widgets/description_widget.dart';
import 'package:e_commerce_app/app/home/components/small%20widgets/image_product_details_widget.dart';
import 'package:e_commerce_app/app/home/components/small%20widgets/product_details_title_and_price.dart';
import 'package:e_commerce_app/app/home/components/small%20widgets/rating_widget.dart';
import 'package:e_commerce_app/app/home/components/small%20widgets/sizes_details_widget.dart';
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
      body: CustomScrollView(
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProductDetailsTitleAndPrice(
                        productModel: productModel, defaultSize: defaultSize),
                    RatingWidget(
                      productModel: productModel,
                      defaultSize: defaultSize,
                    ),
                    DescriptionWidget(
                        defaultSize: defaultSize, productModel: productModel),
                    Divider(
                      height: 1,
                      color: Colors.grey.shade300,
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
                      color: Colors.grey.shade300,
                    ),
                    SizesDetailsWidget(
                      productDetailsController: productDetailsController,
                      defaultSize: defaultSize,
                    ),
                    SizedBox(
                      height: defaultSize * 5,
                    ),
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: BuyNowButton(
                          defaultSize: defaultSize,
                          cartModel: CartModel(
                              quantity: 1,
                              image: productModel!.productImages![0],
                              price: productModel!.price,
                              ownerName: productModel!.ownerName,
                              salePrice: productModel!.salePrice,
                              title: productModel!.title,
                              cartId: productModel!.productId),
                        ))
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
