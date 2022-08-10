import 'package:e_commerce_app/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmationScreen extends StatelessWidget {
  const ConfirmationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(onTap: (){
        Get.back();
      },),
      body: Column(
        children: [
          Spacer(),
          Image.asset('assets/images/confirmation.png')
        ],
      ),
    );
  }
}
