import 'package:flutter/material.dart';
import 'package:wafir_mobile/core/resource/manager_colors.dart';
import 'package:wafir_mobile/core/resource/manager_sizes.dart';

class CustomServiceBox extends StatelessWidget {
  const CustomServiceBox({super.key, required this.title, required this.icon});
final IconData icon ;
  final String title ;
  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsetsDirectional.only(
        top: ManagerHeights.h15,
        bottom: ManagerHeights.h15,
      ),

      decoration: BoxDecoration(
        color: const Color(0xFFF0F4F4),
        borderRadius: BorderRadius.circular(ManagerRadius.r15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: ManagerColors.primaryColor, size: 16),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: ManagerColors.blackColor,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
