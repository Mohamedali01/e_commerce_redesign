import 'package:e_commerce_app/app/home/view/favourites_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavouritesIcon extends StatelessWidget {
final double? size;

FavouritesIcon({this.size});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        Get.to(FavouritesScreen());
      },
      icon: Icon(
        Icons.favorite,
        color: Colors.red,
        size: size,
      ),
    );
  }
}
