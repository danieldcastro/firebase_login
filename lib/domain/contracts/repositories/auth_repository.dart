import 'package:either_dart/either.dart';
import 'package:firebase_login/infrastructure/errors/auth_exception.dart';
import 'package:firebase_login/infrastructure/models/remote_user_model.dart';

abstract class AuthRepository {
  Future<Either<AuthException, RemoteUserModel>>
      createUserWithNameAndEmailAndPassword(
          {required String email,
          required String password,
          required String userName});

  Future<Either<AuthException, RemoteUserModel>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Either<AuthException, void>> signOut();

  Either<AuthException, RemoteUserModel> getLoggedUser();
}
