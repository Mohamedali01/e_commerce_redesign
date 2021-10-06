import 'package:e_commerce_app/app/Cart/control/cart_controller.dart';
import 'package:e_commerce_app/app/Cart/model/cart_model.dart';
import 'package:e_commerce_app/app/home/view/home_screen.dart';
import 'package:e_commerce_app/core/size_config.dart';
import 'package:e_commerce_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../constants.dart';

class BuyNowButton extends StatelessWidget {
  const BuyNowButton(
      {Key? key, required this.defaultSize, required this.cartModel})
      : super(key: key);

  final CartModel? cartModel;
  final double defaultSize;

  @override
  Widget build(BuildContext context) {
    final cartController = Provider.of<CartController>(context);

    return InkWell(
      onTap: () {
        cartController.addCartItem(cartModel!);
        // buildFlutterToast('Product added successfully');
        // Get.offAll(HomeScreen());
        },
      child: Container(
        color: Color(kPrimaryColor),
        height: SizeConfig.screenHeight * 0.08,
        width: double.infinity,
        child: Center(
          child: CustomText(
            'BUY NOW',
            fontSize: defaultSize * 2.5,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
