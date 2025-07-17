import 'package:compentency_test_muhammad/core/resources/data_state.dart';
import 'package:compentency_test_muhammad/data/data_source/remote/user_api_service.dart';
import 'package:compentency_test_muhammad/data/models/user_model.dart';
import 'package:compentency_test_muhammad/domain/repository/user_repository.dart';
import 'package:dio/dio.dart';

class UserRepositoryImpl extends UserRepository {
  final UserApiService _userRemoteDataSource;

  UserRepositoryImpl(this._userRemoteDataSource);
  @override
  Future<DataState<List<UserModel>>> getUsers(int page, int perPage) async {
    try {
      final response = await _userRemoteDataSource.getUsers(page, perPage);
      return DataSuccess(
        (response.data["data"] as List)
            .map((e) => UserModel.fromJson(e))
            .toList(),
      );
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
