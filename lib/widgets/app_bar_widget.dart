import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  final void Function()? onTap;

  AppBarWidget({this.onTap});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: onTap,
          child: Image.asset(
            'assets/images/left_arrow.png',
            scale: 1.8,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize{
   return  Size(100, 50);
  }
}
