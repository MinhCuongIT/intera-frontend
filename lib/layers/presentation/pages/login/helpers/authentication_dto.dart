import 'package:get/get.dart';

import '../../../../../core/helpers/intera_utils.dart';

class AuthenticationDto {
  final RxString _email = RxString('');
  String get email => _email.value;
  set email(String value) => _email.value = value;

  final RxString _password = RxString('');
  String get password => _password.value;
  set password(String value) => _password.value = value;

  bool get isLogged => true;

  bool get validated => email.isNotEmpty && InteraUtils.isValidEmail(email) && password.isNotEmpty;
}

