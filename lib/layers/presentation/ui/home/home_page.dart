import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/components/button.dart';
import '../../../../core/services/account/account_service.dart';
import '../../../../core/settings.dart';

class HomePage extends StatelessWidget {
  final AccountService authService = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Text('email: ${Settings.user?.email}')),
          InteraButton.ghost(
            'Logout',
            onPressed: () async {
              await authService.logout();
            },
          ),
        ],
      ),
    );
  }
}
