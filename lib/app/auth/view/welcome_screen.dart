import 'package:e_commerce_app/app/auth/view/log_in_screen.dart';
import 'package:e_commerce_app/app/auth/view/sign_up_screen.dart';
import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/core/size_config.dart';
import 'package:e_commerce_app/widgets/custom_text.dart';
import 'package:e_commerce_app/widgets/custom_rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double defaultSize = SizeConfig.defaultSize;
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(builder: (_, constrains) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  minHeight: constrains.maxHeight,
                  minWidth: constrains.maxWidth),
              child: IntrinsicHeight(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 50),
                  child: Column(
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Welcome to ',
                              style: TextStyle(
                                  color: Colors.black45,
                                  fontSize: defaultSize * 2),
                            ),
                            TextSpan(
                              text: 'Bolt',
                              style: TextStyle(
                                  color: Colors.black45,
                                  fontSize: defaultSize * 2,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      CustomText(
                        'Explore Us',
                        fontSize: defaultSize * 1.8,
                        color: Colors.black45,
                      ),
                      Spacer(),
                      SvgPicture.asset(
                        'assets/images/welcome_image.svg',
                        fit: BoxFit.fill,
                        width: SizeConfig.screenWidth*0.5,
                        height: SizeConfig.screenWidth*0.5,
                      ),
                      Spacer(),
                      CustomRoundedButton(
                        onTap: () {
                          Get.to(LogInScreen());
                        },
                        width: constrains.maxWidth,
                        gradient: gradient,
                        child: Center(
                          child: CustomText(
                            'Log in',
                            color: Colors.white,
                            fontSize: defaultSize * 1.7,
                          ),
                        ),
                      ),
                      CustomRoundedButton(
                        onTap: () {
                          Get.to(SignUpScreen());
                        },
                        width: constrains.maxWidth,
                        color: Colors.transparent,
                        child: Center(
                          child: CustomText(
                            'Signup',
                            color: Colors.black87,
                            fontSize: defaultSize * 1.7,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
