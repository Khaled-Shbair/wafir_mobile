import 'package:flutter/material.dart';
import 'package:wafir_mobile/core/resource/manager_colors.dart';
import 'package:wafir_mobile/core/resource/manager_sizes.dart';
import 'package:wafir_mobile/core/resource/manager_strings.dart';
import 'package:wafir_mobile/core/widgets/custom_spacing.dart';

class CustomHeroCardWidget extends StatelessWidget {
  const CustomHeroCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
      decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [ManagerColors.blackColor, ManagerColors.primaryColor],
          ),
          borderRadius: BorderRadius.circular(ManagerRadius.r15)),
      child: Column(
        children: [
          Container(
            width: ManagerHeights.h100,
            height: ManagerWidths.w100,
            decoration: BoxDecoration(
              // color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(16),
              image: const DecorationImage(
                image: AssetImage('assets/images/logo_food.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          verticalSpace(ManagerHeights.h18),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.verified, color: Color(0xFFFFD45A), size: 18),
              horizontalSpace(ManagerWidths.w5),
              Text(
                'Pizza King',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
          verticalSpace(ManagerHeights.h10),
          Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 10,
            runSpacing: 8,
            children: [
              _heroMetaPill('4.9 ★', filled: true),
              heroMetaText('مطعم', Icons.restaurant_outlined),
              heroMetaText('الرياض - حي الملقا', Icons.location_on_outlined),
            ],
          ),
          // Container(
          //   padding: EdgeInsets.symmetric(
          //     horizontal: ManagerWidths.w10,
          //     vertical: ManagerHeights.h10,
          //   ),
          //   decoration: BoxDecoration(
          //     color: Colors.white.withOpacity(0.12),
          //     borderRadius: BorderRadius.circular(999),
          //     border: Border.all(color: Colors.white.withOpacity(0.08)),
          //   ),
          //   child: const Text(
          //     'مفتوح الآن',
          //     style: TextStyle(
          //       color: Colors.white,
          //       fontSize: 18,
          //       fontWeight: FontWeight.w700,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  static Widget heroMetaText(String text, IconData icon) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Colors.white70, size: 16),
        const SizedBox(width: 4),
        Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  static Widget _heroMetaPill(String text, {bool filled = false}) {
    return Container(
      padding: EdgeInsetsDirectional.symmetric(
          horizontal: ManagerWidths.w10, vertical: ManagerHeights.h5),
      decoration: BoxDecoration(
        color: filled ? Colors.white.withOpacity(0.14) : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xFFFFD45A),
          fontSize: 12,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}
