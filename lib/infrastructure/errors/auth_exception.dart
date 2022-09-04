class AuthException {
  final String _message;

  const AuthException({required String message}) : _message = message;

  factory AuthException.error([String value = '']) {
    return AuthException(message: value);
  }

  @override
  String toString() {
    return _message;
  }
}
