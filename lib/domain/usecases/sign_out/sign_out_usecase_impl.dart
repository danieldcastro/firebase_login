import 'package:either_dart/either.dart';

import '../../../infrastructure/errors/auth_exception.dart';
import '../../contracts/repositories/auth_repository.dart';
import 'sign_out_usecase.dart';

class SignOutUsecaseImpl implements SignOutUsecase {
  final AuthRepository _repository;

  SignOutUsecaseImpl({required AuthRepository repository})
      : _repository = repository;

  @override
  Future<Either<AuthException, void>> call() async {
    final result = await _repository.signOut();

    if (result.isLeft) {
      return Left(result.left);
    } else {
      return Right(result.right);
    }
  }
}
