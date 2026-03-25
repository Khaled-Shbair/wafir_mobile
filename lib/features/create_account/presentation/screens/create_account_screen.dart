import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafir_mobile/config/constants/app_constants.dart';
import 'package:wafir_mobile/config/dependency_injection.dart';
import 'package:wafir_mobile/core/resource/manager_sizes.dart';
import 'package:wafir_mobile/core/resource/manager_strings.dart';
import 'package:wafir_mobile/core/validator/validator.dart';
import 'package:wafir_mobile/core/widgets/custom_button.dart';
import 'package:wafir_mobile/core/widgets/custom_drop_down_list.dart';
import 'package:wafir_mobile/core/widgets/custom_spacing.dart';
import 'package:wafir_mobile/core/widgets/custom_text_field.dart';
import 'package:wafir_mobile/features/create_account/presentation/controller/create_account_bloc.dart';
import 'package:wafir_mobile/routes/routes.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = context.read<CreateAccountBloc>();

    return Scaffold(
      appBar: AppBar(
        title: Text(ManagerStrings.createAccount),
        leading: IconButton(
          onPressed: () {
            initLogin();
            disposeCreateAccount();
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SingleChildScrollView(
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
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: CustomTextField(
                          controller: TextEditingController(),
                          labelText: ManagerStrings.firstName,
                          keyboardType: TextInputType.name,
                          prefixIcon: Icons.person_outline,
                          validator: (v) => Validator.nameValidate(v),
                        )),
                        horizontalSpace(ManagerWidths.w20),
                        Expanded(
                          child: CustomTextField(
                            controller: TextEditingController(),
                            prefixIcon: Icons.person_outline,
                            labelText: ManagerStrings.lastName,
                            validator: (v) => Validator.nameValidate(v),
                            keyboardType: TextInputType.name,
                          ),
                        ),
                      ],
                    ),
                    verticalSpace(ManagerHeights.h20),
                    CustomTextField(
                      controller: TextEditingController(),
                      labelText: ManagerStrings.email,
                      prefixIcon: Icons.mail_outline,
                      validator: (v) => Validator.emailValidator(v),
                    ),
                    verticalSpace(ManagerHeights.h20),
                    CustomTextField(
                      controller: TextEditingController(),
                      labelText: ManagerStrings.phoneNumber,
                      validator: (v) => Validator.phoneValidate(v),
                      prefixIcon: Icons.phone,
                      keyboardType: TextInputType.phone,
                    ),
                    verticalSpace(ManagerHeights.h20),
                    BlocBuilder<CreateAccountBloc, CreateAccountState>(
                      builder: (context, state) {
                        return CustomDropDownList(
                          labelText: ManagerStrings.governorate,
                          items: AppConstants.omanLocations.keys.toList(),
                          selectedItem: state.selectedGovernorate,
                          onChangedFunction: (value) {
                            controller.add(GovernorateChanged(value));
                          },
                        );
                      },
                    ),
                    verticalSpace(ManagerHeights.h20),
                    BlocBuilder<CreateAccountBloc, CreateAccountState>(
                      builder: (context, state) {
                        final selectedGovernorate = state.selectedGovernorate;
                        final cities = selectedGovernorate == null
                            ? <String>[]
                            : AppConstants.omanLocations[selectedGovernorate] ??
                                <String>[];
                        return CustomDropDownList(
                          labelText: ManagerStrings.city,
                          items: cities,
                          selectedItem: state.selectedCity,
                          enabled: selectedGovernorate != null,
                          onChangedFunction: (value) {
                            controller.add(CityChanged(value));
                          },
                        );
                      },
                    ),
                    verticalSpace(ManagerHeights.h20),
                    CustomTextField(
                      controller: TextEditingController(),
                      labelText: ManagerStrings.password,
                      prefixIcon: Icons.lock_outline,
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
                  BlocBuilder<CreateAccountBloc, CreateAccountState>(
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
                    controller.add(CreateAccountProcess());
                  },
                  text: ManagerStrings.create),
              verticalSpace(ManagerHeights.h50),
              // RichText(
              //   text: TextSpan(
              //     style: Theme.of(context).textTheme.labelLarge,
              //     text: ManagerStrings.doHaveAnAccount,
              //     children: [
              //       TextSpan(
              //         text: ' ${ManagerStrings.login}',
              //         style: Theme.of(context).textTheme.labelMedium,
              //         recognizer: controller.login
              //           ..onTap = () {
              //             Navigator.pushNamed(context, Routes.loginScreen);
              //           },
              //       ),
              //     ],
              //   ),
              // ),
            ],
          )),
    );
  }
}
