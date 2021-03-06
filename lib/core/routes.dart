import 'package:get/get.dart';

import '../layers/presentation/pages.dart';
import '../layers/presentation/ioc.dart';

class InteraRoutes {
  static const SPLASH = '/';
  static const HOME = '/home';
  static const LOGIN = '/login';
  static const SETTINGS = '/settings';

  static String get initialRoute => SPLASH;

  static List<GetPage> get routes => [
        GetPage(
          name: SPLASH,
          page: () => SplashPage(),
          binding: SplashIoC(),
        ),
        GetPage(
          name: LOGIN,
          page: () => LoginPage(),
          binding: LoginIoC(),
        ),
        GetPage(
          name: HOME,
          page: () => HomePage(),
        ),
      ];
}
