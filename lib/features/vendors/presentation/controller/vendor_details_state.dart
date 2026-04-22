part of 'vendor_details_bloc.dart';

sealed class VendorDetailsState {
  final String? selectedGovernorate;
  final String? selectedWilaya;
  final String? selectedCategory;

  VendorDetailsState(
      {this.selectedGovernorate, this.selectedWilaya, this.selectedCategory});

  VendorDetailsState copyWith({
    String? selectedGovernorate,
    String? selectedWilaya,
    String? selectedCategory,
  }) {
    final String? newSelectedGovernorate =
        selectedGovernorate ?? this.selectedGovernorate;
    final String? newSelectedWilaya = selectedWilaya ?? this.selectedWilaya;

    final String? newSelectedCategory =
        selectedCategory ?? this.selectedCategory;
    if (this is VendorDetailsInitial) {
      return VendorDetailsInitial(
        selectedGovernorate: newSelectedGovernorate,
        selectedWilaya: newSelectedWilaya,
        selectedCategory: newSelectedCategory,
      );
    }

    if (this is VendorDetailsInitial) {
      return VendorDetailsLoading(
        selectedGovernorate: newSelectedGovernorate,
        selectedWilaya: newSelectedWilaya,
        selectedCategory: newSelectedCategory,
      );
    }

    if (this is VendorDetailsLoaded) {
      // final vendorDetails = this as VendorDetailsLoaded;
      return VendorDetailsLoaded(
        selectedCategory: newSelectedCategory,
        selectedGovernorate: newSelectedGovernorate,
        selectedWilaya: newSelectedWilaya,
      );
    }

    if (this is VendorDetailsFailure) {
      final failure = this as VendorDetailsFailure;
      return VendorDetailsFailure(
        selectedCategory: newSelectedCategory,
        message: failure.message,
        selectedGovernorate: newSelectedGovernorate,
        selectedWilaya: newSelectedWilaya,
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
  });
}

class VendorDetailsLoading extends VendorDetailsState {
  VendorDetailsLoading({
    super.selectedGovernorate,
    super.selectedWilaya,
    super.selectedCategory,
  });
}

class VendorDetailsLoaded extends VendorDetailsState {
  VendorDetailsLoaded({
    super.selectedGovernorate,
    super.selectedWilaya,
    super.selectedCategory,
  });
}

class VendorDetailsFailure extends VendorDetailsState {
  final String message;

  VendorDetailsFailure({
    required this.message,
    super.selectedGovernorate,
    super.selectedWilaya,
    super.selectedCategory,
  });
}
