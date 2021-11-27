import 'package:get/get.dart';

import 'viewModels/login_viewModel.dart';

class LoginIoC extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginViewModel());
  }
}
