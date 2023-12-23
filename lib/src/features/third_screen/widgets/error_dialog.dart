import 'package:flutter/material.dart';

/// ErrorDialog Class
///
/// The `ErrorDialog` feature-specific widget that is rendered when there is a
/// fetch error from API. This widget is specific to [ThirdScreen].
class ErrorDialog extends StatelessWidget {
  const ErrorDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Error"),
      content: const Text("An error occurred, please try again later."),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text("OK"),
        )
      ],
    );
  }
}
