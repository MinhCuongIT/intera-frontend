import '../../../core/helpers/intera_utils.dart';

class CredentialsEntity {
  CredentialsEntity({
    required this.email,
    required this.password,
  })  : assert(email.isNotEmpty),
        assert(password.isNotEmpty);

  final String email;
  final String password;

  bool get isValid =>  email.isNotEmpty && InteraUtils.isValidEmail(email) && password.isNotEmpty && password.length >= 6;
}
