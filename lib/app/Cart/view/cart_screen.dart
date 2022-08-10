import 'package:e_commerce_app/app/Cart/control/cart_controller.dart';
import 'package:e_commerce_app/app/address/view/address_screen.dart';
import 'package:e_commerce_app/app/order/control/order_controller.dart';
import 'package:e_commerce_app/app/order/view/order_screen.dart';
import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/core/size_config.dart';
import 'package:e_commerce_app/widgets/custom_rounded_button.dart';
import 'package:e_commerce_app/widgets/custom_text.dart';
import 'package:e_commerce_app/widgets/empty_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartController = Provider.of<CartController>(context);
    final defaultSize = SizeConfig.defaultSize;
    return Scaffold(
      appBar: appBar,
      floatingActionButton: cartModels.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomRoundedButton(
                onTap: () {
                  Get.to(AddressScreen());
                },
                // width: SizeConfig.screenWidth * 0.9,
                child: Center(
                  child: CustomText(
                    'Continue',
                    color: Colors.white,
                    fontSize: defaultSize * 2.5,
                  ),
                ),
                gradient: gradient,
              ),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  height: SizeConfig.screenHeight * 0.06,
                  child: CustomText(
                    'Cart',
                    fontSize: SizeConfig.screenHeight * 0.04,
                  )),
              if (cartModels.isEmpty)
                EmptyScreen(
                  fontSize: defaultSize * 2.5,
                  text: 'No products added yet',
                ),
              if (cartModels.isNotEmpty)
                SizedBox(
                  height: SizeConfig.screenHeight * 0.9,
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
                          child: LayoutBuilder(builder: (context, constrains) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                            height: constrains.maxHeight * 0.2,
                                            child: CustomText(
                                              cartModels[index].title!,
                                              fontSize: defaultSize * 1.8,
                                            ),
                                          ),
                                          SizedBox(
                                            height: constrains.maxHeight * 0.2,
                                            child: CustomText(
                                              cartModels[index].ownerName!,
                                              fontSize: defaultSize * 1.8,
                                            ),
                                          ),
                                          SizedBox(
                                            height: constrains.maxHeight * 0.2,
                                            child: CustomText(
                                              '\$${cartModels[index].price!.toStringAsFixed(2)}',
                                              fontSize: defaultSize * 1.8,
                                              color: Color(kPrimaryColor),
                                            ),
                                          ),
                                          SizedBox(
                                            height: constrains.maxHeight * 0.05,
                                          ),
                                          Container(
                                            width: constrains.maxWidth * 0.45,
                                            height: constrains.maxHeight * 0.35,
                                            color: Colors.grey.shade100,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                IconButton(
                                                  onPressed: () {
                                                    cartController
                                                        .increaseQuantity(
                                                            cartModels[index]
                                                                .cartId!);
                                                  },
                                                  icon: Icon(
                                                    Icons.add,
                                                    size: constrains.maxHeight *
                                                        0.2,
                                                    color: Color(kBlackColor),
                                                  ),
                                                ),
                                                CustomText(
                                                  cartModels[index]
                                                      .quantity
                                                      .toString(),
                                                  fontSize:
                                                      constrains.maxHeight *
                                                          0.15,
                                                ),
                                                IconButton(
                                                  onPressed: () {
                                                    cartController
                                                        .decreaseQuantity(
                                                            cartModels[index]
                                                                .cartId!);
                                                  },
                                                  icon: Icon(
                                                    Icons.remove,
                                                    size: constrains.maxHeight *
                                                        0.2,
                                                    color: Color(kBlackColor),
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
                                      iconSize: constrains.maxHeight * 0.2,
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
                ),
            ],
          ),
        ),
      ),
    );
  }
}
