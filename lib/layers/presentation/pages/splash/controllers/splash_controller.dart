import 'package:intera/core/core_services.dart';

import '../../../../../core/helpers/controller.dart';

class SplashController extends InteraController {
  Future<void> initApp() async {
    await Future.delayed(Duration(seconds: 1));
    router.toLogin();
  }

  @override
  void onInit() {
    super.onInit();
    
    initApp();
  }
}
