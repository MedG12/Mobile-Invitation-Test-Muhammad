import 'package:compentency_test_muhammad/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    int? id,
    String? firstName,
    String? lastName,
    String? email,
    String? url,
  }) : super(
         id: id,
         firstName: firstName,
         lastName: lastName,
         email: email,
         url: url,
       );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      url: json['avatar'],
    );
  }
}
