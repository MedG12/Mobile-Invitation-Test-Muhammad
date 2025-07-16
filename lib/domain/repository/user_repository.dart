import 'package:compentency_test_muhammad/core/resources/data_state.dart';
import 'package:compentency_test_muhammad/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<DataState<List<UserEntity>>> getUsers();
}
