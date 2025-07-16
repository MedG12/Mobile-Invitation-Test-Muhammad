class CheckPalindromeUsecase {
  bool execute(String name, String palindrome) {
    final cleanName = name.replaceAll(' ', '').toLowerCase();
    final cleanPalindrome =
        palindrome.replaceAll(' ', '').toLowerCase().split('').reversed.join();
    return cleanName == cleanPalindrome &&
        (cleanName.isNotEmpty || cleanPalindrome.isNotEmpty);
  }
}
