import '../helpers/authentication_helper.dart';
import '../../../../../core/helpers/intera_utils.dart';
import '../../../../domain/usecases/authentication/authenticate_with_email_and_password_usecase.dart';
import '../../../../../core/helpers/controller.dart';

class LoginController extends InteraController {
  LoginController(this._authenticateWithEmailAndPassword);

  final AuthenticationHelper _authHelper = AuthenticationHelper();
  final AuthenticateWithEmailAndPasswordUseCase _authenticateWithEmailAndPassword;

  String get email => _authHelper.email;
  String get password => _authHelper.password;
  bool get validated => _authHelper.validated;

  set email(String value) => _authHelper.email = value;
  set password(String value) => _authHelper.password = value;

  Future<void> authenticate() async {
    if (loading == true) return;

    try {
      await InteraUtils.hideKeyboard();

      loading = true;

      if (validated) {
        var user = await _authenticateWithEmailAndPassword(_authHelper.toCredentialsEntity());
      }
    } catch (e) {
      print('Tratar exceção');
    } finally {
      loading = false;
    }
  }
}
