import 'package:either_dart/src/either.dart';
import 'package:firebase_login/domain/entities/user_entity.dart';

import 'sign_in_with_cpf_and_password_usecase.dart';

class SignInWithCpfAndPasswordUsecaseImpl
    implements SignInWithCpfAndPasswordUsecase {
  @override
  Future<Either<Exception, UserEntity>> call(
      {required String cpfNumber, required String password}) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
