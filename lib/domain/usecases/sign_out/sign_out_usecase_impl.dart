import 'package:either_dart/either.dart';
import 'package:firebase_login/domain/entities/user_entity.dart';

import 'sign_out_usecase.dart';

class SignOutUsecaseImpl implements SignOutUsecase {
  @override
  Future<Either<Exception, UserEntity>> call() {
    // TODO: implement call
    throw UnimplementedError();
  }
}
