import '../../../../core/core_services.dart';
import '../../../../core/services/account/account_service.dart';
import '../../../../core/helpers/controller.dart';

class SplashController extends InteraController {
  SplashController(this._accountService);

  final AccountService _accountService;

  Future<void> handleUser() async {
    var user = await _accountService.fetchLoggedUser();

    if (user == null)
      router.toLogin();
    else
      router.toHome(closeAll: true);
  }

  @override
  void onInit() {
    super.onInit();

    handleUser();
  }
}
