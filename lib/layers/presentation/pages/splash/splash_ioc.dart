import 'package:get/get.dart';

import 'viewModels/splash_viewModel.dart';

class SplashIoC extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashViewModel());
  }
}
