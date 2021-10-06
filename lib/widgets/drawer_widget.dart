import 'package:e_commerce_app/app/Cart/view/cart_screen.dart';
import 'package:e_commerce_app/app/auth/control/providers/auth_logic_controller.dart';
import 'package:e_commerce_app/app/home/components/drawer_list_tile.dart';
import 'package:e_commerce_app/app/order/view/order_screen.dart';
import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/core/size_config.dart';
import 'package:e_commerce_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class DrawerWidget extends StatelessWidget {
  final defaultSize = SizeConfig.defaultSize;

  @override
  Widget build(BuildContext context) {
    final authController = Provider.of<AuthLogicController>(context);
    return SafeArea(
      child: Drawer(
        elevation: 0.0,
        child: Container(
          color: Colors.deepPurple.shade400,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: LayoutBuilder(builder: (context, constrains) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: constrains.maxHeight * 0.1,
                    backgroundColor: Colors.grey.shade200,
                    backgroundImage:
                        AssetImage('assets/images/product_sample_1.png'),
                  ),
                  SizedBox(
                    height: constrains.maxHeight * 0.05,
                  ),
                  SizedBox(
                    width: constrains.maxWidth * 0.9,
                    child: CustomText(
                      name,
                      fontSize: defaultSize * 3,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      height: constrains.maxHeight * 0.05,
                      maxLines: 1,
                    ),
                  ),
                  SizedBox(
                      width: constrains.maxWidth * 0.9,
                      child: CustomText(
                        email,
                        fontSize: defaultSize * 1.7,
                        color: Colors.white,
                        maxLines: 1,
                      )),
                  SizedBox(
                    height: constrains.maxHeight * 0.05,
                  ),
                  DrawerListTile(
                    onTap: () {},
                    title: 'Profile',
                    leading: Icons.account_circle,
                  ),
                  DrawerListTile(
                    onTap: () {
                      Get.to(CartScreen());
                    },
                    title: 'Cart',
                    leading: Icons.shopping_cart,
                  ),
                  DrawerListTile(
                    onTap: () {
                      Get.to(OrderScreen());
                    },
                    title: 'Order',
                    leading: Icons.reorder,
                  ),
                  DrawerListTile(
                    onTap: () {},
                    title: 'CheckOut',
                    leading: Icons.attach_money,
                  ),
                  DrawerListTile(
                    onTap: () {},
                    title: 'Payment',
                    leading: Icons.credit_card,
                  ),
                  DrawerListTile(
                    onTap: () async{
                     await authController.logout();
                    },
                    title: 'Logout',
                    leading: Icons.logout,
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
