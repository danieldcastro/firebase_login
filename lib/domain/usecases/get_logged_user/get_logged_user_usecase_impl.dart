import 'package:either_dart/either.dart';
import 'package:firebase_login/domain/entities/user_entity.dart';

import '../../../infrastructure/errors/auth_exception.dart';
import '../../contracts/repositories/auth_repository.dart';
import 'get_logged_user_usecase.dart';

class GetLoggedUserUsecaseImpl implements GetLoggedUserUsecase {
  final AuthRepository _repository;

  GetLoggedUserUsecaseImpl({required AuthRepository repository})
      : _repository = repository;

  @override
  Either<AuthException, UserEntity?> call() {
    final result = _repository.getLoggedUser();

    if (result.isLeft) {
      return Left(result.left);
    } else {
      final userModelToEntity = UserEntity.fromModel(result.right);
      return Right(userModelToEntity);
    }
  }
}
