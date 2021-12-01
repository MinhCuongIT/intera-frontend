import 'package:flutter/material.dart';

class GoogleIcon extends StatelessWidget {
  final double size;
  const GoogleIcon({Key? key, this.size = 30}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/google.png',
      height: size,
      width: size,
      fit: BoxFit.cover,
    );
  }
}
