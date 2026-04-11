import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafir_mobile/core/resource/manager_sizes.dart';
import 'package:wafir_mobile/core/resource/manager_strings.dart';
import 'package:wafir_mobile/core/validator/validator.dart';
import 'package:wafir_mobile/core/widgets/custom_button.dart';
import 'package:wafir_mobile/core/widgets/custom_loading.dart';
import 'package:wafir_mobile/core/widgets/custom_spacing.dart';
import 'package:wafir_mobile/core/widgets/custom_text_field.dart';
import 'package:wafir_mobile/core/widgets/custom_toast_massage.dart';
import 'package:wafir_mobile/features/auth/presentation/controller/reset_password_bloc.dart';

class ResetPasswordScreen extends StatelessWidget with CustomToastMassage {
  const ResetPasswordScreen({required this.token, super.key});

  final String token;

  @override
  Widget build(BuildContext context) {
    final controller = context.read<ResetPasswordBloc>();

    return BlocListener<ResetPasswordBloc, ResetPasswordState>(
      listener: (context, state) {
        if (state is ResetPasswordLoading) {
          context.customLoading();
        } else if (state is ResetPasswordSuccess) {
          context.hideLoading();
          Navigator.of(context).pop();
        } else if (state is ResetPasswordFailure) {
          context.hideLoading();
          showToast(state.message);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(ManagerStrings.changePasswordTitle),
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
                ManagerStrings.changePasswordTitle,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              verticalSpace(ManagerHeights.h10),
              Text(
                ManagerStrings.changePasswordDescription,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              verticalSpace(ManagerHeights.h30),
              Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
                      buildWhen: (previous, current) =>
                          previous.currentPasswordObscured !=
                          current.currentPasswordObscured,
                      builder: (context, state) {
                        return CustomTextField(
                          labelText: ManagerStrings.currentPassword,
                          controller: controller.currentPassword,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: state.currentPasswordObscured,
                          isPassword: true,
                          validator: (v) => Validator.passwordValidator(v),
                          functionVisibilityPassword: () =>
                              controller.add(ToggleCurrentPasswordVisibility()),
                        );
                      },
                    ),
                    verticalSpace(ManagerHeights.h20),
                    BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
                      buildWhen: (previous, current) =>
                          previous.newPasswordObscured !=
                          current.newPasswordObscured,
                      builder: (context, state) {
                        return CustomTextField(
                          labelText: ManagerStrings.newPassword,
                          controller: controller.newPassword,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: state.newPasswordObscured,
                          isPassword: true,
                          validator: (v) => Validator.passwordValidator(v),
                          functionVisibilityPassword: () =>
                              controller.add(ToggleNewPasswordVisibility()),
                        );
                      },
                    ),
                    verticalSpace(ManagerHeights.h20),
                    BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
                      buildWhen: (previous, current) =>
                          previous.confirmPasswordObscured !=
                          current.confirmPasswordObscured,
                      builder: (context, state) {
                        return CustomTextField(
                          labelText: ManagerStrings.confirmPassword,
                          controller: controller.confirmPassword,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: state.confirmPasswordObscured,
                          isPassword: true,
                          validator: (v) => Validator.confirmPasswordValidator(
                            v,
                            controller.newPassword.text,
                          ),
                          functionVisibilityPassword: () =>
                              controller.add(ToggleConfirmPasswordVisibility()),
                        );
                      },
                    ),
                  ],
                ),
              ),
              verticalSpace(ManagerHeights.h30),
              CustomButton(
                text: ManagerStrings.changePasswordButton,
                onPressed: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  controller.add(ResetPasswordProcess(resetToken: token));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
