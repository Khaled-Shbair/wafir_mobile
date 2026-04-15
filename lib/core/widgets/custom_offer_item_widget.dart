import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wafir_mobile/config/constants/app_constants.dart';
import 'package:wafir_mobile/core/resource/manager_colors.dart';
import 'package:wafir_mobile/core/resource/manager_fonts.dart';
import 'package:wafir_mobile/core/resource/manager_sizes.dart';
import 'package:wafir_mobile/core/resource/manager_strings.dart';
import 'package:wafir_mobile/core/widgets/custom_button.dart';
import 'package:wafir_mobile/core/widgets/custom_discount_and_favorite_row_widget.dart';
import 'package:wafir_mobile/core/widgets/custom_offer_time_and_location_widget.dart';
import 'package:wafir_mobile/core/widgets/custom_spacing.dart';
import 'package:wafir_mobile/features/favorite/domain/model/favorite_offers_model.dart';
import 'package:wafir_mobile/routes/routes.dart';

class CustomOfferItemWidget extends StatelessWidget {
  const CustomOfferItemWidget({
    super.key,
    required this.item,
    required this.addOrRemoveFavoriteOfferFunction,
  });

  final FavoriteOfferItemModel item;
  final Function() addOrRemoveFavoriteOfferFunction;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(ManagerRadius.r20),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
        border: Border.all(color: const Color(0xFFE1E9EB)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Flexible(
            flex: 5,
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(ManagerRadius.r20),
              ),
              child: Stack(
                fit: StackFit.expand,
                alignment: AlignmentDirectional.topCenter,
                children: [
                  CachedNetworkImage(
                    imageUrl: item.imageUrl,
                    fit: BoxFit.fill,
                    width: double.infinity,
                    height: ManagerHeights.h120,
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
                    addOrRemoveFavoriteOfferFunction:
                        addOrRemoveFavoriteOfferFunction,
                    discountPercentage: item.discountPercentage.toString(),
                    isFavorite: item.status == 'active',
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
              top: ManagerHeights.h10,
              bottom: ManagerHeights.h10,
              start: ManagerWidths.w5,
              end: ManagerWidths.w5,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
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
                              : AssetImage('assets/images/logo_food.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    horizontalSpace(ManagerWidths.w5),
                    Column(
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
                          item.description,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(
                            fontSize: ManagerFontsSizes.f10,
                            color: Color(0xFF7E9197),
                            fontWeight: ManagerFontWeight.medium,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                verticalSpace(ManagerHeights.h10),
                Row(
                  children: [
                    CustomOfferTimeAndLocationWidget(
                      backgroundColor:
                      ManagerColors.secondaryColor.withOpacity(0.2),
                      textColor: ManagerColors.secondaryColor,
                      text: AppConstants.getRemainingDays(item.validUntil),
                      icon: Icons.access_time,
                    ),
                    Spacer(),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                    start: ManagerWidths.w5,
                    end: ManagerWidths.w5,
                    top: ManagerHeights.h10,
                  ),
                  child: CustomButton(
                    height: ManagerHeights.h35,
                    fontSize: ManagerFontsSizes.f14,
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        Routes.offerDetailsScreen,
                        arguments: item.offerId,
                      );
                    },
                    text: ManagerStrings.details,
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
