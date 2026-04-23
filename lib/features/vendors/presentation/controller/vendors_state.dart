part of 'vendors_bloc.dart';

sealed class VendorsState {
  final String? selectedGovernorate;
  final String? selectedWilaya;
  final String? selectedCategory;
  final int? selectedCategoryId;

  const VendorsState({
    this.selectedGovernorate,
    this.selectedWilaya,
    this.selectedCategory,
    this.selectedCategoryId,
  });

  VendorsState copyWith({
    String? selectedGovernorate,
    String? selectedWilaya,
    String? selectedCategory,
    int? selectedCategoryId,
    bool clearCategoryId = false,
  }) {
    final newSelectedGovernorate =
        selectedGovernorate ?? this.selectedGovernorate;
    final newSelectedWilaya = selectedWilaya ?? this.selectedWilaya;
    final newSelectedCategory = selectedCategory ?? this.selectedCategory;
    final newSelectedCategoryId = clearCategoryId
        ? null
        : (selectedCategoryId ?? this.selectedCategoryId);

    if (this is VendorsInitial) {
      return VendorsInitial(
        selectedCategory: newSelectedCategory,
        selectedCategoryId: newSelectedCategoryId,
        selectedGovernorate: newSelectedGovernorate,
        selectedWilaya: newSelectedWilaya,
      );
    }

    if (this is VendorsLoading) {
      return VendorsLoading(
        selectedCategory: newSelectedCategory,
        selectedCategoryId: newSelectedCategoryId,
        selectedGovernorate: newSelectedGovernorate,
        selectedWilaya: newSelectedWilaya,
      );
    }

    if (this is VendorsLoaded) {
      final loaded = this as VendorsLoaded;
      return VendorsLoaded(
        vendors: loaded.vendors,
        selectedCategory: newSelectedCategory,
        selectedCategoryId: newSelectedCategoryId,
        selectedGovernorate: newSelectedGovernorate,
        selectedWilaya: newSelectedWilaya,
      );
    }

    if (this is VendorsFailure) {
      final failure = this as VendorsFailure;
      return VendorsFailure(
        message: failure.message,
        selectedCategory: newSelectedCategory,
        selectedCategoryId: newSelectedCategoryId,
        selectedGovernorate: newSelectedGovernorate,
        selectedWilaya: newSelectedWilaya,
      );
    }

    return this;
  }
}

class VendorsInitial extends VendorsState {
  const VendorsInitial({
    super.selectedGovernorate,
    super.selectedWilaya,
    super.selectedCategory,
    super.selectedCategoryId,
  });
}

class VendorsLoading extends VendorsState {
  const VendorsLoading({
    super.selectedGovernorate,
    super.selectedWilaya,
    super.selectedCategory,
    super.selectedCategoryId,
  });
}

class VendorsLoaded extends VendorsState {
  final List<VendorPublicItemModel> vendors;

  const VendorsLoaded({
    required this.vendors,
    super.selectedGovernorate,
    super.selectedWilaya,
    super.selectedCategory,
    super.selectedCategoryId,
  });
}

class VendorsFailure extends VendorsState {
  final String message;

  const VendorsFailure({
    required this.message,
    super.selectedGovernorate,
    super.selectedWilaya,
    super.selectedCategory,
    super.selectedCategoryId,
  });
}
