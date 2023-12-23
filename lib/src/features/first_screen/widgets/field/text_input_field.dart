import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  const TextInputField({
    super.key,
    required this.formKey,
    required this.controller,
    required this.hintText,
    required this.validator,
  });

  final GlobalKey<FormFieldState> formKey ;
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
