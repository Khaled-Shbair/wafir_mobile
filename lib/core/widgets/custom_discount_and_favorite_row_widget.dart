import 'package:flutter/material.dart';
import 'package:wafir_mobile/core/resource/manager_colors.dart';
import 'package:wafir_mobile/core/resource/manager_fonts.dart';
import 'package:wafir_mobile/core/resource/manager_sizes.dart';

class CustomDiscountAndFavoriteRowWidget extends StatelessWidget {
  const CustomDiscountAndFavoriteRowWidget({
    required this.discountPercentage,
    required this.addOrRemoveFavoriteOfferFunction,
    this.isFavorite = false,
    super.key,
  });

  final String discountPercentage;
  final Function() addOrRemoveFavoriteOfferFunction;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(
        horizontal: ManagerWidths.w5,
        vertical: ManagerHeights.h10,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: ManagerWidths.w5,
              vertical: ManagerHeights.h5,
            ),
            decoration: BoxDecoration(
              color: ManagerColors.failureColor,
              borderRadius: BorderRadius.circular(ManagerRadius.r15),
            ),
            child: Text(
              "خصم $discountPercentage%",
              style:  TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.w800,
                fontFamily: ManagerFontFamily.tajawal,
              ),
            ),
          ),
          GestureDetector(
            onTap: addOrRemoveFavoriteOfferFunction,
            child: Container(
              padding: EdgeInsetsDirectional.symmetric(
                vertical: ManagerHeights.h5,
                horizontal: ManagerWidths.w5,
              ),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.92),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.favorite,
                color:
                    isFavorite ? ManagerColors.failureColor : Color(0xFFB3BDCF),
                size: ManagerIconsSizes.i20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
