import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafir_mobile/config/dependency_injection.dart';
import 'package:wafir_mobile/features/vendors/domain/model/vendors_public_model.dart';
import 'package:wafir_mobile/features/vendors/domain/use_case/get_public_vendors_use_case.dart';

part 'vendors_event.dart';

part 'vendors_state.dart';

class VendorsBloc extends Bloc<VendorsEvent, VendorsState> {
  VendorsBloc(this._getPublicVendorsUseCase) : super(const VendorsInitial()) {
    on<GetPublicVendorsEvent>(_onGetPublicVendors);
    on<SearchVendorsEvent>(_onSearchVendors);
    on<ApplyInitialCategoryFilterEvent>(_onApplyInitialCategoryFilter);
    on<GovernorateChangedVendorsEvent>(_governorateChanged);
    on<WilayaChangedVendorsEvent>(_wilayaChanged);
    on<CategoryChangedVendorsEvent>(_categoryChanged);

    search.addListener(_onSearchTextChanged);
  }

  final TextEditingController search = TextEditingController();
  final GetPublicVendorsUseCase _getPublicVendorsUseCase;

  final List<VendorPublicItemModel> _allVendors = [];
  Timer? _debounceTimer;

  void _onSearchTextChanged() {
    _debounceTimer?.cancel();
    if (search.text.isEmpty) {
      _debounceTimer = Timer(const Duration(milliseconds: 300), () {
        add(SearchVendorsEvent());
      });
    }
  }

  void _onApplyInitialCategoryFilter(
    ApplyInitialCategoryFilterEvent event,
    Emitter<VendorsState> emit,
  ) {
    emit(state.copyWith(
      selectedCategoryId: event.categoryId,
      selectedCategory: event.categoryName,
      selectedGovernorate: state.selectedGovernorate,
      selectedWilaya: state.selectedWilaya,
    ));
  }

  void _governorateChanged(
    GovernorateChangedVendorsEvent event,
    Emitter<VendorsState> emit,
  ) {
    emit(state.copyWith(
      selectedGovernorate: event.governorate,
      selectedWilaya: event.governorate == null ? null : state.selectedWilaya,
      selectedCategory: state.selectedCategory,
      selectedCategoryId: state.selectedCategoryId,
    ));
  }

  void _wilayaChanged(
    WilayaChangedVendorsEvent event,
    Emitter<VendorsState> emit,
  ) {
    emit(state.copyWith(
      selectedWilaya: event.wilaya,
      selectedCategory: state.selectedCategory,
      selectedCategoryId: state.selectedCategoryId,
      selectedGovernorate: state.selectedGovernorate,
    ));
  }

  void _categoryChanged(
    CategoryChangedVendorsEvent event,
    Emitter<VendorsState> emit,
  ) {
    emit(state.copyWith(
      selectedCategory: event.category,
      clearCategoryId: true,
      selectedGovernorate: state.selectedGovernorate,
      selectedWilaya: state.selectedWilaya,
    ));
  }

  Future<void> _onGetPublicVendors(
    GetPublicVendorsEvent event,
    Emitter<VendorsState> emit,
  ) async {
    if (_allVendors.isEmpty) {
      emit(VendorsLoading(
        selectedCategory: state.selectedCategory,
        selectedCategoryId: state.selectedCategoryId,
        selectedGovernorate: state.selectedGovernorate,
        selectedWilaya: state.selectedWilaya,
      ));

      (await _getPublicVendorsUseCase.execute(
        GetAllVendorsInput(
          page: 1,
          searchQuery: event.searchQuery,
        ),
      ))
          .fold(
        (l) => emit(VendorsFailure(
          message: l.message,
          selectedCategory: state.selectedCategory,
          selectedCategoryId: state.selectedCategoryId,
          selectedGovernorate: state.selectedGovernorate,
          selectedWilaya: state.selectedWilaya,
        )),
        (r) {
          _allVendors.clear();
          _allVendors.addAll(r.items);
          _emitFilteredVendors(emit);
        },
      );
      return;
    }

    _emitFilteredVendors(emit);
  }

  void _onSearchVendors(SearchVendorsEvent event, Emitter<VendorsState> emit) {
    _emitFilteredVendors(emit);
  }

  void _emitFilteredVendors(Emitter<VendorsState> emit) {
    final query = search.text.trim().toLowerCase();
    final selectedCategory = state.selectedCategory;
    final selectedCategoryId = state.selectedCategoryId;
    final selectedGovernorate = state.selectedGovernorate;
    final selectedWilaya = state.selectedWilaya;

    final hasCategoryFilter = selectedCategoryId != null ||
        (selectedCategory != null &&
            selectedCategory.isNotEmpty &&
            selectedCategory != 'الكل');

    final filtered = _allVendors.where((vendor) {
      final mainBranch = _primaryBranch(vendor.branches);

      final matchesCategory = !hasCategoryFilter ||
          (selectedCategoryId != null
              ? vendor.sectorId == selectedCategoryId
              : vendor.sectorName == selectedCategory);

      final matchesGovernorate = selectedGovernorate == null ||
          selectedGovernorate.isEmpty ||
          mainBranch == null ||
          mainBranch.governorate == selectedGovernorate;

      final matchesWilaya = selectedWilaya == null ||
          selectedWilaya.isEmpty ||
          mainBranch == null ||
          mainBranch.wilaya == selectedWilaya;

      final matchesQuery = query.isEmpty ||
          vendor.businessName.toLowerCase().contains(query) ||
          vendor.sectorName.toLowerCase().contains(query) ||
          (mainBranch?.name.toLowerCase().contains(query) ?? false) ||
          (mainBranch?.governorate.toLowerCase().contains(query) ?? false) ||
          (mainBranch?.wilaya.toLowerCase().contains(query) ?? false) ||
          (mainBranch?.address.toLowerCase().contains(query) ?? false);

      return matchesCategory &&
          matchesGovernorate &&
          matchesWilaya &&
          matchesQuery;
    }).toList();

    emit(VendorsLoaded(
      vendors: filtered,
      selectedCategory: selectedCategory,
      selectedCategoryId: selectedCategoryId,
      selectedGovernorate: selectedGovernorate,
      selectedWilaya: selectedWilaya,
    ));
  }

  VendorPublicBranchModel? _primaryBranch(
    List<VendorPublicBranchModel> branches,
  ) {
    if (branches.isEmpty) return null;
    return branches.firstWhere(
      (branch) => branch.isMain,
      orElse: () => branches.first,
    );
  }

  @override
  Future<void> close() {
    _debounceTimer?.cancel();
    search.removeListener(_onSearchTextChanged);
    search.dispose();
    disposePublicVendors();
    return super.close();
  }
}
