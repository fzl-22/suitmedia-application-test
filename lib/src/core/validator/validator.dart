class Validator {
  static String? palindromeValidator(String? palindrome) {
    if (palindrome == null || palindrome.isEmpty) {
      return "Palindrome can't be empty";
    }

    return null;
  }

  static String? nameValidator(String? name) {
    if (name == null || name.isEmpty) {
      return "Name can't be empty";
    }

    return null;
  }
}
