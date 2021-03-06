import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../theme/intera_colors.dart';
import '../theme/intera_font.dart';

class InteraTextField extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? helper;
  final String? initialValue;
  final TextStyle? style;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final TextStyle? helperStyle;
  final bool autofocus;
  final bool enableSuggestions;
  final bool readOnly;
  final bool obscure;
  final int? maxLines;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final AutovalidateMode? autovalidateMode;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;
  final FloatingLabelBehavior? floatingLabelBehavior;

  const InteraTextField({
    Key? key,
    this.label,
    this.hint,
    this.helper,
    this.initialValue,
    this.style,
    this.labelStyle,
    this.hintStyle,
    this.helperStyle,
    this.autofocus = false,
    this.enableSuggestions = true,
    this.readOnly = false,
    this.maxLines = 1,
    this.obscure = false,
    this.keyboardType,
    this.textInputAction,
    this.autovalidateMode,
    this.controller,
    this.focusNode,
    this.inputFormatters,
    this.onChanged,
    this.onFieldSubmitted,
    this.validator,
    this.floatingLabelBehavior = FloatingLabelBehavior.always,
  })  : assert(initialValue == null || controller == null),
        assert(maxLines == null || maxLines > 0),
        super(key: key);

  InputBorder _border({
    Color? color,
    double radius = 8,
    double width = 2,
  }) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        borderSide: BorderSide(color: color ?? InteraColors.textFieldBorder, width: width),
      );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: labelStyle ??
            TextStyle(
              color: InteraColors.baseDark25,
              fontWeight: InteraFont.semiBold,
              fontSize: ResponsiveWrapper.of(context).isSmallerThan(MOBILE) ? 12 : 15,
            ),
        hintText: hint,
        hintStyle: hintStyle ??
            TextStyle(
              color: InteraColors.textGray,
              fontWeight: InteraFont.regular,
              fontSize: ResponsiveWrapper.of(context).isSmallerThan(MOBILE) ? 12 : 15,
            ),
        helperText: helper,
        helperStyle: helperStyle ??
            TextStyle(
              color: InteraColors.textGray,
              fontWeight: InteraFont.regular,
              fontSize: ResponsiveWrapper.of(context).isSmallerThan(MOBILE) ? 10 : 15,
            ),
        border: _border(),
        enabledBorder: _border(),
        focusedBorder: _border(),
        errorBorder: _border(color: InteraColors.error),
        focusedErrorBorder: _border(color: InteraColors.error),
        disabledBorder: _border(color: InteraColors.baseDark25),
        contentPadding: EdgeInsets.symmetric(
          vertical: ResponsiveWrapper.of(context).isSmallerThan(MOBILE) ? 15 : 20,
          horizontal: ResponsiveWrapper.of(context).isSmallerThan(MOBILE) ? 10 : 12,
        ),
        floatingLabelBehavior: floatingLabelBehavior,
        alignLabelWithHint: true,
        isDense: true,
      ),
      autofocus: autofocus,
      autovalidateMode: autovalidateMode,
      controller: controller,
      enableSuggestions: enableSuggestions,
      focusNode: focusNode,
      initialValue: initialValue,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      maxLines: maxLines,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      readOnly: readOnly,
      style: style,
      textInputAction: textInputAction,
      validator: validator,
      obscureText: obscure,
    );
  }
}
