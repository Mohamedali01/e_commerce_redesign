import 'package:e_commerce_app/app/home/components/categories.dart';
import 'package:e_commerce_app/app/home/components/featured_widget.dart';
import 'package:e_commerce_app/app/home/components/row_text_widget.dart';
import 'package:e_commerce_app/app/home/components/search_widget.dart';
import 'package:e_commerce_app/app/home/control/home_controller.dart';
import 'package:e_commerce_app/core/size_config.dart';
import 'package:e_commerce_app/widgets/custom_constrained_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // final logicController = Provider.of<AuthLogicController>(context);
    final homeController = Provider.of<HomeController>(context);
    final defaultSize = SizeConfig.defaultSize;
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeScreen'),
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Icon(
            Icons.format_align_left,
            color: Colors.black54,
            size: 30,
          ),
        ),
      ),
      body: LayoutBuilder(builder: (context, constrains) {
        return SingleChildScrollView(
           physics: BouncingScrollPhysics(),

        child: CustomConstrainedBox(
            minHeight: constrains.maxHeight,
            minWidth: constrains.maxWidth,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
              child: Column(
                children: [
                  SearchWidget(
                    constraints: constrains,
                  ),
                  SizedBox(
                    height: defaultSize * 3,
                  ),
                  RowTextWidget(
                    defaultSize: defaultSize,
                    firstText: 'Categories',
                    secondText: 'See all',
                  ),
                  SizedBox(
                    height: defaultSize * 2,
                  ),
                  Categories(defaultSize: defaultSize),
                  SizedBox(
                    height: defaultSize,
                  ),
                  RowTextWidget(
                    defaultSize: defaultSize,
                    firstText: 'Featured',
                    secondText: 'See all',
                  ),
                  SizedBox(
                    height: defaultSize * 2,
                  ),
                  FeaturedWidgets(
                      defaultSize: defaultSize, homeController: homeController),
                  SizedBox(
                    height: defaultSize *4,
                  ),

                  RowTextWidget(
                    defaultSize: defaultSize,
                    firstText: 'Best Sell',
                    secondText: 'See all',
                  ),
                  SizedBox(
                    height: defaultSize * 2,
                  ),
                  FeaturedWidgets(
                      defaultSize: defaultSize, homeController: homeController),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
