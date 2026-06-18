import 'package:flutter/material.dart';
import 'package:wafir_mobile/core/widgets/custom_search_filter_bottom_sheet.dart';

class CustomFilterBottomSheet extends StatelessWidget {
  const CustomFilterBottomSheet({
    super.key,
    required this.categories,
    this.selectedCategory,
    this.selectedGovernorate,
    this.selectedWilaya,
    required this.onApply,
  });

  final List<String> categories;
  final String? selectedCategory;
  final String? selectedGovernorate;
  final String? selectedWilaya;
  final void Function(FilterSelectionResult) onApply;

  @override
  Widget build(BuildContext context) {
    return CustomSearchFilterBottomSheet(
      categories: categories,
      selectedCategory: selectedCategory,
      selectedGovernorate: selectedGovernorate,
      selectedWilaya: selectedWilaya,
      onApply: onApply,
    );
  }
}
