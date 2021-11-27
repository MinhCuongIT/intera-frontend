import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/splash_controller.dart';
import '../../../../../core/helpers/controller.dart';
import '../../../../../core/theme/intera_colors.dart';

class SplashPage extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: CircularProgressIndicator.adaptive(backgroundColor: InteraColors.baseLight100),
      ),
    );
  }
}

abstract class InteraPage<TController extends InteraController> extends GetView<TController> {
  bool get loading => controller.loading;
}
