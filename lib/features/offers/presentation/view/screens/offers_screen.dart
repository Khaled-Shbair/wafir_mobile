import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafir_mobile/config/constants/app_constants.dart';
import 'package:wafir_mobile/core/resource/manager_sizes.dart';
import 'package:wafir_mobile/core/resource/manager_strings.dart';
import 'package:wafir_mobile/core/validator/validator.dart';
import 'package:wafir_mobile/core/widgets/custom_offer_item_widget.dart';
import 'package:wafir_mobile/core/widgets/custom_spacing.dart';
import 'package:wafir_mobile/core/widgets/custom_text_field.dart';
import 'package:wafir_mobile/core/widgets/custom_drop_down_list.dart';
import 'package:wafir_mobile/features/favorite/domain/model/favorite_offers_model.dart';
import 'package:wafir_mobile/features/favorite/presentation/controller/favorite_bloc.dart';
import 'package:wafir_mobile/features/home/presentation/view/widgets/custom_section_header.dart';
import 'package:wafir_mobile/features/offers/presentation/controller/offers_bloc.dart';
import 'package:wafir_mobile/features/offers/presentation/view/widgets/custom_sort_chip_widget.dart';

class OffersScreen extends StatefulWidget {
  const OffersScreen({super.key});

  @override
  State<OffersScreen> createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  final TextEditingController _searchController = TextEditingController();

  // Filter values
  String? _selectedCategory;
  String? _selectedCity;

  // Example lists for filters
  final List<String> _categories = const [
    'كل الفئات',
    'مطاعم',
    'مقاهي',
    'سوبرماركت',
    'ملابس',
  ];

  @override
  void initState() {
    super.initState();
    context.read<OffersBloc>().add(GetAllOffersEvent());
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              controller: _searchController,
              hintText: ManagerStrings.searchOnStoreOrOffer,
              prefixIcon: Icon(
                Icons.search,
                size: ManagerIconsSizes.i24,
              ),
              validator: (value) => Validator.searchValidate(value),
            ),
            verticalSpace(ManagerHeights.h18),
            _buildFilterRow(),
            verticalSpace(ManagerHeights.h18),
            _buildSortRow(),
            verticalSpace(ManagerHeights.h25),
            CustomSectionHeader(title: ManagerStrings.availableOffers),
            verticalSpace(ManagerHeights.h15),
            BlocBuilder<OffersBloc, OffersState>(
              builder: (context, state) {
                if (state is OffersLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is OffersFailure) {
                  return Center(
                    child: Text(state.message),
                  );
                } else if (state is OffersLoaded) {
                  final items = state.offers.items;

                  return GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: items.length,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: ManagerWidths.w15,
                      mainAxisSpacing: ManagerWidths.w15,
                      childAspectRatio: 0.60,
                    ),
                    itemBuilder: (context, index) {
                      return CustomOfferItemWidget(
                        item: FavoriteOfferItemModel(
                          offerId: items[index].id,
                          title: items[index].title,
                          description: items[index].description,
                          imageUrl: items[index].imageUrl,
                          discountPercentage: items[index].discountPercentage,
                          validUntil: items[index].validUntil,
                          businessName: items[index].vendor?.businessName ?? '',
                          discountCode: items[index].discountCode,
                          id: items[index].id,
                          logoUrl: items[index].vendor?.logoUrl ?? '',
                          status: items[index].status,
                          userId: items[index].vendorId,
                        ),
                        addOrRemoveFavoriteOfferFunction: () {
                          context.read<FavoriteBloc>().add(
                                ToggleFavoriteOfferEvent(
                                  offerId: items[index].id,
                                ),
                              );
                        },
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: Text('لا توجد عروض متاحة حالياً'),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: ManagerHeights.h45,
              child: CustomDropDownList(
                selectedItem: _selectedCategory,
                items: _categories,
                hintText: ManagerStrings.category,
                onChangedFunction: (value) {
                  setState(() => _selectedCategory = value);
                },
                validator: (value) => null,
              ),
            ),
          ),
          horizontalSpace(ManagerWidths.w10),
          Expanded(
            child: SizedBox(
              height: ManagerHeights.h45,
              child: CustomDropDownList(
                selectedItem: _selectedCity,
                items: AppConstants.omanLocations.keys.toList(),
                hintText: ManagerStrings.governorate,
                onChangedFunction: (value) {
                  setState(() => _selectedCity = value);
                },
                validator: (value) => null,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSortRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Row(
        children: [
          Expanded(
            child: CustomSortChipWidget(
              label: ManagerStrings.latest,
              active: true,
              icon: Icons.auto_awesome,
            ),
          ),
          horizontalSpace(ManagerWidths.w10),
          Expanded(
            child: CustomSortChipWidget(
              label: ManagerStrings.highestDiscount,
              icon: Icons.trending_up_rounded,
            ),
          ),
          horizontalSpace(ManagerWidths.w10),
          Expanded(
            child: CustomSortChipWidget(
              label: ManagerStrings.closest,
              icon: Icons.location_on,
            ),
          ),
        ],
      ),
    );
  }
}
