import '../../dto/user_dto.dart';
import '../../../domain/entities/CredentialsEntity.dart';

abstract class AuthenticationDatasource {
  Future<UserDto> authenticateWithEmailAndPassword(CredentialsEntity credentials);
  Future<UserDto> authenticateWithGoogle();
}