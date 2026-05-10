import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wafir_mobile/config/constants/app_constants.dart';
import 'package:wafir_mobile/config/constants/shared_preferences_keys.dart';
import 'package:wafir_mobile/config/dependency_injection.dart';
import 'package:wafir_mobile/core/resource/manager_colors.dart';
import 'package:wafir_mobile/core/resource/manager_fonts.dart';
import 'package:wafir_mobile/core/resource/manager_sizes.dart';
import 'package:wafir_mobile/core/resource/manager_strings.dart';
import 'package:wafir_mobile/core/storage/local/shared_preferences_controller.dart';
import 'package:wafir_mobile/core/widgets/custom_button.dart';
import 'package:wafir_mobile/core/widgets/custom_dialog.dart';
import 'package:wafir_mobile/core/widgets/custom_spacing.dart';
import 'package:wafir_mobile/features/offers/domain/model/offer_details_model.dart';
import 'package:wafir_mobile/features/offers/presentation/controller/offer_details_bloc.dart';
import 'package:wafir_mobile/features/offers/presentation/controller/offer_details_state.dart';
import 'package:wafir_mobile/features/offers/presentation/view/widgets/custom_info_card_widget.dart';
import 'package:wafir_mobile/features/offers/presentation/view/widgets/custom_restaurant_card_widget.dart';
import 'package:wafir_mobile/routes/routes.dart';

class OfferDetailsScreen extends StatelessWidget {
  const OfferDetailsScreen({
    super.key,
    required this.offerId,
  });

  final int offerId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: ManagerColors.transparentColor,
        leading: IconButton(
          onPressed: () {
            disposeOfferDetails();
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: ManagerColors.whiteColor,
            size: ManagerIconsSizes.i24,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              final state = context.read<OfferDetailsBloc>().state;
              if (state is OfferDetailsLoaded) {
                _shareOffer(state.offerDetails);
              }
            },
            icon: Icon(
              Icons.share_rounded,
              color: ManagerColors.whiteColor,
              size: ManagerIconsSizes.i24,
            ),
          ),
        ],
      ),
      body: BlocBuilder<OfferDetailsBloc, OfferDetailsState>(
        builder: (context, state) {
          if (state is OfferDetailsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is OfferDetailsLoaded) {
            return _OfferDetailsContent(offerDetails: state.offerDetails);
          }
          return Center(
            child: Text(
              state is OfferDetailsError ? state.message : 'حدث خطأ غير متوقع',
            ),
          );
        },
      ),
    );
  }

  void _shareOffer(OfferDetailsModel offerDetails) {
    final message = '''
🎉 عرض رائع: ${offerDetails.offer.title}

🏪 المتجر: ${offerDetails.offer.vendor.businessName}
📍 العنوان: ${_getMainBranchAddress(offerDetails.offer.branches)}
💰 الحد الأدنى للشراء: ${offerDetails.offer.minPurchaseAmount} ر.ع
📅 ينتهي في: ${_formatDate(offerDetails.offer.validUntil)}

✨ ${offerDetails.offer.description}

تحمل تطبيق وافر واستمتع بأفضل العروض والخصومات!
''';

    SharePlus.instance.share(
      ShareParams(text: message, subject: offerDetails.offer.title),
    );
  }

  String _formatDate(String value) {
    final parsed = DateTime.tryParse(value);
    if (parsed == null) return value;
    return DateFormat('yyyy-MM-dd').format(parsed);
  }

  String _getMainBranchAddress(List<BranchDetailModel> branches) {
    if (branches.isEmpty) return 'لا يوجد عنوان';

    final mainBranch = branches.firstWhere(
      (branch) => branch.isMain,
      orElse: () => branches.first,
    );

    final parts = <String>[
      if (mainBranch.wilaya.isNotEmpty) mainBranch.wilaya,
      if (mainBranch.address.isNotEmpty) mainBranch.address,
    ];

    return parts.isNotEmpty ? parts.join(' - ') : 'لا يوجد عنوان';
  }
}

class _OfferDetailsContent extends StatelessWidget {
  const _OfferDetailsContent({required this.offerDetails});

  final OfferDetailsModel offerDetails;

  @override
  Widget build(BuildContext context) {
    final remainingDays = AppConstants.getRemainingDays(
      offerDetails.offer.validFrom,
      offerDetails.offer.validUntil,
    );
    final isNotStarted = remainingDays.contains('يبدا');

    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _HeroSection(
                    offerImage: offerDetails.offer.imageUrl,
                    offerTitle: offerDetails.offer.title,
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
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                Routes.vendorDetailsScreen,
                                arguments: offerDetails.offer.vendor.id,
                              );
                            },

