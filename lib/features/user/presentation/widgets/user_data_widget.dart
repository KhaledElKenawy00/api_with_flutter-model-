import 'package:api_test/features/user/domain/entites/user_entity.dart';
import 'package:flutter/material.dart';

class UserData extends StatelessWidget {
  const UserData({super.key, required this.user});
  final UserEntity user;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.person),
          iconColor: Colors.blueAccent,
          title: Text(user.name),
        ),
        ListTile(
          leading: const Icon(Icons.email),
          iconColor: Colors.blueAccent,
          title: Text(user.email),
        ),
        ListTile(
          leading: const Icon(Icons.phone),
          iconColor: Colors.blueAccent,
          title: Text(user.phone),
        ),
        ListTile(
          leading: const Icon(Icons.location_city),
          iconColor: Colors.blueAccent,
          title: Text(user.address.city),
        ),
      ],
    );
  }
}
