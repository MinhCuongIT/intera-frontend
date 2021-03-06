import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:get/get.dart';

import 'core/helpers/screen_breakpoints.dart';
import 'core/theme/intera_theme.dart';
import 'core/routes.dart';

class InteraApp extends StatelessWidget {
  final String initialRoute;

  const InteraApp({required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Intera',
      debugShowCheckedModeBanner: false,
      initialRoute: initialRoute,
      getPages: InteraRoutes.routes,
      defaultTransition: Transition.cupertino,
      theme: InteraTheme.light,
      darkTheme: InteraTheme.dark,
      themeMode: ThemeMode.light,
      builder: (context, child) => ResponsiveWrapper.builder(
        ClampingScrollWrapper.builder(
          context,
          GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            behavior: HitTestBehavior.opaque,
            child: child,
          ),
        ),
        breakpoints: ScreenBreakpoints.breakpoints,
      ),
    );
  }
}
