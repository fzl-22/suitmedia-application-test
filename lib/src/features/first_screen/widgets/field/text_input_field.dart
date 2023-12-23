import 'package:flutter/material.dart';

/// TextInputField Class
///
/// The `TextInputField` widget is a widget based on [TextFormField] widget.
/// It provides a style for each state of base widget for more adaptability.
class TextInputField extends StatelessWidget {
  /// Constructor for `TextInputField`.
  ///
  /// Parameters:
  ///   - `formKey`: A global key that uniquely identifies the associated form field.
  ///   - `controller`: The controller for the text field, managing the input text.
  ///   - `hintText`: The hint text displayed in the input field before the user enters text.
  ///   - `validator`: A function that validates the user's input and returns an error message if invalid.
  const TextInputField({
    super.key,
    required this.formKey,
    required this.controller,
    required this.hintText,
    required this.validator,
  });

  final GlobalKey<FormFieldState> formKey;
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: formKey,
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Theme.of(context).colorScheme.onPrimary,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Color.fromARGB(255, 181, 181, 181),
        ),
      ),
      validator: validator,
    );
  }
}
