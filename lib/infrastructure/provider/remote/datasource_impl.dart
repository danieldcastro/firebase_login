import 'package:either_dart/either.dart';
import 'package:firebase_login/domain/contracts/gateways/auth_request.dart';
import 'package:firebase_login/infrastructure/errors/auth_exception.dart';

import '../../../domain/contracts/gateways/my_firebase_auth_exception.dart';
import '../datasource.dart';

class DatasourceImpl implements Datasource {
  final AuthRequest _authRequest;
  DatasourceImpl({
    required AuthRequest authRequest,
  }) : _authRequest = authRequest;

  @override
  Future<Either<AuthException, AuthResponse>>
      createUserWithNameAndCpfAndPassword(
          {required String cpfNumber,
          required String password,
          required String userName}) async {
    try {
      final credential = await _authRequest.createUserWithNameAndCpfAndPassword(
          cpfNumber: cpfNumber, password: password, userName: userName);
      return Right(credential);
    } on MyFirebaseAuthException catch (e) {
      return Left(
          AuthException(message: e.message ?? 'Create user unsuccessful'));
    }
  }

  @override
  Either<AuthException, AuthResponse> getLoggedUser() {
    try {
      final user = _authRequest.getLoggedUser();
      return Right(user);
    } on MyFirebaseAuthException catch (e) {
      return Left(AuthException(message: e.message ?? 'user logged not found'));
    }
  }

  @override
  Future<Either<AuthException, AuthResponse>> signInWithCpfAndPassword(
      {required String cpfNumber, required String password}) async {
    try {
      final credential = await _authRequest.signInWithCpfAndPassword(
          cpfNumber: cpfNumber, password: password);
      return Right(credential);
    } on MyFirebaseAuthException catch (e) {
      return Left(AuthException(message: e.message ?? 'Sign in unsuccessful'));
    }
  }

  @override
  Future<Either<AuthException, void>> signOut() async {
    try {
      return Right(await _authRequest.signOut());
    } on MyFirebaseAuthException catch (e) {
      return Left(AuthException(message: e.message ?? 'Sign out unsuccessful'));
    }
  }
}
