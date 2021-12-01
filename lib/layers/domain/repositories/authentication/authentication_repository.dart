import '../../../data/dto/user_dto.dart';
import '../../entities/CredentialsEntity.dart';

abstract class AuthenticationRepository {
  Future<UserDto> authenticateWithEmailAndPassword(CredentialsEntity credentials);
  Future<UserDto> authenticateWithGoogle();
}