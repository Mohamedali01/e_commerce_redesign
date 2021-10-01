import 'package:device_preview/device_preview.dart';
import 'package:e_commerce_app/app/auth/control/providers/auth_logic_controller.dart';
import 'package:e_commerce_app/app/auth/control/providers/auth_ui_controller.dart';
import 'package:e_commerce_app/app/auth/control/providers/forget_password_controller.dart';
import 'package:e_commerce_app/app/auth/view/control_screen.dart';
import 'package:e_commerce_app/app/home/control/home_controller.dart';
import 'package:e_commerce_app/app/home/control/product_details_controller.dart';
import 'package:e_commerce_app/app/home/view/featured_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  // runApp(
  //   DevicePreview(
  //     enabled: !kReleaseMode,
  //     builder: (context) => MyApp(),
  //   ),
  // );

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
        ChangeNotifierProxyProvider(
          create: (_) => ProductDetailsController(),
          update: (BuildContext context, HomeController value,
              ProductDetailsController? previous) {
            return previous!..update(value.favouritesModels);
          },
        ),
      ],
      builder: (context, child) {
        return GetMaterialApp(
          locale: DevicePreview.locale(context),
          // Add the locale here
          builder: DevicePreview.appBuilder,
          // Add the builder here
          theme: ThemeData(canvasColor: Colors.white),
          debugShowCheckedModeBanner: false,
          // home: ControlScreen(),
          home: ControlScreen(),
        );
      },
    );
  }
}
