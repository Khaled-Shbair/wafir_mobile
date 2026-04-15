import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafir_mobile/core/resource/manager_colors.dart';
import 'package:wafir_mobile/core/resource/manager_sizes.dart';
import 'package:wafir_mobile/core/resource/manager_strings.dart';
import 'package:wafir_mobile/core/widgets/custom_spacing.dart';
import 'package:wafir_mobile/core/widgets/custom_toast_massage.dart';
import 'package:wafir_mobile/features/home/domain/model/home_models.dart';
import 'package:wafir_mobile/features/home/presentation/controller/home_bloc.dart';
import 'package:wafir_mobile/features/home/presentation/view/widgets/custom_offer_card.dart';
import 'package:wafir_mobile/features/home/presentation/view/widgets/custom_section_header.dart';
import 'package:wafir_mobile/features/home/presentation/view/widgets/custom_ventor_item.dart';
import 'package:wafir_mobile/features/home/presentation/view/widgets/custom_verified_store_card.dart';
import 'package:wafir_mobile/routes/routes.dart';

class HomeScreen extends StatelessWidget with CustomToastMassage {
  const HomeScreen({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('وافر'),
        centerTitle: false,
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.only(end: ManagerWidths.w10),
            child: GestureDetector(
              onTap: () {
                // Navigator.of(context).pushNamed(Routes.notificationsScreen);
              },
              child: Icon(
                Icons.notifications_none_rounded,
                size: ManagerIconsSizes.i28,
              ),
            ),
          ),
        ],
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: ManagerColors.primaryColor,
              ),
            );
          } else if (state is HomeLoadedSuccessfully) {
            return SingleChildScrollView(
              padding: EdgeInsetsDirectional.only(
                top: ManagerHeights.h15,
                bottom: ManagerHeights.h15,
              ),
              child: Column(
                children: [
                  _buildSearchBar(context),
                  verticalSpace(ManagerHeights.h18),
                  CustomVentorItem(ventors: state.home.data.sectors),
                  verticalSpace(ManagerHeights.h18),
                  CustomSectionHeader(
                    title: 'أحدث العروض والخصومات',
                    viewAllButton: () {},
                  ),
                  verticalSpace(ManagerHeights.h10),
                  _buildLatestOffers(state.home.data.offers),
                  verticalSpace(ManagerHeights.h25),
                  CustomSectionHeader(
                    title: 'أفضل عروض الفنادق',
                    viewAllButton: () {},
                  ),
                  const SizedBox(height: 10),
                  _buildLatestOffers(state.home.data.bestHotels),
                  verticalSpace(ManagerHeights.h25),
                  CustomSectionHeader(
                    title: 'العروض الأمثل لك',
                    viewAllButton: () {},
                  ),
                  const SizedBox(height: 10),
                  _buildLatestOffers(state.home.data.recommended),
                  verticalSpace(ManagerHeights.h25),
                  CustomSectionHeader(
                    title: 'أبرز المتاجر الموثقة',
                    viewAllButton: () {},
                  ),
                  const SizedBox(height: 10),
                  _buildVerifiedStores(state.home.data.stores),
                ],
              ),
            );
          }
          return Center(
            child: Text('لا يوجد بيانات لعرضها'),
          );
        },
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: ManagerWidths.w15),
      child: Container(
        padding: EdgeInsetsDirectional.only(
          start: ManagerWidths.w15,
        ),
        height: ManagerHeights.h50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(ManagerRadius.r15),
          border: Border.all(color: const Color(0xFFE2E8EA)),
        ),
        child:  Row(
          children: [
            Icon(Icons.search, color: Color(0xFF7F8D92)),
            horizontalSpace(ManagerWidths.w10),
            Expanded(
              child: Text(
                ManagerStrings.searchOnStoreOrOffer,
                style:
                Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: Color(0xFF7F8D92),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLatestOffers(List<HomeOfferModel> offers) {
    return SizedBox(
      height: ManagerHeights.h300,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: ManagerWidths.w15),
        itemCount: offers.length,
        separatorBuilder: (_, __) => horizontalSpace(ManagerWidths.w15),
        itemBuilder: (context, index) => CustomOfferCard(offer: offers[index]),
      ),
    );
  }

  Widget _buildVerifiedStores(List<HomeStoreModel> stores) {
    return SizedBox(
      height: ManagerHeights.h100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: ManagerWidths.w15),
        itemCount: stores.length,
        separatorBuilder: (_, __) => horizontalSpace(ManagerWidths.w10),
        itemBuilder: (context, index) {
          return CustomVerifiedStoreCard(stores[index]);
        },
      ),
    );
  }
}
