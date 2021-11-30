import 'package:get/get.dart';

import '../../../../domain/entities/CredentialsEntity.dart';
import '../../../../../../core/helpers/intera_utils.dart';

class AuthenticationHelper {
  final RxString _email = RxString('');
  String get email => _email.value;
  set email(String value) => _email.value = value;

  final RxString _password = RxString('');
  String get password => _password.value;
  set password(String value) => _password.value = value;

  bool get validated => email.isNotEmpty && InteraUtils.isValidEmail(email) && password.isNotEmpty;

  CredentialsEntity toCredentialsEntity() => CredentialsEntity(email: email, password: password);
}
