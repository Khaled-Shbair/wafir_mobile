import 'package:flutter/material.dart';
import 'package:wafir_mobile/core/resource/manager_sizes.dart';
import 'package:wafir_mobile/core/widgets/custom_spacing.dart';

class CustomBottomNavItem extends StatelessWidget {
  const CustomBottomNavItem({
    required this.icon,
    required this.label,
    required this.active,
    required this.onTap,
    super.key,
  });

  final IconData icon;
  final String label;
  final bool active;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: Theme.of(context)
                .bottomNavigationBarTheme
                .selectedIconTheme
                ?.size,
            color: active
                ? Theme.of(context).bottomNavigationBarTheme.selectedItemColor
                : Theme.of(context)
                    .bottomNavigationBarTheme
                    .unselectedItemColor,
          ),
          verticalSpace(ManagerHeights.h3),
          Text(
            label,
            style: active
                ? Theme.of(context).bottomNavigationBarTheme.selectedLabelStyle
                : Theme.of(context)
                    .bottomNavigationBarTheme
                    .unselectedLabelStyle,
          ),
        ],
      ),
    );
  }
}
