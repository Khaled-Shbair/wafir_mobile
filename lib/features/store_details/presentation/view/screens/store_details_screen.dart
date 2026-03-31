import 'package:flutter/material.dart';
import 'package:wafir_mobile/core/resource/manager_sizes.dart';
import 'package:wafir_mobile/core/resource/manager_strings.dart';
import 'package:wafir_mobile/core/widgets/custom_button.dart';
import 'package:wafir_mobile/core/widgets/custom_spacing.dart';

class StoreDetailsScreen extends StatelessWidget {
  const StoreDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          ManagerStrings.storeDetailsTitle,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsetsDirectional.only(
          start: ManagerWidths.w20,
          end: ManagerWidths.w20,
          top: ManagerHeights.h20,
          bottom: ManagerHeights.h20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _StoreHeaderCard(),
            verticalSpace(ManagerHeights.h20),
            _AboutStoreSection(),
            verticalSpace(ManagerHeights.h20),
            _StoreFeaturesRow(),
            verticalSpace(ManagerHeights.h20),
            _PublishedOffersSection(),
          ],
        ),
      ),
    );
  }
}

class _StoreHeaderCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: ManagerWidths.w20,
        vertical: ManagerHeights.h20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(ManagerRadius.r20),
        gradient: LinearGradient(
          colors: [
            Theme.of(context).primaryColor,
            Theme.of(context).primaryColor.withValues(alpha: 0.7),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: ManagerHeights.h70,
            width: ManagerHeights.h70,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(ManagerRadius.r15),
            ),
            child: const Icon(Icons.local_pizza_outlined, size: 40),
          ),
          verticalSpace(ManagerHeights.h15),
          Text(
            'Pizza King',
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(color: Colors.white),
          ),
          verticalSpace(ManagerHeights.h10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.emoji_events_outlined, color: Colors.white, size: 18),
              horizontalSpace(ManagerWidths.w5),
              Text(
                ManagerStrings.storeCategoryLabel,
                style: Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.copyWith(color: Colors.white),
              ),
              horizontalSpace(ManagerWidths.w10),
              const Icon(Icons.location_on_outlined, color: Colors.white, size: 18),
              horizontalSpace(ManagerWidths.w5),
              Text(
                ManagerStrings.storeLocationLabel,
                style: Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.copyWith(color: Colors.white),
              ),
            ],
          ),
          verticalSpace(ManagerHeights.h10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(ManagerRadius.r20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 18),
                horizontalSpace(ManagerWidths.w5),
                Text(
                  '4.9',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge
                      ?.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
          verticalSpace(ManagerHeights.h15),
          CustomButton(
            onPressed: () {},
            text: ManagerStrings.storeOpenNowButton,
          ),
        ],
      ),
    );
  }
}

class _AboutStoreSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          ManagerStrings.aboutStoreTitle,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        verticalSpace(ManagerHeights.h10),
        Text(
          ManagerStrings.aboutStoreDescription,
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }
}

class _StoreFeaturesRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _FeatureChip(
          icon: Icons.delivery_dining,
          label: ManagerStrings.storeFastDelivery,
        ),
        _FeatureChip(
          icon: Icons.family_restroom,
          label: ManagerStrings.storeFamilySeating,
        ),
        _FeatureChip(
          icon: Icons.restaurant_menu,
          label: ManagerStrings.storeCategoryShort,
        ),
      ],
    );
  }
}

class _FeatureChip extends StatelessWidget {
  const _FeatureChip({
    required this.icon,
    required this.label,
  });

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: ManagerHeights.h50,
          width: ManagerHeights.h50,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(ManagerRadius.r15),
          ),
          child: Icon(icon, color: Theme.of(context).primaryColor),
        ),
        verticalSpace(ManagerHeights.h10),
        SizedBox(
          width: ManagerWidths.w120,
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ),
      ],
    );
  }
}

class _PublishedOffersSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          ManagerStrings.publishedOffersTitle,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        verticalSpace(ManagerHeights.h5),
        Text(
          ManagerStrings.publishedOffersSubtitle,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        verticalSpace(ManagerHeights.h15),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 3,
          separatorBuilder: (_, __) => verticalSpace(ManagerHeights.h10),
          itemBuilder: (context, index) {
            return _OfferCard();
          },
        ),
        verticalSpace(ManagerHeights.h20),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            onPressed: () {},
            child: Text(ManagerStrings.showMore),
          ),
        ),
      ],
    );
  }
}

class _OfferCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(ManagerRadius.r15),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: EdgeInsets.all(ManagerWidths.w10),
      child: Row(
        children: [
          Container(
            height: ManagerHeights.h70,
            width: ManagerHeights.h70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(ManagerRadius.r10),
              color: Theme.of(context).primaryColor.withValues(alpha: 0.08),
            ),
          ),
          horizontalSpace(ManagerWidths.w20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(ManagerRadius.r20),
                    ),
                    child: Text(
                      ManagerStrings.offerDiscountBadge,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ),
                ),
                verticalSpace(ManagerHeights.h10),
                Text(
                  ManagerStrings.offerTitle,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                verticalSpace(ManagerHeights.h5),
                Text(
                  ManagerStrings.offerDescription,
                  style: Theme.of(context).textTheme.bodySmall,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                verticalSpace(ManagerHeights.h10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ManagerStrings.offerPrice,
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        Text(
                          ManagerStrings.offerOldPrice,
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall
                              ?.copyWith(decoration: TextDecoration.lineThrough),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: ManagerWidths.w120,
                      child: CustomButton(
                        onPressed: () {},
                        text: ManagerStrings.offerDetailsButton,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

