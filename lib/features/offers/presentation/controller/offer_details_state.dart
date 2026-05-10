import 'package:wafir_mobile/features/offers/domain/model/offer_details_model.dart';

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
