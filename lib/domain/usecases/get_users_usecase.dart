import 'package:compentency_test_muhammad/core/resources/data_state.dart';
import 'package:compentency_test_muhammad/domain/entities/user_entity.dart';
import 'package:compentency_test_muhammad/domain/repository/user_repository.dart';

class GetUsersUsecase {
  final UserRepository userRepository;

  GetUsersUsecase(this.userRepository);

  Future<DataState<List<UserEntity>>> execute(int page, int perPage) {
    return userRepository.getUsers(page, perPage);
  }
}
