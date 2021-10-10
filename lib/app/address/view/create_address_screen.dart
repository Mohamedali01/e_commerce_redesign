import 'package:e_commerce_app/app/address/control/address_controller.dart';
import 'package:e_commerce_app/app/address/model/address_model.dart';
import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/core/size_config.dart';
import 'package:e_commerce_app/widgets/custom_rounded_button.dart';
import 'package:e_commerce_app/widgets/custom_text.dart';
import 'package:e_commerce_app/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class CreateAddressScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final defaultSize = SizeConfig.defaultSize;
    final addressController =
        Provider.of<AddressController>(context, listen: false);
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: CustomRoundedButton(
          onTap: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              addressController.addAddress(
                AddressModel(
                    address: addressController.address,
                    postalCode: addressController.postalCode,
                    phoneNumber: addressController.addressPhoneNumber,
                    city: addressController.city,
                    country: addressController.country),
              );
              Get.back();
            }
          },
          // width: SizeConfig.screenWidth * 0.9,
          child: Center(
            child: CustomText(
              'Add Address',
              color: Colors.white,
              fontSize: defaultSize * 2.5,
            ),
          ),
          gradient: gradient,
        ),
      ),
      appBar: appBar,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: SizeConfig.screenHeight * 0.06,
                child: CustomText(
                  'Create Address',
                  fontSize: SizeConfig.screenHeight * 0.04,
                ),
              ),
              SizedBox(
                height: defaultSize * 3,
              ),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextFormField(
                      fontSize: defaultSize * 2,
                      label: 'Address',
                      textInputType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your Address';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        addressController.address = value!;
                      },
                    ),
                    SizedBox(
                      height: defaultSize * 3,
                    ),
                    CustomTextFormField(
                      fontSize: defaultSize * 2,
                      label: 'Country',
                      textInputType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your Country';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        addressController.country = value!;
                      },
                    ),
                    SizedBox(
                      height: defaultSize * 3,
                    ),
                    CustomTextFormField(
                      fontSize: defaultSize * 2,
                      label: 'City',
                      textInputType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your City';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        addressController.city = value!;
                      },
                    ),
                    SizedBox(
                      height: defaultSize * 3,
                    ),
                    CustomTextFormField(
                      fontSize: defaultSize * 2,
                      label: 'Postal Code',
                      textInputType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your Postal Code';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        addressController.postalCode = value!;
                      },
                    ),
                    SizedBox(
                      height: defaultSize * 3,
                    ),
                    CustomTextFormField(
                      fontSize: defaultSize * 2,
                      label: 'Phone Number',
                      textInputType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) return 'Please enter your phone';
                        if (value.length != 11)
                          return 'Please enter a right number';
                        if (!value.startsWith('01'))
                          return 'Please enter a right number';
                        return null;
                      },
                      onSaved: (value) {
                        addressController.addressPhoneNumber = value!;
                      },
                    ),
                    SizedBox(
                      height: defaultSize * 3,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
