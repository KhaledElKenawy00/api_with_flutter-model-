import 'package:api_test/core/databases/api/end_points.dart';

class CompaneyModel {
  final String name;
  final String catchPhrase;
  final String bs;

  CompaneyModel({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  factory CompaneyModel.fromJson(Map<String, dynamic> json) {
    return CompaneyModel(
      name: json[ApiKey.name],
      catchPhrase: json[ApiKey.catchPhrase],
      bs: json[ApiKey.bs],
    );
  }
  Map<String, dynamic> toJson() {
    return {ApiKey.name: name, ApiKey.catchPhrase: catchPhrase, ApiKey.bs: bs};
  }
}
