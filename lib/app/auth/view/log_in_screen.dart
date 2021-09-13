import 'package:e_commerce_app/app/auth/control/log_in_controller.dart';
import 'package:e_commerce_app/app/auth/view/sign_up_screen.dart';
import 'package:e_commerce_app/app/auth/view/welcome_screen.dart';
import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/core/size_config.dart';
import 'package:e_commerce_app/widgets/custom_constrained_box.dart';
import 'package:e_commerce_app/widgets/custom_rounded_button.dart';
import 'package:e_commerce_app/widgets/custom_text.dart';
import 'package:e_commerce_app/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class LogInScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<LogInController>(context);
    SizeConfig().init(context);
    final defaultSize = SizeConfig.defaultSize;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Get.offAll(WelcomeScreen());
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black45,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: LayoutBuilder(
          builder: (context, constrains) {
            return SingleChildScrollView(
              child: CustomConstrainedBox(
                minHeight: constrains.maxHeight,
                minWidth: constrains.maxWidth,
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        'Login',
                        color: Colors.black87,
                        fontSize: defaultSize * 3.5,
                      ),
                      Spacer(),
                      CustomTextFormField(
                        label: 'Email',
                        textInputType: TextInputType.text,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!value.contains('@') || !value.contains('.')) {
                            return 'This is not an email';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: defaultSize * 3,
                      ),
                      CustomTextFormField(
                        label: 'Password',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your password';
                          }
                          if (value.length < 6) {
                            return 'Password is too short';
                          }
                          return null;
                        },
                        textInputType: TextInputType.text,
                        obscure: !controller.isPassVisible,
                        suffixIcon: IconButton(
                          onPressed: () {
                            controller.togglePassVisibility();
                          },
                          icon: Icon(
                            controller.isPassVisible
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.black26,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: defaultSize * 3,
                      ),
                      CustomRoundedButton(
                        width: constrains.maxWidth,
                        onTap: () {
                          _formKey.currentState!.validate();
                        },
                        gradient: gradient,
                        child: Center(
                          child: CustomText(
                            'Log in',
                            color: Colors.white,
                            fontSize: defaultSize * 1.7,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: defaultSize * 3,
                      ),
                      GestureDetector(
                        onTap: (){
                          Get.offAll(SignUpScreen());
                        },
                        child: Center(
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Don’t have an account ?   ',
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: defaultSize * 1.5,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Sign Up',
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: defaultSize * 1.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Spacer(
                        flex: 4,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
