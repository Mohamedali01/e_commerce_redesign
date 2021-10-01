import 'package:e_commerce_app/app/home/view/favourites_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavouritesIcon extends StatelessWidget {
  const FavouritesIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: IconButton(
        onPressed: () async {
          Get.to(FavouritesScreen());
        },
        icon: Icon(
          Icons.favorite,
          color: Colors.red,
          size: 35,
        ),
      ),
    );
  }
}
