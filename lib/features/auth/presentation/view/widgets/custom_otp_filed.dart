import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
          fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      onChanged: onChanged,
      autofocus: true,
      decoration: InputDecoration(
        counterText: '',
        border: Theme.of(context).inputDecorationTheme.border,
        focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
        enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
      ),
    );
  }
}
