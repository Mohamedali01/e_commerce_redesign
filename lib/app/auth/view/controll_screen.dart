import 'package:e_commerce_app/app/auth/control/providers/auth_logic_controller.dart';
import 'package:e_commerce_app/app/auth/view/welcome_screen.dart';
import 'package:e_commerce_app/app/home/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ControlScreen extends StatelessWidget {
  const ControlScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<AuthLogicController>(context, listen: false);
    return controller.isLogin
        ? FutureBuilder(
            future: controller.autoLogin(),
            builder: (_, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting)
                return Scaffold(
                  body: Center(
                    child: SingleChildScrollView(),
                  ),
                );
              return controller.returnedWidget;
            })
        : WelcomeScreen();
  }
}
