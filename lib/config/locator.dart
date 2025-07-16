import 'package:compentency_test_muhammad/domain/usecases/check_palindrome_usecase.dart';
import 'package:compentency_test_muhammad/presentations/providers/palindrome_Viewmodel.dart';
import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.instance;

void setupLocator() {
  // Register UseCase
  sl.registerLazySingleton(() => CheckPalindromeUsecase());

  // Register ChangeNotifier as lazy singleton
  sl.registerLazySingleton(() => PalindromeViewModel(sl()));
}
