import '../../../data/dto/user_dto.dart';
import '../../repositories/authentication/authentication_repository.dart';
import 'authenticate_with_google_usecase.dart';

class AuthenticateWithGoogleUseCaseImp implements AuthenticateWithGoogleUseCase {
  const AuthenticateWithGoogleUseCaseImp(this._repository);

  final AuthenticationRepository _repository;

  @override
  Future<UserDto> call() async => await _repository.authenticateWithGoogle();
}
