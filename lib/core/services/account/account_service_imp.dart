import 'package:get/get.dart';

import 'account_service.dart';
import '../../../layers/domain/usecases/user/fetch_logged_user_usecase.dart';
import '../../../layers/domain/entities/UserEntity.dart';

class AccountServiceImp extends GetxService implements AccountService {
  AccountServiceImp(this._fetchLoggedUser);

  final FetchLoggedUserUseCase _fetchLoggedUser;

  @override
  Future<UserEntity?> fetchLoggedUser() async => await _fetchLoggedUser();

  @override
  Future<bool> logout() async {
    // TODO: implement logout
    throw UnimplementedError();
  }
}
