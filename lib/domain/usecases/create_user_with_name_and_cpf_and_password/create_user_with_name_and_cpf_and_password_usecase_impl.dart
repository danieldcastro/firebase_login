import 'package:either_dart/either.dart';
import 'package:firebase_login/domain/entities/user_entity.dart';

import 'create_user_with_name_and_cpf_and_password_usecase.dart';

class CreateUserWithNameAndCpfAndPasswordUsecaseImpl
    implements CreateUserWithNameAndCpfAndPasswordUsecase {
  @override
  Future<Either<Exception, UserEntity>> call(
      {required String cpfNumber,
      required String password,
      required String userName}) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
