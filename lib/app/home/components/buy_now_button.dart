import 'package:e_commerce_app/core/size_config.dart';
import 'package:e_commerce_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class BuyNowButton extends StatelessWidget {
  const BuyNowButton({
    Key? key,
    required this.defaultSize,
  }) : super(key: key);

  final double defaultSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(kPrimaryColor),
      height: SizeConfig.screenHeight * 0.07,
      width: double.infinity,
      child: Center(
        child: CustomText(
          'BUY NOW',
          fontSize: defaultSize * 2.5,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
