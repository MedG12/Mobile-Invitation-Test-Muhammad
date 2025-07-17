import 'package:compentency_test_muhammad/core/constants/api_endpoints.dart';
import 'package:compentency_test_muhammad/data/data_source/remote/user_api_service.dart';
import 'package:compentency_test_muhammad/data/repository/user_repository_impl.dart';
import 'package:compentency_test_muhammad/domain/repository/user_repository.dart';
import 'package:compentency_test_muhammad/domain/usecases/check_palindrome_usecase.dart';
import 'package:compentency_test_muhammad/domain/usecases/get_users_usecase.dart';
import 'package:compentency_test_muhammad/presentations/providers/user_selection_Viewmodel.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

final GetIt sl = GetIt.instance;

void setupLocator() {
  sl.registerLazySingleton<Dio>(() {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.apiBaseURL,
        headers: {
          'Content-Type': 'application/json',
          'x-api-key': 'reqres-free-v1',
        },
      ),
    );
    return dio;
  });
  //Register Datasources
  sl.registerLazySingleton<UserApiService>(() => UserApiService(sl()));

  // Register Repositories
  sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(sl()));

  // Register UseCases
  sl.registerLazySingleton(() => CheckPalindromeUsecase());
  sl.registerLazySingleton(() => GetUsersUsecase(sl()));

  // Register ViewModels
  sl.registerLazySingleton(() => UserSelectionViewmodel(sl(), sl()));
}
