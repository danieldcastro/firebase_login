import 'package:either_dart/either.dart';

import '../../entities/user_entity.dart';

abstract class CreateUserWithNameAndCpfAndPasswordUsecase {
  Future<Either<Exception, UserEntity>> call(
      {required String cpfNumber,
      required String password,
      required String userName});
}
