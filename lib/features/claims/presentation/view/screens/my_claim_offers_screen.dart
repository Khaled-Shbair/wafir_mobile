import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafir_mobile/core/model/offers_model.dart';
import 'package:wafir_mobile/core/resource/manager_colors.dart';
import 'package:wafir_mobile/core/resource/manager_fonts.dart';
import 'package:wafir_mobile/core/resource/manager_sizes.dart';
import 'package:wafir_mobile/core/resource/manager_strings.dart';
import 'package:wafir_mobile/core/widgets/custom_offer_item_widget.dart';
import 'package:wafir_mobile/features/claims/presentation/controller/my_claim_offers_bloc.dart';
import 'package:wafir_mobile/routes/routes.dart';

class MyClaimOffersScreen extends StatelessWidget {
  const MyClaimOffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ManagerStrings.claims),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: BlocBuilder<MyClaimOffersBloc, MyClaimOffersState>(
        builder: (context, state) {
          if (state is MyClaimOffersLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: ManagerColors.primaryColor,
              ),
            );
          } else if (state is MyClaimOffersSuccessfully) {
            final items = state.offers;
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
                final offerModel = items[index];
                return CustomOfferItemWidget(
                  item: OfferItemModel(
                    businessName: offerModel.offer.vendor.businessName,
                    logoUrl: offerModel.offer.vendor.logoUrl,
                    title: offerModel.offer.title,
                    imageUrl: offerModel.offer.imageUrl,
                    validFrom: offerModel.offer.validFrom,
                    validUntil: offerModel.offer.validUntil,
                    discountPercentage: offerModel.offer.discountPercentage,
                    id: offerModel.id,
                    offerId: offerModel.offer.id,
                    discountCode: '',
                    description: offerModel.offer.title,
                    isFavorite: offerModel.offer.isFavorited,
                    wilaya: '',
                    governorate: '',
                    minimumPurchase: '',
                    branches: [],
                  ),
                  buttonText: 'تفاصيل',
                  onPressed: () => Navigator.of(context).pushNamed(
                    Routes.offerDetailsScreen,
                    arguments: [offerModel.offer.id, 'التفاصيل'],
                  ),
                );
              },
            );
          } else if (state is MyClaimOffersFailed) {
            return Center(child: Text(state.message));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}

