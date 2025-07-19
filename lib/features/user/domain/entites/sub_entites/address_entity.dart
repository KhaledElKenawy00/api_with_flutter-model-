import 'package:api_test/features/user/domain/entites/sub_entites/geo_entity.dart';

class AddressEntity {
  final String street;
  final String city;
  final String suite;
  final String zipcode;
  final GeoEntity geo;

  AddressEntity({
    required this.street,
    required this.city,
    required this.suite,
    required this.zipcode,
    required this.geo,
  });
}
