abstract class Failure implements Exception {
  final String? message;

  Failure({this.message});
}

class AuthenticationFailure extends Failure {
  AuthenticationFailure({String? message}) : super(message: message);
}
