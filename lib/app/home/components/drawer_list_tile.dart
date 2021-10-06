import 'package:e_commerce_app/core/size_config.dart';
import 'package:e_commerce_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class DrawerListTile extends StatelessWidget {
  final void Function()? onTap;
  final IconData? leading;
  final String? title;



  DrawerListTile({this.onTap, this.title, this.leading});

  @override
  Widget build(BuildContext context) {
    final defaultSize = SizeConfig.defaultSize;
    return InkWell(
      onTap: onTap,
      child: ListTile(
        leading: Icon(leading,color: Colors.white,size: defaultSize*2.5,),
        title: CustomText(title!,color: Colors.white,fontSize: defaultSize*1.8,),
      ),
    );
  }
}
