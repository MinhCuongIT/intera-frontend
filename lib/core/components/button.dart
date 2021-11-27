import 'package:flutter/material.dart';

import '../theme/intera_colors.dart';
import '../theme/intera_font.dart';

class InteraButton extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Size size;
  final double radius;
  final ButtonStyle? buttonStyle;
  final bool loading;
  final void Function()? onPressed;
  final void Function()? onLongPress;

  const InteraButton(
    this.text, {
    this.textStyle = const TextStyle(fontSize: 18, fontFamily: InteraFont.font, fontWeight: InteraFont.semiBold),
    this.backgroundColor,
    this.foregroundColor,
    this.size = const Size.fromHeight(50),
    this.onPressed,
    this.onLongPress,
    this.radius = 8,
    this.buttonStyle,
    this.loading = false,
  });

  factory InteraButton.primary(
    String text, {
    Size size = const Size.fromHeight(50),
    double radius = 8,
    void Function()? onPressed,
    void Function()? onLongPress,
    bool loading = false,
  }) {
    return InteraButton(
      text,
      onPressed: onPressed,
      onLongPress: onLongPress,
      radius: radius,
      size: size,
      backgroundColor: InteraColors.primary,
      foregroundColor: InteraColors.baseLight100,
      loading: loading,
    );
  }

  factory InteraButton.secondary(
    String text, {
    Size size = const Size.fromHeight(50),
    double radius = 8,
    void Function()? onPressed,
    void Function()? onLongPress,
    bool loading = false,
  }) {
    return InteraButton(
      text,
      onPressed: onPressed,
      onLongPress: onLongPress,
      radius: radius,
      size: size,
      backgroundColor: InteraColors.violet20,
      foregroundColor: InteraColors.primary,
      loading: loading,
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: loading == false
          ? Center(child: Text(text))
          : Center(
              child: SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator.adaptive(
                  backgroundColor: Colors.white,
                  strokeWidth: 2.5,
                ),
              ),
            ),
      onPressed: onPressed,
      onLongPress: onLongPress,
      style: buttonStyle ??
          ButtonStyle(
            alignment: Alignment.center,
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(radius)),
            )),
            textStyle: MaterialStateProperty.all<TextStyle>(textStyle),
            fixedSize: MaterialStateProperty.all<Size>(size),
            foregroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) return InteraColors.baseDark25;

              return foregroundColor ?? InteraColors.baseLight100;
            }),
            overlayColor: MaterialStateProperty.all<Color>(Colors.white.withOpacity(0.1)),
            backgroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) return InteraColors.baseDark10;

              return backgroundColor ?? InteraColors.primary;
            }),
          ),
    );
  }
}
