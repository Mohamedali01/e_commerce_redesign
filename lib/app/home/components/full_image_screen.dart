import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FullImageScreen extends StatelessWidget {
 final String? image;

  FullImageScreen(this.image);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 30,
            )),
      ),
      body: Center(
          child: InteractiveViewer(
              child: Image.asset(image!))),
    );
  }
}
