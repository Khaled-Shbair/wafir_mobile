part of 'offers_bloc.dart';

sealed class OffersState {
  final String? selectedGovernorate;
  final String? selectedWilaya;
  final String? selectedCategory;
  final String? selectedDiscount;
  final String? selectedSort;
  final int? selectedVendorId;

  OffersState(
      {this.selectedGovernorate,
      this.selectedWilaya,
      this.selectedCategory,
      this.selectedDiscount,
      this.selectedSort,
      this.selectedVendorId});

  OffersState copyWith({
    Object? selectedGovernorate = #unset,
    Object? selectedWilaya = #unset,
    Object? selectedCategory = #unset,
    Object? selectedDiscount = #unset,
    Object? selectedSort = #unset,
    int? selectedVendorId,

  }) {
    final String? newSelectedGovernorate =
        identical(selectedGovernorate, #unset) ? this.selectedGovernorate : selectedGovernorate as String?;
    final String? newSelectedWilaya =
        identical(selectedWilaya, #unset) ? this.selectedWilaya : selectedWilaya as String?;
    final String? newSelectedCategory =
        identical(selectedCategory, #unset) ? this.selectedCategory : selectedCategory as String?;
    final String? newSelectedDiscount =
        identical(selectedDiscount, #unset) ? this.selectedDiscount : selectedDiscount as String?;
    final String? newSelectedSort =
        identical(selectedSort, #unset) ? this.selectedSort : selectedSort as String?;
    final int? newSelectedVendorId = selectedVendorId ?? this.selectedVendorId;
    if (this is OffersInitial) {
      return OffersInitial(
        selectedGovernorate: newSelectedGovernorate,
        selectedWilaya: newSelectedWilaya,
        selectedCategory: newSelectedCategory,
        selectedDiscount: newSelectedDiscount,
        selectedSort: newSelectedSort,
        selectedVendorId: newSelectedVendorId,
      );
    }

    if (this is OffersLoading) {
      return OffersLoading(
        selectedGovernorate: newSelectedGovernorate,
        selectedWilaya: newSelectedWilaya,
        selectedCategory: newSelectedCategory,
        selectedDiscount: newSelectedDiscount,
        selectedSort: newSelectedSort,
        selectedVendorId: newSelectedVendorId,
      );
    }

    if (this is OffersLoadedSuccessfully) {
      final loadedSuccess = this as OffersLoadedSuccessfully;

      return OffersLoadedSuccessfully(
        offers: loadedSuccess.offers,
        selectedCategory: newSelectedCategory,
        selectedGovernorate: newSelectedGovernorate,
        selectedWilaya: newSelectedWilaya,
        selectedDiscount: newSelectedDiscount,
        selectedSort: newSelectedSort,
        selectedVendorId: newSelectedVendorId,
        currentPage: loadedSuccess.currentPage,
        totalPages: loadedSuccess.totalPages,
      );
    }

    if (this is OffersFailure) {
      final failure = this as OffersFailure;
      return OffersFailure(
        selectedCategory: newSelectedCategory,
        message: failure.message,
        selectedGovernorate: newSelectedGovernorate,
        selectedWilaya: newSelectedWilaya,
        selectedDiscount: newSelectedDiscount,
        selectedSort: newSelectedSort,
        selectedVendorId: newSelectedVendorId,
      );
    }

    return this;
  }
}

class OffersInitial extends OffersState {
  OffersInitial(
      {super.selectedGovernorate,
      super.selectedWilaya,
      super.selectedCategory,
      super.selectedDiscount,
      super.selectedSort,
      super.selectedVendorId});
}

class OffersLoading extends OffersState {
  OffersLoading(
      {super.selectedGovernorate,
      super.selectedWilaya,
      super.selectedCategory,
      super.selectedDiscount,
      super.selectedSort,
      super.selectedVendorId});
}

class OffersLoadedSuccessfully extends OffersState {
  final List<OfferItemModel> offers;
  final int currentPage;
  final int totalPages;

  OffersLoadedSuccessfully(
      {required this.offers,
      this.currentPage = 1,
      this.totalPages = 1,
      super.selectedGovernorate,
      super.selectedWilaya,
      super.selectedCategory,
      super.selectedDiscount,
      super.selectedSort,
      super.selectedVendorId});
}

class OffersLoadingMore extends OffersState {
  final List<OfferItemModel> offers;
  final int currentPage;
  final int totalPages;

  OffersLoadingMore(
      {required this.offers,
      this.currentPage = 1,
      this.totalPages = 1,
      super.selectedGovernorate,
      super.selectedWilaya,
      super.selectedCategory,
      super.selectedDiscount,
      super.selectedSort,
      super.selectedVendorId});
}

class OffersFailure extends OffersState {
  final String message;

  OffersFailure(
      {required this.message,
      super.selectedGovernorate,
      super.selectedWilaya,
      super.selectedCategory,
      super.selectedDiscount,
      super.selectedSort,
      super.selectedVendorId});
}
