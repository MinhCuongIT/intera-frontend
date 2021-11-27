import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'services/router/router.dart';
import 'services/router/getx_router.dart';

class Initializer {
  static Future<void> init() async {
    try {
      WidgetsFlutterBinding.ensureInitialized();

      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));

      insertGlobalServices();
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  static void insertGlobalServices() {
    Get.lazyPut<InteraRouter>(() => GetXInteraRouter());
  }
}
