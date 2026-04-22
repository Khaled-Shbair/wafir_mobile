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
import 'package:wafir_mobile/features/auth/presentation/controller/forget_password_bloc.dart';
import 'package:wafir_mobile/routes/routes.dart';

class ForgetPasswordScreen extends StatelessWidget with CustomToastMassage {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<ForgetPasswordBloc>();

    return BlocListener<ForgetPasswordBloc, ForgetPasswordState>(
      listener: (context, state) {
        if (state is ForgetPasswordLoading) {
          context.customLoading();
        } else if (state is ForgetPasswordSuccess) {
          context.hideLoading();
          Navigator.of(context).pushReplacementNamed(
            Routes.verifyOtpScreen,
            arguments: [
              state.email,
              Routes.loginScreen,
            ],
          );
        } else if (state is ForgetPasswordFailure) {
          context.hideLoading();
          showToast(state.message);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(ManagerStrings.forgetPasswordTitle),
          leading: IconButton(
            onPressed: () {
              disposeForgetPassword();
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
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
                ManagerStrings.forgetPasswordTitle,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              verticalSpace(ManagerHeights.h10),
              Text(
                ManagerStrings.forgetPasswordDescription,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              verticalSpace(ManagerHeights.h30),
              Form(
                key: controller.formKey,
                child: CustomTextField(
                  hintText: ManagerStrings.email,
                  controller: controller.emailController,
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    size: ManagerIconsSizes.i24,
                  ),
                  validator: (v) => Validator.emailValidator(v),
                ),
              ),
              verticalSpace(ManagerHeights.h30),
              CustomButton(
                text: ManagerStrings.send,
                onPressed: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  controller.add(ForgotPasswordProcess());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
