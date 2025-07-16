import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int? id;
  final String? name;
  final String? email;
  final String? url;

  const UserEntity({this.id, this.name, this.email, this.url});

  @override
  List<Object?> get props => [id, name, email, url];
}
