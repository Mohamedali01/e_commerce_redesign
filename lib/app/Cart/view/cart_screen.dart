import 'package:e_commerce_app/app/Cart/control/cart_controller.dart';
import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/core/size_config.dart';
import 'package:e_commerce_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartController = Provider.of<CartController>(context);
    final defaultSize = SizeConfig.defaultSize;
    return Scaffold(
      appBar: appBar,
      body: ListView.builder(
        itemCount: cartController.cartModels.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              height: SizeConfig.screenHeight * 0.17,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Colors.grey.shade300, blurRadius: 2),
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
                                cartController.cartModels[index].image!,
                                fit: BoxFit.fill,
                              )),
                          SizedBox(
                            width: constrains.maxWidth * 0.1,
                          ),
                          SizedBox(
                            width: constrains.maxWidth * 0.5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: constrains.maxHeight * 0.2,
                                  child: CustomText(
                                    cartController.cartModels[index].title!,
                                    fontSize: defaultSize * 1.8,
                                  ),
                                ),
                                SizedBox(
                                  height: constrains.maxHeight * 0.2,
                                  child: CustomText(
                                    cartController.cartModels[index].ownerName!,
                                    fontSize: defaultSize * 1.8,
                                  ),
                                ),
                                SizedBox(
                                  height: constrains.maxHeight * 0.2,
                                  child: CustomText(
                                    '\$${cartController.cartModels[index].price!
                                        .toStringAsFixed(2)}',
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
                                          cartController.increaseQuantity(
                                              cartController.cartModels[index]
                                                  .cartId!);
                                        },
                                        icon: Icon(
                                          Icons.add,
                                          size: constrains.maxHeight * 0.2,
                                          color: Color(kBlackColor),
                                        ),
                                      ),
                                      CustomText(
                                        cartController
                                            .cartModels[index].quantity
                                            .toString(),
                                        fontSize: constrains.maxHeight * 0.15,
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          cartController.decreaseQuantity(
                                              cartController.cartModels[index]
                                                  .cartId!);

                                        },
                                        icon: Icon(
                                          Icons.remove,
                                          size: constrains.maxHeight * 0.2,
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
                                  cartController.cartModels[index].cartId!);
                            },
                            icon: Icon(Icons.close),
                            iconSize: constrains.maxHeight * 0.18,
                          ),
                        ),
                      )
                    ],
                  );
                }),
              ),
            ),
          );
        },
      ),
    );
  }
}
