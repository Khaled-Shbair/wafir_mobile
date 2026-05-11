import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafir_mobile/config/constants/api_constants.dart';
import 'package:wafir_mobile/config/constants/app_constants.dart';
import 'package:wafir_mobile/config/constants/shared_preferences_keys.dart';
import 'package:wafir_mobile/config/dependency_injection.dart';
import 'package:wafir_mobile/core/resource/manager_sizes.dart';
import 'package:wafir_mobile/core/resource/manager_strings.dart';
import 'package:wafir_mobile/core/storage/local/shared_preferences_controller.dart';
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

class RegisterScreen extends StatefulWidget with CustomToastMassage {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
    with CustomToastMassage {
  final FocusNode firstNameFocusNode = FocusNode();
  final FocusNode lastNameFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode phoneNumberFocusNode = FocusNode();
  final FocusNode governorateFocusNode = FocusNode();
  final FocusNode wilayaFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  late TextEditingController firstName;
  late TextEditingController lastName;
  late TextEditingController email;
  late TextEditingController phoneNumber;
  late TextEditingController password;
  late TapGestureRecognizer loginRecognizer;

  late TapGestureRecognizer termsOfUseRecognizer;
  late TapGestureRecognizer privacyPolicyRecognizer;
  bool firstNameIsFocused = false;
  bool lastNameIsFocused = false;
  bool emailIsFocused = false;
  bool phoneNumberIsFocused = false;
  bool governorateIsFocused = false;
  bool wilayaIsFocused = false;
  bool passwordIsFocused = false;

  @override
  initState() {
    super.initState();
    loginRecognizer = TapGestureRecognizer();
    termsOfUseRecognizer = TapGestureRecognizer();
    privacyPolicyRecognizer = TapGestureRecognizer();
    firstName = TextEditingController();
    lastName = TextEditingController();
    email = TextEditingController();
    phoneNumber = TextEditingController();
    password = TextEditingController();

    firstNameFocusNode.addListener(() {
      setState(() {
        firstNameIsFocused = firstNameFocusNode.hasFocus;
      });
    });
    lastNameFocusNode.addListener(() {
      setState(() {
        lastNameIsFocused = lastNameFocusNode.hasFocus;
      });
    });
    emailFocusNode.addListener(() {
      setState(() {
        emailIsFocused = emailFocusNode.hasFocus;
      });
    });
    phoneNumberFocusNode.addListener(() {
      setState(() {
        phoneNumberIsFocused = phoneNumberFocusNode.hasFocus;
      });
    });
    governorateFocusNode.addListener(() {
      setState(() {
        governorateIsFocused = governorateFocusNode.hasFocus;
      });
    });
    wilayaFocusNode.addListener(() {
      setState(() {
        wilayaIsFocused = wilayaFocusNode.hasFocus;
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
    firstName.dispose();
    lastName.dispose();
    email.dispose();
    phoneNumber.dispose();
    password.dispose();
    firstNameFocusNode.dispose();
    lastNameFocusNode.dispose();
    emailFocusNode.dispose();
    phoneNumberFocusNode.dispose();
    governorateFocusNode.dispose();
    wilayaFocusNode.dispose();
    passwordFocusNode.dispose();
    disposeRegister();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var controller = context.read<RegisterBloc>();

    return Scaffold(
      appBar: AppBar(
        title: Text(ManagerStrings.createAccount),
        leading: IconButton(
          onPressed: () {
            instance<SharedPreferencesController>()
                .removeData(SharedPreferencesKeys.token);
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
                email.text,
                Routes.mainScreen,
                ApiKeys.registrationType,
              ],
            );
          } else if (state is RegisterFailure) {
            // Close loading dialog using root navigator
            Navigator.of(context, rootNavigator: true).pop();
            widget.showToast(state.errorMessage);
          }
        },
        child: SingleChildScrollView(
          padding: EdgeInsetsDirectional.only(
            start: ManagerWidths.w20,
            end: ManagerWidths.w20,
            top: ManagerHeights.h20,
            bottom: ManagerHeights.h7,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            maxLength: 30,
                            controller: firstName,
                            hintText: ManagerStrings.firstName,
                            keyboardType: TextInputType.name,
                            prefixIconData: Icons.person_outline,
                            isFocused: firstNameIsFocused,
                            focusNode: firstNameFocusNode,
                            textInputAction: TextInputAction.next,
                            validator: (v) => Validator.nameValidate(v),
                          ),
                        ),
                        horizontalSpace(ManagerWidths.w20),
                        Expanded(
                          child: CustomTextField(
                            maxLength: 30,
                            controller: lastName,
                            hintText: ManagerStrings.lastName,
                            keyboardType: TextInputType.name,
                            prefixIconData: Icons.person_outline,
                            isFocused: lastNameIsFocused,
                            focusNode: lastNameFocusNode,
                            textInputAction: TextInputAction.next,
                            validator: (v) => Validator.nameValidate(v),
                          ),
                        ),
                      ],
                    ),
                    verticalSpace(ManagerHeights.h20),
                    CustomTextField(
                      maxLength: 30,
                      controller: email,
                      hintText: ManagerStrings.email,
                      prefixIconData: Icons.mail_outline,
                      isFocused: emailIsFocused,
                      focusNode: emailFocusNode,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      validator: (v) => Validator.emailValidator(v),
                    ),
                    verticalSpace(ManagerHeights.h20),
                    CustomTextField(
                      maxLength: 8,
                      controller: phoneNumber,
                      hintText: ManagerStrings.phoneNumber,
                      prefixIconData: Icons.phone,
                      isFocused: phoneNumberIsFocused,
                      focusNode: phoneNumberFocusNode,
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.next,
                      validator: (v) => Validator.phoneValidate(v),
                    ),
                    verticalSpace(ManagerHeights.h20),
                    BlocBuilder<RegisterBloc, RegisterState>(
                      builder: (context, state) {
                        return CustomDropDownList(
                          validator: (v) => Validator.governorateValidator(v),
                          hintText: ManagerStrings.governorate,
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
                          hintText: ManagerStrings.wilaya,
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
                    BlocBuilder<RegisterBloc, RegisterState>(
                      builder: (context, state) {
                        return CustomTextField(
                          maxLength: 50,
                          controller: password,
                          hintText: ManagerStrings.password,
                          prefixIconData: Icons.lock_outline,
                          isFocused: passwordIsFocused,
                          focusNode: passwordFocusNode,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: state.passwordVisible,
                          isPassword: true,
                          textInputAction: TextInputAction.done,
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
                            recognizer: privacyPolicyRecognizer
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
                            recognizer: termsOfUseRecognizer
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
              BlocBuilder<RegisterBloc, RegisterState>(
                builder: (context, state) {
                  return CustomButton(
                      onPressed: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                        ScaffoldMessenger.of(context).clearSnackBars();
                        if (state.selectedGovernorate != null &&
                            state.selectedCity != null) {
                          controller.add(
                            RegisterByEmailProcess(
                              email: email.text,
                              password: password.text,
                              firstName: firstName.text,
                              lastName: lastName.text,
                              phoneNumber: phoneNumber.text,
                              governorate: state.selectedGovernorate!,
                              city: state.selectedCity!,
                            ),
                          );
                        } else {
                          controller.add(
                            RegisterByEmailProcess(
                              email: email.text,
                              password: password.text,
                              firstName: firstName.text,
                              lastName: lastName.text,
                              phoneNumber: phoneNumber.text,
                              governorate: '',
                              city: '',
                            ),
                          );
                        }
                      },
                      text: ManagerStrings.create);
                },
              ),
              verticalSpace(ManagerHeights.h50),
            ],
          ),
        ),
      ),
    );
  }
}
