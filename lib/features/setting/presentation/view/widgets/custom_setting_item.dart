import 'package:flutter/material.dart';
import 'package:wafir_mobile/core/resource/manager_colors.dart';
import 'package:wafir_mobile/core/resource/manager_sizes.dart';

class CustomSettingItem extends StatelessWidget {
  const CustomSettingItem({
    super.key,
    required this.icon,
    required this.onTap,
    required this.title,
  });

  final String icon;
  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsetsDirectional.only(
        start: ManagerWidths.w10,
        end: ManagerWidths.w10,
      ),
      leading: Image.asset(
        icon,
        width: ManagerWidths.w35,
        height: ManagerHeights.h35,
      ),
      title: Text(title, style: Theme.of(context).listTileTheme.titleTextStyle),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: ManagerColors.blackColor,
        size: ManagerIconsSizes.i20,
      ),
      onTap: onTap,
    );
  }
}
