import 'package:e_commerce_app/app/auth/control/providers/auth_logic_controller.dart';
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

class ResetPasswordScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
                        'Reset the Password',
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
                        onSaved: (value) {
                          email = value!;
                        },
                      ),
                      Spacer(),
                      CustomRoundedButton(
                        width: constrains.maxWidth,
                        onTap: () async{
                          if(_formKey.currentState!.validate())
                          {
                            _formKey.currentState!.save();
                            await logicController.resetPassword();
                          }
                        },
                        gradient: gradient,
                        child: Center(
                          child: logicController.isResetLoading
                              ? CircularProgressIndicator(
                            color: Colors.white,
                          )
                              : CustomText(
                            'Reset',
                            color: Colors.white,
                            fontSize: defaultSize * 1.7,
                          ),
                        ),
                      ),

                      Spacer(flex:7),
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
