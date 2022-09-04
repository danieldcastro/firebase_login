import 'package:firebase_login/domain/contracts/gateways/my_logger.dart';

abstract class AuthRequest {
  Future<AuthRequest> getInstance();
  MyLogger getLogger();
  Future<AuthResponse> createUserWithNameAndCpfAndPassword(
      {required String cpfNumber,
      required String password,
      required String userName});

  Future<AuthResponse> signInWithCpfAndPassword(
      {required String cpfNumber, required String password});

  Future<void> signOut();

  AuthResponse getLoggedUser();
}

class AuthResponse {
  final dynamic data;

  AuthResponse({required this.data});
}
