import 'package:flutter/material.dart';
import 'package:wafir_mobile/core/resource/manager_assets.dart';
import 'package:wafir_mobile/core/resource/manager_colors.dart';
import 'package:wafir_mobile/core/resource/manager_sizes.dart';
import 'package:wafir_mobile/core/resource/manager_strings.dart';
import 'package:wafir_mobile/core/widgets/custom_button.dart';
import 'package:wafir_mobile/core/widgets/custom_spacing.dart';
import 'package:wafir_mobile/features/setting/presentation/models/setting_item_model.dart';
import 'package:wafir_mobile/features/setting/presentation/widgets/custom_setting_item.dart';
import 'package:wafir_mobile/routes/routes.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({super.key});

  final List<SettingItemModel> settingItems = <SettingItemModel>[
    SettingItemModel(
      title: ManagerStrings.changePassword,
      icon: ManagerAssets.lockIcon,
      route:
      Routes.changePasswordScreen,
    ),
    SettingItemModel(
      title: ManagerStrings.favorite,
      icon: ManagerAssets.favoriteIcon,
      route: Routes.favoriteScreen,
    ),
    SettingItemModel(
      title: ManagerStrings.contactUs,
      icon: ManagerAssets.contactUsIcon,
      route: Routes.contactUsScreen,
    ),
    SettingItemModel(
      title: ManagerStrings.info,
      icon: ManagerAssets.infoIcon,
      route: Routes.infoScreen,
    ),
    SettingItemModel(
      title: ManagerStrings.logout,
      icon: ManagerAssets.logoutIcon,
      route: Routes.logoutScreen,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(ManagerStrings.profile),
      ),
      body: ListView(
        padding: EdgeInsetsDirectional.only(
          top: ManagerHeights.h10,
          bottom: ManagerHeights.h10,
          start: ManagerWidths.w20,
          end: ManagerWidths.w20,
        ),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsetsDirectional.only(
                  bottom: ManagerHeights.h15,
                ),
                height: ManagerHeights.h120,
                width: ManagerWidths.w120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ManagerColors.blackColor,
                ),
                child: ClipOval(
                  child: Image.asset(
                    ManagerAssets.personImage,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Text(
                'عبدالرحمن محمد',
                style: Theme
                    .of(context)
                    .textTheme
                    .headlineLarge,
              ),
              verticalSpace(ManagerHeights.h5),
              Text(
                'abdulrahman_m@',
                style: Theme
                    .of(context)
                    .textTheme
                    .labelSmall,
              ),
              verticalSpace(ManagerHeights.h15),
              CustomButton(
                text: ManagerStrings.editProfile,
                onPressed: () {
                  Navigator.of(context).pushNamed(Routes.editProfileScreen);
                },
              ),
              verticalSpace(ManagerHeights.h20),
              ...List.generate(
                settingItems.length,
                    (i) =>
                    CustomSettingItem(
                      icon: settingItems[i].icon,
                      title: settingItems[i].title,
                      onTap: () {
                        Navigator.of(context).pushNamed(
                            settingItems[i].route);
                      }
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
