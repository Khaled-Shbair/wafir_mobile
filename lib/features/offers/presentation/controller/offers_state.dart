part of 'offers_bloc.dart';

sealed class OffersState {
  final String? selectedGovernorate;
  final String? selectedWilaya;
  final String? selectedCategory;

  OffersState(
      {this.selectedGovernorate, this.selectedWilaya, this.selectedCategory});

  OffersState copyWith({
    String? selectedGovernorate,
    String? selectedWilaya,
    String? selectedCategory,
  }) {
    final String? newSelectedGovernorate =
        selectedGovernorate ?? this.selectedGovernorate;
    final String? newSelectedWilaya = selectedWilaya ?? this.selectedWilaya;

    final String? newSelectedCategory =
        selectedCategory ?? this.selectedCategory;
    if (this is OffersInitial) {
      return OffersInitial(
        selectedGovernorate: newSelectedGovernorate,
        selectedWilaya: newSelectedWilaya,
        selectedCategory: newSelectedCategory,
      );
    }

    if (this is OffersLoading) {
      return OffersLoading(
        selectedGovernorate: newSelectedGovernorate,
        selectedWilaya: newSelectedWilaya,
        selectedCategory: newSelectedCategory,
      );
    }

    if (this is OffersLoadedSuccessfully) {
      final loadedSuccess = this as OffersLoadedSuccessfully;

      return OffersLoadedSuccessfully(
        offers: loadedSuccess.offers,
        selectedCategory: newSelectedCategory,
        selectedGovernorate: newSelectedGovernorate,
        selectedWilaya: newSelectedWilaya,
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
      );
    }

    return this;
  }
}

class OffersInitial extends OffersState {
  OffersInitial(
      {super.selectedGovernorate,
      super.selectedWilaya,
      super.selectedCategory});
}

class OffersLoading extends OffersState {
  OffersLoading(
      {super.selectedGovernorate,
      super.selectedWilaya,
      super.selectedCategory});
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
      super.selectedCategory});
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
      super.selectedCategory});
}

class OffersFailure extends OffersState {
  final String message;

  OffersFailure(
      {required this.message,
      super.selectedGovernorate,
      super.selectedWilaya,
      super.selectedCategory});
}
