import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wafir_mobile/core/resource/manager_sizes.dart';
import 'package:wafir_mobile/core/widgets/custom_spacing.dart';
import 'package:wafir_mobile/features/home/domain/model/home_models.dart';

class CustomVentorItem extends StatelessWidget {
  const CustomVentorItem({required this.ventors, super.key});

  final List<HomeSectorModel> ventors;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ManagerHeights.h90,
      child: ListView.separated(
        padding:  EdgeInsets.symmetric(horizontal: ManagerWidths.w15),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final item = ventors[index];
          return Column(
            children: [
              Container(
                width: ManagerWidths.w55,
                height: ManagerHeights.h55,
                margin: EdgeInsetsDirectional.only(
                  bottom: ManagerHeights.h7,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(ManagerRadius.r10),
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(item.iconUrl),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Text(
                item.name,
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ],
          );
        },
        separatorBuilder: (_, __) => horizontalSpace(ManagerWidths.w10),
        itemCount: ventors.length,
      ),
    );
  }
}
