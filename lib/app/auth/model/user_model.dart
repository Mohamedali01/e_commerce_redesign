import 'package:e_commerce_app/app/address/model/address_model.dart';
import 'package:e_commerce_app/constants.dart';

class UserModel {
  String? userId;
  String? email;
  String? name;
  double? phoneNumber;
  GENDER? gender;
  AddressModel? addressModel;

  UserModel(
      {this.userId,
      this.email,
      this.name,
      this.addressModel,
      this.gender,
      this.phoneNumber});

  UserModel.fromJson(Map<dynamic, dynamic>? map) {
    if (map == null)
      return;
    else {
      email = map['email'];
      name = map['name'];
      userId = map['userId'];
      addressModel = map['addressModel'];
      gender = map['gender'];
      phoneNumber = map['phoneNumber'];
    }
  }

  toJson() {
    return {
      'userId': userId,
      'email': email,
      'name': name,
      'addressModel': addressModel,
      'gender': gender,
      'phoneNumber': phoneNumber
    };
  }
}
