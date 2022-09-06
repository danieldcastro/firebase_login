import 'package:either_dart/either.dart';

import '../../../infrastructure/errors/auth_exception.dart';
import '../../entities/user_entity.dart';

abstract class CreateUserWithNameAndEmailAndPasswordUsecase {
  Future<Either<AuthException, UserEntity>> call(
      {required String email,
      required String password,
      required String userName});
}
