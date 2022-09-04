import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_login/domain/contracts/gateways/my_firebase_auth_exception.dart';
import 'package:get/get.dart';

class FirebaseAuthExceptionImpl extends GetxService
    implements MyFirebaseAuthException {
  final FirebaseAuthException _firebaseAuthException =
      FirebaseAuthException(code: FirebaseAuthExceptionImpl().code);

  @override
  Future<MyFirebaseAuthException> getInstance() async {
    return this;
  }

  @override
  String? get message => _firebaseAuthException.message;

  @override
  String get code => _firebaseAuthException.code;
}
