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
import 'package:wafir_mobile/features/change_password/presentation/controller/change_password_bloc.dart';

class ChangePasswordScreen extends StatelessWidget with CustomToastMassage {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ChangePasswordBloc>();

    return BlocListener<ChangePasswordBloc, ChangePasswordState>(
      listener: (context, state) {
        if (state is ChangePasswordLoading) {
          context.customLoading();
        } else {
          context.hideLoading();
        }

        if (state is ChangePasswordSuccess) {
          showToast(ManagerStrings.changePasswordSuccess);
          Navigator.of(context).pop();
        } else if (state is ChangePasswordFailure) {
          showToast(state.errorMessage ?? ManagerStrings.changePasswordFailure);
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
          child: Form(
            key: bloc.formKey,
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
                BlocBuilder<ChangePasswordBloc, ChangePasswordState>(
                  buildWhen: (previous, current) =>
                      previous.currentPasswordObscured !=
                      current.currentPasswordObscured,
                  builder: (context, state) {
                    return CustomTextField(
                      labelText: ManagerStrings.currentPassword,
                      controller: bloc.currentPasswordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: state.currentPasswordObscured,
                      isPassword: true,
                      validator: (v) => Validator.passwordValidator(v),
                      functionVisibilityPassword: () => bloc.add(
                        ToggleCurrentPasswordVisibility(),
                      ),
                    );
                  },
                ),
                verticalSpace(ManagerHeights.h20),
                BlocBuilder<ChangePasswordBloc, ChangePasswordState>(
                  buildWhen: (previous, current) =>
                      previous.newPasswordObscured !=
                      current.newPasswordObscured,
                  builder: (context, state) {
                    return CustomTextField(
                      labelText: ManagerStrings.newPassword,
                      controller: bloc.newPasswordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: state.newPasswordObscured,
                      isPassword: true,
                      validator: (v) => Validator.passwordValidator(v),
                      functionVisibilityPassword: () =>
                          bloc.add(ToggleNewPasswordVisibility()),
                    );
                  },
                ),
                verticalSpace(ManagerHeights.h20),
                BlocBuilder<ChangePasswordBloc, ChangePasswordState>(
                  buildWhen: (previous, current) =>
                      previous.confirmPasswordObscured !=
                      current.confirmPasswordObscured,
                  builder: (context, state) {
                    return CustomTextField(
                      labelText: ManagerStrings.confirmPassword,
                      controller: bloc.confirmPasswordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: state.confirmPasswordObscured,
                      isPassword: true,
                      validator: (v) => Validator.confirmPasswordValidator(
                        v,
                        bloc.newPasswordController.text,
                      ),
                      functionVisibilityPassword: () => bloc.add(
                        ToggleConfirmPasswordVisibility(),
                      ),
                    );
                  },
                ),
                verticalSpace(ManagerHeights.h30),
                SizedBox(
                  width: ManagerWidths.infinity,
                  child: BlocBuilder<ChangePasswordBloc, ChangePasswordState>(
                    buildWhen: (previous, current) =>
                        previous.isSubmitting != current.isSubmitting,
                    builder: (context, state) {
                      return CustomButton(
                        text: ManagerStrings.changePasswordButton,
                        onPressed: state.isSubmitting
                            ? () {}
                            : () => bloc.add(SubmitChangePassword()),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
