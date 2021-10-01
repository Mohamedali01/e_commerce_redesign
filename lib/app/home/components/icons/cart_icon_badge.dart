import 'package:e_commerce_app/app/Cart/control/cart_controller.dart';
import 'package:e_commerce_app/app/Cart/view/cart_screen.dart';
import 'package:e_commerce_app/core/size_config.dart';
import 'package:e_commerce_app/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class CartIconBadge extends StatelessWidget {
  final double? size;

  CartIconBadge({this.size});

  @override
  Widget build(BuildContext context) {
    final cartController = Provider.of<CartController>(context);
    return InkWell(
      onTap: () {
        Get.to(CartScreen());
      },
      child: Stack(
        children: [
          Icon(
            Icons.shopping_cart,
            color: Colors.black87,
            size: size,
          ),
          Positioned(
              bottom: 2,
              right: 0,
              child: CircleAvatar(
                backgroundColor: Colors.red,
                radius: 10,
                child: FittedBox(
                  child: CustomText(
                    cartController.cartModels.length > 99
                        ? '+99'
                        : cartController.cartModels.length.toString(),
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
