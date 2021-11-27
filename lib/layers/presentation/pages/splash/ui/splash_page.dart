import 'package:flutter/material.dart';
import 'package:intera/core/components/button.dart';

import '../../../../../core/components/app_bar.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: InteraAppBar(
        title: 'Teste',
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            InteraButton.primary(
              'teste',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
