/// Palindrome utility
///
/// A utility class containing a static function to check whether a given string
/// is a palindrome or not.
class Palindrome {
  /// [isPalindrome] checks whether a given string is palindrome or not.
  /// This function compares both the characters from the beginning and
  /// the end of the input string, iteratively moving towards the center.
  /// This algorithm takes O(N) time complexity
  ///
  /// Returns `true` if the string is a palindrome, and `false` otherwise.
  static bool isPalindrome(String text) {
    int length = text.length;
    for (int i = 0; i < length / 2; i++) {
      if (text[i] != text[length - i - 1]) {
        return false;
      }
    }

    return true;
  }
}
