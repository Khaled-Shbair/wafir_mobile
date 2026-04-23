import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafir_mobile/config/constants/app_constants.dart';
import 'package:wafir_mobile/core/resource/manager_sizes.dart';
import 'package:wafir_mobile/core/resource/manager_strings.dart';
import 'package:wafir_mobile/core/widgets/custom_offer_item_widget.dart';
import 'package:wafir_mobile/core/widgets/custom_spacing.dart';
import 'package:wafir_mobile/core/widgets/custom_text_field.dart';
import 'package:wafir_mobile/features/home/presentation/controller/navigation_cubit.dart';
import 'package:wafir_mobile/features/home/presentation/view/widgets/custom_section_header.dart';
import 'package:wafir_mobile/features/offers/presentation/controller/offers_bloc.dart';
import 'package:wafir_mobile/features/offers/presentation/view/widgets/custom_filter_bottom_sheet.dart';

class OffersScreen extends StatefulWidget {
  const OffersScreen({super.key});

  @override
  State<OffersScreen> createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  late final FocusNode _searchFocusNode;

  // Offers screen is also used as a standalone route, so NavigationCubit may not exist.
  NavigationCubit? _tryGetNavigationCubit(BuildContext context) {
    try {
      return context.read<NavigationCubit>();
    } catch (_) {
      return null;
    }
  }

  @override
  void initState() {
    super.initState();
    _searchFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _searchFocusNode.dispose();
    super.dispose();
  }

  void _requestSearchFocus() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      _searchFocusNode.requestFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.read<OffersBloc>();
    final navigationCubit = _tryGetNavigationCubit(context);

    final scaffold = Scaffold(
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
              focusNode: _searchFocusNode,
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

    if (navigationCubit == null) {
      return scaffold;
    }

    return BlocListener<NavigationCubit, NavigationState>(
      bloc: navigationCubit,
      listenWhen: (previous, current) {
        return previous.offersSearchFocusRequestId !=
            current.offersSearchFocusRequestId;
      },
      listener: (context, state) {
        if (state.selectedIndex == 1) {
          _requestSearchFocus();
        }
      },
      child: scaffold,
    );
  }
}
