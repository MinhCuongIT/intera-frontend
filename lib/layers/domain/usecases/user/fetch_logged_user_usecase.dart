import '../../../data/dto/user_dto.dart';

abstract class FetchLoggedUserUseCase{
  Future<UserDto?> call();
}