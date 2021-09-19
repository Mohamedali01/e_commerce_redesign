import 'package:e_commerce_app/app/address/model/address_model.dart';

class UserModel {
  String? userId;
  String? email;
  String? name;
  String? phoneNumber;
  String? gender;
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
      addressModel = AddressModel.fromJson(map['addressModel']);
      gender = map['gender'];
      phoneNumber = map['phoneNumber'];
    }
  }

  toJson() {
    return {
      'userId': userId,
      'email': email,
      'name': name,
      'addressModel': addressModel!.toJson(),
      'gender': gender,
      'phoneNumber': phoneNumber
    };
  }
}
