import 'package:flutter/material.dart';

/// CenteredLoadingIndicator Class
///
/// A custom widget that displays a centered loading indicator using
/// the centered [CircularProgressIndicator]. This widget is designed
/// to be used as a visual cue to indicate ongoing loading or
/// processing within the application.
class CenteredLoadingIndicator extends StatelessWidget {
  const CenteredLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(24),
      child: Center(
        child: CircularProgressIndicator(
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}
