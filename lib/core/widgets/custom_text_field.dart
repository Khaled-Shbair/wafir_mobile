import 'package:flutter/material.dart';
import 'package:wafir_mobile/core/resource/manager_colors.dart';
import 'package:wafir_mobile/core/resource/manager_sizes.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.labelText,
    this.validator,
    this.prefixIconData,
    required this.controller,
    this.prefixIcon,
    this.keyboardType,
    this.functionVisibilityPassword,
    this.isPassword = false,
    this.obscureText = false,
    this.maxLength,
    this.hintText,
    this.prefixText,
    this.suffix,
    this.textInputAction,
    this.onFieldSubmitted,
    this.readOnly = false,
    this.focusNode,
    this.top,
    this.bottom,
    this.isFocused = false,
    this.autofocus = false,
  });

  final bool isFocused;

  final String? labelText;
  final String? hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Function()? functionVisibilityPassword;
  final Function(String?)? onFieldSubmitted;
  final Widget? prefixIcon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final bool isPassword;
  final int? maxLength;
  final TextInputAction? textInputAction;
  final String? prefixText;
  final IconData? prefixIconData;
  final bool readOnly;
  final Widget? suffix;
  final FocusNode? focusNode;
  final bool autofocus;
  final double? top;
  final double? bottom;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: maxLength,
      controller: controller,
      onFieldSubmitted: onFieldSubmitted,
      keyboardType: keyboardType ?? TextInputType.emailAddress,
      validator: validator,
      textInputAction: textInputAction,
      readOnly: readOnly,
      focusNode: focusNode,
      autofocus: autofocus,
      style: Theme.of(context).textTheme.labelLarge,
      obscureText: obscureText,
      decoration: InputDecoration(
        contentPadding: EdgeInsetsDirectional.only(
          top: top ?? ManagerHeights.h18,
          bottom: bottom ?? ManagerHeights.h18,
        ),
        labelText: labelText,
        filled: Theme.of(context).inputDecorationTheme.filled,
        fillColor: Theme.of(context).inputDecorationTheme.fillColor,
        counter: SizedBox.shrink(),
        prefixIconColor: Theme.of(context).inputDecorationTheme.prefixIconColor,
        prefixIcon: prefixIcon ??
            Icon(
              prefixIconData,
              size: ManagerIconsSizes.i24,
              color: isFocused || controller.text.isNotEmpty
                  ? ManagerColors.primaryColor
                  : ManagerColors.unFocusIconColor,
            ),
        hintText: hintText,
        hintStyle: Theme.of(context).inputDecorationTheme.hintStyle?.copyWith(
              color: isFocused || controller.text.isNotEmpty
                  ? ManagerColors.primaryColor
                  : ManagerColors.unFocusIconColor,
            ),
        border: Theme.of(context).inputDecorationTheme.border,
        iconColor: Theme.of(context).inputDecorationTheme.iconColor,
        suffixIcon: isPassword
            ? IconButton(
                onPressed: functionVisibilityPassword,
                icon: Icon(
                  color: isFocused || controller.text.isNotEmpty
                      ? ManagerColors.primaryColor
                      : ManagerColors.unFocusIconColor,
                  obscureText
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                ),
                style: IconButton.styleFrom(
                  iconSize: ManagerIconsSizes.i24,
                  elevation: 0,
                  focusColor: ManagerColors.transparentColor,
                  highlightColor: ManagerColors.transparentColor,
                  hoverColor: ManagerColors.transparentColor,
                  shadowColor: ManagerColors.transparentColor,
                ),
              )
            : suffix,
        labelStyle: Theme.of(context).inputDecorationTheme.labelStyle,
        focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
        enabledBorder:
            Theme.of(context).inputDecorationTheme.enabledBorder?.copyWith(
                    borderSide: BorderSide(
                  width: 1.2,
                  color: isFocused || controller.text.isNotEmpty
                      ? ManagerColors.primaryColor
                      : ManagerColors.unFocusBorderColor,
                )),
        errorBorder: Theme.of(context).inputDecorationTheme.errorBorder,
      ),
    );
  }
}
