import 'package:flutter/material.dart';
import 'package:wafir_mobile/core/resource/manager_colors.dart';
import 'package:wafir_mobile/core/resource/manager_fonts.dart';
import 'package:wafir_mobile/core/resource/manager_sizes.dart';
import 'package:wafir_mobile/core/resource/manager_strings.dart';
import 'package:wafir_mobile/core/widgets/custom_button.dart';
import 'package:wafir_mobile/core/widgets/custom_spacing.dart';
import 'package:wafir_mobile/routes/routes.dart';

Future<bool?> showConfirmationDialog(
  BuildContext context, {
  String? title,
  String? message,
  String? confirmText,
  String? cancelText,
  required Function() confirmButtonOnPressed,
}) {
  return showDialog<bool>(
    context: context,
    barrierDismissible: true,
    builder: (dialogContext) {
      return AlertDialog(
        backgroundColor: ManagerColors.whiteColor,
        surfaceTintColor: ManagerColors.whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ManagerRadius.r15),
        ),
        contentPadding: EdgeInsetsDirectional.all(ManagerWidths.w20),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title ?? ManagerStrings.logout,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: ManagerFontWeight.extraBold,
                    fontSize: ManagerFontsSizes.f22,
                    color: ManagerColors.blackColor,
                  ),
            ),
            verticalSpace(ManagerHeights.h20),
            Text(
              message ?? ManagerStrings.areYouSureYouWantToLogout,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: ManagerColors.greyColor,
                  ),
            ),
            verticalSpace(ManagerHeights.h30),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    text: cancelText ?? ManagerStrings.cancel,
                    height: ManagerHeights.h45,
                    color: ManagerColors.whiteColor,
                    colorText: ManagerColors.blackColor,
                    borderColor: const Color(0xFFE2E8EA),
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                  ),
                ),
                horizontalSpace(ManagerWidths.w10),
                Expanded(
                  child: CustomButton(
                    text: confirmText ?? ManagerStrings.confirm,
                    height: ManagerHeights.h45,
                    colorText: ManagerColors.whiteColor,
                    onPressed: () {
                      Navigator.of(context).pop();
                      confirmButtonOnPressed();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}

void loginPop(BuildContext context) {
  showConfirmationDialog(
    context,
    confirmButtonOnPressed: () {
      Navigator.of(context).pushNamed(Routes.loginScreen);
    },
    title: 'تسجيل الدخول مطلوب',
    message: 'سجل الدخول لطلب العرض ومتابعة خصمك بسهولة',
  );
}
