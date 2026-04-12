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
import 'package:wafir_mobile/core/widgets/custom_spacing.dart';
import 'package:wafir_mobile/core/widgets/custom_text_field.dart';
import 'package:wafir_mobile/features/profile/domain/model/profile_data_model.dart';
import 'package:wafir_mobile/features/profile/presentation/controller/edit_profile_bloc.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({required this.profileData, super.key});

  final ProfileDataModel profileData;

  @override
  Widget build(BuildContext context) {
    var controller = instance<EditProfileBloc>();
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
      body: SingleChildScrollView(
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
                        : profileData.avatarUrl.isNotEmpty
                            ? Image.network(
                                profileData.avatarUrl,
                                fit: BoxFit.cover,
                              )
                            : Image.asset(
                                ManagerAssets.personImage,
                                fit: BoxFit.fitWidth,
                              ),
                  ),
                ),
                GestureDetector(
                  onTap: () => controller.add(ChangeImage()),
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
            BlocBuilder<EditProfileBloc, EditProfileState>(
              builder: (context, state) {
                return CustomDropDownList(
                  labelText: ManagerStrings.governorate,
                  items: AppConstants.omanLocations.keys.toList(),
                  selectedItem: state.governorate,
                  onChangedFunction: (value) => controller.add(
                    GovernorateChanged(value),
                  ),
                );
              },
            ),
            verticalSpace(ManagerHeights.h20),
            BlocBuilder<EditProfileBloc, EditProfileState>(
              builder: (context, state) {
                final selectedGovernorate = state.governorate;
                final cities = selectedGovernorate == null
                    ? <String>[]
                    : AppConstants.omanLocations[selectedGovernorate] ??
                        <String>[];
                return CustomDropDownList(
                  labelText: ManagerStrings.wilaya,
                  items: cities,
                  selectedItem: state.wilaya,
                  enabled: selectedGovernorate != null,
                  onChangedFunction: (value) =>
                      controller.add(WilayaChanged(value)),
                );
              },
            ),
            verticalSpace(ManagerHeights.h50),
            CustomButton(
              text: ManagerStrings.save,
              onPressed: () {
                FocusManager.instance.primaryFocus?.unfocus();
                ScaffoldMessenger.of(context).clearSnackBars();
                controller.add(EditProfileProcess(profileData.id));
              },
            ),
          ],
        ),
      ),
    );
  }
}
