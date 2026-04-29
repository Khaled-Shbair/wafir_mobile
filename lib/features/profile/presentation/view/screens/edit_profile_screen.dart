import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafir_mobile/config/constants/app_constants.dart';
import 'package:wafir_mobile/config/dependency_injection.dart';
import 'package:wafir_mobile/core/resource/manager_assets.dart';
import 'package:wafir_mobile/core/resource/manager_colors.dart';
import 'package:wafir_mobile/core/resource/manager_sizes.dart';
import 'package:wafir_mobile/core/resource/manager_strings.dart';
import 'package:wafir_mobile/core/validator/validator.dart';
import 'package:wafir_mobile/core/widgets/custom_button.dart';
import 'package:wafir_mobile/core/widgets/custom_drop_down_list.dart';
import 'package:wafir_mobile/core/widgets/custom_loading.dart';
import 'package:wafir_mobile/core/widgets/custom_spacing.dart';
import 'package:wafir_mobile/core/widgets/custom_text_field.dart';
import 'package:wafir_mobile/core/widgets/custom_toast_massage.dart';
import 'package:wafir_mobile/features/profile/presentation/controller/edit_profile_bloc.dart';

class EditProfileScreen extends StatelessWidget with CustomToastMassage {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<EditProfileBloc>();
    return Scaffold(
      appBar: AppBar(
        title: Text(ManagerStrings.editProfile),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            disposeEditProfile();
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: BlocConsumer<EditProfileBloc, EditProfileState>(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: (context, state) {
          // show loading when profile is being fetched or when submitting changes
          if (state.status == EditProfileStatus.loadingProfile ||
              state.status == EditProfileStatus.submitting) {
            showCustomLoading(context);
          } else if (state.status == EditProfileStatus.failure ||
              state.status == EditProfileStatus.success ||
              state.status == EditProfileStatus.ready) {
            // hide loading dialog if shown
            final rootNavigator = Navigator.of(context, rootNavigator: true);
            if (rootNavigator.canPop()) rootNavigator.pop();
            if (state.message != null && state.message!.isNotEmpty) {
              showToast(state.message!);
            }
          }
        },
        builder: (context, state) {
          if (state.isProfileLoaded) {
            final isSubmitting = state.status == EditProfileStatus.submitting;
            final canSubmit = state.isProfileLoaded && !isSubmitting;
            return SingleChildScrollView(
              padding: EdgeInsetsDirectional.only(
                top: ManagerHeights.h20,
                bottom: ManagerHeights.h20,
                start: ManagerWidths.w20,
                end: ManagerWidths.w20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    alignment: AlignmentDirectional.bottomStart,
                    children: [
                      Container(
                        height: ManagerHeights.h120,
                        width: ManagerWidths.w120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ManagerColors.blackColor,
                        ),
                        child: ClipOval(
                          child: controller.selectedImage != null
                              ? Image.file(
                                  controller.selectedImage!,
                                  fit: BoxFit.cover,
                                )
                              : controller.avatarUrl.isNotEmpty
                                  ? Image.network(
                                      controller.avatarUrl,
                                      fit: BoxFit.cover,
                                    )
                                  : Image.asset(
                                      ManagerAssets.personImage,
                                      fit: BoxFit.fitWidth,
                                    ),
                        ),
                      ),
                      GestureDetector(
                        onTap: canSubmit
                            ? () => controller.add(ChangeImage())
                            : null,
                        child: CircleAvatar(
                          radius: ManagerRadius.r15,
                          backgroundColor: ManagerColors.primaryColor,
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: ManagerIconsSizes.i20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(ManagerHeights.h50),
                  Row(
                    children: [
                      Flexible(
                        child: CustomTextField(
                          labelText: ManagerStrings.firstName,
                          controller: controller.firstName,
                          validator: (v) => Validator.nameValidate(v),
                          prefixIcon: Icon(
                            Icons.person_outline,
                            size: ManagerIconsSizes.i24,
                          ),
                          keyboardType: TextInputType.name,
                        ),
                      ),
                      horizontalSpace(ManagerWidths.w10),
                      Flexible(
                        child: CustomTextField(
                          labelText: ManagerStrings.lastName,
                          controller: controller.lastName,
                          validator: (v) => Validator.nameValidate(v),
                          prefixIcon: Icon(
                            Icons.person_outline,
                            size: ManagerIconsSizes.i24,
                          ),
                          keyboardType: TextInputType.name,
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(ManagerHeights.h20),
                  CustomTextField(
                    labelText: ManagerStrings.email,
                    controller: controller.email,
                    readOnly: true,
                    validator: (v) => Validator.emailValidator(v),
                    prefixIcon: Icon(
                      Icons.mail_outline,
                      size: ManagerIconsSizes.i24,
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  verticalSpace(ManagerHeights.h20),
                  CustomTextField(
                    labelText: ManagerStrings.phoneNumber,
                    controller: controller.phoneNumber,
                    validator: (v) => Validator.phoneValidate(v),
                    prefixIcon: Icon(
                      Icons.phone_outlined,
                      size: ManagerIconsSizes.i24,
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                  verticalSpace(ManagerHeights.h20),
                  CustomDropDownList(
                    labelText: ManagerStrings.governorate,
                    items: AppConstants.omanLocations.keys.toList(),
                    selectedItem: state.governorate,
                    enabled: canSubmit,
                    onChangedFunction: (value) {
                      if (!canSubmit) return;
                      controller.add(GovernorateChanged(value));
                    },
                  ),
                  verticalSpace(ManagerHeights.h20),
                  Builder(
                    builder: (context) {
                      final selectedGovernorate = state.governorate;
                      final cities = selectedGovernorate == null
                          ? <String>[]
                          : AppConstants.omanLocations[selectedGovernorate] ??
                              <String>[];
                      return CustomDropDownList(
                        labelText: ManagerStrings.wilaya,
                        items: cities,
                        selectedItem: state.wilaya,
                        enabled: selectedGovernorate != null && canSubmit,
                        onChangedFunction: (value) {
                          if (!canSubmit) return;
                          controller.add(WilayaChanged(value));
                        },
                      );
                    },
                  ),
                  verticalSpace(ManagerHeights.h50),
                  CustomButton(
                    text: ManagerStrings.save,
                    onPressed: canSubmit
                        ? () {
                            FocusManager.instance.primaryFocus?.unfocus();
                            ScaffoldMessenger.of(context).clearSnackBars();
                            controller.add(EditProfileProcess());
                          }
                        : null,
                  ),
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
