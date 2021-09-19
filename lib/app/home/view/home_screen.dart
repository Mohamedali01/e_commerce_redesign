import 'package:e_commerce_app/app/auth/control/providers/auth_logic_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logicController = Provider.of<AuthLogicController>(context);
    return Scaffold(
      appBar: AppBar(title: Text('HomeScreen'),
      actions: [
        IconButton(onPressed: ()async{
          await logicController.logout();
        }, icon: Icon(Icons.logout))
      ],
      ),
    );
  }
}
