import 'package:flutter/material.dart';

import 'intera_app.dart';
import 'core/initializer.dart';
import 'core/routes.dart';

void main() async {
  await Initializer.init();

  runApp(InteraApp(initialRoute: InteraRoutes.initialRoute));
}
