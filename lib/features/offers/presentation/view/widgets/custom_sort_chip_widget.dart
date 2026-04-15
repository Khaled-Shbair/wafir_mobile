import 'package:flutter/cupertino.dart';
import 'package:wafir_mobile/core/resource/manager_colors.dart';
import 'package:wafir_mobile/core/resource/manager_sizes.dart';

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
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color:
                active ? ManagerColors.whiteColor : ManagerColors.primaryColor,
            size: 14,
          ),
          const SizedBox(width: 5),
          Flexible(
            child: Text(
              label,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: active
                    ? ManagerColors.whiteColor
                    : ManagerColors.primaryColor,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
