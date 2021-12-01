import '../../../data/dto/user_dto.dart';

abstract class AuthenticateWithGoogleUseCase {
  Future<UserDto> call();
}