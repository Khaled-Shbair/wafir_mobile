import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wafir_mobile/config/constants/app_constants.dart';
import 'package:wafir_mobile/config/constants/shared_preferences_keys.dart';
import 'package:wafir_mobile/config/dependency_injection.dart';
import 'package:wafir_mobile/core/resource/manager_assets.dart';
import 'package:wafir_mobile/core/resource/manager_colors.dart';
import 'package:wafir_mobile/core/resource/manager_sizes.dart';
import 'package:wafir_mobile/core/resource/manager_strings.dart';
import 'package:wafir_mobile/core/storage/local/shared_preferences_controller.dart';
import 'package:wafir_mobile/core/widgets/custom_button.dart';
import 'package:wafir_mobile/core/widgets/custom_dialog.dart';
import 'package:wafir_mobile/core/widgets/custom_spacing.dart';
import 'package:wafir_mobile/core/widgets/custom_toast_massage.dart';
import 'package:wafir_mobile/core/widgets/custom_web_view_bottom_sheet.dart';
import 'package:wafir_mobile/routes/routes.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SettingScreen extends StatelessWidget with CustomToastMassage {
  SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final email = instance<SharedPreferencesController>()
        .getString(SharedPreferencesKeys.email);

    final displayEmail = email.contains('@')
        ? email.substring(0, email.indexOf('@') + 1)
        : 'user@';
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(ManagerStrings.settings),
      ),
      body: ListView(
        padding: EdgeInsetsDirectional.only(
          top: ManagerHeights.h5,
          bottom: ManagerHeights.h20,
          start: ManagerWidths.w20,
          end: ManagerWidths.w20,
        ),
        children: [
          Container(
            margin: EdgeInsetsDirectional.only(
              bottom: ManagerHeights.h20,
              start: ManagerWidths.w100,
              end: ManagerWidths.w100,
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ManagerColors.blackColor,
            ),
            child: ClipOval(
              child: CachedNetworkImage(
                imageUrl: instance<SharedPreferencesController>()
                    .getString(SharedPreferencesKeys.image),
                fit: BoxFit.fill,
                errorWidget: (context, url, error) => Image.asset(
                  ManagerAssets.personImage,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Center(
            child: Text(
              instance<SharedPreferencesController>()
                  .getString(SharedPreferencesKeys.name),
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          verticalSpace(ManagerHeights.h5),
          Center(
            child: Text(
              displayEmail,
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
          verticalSpace(ManagerHeights.h15),
          CustomButton(
            text: ManagerStrings.editProfile,
            onPressed: () {
              Navigator.of(context).pushNamed(
                Routes.editProfileScreen,
              );
            },
          ),
          verticalSpace(ManagerHeights.h25),
          _buildSectionTitle(
            context: context,
            title: 'الإعدادات',
          ),
          verticalSpace(ManagerHeights.h10),
          _buildSectionContainer(
            children: [
              _buildSettingItem(
                context: context,
                icon: ManagerAssets.lockIcon,
                title: ManagerStrings.changePassword,
                onTap: () {
                  Navigator.of(context).pushNamed(Routes.resetPasswordScreen,
                      arguments: instance<SharedPreferencesController>()
                          .getString(SharedPreferencesKeys.token));
                },
              ),
            ],
          ),
          verticalSpace(ManagerHeights.h20),
          _buildSectionTitle(
            context: context,
            title: 'مركز المساعدة',
          ),
          verticalSpace(ManagerHeights.h10),
          _buildSectionContainer(
            children: [
              _buildSettingItem(
                context: context,
                icon: ManagerAssets.contactUsIcon,
                title: 'التواصل واتساب',
                onTap: () async {
                  final Uri url = Uri.parse(
                      "https://wa.me/970598297458?text=مرحبا، أريد الاستفسار عن تطبيق وافر");
                  if (!await launchUrl(url,
                      mode: LaunchMode.externalApplication)) {
                    showToast('سيتم إضافتها قريباً');
                  }
                },
              ),
              _buildDivider(),
              _buildSettingItem(
                context: context,
                icon: ManagerAssets.infoIcon,
                title: ManagerStrings.frequentlyAskedQuestions,
                onTap: () {
                  customWebViewBottomSheet(
                    context,
                    ManagerStrings.frequentlyAskedQuestions,
                    AppConstants.faq,
                  );
                },
              ),
              _buildDivider(),
              _buildSettingItem(
                context: context,
                icon: ManagerAssets.infoIcon,
                title: ManagerStrings.privacyPolicy,
                onTap: () async {
                  customWebViewBottomSheet(
                    context,
                    ManagerStrings.privacyPolicy,
                    AppConstants.privacyPolicy,
                  );
                },
              ),
              _buildDivider(),
              _buildSettingItem(
                context: context,
                icon: ManagerAssets.infoIcon,
                title: ManagerStrings.termsOfUse,
                onTap: () async {
                  customWebViewBottomSheet(
                    context,
                    ManagerStrings.termsOfUse,
                    AppConstants.termsOfUse,
                  );
                },
              ),
            ],
          ),
          verticalSpace(ManagerHeights.h20),
          _buildSectionContainer(
            children: [
              _buildSettingItem(
                context: context,
                icon: ManagerAssets.logoutIcon,
                title: ManagerStrings.logout,
                isLogout: true,
                onTap: () {
                  showConfirmationDialog(
                    context,
                    confirmButtonOnPressed: () {
                      showConfirmationDialog(
                        context,
                        confirmButtonOnPressed: () {
                          disposeHome();
                          disposeOffers();
                          disposeProfile();
                          disposeEditProfile();
                          disposeFavorite();
                          instance<SharedPreferencesController>()
                              .removeData(SharedPreferencesKeys.token);
                          instance<SharedPreferencesController>()
                              .removeData(SharedPreferencesKeys.email);
                          instance<SharedPreferencesController>()
                              .removeData(SharedPreferencesKeys.name);
                          instance<SharedPreferencesController>()
                              .removeData(SharedPreferencesKeys.image);
                          Navigator.of(context, rootNavigator: true)
                              .pushNamedAndRemoveUntil(
                            Routes.loginScreen,
                            (route) => false,
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle({
    required BuildContext context,
    required String title,
  }) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        start: ManagerWidths.w10,
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
            ),
      ),
    );
  }

  Widget _buildSectionContainer({
    required List<Widget> children,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: ManagerColors.whiteColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: children,
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      height: 1,
      thickness: 1,
      color: Colors.grey.shade200,
    );
  }

  Widget _buildSettingItem({
    required BuildContext context,
    required String icon,
    required String title,
    required VoidCallback onTap,
    bool isLogout = false,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Padding(
        padding: EdgeInsetsDirectional.symmetric(
          horizontal: ManagerWidths.w10,
          vertical: ManagerHeights.h10,
        ),
        child: Row(
          children: [
            Container(
              width: ManagerWidths.w40,
              height: ManagerHeights.h40,
              decoration: BoxDecoration(
                color: isLogout
                    ? Colors.red.withOpacity(0.08)
                    : ManagerColors.primaryColor.withOpacity(0.08),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Image.asset(
                  icon,
                  width: ManagerWidths.w20,
                  height: ManagerHeights.h20,
                ),
              ),
            ),
            horizontalSpace(ManagerWidths.w10),
            Expanded(
              child: Text(
                title,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: isLogout ? Colors.red : Colors.black,
                    ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: isLogout ? Colors.red : ManagerColors.greyColor,
              size: ManagerIconsSizes.i18,
            ),
          ],
        ),
      ),
    );
  }
}
