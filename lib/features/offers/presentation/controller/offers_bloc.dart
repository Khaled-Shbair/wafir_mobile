import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';
import 'package:wafir_mobile/config/dependency_injection.dart';
import 'package:wafir_mobile/core/model/offers_model.dart';
import 'package:wafir_mobile/features/offers/domain/use_case/get_all_offers_use_case.dart';

part 'offers_event.dart';

part 'offers_state.dart';

class OffersBloc extends Bloc<OffersEvent, OffersState> {
  OffersBloc(this._getAllOffersUseCase) : super(OffersInitial()) {
    on<GetAllOffersEvent>(_onGetAllOffers);
    on<LoadMoreOffersEvent>(_onLoadMoreOffers);
    on<GovernorateChangedEvent>(_governorateChanged);
    on<WilayaChangedEvent>(_wilayaChanged);
    on<CategoryChangedEvent>(_categoryChangedEvent);

    // الاستماع لأي تغيير في حقل البحث
    search.addListener(_onSearchTextChanged);
  }

  final TextEditingController search = TextEditingController();
  final GetAllOffersUseCase _getAllOffersUseCase;
  int _currentPage = 1;
  bool _isLoadingMore = false;
  int _totalCount = 0;

  /// يتم استدعاؤه عند تغيير نص البحث
  void _onSearchTextChanged() {
    // إلغاء التايمر السابق

    // عندما يمسح المستخدم الكلمة (البحث يصبح فارغاً)
    if (search.text.isEmpty) {
      add(GetAllOffersEvent());
    }
  }

  void _governorateChanged(GovernorateChangedEvent event, Emitter emit) {
    _currentPage = 1;
    emit(state.copyWith(
      selectedGovernorate: event.governorate,
      selectedWilaya: state.selectedWilaya,
      selectedCategory: state.selectedCategory,
    ));
  }

  void _categoryChangedEvent(CategoryChangedEvent event, Emitter emit) {
    _currentPage = 1;
    emit(state.copyWith(
      selectedCategory: event.category,
      selectedGovernorate: state.selectedGovernorate,
      selectedWilaya: state.selectedWilaya,
    ));
  }

  void _wilayaChanged(WilayaChangedEvent event, Emitter emit) {
    _currentPage = 1;
    emit(state.copyWith(
        selectedWilaya: event.wilaya,
        selectedCategory: state.selectedCategory,
        selectedGovernorate: state.selectedGovernorate));
  }
  String? _normalizedCategory() {
    final category = state.selectedCategory?.trim();
    if (category == null || category.isEmpty || category == 'الكل') {
      return null;
    }
    return category;
  }
  Future<void> _onGetAllOffers(
      GetAllOffersEvent event, Emitter<OffersState> emit) async {
    _isLoadingMore = false;
    _totalCount = 0;
    print('Fetching offers with selectedCategory: ${state.selectedCategory}');
    print('Fetching offers with selectedWilaya: ${state.selectedWilaya}');
    print('Fetching offers with selectedGovernorate: ${state.selectedGovernorate}');
    emit(OffersLoading(
      selectedGovernorate: state.selectedGovernorate,
      selectedWilaya: state.selectedWilaya,
      selectedCategory: state.selectedCategory,
      selectedDiscount: state.selectedDiscount,
      selectedSort: state.selectedSort,
      selectedVendorId: state.selectedVendorId,
    ));
    (await _getAllOffersUseCase.execute(
      GetAllOffersInput(
        page: _currentPage,
        take: 20,
        q: search.text.isNotEmpty ? search.text : null,
        sector: _normalizedCategory(),
        city: state.selectedWilaya,
        discount: state.selectedDiscount,
        sort: state.selectedSort,
        vendorId: state.selectedVendorId,
      ),
    ))
        .fold(
      (l) {
        emit(OffersFailure(
          message: l.message,
          selectedCategory: state.selectedCategory,
          selectedGovernorate: state.selectedGovernorate,
          selectedWilaya: state.selectedWilaya,
          selectedDiscount: state.selectedDiscount,
          selectedSort: state.selectedSort,
          selectedVendorId: state.selectedVendorId,
        ));
      },
      (r) {
        _totalCount = r.totalCount;
        emit(OffersLoadedSuccessfully(
          offers: r.items,
          currentPage: _currentPage,
          totalPages: 1,
          selectedCategory: state.selectedCategory,
          selectedGovernorate: state.selectedGovernorate,
          selectedWilaya: state.selectedWilaya,
          selectedDiscount: state.selectedDiscount,
          selectedSort: state.selectedSort,
          selectedVendorId: state.selectedVendorId,
        ));
      },
    );
  }

