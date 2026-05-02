import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafir_mobile/config/constants/shared_preferences_keys.dart';
import 'package:wafir_mobile/config/dependency_injection.dart';
import 'package:wafir_mobile/core/resource/manager_colors.dart';
import 'package:wafir_mobile/core/resource/manager_fonts.dart';
import 'package:wafir_mobile/core/resource/manager_sizes.dart';
import 'package:wafir_mobile/core/storage/local/shared_preferences_controller.dart';
import 'package:wafir_mobile/core/widgets/custom_dialog.dart';
import 'package:wafir_mobile/core/widgets/custom_toast_massage.dart';
import 'package:wafir_mobile/features/favorite/presentation/controller/favorite_bloc.dart';

class CustomDiscountAndFavoriteRowWidget extends StatelessWidget
    with CustomToastMassage {
  const CustomDiscountAndFavoriteRowWidget({
    required this.discountPercentage,
    required this.offerId,
    this.isFavorite = false,
    super.key,
  });

  final String discountPercentage;
  final int offerId;
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
              color: ManagerColors.buttonColor,
              borderRadius: BorderRadius.circular(ManagerRadius.r15),
            ),
            child: Text(
              "خصم $discountPercentage%",
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.w800,
                fontFamily: ManagerFontFamily.tajawal,
              ),
            ),
          ),
          BlocBuilder<FavoriteBloc, FavoriteState>(
            buildWhen: (previous, current) {
              if (current is FavoriteLoaded) {
                // فقط أعد البناء إذا تم تبديل هذا الـ offer
                return current.toggledOfferId == offerId;
              }
              return false;
            },
            builder: (context, state) {
              bool isFav = isFavorite;

              if (state is FavoriteLoaded && state.toggledOfferId == offerId) {
                isFav = state.isFavorited ?? false;
              }

              return GestureDetector(
                onTap: () {
                  if (instance<SharedPreferencesController>()
                      .getString(SharedPreferencesKeys.token)
                      .isNotEmpty) {
                    context
                        .read<FavoriteBloc>()
                        .add(ToggleFavoriteOfferEvent(offerId: offerId));
                  } else {
                    loginPop(context);
                  }
                },
                child: Container(
                  padding: EdgeInsetsDirectional.symmetric(
                    vertical: ManagerHeights.h5,
                    horizontal: ManagerWidths.w5,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.92),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.favorite,
                    color:
                        isFav ? ManagerColors.failureColor : Color(0xFFB3BDCF),
                    size: ManagerIconsSizes.i20,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
