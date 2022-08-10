import 'package:e_commerce_app/app/payment/view/confirmation_screen.dart';
import 'package:e_commerce_app/core/size_config.dart';
import 'package:e_commerce_app/widgets/custom_rounded_button.dart';
import 'package:e_commerce_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants.dart';

class CheckoutFloatingActionButton extends StatelessWidget {
  const CheckoutFloatingActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final defaultSize = SizeConfig.defaultSize;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Color(kPrimaryColor), width: 1),
          ),
          child: CustomRoundedButton(
            onTap: () {
              Get.to(ConfirmationScreen());
            },
            gradient: gradient,
            child: Center(
              child: CustomText(
                'Buy',
                fontSize: defaultSize * 2,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
