import '../../routes.dart';

abstract class InteraRouter {
  Future<T?>? to<T>(String route, {bool closeAll = false, dynamic arguments});
  Future<T?>? toLogin<T>({String route = InteraRoutes.LOGIN, bool closeAll = true});
  Future<T?>? toHome<T>({String route = InteraRoutes.HOME, bool closeAll = false});
  Future<T?>? toSettings<T>({String route = InteraRoutes.SETTINGS, bool closeAll = false});
}
