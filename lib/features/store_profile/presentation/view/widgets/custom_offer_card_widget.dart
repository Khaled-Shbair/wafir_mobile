import 'package:flutter/material.dart';
import 'package:wafir_mobile/core/resource/manager_colors.dart';
import 'package:wafir_mobile/core/resource/manager_sizes.dart';
import 'package:wafir_mobile/core/widgets/custom_button.dart';
import 'package:wafir_mobile/features/store_profile/presentation/model/offer_model.dart';

class CustomOfferCard extends StatelessWidget {
  const CustomOfferCard({super.key, required this.item});

  final OfferModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(ManagerRadius.r15),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0D000000),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            flex: 5,
            child: Stack(
              alignment: AlignmentDirectional.topStart,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(ManagerRadius.r15)),
                  child: Image.network(
                    item.imageUrl,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: ManagerHeights.h10,
                  right: ManagerWidths.w10,
                  child: Container(
                    padding: EdgeInsetsDirectional.symmetric(
                      horizontal: ManagerWidths.w5,
                      vertical: ManagerHeights.h5,
                    ),
                    decoration: BoxDecoration(
                      color: ManagerColors.failureColor,
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: Text(
                      item.discount,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: ManagerColors.blackColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.subtitle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: ManagerColors.blackColor,
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  // const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        item.price,
                        style: TextStyle(
                          color: ManagerColors.blackColor,
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        item.oldPrice,
                        style: const TextStyle(
                          color: Color(0xFF99A6AB),
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
                  CustomButton(
                    onPressed: () {},
                    text: 'التفاصيل',
                    fontSize: 12,
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
