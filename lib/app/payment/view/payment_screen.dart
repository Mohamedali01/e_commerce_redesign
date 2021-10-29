import 'package:e_commerce_app/app/address/view/create_address_screen.dart';
import 'package:e_commerce_app/app/payment/components/custom_list_tile_widget.dart';
import 'package:e_commerce_app/app/payment/components/payment_floating_action_button.dart';
import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/core/size_config.dart';
import 'package:e_commerce_app/widgets/app_bar_widget.dart';
import 'package:e_commerce_app/widgets/custom_constrained_box.dart';
import 'package:e_commerce_app/widgets/custom_rounded_button.dart';
import 'package:e_commerce_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final defaultSize = SizeConfig.defaultSize;
    // final dataKey = new GlobalKey();

    return Scaffold(
      appBar: AppBarWidget(
        onTap: () {
          Get.back();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: PaymentFloatingActionButton(),
      body: LayoutBuilder(builder: (context, constrains) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
                minHeight: constrains.maxHeight, minWidth: constrains.maxWidth),
            child: IntrinsicHeight(
              child: Padding(
                padding: EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      'Payment',
                      fontSize: defaultSize * 2.5,
                    ),
                    SizedBox(
                      height: defaultSize * 2,
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight * 0.2,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        itemBuilder: (BuildContext context, int index) {
                          return Image.asset('assets/images/visa.png');
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            width: defaultSize * 2,
                          );
                        },
                      ),
                    ),
                    Spacer(),
                    SizedBox(
                      height: constrains.maxHeight * 0.3,
                      child: LayoutBuilder(builder: (context, innerConstrains) {
                        return Column(
                          children: [
                            CustomListTileWidget(
                              height: innerConstrains.maxHeight * 0.2,
                              titleText: 'Subtotal',
                              trailingText: '\$160.00',
                              color: Colors.black45,

                            ),
                            CustomListTileWidget(
                              height: innerConstrains.maxHeight * 0.2,
                              titleText: 'Discount',
                              trailingText: '\$160.00',
                              color: Colors.black45,

                            ),
                            CustomListTileWidget(
                              height: innerConstrains.maxHeight * 0.2,
                              titleText: 'Shipping',
                              trailingText: '\$160.00',
                              color: Colors.black45,
                            ),
                            Divider(
                              thickness: 1,
                            ),
                            CustomListTileWidget(
                              height: innerConstrains.maxHeight * 0.2,
                              titleText: 'total',
                              trailingText: '\$160.00',
                              color: Colors.black,

                            ),

                            // ListTile(
                            //   title: CustomText(
                            //     'Discount', color: Colors.black45,
                            //     fontSize: defaultSize * 1.8,),
                            //   trailing: CustomText(
                            //     '16.00', fontSize: defaultSize * 1.5,),
                            // ),
                            // ListTile(
                            //   title: CustomText(
                            //     'Shipping', color: Colors.black45,
                            //     fontSize: defaultSize * 1.8,),
                            //   trailing: CustomText(
                            //     '16.00', fontSize: defaultSize * 1.5,),
                            // ),
                            // Divider(thickness: 1,
                            //   color: Colors.grey.shade400,),
                            // ListTile(
                            //   title: CustomText(
                            //     'Total', fontSize: defaultSize * 1.8,),
                            //   trailing: CustomText(
                            //     '16.00', fontSize: defaultSize * 1.5,),
                            // ),
                          ],
                        );
                      }),
                    ),
                    Spacer(
                      flex: 5,
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
