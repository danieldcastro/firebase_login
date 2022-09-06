import 'package:either_dart/either.dart';

import '../../../infrastructure/errors/auth_exception.dart';
import '../../entities/user_entity.dart';

abstract class GetLoggedUserUsecase {
  Either<AuthException, UserEntity?> call();
}
