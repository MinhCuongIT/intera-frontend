import '../../routes.dart';

abstract class InteraRouter {
  Future<T?>? to<T>(String route, {dynamic arguments});
  Future<T?>? toLogin<T>({String route = InteraRoutes.LOGIN});
  Future<T?>? toHome<T>({String route = InteraRoutes.HOME});
  Future<T?>? toSettings<T>({String route = InteraRoutes.SETTINGS});
}
