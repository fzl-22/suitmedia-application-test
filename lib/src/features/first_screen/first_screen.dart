import 'package:flutter/material.dart';
import 'package:suitmedia_application_test/src/core/utils/palindrome.dart';
import 'package:suitmedia_application_test/src/core/validator/validator.dart';
import 'package:suitmedia_application_test/src/features/common/widgets/action_button.dart';
import 'package:suitmedia_application_test/src/features/first_screen/widgets/container/profile_container.dart';
import 'package:suitmedia_application_test/src/features/first_screen/widgets/dialog/palindrome_dialog.dart';
import 'package:suitmedia_application_test/src/features/first_screen/widgets/field/text_input_field.dart';
import 'package:suitmedia_application_test/src/features/second_screen/second_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _palindromeController = TextEditingController();
  final GlobalKey<FormFieldState> _nameFieldKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _palindromeFieldKey =
      GlobalKey<FormFieldState>();

  void submitName() {
    _nameFieldKey.currentState!.save();

    if (!_nameFieldKey.currentState!.validate()) {
      return;
    }

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SecondScreen(name: _nameController.text),
      ),
    );
  }

  void submitPalindrome() {
    _palindromeFieldKey.currentState!.save();

    if (!_palindromeFieldKey.currentState!.validate()) {
      return;
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return PalindromeDialog(
          text: Palindrome.isPalindrome(_palindromeController.text)
              ? "isPalindrome"
              : "not Palindrome",
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: <Color>[
              const Color(0xFF8CBBA9),
              Theme.of(context).colorScheme.primary,
              Colors.white.withOpacity(0),
            ],
            center: Alignment.topRight,
            radius: 6,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const ProfileContainer(),
                const SizedBox(height: 48),
                TextInputField(
                  formKey: _nameFieldKey,
                  controller: _nameController,
                  hintText: "Name",
                  validator: Validator.nameValidator,
                ),
                const SizedBox(height: 16),
                TextInputField(
                  formKey: _palindromeFieldKey,
                  controller: _palindromeController,
                  hintText: "Palindrome",
                  validator: Validator.palindromeValidator,
                ),
                const SizedBox(height: 48),
                ActionButton(
                  onPressed: submitPalindrome,
                  text: "CHECK",
                ),
                const SizedBox(height: 16),
                ActionButton(
                  onPressed: submitName,
                  text: "NEXT",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
