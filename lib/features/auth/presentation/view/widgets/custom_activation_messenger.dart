import 'package:flutter/material.dart';
import 'package:wafir_mobile/config/dependency_injection.dart';
import 'package:wafir_mobile/core/resource/manager_colors.dart';
import 'package:wafir_mobile/core/resource/manager_strings.dart';
import 'package:wafir_mobile/features/auth/domain/use_case/resend_otp_use_case.dart';
import 'package:wafir_mobile/routes/routes.dart';

void customActivationMessenger(BuildContext context, String email) {
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
              initResetOtp();
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              instance<ResendOtpUseCase>().execute(
                ResendOtpUseCaseInput(
                  email: email,
                  otpType: 'REGISTRATION',
                ),
              );
              Navigator.of(context).pushNamed(
                Routes.verifyOtpScreen,
                arguments: [
                  email,
                  Routes.mainScreen,
                ],
              );
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
