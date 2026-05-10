import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafir_mobile/features/vendors/domain/use_case/get_vendor_details_use_case.dart';
import 'package:wafir_mobile/features/vendors/presentation/controller/vendor_details_state.dart';

part 'vendor_details_event.dart';

class VendorDetailsBloc extends Bloc<VendorDetailsEvent, VendorDetailsState> {
  VendorDetailsBloc(this._useCase) : super(VendorDetailsInitial()) {
    on<GetVendorDetails>(_getVendorDetails);

    on<GovernorateChangedEvent>(_governorateChanged);
    on<WilayaChangedEvent>(_wilayaChanged);
    on<CategoryChangedEvent>(_categoryChangedEvent);
  }

  final GetVendorDetailsUseCase _useCase;
  final TextEditingController search = TextEditingController();

  void _getVendorDetails(GetVendorDetails event, Emitter emit) async {
    emit(VendorDetailsLoading(
      selectedCategory: state.selectedCategory,
      selectedGovernorate: state.selectedGovernorate,
      selectedWilaya: state.selectedWilaya,
    ));
    (await _useCase.execute(GetVendorDetailsUseCaseInput(event.vendorId))).fold(
      (l) => emit(
        VendorDetailsFailure(
          message: l.message,
          selectedCategory: state.selectedCategory,
          selectedGovernorate: state.selectedGovernorate,
          selectedWilaya: state.selectedWilaya,
        ),
      ),
      (r) => emit(
        VendorDetailsLoaded(
          selectedCategory: state.selectedCategory,
          selectedGovernorate: state.selectedGovernorate,
          selectedWilaya: state.selectedWilaya,
          vendor: r,
        ),
      ),
    );
  }

  void _governorateChanged(GovernorateChangedEvent event, Emitter emit) {
    emit(state.copyWith(
      selectedGovernorate: event.governorate,
      selectedWilaya: state.selectedWilaya,
      selectedCategory: state.selectedCategory,
    ));
  }

  void _categoryChangedEvent(CategoryChangedEvent event, Emitter emit) {
    emit(state.copyWith(
      selectedCategory: event.category,
      selectedGovernorate: state.selectedGovernorate,
      selectedWilaya: state.selectedWilaya,
    ));
  }

  void _wilayaChanged(WilayaChangedEvent event, Emitter emit) {
    emit(state.copyWith(
        selectedWilaya: event.wilaya,
        selectedCategory: state.selectedCategory,
        selectedGovernorate: state.selectedGovernorate));
  }

  @override
  Future<void> close() {
    search.dispose();
    return super.close();
  }
}
