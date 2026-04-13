import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wafir_mobile/core/resource/manager_colors.dart';
import 'package:wafir_mobile/core/resource/manager_fonts.dart';
import 'package:wafir_mobile/core/resource/manager_sizes.dart';
import 'package:wafir_mobile/core/widgets/custom_button.dart';
import 'package:wafir_mobile/core/widgets/custom_spacing.dart';
import 'package:wafir_mobile/features/home/domain/model/home_models.dart';
import 'package:wafir_mobile/features/home/presentation/view/widgets/custom_offer_time_and_location_widget.dart';
import 'package:wafir_mobile/routes/routes.dart';

class CustomOfferCard extends StatelessWidget {
  const CustomOfferCard({
    super.key,
    required this.offer,
  });

  final HomeOfferModel offer;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ManagerWidths.w250,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(ManagerRadius.r20),
        border: Border.all(color: const Color(0xFFE2E8EA)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: ClipRRect(
            borderRadius:
                BorderRadius.vertical(top: Radius.circular(ManagerRadius.r20)),
            child: Stack(
              children: [
                CachedNetworkImage(
                  imageUrl: offer.imageUrl,
                  width: double.infinity,
                  height: ManagerHeights.h140,
                  fit: BoxFit.contain,
                ),
                Positioned(
                  top: ManagerHeights.h10,
                  right: ManagerWidths.w10,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: ManagerWidths.w5,
                      vertical: ManagerHeights.h5,
                    ),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: ManagerColors.failureColor,
                      borderRadius: BorderRadius.circular(ManagerRadius.r45),
                    ),
                    child: Text(
                      'خصم ${offer.discountPercentage}%',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 11,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
          Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsetsDirectional.only(
                  top: ManagerHeights.h10,
                  bottom: ManagerHeights.h10,
                  start: ManagerWidths.w10,
                  end: ManagerWidths.w10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CircleAvatar(
                          radius: ManagerRadius.r22,
                          
                          backgroundImage:
                              CachedNetworkImageProvider(offer.imageUrl),
                        ),
                        horizontalSpace(ManagerWidths.w5),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              offer.title,
                              textAlign: TextAlign.right,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Text(
                              offer.store.businessName,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall
                                  ?.copyWith(
                                    color: ManagerColors.greyColor,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    verticalSpace(ManagerHeights.h15),
                    Text(
                      'عروض مختارة من قطاع ${offer.store.sectorName}',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: ManagerColors.blackColor,
                          fontSize: ManagerFontsSizes.f12),
                    ),
                    verticalSpace(ManagerHeights.h10),
                    Row(
                      children: [
                        CustomOfferTimeAndLocationWidget(
                          backgroundColor:
                              ManagerColors.secondaryColor.withOpacity(0.2),
                          textColor: ManagerColors.secondaryColor,
                          text: DateFormat('d MMMM yyyy', 'ar')
                              .format(DateTime.parse(offer.validUntil)),
                          icon: Icons.access_time,
                        ),
                        horizontalSpace(ManagerWidths.w5),
                        CustomOfferTimeAndLocationWidget(
                          backgroundColor:
                              ManagerColors.secondaryColor.withOpacity(0.2),
                          textColor: ManagerColors.secondaryColor,
                          text: offer.store.city,
                          icon: Icons.location_on_outlined,
                        ),
                      ],
                    ),
                    Spacer(),
                    CustomButton(
                      height: ManagerHeights.h40,
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                            Routes.storeProfileScreen,
                            arguments: offer.id);
                      },
                      text: 'التفاصيل',
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
