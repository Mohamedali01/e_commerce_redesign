import 'package:e_commerce_app/app/home/components/size_container_widget.dart';
import 'package:e_commerce_app/app/home/control/product_details_controller.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class SizesDetailsWidget extends StatelessWidget {
  final ProductDetailsController productDetailsController;
  final double? defaultSize;

  SizesDetailsWidget(
      {required this.productDetailsController, this.defaultSize});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizeContainerWidget(
            defaultSize: defaultSize,
            size: 'S',
            isActive: productDetailsController.sizes[0],
            onTap: () {
              productDetailsController.changeSize(SIZE.SMALL);
            },
          ),
          SizeContainerWidget(
            defaultSize: defaultSize,
            isActive: productDetailsController.sizes[1],
            size: 'M',
            onTap: () {
              productDetailsController.changeSize(SIZE.MEDIUM);
            },
          ),
          SizeContainerWidget(
            defaultSize: defaultSize,
            isActive: productDetailsController.sizes[2],
            size: 'L',
            onTap: () {
              productDetailsController.changeSize(SIZE.LARGE);
            },
          ),
          SizeContainerWidget(
            defaultSize: defaultSize,
            isActive: productDetailsController.sizes[3],
            size: 'XL',
            onTap: () {
              productDetailsController.changeSize(SIZE.XLARGE);
            },
          ),
          SizeContainerWidget(
            isActive: productDetailsController.sizes[4],
            defaultSize: defaultSize,
            size: 'XXL',
            onTap: () {
              productDetailsController.changeSize(SIZE.XXLARGE);
            },
          ),
        ],
      ),
    );
  }
}
