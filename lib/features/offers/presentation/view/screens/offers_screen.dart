import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafir_mobile/config/constants/app_constants.dart';
import 'package:wafir_mobile/core/resource/manager_sizes.dart';
import 'package:wafir_mobile/core/resource/manager_strings.dart';
import 'package:wafir_mobile/core/widgets/custom_offer_item_widget.dart';
import 'package:wafir_mobile/core/widgets/custom_spacing.dart';
import 'package:wafir_mobile/core/widgets/custom_text_field.dart';
import 'package:wafir_mobile/features/home/presentation/view/widgets/custom_section_header.dart';
import 'package:wafir_mobile/features/offers/presentation/controller/offers_bloc.dart';
import 'package:wafir_mobile/features/offers/presentation/view/widgets/custom_filter_bottom_sheet.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = context.read<OffersBloc>();
    return Scaffold(
      appBar: AppBar(
        title: Text(ManagerStrings.offers),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsetsDirectional.only(
          bottom: ManagerHeights.h20,
          start: ManagerWidths.w20,
          end: ManagerWidths.w20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              textInputAction: TextInputAction.search,
              controller: controller.search,
              onFieldSubmitted: (v) {
                if (v != null) {
                  FocusManager.instance.primaryFocus?.unfocus();
                  context.read<OffersBloc>().add(GetAllOffersEvent());
                }
              },
              hintText: ManagerStrings.searchOnStoreOrOffer,
              prefixIcon: Icon(
                Icons.search,
                size: ManagerIconsSizes.i24,
              ),
              suffix: IconButton(
                onPressed: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  final offersBloc = context.read<OffersBloc>();
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(ManagerRadius.r20),
                      ),
                    ),
                    builder: (context) => BlocProvider<OffersBloc>.value(
                      value: offersBloc,
                      child: BlocBuilder<OffersBloc, OffersState>(
                        builder: (context, state) {
                          return CustomFilterBottomSheet(
                            categories: AppConstants.categories,
                            selectedCategory: state.selectedCategory,
                            selectedGovernorate: state.selectedGovernorate,
                            selectedWilaya: state.selectedWilaya,
                          );
                        },
                      ),
                    ),
                  );
                },
                icon: Icon(
                  Icons.filter_list_outlined,
                  size: ManagerIconsSizes.i24,
                  color: Colors.red,
                ),
              ),
            ),
            verticalSpace(ManagerHeights.h25),
            CustomSectionHeader(title: ManagerStrings.availableOffers),
            verticalSpace(ManagerHeights.h15),
            BlocBuilder<OffersBloc, OffersState>(
              builder: (context, state) {
                if (state is OffersLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is OffersLoadedSuccessfully ||
                    state is OffersLoadingMore) {
                  final offers = (state is OffersLoadedSuccessfully)
                      ? state.offers
                      : (state as OffersLoadingMore).offers;

                  final isLoadingMore = state is OffersLoadingMore;

                  return NotificationListener<ScrollNotification>(
                    onNotification: (ScrollNotification scrollInfo) {
                      // تحقق إذا وصل المستخدم لنهاية القائمة
                      if (scrollInfo.metrics.pixels ==
                          scrollInfo.metrics.maxScrollExtent) {
                        // طلب بيانات إضافية مرة واحدة فقط
                        if (!isLoadingMore) {
                          context.read<OffersBloc>().add(LoadMoreOffersEvent());
                        }
                      }
                      return false;
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GridView.builder(
                          itemCount: offers.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: ManagerWidths.w15,
                            mainAxisSpacing: ManagerWidths.w15,
                            childAspectRatio: 3 / 5,
                          ),
                          itemBuilder: (context, index) {
                            return CustomOfferItemWidget(item: offers[index]);
                          },
                        ),
                        if (isLoadingMore)
                          Padding(
                            padding: EdgeInsets.only(top: ManagerHeights.h20),
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                      ],
                    ),
                  );
                }
                if (state is OffersFailure) {
                  return Center(
                    child: Text(
                      state.message,
                      style: const TextStyle(color: Colors.red),
                    ),
                  );
                }
                return const Center(
                  child: Text(
                    'لا توجد عروض متاحة حالياً',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
