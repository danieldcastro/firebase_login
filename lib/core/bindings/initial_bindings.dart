import 'package:firebase_login/domain/contracts/gateways/auth_request.dart';
import 'package:firebase_login/domain/contracts/repositories/auth_repository.dart';
import 'package:firebase_login/domain/usecases/get_logged_user/get_logged_user_usecase.dart';
import 'package:firebase_login/domain/usecases/get_logged_user/get_logged_user_usecase_impl.dart';
import 'package:firebase_login/domain/usecases/sign_out/sign_out_usecase.dart';
import 'package:firebase_login/domain/usecases/sign_out/sign_out_usecase_impl.dart';
import 'package:firebase_login/infrastructure/contracts/gateways/firebase_auth_impl.dart';
import 'package:get/get.dart';

import '../../domain/contracts/gateways/my_logger.dart';
import '../../domain/usecases/create_user_with_name_and_email_and_password/create_user_with_name_and_email_and_password_usecase.dart';
import '../../domain/usecases/create_user_with_name_and_email_and_password/create_user_with_name_and_email_and_password_usecase_impl.dart';
import '../../domain/usecases/sign_in_with_email_and_password/sign_in_with_email_and_password_usecase.dart';
import '../../domain/usecases/sign_in_with_email_and_password/sign_in_with_email_and_password_usecase_impl.dart';
import '../../infrastructure/contracts/gateways/logger_impl.dart';
import '../../infrastructure/contracts/repositories/auth_repository_impl.dart';
import '../../infrastructure/provider/datasource.dart';
import '../../infrastructure/provider/remote/datasource_impl.dart';
import '../services/firebase_auth_service.dart';

class InitialBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<AuthRequest>(FirebaseAuthImpl());

    Get.put<Datasource>(
      DatasourceImpl(
        authRequest: Get.find<AuthRequest>(),
      ),
    );

    Get.put<MyLogger>(LoggerImpl());

    Get.put<AuthRepository>(
      AuthRepositoryImpl(datasource: Get.find<Datasource>()),
    );

    Get.put<CreateUserWithNameAndEmailAndPasswordUsecase>(
        CreateUserWithNameAndEmailAndPasswordUsecaseImpl(
            repository: Get.find<AuthRepository>()));

    Get.put<SignInWithEmailAndPasswordUsecase>(
        SignInWithEmailAndPasswordUsecaseImpl(
            repository: Get.find<AuthRepository>()));

    Get.put<GetLoggedUserUsecase>(
        GetLoggedUserUsecaseImpl(repository: Get.find<AuthRepository>()));

    Get.put<SignOutUsecase>(
        SignOutUsecaseImpl(repository: Get.find<AuthRepository>()));

    Get.put<FirebaseAuthService>(FirebaseAuthService(
        createUserWithNameAndEmailAndPasswordUsecase:
            Get.find<CreateUserWithNameAndEmailAndPasswordUsecase>(),
        getLoggedUserUsecase: Get.find<GetLoggedUserUsecase>(),
        logger: Get.find<MyLogger>(),
        signInWithEmailAndPasswordUsecase:
            Get.find<SignInWithEmailAndPasswordUsecase>(),
        signOutUsecase: Get.find<SignOutUsecase>()));
  }
}
