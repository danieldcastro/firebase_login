import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_login/infrastructure/errors/auth_exception.dart';
import 'package:firebase_login/infrastructure/models/remote_user_model.dart';
import 'package:firebase_login/infrastructure/provider/datasource.dart';

import '../../../domain/contracts/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final Datasource _datasource;

  AuthRepositoryImpl({required Datasource datasource})
      : _datasource = datasource;

  @override
  Future<Either<AuthException, RemoteUserModel>>
      createUserWithNameAndEmailAndPassword(
          {required String email,
          required String password,
          required String userName}) async {
    final result = await _datasource.createUserWithNameAndEmailAndPassword(
        email: email, password: password, userName: userName);

    if (result.isLeft) {
      return Left(result.left);
    } else {
      final credential = result.right.data as UserCredential;
      return Right(RemoteUserModel(
        id: credential.user?.uid ?? 'No Id',
        name: credential.user?.displayName ?? 'No Name',
        email: credential.user?.email ?? 'No Email',
      ));
    }
  }

  @override
  Either<AuthException, RemoteUserModel> getLoggedUser() {
    final result = _datasource.getLoggedUser();
    if (result.isLeft) {
      return Left(result.left);
    } else {
      final user = result.right.data as User?;
      return Right(user != null
          ? RemoteUserModel(
              id: user.uid,
              name: user.displayName ?? '',
              email: user.email ?? '',
            )
          : RemoteUserModel.empty());
    }
  }

  @override
  Future<Either<AuthException, RemoteUserModel>> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    final result = await _datasource.signInWithEmailAndPassword(
        email: email, password: password);

    if (result.isLeft) {
      return Left(result.left);
    } else {
      final credential = result.right.data as UserCredential;
      return Right(RemoteUserModel(
        id: credential.user?.uid ?? 'No Id',
        name: credential.user?.displayName ?? 'No Name',
        email: credential.user?.email ?? 'No Email',
      ));
    }
  }

  @override
  Future<Either<AuthException, void>> signOut() async {
    final result = await _datasource.signOut();
    if (result.isLeft) {
      return Left(result.left);
    } else {
      return Right(result.right);
    }
  }
}
