import 'package:flutter/material.dart';
import 'package:suitmedia_application_test/src/core/utils/palindrome.dart';
import 'package:suitmedia_application_test/src/core/utils/validator.dart';
import 'package:suitmedia_application_test/src/features/common/widgets/action_button.dart';
import 'package:suitmedia_application_test/src/features/first_screen/widgets/container/profile_container.dart';
import 'package:suitmedia_application_test/src/features/first_screen/widgets/dialog/palindrome_dialog.dart';
import 'package:suitmedia_application_test/src/features/first_screen/widgets/field/text_input_field.dart';
import 'package:suitmedia_application_test/src/features/second_screen/second_screen.dart';

/// FirstScreen Class
///
/// The first screen of the application according to the task requirements, that is:
///   a. It has two inputTexts and two buttons.
///   b. One inputText for name input and the other for input sentence text,
///     to check whether the sentence is palindrome or not.
///       Example :
///         e.g isPalindrome(“kasur rusak”) -> true
///         e.g isPalindrome(“step on no pets”) -> true
///         e.g isPalindrome(“put it up”) -> true
///         e.g isPalindrome(“suitmedia”) -> false
///   c. A button with a “Check” title below the inputTexts
///   d. Show as dialog with message “isPalindrome” if it’s palindrome
///      and message “not palindrome” if it’s not palindrome when clicking the button check
///   e. And a button with a “Next” title below the Check Button.
///   f. Go to the Second Screen when clicking the Next button.
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

  /// Callback function triggered when the user submits the name input.
  void onSubmitName() {
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

  /// Callback function triggered when the user submits the palindrome input.
  void onSubmitPalindrome() {
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
  void dispose() {
    _nameController.dispose();
    _palindromeController.dispose();
    super.dispose();
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
                  onPressed: onSubmitPalindrome,
                  text: "CHECK",
                ),
                const SizedBox(height: 16),
                ActionButton(
                  onPressed: onSubmitName,
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
