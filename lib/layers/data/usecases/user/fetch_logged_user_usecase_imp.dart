import 'package:firebase_auth/firebase_auth.dart';

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
      var _userFirebase = FirebaseAuth.instance.currentUser;
      
      final String? userJson = await _localStorage.read(key: LocalStorageKeys.loggedUserInfo);

      if (userJson == null || _userFirebase == null) return null;

      final UserEntity loggedUser = UserDto.fromJson(userJson).toEntity();

      if (_firebaseWithLocalUserIsEquals(firebaseUser: _userFirebase, userLocal: loggedUser)) {
        Settings.user = loggedUser;
        return loggedUser;
      } else {
        //TODO: Fazer o logout
        return null;
      }
    } catch (e) {
      throw e;
    }
  }

  bool _firebaseWithLocalUserIsEquals({required User firebaseUser, required UserEntity userLocal}) {
    if (userLocal.email != firebaseUser.email) return false;
    if (userLocal.id != firebaseUser.uid) return false;
    if (userLocal.name != firebaseUser.displayName) return false;
    if (userLocal.phoneNumber != firebaseUser.phoneNumber) return false;
    if (userLocal.photoURL != firebaseUser.photoURL) return false;

    return true;
  }
}
