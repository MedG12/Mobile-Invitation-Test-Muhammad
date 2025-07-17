import 'package:compentency_test_muhammad/core/constants/Api_endpoints.dart';
import 'package:dio/dio.dart';

class UserApiService {
  final Dio dio;
  UserApiService(this.dio);
  // Get list of users
  Future<Response> getUsers(int page, int perPage) async {
    return dio.get(
      ApiEndpoints.getUsers(page, perPage),
      queryParameters: {'page': page, 'per_page': perPage},
    );
  }
}
