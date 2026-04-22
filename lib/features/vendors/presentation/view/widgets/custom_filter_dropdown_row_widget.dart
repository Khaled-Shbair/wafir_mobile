import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafir_mobile/config/constants/app_constants.dart';
import 'package:wafir_mobile/core/resource/manager_sizes.dart';
import 'package:wafir_mobile/core/resource/manager_strings.dart';
import 'package:wafir_mobile/core/widgets/custom_drop_down_list.dart';
import 'package:wafir_mobile/core/widgets/custom_spacing.dart';
import 'package:wafir_mobile/features/offers/presentation/controller/offers_bloc.dart';

class CustomFilterDropdownRowWidget extends StatelessWidget {
  const CustomFilterDropdownRowWidget({required this.categoryItems, super.key});

  final List<String> categoryItems;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: ManagerHeights.h45,
              child: BlocBuilder<OffersBloc, OffersState>(
                builder: (context, state) {
                  return CustomDropDownList(
                    labelText: ManagerStrings.category,
                    items: categoryItems,
                    selectedItem: state.selectedCategory,
                    onChangedFunction: (value) {
                      if (value != null) {
                        context
                            .read<OffersBloc>()
                            .add(CategoryChangedEvent(value));
                      }
                    },
                  );
                },
              ),
            ),
          ),
          horizontalSpace(ManagerWidths.w10),
          Expanded(
            child: SizedBox(
              height: ManagerHeights.h45,
              child: BlocBuilder<OffersBloc, OffersState>(
                builder: (context, state) {
                  return CustomDropDownList(
                    labelText: ManagerStrings.governorate,
                    items: AppConstants.omanLocations.keys.toList(),
                    selectedItem: state.selectedGovernorate,
                    onChangedFunction: (value) {
                      if (value != null) {
                        context
                            .read<OffersBloc>()
                            .add(GovernorateChangedEvent(value));
                      }
                    },
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: ManagerHeights.h45,
              child: BlocBuilder<OffersBloc, OffersState>(
                builder: (context, state) {
                  final selectedGovernorate = state.selectedGovernorate;
                  final listWilaya = selectedGovernorate == null
                      ? <String>[]
                      : AppConstants.omanLocations[selectedGovernorate] ??
                          <String>[];
                  return CustomDropDownList(
                    labelText: ManagerStrings.wilaya,
                    items: listWilaya,
                    selectedItem: state.selectedWilaya,
                    enabled: selectedGovernorate != null,
                    onChangedFunction: (value) {
                      if (value != null) {
                        context
                            .read<OffersBloc>()
                            .add(WilayaChangedEvent(value));
                      }
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
