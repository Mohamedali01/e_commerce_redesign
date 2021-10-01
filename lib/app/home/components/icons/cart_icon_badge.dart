import 'package:e_commerce_app/app/Cart/view/cart_screen.dart';
import 'package:e_commerce_app/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartIconBadge extends StatelessWidget {
  const CartIconBadge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.to(CartScreen());
      },
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Stack(
          children: [
            Icon(
              Icons.shopping_cart,
              color: Colors.black87,
              size: 30,
            ),
            Positioned(
              bottom: 2,
              right: 0,
              child: CircleAvatar(backgroundColor: Colors.red,radius:7,
                child: CustomText('2',color: Colors.white,fontSize: 12,),
              )
            )
          ],
        ),
      ),
    );
  }
}
