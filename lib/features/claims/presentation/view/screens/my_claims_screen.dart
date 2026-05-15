import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:wafir_mobile/core/model/offers_model.dart';
import 'package:wafir_mobile/core/resource/manager_colors.dart';
import 'package:wafir_mobile/core/resource/manager_fonts.dart';
import 'package:wafir_mobile/core/resource/manager_sizes.dart';
import 'package:wafir_mobile/core/resource/manager_strings.dart';
import 'package:wafir_mobile/core/widgets/custom_offer_item_widget.dart';
import 'package:wafir_mobile/routes/routes.dart';
import 'package:wafir_mobile/features/offers/domain/model/my_claims_model.dart';
import 'package:wafir_mobile/features/offers/presentation/controller/my_claims_bloc.dart';

class MyClaimsScreen extends StatelessWidget {
  const MyClaimsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ManagerStrings.claims),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: BlocBuilder<MyClaimsBloc, MyClaimsState>(
        builder: (context, state) {
          if (state is MyClaimsLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: ManagerColors.primaryColor,
              ),
            );
          } else if (state is MyClaimsLoaded) {
            final items = state.claims.claims;
            if (items.isEmpty) {
              return Center(
                child: Text(
                  'لا توجد طلبات حالياً',
                  style: TextStyle(
                    fontSize: ManagerFontsSizes.f16,
                    fontWeight: FontWeight.w500,
                    color: ManagerColors.blackColor,
                  ),
                ),
              );
            }
            return GridView.builder(
              padding: EdgeInsetsDirectional.only(
                start: ManagerWidths.w15,
                end: ManagerWidths.w15,
                top: ManagerHeights.h15,
                bottom: ManagerHeights.h15,
              ),
              itemCount: items.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: ManagerWidths.w15,
                mainAxisSpacing: ManagerWidths.w15,
                childAspectRatio: 3 / 5.2,
              ),
                itemBuilder: (context, index) {
                    final offerModel = items[index].toOfferItemModel();
                    return CustomOfferItemWidget(
                      item: offerModel,
                      buttonText: 'تفاصيل',
                      onPressed: () => Navigator.of(context).pushNamed(
                        Routes.offerDetailsScreen,
                        arguments: offerModel.offerId,
                      ),
                    );
                  },
            );
          } else if (state is MyClaimsFailure) {
            return Center(child: Text(state.message));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}

extension ClaimToOfferExtension on ClaimItemModel {
  OfferItemModel toOfferItemModel() {
    return OfferItemModel(
      id: id,
      offerId: offerId,
      minimumPurchase: '',
      validUntil: expiresAt,
      validFrom: createdAt,
      governorate: '',
      title: offer.title,
      isFavorite: false,
      description: '',
      imageUrl: offer.imageUrl,
      discountPercentage: offer.discountPercentage,
      discountCode: claimCode,
      businessName: offer.vendorBusinessName,
      logoUrl: offer.vendorLogoUrl,
      wilaya: '',
      branches: const [],
    );
  }
}
