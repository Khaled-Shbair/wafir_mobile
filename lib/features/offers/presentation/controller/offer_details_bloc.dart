import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafir_mobile/config/dependency_injection.dart';
import 'package:wafir_mobile/features/offers/domain/use_case/get_offer_details_use_case.dart';
import 'package:wafir_mobile/features/offers/presentation/controller/offer_details_event.dart';
import 'package:wafir_mobile/features/offers/presentation/controller/offer_details_state.dart';

class OfferDetailsBloc extends Bloc<OfferDetailsEvent, OfferDetailsState> {
  final GetOfferDetailsUseCase _getOfferDetailsUseCase;

  OfferDetailsBloc(this._getOfferDetailsUseCase)
      : super(OfferDetailsInitial()) {
    on<FetchOfferDetailsEvent>(_onFetchOfferDetails);
  }

  Future<void> _onFetchOfferDetails(
    FetchOfferDetailsEvent event,
    Emitter<OfferDetailsState> emit,
  ) async {
    emit(OfferDetailsLoading());

    final result = await _getOfferDetailsUseCase(event.offerId);

    result.fold(
      (failure) => emit(OfferDetailsError(failure.message)),
      (offerDetails) => emit(OfferDetailsLoaded(offerDetails)),
    );
  }

  @override
  Future<void> close() {
    disposeOfferDetails();
    return super.close();
  }
}
