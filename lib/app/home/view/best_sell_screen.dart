import 'package:e_commerce_app/app/home/control/home_controller.dart';
import 'package:e_commerce_app/app/home/view/product_details_screen.dart';
import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/core/size_config.dart';
import 'package:e_commerce_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

class BestSellScreen extends StatelessWidget {
  const BestSellScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final defaultSize = SizeConfig.defaultSize;
    final homeController = Provider.of<HomeController>(context);
    return Scaffold(
        appBar: appBar,
        body: homeController.productModels.isEmpty
            ? Center(
                child: CustomText('No Products yet'),
              )
            : Padding(
                padding: EdgeInsets.only(top: 10, left: 30, right: 30),
                child: LayoutBuilder(builder: (context, constrains) {
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: constrains.maxHeight * 0.06,
                          child: CustomText(
                            'Best Sell',
                            color: Colors.black87,
                            fontSize: constrains.maxHeight * 0.05,
                          ),
                        ),
                        SizedBox(
                          height: constrains.maxHeight * 0.04,
                        ),
                        SizedBox(
                          height: constrains.maxHeight * 0.9,
                          child: GridView.builder(
                            itemCount: homeController.productModels.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: 2 / 3,
                                    crossAxisSpacing: defaultSize * 2,
                                    mainAxisSpacing: defaultSize * 2,
                                    crossAxisCount: 2),
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  Get.to(ProductDetailsScreen(
                                      productModel:
                                          homeController.productModels[index]));
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: FittedBox(
                                    fit: BoxFit.fill,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          homeController.productModels[index]
                                              .productImages![0],
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
                                        SizedBox(
                                          height: defaultSize,
                                        ),
                                        FittedBox(
                                          child: CustomText(
                                              homeController
                                                  .productModels[index].title!,
                                              fontSize: 30),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  );
                }),
              ));
  }
}
