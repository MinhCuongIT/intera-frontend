import '../helpers/authentication_dto.dart';
import '../../../../../core/helpers/controller.dart';

class LoginController extends InteraController {
  final AuthenticationDto dto = AuthenticationDto();

  String get email => dto.email;
  set email(String value) => dto.email = value;

  String get password => dto.password;
  set password(String value) => dto.password = value;

  bool get validated => dto.validated;
  bool get isLogged => dto.isLogged;

  Future<void> authenticate() async {
    loading = true;

    await Future.delayed(Duration(seconds: 4));

    print('$email|$password');

    loading = false;
  }
}
