import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../controllers/splash/splash_controller.dart';
import '../../../../../core/theme/intera_colors.dart';

class SplashPage extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Center(
          child: CircularProgressIndicator.adaptive(backgroundColor: InteraColors.baseLight100),
        ),
      ),
    );
  }
}


