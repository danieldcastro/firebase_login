import 'package:either_dart/either.dart';

import '../../../infrastructure/errors/auth_exception.dart';

abstract class SignOutUsecase {
  Future<Either<AuthException, void>> call();
}
