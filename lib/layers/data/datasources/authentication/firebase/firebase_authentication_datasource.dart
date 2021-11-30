import 'package:firebase_auth/firebase_auth.dart';

import '../../../dto/user_dto.dart';
import '../../../../domain/entities/CredentialsEntity.dart';
import '../authentication_datasource.dart';

class FirebaseAuthenticationDatasource implements AuthenticationDatasource {
  final FirebaseAuth _firebaseInstance = FirebaseAuth.instance;

  @override
  Future<UserDto> authenticateWithEmailAndPassword(CredentialsEntity credentials) async {
    try {
      final UserCredential _firebaseCredentials = await _firebaseInstance.signInWithEmailAndPassword(
        email: credentials.email,
        password: credentials.password,
      );

      return UserDto.fromFirebaseUser(_firebaseCredentials);
    } on FirebaseAuthException catch (e) {
      String exception = 'Ocorreu um erro';

      if (e.code == 'user-not-found') {
        exception = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        exception = 'Wrong password provided for that user.';
      }
      
      throw Exception(exception);
    } catch (e) {
      ///ToDo: Tratar os erros do login criando erros genéricos
      ///ToDo: Usar o Either para a tratativa de Success/Fail
      throw Exception('Erro');
    }
  }
}
