import 'package:e_commerce_app/app/auth/control/providers/auth_logic_controller.dart';
import 'package:e_commerce_app/app/auth/control/providers/auth_ui_controller.dart';
import 'package:e_commerce_app/app/auth/control/providers/forget_password_controller.dart';
import 'package:e_commerce_app/app/auth/view/controll_screen.dart';
import 'package:e_commerce_app/app/home/control/home_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthUiController()),
        ChangeNotifierProxyProvider(
          create: (_) => AuthLogicController(),
          update: (BuildContext context, AuthUiController value,
              AuthLogicController? previous) {
            return previous!..update(value.isResetPassActive);
          },
        ),
        ChangeNotifierProvider(create: (_) => ForgetPasswordController()),
        ChangeNotifierProvider(create: (_) => HomeController()),

      ],
      builder: (context, child) {
        return GetMaterialApp(
          theme: ThemeData(canvasColor: Colors.white),
          debugShowCheckedModeBanner: false,
          home: ControlScreen(),
        );
      },
    );
  }
}
