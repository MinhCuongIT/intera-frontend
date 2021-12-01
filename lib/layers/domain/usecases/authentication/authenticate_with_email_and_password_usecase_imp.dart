import '../../entities/UserEntity.dart';
import '../../entities/CredentialsEntity.dart';
import '../../repositories/authentication/authentication_repository.dart';
import 'authenticate_with_email_and_password_usecase.dart';

class AuthenticateWithEmailAndPasswordUseCaseImp implements AuthenticateWithEmailAndPasswordUseCase {
  const AuthenticateWithEmailAndPasswordUseCaseImp(this._repository);

  final AuthenticationRepository _repository;

  @override
  Future<UserEntity> call(CredentialsEntity credentials) async {
    if (credentials.isValid) {
      var user = await _repository.authenticateWithEmailAndPassword(credentials);

      return user.toEntity();
    } else {
      throw Exception('Credentials is not valid');
    }
  }
}
