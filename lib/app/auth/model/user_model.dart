import 'package:e_commerce_app/app/address/model/address_model.dart';

class UserModel {
  String? userId;
  String? email;
  String? name;
  String? phoneNumber;
  String? gender;
  List<AddressModel>? addressModel;

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
      List<dynamic> list = map['addressModel'];
      email = map['email'];
      name = map['name'];
      userId = map['userId'];
      addressModel = list.map((e) => AddressModel.fromJson(e)).toList();
      gender = map['gender'];
      phoneNumber = map['phoneNumber'];
    }
  }

  toJson() {
    return {
      'userId': userId,
      'email': email,
      'name': name,
      'addressModel': addressModel!.map((e) => e.toJson()).toList(),
      'gender': gender,
      'phoneNumber': phoneNumber
    };
  }
}
