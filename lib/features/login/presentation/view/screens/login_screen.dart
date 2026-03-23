import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafir_mobile/core/resource/manager_assets.dart';
import 'package:wafir_mobile/core/resource/manager_colors.dart';
import 'package:wafir_mobile/core/resource/manager_fonts.dart';
import 'package:wafir_mobile/core/resource/manager_sizes.dart';
import 'package:wafir_mobile/core/resource/manager_strings.dart';
import 'package:wafir_mobile/core/validator/validator.dart';
import 'package:wafir_mobile/core/widgets/custom_button.dart';
import 'package:wafir_mobile/core/widgets/custom_loading.dart';
import 'package:wafir_mobile/core/widgets/custom_spacing.dart';
import 'package:wafir_mobile/core/widgets/custom_text_field.dart';
import 'package:wafir_mobile/core/widgets/custom_toast_massage.dart';
import 'package:wafir_mobile/routes/routes.dart';
import 'package:wafir_mobile/features/login/presentation/controller/login_bloc.dart';

class LoginScreen extends StatelessWidget with CustomToastMassage {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = context.read<LoginBloc>();

    return BlocListener<LoginBloc, LoginState>(
      listener: (_, state) {
        if (state is LoginLoading) {
          context.customLoading();
        } else if (state is LoginSuccessfully) {
          context.hideLoading();
          Navigator.pushNamedAndRemoveUntil(
              context, Routes.homeScreen, (route) => false);
        } else if (state is LoginFailure) {
          context.hideLoading();
          showToast(state.errorMessage);
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey.shade200,
        body: Container(
          height: ManagerHeights.infinity,
          padding: EdgeInsetsDirectional.only(
            top: ManagerHeights.h30,
            bottom: ManagerHeights.h30,
            start: ManagerWidths.w20,
            end: ManagerWidths.w20,
          ),
          margin: EdgeInsetsDirectional.only(
            top: ManagerHeights.h40,
            bottom: ManagerHeights.h40,
            start: ManagerWidths.w20,
            end: ManagerWidths.w20,
          ),
          decoration: BoxDecoration(
            color: ManagerColors.whiteColor,
            borderRadius: BorderRadius.circular(ManagerRadius.r10),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  ManagerStrings.welcomeBack,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                verticalSpace(ManagerHeights.h10),
                Text(ManagerStrings.loginToCompleteToAccount,
                    style: Theme.of(context).textTheme.labelMedium),
                verticalSpace(ManagerHeights.h50),
                Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        maxLength: 30,
                        prefixIcon: Icons.email_outlined,
                        keyboardType: TextInputType.emailAddress,
                        labelText: ManagerStrings.email,
                        controller: controller.email,
                        validator: (v) => Validator.emailValidator(v),
                      ),
                      verticalSpace(ManagerHeights.h20),
                      BlocBuilder<LoginBloc, LoginState>(
                        builder: (context, state) {
                          return CustomTextField(
                            maxLength: 20,
                            prefixIcon: Icons.lock_outline,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: state.passwordVisible,
                            isPassword: true,
                            labelText: ManagerStrings.password,
                            controller: controller.password,
                            validator: (v) => Validator.passwordValidator(v),
                            functionVisibilityPassword: () =>
                                controller.add(TogglePasswordVisibility()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                verticalSpace(ManagerHeights.h20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        BlocBuilder<LoginBloc, LoginState>(
                          builder: (context, state) {
                            return Checkbox(
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              splashRadius: 0,
                              value: state.rememberMe,
                              onChanged: (value) => controller
                                  .add(ToggleRememberMe(value ?? false)),
                            );
                          },
                        ),
                        Text(
                          ManagerStrings.rememberMy,
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () => Navigator.pushNamed(
                          context, Routes.forgetPasswordScreen),
                      child: Text(
                        ManagerStrings.didYouForgetYourPassword,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ),
                  ],
                ),
                verticalSpace(ManagerHeights.h20),
                CustomButton(
                  text: ManagerStrings.login,
                  onPressed: () => controller.add(LoginProcess()),
                ),
                verticalSpace(ManagerHeights.h40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: Divider(endIndent: ManagerWidths.w5)),
                    Text(
                      ManagerStrings.orLoginBy,
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            fontSize: ManagerFontsSizes.f14,
                          ),
                    ),
                    Expanded(child: Divider(indent: ManagerWidths.w5)),
                  ],
                ),
                verticalSpace(ManagerHeights.h40),
                CustomButton(
                  color: ManagerColors.whiteColor,
                  borderColor: ManagerColors.blackColor,
                  onPressed: () => controller.add(LoginByGoogle()),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        ManagerAssets.googleIcon,
                        width: ManagerWidths.w20,
                      ),
                      horizontalSpace(ManagerWidths.w10),
                      Text(ManagerStrings.google)
                    ],
                  ),
                ),
                verticalSpace(ManagerHeights.h50),
                RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.labelLarge,
                    text: ManagerStrings.doNotHaveAnAccount,
                    children: [
                      TextSpan(
                        text: ' ${ManagerStrings.register}',
                        style: Theme.of(context).textTheme.labelMedium,
                        recognizer: controller.forgetPassword
                          ..onTap = () {
                            Navigator.pushNamed(
                                context, Routes.forgetPasswordScreen);
                          },
                      ),
                    ],
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
