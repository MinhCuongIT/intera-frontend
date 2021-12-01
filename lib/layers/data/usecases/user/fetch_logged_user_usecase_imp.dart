import 'package:intera/core/constants/local_storage_keys.dart';
import 'package:intera/core/services/local_storage/local_storage_service.dart';
import 'package:intera/core/settings.dart';
import 'package:intera/layers/data/dto/user_dto.dart';
import 'package:intera/layers/domain/usecases/user/fetch_logged_user_usecase.dart';

class FetchLoggedUserUseCaseImp implements FetchLoggedUserUseCase {
  const FetchLoggedUserUseCaseImp(this._localStorage);

  final LocalStorageService _localStorage;

  @override
  Future<UserDto?> call() async {
    try {
      final String? userJson = await _localStorage.read(key: LocalStorageKeys.loggedUserInfo);

      if (userJson == null) return null;

      final UserDto loggedUser = UserDto.fromJson(userJson);

      Settings.user = loggedUser;

      return loggedUser;
    } catch (e) {
      throw e;
    }
  }
}
