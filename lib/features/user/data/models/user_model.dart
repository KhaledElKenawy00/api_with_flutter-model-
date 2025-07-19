import 'package:api_test/core/databases/api/end_points.dart';
import 'package:api_test/features/user/data/models/sub_model.dart/address_model.dart';
import 'package:api_test/features/user/data/models/sub_model.dart/companey_model.dart';
import 'package:api_test/features/user/domain/entites/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required this.company,
    required this.username,
    required this.website,
    required super.id,
    required super.name,
    required super.email,
    required super.phone,
    required super.address,
  });
  final String username;
  final String website;
  final CompaneyModel company;
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json[ApiKey.id],
      name: json[ApiKey.name],
      email: json[ApiKey.email],
      phone: json[ApiKey.phone],
      address: AddressModel.fromJson(json[ApiKey.address]),
      company: CompaneyModel.fromJson(json[ApiKey.company]),
      username: json[ApiKey.username],
      website: json[ApiKey.website],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      ApiKey.id: id,
      ApiKey.name: name,
      ApiKey.email: email,
      ApiKey.phone: phone,
      ApiKey.address: address,
      ApiKey.company: company,
      ApiKey.username: username,
      ApiKey.website: website,
    };
  }
}
