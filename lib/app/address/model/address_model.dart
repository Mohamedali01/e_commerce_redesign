class AddressModel {

  String? addressId;
  String? address;
  String? city;
  String? country;
  String? phoneNumber;
  String? postalCode;

  AddressModel({
    this.addressId,
    this.city,
    this.country,
    this.address,
    this.phoneNumber,
    this.postalCode,
  });

  AddressModel.fromJson(Map<dynamic, dynamic>? map) {
    if (map == null)
      return;
    else {
      addressId = map['addressId'];
      address = map['address'];
      city = map['city'];
      country = map['country'];
      phoneNumber = map['phoneNumber'];
      postalCode = map['postalCode'];
    }
  }

  toJson() {
    return {
      'addressId': addressId,
      'address': address,
      'city': city,
      'country': country,
      'phoneNumber': phoneNumber,
      'postalCode': postalCode,
    };
  }
}
