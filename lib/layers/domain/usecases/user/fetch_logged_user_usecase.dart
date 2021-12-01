import '../../entities/UserEntity.dart';

abstract class FetchLoggedUserUseCase{
  Future<UserEntity?> call();
}