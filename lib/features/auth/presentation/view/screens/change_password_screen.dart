import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafir_mobile/config/dependency_injection.dart';
import 'package:wafir_mobile/core/resource/manager_sizes.dart';
import 'package:wafir_mobile/core/resource/manager_strings.dart';
import 'package:wafir_mobile/core/validator/validator.dart';
import 'package:wafir_mobile/core/widgets/custom_button.dart';
import 'package:wafir_mobile/core/widgets/custom_loading.dart';
import 'package:wafir_mobile/core/widgets/custom_spacing.dart';
import 'package:wafir_mobile/core/widgets/custom_text_field.dart';
import 'package:wafir_mobile/core/widgets/custom_toast_massage.dart';
import 'package:wafir_mobile/features/auth/presentation/controller/change_password_bloc.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen>
    with CustomToastMassage {
  late TextEditingController currentPassword;
  late TextEditingController newPassword;
  late TextEditingController confirmPassword;

  late FocusNode currentPasswordFocusNode;
  late FocusNode newPasswordFocusNode;
  late FocusNode confirmPasswordFocusNode;

  bool currentPasswordIsFocused = false;
  bool newPasswordIsFocused = false;
  bool confirmPasswordIsFocused = false;

  @override
  void initState() {
    super.initState();
    currentPassword = TextEditingController();
    newPassword = TextEditingController();
    confirmPassword = TextEditingController();
    currentPasswordFocusNode = FocusNode();
    newPasswordFocusNode = FocusNode();
    confirmPasswordFocusNode = FocusNode();

    currentPasswordFocusNode.addListener(() => setState(
        () => currentPasswordIsFocused = currentPasswordFocusNode.hasFocus));

    newPasswordFocusNode.addListener(() =>
        setState(() => newPasswordIsFocused = newPasswordFocusNode.hasFocus));

    confirmPasswordFocusNode.addListener(() => setState(
        () => confirmPasswordIsFocused = confirmPasswordFocusNode.hasFocus));
  }

  @override
  void dispose() {
    currentPassword.dispose();
    newPassword.dispose();
    confirmPassword.dispose();
    currentPasswordFocusNode.dispose();
    newPasswordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
    disposeChangePassword();
    disposeAuth();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.read<ChangePasswordBloc>();

    return BlocListener<ChangePasswordBloc, ChangePasswordState>(
      listener: (context, state) {
        if (state is ChangePasswordLoading) {
          showCustomLoading(context);
        } else if (state is ChangePasswordSuccess) {
          Navigator.of(context, rootNavigator: true).pop();
          showToast(state.message, false);
          Navigator.of(context, rootNavigator: true).pop();
        } else if (state is ChangePasswordFailure) {
          Navigator.of(context, rootNavigator: true).pop();
          showToast(state.message);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(ManagerStrings.changePasswordTitle),
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back_ios_new_outlined,
              size: ManagerIconsSizes.i20,
            ),
          ),
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
                    BlocBuilder<ChangePasswordBloc, ChangePasswordState>(
                      buildWhen: (previous, current) =>
                          previous.currentPasswordObscured !=
                          current.currentPasswordObscured,
                      builder: (context, state) {
                        return CustomTextField(
                          maxLength: 50,
                          hintText: ManagerStrings.currentPassword,
                          controller: currentPassword,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: state.currentPasswordObscured,
                          isPassword: true,
                          prefixIconData: Icons.lock_outline,
                          isFocused: currentPasswordIsFocused,
                          focusNode: currentPasswordFocusNode,
                          textInputAction: TextInputAction.next,
                          validator: (v) => Validator.passwordValidator(v),
                          functionVisibilityPassword: () =>
                              controller.add(ToggleCurrentPasswordVisibility()),
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
                          maxLength: 50,
                          hintText: ManagerStrings.newPassword,
                          controller: newPassword,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: state.newPasswordObscured,
                          isPassword: true,
                          prefixIconData: Icons.lock_outline,
                          isFocused: newPasswordIsFocused,
                          focusNode: newPasswordFocusNode,
                          textInputAction: TextInputAction.next,
                          validator: (v) => Validator.passwordValidator(v),
                          functionVisibilityPassword: () =>
                              controller.add(ToggleNewPasswordVisibility()),
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
                          maxLength: 50,
                          hintText: ManagerStrings.confirmPassword,
                          controller: confirmPassword,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: state.confirmPasswordObscured,
                          isPassword: true,
                          prefixIconData: Icons.lock_outline,
                          isFocused: confirmPasswordIsFocused,
                          focusNode: confirmPasswordFocusNode,
                          textInputAction: TextInputAction.done,
                          validator: (v) => Validator.confirmPasswordValidator(
                            v,
                            newPassword.text,
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
                  if (newPassword.text.isNotEmpty &&
                      confirmPassword.text.isNotEmpty) {
                    controller.add(ChangePasswordProcess(
                      newPassword: newPassword.text,
                      currentPassword: currentPassword.text,
                    ));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
