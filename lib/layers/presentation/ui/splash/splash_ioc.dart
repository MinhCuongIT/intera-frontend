import 'package:get/get.dart';

import '../../controllers/splash/splash_controller.dart';

class SplashIoC extends Bindings {
  @override
  Future<void> dependencies() async {
    await Get.putAsync(() async => SplashController());
  }
}
