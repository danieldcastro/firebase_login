import 'package:either_dart/either.dart';
import 'package:firebase_login/infrastructure/errors/auth_exception.dart';

import '../../entities/user_entity.dart';

abstract class SignInWithEmailAndPasswordUsecase {
  Future<Either<AuthException, UserEntity>> call(
      {required String email, required String password});
}
