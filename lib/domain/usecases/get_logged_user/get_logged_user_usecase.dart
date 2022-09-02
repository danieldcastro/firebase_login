import 'package:either_dart/either.dart';

import '../../entities/user_entity.dart';

abstract class GetLoggedUserUsecase {
  Future<Either<Exception, UserEntity>> call();
}
