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
    this.isFocused = false,
    this.onEmptyBackspace,
    this.autofocus = false,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final void Function(String)? onChanged;
  final bool isFocused;
  final VoidCallback? onEmptyBackspace;
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    return Focus(
      onKeyEvent: (_, event) {
        if (event is KeyDownEvent &&
            event.logicalKey == LogicalKeyboardKey.backspace &&
            controller.text.isEmpty) {
          onEmptyBackspace?.call();
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      },
      child: TextFormField(
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
        autofocus: autofocus,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          counterText: '',
          border: Theme.of(context).inputDecorationTheme.border,
          focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
          enabledBorder:
              Theme.of(context).inputDecorationTheme.enabledBorder?.copyWith(
                      borderSide: BorderSide(
                    width: 1.2,
                    color: isFocused || controller.text.isNotEmpty
                        ? ManagerColors.primaryColor
                        : ManagerColors.unFocusBorderColor,
                  )),
        ),
      ),
    );
  }
}
