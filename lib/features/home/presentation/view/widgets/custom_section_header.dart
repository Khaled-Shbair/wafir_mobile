import 'package:flutter/material.dart';
import 'package:wafir_mobile/core/resource/manager_fonts.dart';
import 'package:wafir_mobile/core/resource/manager_sizes.dart';
import 'package:wafir_mobile/core/resource/manager_strings.dart';

class CustomSectionHeader extends StatelessWidget {
  const CustomSectionHeader({
    required this.title,
    required this.viewAllButton,
    super.key,
  });

  final String title;
  final Function() viewAllButton;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(
        horizontal: ManagerWidths.w15,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontWeight: ManagerFontWeight.bold,
                  fontSize: ManagerFontsSizes.f17,
                ),
          ),
          TextButton(
            onPressed: viewAllButton,
            child: Text(
              ManagerStrings.viewAll,
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
        ],
      ),
    );
  }
}
