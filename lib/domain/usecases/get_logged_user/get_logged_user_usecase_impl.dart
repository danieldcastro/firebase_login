import 'package:either_dart/src/either.dart';
import 'package:firebase_login/domain/entities/user_entity.dart';

import 'get_logged_user_usecase.dart';

class GetLoggedUserUsecaseImpl implements GetLoggedUserUsecase {
  @override
  Future<Either<Exception, UserEntity>> call() {
    // TODO: implement call
    throw UnimplementedError();
  }
}
