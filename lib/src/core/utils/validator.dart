/// Validator utility
///
/// A utility class containing static functions for validating different types
/// of data in a form. Currently, it includes validators for palindromes
/// and names.
class Validator {
  /// Validates a palindrome string.
  ///
  /// This function checks if the provided [palindrome] is not null and not empty.
  /// If the [palindrome] is either null or empty, it returns an error message
  /// indicating that a palindrome cannot be empty.
  static String? palindromeValidator(String? palindrome) {
    if (palindrome == null || palindrome.isEmpty) {
      return "Palindrome can't be empty";
    }

    return null;
  }

  /// Validates a name string.
  ///
  /// This function checks if the provided [name] is not null and not empty.
  /// If the [name] is either null or empty, it returns an error message
  /// indicating that a name cannot be empty.
  static String? nameValidator(String? name) {
    if (name == null || name.isEmpty) {
      return "Name can't be empty";
    }

    return null;
  }
}
