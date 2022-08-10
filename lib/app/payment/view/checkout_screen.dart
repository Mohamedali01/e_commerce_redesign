import 'package:e_commerce_app/app/Cart/control/cart_controller.dart';
import 'package:e_commerce_app/app/payment/components/checkout_floating_action_button.dart';
import 'package:e_commerce_app/core/size_config.dart';
import 'package:e_commerce_app/widgets/app_bar_widget.dart';
import 'package:e_commerce_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final defaultSize = SizeConfig.defaultSize;
    print('done');
    return Scaffold(
      appBar: AppBarWidget(
        onTap: () {
          Get.back();
        },
      ),
      floatingActionButton: CheckoutFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Padding(
        padding: EdgeInsets.all(30),
        child: LayoutBuilder(builder: (context, constrains) {
          return Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: constrains.maxHeight * 0.1,
                      child: CustomText(
                        'Checkout',
                        fontSize: constrains.maxHeight * 0.04,
                      ),
                    ),
                    Consumer<CartController>(builder: (_, cartController, __) {
                      return SizedBox(
                        height: constrains.maxHeight * 0.9,
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: cartModels.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              height: SizeConfig.screenHeight * 0.17,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.shade300,
                                      blurRadius: 5,
                                      spreadRadius: 1),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: LayoutBuilder(
                                    builder: (context, constrains) {
                                  return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                              height: constrains.maxHeight,
                                              width: constrains.maxWidth * 0.3,
                                              child: Image.asset(
                                                cartModels[index].image!,
                                                fit: BoxFit.fill,
                                              )),
                                          SizedBox(
                                            width: constrains.maxWidth * 0.1,
                                          ),
                                          SizedBox(
                                            width: constrains.maxWidth * 0.5,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: constrains.maxHeight *
                                                      0.2,
                                                  child: CustomText(
                                                    cartModels[index].title!,
                                                    fontSize: defaultSize * 1.8,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: constrains.maxHeight *
                                                      0.2,
                                                  child: CustomText(
                                                    cartModels[index]
                                                        .ownerName!,
                                                    fontSize: defaultSize * 1.8,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: constrains.maxHeight *
                                                      0.2,
                                                  child: CustomText(
                                                    '\$${cartModels[index].price!.toStringAsFixed(2)}',
                                                    fontSize: defaultSize * 1.8,
                                                    color: Color(kPrimaryColor),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: constrains.maxHeight *
                                                      0.05,
                                                ),
                                                Container(
                                                  width: constrains.maxWidth *
                                                      0.45,
                                                  height: constrains.maxHeight *
                                                      0.35,
                                                  color: Colors.grey.shade100,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      IconButton(
                                                        onPressed: () {
                                                          cartController
                                                              .increaseQuantity(
                                                                  cartModels[
                                                                          index]
                                                                      .cartId!);
                                                        },
                                                        icon: Icon(
                                                          Icons.add,
                                                          size: constrains
                                                                  .maxHeight *
                                                              0.2,
                                                          color: Color(
                                                              kBlackColor),
                                                        ),
                                                      ),
                                                      CustomText(
                                                        cartModels[index]
                                                            .quantity
                                                            .toString(),
                                                        fontSize: constrains
                                                                .maxHeight *
                                                            0.15,
                                                      ),
                                                      IconButton(
                                                        onPressed: () {
                                                          cartController
                                                              .decreaseQuantity(
                                                                  cartModels[
                                                                          index]
                                                                      .cartId!);
                                                        },
                                                        icon: Icon(
                                                          Icons.remove,
                                                          size: constrains
                                                                  .maxHeight *
                                                              0.2,
                                                          color: Color(
                                                              kBlackColor),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: constrains.maxWidth * 0.1,
                                        child: Align(
                                          alignment: Alignment.topRight,
                                          child: IconButton(
                                            onPressed: () {
                                              cartController.deleteCartItem(
                                                  cartModels[index].cartId!);
                                              buildFlutterToast(
                                                  'Product deleted successfully');
                                            },
                                            icon: Icon(Icons.close),
                                            iconSize:
                                                constrains.maxHeight * 0.2,
                                          ),
                                        ),
                                      )
                                    ],
                                  );
                                }),
                              ),
                            );
                          },
                        ),
                      );
                    }),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  color: Colors.white,
                  height: constrains.maxHeight * 0.48,
                  width: constrains.maxWidth,
                  child: LayoutBuilder(
                    builder: (context, innerConstrains) {
                      return Column(
                        children: [
                          
                        ],
                      );
                    }
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
