import 'package:wafir_mobile/features/vendors/domain/model/vendor_model.dart';

sealed class VendorDetailsState {
  final String? selectedGovernorate;
  final String? selectedWilaya;
  final String? selectedCategory;
  final VendorModel? vendor;

  VendorDetailsState(
      {this.selectedGovernorate,
      this.selectedWilaya,
      this.selectedCategory,
      this.vendor});

  VendorDetailsState copyWith({
    String? selectedGovernorate,
    String? selectedWilaya,
    String? selectedCategory,
    VendorModel? vendor,
  }) {
    final String? newSelectedGovernorate =
        selectedGovernorate ?? this.selectedGovernorate;
    final String? newSelectedWilaya = selectedWilaya ?? this.selectedWilaya;

    final String? newSelectedCategory =
        selectedCategory ?? this.selectedCategory;
    final VendorModel? newVendor = vendor ?? this.vendor;
    if (this is VendorDetailsInitial) {
      return VendorDetailsInitial(
        selectedGovernorate: newSelectedGovernorate,
        selectedWilaya: newSelectedWilaya,
        selectedCategory: newSelectedCategory,
        vendor: newVendor,
      );
    }

    if (this is VendorDetailsLoading) {
      return VendorDetailsLoading(
        selectedGovernorate: newSelectedGovernorate,
        selectedWilaya: newSelectedWilaya,
        selectedCategory: newSelectedCategory,
        vendor: newVendor,
      );
    }

    if (this is VendorDetailsLoaded) {
      return VendorDetailsLoaded(
        selectedCategory: newSelectedCategory,
        selectedGovernorate: newSelectedGovernorate,
        selectedWilaya: newSelectedWilaya,
        vendor: newVendor,
      );
    }

    if (this is VendorDetailsFailure) {
      final failure = this as VendorDetailsFailure;
      return VendorDetailsFailure(
        selectedCategory: newSelectedCategory,
        message: failure.message,
        selectedGovernorate: newSelectedGovernorate,
        selectedWilaya: newSelectedWilaya,
        vendor: newVendor,
      );
    }

    return this;
  }
}

class VendorDetailsInitial extends VendorDetailsState {
  VendorDetailsInitial({
    super.selectedGovernorate,
    super.selectedWilaya,
    super.selectedCategory,
    super.vendor,
  });
}

class VendorDetailsLoading extends VendorDetailsState {
  VendorDetailsLoading({
    super.selectedGovernorate,
    super.selectedWilaya,
    super.selectedCategory,
    super.vendor,
  });
}

class VendorDetailsLoaded extends VendorDetailsState {
  VendorDetailsLoaded({
    super.selectedGovernorate,
    super.selectedWilaya,
    super.selectedCategory,
    super.vendor,
  });
}

class VendorDetailsFailure extends VendorDetailsState {
  final String message;

  VendorDetailsFailure({
    required this.message,
    super.selectedGovernorate,
    super.selectedWilaya,
    super.selectedCategory,
    super.vendor,
  });
}
