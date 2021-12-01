import 'package:firebase_core/firebase_core.dart';

class FirebaseExceptionHandler {
  FirebaseExceptionHandler._();

  static String getMessage(FirebaseException error) {
    String exception = 'Ocorreu um erro. Tente novamente!';

    switch (error.code) {
      case "ERROR_USER_NOT_FOUND":
      case 'user-not-found':
        exception = 'O usuário com este e-mail não existe.';
        break;

      case "ERROR_WRONG_PASSWORD":
      case 'wrong-password':
        exception = 'Sua senha está incorreta.';
        break;

      case "ERROR_EMAIL_ALREADY_IN_USE":
      case "account-exists-with-different-credential":
      case "email-already-in-use":
        exception = "O email já foi cadastrado. Faça o login ou redefina sua senha.";
        break;

      case "ERROR_USER_DISABLED":
      case "user-disabled":
        exception = "O usuário com este e-mail foi desativado.";
        break;

      case "ERROR_TOO_MANY_REQUESTS":
      case "operation-not-allowed":
        exception = "Você excedeu a quantidade de tentativas, por favor tente novamente mais tarde.";
        break;

      case "ERROR_OPERATION_NOT_ALLOWED":
      case "operation-not-allowed":
        exception = "Erro do servidor, por favor tente novamente mais tarde.";
        break;

      case "ERROR_INVALID_EMAIL":
      case "invalid-email":
        exception = "Seu endereço de e-mail está incorreto.";
        break;
    }

    return exception;
  }
}
