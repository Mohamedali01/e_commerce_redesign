import 'package:e_commerce_app/app/address/model/address_model.dart';
import 'package:e_commerce_app/constants.dart';
import 'package:flutter/material.dart';

class AddressController with ChangeNotifier {
  String? address;
  String? country;
  String? city;
  String? postalCode;
  String? addressPhoneNumber;
  List<AddressModel> _addressModels = [
    AddressModel(
        postalCode: '11595',
        city: 'Cairo',
        address:
            '21 omar ibn El Khatab, floor 23, department 19, El salam, Egypt',
        country: 'Egypt',
        phoneNumber: '01120352774',
        addressId: DateTime.now().toString() + phoneNumber + email),
    AddressModel(
      city: 'New york',
      postalCode: '54329',
      phoneNumber: '01120352774',
      country: 'USA',
      address: '21 Young boys, floor 11, department 9, los angeles, USA',
      addressId: DateTime.now().toString() + phoneNumber + email,
    ),
    AddressModel(
        city: 'London',
        address: '21 omar ibn El Khatab, floor 23, department 19, El salam',
        phoneNumber: '01120352774',
        country: 'England',
        postalCode: '92101',
        addressId: DateTime.now().toString() + phoneNumber + email),
  ];

  List<AddressModel> get addressModels => _addressModels;

  int? _radioGroupValue = 0;

  int? get radioGroupValue => _radioGroupValue;

  void chooseRadioButton(int value) {
    _radioGroupValue = value;
    notifyListeners();
  }

  void addAddress(AddressModel addressModel) {
    addressModels.add(AddressModel(
      addressId: DateTime.now().toString() + phoneNumber + email,
      city: addressModel.city,
      address: addressModel.address,
      country: addressModel.country,
      phoneNumber: addressModel.phoneNumber,
      postalCode: addressModel.postalCode,
    ));
    notifyListeners();
  }
}
