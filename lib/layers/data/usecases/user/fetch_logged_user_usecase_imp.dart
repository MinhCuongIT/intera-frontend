import '../../../../core/constants/local_storage_keys.dart';
import '../../../../core/services/local_storage/local_storage_service.dart';
import '../../../../core/settings.dart';
import '../../../domain/entities/UserEntity.dart';
import '../../../domain/usecases/user/fetch_logged_user_usecase.dart';
import '../../dto/user_dto.dart';

class FetchLoggedUserUseCaseImp implements FetchLoggedUserUseCase {
  const FetchLoggedUserUseCaseImp(this._localStorage);

  final LocalStorageService _localStorage;

  @override
  Future<UserEntity?> call() async {
    try {
      final String? userJson = await _localStorage.read(key: LocalStorageKeys.loggedUserInfo);

      if (userJson == null) return null;

      final UserEntity loggedUser = UserDto.fromJson(userJson).toEntity();

      Settings.user = loggedUser;

      return loggedUser;
    } catch (e) {
      throw e;
    }
  }
}
