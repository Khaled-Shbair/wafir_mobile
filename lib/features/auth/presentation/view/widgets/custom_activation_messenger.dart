import 'package:flutter/material.dart';
import 'package:wafir_mobile/core/resource/manager_colors.dart';
import 'package:wafir_mobile/core/resource/manager_strings.dart';
import 'package:wafir_mobile/routes/routes.dart';

void customActivationMessenger(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.fixed,
      backgroundColor: ManagerColors.failureColor,
      duration: Duration(days: 1),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              ManagerStrings.yourAccountIsNotYetActivated,
            ),
          ),
          TextButton(
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              Navigator.of(context).pushNamed(Routes.verifyOtpScreen);
            },
            child: Text(
              ManagerStrings.activateNow,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    ),
  );
}
