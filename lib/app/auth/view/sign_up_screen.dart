import 'package:e_commerce_app/app/auth/control/providers/auth_logic_controller.dart';
import 'package:e_commerce_app/app/auth/control/providers/auth_ui_controller.dart';
import 'package:e_commerce_app/app/auth/view/log_in_screen.dart';
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
import 'package:e_commerce_app/constants.dart';

class SignUpScreen extends StatelessWidget {
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
              child: CustomConstrainedBox(
                minHeight: constrains.maxHeight,
                minWidth: constrains.maxWidth,
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        'Sign Up',
                        color: Colors.black87,
                        fontSize: defaultSize * 3.5,
                      ),
                      Spacer(),
                      CustomTextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          name = value!;
                        },
                        label: 'Name',
                        textInputType: TextInputType.text,
                      ),
                      SizedBox(
                        height: defaultSize * 3,
                      ),
                      CustomTextFormField(
                        validator: (value) {
                          if (value!.isEmpty) return 'Please enter your phone';
                          if (value.length != 11)
                            return 'Please enter a right number';
                          if (!value.startsWith('01'))
                            return 'Please enter a right number';
                          return null;
                        },
                        onSaved: (value) {
                         phoneNumber = value!;
                          print(
                              'Mohamed Ali Phone Number$phoneNumber');
                        },
                        label: 'Phone',
                        textInputType: TextInputType.number,
                      ),
                      SizedBox(
                        height: defaultSize * 3,
                      ),
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
                        onSaved: (value) {
                          email = value!;
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
                        obscure: !uiController.isSignUpPassVisible,
                        suffixIcon: IconButton(
                          onPressed: () {
                            uiController.signUpTogglePassVisibility();
                          },
                          icon: Icon(
                            uiController.isSignUpPassVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.black26,
                          ),
                        ),
                        onSaved: (value) {
                          password = value!;
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
                            await logicController.signUp();
                          }
                        },
                        gradient: gradient,
                        child: Center(
                          child: logicController.isSignUpLoading
                              ? CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : CustomText(
                                  'Sign Up',
                                  color: Colors.white,
                                  fontSize: defaultSize * 1.7,
                                ),
                        ),
                      ),
                      SizedBox(
                        height: defaultSize * 3,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.offAll(LogInScreen());
                        },
                        child: Center(
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Already have an account ?   ',
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: defaultSize * 1.5,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Sign in',
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
