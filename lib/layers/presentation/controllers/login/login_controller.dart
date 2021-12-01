import 'helpers/authentication_helper.dart';
import '../../../domain/entities/UserEntity.dart';
import '../../../domain/usecases/authentication/authenticate_with_google_usecase.dart';
import '../../../data/dto/user_dto.dart';
import '../../../domain/usecases/authentication/authenticate_with_email_and_password_usecase.dart';
import '../../../../../core/helpers/controller.dart';
import '../../../../../core/helpers/intera_utils.dart';

class LoginController extends InteraController {
  LoginController(this._authenticateWithEmailAndPassword, this._authenticateWithGoogle);

  final AuthenticationHelper _authHelper = AuthenticationHelper();
  final AuthenticateWithEmailAndPasswordUseCase _authenticateWithEmailAndPassword;
  final AuthenticateWithGoogleUseCase _authenticateWithGoogle;

  String get email => _authHelper.email;
  String get password => _authHelper.password;
  bool get validated => _authHelper.validated;

  set email(String value) => _authHelper.email = value;
  set password(String value) => _authHelper.password = value;

  Future<UserEntity?> authenticateWithEmailAndPassword() async {
    if (loading == true) return null;

    try {
      await InteraUtils.hideKeyboard();

      loading = true;

      if (validated) {
        return await _authenticateWithEmailAndPassword(_authHelper.toCredentialsEntity());
      }
    } catch (e) {
      // TODO: Tratar exceção com algum notify
      throw e;
    } finally {
      loading = false;
    }
  }

  Future<UserDto?> authenticateWithGoogle() async {
    if (loading == true) return null;

    try {
      await InteraUtils.hideKeyboard();

      loading = true;

      return await _authenticateWithGoogle();
    } catch (e) {
      // TODO: Tratar exceção com algum notify
      throw e;
    } finally {
      loading = false;
    }
  }
}
