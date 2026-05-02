import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wafir_mobile/core/resource/manager_colors.dart';
import 'package:wafir_mobile/core/resource/manager_fonts.dart';
import 'package:wafir_mobile/core/resource/manager_sizes.dart';
import 'package:wafir_mobile/core/widgets/custom_spacing.dart';
import 'package:wafir_mobile/features/home/domain/model/home_models.dart';
import 'package:wafir_mobile/routes/routes.dart';

class CustomVentorItem extends StatelessWidget {
  const CustomVentorItem({required this.ventors, super.key});

  final List<HomeSectorModel> ventors;

  @override
  Widget build(BuildContext context) {
    // ترتيب المزودين بحيث تظهر 'soon' في النهاية
    final sortedVentors = [...ventors].where((v) => v.status != 'soon').toList()
      ..addAll(ventors.where((v) => v.status == 'soon'));

    return SizedBox(
      height: ManagerHeights.h100,
      child: ListView.separated(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: ManagerWidths.w15),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final item = sortedVentors[index];
          return GestureDetector(
            onTap: item.status != 'soon'
                ? () {
                    Navigator.of(context).pushNamed(
                      Routes.vendorsScreen,
                      arguments: item.name,
                    );
                  }
                : null,
            child: Column(
              children: [
                Badge(
                  backgroundColor: ManagerColors.primaryColor,
                  isLabelVisible: item.status == 'soon',
                  label: Text(
                    'قريباً',
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          color: Colors.white,
                          fontSize: ManagerFontsSizes.f8,
                        ),
                  ),
                  child: Container(
                    width: ManagerWidths.w55,
                    height: ManagerHeights.h55,
                    margin: EdgeInsetsDirectional.only(
                      bottom: ManagerHeights.h7,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(ManagerRadius.r20),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x14000000),
                          blurRadius: 10,
                          offset: Offset(0, 3),
                        ),
                      ],
                      border: Border.all(color: const Color(0xFFE1E9EB)),
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(item.iconUrl),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Text(
                  item.name,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
          );
        },
        separatorBuilder: (_, __) => horizontalSpace(ManagerWidths.w10),
        itemCount: sortedVentors.length,
      ),
    );
  }
}
