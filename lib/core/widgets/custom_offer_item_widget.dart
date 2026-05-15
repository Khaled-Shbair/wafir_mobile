import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafir_mobile/config/constants/app_constants.dart';
import 'package:wafir_mobile/config/dependency_injection.dart';
import 'package:wafir_mobile/core/model/offers_model.dart';
import 'package:wafir_mobile/core/resource/manager_colors.dart';
import 'package:wafir_mobile/core/resource/manager_fonts.dart';
import 'package:wafir_mobile/core/resource/manager_sizes.dart';
import 'package:wafir_mobile/core/resource/manager_strings.dart';
import 'package:wafir_mobile/core/widgets/custom_button.dart';
import 'package:wafir_mobile/core/widgets/custom_discount_and_favorite_row_widget.dart';
import 'package:wafir_mobile/core/widgets/custom_offer_time_and_location_widget.dart';
import 'package:wafir_mobile/core/widgets/custom_spacing.dart';
import 'package:wafir_mobile/features/favorite/presentation/controller/favorite_bloc.dart';
import 'package:wafir_mobile/routes/routes.dart';

class CustomOfferItemWidget extends StatelessWidget {
  const CustomOfferItemWidget({
    super.key,
    required this.item,
    this.buttonText,
    this.onPressed,
  });

  final OfferItemModel item;
  final String? buttonText;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    initFavorite();
    return BlocProvider<FavoriteBloc>.value(
      value: instance<FavoriteBloc>(),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(ManagerRadius.r20),
          boxShadow: const [
            BoxShadow(
              color: Color(0x14000000),
              blurRadius: 10,
              offset: Offset(0, 3),
            ),
          ],
          border: Border.all(color: const Color(0xFFE1E9EB)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(ManagerRadius.r20),
                ),
                child: Stack(
                  alignment: AlignmentDirectional.topCenter,
                  children: [
                    CachedNetworkImage(
                      imageUrl: item.imageUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                      placeholder: (context, url) => Container(
                        color: Colors.grey[300],
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                      errorWidget: (context, url, error) => Container(
                        color: Colors.grey[300],
                        child: Center(
                          child: Icon(
                            Icons.error,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ),
                    CustomDiscountAndFavoriteRowWidget(
                      offerId: item.offerId,
                      discountPercentage: item.discountPercentage.toString(),
                      isFavorite: item.isFavorite,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsetsDirectional.only(
                  top: ManagerHeights.h7,
                  bottom: ManagerHeights.h7,
                  start: ManagerWidths.w5,
                  end: ManagerWidths.w5,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: ManagerWidths.w30,
                          height: ManagerHeights.h30,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(ManagerRadius.r10),
                            image: DecorationImage(
                              image: item.imageUrl.isNotEmpty
                                  ? CachedNetworkImageProvider(item.logoUrl)
                                  : const AssetImage(
                                      'assets/images/logo_food.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        horizontalSpace(ManagerWidths.w5),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              verticalSpace(ManagerHeights.h3),
                              Text(
                                item.businessName,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(
                                      fontSize: ManagerFontsSizes.f10,
                                      color: const Color(0xFF7E9197),
                                      fontWeight: ManagerFontWeight.medium,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    verticalSpace(ManagerHeights.h8),
                    Row(
                      children: [
                        CustomOfferTimeAndLocationWidget(
                          backgroundColor: ManagerColors.buttonColor,
                          textColor: ManagerColors.whiteColor,
                          text: AppConstants.getRemainingDays(
                            item.validFrom,
                            item.validUntil,
                          ),
                          icon: Icons.access_time,
                        ),
                        horizontalSpace(ManagerWidths.w3),
                        CustomOfferTimeAndLocationWidget(
                          backgroundColor: ManagerColors.buttonColor,
                          textColor: ManagerColors.whiteColor,
                          text: item.governorate,
                          icon: Icons.location_on_outlined,
                        ),
                      ],
                    ),
                    verticalSpace(ManagerHeights.h5),
                    CustomButton(
                      height: ManagerHeights.h30,
                      fontSize: ManagerFontsSizes.f12,
                      color: ManagerColors.buttonColor,
                      onPressed: onPressed ?? () {
                        Navigator.of(context).pushNamed(
                          Routes.offerDetailsScreen,
                          arguments: item.offerId,
                        );
                      },
                      text: buttonText ?? ManagerStrings.details,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
