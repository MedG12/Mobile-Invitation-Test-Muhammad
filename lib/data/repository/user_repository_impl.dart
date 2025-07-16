import 'package:compentency_test_muhammad/core/resources/data_state.dart';
import 'package:compentency_test_muhammad/data/models/user_model.dart';
import 'package:compentency_test_muhammad/domain/repository/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  @override
  Future<DataState<List<UserModel>>> getUsers() {
    throw UnimplementedError();
  }
}
