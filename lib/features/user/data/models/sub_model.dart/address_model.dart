import 'package:api_test/core/databases/api/end_points.dart';
import 'package:api_test/features/user/data/models/sub_model.dart/geo_model.dart';
import 'package:api_test/features/user/domain/entites/sub_entites/address_entity.dart';

class AddressModel extends AddressEntity {
  AddressModel({
    required super.street,
    required super.city,
    required super.suite,
    required super.zipcode,
    required super.geo,
  });
  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      street: json[ApiKey.street],
      city: json[ApiKey.city],
      suite: json[ApiKey.suite],
      zipcode: json[ApiKey.zipcode],
      geo: GeoModel.fromJson(json[ApiKey.geo]),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      ApiKey.street: street,
      ApiKey.city: city,
      ApiKey.suite: suite,
      ApiKey.zipcode: zipcode,
      ApiKey.geo: geo,
    };
  }
}
