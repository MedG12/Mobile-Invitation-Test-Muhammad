import 'package:compentency_test_muhammad/core/resources/data_state.dart';
import 'package:compentency_test_muhammad/core/usecase/usecase.dart';
import 'package:compentency_test_muhammad/domain/entities/user_entity.dart';

class GetUserUsecase implements Usecase<DataState<List<UserEntity>>, void> {
  @override
  Future<DataState<List<UserEntity>>> call(void params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
