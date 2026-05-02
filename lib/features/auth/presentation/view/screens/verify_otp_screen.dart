import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafir_mobile/core/resource/manager_assets.dart';
import 'package:wafir_mobile/core/resource/manager_colors.dart';
import 'package:wafir_mobile/core/resource/manager_fonts.dart';
import 'package:wafir_mobile/core/resource/manager_sizes.dart';
import 'package:wafir_mobile/core/resource/manager_strings.dart';
import 'package:wafir_mobile/core/widgets/custom_button.dart';
import 'package:wafir_mobile/core/widgets/custom_loading.dart';
import 'package:wafir_mobile/core/widgets/custom_spacing.dart';
import 'package:wafir_mobile/core/widgets/custom_toast_massage.dart';
import 'package:wafir_mobile/features/auth/presentation/controller/verify_otp_bloc.dart';
import 'package:wafir_mobile/features/auth/presentation/view/widgets/custom_otp_filed.dart';
import 'package:wafir_mobile/routes/routes.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen(
      {required this.email, required this.nextScreenRoute, super.key});

  final String email;
  final String nextScreenRoute;

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen>
    with CustomToastMassage {
  late TextEditingController c1;
  late TextEditingController c2;
  late TextEditingController c3;
  late TextEditingController c4;
  late TextEditingController c5;
  late TextEditingController c6;

  late FocusNode f1;
  late FocusNode f2;
  late FocusNode f3;
  late FocusNode f4;
  late FocusNode f5;
  late FocusNode f6;
  bool f1IsFocused = false;
  bool f2IsFocused = false;
  bool f3IsFocused = false;
  bool f4IsFocused = false;
  bool f5IsFocused = false;
  bool f6IsFocused = false;

  void _updateFocusState(FocusNode node, bool current, ValueChanged<bool> set) {
    final newState = node.hasFocus;
    if (current != newState) {
      setState(() => set(newState));
    }
  }

  void _moveToPreviousAndClear(
      FocusNode previousFocus, TextEditingController previousController) {
    previousController.clear();
    previousFocus.requestFocus();
  }

  @override
  void initState() {
    super.initState();
    c1 = TextEditingController();
    c2 = TextEditingController();
    c3 = TextEditingController();
    c4 = TextEditingController();
    c5 = TextEditingController();
    c6 = TextEditingController();

    f1 = FocusNode();
    f2 = FocusNode();
    f3 = FocusNode();
    f4 = FocusNode();
    f5 = FocusNode();
    f6 = FocusNode();
    f1.addListener(
        () => _updateFocusState(f1, f1IsFocused, (v) => f1IsFocused = v));
    f2.addListener(
        () => _updateFocusState(f2, f2IsFocused, (v) => f2IsFocused = v));
    f3.addListener(
        () => _updateFocusState(f3, f3IsFocused, (v) => f3IsFocused = v));
    f4.addListener(
        () => _updateFocusState(f4, f4IsFocused, (v) => f4IsFocused = v));
    f5.addListener(
        () => _updateFocusState(f5, f5IsFocused, (v) => f5IsFocused = v));
    f6.addListener(
        () => _updateFocusState(f6, f6IsFocused, (v) => f6IsFocused = v));
  }

  @override
  void dispose() {
    c1.dispose();
    c2.dispose();
    c3.dispose();
    c4.dispose();
    c5.dispose();
    c6.dispose();
    f1.dispose();
    f2.dispose();
    f3.dispose();
    f4.dispose();
    f5.dispose();
    f6.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.read<VerifyOtpBloc>();
    return BlocListener<VerifyOtpBloc, VerifyOtpState>(
      listener: (context, state) {
        if (state is VerifyOtpLoading) {
          showCustomLoading(context);
        } else if (state is VerifyOtpSuccess) {
          Navigator.of(context, rootNavigator: true).pop();
          Navigator.of(context).pushNamedAndRemoveUntil(
            widget.nextScreenRoute,
            (route) => route.settings.name == Routes.loginScreen,
          );
        } else if (state is VerifyOtpFailure) {
          Navigator.of(context, rootNavigator: true).pop();
          showToast(state.message);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(ManagerStrings.otpTitle),
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsetsDirectional.symmetric(
            horizontal: ManagerWidths.w20,
            vertical: ManagerHeights.h30,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(ManagerAssets.verifyOtpImage),
              Text(
                ManagerStrings.otpDescription,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      fontWeight: ManagerFontWeight.semiBold,
                      color: ManagerColors.blackColor,
                    ),
              ),
              verticalSpace(ManagerHeights.h30),
              SizedBox(
                height: ManagerHeights.h60,
                child: Padding(
                  padding: EdgeInsetsDirectional.symmetric(
                    horizontal: ManagerWidths.w20,
                  ),
                  child: Row(
                    children: [
                      Flexible(
                        child: CustomOtpFiled(
                          controller: c1,
                          focusNode: f1,
                          isFocused: f1IsFocused,
                          autofocus: true,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              f2.requestFocus();
                            }
                          },
                        ),
                      ),
                      horizontalSpace(ManagerWidths.w10),
                      Flexible(
                        child: CustomOtpFiled(
                          controller: c2,
                          focusNode: f2,
                          isFocused: f2IsFocused,
                          onEmptyBackspace: () =>
                              _moveToPreviousAndClear(f1, c1),
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              f3.requestFocus();
                            }
                          },
                        ),
                      ),
                      horizontalSpace(ManagerWidths.w10),
                      Flexible(
                        child: CustomOtpFiled(
                          controller: c3,
                          focusNode: f3,
                          isFocused: f3IsFocused,
                          onEmptyBackspace: () =>
                              _moveToPreviousAndClear(f2, c2),
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              f4.requestFocus();
                            }
                          },
                        ),
                      ),
                      horizontalSpace(ManagerWidths.w10),
                      Flexible(
                        child: CustomOtpFiled(
                          controller: c4,
                          focusNode: f4,
                          isFocused: f4IsFocused,
                          onEmptyBackspace: () =>
                              _moveToPreviousAndClear(f3, c3),
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              f5.requestFocus();
                            }
                          },
                        ),
                      ),
                      horizontalSpace(ManagerWidths.w10),
                      Flexible(
                        child: CustomOtpFiled(
                          controller: c5,
                          focusNode: f5,
                          isFocused: f5IsFocused,
                          onEmptyBackspace: () =>
                              _moveToPreviousAndClear(f4, c4),
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              f6.requestFocus();
                            }
                          },
                        ),
                      ),
                      horizontalSpace(ManagerWidths.w10),
                      Flexible(
                        child: CustomOtpFiled(
                          controller: c6,
                          focusNode: f6,
                          isFocused: f6IsFocused,
                          onEmptyBackspace: () =>
                              _moveToPreviousAndClear(f5, c5),
                          onChanged: (value) {
                            // Keep last field behavior simple; backspace is handled by onEmptyBackspace.
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              verticalSpace(ManagerHeights.h40),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: ManagerWidths.w20),
                child: CustomButton(
                  text: ManagerStrings.confirm,
                  onPressed: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    ScaffoldMessenger.of(context).clearSnackBars();
                    final otp = c1.text +
                        c2.text +
                        c3.text +
                        c4.text +
                        c5.text +
                        c6.text;
                    controller
                        .add(VerifyOtpProcess(email: widget.email, otp: otp));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
