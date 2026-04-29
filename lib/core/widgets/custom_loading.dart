import 'package:flutter/material.dart';
import 'package:wafir_mobile/core/resource/manager_colors.dart';


void showCustomLoading(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    useRootNavigator: true,
    builder: (_) => Center(
      child: CircularProgressIndicator(
        color: ManagerColors.primaryColor,
      ),
    ),
  );
}
