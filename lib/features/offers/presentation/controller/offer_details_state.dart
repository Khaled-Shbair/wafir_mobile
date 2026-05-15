import 'package:wafir_mobile/features/offers/domain/model/offer_details_model.dart';
import 'package:wafir_mobile/features/offers/domain/model/offer_claim_model.dart';

abstract class OfferDetailsState {}

class OfferDetailsInitial extends OfferDetailsState {}

class OfferDetailsLoading extends OfferDetailsState {}

class OfferDetailsLoaded extends OfferDetailsState {
  final OfferDetailsModel offerDetails;

  OfferDetailsLoaded(this.offerDetails);
}

class OfferDetailsError extends OfferDetailsState {
  final String message;

  OfferDetailsError(this.message);
}

// Claim-related states (moved into OfferDetailsBloc)
class OfferClaimLoading extends OfferDetailsState {}

class OfferClaimSuccess extends OfferDetailsState {
  final OfferClaimModel claim;

  OfferClaimSuccess(this.claim);
}

class OfferClaimFailure extends OfferDetailsState {
  final String message;

  OfferClaimFailure(this.message);
}

