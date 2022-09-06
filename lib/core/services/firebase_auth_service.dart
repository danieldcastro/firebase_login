import 'package:firebase_login/domain/entities/user_entity.dart';
import 'package:firebase_login/domain/usecases/get_logged_user/get_logged_user_usecase.dart';
import 'package:firebase_login/domain/usecases/sign_out/sign_out_usecase.dart';
import 'package:get/get.dart';

import '../../domain/contracts/gateways/my_logger.dart';
import '../../domain/usecases/create_user_with_name_and_email_and_password/create_user_with_name_and_email_and_password_usecase.dart';
import '../../domain/usecases/sign_in_with_email_and_password/sign_in_with_email_and_password_usecase.dart';
import '../../presentation/theme/app_colors.dart';
import '../util/global_show_snackbar_function.dart';

class FirebaseAuthService extends GetxService {
  final MyLogger _logger;
  final CreateUserWithNameAndEmailAndPasswordUsecase
      _createUserWithNameAndEmailAndPasswordUsecase;
  final SignInWithEmailAndPasswordUsecase _signInWithEmailAndPasswordUsecase;
  final GetLoggedUserUsecase _getLoggedUserUsecase;
  final SignOutUsecase _signOutUsecase;
  FirebaseAuthService({
    required CreateUserWithNameAndEmailAndPasswordUsecase
        createUserWithNameAndEmailAndPasswordUsecase,
    required SignInWithEmailAndPasswordUsecase
        signInWithEmailAndPasswordUsecase,
    required GetLoggedUserUsecase getLoggedUserUsecase,
    required SignOutUsecase signOutUsecase,
    required MyLogger logger,
  })  : _createUserWithNameAndEmailAndPasswordUsecase =
            createUserWithNameAndEmailAndPasswordUsecase,
        _signInWithEmailAndPasswordUsecase = signInWithEmailAndPasswordUsecase,
        _getLoggedUserUsecase = getLoggedUserUsecase,
        _signOutUsecase = signOutUsecase,
        _logger = logger;
  Future<UserEntity> createUserWithNameAndEmailAndPassword(
      {required String email,
      required String password,
      required String userName}) async {
    final result = await _createUserWithNameAndEmailAndPasswordUsecase.call(
        email: email, password: password, userName: userName);
    if (result.isRight) {
      _logger.info('Created user: ${result.right.toString()}');
      return result.right;
    } else {
      _logger.error('Error when create user: ${result.left}');
      GlobalShowSnackbarFunction().show('Não foi possível criar seu usuário.',
          color: AppColors().normalRedColor);
      return UserEntity.empty();
    }
  }

  Future<UserEntity> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final result = await _signInWithEmailAndPasswordUsecase.call(
        email: email, password: password);
    if (result.isRight) {
      _logger.info('Sign in with user: ${result.right.toString()}');
      return result.right;
    } else {
      _logger.error('Error when sign in: ${result.left}');
      GlobalShowSnackbarFunction()
          .show(result.left.toString(), color: AppColors().normalRedColor);
      return UserEntity.empty();
    }
  }

  UserEntity? getLoggedUser() {
    final result = _getLoggedUserUsecase.call();
    if (result.isRight) {
      return result.right != null
          ? UserEntity(name: result.right!.name, email: result.right!.email)
          : null;
    } else {
      _logger.error('Error when get logged user: ${result.left}');
      GlobalShowSnackbarFunction().show(
          'Não foi possível pegar o usuário logado.',
          color: AppColors().normalRedColor);
      return UserEntity.empty();
    }
  }

  Future<void> signOut(Function() whenSuccess) async {
    final result = await _signOutUsecase.call();

    if (result.isRight) {
      whenSuccess();
      return result.right;
    } else {
      _logger.error('Error when Sign out: ${result.left}');
      GlobalShowSnackbarFunction()
          .show('Não foi possível sair.', color: AppColors().normalRedColor);
    }
  }
}
