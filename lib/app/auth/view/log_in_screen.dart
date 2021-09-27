import 'package:e_commerce_app/app/auth/control/providers/auth_logic_controller.dart';
import 'package:e_commerce_app/app/auth/control/providers/auth_ui_controller.dart';
import 'package:e_commerce_app/app/auth/view/reset_password_screen.dart';
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
    final uiController = Provider.of<AuthUiController>(context);
    final logicController = Provider.of<AuthLogicController>(context);

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
              // physics: BouncingScrollPhysics(),
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
                        fontSize: defaultSize*1.6,
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
                        onSaved: (value) {
                          logicController.email = value!;
                        },
                      ),
                      SizedBox(
                        height: defaultSize * 3,
                      ),
                      CustomTextFormField(
                        fontSize: defaultSize*1.6,
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
                        obscure: !uiController.isLoginPassVisible,
                        suffixIcon: IconButton(
                          onPressed: () {
                            uiController.loginTogglePassVisibility();
                          },
                          icon: Icon(
                            uiController.isLoginPassVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.black26,
                          ),
                        ),
                        onSaved: (value) {
                          logicController.password = value!;
                        },
                      ),
                      SizedBox(
                        height: defaultSize * 3,
                      ),
                      CustomRoundedButton(
                        width: constrains.maxWidth,
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            await logicController.login();
                          }
                        },
                        gradient: gradient,
                        child: Center(
                          child: logicController.isLoginLoading
                              ? CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : CustomText(
                                  'Log in',
                                  color: Colors.white,
                                  fontSize: defaultSize * 1.7,
                                ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                  value: logicController.isRememberPass,
                                  onChanged: (value) {
                                    uiController
                                        .changeResetPassCheckBox(value!);
                                  }),
                              CustomText(
                                'Remember Me?',
                                color: Colors.black54,
                                fontSize: defaultSize * 1.5,
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(ResetPasswordScreen());
                            },
                            child: CustomText(
                              'Forgot your password?',
                              color: Colors.black54,
                              fontSize: defaultSize * 1.5,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: defaultSize * 3,
                      ),
                      GestureDetector(
                        onTap: () {
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
