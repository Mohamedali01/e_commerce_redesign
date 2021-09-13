class AddressModel {
  String? country;
  String? city;
  String? area;
  int? numberOfHouse;
  int? numberOfRoad;

  AddressModel(
      {this.country,
      this.city,
      this.area,
      this.numberOfHouse,
      this.numberOfRoad});

  AddressModel.fromJson(Map<dynamic, dynamic>? map) {
    if (map == null)
      return;
    else {
      country = map['country'];
      city = map['city'];
      area = map['area'];
      numberOfHouse = map['numberOfHouse'];
      numberOfRoad = map['numberOfRoad'];
    }
  }
}
