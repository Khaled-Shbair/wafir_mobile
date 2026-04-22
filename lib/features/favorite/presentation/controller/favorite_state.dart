part of 'favorite_bloc.dart';

@immutable
sealed class FavoriteState {}

class FavoriteInitial extends FavoriteState {}

class FavoriteLoading extends FavoriteState {}

class FavoriteLoaded extends FavoriteState {
  final OffersModel favorites;
  final String message;
  final int? toggledOfferId;
  final bool? isFavorited;

  FavoriteLoaded({
    required this.favorites,
    required this.message,
    this.toggledOfferId,
    this.isFavorited,
  });
}

class FavoriteFailure extends FavoriteState {
  final String message;

  FavoriteFailure({required this.message});
}
