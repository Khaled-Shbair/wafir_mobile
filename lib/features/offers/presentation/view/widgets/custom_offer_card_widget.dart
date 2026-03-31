import 'package:flutter/material.dart';
import 'package:wafir_mobile/core/resource/manager_colors.dart';
import 'package:wafir_mobile/core/resource/manager_fonts.dart';
import 'package:wafir_mobile/core/resource/manager_sizes.dart';
import 'package:wafir_mobile/core/widgets/custom_button.dart';
import 'package:wafir_mobile/core/widgets/custom_spacing.dart';
import 'package:wafir_mobile/features/offers/presentation/model/offer_item_model.dart';

class CustomOfferCardWidget extends StatelessWidget {
  const CustomOfferCardWidget({super.key, required this.item});

  final OfferItemModel item;

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
                  Image.network(
                    item.imageUrl,
                    // fit: BoxFit.fill,
                  ),
                  Padding(
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
                            borderRadius:
                                BorderRadius.circular(ManagerRadius.r15),
                          ),
                          child: Text(
                            item.badge,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsetsDirectional.symmetric(
                            vertical: ManagerHeights.h5,
                            horizontal: ManagerWidths.w5,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.92),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.favorite,
                            color: Color(0xFFB3BDCF),
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 6,
            child: Padding(
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
                    children: [
                      Container(
                        width: ManagerWidths.w25,
                        height: ManagerHeights.h25,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(ManagerRadius.r10),
                          image: DecorationImage(
                            image: AssetImage('assets/images/logo_food.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      horizontalSpace(ManagerWidths.w5),
                      Flexible(
                        child: Text(
                          item.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Color(0xFF0B1620),
                            fontSize: 12,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(ManagerHeights.h5),
                  Text(
                    item.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Color(0xFF7E9197),
                      fontSize: 10,
                      fontWeight: ManagerFontWeight.medium,
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                      start: ManagerWidths.w5,
                      end: ManagerWidths.w5,
                    ),
                    child: CustomButton(
                      height: ManagerHeights.h35,
                      fontSize: ManagerFontsSizes.f14,
                      onPressed: () {},
                      text: 'التفاصيل',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
