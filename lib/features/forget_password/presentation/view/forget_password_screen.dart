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
import 'package:wafir_mobile/features/forget_password/presentation/controller/forget_password_bloc.dart';

class ForgetPasswordScreen extends StatelessWidget with CustomToastMassage {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ForgetPasswordBloc>();

    return BlocListener<ForgetPasswordBloc, ForgetPasswordState>(
      listener: (context, state) {
        if (state is ForgetPasswordLoading) {
          context.customLoading();
        } else {
          context.hideLoading();
        }

        if (state is ForgetPasswordSuccess) {
          showToast(ManagerStrings.forgetPasswordSuccess);
          Navigator.of(context).pop();
        } else if (state is ForgetPasswordFailure) {
          showToast(state.errorMessage ?? ManagerStrings.forgetPasswordFailure);
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
          child: Form(
            key: bloc.formKey,
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
                CustomTextField(
                  labelText: ManagerStrings.email,
                  controller: bloc.emailController,
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: Icons.email_outlined,
                  validator: (v) => Validator.emailValidator(v),
                ),
                verticalSpace(ManagerHeights.h30),
                SizedBox(
                  width: ManagerWidths.infinity,
                  child: BlocBuilder<ForgetPasswordBloc, ForgetPasswordState>(
                    buildWhen: (previous, current) =>
                        previous.isSubmitting != current.isSubmitting,
                    builder: (context, state) {
                      return CustomButton(
                        text: ManagerStrings.forgetPasswordButton,
                        onPressed: state.isSubmitting
                            ? () {}
                            : () => bloc.add(SubmitForgetPassword()),
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
