import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafir_mobile/config/dependency_injection.dart';
import 'package:wafir_mobile/features/offers/domain/model/offer_details_model.dart';
import 'package:wafir_mobile/features/offers/domain/use_case/get_offer_details_use_case.dart';
import 'package:wafir_mobile/features/offers/domain/use_case/claim_offer_use_case.dart';
import 'package:wafir_mobile/features/offers/presentation/controller/offer_details_event.dart';
import 'package:wafir_mobile/features/offers/presentation/controller/offer_details_state.dart';

class OfferDetailsBloc extends Bloc<OfferDetailsEvent, OfferDetailsState> {
  final GetOfferDetailsUseCase _getOfferDetailsUseCase;
  final ClaimOfferUseCase _claimOfferUseCase;
  OfferDetailsModel? _currentOfferDetails;

  OfferDetailsModel? get currentOfferDetails => _currentOfferDetails;

  OfferDetailsBloc(this._getOfferDetailsUseCase, this._claimOfferUseCase)
      : super(OfferDetailsInitial()) {
    on<FetchOfferDetailsEvent>(_onFetchOfferDetails);
    on<ClaimOfferEvent>(_onClaimOfferEvent);
  }

  Future<void> _onFetchOfferDetails(
    FetchOfferDetailsEvent event,
    Emitter<OfferDetailsState> emit,
  ) async {
    emit(OfferDetailsLoading());

    final result = await _getOfferDetailsUseCase(event.offerId);

    result.fold(
      (failure) => emit(OfferDetailsError(failure.message)),
      (offerDetails) {
        _currentOfferDetails = offerDetails;
        emit(OfferDetailsLoaded(offerDetails));
      },
    );
  }

  Future<void> _onClaimOfferEvent(
    ClaimOfferEvent event,
    Emitter<OfferDetailsState> emit,
  ) async {
    if (state is OfferClaimLoading) return;

    emit(OfferClaimLoading());

    final result = await _claimOfferUseCase.execute(event.offerId);
    result.fold(
      (failure) => emit(OfferClaimFailure(failure.message)),
      (claim) => emit(OfferClaimSuccess(claim)),
    );
  }

  @override
  Future<void> close() {
    disposeOfferDetails();
    return super.close();
  }
}
