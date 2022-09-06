import 'package:firebase_auth/firebase_auth.dart';

import '../../../domain/contracts/gateways/auth_request.dart';
import '../../../domain/contracts/gateways/my_logger.dart';
import 'logger_impl.dart';

final _logger = LoggerImpl();

class FirebaseAuthImpl implements AuthRequest {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  MyLogger getLogger() {
    return _logger;
  }

  @override
  Future<AuthResponse> createUserWithNameAndEmailAndPassword(
      {required String email,
      required String password,
      required String userName}) async {
    final credential = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    await credential.user?.updateDisplayName(userName);
    _logs(
      auth: _auth,
      method: 'Create User With Email And Password',
    );
    return AuthResponse(data: credential);
  }

  @override
  Future<AuthRequest> getInstance() async {
    return this;
  }

  @override
  Future<AuthResponse> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    final credential = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    _logs(
      auth: _auth,
      method: 'Sign In With Email And Password',
    );
    return AuthResponse(data: credential);
  }

  @override
  Future<void> signOut() async {
    await _auth.signOut();
    _logs(auth: _auth, method: 'Sign Out');
  }

  @override
  AuthResponse getLoggedUser() {
    final user = _auth.currentUser;
    _logs(auth: _auth.currentUser ?? 'Null user', method: 'Get Logged User');
    return AuthResponse(data: user);
  }

  void _logs({required dynamic auth, required String method}) {
    _logger.info('############### $method ###############');
    _logger.info('FIREBASE AUTH: $auth');
    _logger.info('######################################');
  }
}
