import 'package:flutter/material.dart';

/// CenteredAppBar Class
///
/// A custom widget based on [AppBar] with centered title text and
/// a back button. This app bar is designed to be used as the top navigation bar
/// in the application screen.
class CenteredAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// Constructor of CenteredAppBar.
  ///
  /// Parameters:
  /// - [onPressed]: A callback function to be executed when the back button is pressed.
  /// - [title]: The text displayed as the title of the app bar.
  const CenteredAppBar({
    super.key,
    required this.onPressed,
    required this.title,
  });

  final VoidCallback onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      leading: IconButton(
        onPressed: onPressed,
        icon: const Icon(
          Icons.arrow_back_ios_new_rounded,
        ),
      ),
      title: Text(title),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