                            child: CustomRestaurantCardWidget(
                              restaurantImage: offerDetails.offer.vendor.logoUrl,
                              restaurantAddress: _getMainBranchAddress(
                                offerDetails.offer.branches,
                              ),
                              restaurantName:
                                  offerDetails.offer.vendor.businessName,
                            ),
                          ),
                          verticalSpace(ManagerHeights.h15),
                          CustomInfoCardWidget(
                            child: LayoutBuilder(
                              builder: (context, constraints) {
                                return Wrap(
                                  spacing: 12,
                                  runSpacing: 12,
                                  children: [
                                    _InfoBox(
                                      icon: Icons.label_important_outline,
                                      label: ManagerStrings.offerName,
                                      value: offerDetails.offer.title,
                                    ),
                                    _InfoBox(
                                      icon: Icons.calendar_today,
                                      label: ManagerStrings.offerStarted,
                                      value: _formatDate(offerDetails.offer.validFrom),
                                    ),
                                    _InfoBox(
                                      icon: Icons.event_busy_outlined,
                                      label: ManagerStrings.offerFinished,
                                      value: _formatDate(offerDetails.offer.validUntil),
                                    ),
                                    _InfoBox(
                                      icon: Icons.attach_money_outlined,
                                      label: ManagerStrings.minimumPurchase,
                                      value: '${offerDetails.offer.minPurchaseAmount} ر.ع',
                                    ),
                                    _InfoBox(
                                      icon: Icons.list_alt_outlined,
                                      label: 'عدد الحجوزات',
                                      value: '${offerDetails.offer.totalClaims} / ${offerDetails.offer.maxTotalClaims}',
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                          verticalSpace(ManagerHeights.h15),
                          CustomInfoCardWidget(
                            child: Html(
                              data: offerDetails.offer.description,
                              style: {
                                'h3': Style(
                                  fontSize: FontSize(ManagerFontsSizes.f22),
                                  color: ManagerColors.blackColor,
                                  fontWeight: ManagerFontWeight.bold,
                                ),
                                'body': Style(
                                  fontSize: FontSize(ManagerFontsSizes.f14),
                                  color: ManagerColors.greyColor,
                                  lineHeight: LineHeight.number(-0.5),
                                ),
                              },
                            ),

                          ),
                          verticalSpace(ManagerHeights.h15),
                          if (offerDetails.offer.branches.isNotEmpty)
                            CustomInfoCardWidget(
                              title: ManagerStrings.branches,
                              child: Column(
                                children: List.generate(
                                  offerDetails.offer.branches.length,
                                  (index) {
                                    final branch =
                                        offerDetails.offer.branches[index];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.only(
                                        bottom: index <
                                                offerDetails
                                                        .offer.branches.length -
                                                    1
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
            onPressed: isNotStarted
                ? null
                : () {
                    if (instance<SharedPreferencesController>()
                        .getString(SharedPreferencesKeys.token)
                        .isNotEmpty) {
                      // Handle claim offer
                    } else {
                      loginPop(context);
                    }
                  },
            height: ManagerHeights.h60,
            color: isNotStarted
                ? ManagerColors.greyColor.withValues(alpha: 0.5)
                : null,
            text: isNotStarted ? remainingDays : 'احجز الآن',
          ),
        ),
      ],
    );
  }


  Widget _buildBranchItem(
    BuildContext context,
    BranchDetailModel branch,
  ) {
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
                    color: ManagerColors.primaryColor.withValues(alpha: 0.15),
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
          if (branch.wilaya.isNotEmpty)
            _buildBranchInfoRow(
              Icons.location_on_outlined,
              branch.wilaya,
            ),
          if (branch.address.isNotEmpty)
            _buildBranchInfoRow(
              Icons.home_outlined,
              branch.address,
            ),
          if (branch.phoneNumber.isNotEmpty)
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
                branch.phoneNumber,
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

  String _formatDate(String value) {
    final parsed = DateTime.tryParse(value);
    if (parsed == null) return value;
    return DateFormat('yyyy-MM-dd').format(parsed);
  }

  String _getMainBranchAddress(List<BranchDetailModel> branches) {
    if (branches.isEmpty) return 'لا يوجد عنوان';

    final mainBranch = branches.firstWhere(
      (branch) => branch.isMain,
      orElse: () => branches.first,
    );

    final parts = <String>[
      if (mainBranch.wilaya.isNotEmpty) mainBranch.wilaya,
      if (mainBranch.address.isNotEmpty) mainBranch.address,
    ];

    return parts.isNotEmpty ? parts.join(' - ') : 'لا يوجد عنوان';
  }
}

class _InfoBox extends StatelessWidget {
  const _InfoBox({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {

    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: 140,
          maxWidth: double.infinity),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color(0xFFE6ECEE)),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: ManagerColors.primaryColor.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                size: 20,
                color: ManagerColors.primaryColor,
              ),
            ),
            SizedBox(width: ManagerWidths.w10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: ManagerFontsSizes.f12,
                      color: ManagerColors.greyColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: ManagerHeights.h5),
                  Text(
                    value,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: ManagerFontsSizes.f14,
                      color: ManagerColors.blackColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
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
                    Colors.black.withValues(alpha: 0.12),
                    Colors.black.withValues(alpha: 0.60),
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

