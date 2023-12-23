class Palindrome {
  static bool isPalindrome(String text) {
    int length = text.length;
    for (int i = 0; i < length; i++) {
      if (text[i] != text[length - i - 1]) {
        return false;
      }
    }

    return true;
  }
}
