import 'package:e_commerce_app/app/home/control/home_controller.dart';
import 'package:e_commerce_app/app/home/view/product_details_screen.dart';
import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/core/size_config.dart';
import 'package:e_commerce_app/widgets/custom_text.dart';
import 'package:e_commerce_app/widgets/empty_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final defaultSize = SizeConfig.defaultSize;
    final homeController = Provider.of<HomeController>(context);
    return Scaffold(
            appBar: appBar,
            body: Padding(
              padding: EdgeInsets.only(top: 10, left: 30, right: 30),
              child: LayoutBuilder(builder: (context, constrains) {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: constrains.maxHeight * 0.06,
                        child: CustomText(
                          'Favorites',
                          color: Colors.black87,
                          fontSize: constrains.maxHeight * 0.05,
                        ),
                      ),
                      if(homeController.favouritesModels.isEmpty)
                        EmptyScreen(
                          fontSize: defaultSize * 2.5,
                          text: 'No Favorites yet',
                        ),
                      SizedBox(
                        height: constrains.maxHeight * 0.04,
                      ),
                      if(homeController.favouritesModels.isNotEmpty)
                        SizedBox(
                        height: constrains.maxHeight * 0.9,
                        child: GridView.builder(
                          itemCount: homeController.favouritesModels.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 2 / 3,
                                  crossAxisSpacing: defaultSize * 2,
                                  mainAxisSpacing: defaultSize * 2,
                                  crossAxisCount: 2),
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {
                                Get.to(
                                  ProductDetailsScreen(
                                    productModel:
                                        homeController.favouritesModels[index],
                                  ),
                                );
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
                                        homeController.favouritesModels[index]
                                            .productImages![0],
                                        fit: BoxFit.fill,
                                      ),
                                      SizedBox(
                                        height: defaultSize,
                                      ),
                                      FittedBox(
                                        child: CustomText(
                                          '\$${homeController.favouritesModels[index].price!.toStringAsFixed(2)}',
                                          fontSize: 30,
                                        ),
                                      ),
                                      SizedBox(
                                        height: defaultSize,
                                      ),
                                      FittedBox(
                                        child: CustomText(
                                            homeController
                                                .favouritesModels[index].title!,
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
