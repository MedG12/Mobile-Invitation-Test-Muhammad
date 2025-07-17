import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? url;

  const UserEntity({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.url,
  });

  @override
  List<Object?> get props => [id, firstName, lastName, email, url];
}
