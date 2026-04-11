import 'package:flutter/material.dart';
import 'package:wafir_mobile/core/resource/manager_sizes.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.labelText,
    required this.validator,
    required this.controller,
    this.prefixIcon,
    this.keyboardType,
    this.functionVisibilityPassword,
    this.isPassword = false,
    this.obscureText = false,
    this.maxLength,
    this.hintText,
    this.prefixText,
    this.textInputAction,
  });

  final String? labelText;
  final String? hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Function()? functionVisibilityPassword;
  final Widget? prefixIcon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final bool isPassword;
  final int? maxLength;
  final TextInputAction? textInputAction;
  final String? prefixText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: maxLength,
      controller: controller,
      keyboardType: keyboardType ?? TextInputType.emailAddress,
      validator: validator,
      textInputAction: textInputAction,
      style: Theme.of(context).textTheme.labelLarge,
      obscureText: obscureText,
      decoration: InputDecoration(
        contentPadding: EdgeInsetsDirectional.zero,
        labelText: labelText,
        counter: SizedBox.shrink(),
        // prefixText: prefixText,

        prefixIconColor: Theme.of(context).inputDecorationTheme.prefixIconColor,
        prefixIcon:prefixIcon ,
        hintText: hintText,
        iconColor: Theme.of(context).inputDecorationTheme.iconColor,
        suffixIcon: isPassword
            ? IconButton(
                highlightColor: Theme.of(context).disabledColor,
                onPressed: functionVisibilityPassword,
                icon: Icon(obscureText
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined),
                style: IconButton.styleFrom(iconSize: ManagerIconsSizes.i24),
              )
            : null,
        labelStyle: Theme.of(context).inputDecorationTheme.labelStyle,
        border: Theme.of(context).inputDecorationTheme.border,
        focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
      ),
    );
  }
}
