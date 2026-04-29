import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafir_mobile/config/constants/app_constants.dart';
import 'package:wafir_mobile/config/dependency_injection.dart';
import 'package:wafir_mobile/core/resource/manager_sizes.dart';
import 'package:wafir_mobile/core/resource/manager_strings.dart';
import 'package:wafir_mobile/core/validator/validator.dart';
import 'package:wafir_mobile/core/widgets/custom_button.dart';
import 'package:wafir_mobile/core/widgets/custom_drop_down_list.dart';
import 'package:wafir_mobile/core/widgets/custom_loading.dart';
import 'package:wafir_mobile/core/widgets/custom_spacing.dart';
import 'package:wafir_mobile/core/widgets/custom_text_field.dart';
import 'package:wafir_mobile/core/widgets/custom_toast_massage.dart';
import 'package:wafir_mobile/core/widgets/custom_web_view_bottom_sheet.dart';
import 'package:wafir_mobile/features/auth/presentation/controller/register_bloc.dart';
import 'package:wafir_mobile/routes/routes.dart';

class RegisterScreen extends StatelessWidget with CustomToastMassage {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = context.read<RegisterBloc>();

    return Scaffold(
      appBar: AppBar(
        title: Text(ManagerStrings.createAccount),
        leading: IconButton(
          onPressed: () {
            disposeRegister();
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: BlocListener<RegisterBloc, RegisterState>(
        listener: (_, state) {
          if (state is RegisterLoading) {
            showCustomLoading(context);
          } else if (state is RegisterSuccessfully) {
            // Close loading dialog using root navigator
            Navigator.of(context, rootNavigator: true).pop();
            // Navigate using root navigator to escape dialog context
            Navigator.pushReplacementNamed(
              context,
              Routes.verifyOtpScreen,
              arguments: [
                controller.email.text,
                Routes.mainScreen,
              ],
            );
          } else if (state is RegisterFailure) {
            // Close loading dialog using root navigator
            Navigator.of(context, rootNavigator: true).pop();
            showToast(state.errorMessage);
          }
        },
        child: SingleChildScrollView(
          padding: EdgeInsetsDirectional.only(
            start: ManagerWidths.w20,
            end: ManagerWidths.w20,
            top: ManagerHeights.h10,
            bottom: ManagerHeights.h7,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ManagerStrings.createAccount,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              verticalSpace(ManagerHeights.h7),
              Text(
                ManagerStrings.createAccountSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              verticalSpace(ManagerHeights.h20),
              Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: CustomTextField(
                          controller: controller.firstName,
                          hintText: ManagerStrings.firstName,
                          keyboardType: TextInputType.name,
                          prefixIcon: Icon(
                            Icons.person_outline,
                            size: ManagerIconsSizes.i24,
                          ),
                          validator: (v) => Validator.nameValidate(v),
                        )),
                        horizontalSpace(ManagerWidths.w20),
                        Expanded(
                          child: CustomTextField(
                            controller: controller.lastName,
                            prefixIcon: Icon(
                              Icons.person_outline,
                              size: ManagerIconsSizes.i24,
                            ),
                            hintText: ManagerStrings.lastName,
                            validator: (v) => Validator.nameValidate(v),
                            keyboardType: TextInputType.name,
                          ),
                        ),
                      ],
                    ),
                    verticalSpace(ManagerHeights.h20),
                    CustomTextField(
                      controller: controller.email,
                      hintText: ManagerStrings.email,
                      prefixIcon: Icon(
                        Icons.mail_outline,
                        size: ManagerIconsSizes.i24,
                      ),
                      validator: (v) => Validator.emailValidator(v),
                    ),
                    verticalSpace(ManagerHeights.h20),
                    CustomTextField(
                      controller: controller.phoneNumber,
                      hintText: ManagerStrings.phoneNumber,
                      validator: (v) => Validator.phoneValidate(v),
                      prefixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          horizontalSpace(ManagerWidths.w10),
                          Icon(
                            Icons.phone,
                            size: ManagerIconsSizes.i24,
                          ),
                          horizontalSpace(ManagerWidths.w5),
                          Text(
                            '+869',
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        ],
                      ),
                      keyboardType: TextInputType.phone,
                    ),
                    verticalSpace(ManagerHeights.h20),
                    BlocBuilder<RegisterBloc, RegisterState>(
                      builder: (context, state) {
                        return CustomDropDownList(
                          validator: (v) => Validator.governorateValidator(v),
                          labelText: ManagerStrings.governorate,
                          items: AppConstants.omanLocations.keys.toList(),
                          selectedItem: state.selectedGovernorate,
                          onChangedFunction: (value) {
                            if (value != null) {
                              controller.add(GovernorateChanged(value));
                            }
                          },
                        );
                      },
                    ),
                    verticalSpace(ManagerHeights.h20),
                    BlocBuilder<RegisterBloc, RegisterState>(
                      builder: (context, state) {
                        final selectedGovernorate = state.selectedGovernorate;
                        final cities = selectedGovernorate == null
                            ? <String>[]
                            : AppConstants.omanLocations[selectedGovernorate] ??
                                <String>[];
                        return CustomDropDownList(
                          labelText: ManagerStrings.wilaya,
                          items: cities,
                          validator: (v) => Validator.wilayaValidator(v),
                          selectedItem: state.selectedCity,
                          enabled: selectedGovernorate != null,
                          onChangedFunction: (value) {
                            if (value != null) {
                              controller.add(CityChanged(value));
                            }
                          },
                        );
                      },
                    ),
                    verticalSpace(ManagerHeights.h20),
                    CustomTextField(
                      controller: controller.password,
                      labelText: ManagerStrings.password,
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        size: ManagerIconsSizes.i24,
                      ),
                      validator: (v) => Validator.passwordValidator(v),
                      keyboardType: TextInputType.visiblePassword,
                    ),
                  ],
                ),
              ),
              verticalSpace(ManagerHeights.h20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BlocBuilder<RegisterBloc, RegisterState>(
                    builder: (context, state) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: Checkbox(
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          splashRadius: 0,
                          value: state.isAccepted,
                          onChanged: (value) =>
                              controller.add(AcceptedCreate(value ?? false)),
                        ),
                      );
                    },
                  ),
                  Flexible(
                    child: RichText(
                      maxLines: 2,
                      text: TextSpan(
                        text:
                            ' ${ManagerStrings.byCreatingThisAccountIAgreeTo}',
                        style: Theme.of(context).textTheme.labelLarge,
                        children: [
                          TextSpan(
                            text: ' ${ManagerStrings.privacyPolicy} ',
                            recognizer: controller.privacyPolicy
                              ..onTap = () {
                                customWebViewBottomSheet(
                                  context,
                                  ManagerStrings.privacyPolicy,
                                  AppConstants.privacyPolicy,
                                );
                              },
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(
                                  color: Theme.of(context).primaryColor,
                                ),
                          ),
                          TextSpan(text: ' ${ManagerStrings.and}'),
                          TextSpan(
                            text: ManagerStrings.termsOfUse,
                            recognizer: controller.termsOfUse
                              ..onTap = () {
                                customWebViewBottomSheet(
                                  context,
                                  ManagerStrings.termsOfUse,
                                  AppConstants.termsOfUse,
                                );
                              },
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(
                                  color: Theme.of(context).primaryColor,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              verticalSpace(ManagerHeights.h20),
              CustomButton(
                  onPressed: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    ScaffoldMessenger.of(context).clearSnackBars();
                    controller.add(RegisterByEmailProcess());
                  },
                  text: ManagerStrings.create),
              verticalSpace(ManagerHeights.h50),
            ],
          ),
        ),
      ),
    );
  }
}
