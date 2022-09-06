import 'package:either_dart/either.dart';
import 'package:firebase_login/domain/contracts/repositories/auth_repository.dart';
import 'package:firebase_login/domain/entities/user_entity.dart';

import '../../../infrastructure/errors/auth_exception.dart';
import 'sign_in_with_email_and_password_usecase.dart';

class SignInWithEmailAndPasswordUsecaseImpl
    implements SignInWithEmailAndPasswordUsecase {
  final AuthRepository _repository;

  SignInWithEmailAndPasswordUsecaseImpl({required AuthRepository repository})
      : _repository = repository;

  @override
  Future<Either<AuthException, UserEntity>> call(
      {required String email, required String password}) async {
    if (email.trim().isEmpty || password.trim().isEmpty) {
      return const Left(
          AuthException(message: 'CPF e Senha precisam ser preenchidos'));
    }
    final result = await _repository.signInWithEmailAndPassword(
        email: email, password: password);

    if (result.isLeft) {
      return Left(result.left);
    } else {
      final userModelToEntity = UserEntity.fromModel(result.right);
      return Right(userModelToEntity);
    }
  }
}
