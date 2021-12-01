import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../authentication_datasource.dart';
import '../../../dto/user_dto.dart';
import '../../../../domain/entities/CredentialsEntity.dart';
import '../../../../../core/constants/local_storage_keys.dart';
import '../../../../../core/enums/auth_type.dart';
import '../../../../../core/settings.dart';
import '../../../../../core/services/local_storage/local_storage_service.dart';

class FirebaseAuthenticationDatasource implements AuthenticationDatasource {
  FirebaseAuthenticationDatasource(this._localStorageService);

  final LocalStorageService _localStorageService;
  final FirebaseAuth _firebaseInstance = FirebaseAuth.instance;

  @override
  Future<UserDto> authenticateWithEmailAndPassword(CredentialsEntity credentials) async {
    try {
      final UserCredential _firebaseCredentials = await _firebaseInstance.signInWithEmailAndPassword(
        email: credentials.email,
        password: credentials.password,
      );

      final UserDto user = UserDto.fromFirebaseUser(_firebaseCredentials);

      await _saveDataInLocalStorage(user: user);

      return user;
    } on FirebaseAuthException catch (e) {
      String exception = 'Ocorreu um erro';

      if (e.code == 'user-not-found') {
        exception = 'Nenhum usuário encontrado com este e-mail';
      } else if (e.code == 'wrong-password') {
        exception = 'A senha inserida está incorreta. Tente novamente';
      }

      throw Exception(exception);
    } catch (e) {
      ///ToDo: Tratar os erros do login criando erros genéricos
      ///ToDo: Usar o Either para a tratativa de Success/Fail
      throw Exception(e);
    }
  }

  @override
  Future<UserDto> authenticateWithGoogle() async {
    try {
      final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email', 'https://www.googleapis.com/auth/contacts.readonly']);

      final GoogleSignInAccount? googleCredentials = await _googleSignIn.signIn();

      if (googleCredentials != null) {
        final UserDto user = UserDto.fromGoogleUser(googleCredentials);

        await _saveDataInLocalStorage(user: user, authType: AuthType.Google);

        return user;
      } else {
        throw Exception('Não foi possível efetuar o login com o Google. Tente novamente');
      }
    } catch (e) {
      ///ToDo: Tratar os erros do login criando erros genéricos
      ///ToDo: Usar o Either para a tratativa de Success/Fail
      throw Exception(e);
    }
  }

  Future<void> _saveDataInLocalStorage({UserDto? user, AuthType authType = AuthType.EmailAndPassword}) async {
    try {
      final List<Future> futures = [
        _localStorageService.write(key: LocalStorageKeys.lastLoginType, value: authType.toIndex.toString()),
        _localStorageService.write(key: LocalStorageKeys.lastLoginDate, value: DateTime.now().toString()),
      ];

      if (user != null) {
        Settings.user = user;

        futures.add(_localStorageService.write(key: LocalStorageKeys.loggedUserInfo, value: user.toJson()));
      }

      await Future.wait(futures);
    } catch (e) {
      throw e;
    }
  }
}