  Future<void> _onLoadMoreOffers(
      LoadMoreOffersEvent event, Emitter<OffersState> emit) async {
    if (state is! OffersLoadedSuccessfully) return;

    // منع الطلبات المتكررة
    if (_isLoadingMore) return;

    final currentState = state as OffersLoadedSuccessfully;

    // إذا وصلنا إلى عدد المنتجات الكلي، توقف التحميل
    if (currentState.offers.length >= _totalCount) {
      return;
    }

    _isLoadingMore = true;
    final nextPage = currentState.currentPage + 1;

    emit(OffersLoadingMore(
      offers: currentState.offers,
      currentPage: nextPage,
      totalPages: currentState.totalPages,
      selectedCategory: state.selectedCategory,
      selectedGovernorate: state.selectedGovernorate,
      selectedWilaya: state.selectedWilaya,
      selectedDiscount: state.selectedDiscount,
      selectedSort: state.selectedSort,
      selectedVendorId: state.selectedVendorId,
    ));

    (await _getAllOffersUseCase.execute(
      GetAllOffersInput(
        page: nextPage,
        take: 10,
        q: search.text.isNotEmpty ? search.text : null,
        sector: state.selectedCategory,
        city: state.selectedWilaya,
        discount: state.selectedDiscount,
        sort: state.selectedSort,
        vendorId: state.selectedVendorId,
      ),
    ))
        .fold(
      (l) {
        _isLoadingMore = false;
        emit(OffersLoadedSuccessfully(
          offers: currentState.offers,
          currentPage: currentState.currentPage,
          totalPages: currentState.totalPages,
          selectedCategory: state.selectedCategory,
          selectedGovernorate: state.selectedGovernorate,
          selectedWilaya: state.selectedWilaya,
          selectedDiscount: state.selectedDiscount,
          selectedSort: state.selectedSort,
          selectedVendorId: state.selectedVendorId,
        ));
      },
      (r) {
        _isLoadingMore = false;

        // تصفية البيانات المكررة
        final newOffers = r.items
            .where((newItem) => !currentState.offers
                .any((existingItem) => existingItem.id == newItem.id))
            .toList();

        // إذا لم تكن هناك بيانات جديدة، توقف التحميل
        if (newOffers.isEmpty) {
          emit(OffersLoadedSuccessfully(
            offers: currentState.offers,
            currentPage: currentState.currentPage,
            totalPages: currentState.currentPage,
            selectedCategory: state.selectedCategory,
            selectedGovernorate: state.selectedGovernorate,
            selectedWilaya: state.selectedWilaya,
            selectedDiscount: state.selectedDiscount,
            selectedSort: state.selectedSort,
            selectedVendorId: state.selectedVendorId,
          ));

          return;
        }

        final allOffers = [...currentState.offers, ...newOffers];
        emit(OffersLoadedSuccessfully(
          offers: allOffers,
          currentPage: nextPage,
          totalPages: currentState.totalPages,
          selectedCategory: state.selectedCategory,
          selectedGovernorate: state.selectedGovernorate,
          selectedWilaya: state.selectedWilaya,
          selectedDiscount: state.selectedDiscount,
          selectedSort: state.selectedSort,
          selectedVendorId: state.selectedVendorId,
        ));
      },
    );
  }

  @override
  Future<void> close() {
    search.removeListener(_onSearchTextChanged);
    disposeOffers();
    search.dispose();
    return super.close();
  }
}
