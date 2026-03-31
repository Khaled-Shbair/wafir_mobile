import 'package:flutter/material.dart';
import 'package:wafir_mobile/core/resource/manager_colors.dart';

extension CustomLoading on BuildContext {
  void customLoading() {
    showDialog(
      context: this,
      barrierDismissible: false,
      builder: (_) => Center(
        child: CircularProgressIndicator(
          color: ManagerColors.primaryColor,
        ),
      ),
    );
  }

  void hideLoading() {
    Navigator.pop(this);
  }
}
