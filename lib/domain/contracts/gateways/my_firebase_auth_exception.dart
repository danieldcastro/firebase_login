abstract class MyFirebaseAuthException {
  Future<MyFirebaseAuthException> getInstance();

  String? get message;
  String get code;
}
