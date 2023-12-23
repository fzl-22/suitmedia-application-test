import 'package:flutter/material.dart';
import 'package:suitmedia_application_test/src/core/models/user.dart';

class UserContainer extends StatelessWidget {
  const UserContainer({
    super.key,
    required this.user,
    required this.onTap,
  });

  final User user;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 24,
        backgroundImage: NetworkImage(
          user.avatar.toString(),
        ),
      ),
      title: Text("${user.firstName} ${user.lastName}"),
      titleTextStyle: Theme.of(context).textTheme.titleMedium,
      subtitle: Text(
        user.email.toString().toUpperCase(),
      ),
      subtitleTextStyle: Theme.of(context).textTheme.bodySmall,
      onTap: onTap,
    );
  }
}
