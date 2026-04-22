part of 'favorite_bloc.dart';

sealed class FavoriteEvent {}

class GetFavoriteOffers extends FavoriteEvent {
  final String message;
  final int offerId;

  GetFavoriteOffers({required this.message, required this.offerId});
}

class ToggleFavoriteOfferEvent extends FavoriteEvent {
  final int offerId;
  final String? message;

  ToggleFavoriteOfferEvent({required this.offerId, this.message});
}
