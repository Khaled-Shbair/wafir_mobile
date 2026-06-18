import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafir_mobile/core/widgets/custom_search_filter_bottom_sheet.dart';
import 'package:wafir_mobile/features/offers/presentation/controller/offers_bloc.dart';

class CustomFilterBottomSheet extends StatelessWidget {
  const CustomFilterBottomSheet({
    super.key,
    required this.categories,
    this.selectedCategory,
    this.selectedGovernorate,
    this.selectedWilaya,
  });

  final List<String> categories;
  final String? selectedCategory;
  final String? selectedGovernorate;
  final String? selectedWilaya;

  @override
  Widget build(BuildContext context) {
    return CustomSearchFilterBottomSheet(
      categories: categories,
      selectedCategory: selectedCategory,
      selectedGovernorate: selectedGovernorate,
      selectedWilaya: selectedWilaya,
      onApply: (selection) {
        final bloc = context.read<OffersBloc>();

        // ترسل events حتى عند null لتنظيف الفلاتر
        bloc.add(CategoryChangedEvent(selection.category));
        bloc.add(GovernorateChangedEvent(selection.governorate));
        bloc.add(WilayaChangedEvent(selection.wilaya));

        bloc.add(GetAllOffersEvent());
      },
    );
  }
}
