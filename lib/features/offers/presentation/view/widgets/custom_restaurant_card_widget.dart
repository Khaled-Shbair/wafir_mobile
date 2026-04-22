import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wafir_mobile/core/resource/manager_colors.dart';
import 'package:wafir_mobile/core/resource/manager_fonts.dart';
import 'package:wafir_mobile/core/resource/manager_sizes.dart';
import 'package:wafir_mobile/core/widgets/custom_spacing.dart';

class CustomRestaurantCardWidget extends StatelessWidget {
  const CustomRestaurantCardWidget({
    required this.restaurantAddress,
    required this.restaurantName,
    required this.restaurantImage,
    super.key,
  });

  final String restaurantAddress;
  final String restaurantImage;
  final String restaurantName;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.symmetric(
        horizontal: ManagerWidths.w12,
        vertical: ManagerHeights.h12,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(ManagerRadius.r22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: ManagerWidths.w50,
            height: ManagerHeights.h50,
            decoration: BoxDecoration(
              color: ManagerColors.greyColor,
              borderRadius: BorderRadius.circular(ManagerRadius.r15),
              image: DecorationImage(
                image: CachedNetworkImageProvider(restaurantImage),
                fit: BoxFit.fill,
              ),
            ),
          ),
          horizontalSpace(ManagerWidths.w12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  restaurantName,
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        fontSize: ManagerFontsSizes.f16,
                        fontWeight: ManagerFontWeight.extraBold,
                      ),
                ),
                verticalSpace(ManagerHeights.h5),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: ManagerIconsSizes.i14,
                      color: ManagerColors.greyColor,
                    ),
                    horizontalSpace(ManagerWidths.w3),
                    Expanded(
                      child: Text(
                        restaurantAddress,
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              fontSize: ManagerFontsSizes.f12,
                              color: ManagerColors.greyColor,
                            ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
