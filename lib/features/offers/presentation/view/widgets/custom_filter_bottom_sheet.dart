import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafir_mobile/config/constants/app_constants.dart';
import 'package:wafir_mobile/core/resource/manager_colors.dart';
import 'package:wafir_mobile/core/resource/manager_sizes.dart';
import 'package:wafir_mobile/core/resource/manager_strings.dart';
import 'package:wafir_mobile/core/widgets/custom_button.dart';
import 'package:wafir_mobile/core/widgets/custom_spacing.dart';
import 'package:wafir_mobile/features/offers/presentation/controller/offers_bloc.dart';

class CustomFilterBottomSheet extends StatefulWidget {
  final List<String> categories;
  final String? selectedCategory;
  final String? selectedGovernorate;
  final String? selectedWilaya;

  const CustomFilterBottomSheet({
    super.key,
    required this.categories,
    this.selectedCategory,
    this.selectedGovernorate,
    this.selectedWilaya,
  });

  @override
  State<CustomFilterBottomSheet> createState() =>
      _CustomFilterBottomSheetState();
}

class _CustomFilterBottomSheetState extends State<CustomFilterBottomSheet> {
  late String? _tempCategory;
  late String? _tempGovernorate;
  late String? _tempWilaya;

  @override
  void initState() {
    super.initState();
    _tempCategory = widget.selectedCategory;
    _tempGovernorate = widget.selectedGovernorate;
    _tempWilaya = widget.selectedWilaya;
  }

  List<String> _getWilayaList() {
    if (_tempGovernorate == null) {
      return [];
    }
    return AppConstants.omanLocations[_tempGovernorate] ?? [];
  }

  void _resetFilters() {
    setState(() {
      _tempCategory = null;
      _tempGovernorate = null;
      _tempWilaya = null;
    });
  }

  void _applyFilters() {
    final bloc = context.read<OffersBloc>();

    if (_tempCategory != null) {
      bloc.add(CategoryChangedEvent(_tempCategory!));
    }

    if (_tempGovernorate != null) {
      bloc.add(GovernorateChangedEvent(_tempGovernorate!));
    }

    if (_tempWilaya != null) {
      bloc.add(WilayaChangedEvent(_tempWilaya!));
    }
    Navigator.pop(context);
    bloc.add(GetAllOffersEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(ManagerRadius.r20),
        ),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(ManagerWidths.w20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'الفلترة',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.close),
                  ),
                ],
              ),
              verticalSpace(ManagerHeights.h20),

              // Category Section
              _buildFilterSection(
                title: ManagerStrings.category,
                items: widget.categories,
                selectedValue: _tempCategory,
                onChanged: (value) {
                  setState(() {
                    _tempCategory = value;
                  });
                },
              ),
              verticalSpace(ManagerHeights.h20),

              // Governorate Section
              _buildFilterSection(
                title: ManagerStrings.governorate,
                items: AppConstants.omanLocations.keys.toList(),
                selectedValue: _tempGovernorate,
                onChanged: (value) {
                  setState(() {
                    _tempGovernorate = value;
                    _tempWilaya = null; // Reset wilaya when governorate changes
                  });
                },
              ),
              verticalSpace(ManagerHeights.h20),

              // Wilaya Section
              if (_tempGovernorate != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildFilterSection(
                      title: ManagerStrings.wilaya,
                      items: _getWilayaList(),
                      selectedValue: _tempWilaya,
                      onChanged: (value) {
                        setState(() {
                          _tempWilaya = value;
                        });
                      },
                    ),
                    verticalSpace(ManagerHeights.h20),
                  ],
                ),

              // Buttons
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      text: 'إعادة تعيين',
                      color: Colors.grey[300],
                      onPressed: _resetFilters,
                      colorText: Colors.black,
                    ),
                  ),
                  horizontalSpace(ManagerWidths.w15),
                  Expanded(
                    child: CustomButton(
                      text: 'تطبيق الفلترة',
                      color: ManagerColors.primaryColor,
                      onPressed: _applyFilters,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterSection({
    required String title,
    required List<String> items,
    required String? selectedValue,
    required Function(String?) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
        verticalSpace(ManagerHeights.h10),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(ManagerRadius.r10),
          ),
          child: DropdownButton<String>(
            value: selectedValue,
            onChanged: onChanged,
            isExpanded: true,
            underline: const SizedBox(),
            items: [
              DropdownMenuItem<String>(
                value: null,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: ManagerWidths.w10),
                  child: Text(
                    'اختر $title',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ),
              ),
              ...items.map(
                (item) => DropdownMenuItem<String>(
                  value: item,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: ManagerWidths.w10),
                    child: Text(item),
                  ),
                ),
              ),
            ],
            padding: EdgeInsets.symmetric(horizontal: ManagerWidths.w10),
          ),
        ),
      ],
    );
  }
}
