import 'package:get/get.dart';

import 'account_service.dart';
import '../../../layers/domain/usecases/user/logout_usecase.dart';
import '../../../layers/domain/usecases/user/fetch_logged_user_usecase.dart';
import '../../../layers/domain/entities/UserEntity.dart';

class AccountServiceImp extends GetxService implements AccountService {
  AccountServiceImp(this._fetchLoggedUser, this._logout);

  final FetchLoggedUserUseCase _fetchLoggedUser;
  final LogoutUseCase _logout;

  @override
  Future<UserEntity?> fetchLoggedUser() async => await _fetchLoggedUser();

  @override
  Future<void>  logout() async => await _logout();
}
