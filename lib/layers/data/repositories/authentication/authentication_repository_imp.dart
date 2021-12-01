import '../../datasources/authentication/authentication_datasource.dart';
import '../../dto/user_dto.dart';
import '../../../domain/entities/CredentialsEntity.dart';
import '../../../domain/repositories/authentication/authentication_repository.dart';

class AuthenticationRepositoryImp implements AuthenticationRepository {
  const AuthenticationRepositoryImp(this._datasource);

  final AuthenticationDatasource _datasource;

  @override
  Future<UserDto> authenticateWithEmailAndPassword(CredentialsEntity credentials) async =>
      await _datasource.authenticateWithEmailAndPassword(credentials);

  Future<UserDto> authenticateWithGoogle() async => await _datasource.authenticateWithGoogle();
}
