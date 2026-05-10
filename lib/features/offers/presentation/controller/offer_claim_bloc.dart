import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafir_mobile/features/offers/domain/model/offer_claim_model.dart';
import 'package:wafir_mobile/features/offers/domain/use_case/claim_offer_use_case.dart';

part 'offer_claim_event.dart';
part 'offer_claim_state.dart';

class OfferClaimBloc extends Bloc<OfferClaimEvent, OfferClaimState> {
  OfferClaimBloc(this._claimOfferUseCase) : super(OfferClaimInitial()) {
    on<OfferClaimRequested>(_onOfferClaimRequested);
  }

  final ClaimOfferUseCase _claimOfferUseCase;

  void claimOffer(int offerId) {
    add(OfferClaimRequested(offerId));
  }

  Future<void> _onOfferClaimRequested(
    OfferClaimRequested event,
    Emitter<OfferClaimState> emit,
  ) async {
    if (state is OfferClaimLoading) return;

    emit(OfferClaimLoading());

    final result = await _claimOfferUseCase.execute(event.offerId);
    result.fold(
      (failure) => emit(OfferClaimFailure(message: failure.message)),
      (claim) => emit(OfferClaimSuccess(claim: claim)),
    );
  }
}


