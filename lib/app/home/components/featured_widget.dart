import 'package:e_commerce_app/app/home/control/home_controller.dart';
import 'package:e_commerce_app/app/home/view/product_details_screen.dart';
import 'package:e_commerce_app/core/size_config.dart';
import 'package:e_commerce_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeaturedWidgets extends StatelessWidget {
  const FeaturedWidgets({
    Key? key,
    required this.defaultSize,
    required this.homeController,
  }) : super(key: key);

  final double defaultSize;
  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.screenWidth * 0.55,
      width: SizeConfig.screenWidth,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: defaultSize * 2,
          );
        },
        itemCount: homeController.productModels.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Get.to(ProductDetailsScreen(
                productModel: homeController.productModels[index],
              ));
            },
            child: SizedBox(
              width: SizeConfig.screenWidth * 0.4,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        homeController.productModels[index].productImages![0],
                        fit: BoxFit.fill,
                      ),
                      SizedBox(
                        height: defaultSize,
                      ),
                      FittedBox(
                        child: CustomText(
                          '\$${homeController.productModels[index].price!.toStringAsFixed(2)}',
                          fontSize: 30,
                        ),
                      ),
                      FittedBox(
                        child: CustomText(
                            homeController.productModels[index].title!,
                            fontSize: 30),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
