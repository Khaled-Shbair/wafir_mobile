import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wafir_mobile/core/resource/manager_fonts.dart';
import 'package:wafir_mobile/core/resource/manager_sizes.dart';
import 'package:wafir_mobile/core/widgets/custom_spacing.dart';
import 'package:wafir_mobile/features/home/domain/model/home_models.dart';

class CustomVerifiedStoreCard extends StatelessWidget {
  const CustomVerifiedStoreCard(this.store, {super.key});

  final HomeStoreModel store;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ManagerWidths.w100,
      padding: EdgeInsetsDirectional.symmetric(
        horizontal: ManagerWidths.w15,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(ManagerRadius.r15),
        border: Border.all(color: const Color(0xFFE2E8EA)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: ManagerWidths.w45,
            height: ManagerHeights.h45,
            decoration: BoxDecoration(
              color: Color(0xFFEAF3F4),
              shape: BoxShape.circle,
              image: DecorationImage(
                image: store.logoUrl.isNotEmpty
                    ? CachedNetworkImageProvider(store.logoUrl)
                    : const AssetImage('assets/images/icons/info.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          verticalSpace(ManagerHeights.h10),
          Text(
            store.businessName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: ManagerFontsSizes.f11,
                ),
          ),
        ],
      ),
    );
  }
}
