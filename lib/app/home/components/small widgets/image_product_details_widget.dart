import 'package:e_commerce_app/app/home/components/icons/cart_icon_badge.dart';
import 'package:e_commerce_app/app/home/components/icons/favourites_icon.dart';
import 'package:e_commerce_app/app/home/control/home_controller.dart';
import 'package:e_commerce_app/app/home/control/product_details_controller.dart';
import 'package:e_commerce_app/app/home/model/product_model.dart';
import 'package:e_commerce_app/core/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';
import 'package:provider/provider.dart';

import '../large widgets/full_image_screen.dart';

class ImageProductDetailsWidget extends StatelessWidget {
  final ProductDetailsController productDetailsController;
  final ProductModel? productModel;
  final double? defaultSize;

  ImageProductDetailsWidget(
      {required this.productDetailsController,
      this.productModel,
      this.defaultSize});

  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<HomeController>(context);
    return SliverAppBar(
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            onPressed: () {
              homeController.toggleFavourites(productModel!.productId!);
            },
            icon: Icon(
              productModel!.isFav! ? Icons.favorite : Icons.favorite_border,
              color: Colors.red,
              size: 35,
            ),
          ),
        ),
      ],

      backgroundColor: Colors.white,
      expandedHeight: SizeConfig.screenHeight * 0.4,
      // stretch: true,
      pinned: true,
      leading: IconButton(
        onPressed: () {
          productDetailsController.resetPage();
          Get.back();
        },
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
          size: 30,
        ),
      ),

      flexibleSpace: FlexibleSpaceBar(
        stretchModes: <StretchMode>[
          StretchMode.zoomBackground,
          StretchMode.fadeTitle,
          StretchMode.blurBackground,
        ],
        background: Container(
          width: double.infinity,
          child: Stack(
            children: [
              PageView(
                  controller: productDetailsController.pageController,
                  onPageChanged: (page) {
                    productDetailsController.changePage(page);
                  },
                  children: productModel!.productImages!
                      .map(
                        (image) => InkWell(
                          onTap: () {
                            Get.to(FullImageScreen(image));
                          },
                          child: Image.asset(
                            image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                      .toList()),
              Positioned(
                bottom: defaultSize,
                child: PageViewDotIndicator(
                  currentItem: productDetailsController.selectedPage,
                  count: productModel!.productImages!.length,
                  unselectedColor: Colors.black26,
                  selectedColor: Colors.blue,
                  duration: Duration(milliseconds: 200),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
