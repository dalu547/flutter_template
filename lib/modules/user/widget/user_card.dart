import 'package:flutter/material.dart';
import 'package:template/modules/user/entities/user_entity.dart';

class UserCard extends StatelessWidget {
  final UserEntity user;

  const UserCard(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(user.name),
        subtitle: Text(user.email),
      ),
    );
  }
}
