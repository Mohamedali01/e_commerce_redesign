import 'package:shared_preferences/shared_preferences.dart';

class ResetPassLocalDatabase {
  static bool? isRememberPass = false;

  static Future<void> saveDataLocally(bool isRemember) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    await sharedPreferences.setBool('isRemember', isRemember);
  }

  static Future<void> getData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool? data = sharedPreferences.getBool('isRemember');
    if (data != null) isRememberPass = data;
  }

  // static Future<void> clear() async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   await sharedPreferences.clear();
  // }
}
