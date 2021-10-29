import 'package:e_commerce_app/core/size_config.dart';
import 'package:e_commerce_app/widgets/custom_rounded_button.dart';
import 'package:e_commerce_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class PaymentFloatingActionButton extends StatelessWidget {
  const PaymentFloatingActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final defaultSize = SizeConfig.defaultSize;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Color(kPrimaryColor), width: 1)),
              child: CustomRoundedButton(
                onTap: () {
                  // Get.to(CreateAddressScreen());
                },
                color: Colors.white,
                child: Center(
                  child: CustomText(
                    'Add Card',
                    fontSize: defaultSize * 2,
                    color: Color(kPrimaryColor),
                  ),
                ),
              ),
            ),
          ),
          CustomRoundedButton(
            onTap: () {
              // Get.to(PaymentScreen());
            },
            gradient: gradient,
            child: Center(
              child: CustomText(
                'Checkout',
                fontSize: defaultSize * 2,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
