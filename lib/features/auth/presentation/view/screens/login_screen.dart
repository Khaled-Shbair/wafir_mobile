import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafir_mobile/config/dependency_injection.dart';
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
import 'package:wafir_mobile/features/auth/presentation/view/widgets/custom_activation_messenger.dart';
import 'package:wafir_mobile/routes/routes.dart';
import 'package:wafir_mobile/features/auth/presentation/controller/login_bloc.dart';

class LoginScreen extends StatefulWidget with CustomToastMassage {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with CustomToastMassage {
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final TapGestureRecognizer createAccount = TapGestureRecognizer();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool emailIsFocused = false;
  bool passwordIsFocused = false;

  @override
  initState() {
    super.initState();
    emailFocusNode.addListener(() {
      setState(() {
        emailIsFocused = emailFocusNode.hasFocus;
      });
    });
    passwordFocusNode.addListener(() {
      setState(() {
        passwordIsFocused = passwordFocusNode.hasFocus;
      });
    });
  }

  @override
  dispose() {
    email.dispose();
    password.dispose();
    createAccount.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    disposeLogin();
    disposeAuth();
    disposeRegister();
    disposeForgetPassword();
    disposeResetPassword();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var controller = context.read<LoginBloc>();
    return BlocListener<LoginBloc, LoginState>(
      listener: (_, state) {
        if (state is LoginLoading) {
          showCustomLoading(context);
        } else if (state is LoginSuccessfully) {
          // // Close loading dialog using root navigator
          // Navigator.of(context, rootNavigator: true).pop();
          // // Navigate using root navigator to escape dialog context
          Navigator.pushNamedAndRemoveUntil(
              context, Routes.mainScreen, (route) => false);
        } else if (state is LoginFailure) {
          // Close loading dialog using root navigator
          Navigator.of(context, rootNavigator: true).pop();
          if (state.errorMessage.contains('تعذر إكمال تسجيل الدخول')) {
            customActivationMessenger(context, email.text.trim());
          } else {
            showToast(state.errorMessage);
          }
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              if (Navigator.canPop(context)) {
                Navigator.pop(context);
              }
            },
            icon: Icon(
              Icons.arrow_back_ios_new_outlined,
              size: ManagerIconsSizes.i20,
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsetsDirectional.only(
            bottom: ManagerHeights.h40,
            start: ManagerWidths.w25,
            end: ManagerWidths.w25,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                ManagerAssets.logo,
                height: ManagerHeights.h100,
              ),
              verticalSpace(ManagerHeights.h50),
              Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    CustomTextField(
                      maxLength: 30,
                      prefixIconData: Icons.email_outlined,
                      keyboardType: TextInputType.emailAddress,
                      hintText: ManagerStrings.email,
                      isFocused: emailIsFocused,
                      textInputAction: TextInputAction.next,
                      controller: email,
                      focusNode: emailFocusNode,
                      validator: (v) => Validator.emailValidator(v),
                    ),
                    verticalSpace(ManagerHeights.h20),
                    BlocBuilder<LoginBloc, LoginState>(
                      builder: (context, state) {
                        return CustomTextField(
                          maxLength: 50,
                          focusNode: passwordFocusNode,
                          textInputAction: TextInputAction.done,
                          prefixIconData: Icons.lock_outline,
                          isFocused: passwordIsFocused,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: state.passwordVisible,
                          isPassword: true,
                          hintText: ManagerStrings.password,
                          controller: password,
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
                    onPressed: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      ScaffoldMessenger.of(context).clearSnackBars();
                      Navigator.pushNamed(context, Routes.forgetPasswordScreen);
                    },
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
                onPressed: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  ScaffoldMessenger.of(context).clearSnackBars();
                  controller.add(LoginProcess(
                    email: email.text.trim(),
                    password: password.text.trim(),
                  ));
                },
              ),
              verticalSpace(ManagerHeights.h40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Divider(
                      indent: ManagerWidths.w5,
                      color: ManagerColors.unFocusBorderColor,
                    ),
                  ),
                  Text(
                    ManagerStrings.orLoginBy,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontSize: ManagerFontsSizes.f14,
                          color: ManagerColors.blackColor,
                        ),
                  ),
                  Expanded(
                    child: Divider(
                      indent: ManagerWidths.w5,
                      color: ManagerColors.unFocusBorderColor,
                    ),
                  ),
                ],
              ),
              verticalSpace(ManagerHeights.h20),
              CustomButton(
                color: ManagerColors.unFocusBorderColor,
                onPressed: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  ScaffoldMessenger.of(context).clearSnackBars();
                  //TODO: implement login by google
                  // controller.add(LoginByGoogle());
                  showToast('سيتم تنفيذ تسجيل الدخول عبر جوجل قريباً');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      ManagerAssets.googleIcon,
                      width: ManagerWidths.w20,
                    ),
                    horizontalSpace(ManagerWidths.w10),
                    Text(
                      ManagerStrings.google,
                      style: TextStyle(
                        fontFamily: ManagerFontFamily.tajawal,
                        fontSize: ManagerFontsSizes.f18,
                        fontWeight: ManagerFontWeight.bold,
                        color: ManagerColors.primaryColor,
                      ),
                    )
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
                      recognizer: createAccount
                        ..onTap = () {
                          ScaffoldMessenger.of(context).clearSnackBars();
                          Navigator.pushNamed(context, Routes.registerScreen);
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
