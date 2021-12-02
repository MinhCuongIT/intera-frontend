import '../../../layers/domain/entities/UserEntity.dart';

abstract class AccountService {
  Future<UserEntity?> fetchLoggedUser();
  Future<void> logout();
}
