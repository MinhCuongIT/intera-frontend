enum AuthType { EmailAndPassword, Google, Apple }

extension AuthTypeExtension on AuthType {
  int get toIndex {
    switch (this) {
      case AuthType.EmailAndPassword:
        return 0;
      case AuthType.Google:
        return 1;
      case AuthType.Apple:
        return 2;
      default:
        throw 'Index not found';
    }
  }

  String get type {
    switch (this) {
      case AuthType.EmailAndPassword:
        return 'e-mail-and-password';
      case AuthType.Google:
        return 'google';
      case AuthType.Apple:
        return 'apple';
      default:
        throw 'Type not found';
    }
  }
}

extension IntAuthTypeExtension on int {
  AuthType get convertToAuthType {
    switch (this) {
      case 0:
        return AuthType.EmailAndPassword;
      case 1:
        return AuthType.Google;
      case 2:
        return AuthType.Apple;
      default:
        throw 'Type not found';
    }
  }
}

