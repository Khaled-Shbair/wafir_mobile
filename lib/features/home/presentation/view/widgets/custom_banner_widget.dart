import 'package:flutter/material.dart';
import 'package:wafir_mobile/core/resource/manager_colors.dart';
import 'package:wafir_mobile/core/resource/manager_sizes.dart';

class CustomBannerWidget extends StatelessWidget {
  const CustomBannerWidget({super.key, required this.image});
final String image;
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: ManagerHeights.h140,
      margin: EdgeInsets.symmetric(horizontal: ManagerWidths.w15),
      decoration: BoxDecoration(
        color: ManagerColors.whiteColor,
        borderRadius: BorderRadius.circular(ManagerRadius.r15),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
