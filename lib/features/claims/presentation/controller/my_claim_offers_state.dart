part of 'my_claim_offers_bloc.dart';

sealed class MyClaimOffersState {}

final class MyClaimOffersInitial extends MyClaimOffersState {}

final class MyClaimOffersLoading extends MyClaimOffersState {}

final class MyClaimOffersFailed extends MyClaimOffersState {
  final String message;

  MyClaimOffersFailed(this.message);
}

final class MyClaimOffersSuccessfully extends MyClaimOffersState {
  final List<ClaimOfferModel> offers;

  MyClaimOffersSuccessfully(this.offers);
}
