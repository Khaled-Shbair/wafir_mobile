import 'package:flutter/material.dart';
import 'package:wafir_mobile/config/constants/app_constants.dart';
import 'package:wafir_mobile/core/resource/manager_colors.dart';
import 'package:wafir_mobile/core/resource/manager_sizes.dart';
import 'package:wafir_mobile/core/resource/manager_strings.dart';
import 'package:wafir_mobile/core/validator/validator.dart';
import 'package:wafir_mobile/core/widgets/custom_spacing.dart';
import 'package:wafir_mobile/core/widgets/custom_text_field.dart';
import 'package:wafir_mobile/core/widgets/custom_drop_down_list.dart';
import 'package:wafir_mobile/features/offers/presentation/model/offer_item_model.dart';
import 'package:wafir_mobile/features/offers/presentation/view/widgets/custom_offer_card_widget.dart';

class OffersScreen extends StatefulWidget {
  const OffersScreen({super.key});

  @override
  State<OffersScreen> createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  static const Color primary = Color(0xFF006D77);
  static const Color bgChip = Color(0xFFE8F1F2);

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
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final offers = [
      const OfferItemModel(
        title: 'بيتزا أنابولي',
        description: 'خصم خاص على جميع أنواع البيتزا.',
        footer: '٢.٥ كم',
        footerIcon: Icons.location_on,
        badge: 'خصم ٣٠٪',
        logoText: 'AN',
        logoColor: Color(0xFF0B2530),
        imageUrl:
            'https://images.unsplash.com/photo-1513104890138-7c749659a591?q=80&w=1200&auto=format&fit=crop',
      ),
      const OfferItemModel(
        title: 'مطعم اللقمة الذهبية',
        description: 'خصم حصري على كافة الوجبات العائلية.',
        footer: '٣ أيام',
        footerIcon: Icons.access_time_filled,
        badge: 'خصم ٥٠٪',
        logoText: 'LG',
        logoColor: Color(0xFF3B271C),
        imageUrl:
            'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?q=80&w=1200&auto=format&fit=crop',
      ),
      const OfferItemModel(
        title: 'هيلثي بايت',
        description: 'عرض خاص على السلطات المختارة.',
        footer: 'عرض مميز',
        footerIcon: Icons.stars_rounded,
        badge: '1+1 مجاناً',
        logoText: 'HB',
        logoColor: Color(0xFF92A354),
        imageUrl:
            'https://images.unsplash.com/photo-1546793665-c74683f339c1?q=80&w=1200&auto=format&fit=crop',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('العروض'),
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
            const SizedBox(height: 18),
            CustomTextField(
              controller: _searchController,
              hintText: ManagerStrings.searchOnStoreOrOffer,
              prefixIcon: Icons.search,
              validator: (value) => Validator.searchValidate(value),
            ),
            const SizedBox(height: 18),
            _buildFilterRow(),
            const SizedBox(height: 18),
            _buildSortRow(),
            const SizedBox(height: 24),
            Text(
              ManagerStrings.availableOffers,
              style: const TextStyle(
                color: Color(0xFF06111A),
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),
            verticalSpace(ManagerHeights.h15),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: offers.length,
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: ManagerWidths.w15,
                mainAxisSpacing: ManagerWidths.w15,
                childAspectRatio: 0.60,
              ),
              itemBuilder: (context, index) {
                return  CustomOfferCardWidget(item: offers[index]);
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
              height: 40,
              child: CustomDropDownList(
                selectedItem: _selectedCategory,
                items: _categories,
                hintText: 'الفئة',
                onChangedFunction: (value) {
                  setState(() => _selectedCategory = value);
                },
                validator: (value) => null,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: SizedBox(
              height: 40,
              child: CustomDropDownList(
                selectedItem: _selectedCity,
                items: AppConstants.omanLocations.keys.toList(),
                hintText: 'المحافظة',
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
        children: const [
          Expanded(
            child: SortChip(
              label: 'الأحدث',
              active: true,
              icon: Icons.auto_awesome,
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: SortChip(
              label: 'أعلى خصم',
              icon: Icons.trending_up_rounded,
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: SortChip(
              label: 'الأقرب',
              icon: Icons.location_on,
            ),
          ),
        ],
      ),
    );
  }
}

class SortChip extends StatelessWidget {
  final String label;
  final bool active;
  final IconData icon;

  const SortChip({
    super.key,
    required this.label,
    required this.icon,
    this.active = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(
        top: ManagerHeights.h5,
        bottom: ManagerHeights.h5,
      ),
      decoration: BoxDecoration(
        color: active ? ManagerColors.primaryColor : _OffersScreenState.bgChip,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color:
                active ? ManagerColors.whiteColor : _OffersScreenState.primary,
            size: 14,
          ),
          const SizedBox(width: 5),
          Flexible(
            child: Text(
              label,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: active
                    ? ManagerColors.whiteColor
                    : _OffersScreenState.primary,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
