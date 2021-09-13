import 'package:e_commerce_app/constants.dart';

class CategoryModel {
  CATEGORY? name;
  String? categoryId;
  String? categoryImage;

  CategoryModel({this.name, this.categoryId, this.categoryImage});

  CategoryModel.fromJson(Map<dynamic, dynamic>? map) {
    if (map == null)
      return;
    else {
      name = map['name'];
      categoryId = map['categoryId'];
      categoryImage = map['categoryImage'];
    }
  }

  toJson() {
    return {
      'name': name,
      'categoryId': categoryId,
      'categoryImage': categoryImage,
    };
  }
}
