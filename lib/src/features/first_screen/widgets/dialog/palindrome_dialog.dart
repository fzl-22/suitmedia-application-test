import 'package:flutter/material.dart';

class PalindromeDialog extends StatelessWidget {
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
