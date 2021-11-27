import 'package:get/get.dart';

import 'router.dart';
import '../../routes.dart';

class GetXInteraRouter extends GetxService implements InteraRouter {
  @override
  Future<T?>? to<T>(String route, {bool closeAll = false, dynamic arguments}) =>
      closeAll == true ? Get.offAndToNamed(route, arguments: arguments) : Get.toNamed<T>(route, arguments: arguments);

  @override
  Future<T?>? toLogin<T>({String route = InteraRoutes.LOGIN, bool closeAll = true}) => to<T>(route, closeAll: closeAll);

  @override
  Future<T?>? toHome<T>({String route = InteraRoutes.HOME, bool closeAll = false}) => to<T>(route, closeAll: closeAll);

  @override
  Future<T?>? toSettings<T>({String route = InteraRoutes.SETTINGS, bool closeAll = false}) => to<T>(route, closeAll: closeAll);
}

InteraRouter get router => Get.find<InteraRouter>();
