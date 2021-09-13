import 'package:e_commerce_app/app/auth/control/log_in_controller.dart';
import 'package:e_commerce_app/app/auth/control/sign_up_controller.dart';
import 'package:e_commerce_app/app/auth/view/log_in_screen.dart';
import 'package:e_commerce_app/app/auth/view/sign_up_screen.dart';
import 'package:e_commerce_app/app/auth/view/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => LogInController()),
          ChangeNotifierProvider(create: (_) => SignUpController())
        ],
        builder: (context, child) {
          return MaterialApp(
            theme: ThemeData(canvasColor: Colors.white),
            debugShowCheckedModeBanner: false,
            home: SignUpScreen(),
          );
        });
  }
}
