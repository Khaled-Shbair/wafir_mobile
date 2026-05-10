part of 'offer_claim_bloc.dart';

sealed class OfferClaimState {}

class OfferClaimInitial extends OfferClaimState {}

class OfferClaimLoading extends OfferClaimState {}

class OfferClaimSuccess extends OfferClaimState {
  final OfferClaimModel claim;

  OfferClaimSuccess({required this.claim});
}

class OfferClaimFailure extends OfferClaimState {
  final String message;

  OfferClaimFailure({required this.message});
}

