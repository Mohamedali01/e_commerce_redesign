import 'package:connectivity/connectivity.dart';
import 'package:e_commerce_app/app/address/model/address_model.dart';
import 'package:e_commerce_app/app/auth/control/database/auth/reset_pass/Reset_pass_lcol_database.dart';
import 'package:e_commerce_app/app/auth/control/database/auth/sign_up/auth_local_database.dart';
import 'package:e_commerce_app/app/auth/control/database/auth/sign_up/auth_remote_database.dart';
import 'package:e_commerce_app/app/auth/model/user_model.dart';
import 'package:e_commerce_app/app/auth/view/welcome_screen.dart';
import 'package:e_commerce_app/app/home/view/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../constants.dart';

class AuthLogicController with ChangeNotifier {
  final _auth = FirebaseAuth.instance;

  bool? _isRememberPass = false;

  bool? get isRememberPass => _isRememberPass;

  Widget _returnedWidget = WelcomeScreen();

  Widget get returnedWidget => _returnedWidget;

  String userId = '';
  String password = '';
  String name = '';
  String email = '';
  String phoneNumber = '';
  String gender = 'KNOWN';
  AddressModel? addressModel;

  bool _isLoginLoading = false;

  bool get isLoginLoading => _isLoginLoading;

  bool _isLogOutLoading = false;

  bool get isLogOutLoading => _isLogOutLoading;

  bool _isSignUpLoading = false;

  bool get isSignUpLoading => _isSignUpLoading;

  bool _isResetLoading = false;

  bool get isResetLoading => _isResetLoading;

  bool get isLogin {
    User? user = _auth.currentUser;
    return user != null;
  }

  Future<void> signUp() async {
    _isSignUpLoading = true;
    notifyListeners();
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      try {
        _isSignUpLoading = true;
        notifyListeners();
        UserCredential userCredential = await _auth
            .createUserWithEmailAndPassword(email: email, password: password);
        userId = userCredential.user!.uid;
        addressModel = AddressModel(
            numberOfHouse: 0, country: '', city: '', area: '', numberOfRoad: 0);
        notifyListeners();
        UserModel userModel = UserModel(
            email: email,
            name: name,
            userId: userId,
            addressModel: addressModel,
            gender: gender,
            phoneNumber: phoneNumber);

        await AuthRemoteDatabase.saveUserDataRemotely(userModel);
        await AuthLocalDatabase.saveDataLocally(userModel);
        await ResetPassLocalDatabase.saveDataLocally(true);
        _isSignUpLoading = false;
        notifyListeners();
        Get.offAll(HomeScreen());
        buildFlutterToast('Logged in successfully');
      } catch (e) {
        _isSignUpLoading = false;
        _clearData();
        notifyListeners();
        if (e
            .toString()
            .contains('The email address is already in use by another account'))
          buildSnackBar('Error', 'This email is already exists');
        else
          buildSnackBar('Error', 'Check your connection');

        print('Mohamed Ali AuthLogicController signUp ${e.toString()}');
      }
    } else {
      buildSnackBar('Error', 'You must open wifi or mobile data to Sign up');
      _isSignUpLoading = false;
      notifyListeners();
    }
  }

  Future<void> login() async {
    _isLoginLoading = true;
    notifyListeners();
    var connectivityResult = await (Connectivity().checkConnectivity());
    print('Mohamed Ali Connectivity : $connectivityResult');
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      try {
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        userId = userCredential.user!.uid;
        UserModel? userModel =
            await AuthRemoteDatabase.getUserDataRemotely(userId);
        name = userModel!.name!;
        phoneNumber = userModel.phoneNumber!;
        gender = userModel.gender!;
        addressModel = userModel.addressModel!;
        await AuthLocalDatabase.saveDataLocally(userModel);
        await ResetPassLocalDatabase.saveDataLocally(_isRememberPass!);
        _isLoginLoading = false;
        notifyListeners();
        Get.offAll(HomeScreen());
        buildFlutterToast('Logged in successfully');
      } on Exception catch (e) {
        _isLoginLoading = false;
        _clearData();
        notifyListeners();
        print('Mohamed Ali: LoginProvider, loginError: ${e.toString()}');
        if (e.toString().contains(' The password is invalid'))
          buildSnackBar('Error!', 'Incorrect password ');
        else if (e.toString().contains('There is no user record'))
          buildSnackBar('Error!', 'Incorrect email ');
        else
          buildSnackBar('Error!', 'Check your connection');
      }
    } else {
      buildSnackBar('Error', 'You must open wifi or mobile data to Login');
      _isLoginLoading = false;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    try {
      _isLogOutLoading = true;
      notifyListeners();
      await _auth.signOut();
      await AuthLocalDatabase.clear();
      _clearData();
      _isLogOutLoading = false;
      notifyListeners();
      Get.offAll(WelcomeScreen());
    } on Exception catch (e) {
      buildSnackBar('Error!', 'An error occurred');
      print('Mohamed Ali AuthLogicController logout ${e.toString()}');
    }
  }

  void _clearData() {
    userId = '';
    password = '';
    name = '';
    email = '';
    phoneNumber = '';
    gender = 'KNOWN';
    addressModel = null;
    notifyListeners();
  }

  Future<void> autoLogin() async {
    await _getIsRememberFromLocalDatabase();
    if (_isRememberPass!) {
      try {
        final userModel = await AuthLocalDatabase.getData();
        userId = userModel.userId!;
        name = userModel.name!;
        email = userModel.email!;
        phoneNumber = userModel.phoneNumber!;
        gender = userModel.gender!;
        addressModel = userModel.addressModel;
        _returnedWidget = HomeScreen();
        notifyListeners();
      } on Exception catch (e) {
        _clearData();
        // Get.offAll(WelcomeScreen());
        buildSnackBar('Error!', 'Error Happened');
        print('Mohamed Ali AuthLogicController autoLogin: ${e.toString()}');
        _returnedWidget = WelcomeScreen();
        notifyListeners();
      }
    } else {
      _returnedWidget = WelcomeScreen();
      notifyListeners();
    }
  }

  Future<void> _getIsRememberFromLocalDatabase() async {
    await ResetPassLocalDatabase.getData();
    print(
        'Mohamed Ali ResetPassLocalDatabase.isRememberPass = ${ResetPassLocalDatabase.isRememberPass}');
    if (ResetPassLocalDatabase.isRememberPass != null)
      _isRememberPass = ResetPassLocalDatabase.isRememberPass;
    notifyListeners();
  }

  void update(bool isRem) {
    _isRememberPass = isRem;
    notifyListeners();
    print('Mohamed update _isRememberPass to: $isRem');
  }

  Future<void> resetPassword() async {
    _isResetLoading = true;
    notifyListeners();
    var connectivityResult = await (Connectivity().checkConnectivity());
    print('Mohamed Ali Connectivity : $connectivityResult');
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      try {
        await _auth.sendPasswordResetEmail(email: email);
        buildFlutterToast('Check your email');
        _isResetLoading = false;
        notifyListeners();
        Get.offAll(WelcomeScreen());
      } on Exception catch (e) {
        _isResetLoading = false;
        notifyListeners();
        if (e.toString().contains("There is no user record")) {
          buildSnackBar('Error', 'This email does not exist');
        } else {
          buildSnackBar('Error', 'Check your connection');
          print(
              'Mohamed Ali AuthLogicController resetPassword:${e.toString()}');
        }
      }
    } else {
      buildSnackBar('Error', 'You must open wifi or mobile data to Login');
      _isResetLoading = false;
      notifyListeners();
    }
  }
}
