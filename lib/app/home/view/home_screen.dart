import 'package:e_commerce_app/app/auth/control/providers/auth_logic_controller.dart';
import 'package:e_commerce_app/app/home/components/icons/cart_icon_badge.dart';
import 'package:e_commerce_app/app/home/components/icons/favourites_icon.dart';
import 'package:e_commerce_app/app/home/components/large%20widgets/categories.dart';
import 'package:e_commerce_app/app/home/components/large%20widgets/featured_widget.dart';
import 'package:e_commerce_app/app/home/components/small%20widgets/row_text_widget.dart';
import 'package:e_commerce_app/app/home/components/small%20widgets/search_widget.dart';
import 'package:e_commerce_app/app/home/control/home_controller.dart';
import 'package:e_commerce_app/app/home/view/best_sell_screen.dart';
import 'package:e_commerce_app/app/home/view/featured_screen.dart';
import 'package:e_commerce_app/core/size_config.dart';
import 'package:e_commerce_app/widgets/custom_constrained_box.dart';
import 'package:e_commerce_app/widgets/drawer_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<ScaffoldState>();
    SizeConfig().init(context);
    final homeController = Provider.of<HomeController>(context);
    final authController = Provider.of<AuthLogicController>(context);
    final defaultSize = SizeConfig.defaultSize;
    return authController.isLogOutLoading
        ? Scaffold(body: Center(child: CircularProgressIndicator()))
        : AdvancedDrawer(
            backdropColor: Colors.deepPurple.shade400,
            controller: _advancedDrawerController,
            animationCurve: Curves.easeInOut,
            animationDuration: const Duration(milliseconds: 300),
            animateChildDecoration: true,
            rtlOpening: false,
            disabledGestures: false,
            childDecoration: const BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
            ),
            drawer: DrawerWidget(),
            child: Scaffold(
              key: key,
              appBar: AppBar(
                title: Text('HomeScreen'),
                elevation: 0.0,
                backgroundColor: Colors.white,
                leading: IconButton(
                  onPressed: () {
                    _advancedDrawerController.showDrawer();
                  },
                  icon: Icon(
                    Icons.format_align_left,
                    color: Colors.black54,
                    size: 30,
                  ),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        FavouritesIcon(
                          size: 35,
                        ),
                        CartIconBadge(size: 35),
                      ],
                    ),
                  ),
                ],
              ),
              body: LayoutBuilder(builder: (context, constrains) {
                return SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: CustomConstrainedBox(
                    minHeight: constrains.maxHeight,
                    minWidth: constrains.maxWidth,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 30),
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
                            onTap: () {
                              Get.to(FeaturedScreen());
                            },
                          ),
                          SizedBox(
                            height: defaultSize * 2,
                          ),
                          FeaturedWidgets(
                              defaultSize: defaultSize,
                              homeController: homeController),
                          SizedBox(
                            height: defaultSize * 4,
                          ),
                          RowTextWidget(
                            defaultSize: defaultSize,
                            firstText: 'Best Sell',
                            secondText: 'See all',
                            onTap: () {
                              Get.to(BestSellScreen());
                            },
                          ),
                          SizedBox(
                            height: defaultSize * 2,
                          ),
                          FeaturedWidgets(
                              defaultSize: defaultSize,
                              homeController: homeController),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          );
  }
}
