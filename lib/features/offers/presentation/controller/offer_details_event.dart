
abstract class OfferDetailsEvent {
  const OfferDetailsEvent();
}

class FetchOfferDetailsEvent extends OfferDetailsEvent {
  final int offerId;

  const FetchOfferDetailsEvent(this.offerId);
}

