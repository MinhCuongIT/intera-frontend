import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'services/local_storage/local_storage_service.dart';
import 'services/local_storage/secure_local_storage_service.dart';
import 'services/router/router.dart';
import 'services/router/getx_router.dart';

class Initializer {
  static Future<void> init() async {
    try {
      WidgetsFlutterBinding.ensureInitialized();

      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));

      await Firebase.initializeApp();

      insertGlobalServices();
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  static void insertGlobalServices() {
    Get.lazyPut<InteraRouter>(() => GetXInteraRouter());
    Get.lazyPut<LocalStorageService>(() => SecureLocalStorageService());
  }
}
