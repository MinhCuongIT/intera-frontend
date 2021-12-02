import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/core_services.dart';
import '../../../../core/constants/local_storage_keys.dart';
import '../../../../core/services/local_storage/local_storage_service.dart';
import '../../../domain/usecases/user/logout_usecase.dart';

class LogoutUseCaseImp implements LogoutUseCase {
  const LogoutUseCaseImp(this._localStorage);

  final LocalStorageService _localStorage;

  @override
  Future<void> call() async {
    try {
      final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

      await Future.wait([
        _firebaseAuth.signOut(),
        _localStorage.delete(key: LocalStorageKeys.loggedUserInfo),
      ]);

      var userInfo = await _localStorage.read(key: LocalStorageKeys.loggedUserInfo);

      if (_firebaseAuth.currentUser == null && userInfo == null) router.toLogin();
    } catch (e) {
      throw e;
    }
  }
}
