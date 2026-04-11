import 'package:flutter/material.dart';
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

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  String? _selectedGovernorate;
  String? _selectedCity;

  @override
  Widget build(BuildContext context) {
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
                    child: Image.asset(
                      ManagerAssets.personImage,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                CircleAvatar(
                  radius: ManagerRadius.r15,
                  backgroundColor: ManagerColors.primaryColor,
                  child: Icon(
                    Icons.edit,
                    color: Colors.white,
                    size: ManagerIconsSizes.i20,
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
                    controller: TextEditingController(),
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
                    controller: TextEditingController(),
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
              controller: TextEditingController(),
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
              controller: TextEditingController(),
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
              selectedItem: _selectedGovernorate,
              onChangedFunction: (value) {
                setState(() {
                  _selectedGovernorate = value;
                  // reset city when governorate changes
                  _selectedCity = null;
                });
              },
            ),
            verticalSpace(ManagerHeights.h20),
            Builder(
              builder: (context) {
                final selectedGovernorate = _selectedGovernorate;
                final cities = selectedGovernorate == null
                    ? <String>[]
                    : AppConstants.omanLocations[selectedGovernorate] ??
                        <String>[];
                return CustomDropDownList(
                  labelText: ManagerStrings.wilaya,
                  items: cities,
                  selectedItem: _selectedCity,
                  enabled: selectedGovernorate != null,
                  onChangedFunction: (value) {
                    setState(() {
                      _selectedCity = value;
                    });
                  },
                );
              },
            ),
            verticalSpace(ManagerHeights.h50),
            CustomButton(
              text: ManagerStrings.save,
              onPressed: () {
                // TODO: save profile with selected governorate & city
              },
            ),
          ],
        ),
      ),
    );
  }
}
