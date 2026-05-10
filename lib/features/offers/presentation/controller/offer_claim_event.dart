part of 'offer_claim_bloc.dart';

abstract class OfferClaimEvent {}

class OfferClaimRequested extends OfferClaimEvent {
  final int offerId;

  OfferClaimRequested(this.offerId);
}

