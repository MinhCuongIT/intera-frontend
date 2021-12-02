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
  final Widget? icon;
  final BorderSide? borderSide;
  final Color? clickEffectColor;

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
    this.borderSide,
    this.icon,
    this.clickEffectColor,
  });

  factory InteraButton.primary(
    String text, {
    Size size = const Size.fromHeight(50),
    double radius = 8,
    void Function()? onPressed,
    void Function()? onLongPress,
    bool loading = false,
    Widget? icon,
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
      icon: icon,
    );
  }

  factory InteraButton.secondary(
    String text, {
    Size size = const Size.fromHeight(50),
    double radius = 8,
    void Function()? onPressed,
    void Function()? onLongPress,
    bool loading = false,
    Widget? icon,
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
      icon: icon,
    );
  }

  factory InteraButton.ghost(
    String text, {
    Size size = const Size.fromHeight(50),
    double radius = 8,
    void Function()? onPressed,
    void Function()? onLongPress,
    bool loading = false,
    Color? foregroundColor,
    Widget? icon,
    BorderSide? borderSide,
    Color? clickEffectColor,
  }) {
    return InteraButton(
      text,
      onPressed: onPressed,
      onLongPress: onLongPress,
      radius: radius,
      size: size,
      backgroundColor: Colors.transparent,
      foregroundColor: foregroundColor ?? InteraColors.baseDark100,
      loading: loading,
      icon: icon,
      clickEffectColor: clickEffectColor ?? Colors.black.withOpacity(0.05),
      borderSide: borderSide ?? BorderSide(
        color: InteraColors.skeleton,
        width: 1,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: loading == false
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (icon != null) ...{
                  icon!,
                  SizedBox(width: 10),
                },
                Text(text),
              ],
            )
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
            side: borderSide != null ? MaterialStateProperty.all<BorderSide>(borderSide!) : null,
            overlayColor: MaterialStateProperty.all<Color>(clickEffectColor ?? Colors.white.withOpacity(0.1)),
            backgroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) return InteraColors.baseDark10;

              return backgroundColor ?? InteraColors.primary;
            }),
          ),
    );
  }
}
