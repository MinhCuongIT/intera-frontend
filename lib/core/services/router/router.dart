import '../../consts/routes.dart';

abstract class Router {
  Future<T?>? to<T>(String route, {dynamic arguments});
  Future<T?>? toLogin<T>({String route = Routes.LOGIN});
  Future<T?>? toHome<T>({String route = Routes.HOME});
  Future<T?>? toSettings<T>({String route = Routes.SETTINGS});
}
