import 'package:e_commerce_app/app/address/control/address_controller.dart';
import 'package:e_commerce_app/app/address/view/create_address_screen.dart';
import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/core/size_config.dart';
import 'package:e_commerce_app/widgets/custom_rounded_button.dart';
import 'package:e_commerce_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final defaultSize = SizeConfig.defaultSize;
    final addressController = Provider.of<AddressController>(context);
    return Scaffold(
      appBar: appBar,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Color(kPrimaryColor), width: 1)),
                child: CustomRoundedButton(
                  onTap: () {
                    Get.to(CreateAddressScreen());
                  },
                  color: Colors.white,
                  child: Center(
                    child: CustomText(
                      'Add Address',
                      fontSize: defaultSize * 2,
                      color: Color(kPrimaryColor),
                    ),
                  ),
                ),
              ),
            ),
            CustomRoundedButton(
              onTap: () {},
              gradient: gradient,
              child: Center(
                child: CustomText(
                  'Continue To Payment',
                  fontSize: defaultSize * 2,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: SizeConfig.screenHeight * 0.1,
                child: CustomText(
                  'Address',
                  fontSize: SizeConfig.screenHeight * 0.04,
                ),
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.9,
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: SizeConfig.screenHeight * 0.15,
                      child: RotationTransition(
                        turns: new AlwaysStoppedAnimation(360 / 360),
                        child: RadioListTile(
                          value: index,
                          groupValue: addressController.radioGroupValue,
                          onChanged: (value) {
                            print(value);
                            addressController.chooseRadioButton(value as int);
                          },
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                  '${addressController.addressModels[index].address}, ${addressController.addressModels[index].city}, ${addressController.addressModels[index].country},'),
                              CustomText(
                                  'Postal code: ${addressController.addressModels[index].postalCode}'),
                              CustomText(
                                  'Phone Number: ${addressController.addressModels[index].phoneNumber}')
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: addressController.addressModels.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// ListTile(
// trailing: Radio(
// value: index,
// groupValue: addressController.radioGroupValue,
// onChanged: (value) {
// print(value);
// addressController
//     .chooseRadioButton(value as int);
// },
// ),
// title: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// CustomText(
// '${addressController.addressModels[index].area}, ${addressController.addressModels[index].city}, ${addressController.addressModels[index].country},'),
// CustomText(
// 'House no: ${addressController.addressModels[index].numberOfHouse}'),
// CustomText(
// 'Road no: ${addressController.addressModels[index].numberOfRoad}')
// ],
// ),
// ),
