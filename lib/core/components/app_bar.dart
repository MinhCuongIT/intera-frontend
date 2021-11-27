import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme/intera_colors.dart';
import '../theme/intera_font.dart';

class InteraAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? leftIcon;
  final List<Widget>? rightIcons;
  final Color? backgroundColor;
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
    this.systemOverlayStyle,
    this.height = 70,
    this.fontSize = 20,
    this.fontWeight = InteraFont.semiBold,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title != null
          ? Text(
              title!,
              style: textStyle ??
                  TextStyle(
                    color: InteraColors.baseLight100,
                    fontWeight: fontWeight,
                    fontSize: fontSize,
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
  Size get preferredSize => Size.fromHeight(70);
}
