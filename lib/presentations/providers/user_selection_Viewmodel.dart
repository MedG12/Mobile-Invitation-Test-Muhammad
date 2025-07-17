import 'package:compentency_test_muhammad/core/resources/data_state.dart';
import 'package:compentency_test_muhammad/domain/entities/user_entity.dart';
import 'package:compentency_test_muhammad/domain/usecases/check_palindrome_usecase.dart';
import 'package:compentency_test_muhammad/domain/usecases/get_users_usecase.dart';
import 'package:flutter/foundation.dart';

class UserSelectionViewmodel with ChangeNotifier {
  final GetUsersUsecase getUsersUsecases;
  final CheckPalindromeUsecase _checkPalindromeUsecase;
  String? _userName;

  List<UserEntity> _users = [];
  List<UserEntity> get users => _users;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _reachEnd = false;
  bool get reachEnd => _reachEnd;

  String? _error;
  String? get error => _error;

  int _currentPage = 1;
  int _perPage = 10;

  set perPage(int value) {
    _perPage = value;
  }

  String? get userName => _userName;
  set userName(String? userName) {
    _userName = userName;
    notifyListeners();
  }

  UserEntity? _selectedUser;
  UserEntity? get selectedUser => _selectedUser;
  set selectedUser(UserEntity? user) {
    _selectedUser = user;
    notifyListeners();
  }

  UserSelectionViewmodel(this.getUsersUsecases, this._checkPalindromeUsecase);

  void reset() {
    _users = [];
    _currentPage = 1;
    _reachEnd = false;
    _error = null;
    notifyListeners();
  }

  bool checkPalindrome(String name, String palindrome) {
    return _checkPalindromeUsecase.execute(name, palindrome);
  }

  Future<void> fetchUsers() async {
    if (_isLoading || _reachEnd) return;

    _isLoading = true;
    notifyListeners();

    final result = await getUsersUsecases.execute(_currentPage, _perPage);

    if (result is DataSuccess) {
      final fetched = result.data ?? [];
      if (fetched.isEmpty) {
        _reachEnd = true;
      } else {
        _users.addAll(fetched);
        _currentPage++;
      }
    } else if (result is DataFailed) {
      _error = result.error?.message ?? 'Unknown error';
    }

    _isLoading = false;
    notifyListeners();
  }
}
