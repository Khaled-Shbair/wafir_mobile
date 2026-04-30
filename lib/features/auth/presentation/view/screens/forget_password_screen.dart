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

class ForgetPasswordScreen extends StatefulWidget with CustomToastMassage {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen>
    with CustomToastMassage {
  final FocusNode emailFocusNode = FocusNode();
  final TextEditingController email = TextEditingController();

  bool emailIsFocused = false;

  @override
  void initState() {
    super.initState();
    emailFocusNode.addListener(() {
      setState(() {
        emailIsFocused = emailFocusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    email.dispose();
    emailFocusNode.dispose();
    disposeForgetPassword();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.read<ForgetPasswordBloc>();

    return BlocListener<ForgetPasswordBloc, ForgetPasswordState>(
      listener: (context, state) {
        if (state is ForgetPasswordLoading) {
          showCustomLoading(context);
        } else if (state is ForgetPasswordSuccess) {
          Navigator.of(context, rootNavigator: true).pop();
          Navigator.pushNamed(
            context,
            Routes.verifyOtpScreen,
            arguments: [
              state.email,
              Routes.loginScreen,
            ],
          );
        } else if (state is ForgetPasswordFailure) {
          Navigator.of(context, rootNavigator: true).pop();
          showToast(state.message);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(ManagerStrings.forgetPasswordTitle),
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
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
                  maxLength: 50,
                  hintText: ManagerStrings.email,
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  prefixIconData: Icons.email_outlined,
                  isFocused: emailIsFocused,
                  focusNode: emailFocusNode,
                  textInputAction: TextInputAction.done,
                  validator: (v) => Validator.emailValidator(v),
                ),
              ),
              verticalSpace(ManagerHeights.h30),
              CustomButton(
                text: ManagerStrings.send,
                onPressed: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  controller.add(ForgotPasswordProcess(email.text.trim()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
