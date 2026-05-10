import 'package:flutter/material.dart';
import 'package:wafir_mobile/core/resource/manager_colors.dart';
import 'package:wafir_mobile/core/resource/manager_fonts.dart';
import 'package:wafir_mobile/core/resource/manager_sizes.dart';
import 'package:wafir_mobile/core/widgets/custom_spacing.dart';

class CustomOfferTimeAndLocationWidget extends StatelessWidget {
  const CustomOfferTimeAndLocationWidget({
    required this.text,
    required this.icon,
    required this.backgroundColor,
    required this.textColor,
    super.key,
  });

  final String text;
  final IconData icon;
  final Color textColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Container(
      padding: EdgeInsetsDirectional.symmetric(
        horizontal: ManagerWidths.w3,
        vertical: ManagerHeights.h3,
      ),
      decoration: BoxDecoration(
        color: ManagerColors.primaryColor,
        borderRadius: BorderRadius.circular(ManagerRadius.r20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: ManagerIconsSizes.i12, color: textColor),
          horizontalSpace(ManagerWidths.w2),
          Flexible(
            child: Text(
              text.isNotEmpty ? text : 'عمان',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: textColor,
                    fontSize: ManagerFontsSizes.f9,
                  ),
            ),
          ),
        ],
      ),
    ));
  }
}
