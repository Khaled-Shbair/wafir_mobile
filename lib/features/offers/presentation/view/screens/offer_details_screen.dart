import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';
import 'package:wafir_mobile/config/constants/app_constants.dart';
import 'package:wafir_mobile/config/constants/shared_preferences_keys.dart';
import 'package:wafir_mobile/config/dependency_injection.dart';
import 'package:wafir_mobile/core/model/offers_model.dart';
import 'package:wafir_mobile/core/resource/manager_colors.dart';
import 'package:wafir_mobile/core/resource/manager_fonts.dart';
import 'package:wafir_mobile/core/resource/manager_sizes.dart';
import 'package:wafir_mobile/core/resource/manager_strings.dart';
import 'package:wafir_mobile/core/storage/local/shared_preferences_controller.dart';
import 'package:wafir_mobile/core/widgets/custom_button.dart';
import 'package:wafir_mobile/core/widgets/custom_dialog.dart';
import 'package:wafir_mobile/core/widgets/custom_spacing.dart';
import 'package:wafir_mobile/features/offers/domain/model/offer_vendor_branch_model.dart';
import 'package:wafir_mobile/features/offers/presentation/view/widgets/custom_info_card_widget.dart';
import 'package:wafir_mobile/features/offers/presentation/view/widgets/custom_restaurant_card_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class OfferDetailsScreen extends StatelessWidget {
  const OfferDetailsScreen({
    super.key,
    required this.offer,
  });

  final OfferItemModel offer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: ManagerColors.transparentColor,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: ManagerColors.whiteColor,
            size: ManagerIconsSizes.i24,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => _shareOffer(),
            icon: Icon(
              Icons.share_rounded,
              color: ManagerColors.whiteColor,
              size: ManagerIconsSizes.i24,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _HeroSection(
                      offerImage: offer.imageUrl,
                      offerTitle: offer.title,
                    ),
                    Transform.translate(
                      offset: const Offset(0, -28),
                      child: Padding(
                        padding: EdgeInsetsDirectional.only(
                          start: ManagerWidths.w16,
                          end: ManagerWidths.w16,
                          top: ManagerHeights.h15,
                          bottom: ManagerHeights.h55,
                        ),
                        child: Column(
                          children: [
                            CustomRestaurantCardWidget(
                              restaurantImage: offer.logoUrl,
                              restaurantAddress:
                                  _getMainBranchAddress(offer.branches),
                              restaurantName: offer.businessName,
                            ),
                            verticalSpace(ManagerHeights.h15),
                            CustomInfoCardWidget(
                              title: ManagerStrings.offerDetails,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  customInfoRow(
                                    ManagerStrings.offerName,
                                    offer.title,
                                  ),
                                  customInfoRow(
                                    ManagerStrings.offerStarted,
                                    DateFormat('yyyy-MM-dd').format(
                                      DateTime.parse(offer.validFrom),
                                    ),
                                  ),
                                  customInfoRow(
                                    ManagerStrings.offerFinished,
                                    DateFormat('yyyy-MM-dd').format(
                                      DateTime.parse(offer.validUntil),
                                    ),
                                  ),
                                  customInfoRow(
                                    ManagerStrings.minimumPurchase,
                                    offer.minimumPurchase,
                                  ),
                                ],
                              ),
                            ),
                            verticalSpace(ManagerHeights.h15),
                            CustomInfoCardWidget(
                              title: ManagerStrings.description,
                              child: Text(
                                offer.description,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontSize: ManagerFontsSizes.f14,
                                      height: 1.9,
                                      color: ManagerColors.greyColor,
                                    ),
                              ),
                            ),
                            verticalSpace(ManagerHeights.h15),
                            if (offer.branches.isNotEmpty)
                              CustomInfoCardWidget(
                                title: ManagerStrings.branches,
                                child: Column(
                                  children: List.generate(
                                    offer.branches.length,
                                    (index) {
                                      final branch = offer.branches[index];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.only(
                                          bottom:
                                              index < offer.branches.length - 1
                                                  ? ManagerHeights.h10
                                                  : 0,
                                        ),
                                        child: _buildBranchItem(
                                          context,
                                          branch,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            right: ManagerWidths.w16,
            left: ManagerWidths.w16,
            bottom: ManagerHeights.h15,
            child: CustomButton(
              onPressed: AppConstants.getRemainingDays(
                          offer.validFrom, offer.validUntil)
                      .contains('يبدا')
                  ? null
                  : () {
                      if (instance<SharedPreferencesController>()
                          .getString(SharedPreferencesKeys.token)
                          .isNotEmpty) {
                        // context.read<FavoriteBloc>().add();
                      } else {
                        loginPop(context);
                      }
                    },
              height: ManagerHeights.h60,
              color: AppConstants.getRemainingDays(
                          offer.validFrom, offer.validUntil)
                      .contains('يبدا')
                  ? ManagerColors.greyColor.withOpacity(0.5)
                  : null,
              text: AppConstants.getRemainingDays(
                          offer.validFrom, offer.validUntil)
                      .contains('يبدا')
                  ? AppConstants.getRemainingDays(
                      offer.validFrom, offer.validUntil)
                  : 'احجز الآن',
            ),
          ),
        ],
      ),
    );
  }

  Widget customInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: ManagerHeights.h10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Text(
              label,
              style: TextStyle(
                fontSize: ManagerFontsSizes.f14,
                fontWeight: FontWeight.w600,
                color: ManagerColors.greyColor,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: TextStyle(
                fontSize: ManagerFontsSizes.f14,
                fontWeight: FontWeight.w500,
                color: ManagerColors.blackColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBranchItem(BuildContext context, OfferVendorBranchModel branch) {
    return Container(
      padding: EdgeInsets.all(ManagerWidths.w10),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFE1E9EB)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  'فرع',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (branch.isMain)
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: ManagerWidths.w5,
                    vertical: ManagerHeights.h3,
                  ),
                  decoration: BoxDecoration(
                    color: ManagerColors.primaryColor.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    'الفرع الرئيسي',
                    style: TextStyle(
                      fontSize: ManagerFontsSizes.f10,
                      fontWeight: FontWeight.w600,
                      color: ManagerColors.primaryColor,
                    ),
                  ),
                ),
            ],
          ),
          verticalSpace(ManagerHeights.h8),
          if (branch.wilaya != null)
            _buildBranchInfoRow(
              Icons.location_on_outlined,
              branch.wilaya ?? '',
            ),
          if (branch.address != null)
            _buildBranchInfoRow(
              Icons.home_outlined,
              branch.address ?? '',
            ),
          if (branch.phoneNumber != null)
            GestureDetector(
              onTap: () async {
                final Uri url = Uri(
                  scheme: 'tel',
                  path: branch.phoneNumber,
                );
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                }
              },
              child: _buildBranchInfoRow(
                Icons.phone_outlined,
                branch.phoneNumber ?? '',
                isClickable: true,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildBranchInfoRow(
    IconData icon,
    String text, {
    bool isClickable = false,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: ManagerHeights.h5),
      child: Row(
        children: [
          Icon(
            icon,
            size: ManagerIconsSizes.i14,
            color: ManagerColors.greyColor,
          ),
          horizontalSpace(ManagerWidths.w10),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: ManagerFontsSizes.f12,
                color: isClickable
                    ? ManagerColors.primaryColor
                    : ManagerColors.greyColor,
                decoration: isClickable ? TextDecoration.underline : null,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  /// البحث عن الفرع الرئيسي واستخراج العنوان
  String _getMainBranchAddress(List<OfferVendorBranchModel> branches) {
    if (branches.isEmpty) return 'لا يوجد عنوان';

    final mainBranch = branches.firstWhere(
      (branch) => branch.isMain,
      orElse: () => branches.first,
    );

    // دمج العنوان من الولاية والعنوان
    final parts = <String>[
      if (mainBranch.wilaya != null && mainBranch.wilaya!.isNotEmpty)
        mainBranch.wilaya!,
      if (mainBranch.address != null && mainBranch.address!.isNotEmpty)
        mainBranch.address!,
    ];

    return parts.isNotEmpty ? parts.join(' - ') : 'لا يوجد عنوان';
  }

  /// مشاركة تفاصيل العرض
  void _shareOffer() {
    final message = '''
🎉 عرض رائع: ${offer.title}

🏪 المتجر: ${offer.businessName}
📍 العنوان: ${_getMainBranchAddress(offer.branches)}
💰 الحد الأدنى للشراء: ${offer.minimumPurchase}
📅 ينتهي في: ${DateFormat('yyyy-MM-dd').format(DateTime.parse(offer.validUntil))}


✨ ${offer.description}

تحمل تطبيق وافر واستمتع بأفضل العروض والخصومات!
''';

    Share.share(
      message,
      subject: offer.title,
    );
  }
}

class _HeroSection extends StatelessWidget {
  const _HeroSection({required this.offerImage, required this.offerTitle});

  final String offerImage;
  final String offerTitle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ManagerHeights.h300,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              offerImage,
              fit: BoxFit.fill,
            ),
          ),
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.12),
                    Colors.black.withOpacity(0.60),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: ManagerHeights.h24,
            right: ManagerWidths.w16,
            left: ManagerWidths.w16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  offerTitle,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    height: 1.25,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OfferModel {
  final String offerTitle;
  final String imageUrl;
  final String restaurantName;
  final String restaurantAddress;
  final String startDate;
  final String endDate;
  final String minPurchase;
  final String description;
  final List<String> activityInfo;
  final String locationNote;
  final List<String> includedOffers;
  final List<String> terms;
  final String originalPrice;
  final String discountPrice;
  final String discountPercent;

  OfferModel({
    required this.offerTitle,
    required this.imageUrl,
    required this.restaurantName,
    required this.restaurantAddress,
    required this.startDate,
    required this.endDate,
    required this.minPurchase,
    required this.description,
    required this.activityInfo,
    required this.locationNote,
    required this.includedOffers,
    required this.terms,
    required this.originalPrice,
    required this.discountPrice,
    required this.discountPercent,
  });
}
