import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafir_mobile/config/dependency_injection.dart';
import 'package:wafir_mobile/features/vendors/domain/model/vendors_public_model.dart';
import 'package:wafir_mobile/features/vendors/domain/use_case/get_public_vendors_use_case.dart';

part 'vendors_event.dart';
part 'vendors_state.dart';

class VendorsBloc extends Bloc<VendorsEvent, VendorsState> {
  VendorsBloc(this._getPublicVendorsUseCase) : super(VendorsInitial()) {
    on<GetPublicVendorsEvent>(_onGetPublicVendors);
  }

  final GetPublicVendorsUseCase _getPublicVendorsUseCase;

  Future<void> _onGetPublicVendors(
    GetPublicVendorsEvent event,
    Emitter<VendorsState> emit,
  ) async {
    emit(VendorsLoading());
    (await _getPublicVendorsUseCase.execute()).fold(
      (l) => emit(VendorsFailure(message: l.message)),
      (r) => emit(VendorsLoaded(vendors: r.items)),
    );
  }

  @override
  Future<void> close() {
    disposePublicVendors();
    return super.close();
  }
}
