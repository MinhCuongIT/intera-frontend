import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intera/core/theme/intera_theme.dart';

import 'core/consts/routes.dart';

class InteraApp extends StatelessWidget {
  final String initialRoute;

  const InteraApp({required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Intera',
      debugShowCheckedModeBanner: false,
      initialRoute: initialRoute,
      getPages: Routes.routes,
      defaultTransition: Transition.cupertino,
      theme: InteraTheme.light,
      darkTheme: InteraTheme.dark,
      themeMode: ThemeMode.light,
      builder: (context, child) => GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        behavior: HitTestBehavior.opaque,
        child: child,
      ),
    );
  }
}
