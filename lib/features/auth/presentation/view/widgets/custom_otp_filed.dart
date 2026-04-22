import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wafir_mobile/core/resource/manager_colors.dart';
import 'package:wafir_mobile/core/resource/manager_fonts.dart';

class CustomOtpFiled extends StatelessWidget {
  const CustomOtpFiled({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.onChanged,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      maxLength: 1,
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: ManagerFontsSizes.f20,
        fontWeight: ManagerFontWeight.extraBold,
        color: ManagerColors.primaryColor,
      ),
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      onChanged: onChanged,
      autofocus: true,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        counterText: '',
        border: Theme.of(context).inputDecorationTheme.border,
        focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
        enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
      ),
    );
  }
}
