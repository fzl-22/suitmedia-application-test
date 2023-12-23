import 'package:flutter/material.dart';

/// ActionButton Class
///
/// A custom button based on [ElevatedButton]. This button is a
/// shared widget designed for performing actions within the application
class ActionButton extends StatelessWidget {
  /// Constructor of ActionButton.
  ///
  /// Parameters:
  /// - [onPressed]: A callback function to be executed when the button is pressed.
  /// - [text]: The text string displayed on the button.
  const ActionButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        textStyle: Theme.of(context).textTheme.labelLarge,
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
