import '../../entities/UserEntity.dart';
import '../../entities/CredentialsEntity.dart';

abstract class AuthenticateWithEmailAndPasswordUseCase {
  Future<UserEntity> call(CredentialsEntity credentials);
}