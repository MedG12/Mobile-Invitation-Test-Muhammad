import 'package:compentency_test_muhammad/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({int? id, String? name, String? email, String? url});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      url: json['url'],
    );
  }
}
