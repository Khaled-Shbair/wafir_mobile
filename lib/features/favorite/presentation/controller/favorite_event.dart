part of 'favorite_bloc.dart';

sealed class FavoriteEvent {}

class GetFavoriteOffers extends FavoriteEvent {}

class ToggleFavoriteOfferEvent extends FavoriteEvent {
  final int offerId;

  ToggleFavoriteOfferEvent({required this.offerId});
}
