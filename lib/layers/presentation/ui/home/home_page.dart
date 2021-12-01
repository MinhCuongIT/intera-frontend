import 'package:flutter/material.dart';
import '../../../../core/settings.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('email: ${Settings.user?.email}'),),
    );
  }
}