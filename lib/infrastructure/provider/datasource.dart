import 'package:either_dart/either.dart';
import 'package:firebase_login/domain/contracts/gateways/auth_request.dart';
import 'package:firebase_login/infrastructure/errors/auth_exception.dart';

abstract class Datasource {
  Future<Either<AuthException, AuthResponse>>
      createUserWithNameAndEmailAndPassword(
          {required String email,
          required String password,
          required String userName});

  Future<Either<AuthException, AuthResponse>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Either<AuthException, void>> signOut();

  Either<AuthException, AuthResponse> getLoggedUser();
}
