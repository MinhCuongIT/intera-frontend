import 'package:get/get.dart';

import 'router.dart';
import '../../consts/routes.dart';

class GetXRouter extends GetxService implements Router {
  @override
  Future<T?>? to<T>(String route, {dynamic arguments}) => Get.toNamed<T>(route, arguments: arguments);

  @override
  Future<T?>? toLogin<T>({String route = Routes.LOGIN}) => to<T>(route);

  @override
  Future<T?>? toHome<T>({String route = Routes.HOME}) => to<T>(route);

  @override
  Future<T?>? toSettings<T>({String route = Routes.SETTINGS}) => to<T>(route);
}
