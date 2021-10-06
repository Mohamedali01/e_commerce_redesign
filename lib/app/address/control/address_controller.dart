import 'package:e_commerce_app/app/address/model/address_model.dart';
import 'package:flutter/material.dart';

class AddressController with ChangeNotifier {
  List<AddressModel> _addressModels = [
    AddressModel(
        numberOfRoad: 10,
        numberOfHouse: 28,
        country: 'Egypt',
        city: 'Cairo',
        area: 'El salam'),
    AddressModel(
        numberOfRoad: 2,
        numberOfHouse: 13,
        country: 'USA',
        city: 'New york',
        area: 'Dragons area'),
    AddressModel(
        numberOfRoad: 7,
        numberOfHouse: 32,
        country: 'England',
        city: 'London',
        area: 'Mac square'),
  ];

  List<AddressModel> get addressModels => _addressModels;

  int? _radioGroupValue = 0;

  int? get radioGroupValue => _radioGroupValue;

  void chooseRadioButton(int value) {
    _radioGroupValue = value;
    notifyListeners();
  }
}
