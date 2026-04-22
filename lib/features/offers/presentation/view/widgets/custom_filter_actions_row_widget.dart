import 'package:flutter/material.dart';
import 'package:wafir_mobile/core/resource/manager_colors.dart';
import 'package:wafir_mobile/core/resource/manager_fonts.dart';
import 'package:wafir_mobile/core/resource/manager_sizes.dart';
import 'package:wafir_mobile/core/resource/manager_strings.dart';
import 'package:wafir_mobile/core/widgets/custom_spacing.dart';

class CustomFilterActionsRowWidget extends StatelessWidget {
  const CustomFilterActionsRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Row(
        children: [
          Expanded(
            child: CustomSortChipWidget(
              label: ManagerStrings.latest,
              active: true,
              icon: Icons.auto_awesome,
            ),
          ),
          horizontalSpace(ManagerWidths.w10),
          Expanded(
            child: CustomSortChipWidget(
              label: ManagerStrings.highestDiscount,
              icon: Icons.trending_up_rounded,
            ),
          ),
          horizontalSpace(ManagerWidths.w10),
          Expanded(
            child: CustomSortChipWidget(
              label: ManagerStrings.closest,
              icon: Icons.location_on,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomSortChipWidget extends StatelessWidget {
  final String label;
  final bool active;
  final IconData icon;

  const CustomSortChipWidget({
    super.key,
    required this.label,
    required this.icon,
    this.active = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(
        top: ManagerHeights.h5,
        bottom: ManagerHeights.h5,
      ),
      decoration: BoxDecoration(
        color: active ? ManagerColors.primaryColor : Color(0xFFE8F1F2),
        borderRadius: BorderRadius.circular(ManagerRadius.r32),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color:
                active ? ManagerColors.whiteColor : ManagerColors.primaryColor,
            size: ManagerIconsSizes.i14,
          ),
          horizontalSpace(ManagerWidths.w5),
          Flexible(
            child: Text(
              label,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: active
                    ? ManagerColors.whiteColor
                    : ManagerColors.primaryColor,
                fontSize: ManagerFontsSizes.f12,
                fontWeight: ManagerFontWeight.medium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
