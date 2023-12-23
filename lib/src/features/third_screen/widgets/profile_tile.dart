import 'package:flutter/material.dart';
import 'package:suitmedia_application_test/src/core/models/user.dart';

/// UserContainer Class
///
/// The `UserContainer` is a feature-specific widget of [ThirdScreen] to displaying
/// [User] informations.
class UserContainer extends StatelessWidget {
  /// Constructor for `UserContainer`.
  ///
  /// Parameters:
  ///   - `user`: An instance of the [User] model containing user information.
  ///   - `onTap`: A callback function triggered when the user taps on the container.
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
