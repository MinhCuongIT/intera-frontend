import 'package:flutter/material.dart';

import 'intera_app.dart';
import 'core/initializer.dart';
import 'core/consts/routes.dart';

void main() async {
  await Initializer.init();

  runApp(InteraApp(initialRoute: Routes.initialRoute));
}
