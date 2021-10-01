import 'package:e_commerce_app/core/size_config.dart';
import 'package:flutter/material.dart';

import '../small widgets/category_widget.dart';
class Categories extends StatelessWidget {
  const Categories({
    Key? key,
    required this.defaultSize,
  }) : super(key: key);

  final double defaultSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.screenWidth * 0.3,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          CategoryWidget(
            defaultSize: defaultSize,
            categoryName: 'Man',
            image: 'assets/images/men_category_image.png',
            color: Color.fromRGBO(255, 88, 88, 0.7),
          ),
          SizedBox(
            width: defaultSize * 2,
          ),
          CategoryWidget(
            defaultSize: defaultSize,
            image: 'assets/images/kids_category_image.png',
            categoryName: 'Kids',
            color: Color.fromRGBO(67, 233, 123, 0.7),
          ),
          SizedBox(
            width: defaultSize * 2,
          ),
          CategoryWidget(
            defaultSize: defaultSize,
            categoryName: 'Woman',
            image: 'assets/images/women_category_image.png',
            color: Color.fromRGBO(102, 126, 234, 0.7),
          ),
        ],
      ),
    );
  }
}
