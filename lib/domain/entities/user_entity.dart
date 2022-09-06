import 'package:firebase_login/infrastructure/models/remote_user_model.dart';

class UserEntity {
  String name;
  String email;

  UserEntity({
    required this.name,
    required this.email,
  });

  factory UserEntity.fromModel(RemoteUserModel model) =>
      UserEntity(name: model.name, email: model.email);

  factory UserEntity.empty() => UserEntity(name: '', email: '');

  @override
  String toString() => 'UserEntity(name: $name, email: $email)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserEntity && other.name == name && other.email == email;
  }

  @override
  int get hashCode => name.hashCode ^ email.hashCode;
}
