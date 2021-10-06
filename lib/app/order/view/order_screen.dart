import 'package:e_commerce_app/app/order/control/order_controller.dart';
import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/core/size_config.dart';
import 'package:e_commerce_app/widgets/custom_rounded_button.dart';
import 'package:e_commerce_app/widgets/custom_text.dart';
import 'package:e_commerce_app/widgets/empty_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderController = Provider.of<OrderController>(context);
    final defaultSize = SizeConfig.defaultSize;
    return  Scaffold(
            appBar: appBar,
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, bottom: 20, top: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: SizeConfig.screenHeight * 0.1,
                      child: CustomText(
                        'My Orders',
                        fontSize: SizeConfig.screenHeight * 0.04,
                      ),
                    ),
                    if(orderController.orderModels.isEmpty)
                        EmptyScreen(
                      fontSize: defaultSize * 2.5,
                      text: 'No orders added yet',
                    ),
                    if(orderController.orderModels.isNotEmpty)

                      SizedBox(
                      height: SizeConfig.screenHeight * 0.9,
                      child: ListView.separated(
                        physics: BouncingScrollPhysics(),
                        itemCount: orderController.orderModels.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            height: SizeConfig.screenHeight * 0.17,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.shade300,
                                    blurRadius: 5,
                                    spreadRadius: 1),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child:
                                  LayoutBuilder(builder: (context, constrains) {
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                            height: constrains.maxHeight,
                                            width: constrains.maxWidth * 0.3,
                                            child: Image.asset(
                                              orderController.orderModels[index]
                                                  .order!.image!,
                                              fit: BoxFit.fill,
                                            )),
                                        SizedBox(
                                          width: constrains.maxWidth * 0.1,
                                        ),
                                        SizedBox(
                                          width: constrains.maxWidth * 0.5,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height:
                                                    constrains.maxHeight * 0.2,
                                                child: CustomText(
                                                  orderController
                                                      .orderModels[index]
                                                      .order!
                                                      .title!,
                                                  fontSize: defaultSize * 1.8,
                                                ),
                                              ),
                                              SizedBox(
                                                height:
                                                    constrains.maxHeight * 0.2,
                                                child: CustomText(
                                                  orderController
                                                      .orderModels[index]
                                                      .order!
                                                      .ownerName!,
                                                  fontSize: defaultSize * 1.8,
                                                ),
                                              ),
                                              SizedBox(
                                                height:
                                                    constrains.maxHeight * 0.2,
                                                child: CustomText(
                                                  '\$${orderController.orderModels[index].order!.price!.toStringAsFixed(2)}',
                                                  fontSize: defaultSize * 1.8,
                                                  color: Color(kPrimaryColor),
                                                ),
                                              ),
                                              SizedBox(
                                                height:
                                                    constrains.maxHeight * 0.05,
                                              ),
                                              Container(
                                                width:
                                                    constrains.maxWidth * 0.3,
                                                height:
                                                    constrains.maxHeight * 0.35,
                                                child: CustomRoundedButton(
                                                  width: constrains.maxWidth *
                                                      0.45,
                                                  onTap: () {},
                                                  gradient: gradient,
                                                  child: Center(
                                                      child: FittedBox(
                                                    child: CustomText(
                                                      'Order Again',
                                                      fontSize:
                                                          defaultSize * 1.6,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  )),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              }),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: defaultSize * 2,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
