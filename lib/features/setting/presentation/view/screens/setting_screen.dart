import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
import 'package:wafir_mobile/core/widgets/custom_loading.dart';
import 'package:wafir_mobile/core/widgets/custom_spacing.dart';
import 'package:wafir_mobile/core/widgets/custom_toast_massage.dart';
import 'package:wafir_mobile/core/widgets/custom_web_view_bottom_sheet.dart';
import 'package:wafir_mobile/features/setting/presentation/controller/logout_setting_bloc.dart';
import 'package:wafir_mobile/routes/routes.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingScreen extends StatelessWidget with CustomToastMassage {
  SettingScreen({super.key});

  final ValueNotifier<String> userNameNotifier = ValueNotifier<String>(
    instance<SharedPreferencesController>()
        .getString(SharedPreferencesKeys.name),
  );

  final ValueNotifier<String> userImageNotifier = ValueNotifier<String>(
    instance<SharedPreferencesController>()
        .getString(SharedPreferencesKeys.image),
  );

  @override
  Widget build(BuildContext context) {
    initLogoutSetting();

    final email = instance<SharedPreferencesController>()
        .getString(SharedPreferencesKeys.email);

    final displayEmail = email.contains('@')
        ? email.substring(0, email.indexOf('@') + 1)
        : 'user@';
    return BlocListener<LogoutSettingBloc, LogoutSettingState>(
      listener: (context, state) {
        if (state is LogoutSettingLoading) {
          showCustomLoading(context);
        } else if (state is LogoutSettingSuccess) {
          disposeHome();
          disposeLogoutSetting();
          disposeOffers();
          disposeVendors();
          disposeOfferDetails();
          disposeClaims();
          Navigator.of(context, rootNavigator: true).pushNamedAndRemoveUntil(
            Routes.loginScreen,
            (route) => false,
          );
        } else if (state is LogoutSettingFailure) {
          Navigator.of(context, rootNavigator: true).pop();
          showToast(state.message);
        }
      },
      child: Scaffold(
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
            ValueListenableBuilder<String>(
              valueListenable: userImageNotifier,
              builder: (context, userImage, _) {
                print('User image URL: $userImage'); // Debug print
                print(
                    'User image URL: ${instance<SharedPreferencesController>().getString(SharedPreferencesKeys.image)}'); // Debug print
                final imageUrl = userImage.trim();
                return Container(
                  height: ManagerHeights.h140,
                  width: ManagerWidths.w140,
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
                    child: imageUrl.isEmpty
                        ? Image.asset(
                            ManagerAssets.personImage,
                            fit: BoxFit.fill,
                          )
                        : CachedNetworkImage(
                            imageUrl: imageUrl,
                            fit: BoxFit.fill,
                            errorWidget: (context, url, error) => Image.asset(
                              ManagerAssets.personImage,
                              fit: BoxFit.fill,
                            ),
                          ),
                  ),
                );
              },
            ),
            ValueListenableBuilder<String>(
              valueListenable: userNameNotifier,
              builder: (context, userName, _) {
                return Center(
                  child: Text(
                    userName,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                );
              },
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
              onPressed: () async {
                await Navigator.of(context).pushNamed(
                  Routes.editProfileScreen,
                );
                _refreshUserData();
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
                  icon: Icons.lock_outline,
                  title: ManagerStrings.changePassword,
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(Routes.changePasswordScreen);
                  },
                ),
              ],
            ),  verticalSpace(ManagerHeights.h10),  _buildSectionContainer(
              children: [
                _buildSettingItem(
                  context: context,
                  icon: Icons.favorite_border,
                  title: ManagerStrings.favorite,
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(Routes.favoriteScreen);
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
                  icon: Icons.call,
                  title: 'التواصل واتساب',
                  onTap: () async {
                    final Uri url = Uri.parse(
                        "https://wa.me/96871189661?text=مرحبا، أريد الاستفسار عن تطبيق وافر");
                    if (!await launchUrl(url,
                        mode: LaunchMode.externalApplication)) {
                      showToast('سيتم إضافتها قريباً');
                    }
                  },
                ),
                _buildDivider(),
                _buildSettingItem(
                  context: context,
                  icon: Icons.question_answer_outlined,
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
                  icon: Icons.privacy_tip_outlined,
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
                  icon: Icons.info_outline,
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
                  icon: Icons.logout,
                  title: ManagerStrings.logout,
                  onTap: () {
                    showConfirmationDialog(
                      context,
                      confirmButtonOnPressed: () async {
                        context.read<LogoutSettingBloc>().add(LogoutProcess());
                      },
                    );
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _refreshUserData() {
    userNameNotifier.value = instance<SharedPreferencesController>()
        .getString(SharedPreferencesKeys.name);
    userImageNotifier.value = instance<SharedPreferencesController>()
        .getString(SharedPreferencesKeys.image);
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
            color: Colors.black.withValues(alpha: 0.05),
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
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Padding(
        padding: EdgeInsetsDirectional.symmetric(
          horizontal: ManagerWidths.w12,
          vertical: ManagerHeights.h12,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: ManagerIconsSizes.i24,
              color: ManagerColors.greyColor,
            ),
            horizontalSpace(ManagerWidths.w10),
            Expanded(
              child: Text(
                title,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: ManagerColors.greyColor,
              size: ManagerIconsSizes.i18,
            ),
          ],
        ),
      ),
    );
  }
}
