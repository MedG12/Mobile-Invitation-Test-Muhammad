import 'package:compentency_test_muhammad/domain/usecases/check_palindrome_usecase.dart';
import 'package:flutter/foundation.dart';

class PalindromeViewModel extends ChangeNotifier {
  final CheckPalindromeUsecase _checkPalindromeUsecase;

  PalindromeViewModel(this._checkPalindromeUsecase);

  bool checkPalindrome(String name, String palindrome) {
    return _checkPalindromeUsecase.execute(name, palindrome);
  }
}
