import 'package:flutter/material.dart';

/// ProfileContainer Class
///
/// The `PalindromeDialog` feature-specific widget of an [AlertDialog]
/// to display the result of [Palindrome.isPalindrome] in the [FirstScreen]
class PalindromeDialog extends StatelessWidget {
  /// Constructor for `PalindromeDialog`.
  ///
  /// Parameters:
  ///   - `text`: The text message to be displayed in the dialog.
  const PalindromeDialog({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(text),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text("CLOSE"),
        ),
      ],
    );
  }
}
