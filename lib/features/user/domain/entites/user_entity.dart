import 'package:api_test/features/user/domain/entites/sub_entites/address_entity.dart';

class UserEntity {
  final int id;
  final String name;
  final String email;
  final String phone;
  final AddressEntity address;

  UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
  });
}
