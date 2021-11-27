import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme/intera_colors.dart';
import '../theme/intera_font.dart';

class InteraAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? leftIcon;
  final List<Widget>? rightIcons;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final SystemUiOverlayStyle? systemOverlayStyle;
  final double height;
  final double fontSize;
  final FontWeight fontWeight;
  final TextStyle? textStyle;

  const InteraAppBar({
    Key? key,
    this.title,
    this.leftIcon,
    this.rightIcons,
    this.backgroundColor,
    this.foregroundColor,
    this.systemOverlayStyle,
    this.height = 70,
    this.fontSize = 20,
    this.fontWeight = InteraFont.semiBold,
    this.textStyle,
  }) : super(key: key);

  factory InteraAppBar.white(
    String title, {
    double height = 70,
    List<Widget>? rightIcons,
    Widget? leftIcon,
    SystemUiOverlayStyle? systemOverlayStyle,
    Color? foregroundColor,
  }) =>
      InteraAppBar(
        title: title,
        backgroundColor: InteraColors.baseLight100,
        height: height,
        leftIcon: leftIcon,
        rightIcons: rightIcons,
        systemOverlayStyle: systemOverlayStyle,
        foregroundColor: foregroundColor ?? InteraColors.baseDark100,
      );

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title != null
          ? FadeInDown(
              from: 35,
              duration: Duration(milliseconds: 500),
              child: Text(
                title!,
                style: textStyle ??
                    TextStyle(
                      color: foregroundColor ?? InteraColors.baseLight100,
                      fontWeight: fontWeight,
                      fontSize: fontSize,
                    ),
              ),
            )
          : null,
      toolbarHeight: height,
      actions: rightIcons,
      leading: leftIcon,
      backgroundColor: backgroundColor ?? InteraColors.primary,
      systemOverlayStyle: systemOverlayStyle,
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
