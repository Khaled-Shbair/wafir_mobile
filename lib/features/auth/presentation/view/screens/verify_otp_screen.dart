import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafir_mobile/core/resource/manager_sizes.dart';
import 'package:wafir_mobile/core/resource/manager_strings.dart';
import 'package:wafir_mobile/core/widgets/custom_button.dart';
import 'package:wafir_mobile/core/widgets/custom_loading.dart';
import 'package:wafir_mobile/core/widgets/custom_spacing.dart';
import 'package:wafir_mobile/core/widgets/custom_toast_massage.dart';
import 'package:wafir_mobile/features/auth/presentation/controller/verify_otp_bloc.dart';
import 'package:wafir_mobile/features/auth/presentation/view/widgets/custom_otp_filed.dart';

class VerifyOtpScreen extends StatelessWidget with CustomToastMassage {
  const VerifyOtpScreen(
      {required this.email, required this.nextScreenRoute, super.key});

  final String email;
  final String nextScreenRoute;

  @override
  Widget build(BuildContext context) {
    final controller = context.read<VerifyOtpBloc>();
    return BlocListener<VerifyOtpBloc, VerifyOtpState>(
      listener: (context, state) {
        if (state is VerifyOtpLoading) {
          context.customLoading();
        } else if (state is VerifyOtpSuccess) {
          context.hideLoading();
          Navigator.of(context).pushReplacementNamed(nextScreenRoute);
        } else if (state is VerifyOtpFailure) {
          context.hideLoading();
          showToast(state.message);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(ManagerStrings.otpTitle),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsetsDirectional.symmetric(
            horizontal: ManagerWidths.w20,
            vertical: ManagerHeights.h30,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ManagerStrings.otpTitle,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              verticalSpace(ManagerHeights.h10),
              Text(
                ManagerStrings.otpDescription,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              verticalSpace(ManagerHeights.h30),
              SizedBox(
                height: ManagerHeights.h60,
                child: Padding(
                  padding: EdgeInsetsDirectional.symmetric(
                    horizontal: ManagerWidths.w20,
                  ),
                  child: Row(
                    children: [
                      Flexible(
                        child: CustomOtpFiled(
                          controller: controller.c1,
                          focusNode: controller.f1,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              controller.f2.requestFocus();
                            }
                          },
                        ),
                      ),
                      horizontalSpace(ManagerWidths.w10),
                      Flexible(
                        child: CustomOtpFiled(
                          controller: controller.c2,
                          focusNode: controller.f2,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              controller.f3.requestFocus();
                            } else {
                              controller.f1.requestFocus();
                            }
                          },
                        ),
                      ),
                      horizontalSpace(ManagerWidths.w10),
                      Flexible(
                        child: CustomOtpFiled(
                          controller: controller.c3,
                          focusNode: controller.f3,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              controller.f4.requestFocus();
                            } else {
                              controller.f2.requestFocus();
                            }
                          },
                        ),
                      ),
                      horizontalSpace(ManagerWidths.w10),
                      Flexible(
                        child: CustomOtpFiled(
                          controller: controller.c4,
                          focusNode: controller.f4,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              controller.f5.requestFocus();
                            } else {
                              controller.f3.requestFocus();
                            }
                          },
                        ),
                      ),
                      horizontalSpace(ManagerWidths.w10),
                      Flexible(
                        child: CustomOtpFiled(
                          controller: controller.c5,
                          focusNode: controller.f5,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              controller.f6.requestFocus();
                            } else {
                              controller.f4.requestFocus();
                            }
                          },
                        ),
                      ),
                      horizontalSpace(ManagerWidths.w10),
                      Flexible(
                        child: CustomOtpFiled(
                          controller: controller.c6,
                          focusNode: controller.f6,
                          onChanged: (value) {
                            if (value.isEmpty) {
                              controller.f5.requestFocus();
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              verticalSpace(ManagerHeights.h30),
              CustomButton(
                text: ManagerStrings.confirm,
                onPressed: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  ScaffoldMessenger.of(context).clearSnackBars();
                  controller.add(VerifyOtpProcess(email: email));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
