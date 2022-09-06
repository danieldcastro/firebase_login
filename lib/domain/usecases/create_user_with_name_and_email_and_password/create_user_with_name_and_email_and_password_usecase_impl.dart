import 'package:either_dart/either.dart';
import 'package:firebase_login/domain/entities/user_entity.dart';

import '../../../infrastructure/errors/auth_exception.dart';
import '../../contracts/repositories/auth_repository.dart';
import 'create_user_with_name_and_email_and_password_usecase.dart';

class CreateUserWithNameAndEmailAndPasswordUsecaseImpl
    implements CreateUserWithNameAndEmailAndPasswordUsecase {
  final AuthRepository _repository;

  CreateUserWithNameAndEmailAndPasswordUsecaseImpl(
      {required AuthRepository repository})
      : _repository = repository;
  @override
  Future<Either<AuthException, UserEntity>> call(
      {required String email,
      required String password,
      required String userName}) async {
    if (email.trim().isEmpty || password.trim().isEmpty) {
      return const Left(
          AuthException(message: 'CPF, Senha e Nome precisam ser preenchidos'));
    }
    final result = await _repository.createUserWithNameAndEmailAndPassword(
        email: email, password: password, userName: userName);

    if (result.isLeft) {
      return Left(result.left);
    } else {
      final userModelToEntity = UserEntity.fromModel(result.right);
      return Right(userModelToEntity);
    }
  }
}
