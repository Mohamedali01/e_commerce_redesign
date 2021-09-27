import 'package:e_commerce_app/app/home/control/home_controller.dart';
import 'package:e_commerce_app/core/size_config.dart';
import 'package:e_commerce_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class FeaturedScreen extends StatelessWidget {
  const FeaturedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final defaultSize = SizeConfig.defaultSize;
    final homeController = Provider.of<HomeController>(context);
    return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: Image.asset(
                'assets/images/left_arrow.png',
                scale: 1.8,
              ),
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
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
                      'Featured',
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
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 2 / 3,
                          crossAxisSpacing: defaultSize * 2,
                          mainAxisSpacing: defaultSize * 2,
                          crossAxisCount: 2),
                      itemBuilder: (BuildContext context, int index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  homeController
                                      .productModels[index].productImage!,
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
