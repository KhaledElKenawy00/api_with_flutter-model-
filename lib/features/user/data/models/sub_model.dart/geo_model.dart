import 'package:api_test/core/databases/api/end_points.dart';
import 'package:api_test/features/user/domain/entites/sub_entites/geo_entity.dart';

class GeoModel extends GeoEntity {
  GeoModel({required super.lat, required super.lng});

  factory GeoModel.fromJson(Map<String, dynamic> json) {
    return GeoModel(lat: json[ApiKey.lat], lng: json[ApiKey.lng]);
  }
  toJson() {
    return {ApiKey.lat: lat, ApiKey.lng: lng};
  }
}
